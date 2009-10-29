Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1N3TM8-0005DP-5B
	for openembedded-devel@openembedded.org; Thu, 29 Oct 2009 12:39:55 +0100
Received: (qmail 13452 invoked by uid 813007); 29 Oct 2009 11:38:46 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 29 Oct 2009 11:38:46 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Oct 2009 12:41:34 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.32-rc3-00052-g0eca52a; KDE/4.3.2; x86_64; ;
	)
MIME-Version: 1.0
Message-Id: <200910291241.35265.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Checksums.ini again - new format this time
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Oct 2009 11:39:55 -0000
X-Groupsio-MsgNum: 13714
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_v9X6Kgw2wKwXWKP"

--Boundary-00=_v9X6Kgw2wKwXWKP
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit


Hi

I know that checksums.ini returns many times on ML so many of you are bored 
with it. But I have some stuff to show/share about it.

Sometime ago new format was suggested for conf/checksums.ini and I implemented 
it today. It looks simple and is simple:

[archivename]
url0=url-to-sources
url1=alternative-url-to-sources
url2=another-alternative-url-to-sources
md5=md5sum
sha256=sha256sum

What differs from old implementation? Use of archive names instead of urls so 
no more "I fetch from my local Debian mirror and got hit by lack of checksums" 
etc problems. By default OE does not even care about urls - it just checks for 
section by archive name and use md5/sha256 sums to check does file is the 
proper one. Urls can be used by source mirror building tools.

How many changes are needed? Few:

1. 3 lines patch to base.bbclass
2. new checksums sorter
3. old checksums -> new checksums converter

I think that it would be nice to switch to that.

Ideas? Opinions?

Regards, 
-- 
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz

--Boundary-00=_v9X6Kgw2wKwXWKP
Content-Type: text/x-patch;
  charset="UTF-8";
  name="base.bbclass.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="base.bbclass.diff"

diff --git a/classes/base.bbclass b/classes/base.bbclass
index d29ba4b..bf7d49c 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -72,6 +72,9 @@ def base_chk_file(parser, pn, pv, src_uri, localpath, data):
     elif parser.has_section(src_uri):
         md5    = parser.get(src_uri, "md5")
         sha256 = parser.get(src_uri, "sha256")
+    elif parser.has_section(os.path.basename(src_uri)):
+        md5    = parser.get(os.path.basename(src_uri), "md5")
+        sha256 = parser.get(os.path.basename(src_uri), "sha256")
     else:
         no_checksum = True
 



--Boundary-00=_v9X6Kgw2wKwXWKP
Content-Type: text/x-python;
  charset="UTF-8";
  name="oe-checksums-converter.py"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="oe-checksums-converter.py"

#!/usr/bin/env python
# ex:ts=4:sw=4:sts=4:et

# Copyright (C) 2007 OpenedHand
# Copyright (C) 2009 Marcin Juszkiewicz
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2 as
# published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

#
# OpenEmbedded source checksums converter
#
# based on oe-checksums-sorter.py
#
# This script parse conf/checksums.ini and converts it to new format.
# Duplicate entries are removed.
#

import ConfigParser
import getopt
import os
import sys
import tempfile

def usage(rc):
    print """usage: %s [--inplace|-i] conf/checksums.ini

    --inplace, -i: update file in place (default is to write to stdout)

    If no input file is given, will read from standard input.
    """ % sys.argv[0]
    sys.exit(rc)

try:
    optlist, args = getopt.getopt(sys.argv[1:], "ih", ["inplace", "help"])
except getopt.GetoptError, e:
    print >> sys.stderr, "%s: %s" % (sys.argv[0], e)
    usage(1)

inplace = False
infp = sys.stdin
filename = None
for opt, val in optlist:
    if opt == '-i' or opt == '--inplace':
        inplace = True
    elif opt == 'h' or opt == '--help':
        usage(0)
    else:
        print >> sys.stderr, "%s: %s: invalid argument" % (sys.argv[0], opt)
        usage(1)

if len(args) == 0:
    if inplace:
        print >> sys.stderr, "%s: --inplace requires a filename" % sys.argv[0]
        usage(1)
elif len(args) == 1:
    filename = args[0]
    try:
        infp = open(filename, "r")
    except Exception, e:
        print >> sys.stderr, "%s: %s" % (sys.argv[0], e)
        sys.exit(1)
else:
    print >> sys.stderr, "%s: extra arguments" % sys.argv[0]
    usage(1)

out = sys.stdout
tmpfn = None
if inplace:
    outfd, tmpfn = tempfile.mkstemp(prefix='cksums',
                                    dir=os.path.dirname(filename) or '.')
    os.chmod(tmpfn, os.stat(filename).st_mode)
    out = os.fdopen(outfd, 'w')

