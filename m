Received: from mail-yx0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ricardo.salveti@openbossa.org>) id 1NCceW-00011X-RV
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Nov 2009 18:24:44 +0100
Received: by yxe5 with SMTP id 5so2509593yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2009 09:23:12 -0800 (PST)
Received: by 10.101.143.10 with SMTP id v10mr3739526ann.170.1258996989229;
	Mon, 23 Nov 2009 09:23:09 -0800 (PST)
Received: from localhost.localdomain ([200.184.118.130])
	by mx.google.com with ESMTPS id 5sm1540994ywd.23.2009.11.23.09.23.06
	(version=SSLv3 cipher=RC4-MD5); Mon, 23 Nov 2009 09:23:08 -0800 (PST)
From: Ricardo Salveti de Araujo <ricardo.salveti@openbossa.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Nov 2009 14:16:45 -0300
Message-Id: <1258996605-20124-1-git-send-email-ricardo.salveti@openbossa.org>
X-Mailer: git-send-email 1.6.5
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: ricardo.salveti@openbossa.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] package_deb.bbclass: make the PACKAGES check earlier so if there is nothing to package we don't read potentially stale pkgdata from staging.
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
X-List-Received-Date: Mon, 23 Nov 2009 17:24:44 -0000

This is basically the commit 27b9bc946eeb3faa7b10d92689ab527af42727bd that got
lost when merging poky stuff into the repo. The behavior is much like
what we already have with package_ipk.

Signed-off-by: Ricardo Salveti de Araujo <ricardo.salveti@openbossa.org>
---
 classes/package_deb.bbclass |   19 ++++++++-----------
 1 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/classes/package_deb.bbclass b/classes/package_deb.bbclass
index 2a9bf76..9fb1674 100644
--- a/classes/package_deb.bbclass
+++ b/classes/package_deb.bbclass
@@ -86,20 +86,12 @@ python do_package_deb () {
         return
     bb.mkdirhier(dvar)
 
-    packages = bb.data.getVar('PACKAGES', d, 1)
-    if not packages:
-        bb.debug(1, "PACKAGES not defined, nothing to package")
-        return
-
     tmpdir = bb.data.getVar('TMPDIR', d, 1)
 
     if os.access(os.path.join(tmpdir, "stamps", "DEB_PACKAGE_INDEX_CLEAN"),os.R_OK):
         os.unlink(os.path.join(tmpdir, "stamps", "DEB_PACKAGE_INDEX_CLEAN"))
 
-    if packages == []:
-        bb.debug(1, "No packages; nothing to do")
-        return
-
+    packages = bb.data.getVar('PACKAGES', d, 1)
     for pkg in packages.split():
         localdata = bb.data.createCopy(d)
         pkgdest = bb.data.getVar('PKGDEST', d, 1)
@@ -268,8 +260,13 @@ python () {
 }
 
 python do_package_write_deb () {
-	bb.build.exec_func("read_subpackage_metadata", d)
-	bb.build.exec_func("do_package_deb", d)
+    packages = bb.data.getVar('PACKAGES', d, True)
+    if not packages:
+        bb.debug(1, "No PACKAGES defined, nothing to package")
+        return
+
+    bb.build.exec_func("read_subpackage_metadata", d)
+    bb.build.exec_func("do_package_deb", d)
 }
 do_package_write_deb[dirs] = "${D}"
 addtask package_write_deb before do_package_write after do_package
-- 
1.6.5



