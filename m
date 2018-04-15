Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 01A817456A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Apr 2018 09:42:58 +0000 (UTC)
Received: from localhost.localdomain (62-178-50-190.cable.dynamic.surfer.at
	[62.178.50.190]) by ptmx.org (Postfix) with ESMTPSA id 55B6B3F3B6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Apr 2018 11:42:58 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 Apr 2018 11:42:34 +0200
Message-Id: <20180415094234.19735-1-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.14.1
Subject: [meta-multimedia][PATCH] openh264: add recipe
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
X-List-Received-Date: Sun, 15 Apr 2018 09:42:59 -0000

OpenH264 is a codec library which supports H.264 encoding and decoding.
It is suitable for use in real time applications such as WebRTC.

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 .../recipes-multimedia/openh264/openh264_1.7.0.bb  | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/openh264/openh264_1.7.0.bb

diff --git a/meta-multimedia/recipes-multimedia/openh264/openh264_1.7.0.bb b/meta-multimedia/recipes-multimedia/openh264/openh264_1.7.0.bb
new file mode 100644
index 000000000..c70a3d13e
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/openh264/openh264_1.7.0.bb
@@ -0,0 +1,41 @@
+DESCRIPTION = "OpenH264 is a codec library which supports H.264 encoding and \
+decoding. It is suitable for use in real time applications such as WebRTC."
+HOMEPAGE = "http://www.openh264.org/"
+SECTION = "libs/multimedia"
+
+DEPENDS = "${@oe.utils.conditional('TARGET_ARCH', 'i386', 'nasm-native', \
+              oe.utils.conditional('TARGET_ARCH', 'x86_64', 'nasm-native', \
+             '', d), d)}"
+
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=bb6d3771da6a07d33fd50d4d9aa73bcf"
+
+SRC_URI = "https://github.com/cisco/openh264/archive/v${PV}.tar.gz"
+SRC_URI[md5sum] = "93da4e76cfda7ede8fd2df51b0021efd"
+SRC_URI[sha256sum] = "9c07c38d7de00046c9c52b12c76a2af7648b70d05bd5460c8b67f6895738653f"
+
+COMPATIBLE_MACHINE_armv7a = "(.*)"
+COMPATIBLE_MACHINE_aarch64 = "(.*)"
+COMPATIBLE_MACHINE_i386 = "(.*)"
+COMPATIBLE_MACHINE_x86-64 = "(.*)"
+COMPATIBLE_MACHINE_mips = "(.*)"
+COMPATIBLE_MACHINE_mips64 = "(.*)"
+
+EXTRA_OEMAKE_armv7a = "ARCH=arm"
+EXTRA_OEMAKE_aarch64 = "ARCH=arm64"
+EXTRA_OEMAKE_i386 = "ARCH=i386"
+EXTRA_OEMAKE_x86-64 = "ARCH=x86_64"
+EXTRA_OEMAKE_mips = "ARCH=mips"
+EXTRA_OEMAKE_mips64 = "ARCH=mips64"
+
+do_configure() {
+    :
+}
+
+do_compile() {
+    oe_runmake
+}
+
+do_install() {
+    oe_runmake install DESTDIR=${D} PREFIX=${prefix}
+}
-- 
2.14.1