checksums_parser = ConfigParser.SafeConfigParser()
checksums_parser.readfp(infp)

new_list = []
seen = {}

for source in checksums_parser.sections():
    archive = source.split("/")[-1]
    md5 = checksums_parser.get(source, "md5")
    sha = checksums_parser.get(source, "sha256")

    tup = (archive, source, md5, sha)
    if not seen.has_key(tup):
        new_list.append(tup)
        seen[tup] = 1

new_list.sort()

archive = ''
archiveid = 0   # for urlX entries
sums = {}       # to keep md5/sha256 in case of archive change

for entry in new_list:

    if archive != entry[0]:

        if archive != '': # not totally first entry
            print >> out, "md5=%s\nsha256=%s\n" % (sums[0], sums[1]) # print old sums
            sums = (entry[2], entry[3])

        print >> out, "[%s]\nurl0=%s" % (entry[0], entry[1])
        archive = entry[0]
        archiveid = 1

    else:
        print >> out, "url%d=%s" % (archiveid, entry[1])
        archiveid += 1

    sums = (entry[2], entry[3])

print >> out, "md5=%s\nsha256=%s\n" % (entry[2], entry[3])

if inplace:
    out.close()
    os.rename(tmpfn, filename)

--Boundary-00=_v9X6Kgw2wKwXWKP
Content-Type: text/x-python;
  charset="UTF-8";
  name="oe-checksums-sorter.py"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="oe-checksums-sorter.py"

#!/usr/bin/env python
# ex:ts=4:sw=4:sts=4:et

# Copyright (C) 2007 OpenedHand
# Copyright (C) 2009 Marcin Juszkiewicz
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2 as
# published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

#
# OpenEmbedded source checksums sorter
#
# This script parse conf/checksums.ini and sorts it alphabetically by archive
# name source archive. Duplicate entries are removed.
#

import ConfigParser
import getopt
import os
import sys
import tempfile

def usage(rc):
    print """usage: %s [--inplace|-i] conf/checksums.ini

    --inplace, -i: update file in place (default is to write to stdout)

    If no input file is given, will read from standard input.
    """ % sys.argv[0]
    sys.exit(rc)

try:
    optlist, args = getopt.getopt(sys.argv[1:], "ih", ["inplace", "help"])
except getopt.GetoptError, e:
    print >> sys.stderr, "%s: %s" % (sys.argv[0], e)
    usage(1)

inplace = False
infp = sys.stdin
filename = None
for opt, val in optlist:
    if opt == '-i' or opt == '--inplace':
        inplace = True
    elif opt == 'h' or opt == '--help':
        usage(0)
    else:
        print >> sys.stderr, "%s: %s: invalid argument" % (sys.argv[0], opt)
        usage(1)

if len(args) == 0:
    if inplace:
        print >> sys.stderr, "%s: --inplace requires a filename" % sys.argv[0]
        usage(1)
elif len(args) == 1:
    filename = args[0]
    try:
        infp = open(filename, "r")
    except Exception, e:
        print >> sys.stderr, "%s: %s" % (sys.argv[0], e)
        sys.exit(1)
else:
    print >> sys.stderr, "%s: extra arguments" % sys.argv[0]
    usage(1)

out = sys.stdout
tmpfn = None
if inplace:
    outfd, tmpfn = tempfile.mkstemp(prefix='cksums',
                                    dir=os.path.dirname(filename) or '.')
    os.chmod(tmpfn, os.stat(filename).st_mode)
    out = os.fdopen(outfd, 'w')

checksums_parser = ConfigParser.ConfigParser()
checksums_parser.readfp(infp)

new_list = []
seen = {}

for archive in checksums_parser.sections():
    md5 = checksums_parser.get(archive, "md5")
    sha = checksums_parser.get(archive, "sha256")

    tup = (archive, md5, sha)

    urls = []
    for item in checksums_parser.items(archive):
        if item[0].startswith('url'):
            urls.append(item[1])

    urls.sort()
    for url in urls:
        tup += (url, '')

    if not seen.has_key(archive):
        new_list.append(tup)
        seen[archive] = 1

new_list.sort()

for entry in new_list:
    print >> out, "[%s]" % entry[0] 

    archiveid = 0
    for a in range(3, len(entry)):
        if entry[a]:
            print >> out, "url%d=%s" % (archiveid, entry[a])
            archiveid += 1
    print >> out, "md5=%s\nsha256=%s\n" % (entry[1], entry[2])

if inplace:
    out.close()
    os.rename(tmpfn, filename)

--Boundary-00=_v9X6Kgw2wKwXWKP--
