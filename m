Return-Path: <dv@pseudoterminal.org>
X-Greylist: delayed 324 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 03 Feb 2016 16:50:37 UTC
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 17000770AB
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Feb 2016 16:50:37 +0000 (UTC)
Received: from localhost.localdomain (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id E4FAD2B4C1
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Feb 2016 17:45:13 +0100 (CET)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Feb 2016 17:45:02 +0100
Message-Id: <1454517902-21801-1-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.5.0
Subject: [meta-oe][PATCH] ne10: add recipe
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
X-List-Received-Date: Wed, 03 Feb 2016 16:50:42 -0000

Add recipe for the Ne10 library ( http://projectne10.github.io/Ne10/ ).
This library provides heavily ARM NEON optimized versions of functions
that are commonly used.

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 meta-oe/recipes-support/ne10/ne10_1.2.1.bb | 38 ++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 meta-oe/recipes-support/ne10/ne10_1.2.1.bb

diff --git a/meta-oe/recipes-support/ne10/ne10_1.2.1.bb b/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
new file mode 100644
index 0000000..a465e7d
--- /dev/null
+++ b/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
@@ -0,0 +1,38 @@
+DESCRIPTION = "Library containing NEON-optimized implementations for a common set of functions"
+HOMEPAGE = "http://projectne10.github.io/Ne10/"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=463ac0a7d64edc2b787c4206635ca2b1"
+SECTION = "libs"
+
+SRC_URI = "git://github.com/projectNe10/Ne10.git"
+SRCREV = "v${PV}"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+NE10_TARGET_ARCH = ""
+EXTRA_OECMAKE = '-DGNULINUX_PLATFORM=ON -DNE10_BUILD_SHARED=ON -DNE10_LINUX_TARGET_ARCH="${NE10_TARGET_ARCH}"'
+
+COMPATIBLE_MACHINE_aarch64 = "(.*)"
+COMPATIBLE_MACHINE_armv7a = "(.*)"
+
+python () {
+    if any(t.startswith('armv7') for t in d.getVar('TUNE_FEATURES', True).split()):
+        d.setVar('NE10_TARGET_ARCH', 'armv7')
+        bb.note('Building Ne10 for armv7')
+    elif any(t.startswith('aarch64') for t in d.getVar('TUNE_FEATURES', True).split()):
+        d.setVar('NE10_TARGET_ARCH', 'aarch64')
+        bb.note('Building Ne10 for aarch64')
+    else:
+        raise bb.parse.SkipPackage("Incompatible with archs other than armv7 and aarch64")
+}
+
+do_install() {
+        install -d ${D}${libdir}
+        install -d ${D}${includedir}
+        install -m 0644 ${S}/inc/NE10*.h ${D}${includedir}/
+        install -m 0644 ${B}/modules/libNE10.a ${D}${libdir}/
+        install -m 0755 ${B}/modules/libNE10.so.* ${D}${libdir}/
+        cp -a ${B}/modules/libNE10.so ${D}${libdir}/
+}
-- 
2.5.0


