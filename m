Received: from vms173009pub.verizon.net ([206.46.173.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1NZEHt-0004ZG-IV
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Jan 2010 03:02:48 +0100
Received: from gandalf.denix.org ([unknown] [71.255.235.232])
	by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0KWS00H8U5KJS5C1@vms173009.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sun,
	24 Jan 2010 20:00:20 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 3B0CF14AF60; Sun,
	24 Jan 2010 21:00:19 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Jan 2010 20:59:44 -0500
Message-id: <1264384785-30439-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.6.3.3
In-reply-to: <20100125015636.GA9855@denix.org>
References: <20100125015636.GA9855@denix.org>
X-SA-Exim-Connect-IP: 206.46.173.9
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 1/2] base.bbclass: pre-create SRC_URI checksums to include in the recipe
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
X-List-Received-Date: Mon, 25 Jan 2010 02:02:49 -0000

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 classes/base.bbclass |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/classes/base.bbclass b/classes/base.bbclass
index 384a67d..8465286 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -151,9 +151,27 @@ def base_chk_file(parser, pn, pv, src_uri, localpath, data):
         
         file.write("[%s]\nmd5=%s\nsha256=%s\n\n" % (src_uri, md5data, shadata))
         file.close()
+
+        from string import maketrans
+        trtable = maketrans("", "")
+        uname = src_uri.split("/")[-1].translate(trtable, "-+._")
+
+        try:
+            ufile = open("%s/%s.sum" % (bb.data.getVar("TMPDIR", data, 1), uname), "wt")
+        except:
+            return False
+
+        if not ufile:
+            raise Exception("Creating %s.sum failed" % uname)
+
+        ufile.write("SRC_URI = \"%s;name=%s\"\nSRC_URI[%s.md5sum] = \"%s\"\nSRC_URI[%s.sha256sum] = \"%s\"\n" % (src_uri, uname, uname, md5data, uname, shadata))
+        ufile.close()
+
         if not bb.data.getVar("OE_STRICT_CHECKSUMS",data, True):
             bb.note("This package has no entry in checksums.ini, please add one")
             bb.note("\n[%s]\nmd5=%s\nsha256=%s" % (src_uri, md5data, shadata))
+            bb.note("This package has no checksums in corresponding recipe, please add")
+            bb.note("SRC_URI = \"%s;name=%s\"\nSRC_URI[%s.md5sum] = \"%s\"\nSRC_URI[%s.sha256sum] = \"%s\"\n" % (src_uri, uname, uname, md5data, uname, shadata))
             return True
         else:
             bb.note("Missing checksum")
-- 
1.6.3.3



