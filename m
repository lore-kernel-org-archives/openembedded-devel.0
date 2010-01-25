Received: from vms173003pub.verizon.net ([206.46.173.3])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1NZFES-00047o-MQ
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Jan 2010 04:03:19 +0100
Received: from gandalf.denix.org ([unknown] [71.255.235.232])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0KWS00HAD5KJBRM4@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sun,
	24 Jan 2010 20:00:32 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 3CF9614AF64; Sun,
	24 Jan 2010 21:00:19 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Jan 2010 20:59:45 -0500
Message-id: <1264384785-30439-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.6.3.3
In-reply-to: <20100125015636.GA9855@denix.org>
References: <20100125015636.GA9855@denix.org>
X-SA-Exim-Connect-IP: 206.46.173.3
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 2/2] base.bbclass: don't pre-generate checksums.ini entries any longer
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
X-List-Received-Date: Mon, 25 Jan 2010 03:03:19 -0000

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 classes/base.bbclass |   15 +--------------
 1 files changed, 1 insertions(+), 14 deletions(-)

diff --git a/classes/base.bbclass b/classes/base.bbclass
index 8465286..8e14636 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -140,18 +140,7 @@ def base_chk_file(parser, pn, pv, src_uri, localpath, data):
     except OSError:
         raise Exception("Executing shasum failed")
 
-    if no_checksum == True:	# we do not have conf/checksums.ini entry
-        try:
-            file = open("%s/checksums.ini" % bb.data.getVar("TMPDIR", data, 1), "a")
-        except:
-            return False
-
-        if not file:
-            raise Exception("Creating checksums.ini failed")
-        
-        file.write("[%s]\nmd5=%s\nsha256=%s\n\n" % (src_uri, md5data, shadata))
-        file.close()
-
+    if no_checksum == True:	# we do not have SRC_URI checksums
         from string import maketrans
         trtable = maketrans("", "")
         uname = src_uri.split("/")[-1].translate(trtable, "-+._")
@@ -168,8 +157,6 @@ def base_chk_file(parser, pn, pv, src_uri, localpath, data):
         ufile.close()
 
         if not bb.data.getVar("OE_STRICT_CHECKSUMS",data, True):
-            bb.note("This package has no entry in checksums.ini, please add one")
-            bb.note("\n[%s]\nmd5=%s\nsha256=%s" % (src_uri, md5data, shadata))
             bb.note("This package has no checksums in corresponding recipe, please add")
             bb.note("SRC_URI = \"%s;name=%s\"\nSRC_URI[%s.md5sum] = \"%s\"\nSRC_URI[%s.sha256sum] = \"%s\"\n" % (src_uri, uname, uname, md5data, uname, shadata))
             return True
-- 
1.6.3.3



