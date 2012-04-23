fs = require 'fs'
File = require 'file'

module.exports =
class Directory
  constructor: (@path) ->

  getName: ->
    fs.base(@path) + '/'

  getEntries: ->
    directories = []
    files = []
    for path in fs.list(@path)
      if fs.isDirectory(path)
        directories.push(new Directory(path))
      else
        files.push(new File(path))
    directories.concat(files)

