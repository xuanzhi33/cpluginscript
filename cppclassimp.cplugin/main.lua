
function main(text)
	-- edit here
	t = {}
	local pattern = string.format("([^%s]+)", "::")
	text:gsub(pattern, function(c) t[#t+1] = c end)

	local class = t[#t]
	table.remove(t, #t)
	local head = ""
	local body = [[

<##>::<##>() {

}

<##>::~<##>() {

}



]]
	local tail = ""
	if t[1] then
		for i,v in ipairs(t) do
			head = head .. "namespace "	.. v .. " {\n"
			tail = "}///" .. v .. "\n" .. tail
		end
	end
	local imp = head .. body .. tail

	return imp:gsub("<##>", class)
end
