Received: from [206.46.173.1] (helo=vms173001pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LwVgo-0004gB-4s
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Apr 2009 08:12:10 +0200
Received: from gandalf.denix.org ([71.255.242.201]) by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KIH009TTNNI7KZ8@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	22 Apr 2009 01:07:02 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id A34876B83A8; Wed,
	22 Apr 2009 02:06:54 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Apr 2009 02:06:54 -0400
Message-id: <1240380414-8068-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.6.0.6
Cc: Petri Lehtinen <petri.lehtinen@inoi.fi>
Subject: [STABLE][PATCH] base.bbclass: Combine all checksum.ini files found in BBPATH
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
X-List-Received-Date: Wed, 22 Apr 2009 06:12:10 -0000

From: Petri Lehtinen <petri.lehtinen@inoi.fi>

This makes it possible for overlays to have checksum.ini.

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 classes/base.bbclass |   22 +++++++++++++---------
 1 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/classes/base.bbclass b/classes/base.bbclass
index 9ec705b..e5fd814 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -40,12 +40,11 @@ def base_path_relative(src, dest):
     return sep.join(relpath)
 
 # for MD5/SHA handling
-def base_chk_load_parser(config_path):
+def base_chk_load_parser(config_paths):
     import ConfigParser, os, bb
     parser = ConfigParser.ConfigParser()
-    if not len(parser.read(config_path)) == 1:
-        bb.note("Can not open the '%s' ini file" % config_path)
-        raise Exception("Can not open the '%s'" % config_path)
+    if len(parser.read(config_paths)) < 1:
+        raise ValueError("no ini files could be found")
 
     return parser
 
@@ -620,13 +619,18 @@ python base_do_fetch() {
 
 	# Verify the SHA and MD5 sums we have in OE and check what do
 	# in
-	check_sum = bb.which(bb.data.getVar('BBPATH', d, True), "conf/checksums.ini")
-	if not check_sum:
-		bb.note("No conf/checksums.ini found, not checking checksums")
-		return
+	checksum_paths = bb.data.getVar('BBPATH', d, True).split(":")
+
+	# reverse the list to give precedence to directories that
+	# appear first in BBPATH
+	checksum_paths.reverse()
 
+	checksum_files = ["%s/conf/checksums.ini" % path for path in checksum_paths]
 	try:
-		parser = base_chk_load_parser(check_sum)
+		parser = base_chk_load_parser(checksum_files)
+	except ValueError:
+		bb.note("No conf/checksums.ini found, not checking checksums")
+		return
 	except:
 		bb.note("Creating the CheckSum parser failed")
 		return
-- 
1.6.0.6



