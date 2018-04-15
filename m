Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 3EA9074512
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Apr 2018 14:15:49 +0000 (UTC)
Received: from localhost.localdomain (62-178-50-190.cable.dynamic.surfer.at
	[62.178.50.190]) by ptmx.org (Postfix) with ESMTPSA id 464AE3F3E6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Apr 2018 16:15:50 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 Apr 2018 16:15:25 +0200
Message-Id: <20180415141526.13306-1-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.14.1
Subject: [meta-multimedia][PATCH] libde265: add recipe
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

libde265 is an open source implementation of the h.265 video codec.

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 .../recipes-multimedia/libde265/libde265_1.0.2.bb    | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/libde265/libde265_1.0.2.bb

diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.2.bb b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.2.bb
new file mode 100644
index 000000000..cd075ffe1
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.2.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "libde265 is an open source implementation of the h.265 \
+video codec. It is written from scratch and has a plain C API to enable a \
+simple integration into other software."
+HOMEPAGE = "http://www.libde265.org/"
+SECTION = "libs/multimedia"
+
+LICENSE = "LGPLv3"
+LICENSE_FLAGS = "commercial"
+LIC_FILES_CHKSUM = "file://COPYING;md5=852f345c1c52c9160f9a7c36bb997546"
+
+SRC_URI = "https://github.com/strukturag/libde265/releases/download/v${PV}/${BPN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "93520b378df25f3a94e962f2b54872cc"
+SRC_URI[sha256sum] = "eaa0348839c2935dd90647d72c6dd4a043e36361cb3c33d2b04df10fbcebd3cb"
+
+EXTRA_OECONF = "--disable-sherlock265 --disable-dec265"
+
+inherit autotools-brokensep pkgconfig
+
+PACKAGES =+ "${PN}-tools"
+FILES_${PN}-tools = "${bindir}/*"
-- 
2.14.1


