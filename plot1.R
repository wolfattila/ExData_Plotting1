Sys.setlocale(category = "LC_ALL", locale = "C")
header<- colnames(read.table("household_power_consumption.txt",sep=";", nrows=1, skip=0, na.strings="?", header=TRUE))
data<- read.table("household_power_consumption.txt",sep=";", nrows=5000, skip=65000, na.strings="?", header=TRUE, col.names = header)
data2<- data[as.Date(data[,"Date"], "%d/%m/%Y")>="2007-02-01" & as.Date(data[,"Date"], "%d/%m/%Y")<="2007-02-02" & !is.na(data[[3]]),c(1,3)]
png(filename="plot1.png", width=480, height=480)
hist(data2[[2]], xlab = "Global Active Power (kilowatts)", col="RED", main="Global Active Power")
dev.off(dev.cur())
