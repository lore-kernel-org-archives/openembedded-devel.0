Return-Path: <maxin.john@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 229EF6003C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jan 2018 10:58:29 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Jan 2018 02:58:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,415,1511856000"; d="scan'208";a="196434700"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 26 Jan 2018 02:58:30 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 42D81580409
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jan 2018 02:58:30 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Jan 2018 13:00:18 +0200
Message-Id: <1516964418-43279-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] classes/recipes: Convert SkipPackage -> SkipRecipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Jan 2018 10:58:30 -0000

Update following the SkipPackage -> SkipRecipe change in oe-core.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta-initramfs/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb | 2 +-
 meta-networking/recipes-support/nis/nis.inc                          | 2 +-
 meta-oe/classes/gitver.bbclass                                       | 2 +-
 meta-oe/recipes-support/ne10/ne10_1.2.1.bb                           | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb b/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb
index 6b845bd..3a8d9f7 100644
--- a/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb
+++ b/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb
@@ -8,5 +8,5 @@ IMAGE_INSTALL = "kexecboot-klibc kexec-klibc ubiattach-klibc"
 
 python () {
     if d.getVar('TARGET_ARCH') == "nios2":
-        raise bb.parse.SkipPackage("'nios2' not supported arch")
+        raise bb.parse.SkipRecipe("'nios2' not supported arch")
 }
diff --git a/meta-networking/recipes-support/nis/nis.inc b/meta-networking/recipes-support/nis/nis.inc
index e027a1c..200eaf7 100644
--- a/meta-networking/recipes-support/nis/nis.inc
+++ b/meta-networking/recipes-support/nis/nis.inc
@@ -27,5 +27,5 @@ do_install() {
 python () {
     os = d.getVar("TARGET_OS", True)
     if os == "linux-uclibc":
-        raise bb.parse.SkipPackage("NIS functionality requires rpcsvc/yp.h, uClibC does not provide this")
+        raise bb.parse.SkipRecipe("NIS functionality requires rpcsvc/yp.h, uClibC does not provide this")
 }
diff --git a/meta-oe/classes/gitver.bbclass b/meta-oe/classes/gitver.bbclass
index 380374a..07f44c3 100644
--- a/meta-oe/classes/gitver.bbclass
+++ b/meta-oe/classes/gitver.bbclass
@@ -36,7 +36,7 @@ def get_git_pv(d, tagadjust=None):
                 return "0.0"
 
         except Exception as exc:
-            raise bb.parse.SkipPackage(str(exc))
+            raise bb.parse.SkipRecipe(str(exc))
 
     if ver and tagadjust:
         ver = tagadjust(ver)
diff --git a/meta-oe/recipes-support/ne10/ne10_1.2.1.bb b/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
index e5b50ce..76e0741 100644
--- a/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
+++ b/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
@@ -29,7 +29,7 @@ python () {
         d.setVar('NE10_TARGET_ARCH', 'aarch64')
         bb.debug(2, 'Building Ne10 for aarch64')
     else:
-        raise bb.parse.SkipPackage("Incompatible with archs other than armv7 and aarch64")
+        raise bb.parse.SkipRecipe("Incompatible with archs other than armv7 and aarch64")
 }
 
 do_install() {
-- 
2.4.0


