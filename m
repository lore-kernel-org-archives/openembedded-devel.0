Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 4F0D36FF01
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Feb 2016 14:07:58 +0000 (UTC)
Received: from localhost.localdomain (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 3D53E23261
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Feb 2016 15:07:59 +0100 (CET)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Feb 2016 15:07:51 +0100
Message-Id: <1454940471-6218-1-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1454940322-6151-1-git-send-email-dv@pseudoterminal.org>
References: <1454940322-6151-1-git-send-email-dv@pseudoterminal.org>
Subject: [meta-oe][PATCH v2] libopus: upgrade to version 1.1.2
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
X-List-Received-Date: Mon, 08 Feb 2016 14:07:59 -0000

This release includes support for Ne10 to improve performance on ARM NEON
capable CPUs. Also, packageconfigs are introduced for controlling whether
Opus uses fixed or floating point processing and whether or not fast
floating point approximations are enabled.

libopus-fpu.inc wasn't doing much, and was fully integrated into the
main recipe.

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 meta-oe/recipes-multimedia/libopus/libopus-fpu.inc |  6 ------
 .../libopus/{libopus_1.1.bb => libopus_1.1.2.bb}   | 24 ++++++++++++++++++----
 2 files changed, 20 insertions(+), 10 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/libopus/libopus-fpu.inc
 rename meta-oe/recipes-multimedia/libopus/{libopus_1.1.bb => libopus_1.1.2.bb} (65%)

diff --git a/meta-oe/recipes-multimedia/libopus/libopus-fpu.inc b/meta-oe/recipes-multimedia/libopus/libopus-fpu.inc
deleted file mode 100644
index 8464664..0000000
--- a/meta-oe/recipes-multimedia/libopus/libopus-fpu.inc
+++ /dev/null
@@ -1,6 +0,0 @@
-
-def get_libopus_fpu_setting(bb, d):
-    if d.getVar('TARGET_FPU', True) in [ 'soft' ]:
-        return "--enable-fixed-point"
-    return ""
-
diff --git a/meta-oe/recipes-multimedia/libopus/libopus_1.1.bb b/meta-oe/recipes-multimedia/libopus/libopus_1.1.2.bb
similarity index 65%
rename from meta-oe/recipes-multimedia/libopus/libopus_1.1.bb
rename to meta-oe/recipes-multimedia/libopus/libopus_1.1.2.bb
index 948d4df..9d9a634 100644
--- a/meta-oe/recipes-multimedia/libopus/libopus_1.1.bb
+++ b/meta-oe/recipes-multimedia/libopus/libopus_1.1.2.bb
@@ -9,15 +9,31 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e304cdf74c2a1b0a33a5084c128a23a3"
 
 SRC_URI = "http://downloads.xiph.org/releases/opus/opus-${PV}.tar.gz"
-SRC_URI[md5sum] = "c5a8cf7c0b066759542bc4ca46817ac6"
-SRC_URI[sha256sum] = "b9727015a58affcf3db527322bf8c4d2fcf39f5f6b8f15dbceca20206cbe1d95"
+SRC_URI[md5sum] = "1f08a661bc72930187893a07f3741a91"
+SRC_URI[sha256sum] = "0e290078e31211baa7b5886bcc8ab6bc048b9fc83882532da4a1a45e58e907fd"
 
 S = "${WORKDIR}/opus-${PV}"
 
 inherit autotools pkgconfig
 
-require libopus-fpu.inc
-EXTRA_OECONF = "${@get_libopus_fpu_setting(bb, d)}"
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[fixed-point] = "--enable-fixed-point,,"
+PACKAGECONFIG[float-approx] = "--enable-float-approx,,"
+
+EXTRA_OECONF = "--with-NE10-includes=${STAGING_DIR_TARGET}${includedir} \
+                --with-NE10-libraries=${STAGING_DIR_TARGET}${libdir} \
+                --enable-asm \
+                --enable-intrinsics \
+               "
+
+python () {
+    if d.getVar('TARGET_FPU', True) in [ 'soft' ]:
+        d.appendVar('PACKAGECONFIG', ' fixed-point')
+
+    # Ne10 is only available for armv7 and aarch64
+    if any((t.startswith('armv7') or t.startswith('aarch64')) for t in d.getVar('TUNE_FEATURES', True).split()):
+        d.appendVar('DEPENDS', ' ne10')
+}
 
 # Fails to build with thumb-1 (qemuarm)
 #| {standard input}: Assembler messages:
-- 
2.5.0


