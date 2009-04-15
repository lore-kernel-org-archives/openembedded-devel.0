Received: from [194.100.97.46] (helo=mail.inoi.fi)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <petri.lehtinen+openembedded-devel@inoi.fi>)
	id 1Lu05t-0001jB-CQ for openembedded-devel@lists.openembedded.org;
	Wed, 15 Apr 2009 10:04:20 +0200
Received: from mail.inoi.fi (localhost.localdomain [127.0.0.1])
	by mail.inoi.fi (Postfix) with ESMTP id 5F002214B5;
	Wed, 15 Apr 2009 10:48:15 +0300 (EEST)
Received: from localhost.localdomain (unknown [10.105.0.205])
	by mail.inoi.fi (Postfix) with ESMTP id 3AE4D20C93;
	Wed, 15 Apr 2009 10:48:15 +0300 (EEST)
From: petri.lehtinen+openembedded-devel@inoi.fi
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Apr 2009 10:59:55 +0300
Message-Id: <1239782395-12413-1-git-send-email-petri.lehtinen+openembedded-devel@inoi.fi>
X-Mailer: git-send-email 1.6.0.4
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 194.100.97.46
X-SA-Exim-Mail-From: petri.lehtinen+openembedded-devel@inoi.fi
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_50,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Petri Lehtinen <petri.lehtinen@inoi.fi>
Subject: [PATCH] base.bbclass: Combine all checksum.ini files found in BBPATH
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
X-List-Received-Date: Wed, 15 Apr 2009 08:04:31 -0000

From: Petri Lehtinen <petri.lehtinen@inoi.fi>

This makes it possible for overlays to have checksum.ini.

Signed-off-by: Petri Lehtinen <petri.lehtinen@inoi.fi>
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
1.6.0.4



