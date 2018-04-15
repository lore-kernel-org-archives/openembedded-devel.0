Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 3EE3574519
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Apr 2018 14:15:49 +0000 (UTC)
Received: from localhost.localdomain (62-178-50-190.cable.dynamic.surfer.at
	[62.178.50.190]) by ptmx.org (Postfix) with ESMTPSA id 8EC64C080F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Apr 2018 16:15:50 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 Apr 2018 16:15:26 +0200
Message-Id: <20180415141526.13306-2-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180415141526.13306-1-dv@pseudoterminal.org>
References: <20180415141526.13306-1-dv@pseudoterminal.org>
Subject: [meta-multimedia][PATCH] tinyalsa: add recipe
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
X-List-Received-Date: Sun, 15 Apr 2018 14:15:50 -0000

TinyALSA is a small library to interface with ALSA in the Linux kernel.

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 .../recipes-multimedia/tinyalsa/tinyalsa_1.1.1.bb  | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa_1.1.1.bb

diff --git a/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa_1.1.1.bb b/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa_1.1.1.bb
new file mode 100644
index 000000000..fa5449ff6
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa_1.1.1.bb
@@ -0,0 +1,28 @@
+DESCRIPTION = "TinyALSA is a small library to interface with ALSA in \
+the Linux kernel. It is a lightweight alternative to libasound."
+HOMEPAGE = "https://github.com/tinyalsa/tinyalsa"
+SECTION = "libs/multimedia"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://NOTICE;md5=dbdefe400d894b510a9de14813181d0b"
+
+SRC_URI = "https://github.com/tinyalsa/tinyalsa/archive/${PV}.tar.gz"
+SRC_URI[md5sum] = "ec5c1cc175fcb8c9d3d0adcececf10a9"
+SRC_URI[sha256sum] = "d92b438cea348ae316c4b2cbf367b4f01ed821a947e6a34d813624e9e3c936c1"
+
+do_configure() {
+    :
+}
+
+do_compile() {
+    oe_runmake CC='${CC}' LD='${CC}' AR='${AR}'
+}
+
+do_install() {
+    oe_runmake install \
+        PREFIX="${prefix}" DESTDIR="${D}" INCDIR="${includedir}/tinyalsa" \
+        LIBDIR="${libdir}" BINDIR="${bindir}" MANDIR="${mandir}"
+}
+
+PACKAGES =+ "${PN}-tools"
+FILES_${PN}-tools = "${bindir}/*"
-- 
2.14.1


