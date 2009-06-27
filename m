Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.ott.cti.com>) id 1MKfe8-0008I0-FO
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Jun 2009 23:41:16 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id C708C4F0966;
	Sat, 27 Jun 2009 17:29:44 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 29949-01; Sat, 27 Jun 2009 17:29:44 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id 9F1774F0840; Sat, 27 Jun 2009 17:29:44 -0400 (EDT)
X-Spam-Score: 
X-Spam-Checker-Version: SpamAssassin 3.1.8 (2007-02-13) on sid.cbnco.com
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=7.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.1.8
Received: from sles10-64.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 7407F4F0840;
	Sat, 27 Jun 2009 17:29:43 -0400 (EDT)
Received: by sles10-64.ott.cti.com (Postfix, from userid 1000)
	id 5E01B4147E; Sat, 27 Jun 2009 17:29:43 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Jun 2009 17:29:38 -0400
Message-Id: <1246138179-23626-1-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.6.3
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: [PATCH 1/2] source-checker: usability tweaks
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
X-List-Received-Date: Sat, 27 Jun 2009 21:41:17 -0000

checksum sorter, source checker: exit(1) on failure; send usage to
stderr; make executable

checksum sorter: read from stdin if no arg; accept --inplace option to
read and write from the same file.

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 contrib/source-checker/oe-checksums-sorter.py |   59 +++++++++++++++++++++----
 contrib/source-checker/oe-source-checker.py   |    4 +-
 2 files changed, 52 insertions(+), 11 deletions(-)
 mode change 100644 => 100755 contrib/source-checker/oe-checksums-sorter.py
 mode change 100644 => 100755 contrib/source-checker/oe-source-checker.py

diff --git a/contrib/source-checker/oe-checksums-sorter.py b/contrib/source-checker/oe-checksums-sorter.py
old mode 100644
new mode 100755
index 2bab58c..7388c62
--- a/contrib/source-checker/oe-checksums-sorter.py
+++ b/contrib/source-checker/oe-checksums-sorter.py
@@ -29,20 +29,57 @@
 #
 
 
+import ConfigParser
+import getopt
+import os
 import sys
+import tempfile
 
-if len(sys.argv) < 2:
-    print """
-    OpenEmbedded source checksums script require argument:
+def usage():
+    print >> sys.stderr, \
+    """usage: %s [--inplace|-i] conf/checksums.ini
 
-    1. location of conf/checksums.ini
-    """
-    sys.exit(0)
+    --inplace, -i: update file in place (default is to write to stdout)
 
-import ConfigParser, os
+    If no input file is given, will read from standard input.
+    """ % sys.argv[0]
+    sys.exit(1)
+
+try:
+    optlist, args = getopt.getopt(sys.argv[1:], "ih", ["inplace", "help"])
+except getopt.GetoptError, e:
+    print >> sys.stderr, "%s: %s" % (sys.argv[0], e)
+    usage()
+
+inplace = False
+readstdin = False
+for opt, val in optlist:
+    if opt == '-i' or opt == '--inplace':
+        inplace = True
+    else:
+        usage()
+
+if len(args) == 0:
+    readstdin = True
+    if inplace:
+        print >> sys.stderr, "%s: --inplace requires a filename" % sys.argv[0]
+        usage()
+
+if len(args) > 1:
+    usage()
+
+out = sys.stdout
+outfn = None
+if inplace:
+    outfd, outfn = tempfile.mkstemp(prefix='cksums')
+    out = os.fdopen(outfd, 'w')
 
 checksums_parser = ConfigParser.ConfigParser()
-checksums_parser.read(sys.argv[1])
+
+if readstdin:
+    checksums_parser.readfp(sys.stdin)
+else:
+    checksums_parser.read(args[0])
 
 item = 1;
 files_total   = len(checksums_parser.sections())
@@ -60,4 +97,8 @@ for source in checksums_parser.sections():
 new_list.sort()
 
 for entry in new_list:
-    print "[%s]\nmd5=%s\nsha256=%s\n" % (entry[1], entry[2], entry[3])
+    print >> out, "[%s]\nmd5=%s\nsha256=%s\n" % (entry[1], entry[2], entry[3])
+
+if inplace:
+    out.close()
+    os.rename(outfn, args[0])
diff --git a/contrib/source-checker/oe-source-checker.py b/contrib/source-checker/oe-source-checker.py
old mode 100644
new mode 100755
index 0ae3563..79e988b
--- a/contrib/source-checker/oe-source-checker.py
+++ b/contrib/source-checker/oe-source-checker.py
@@ -39,13 +39,13 @@
 import sys
 
 if len(sys.argv) < 3:
-    print """
+    print >> sys.stderr, """
     OpenEmbedded source checker script require two arguments:
 
     1. location of conf/checksums.ini
     2. path to DL_DIR (without "/" at the end)
     """
-    sys.exit(0)
+    sys.exit(1)
 
 import ConfigParser, os, itertools
 
-- 
1.6.3



