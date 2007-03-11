Received: from [81.255.54.11] (helo=mx.laposte.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <c.romain@laposte.net>) id 1HQPVj-0006oS-3r
	for openembedded-devel@lists.openembedded.org;
	Sun, 11 Mar 2007 15:58:59 +0100
Received: from smtp.laposte.net (10.150.9.42) by mx.laposte.net (7.2.060.1)
	id 45C9AC06015D60A8; Sun, 11 Mar 2007 15:58:40 +0100
Received: from smtpin.laposte.net (10.150.9.74) by smtp.laposte.net (7.3.118.3)
	id 45E7E57000FCB2FE; Sun, 11 Mar 2007 15:58:40 +0100
Received: from [192.168.2.2] (83.193.135.47) by smtpin.laposte.net (7.2.060.1)
	(authenticated as c.romain)
	id 45E5A8AE0011580F; Sun, 11 Mar 2007 15:58:40 +0100
Message-ID: <45F41940.7070407@laposte.net>
Date: Sun, 11 Mar 2007 15:59:12 +0100
From: cyril Romain <c.romain@laposte.net>
User-Agent: Thunderbird 1.5.0.10 (X11/20070303)
MIME-Version: 1.0
To: papercrane@reversefold.com
References: <432beae0605272223y4eeb385eib0ea22eb136aeff8@mail.gmail.com>
	<432beae0606101112s21729552odecce94034ad9d6@mail.gmail.com>
In-Reply-To: <432beae0606101112s21729552odecce94034ad9d6@mail.gmail.com>
Cc: oe <oe@handhelds.org>, monotone <monotone-devel@nongnu.org>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: mtnpatch (updated)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 11 Mar 2007 14:58:59 -0000
Content-Type: multipart/mixed; boundary="------------040807030501080609010805"

--------------040807030501080609010805
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Justin Patrin wrote:
> Just thought I'd let everyone know that I just cherrypicked my first
> revision with mtnpatch.py. I made some efl/e17 updates to .dev and
> edited one file, made a diff, and applied the diff to .oz354x with
> mtnpatch.py. It worked like a charm.
>
> For those that missed it, I have checked in mtnpatch.py into
> org.openembedded.dev in contrib/. I have also switch to using a regex
> instead of split() so that whitespace in filenames should be correctly
> taken care of.
>
> The script is used like this:
>  mtn diff -r ParentRev -r RevToCherryPick > file.patch
>  cd /branch/to/cherrypick/to
>  contrib/mtnpatch.py file.patch
> Look at the output to make sure it's sane
>  contrib/mtnpatch.py file.patch | sh
>  mtn ci
Maybe I've just missed the right mtn command reading the documentation, 
but as I'm submitting some patches/recipes for OE metadata, I'd like to:
 1. test that my 'mtn diff' patches successfully apply on a up-to-date 
metadata tree without any local modifications.
 2. apply some patches to another development tree.

And this script is "almost" what I'm looking for :)
"Almost" because it does not takes file/directory drop order into 
account, i.e. "mtnpatch.py the.patch | sh" can fail.
For example if mtnpatch dumps:
---
mtn drop -e packages/quilt/files/install.patch
mtn drop -e packages/quilt/files
---
And if you run these commands in that order, you get "mtn: misuse: 
cannot remove packages/quilt/files/, it is not empty"

In attachment, an updated version of mtnpatch.py with the following 
improvements:
 1. output command are sorted, so that 'mtnpatch.py my_patch.patch | sh' 
should now succeed in all cases, hopefully :)
 2. help (-h, --help) option added, and usage message is printed on misuse
 3. reverse mode (-R option) can be also set with --reverse
 4. the reverse option is used to unapply the patch. The dropped files 
are reverted (not added), but maybe it is not what you, Justin, wanted 
to do with -R ?


Best regards,

  cyril


--------------040807030501080609010805
Content-Type: text/x-python;
 name="mtnpatch.py"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="mtnpatch.py"

#!/usr/bin/env python

"""
mtnpatch is a patch tool intended to apply 'mtn diff' patch, including the 
additional cset operations (e.g. add, drop and rename) listed in mtn diff comments.

mtnpatch does not actually apply the patch. It only dumps the list of commands to enter
to actually apply the patch.
To apply the patch, use 'mtnpatch.py file.patch | sh'
"""

import sys, os, string, getopt, re

mtncmd = "mtn"


def usage():
    print "Usage: mtnpatch.py [options] file.patch"
    print "Options:"
    print "  -h  --help         display help message"
    print "  -R  --reverse      apply patch in reverse"
    print "\nTo actually apply the patch, use 'mtnpatch.py file.patch | sh'"

def main(argv = None):
    if argv is None:
        argv = sys.argv
    try:
        opts, list = getopt.getopt(sys.argv[1:], 'h:R', ["--help", "--reverse"])
    except:
        usage()
        sys.exit(2)
    reverse = False
    for o, a in opts:
        if o in ("-h", "--help"):
            usage()
            sys.exit(1)
        if o in ("-R", "--reverse"):
            reverse = True
    if len(list) != 1:
        usage()
        sys.exit(1)
    if os.path.exists(list[0]):
        input = open(list[0], 'r')
        renameFrom = ""
        cmd = ""
        addedFiles = []
        addedDirs = []
        droppedFiles = []
        droppedDirs = []
        renamedFiles = []
        for line in input:
            if len(line) > 0:
                if line[0] == '#':
                    matches = re.search("#\s+(\w+)\s+\"(.*)\"", line)
                    if matches is not None:
                        cmd = matches.group(1)
                        fileName = matches.group(2)
                        isDir = os.path.isdir(fileName)
                        if cmd == "delete":
                            if isDir: droppedDirs.append(fileName)
                            else: droppedFiles.append(fileName)
                        elif cmd == "add" or cmd == "add_file" or cmd == "add_dir":
                            if isDir: addedDirs.append(fileName)
                            else: addedFiles.append(fileName)
                        elif cmd == "rename":
                            renameFrom = fileName
                        elif cmd == "to" and renameFrom != "":
                            renamedFiles.append((renameFrom, fileName))
                            renameFrom = ""
                        else:
                            cmd = ""
        if reverse:
            print "patch -R -p0 < %s" % list[0]
            for f in addedFiles: print "%s drop -e %s" % (mtncmd, f)
            for f in addedDirs: print "%s drop -e %s" % (mtncmd, f)
            for fold,fnew in renamedFiles: print "%s rename -e %s %s" % (mtncmd, fnew, fold)
            for f in droppedDirs: print "%s revert %s" % (mtncmd, f)
            for f in droppedFiles: print "%s revert %s" % (mtncmd, f)
        else:
            print "patch -p0 < %s" % list[0]
            for f in droppedFiles: print "%s drop -e %s" % (mtncmd, f)
            for f in droppedDirs: print "%s drop -e %s" % (mtncmd, f)
            for fold,fnew in renamedFiles: print "%s rename -e %s %s" % (mtncmd, fold, fnew)
            for f in addedDirs: print "%s add %s" % (mtncmd, f)
            for f in addedFiles: print "%s add %s" % (mtncmd, f)

if __name__ == "__main__":
    sys.exit(main())

--------------040807030501080609010805--
