library(argparser)

##### argument parser function #####
p <- arg_parser("input and output")
p <- add_argument(p, "--input", help = "input file")
p <- add_argument(p, "--output", help = "output file", default = "output.csv")

argv <- parse_args(p, commandArgs(trailingOnly = TRUE))

##### Main #####

df <- read.csv(argv$input, header = TRUE)
output_df <- data.frame(list(set="",weight="",height=""), stringsAsFactors = FALSE,row.names = 1)
last_slash <- strsplit(argv$input, split = ".*/")[1][2]
output_df$set[1] <- gsub(".csv","",last_slash)
output_df$weight[1] <- round(max(df$weight),2)
output_df$height[1] <- round(max(df$height),2)
print(output_df)
write.csv(output_df, file = argv$output, fileEncoding = "UTF-8",row.names = F,quote= FALSE)

