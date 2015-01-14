Return-Path: <armccurdy@gmail.com>
Received: from mail-ie0-f170.google.com (mail-ie0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 114CA65C7B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Jan 2015 00:28:16 +0000 (UTC)
Received: by mail-ie0-f170.google.com with SMTP id rd18so6094764iec.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Jan 2015 16:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=wbpZOJh1LIrmeM8w0KmCyI8VVEf7PUdg4cvaCIzv/+s=;
	b=iOi021AW6xngfTaHCmq6+a28Qr8R1oyZIeAf0PoOwJ/j0Svyq9sKSKQ0unS5i4PNXr
	1uZFyNUaE50HFGyISdJDAGdaMGo3nAKSRgfsjxKVTM5da+rBClAFpc6NCztBEdBAquD3
	q+pW/+P2V7HBxs4Ut0/JiJHFwC/yiRoN0/5eVkNujvDGCbHirEeiuRDh7hRiuVTDYH94
	NyW5pNljPa4VMG2UbHu6ROZq1kQV9E7YL2iYVVOWJ4Yvgs/OMgYeFrvSCsy4dm/3ku5x
	p4useby3ic+wRj0AVJH7KZ0LN/cb/IA0xeaU51GdtzbYz3gErjQZr/5QHR7q1d+DyVaF
	Y8ng==
X-Received: by 10.42.107.13 with SMTP id b13mr2021284icp.69.1421195297488;
	Tue, 13 Jan 2015 16:28:17 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id cl9sm7057154igb.0.2015.01.13.16.28.16
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 13 Jan 2015 16:28:17 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Jan 2015 16:27:47 -0800
Message-Id: <1421195267-31171-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] libjpeg-turbo: update 1.3.1 -> 1.4.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Jan 2015 00:28:26 -0000

The LIC_FILES_CHKSUM updates are needed to account for minor
formatting changes and the addition of 2014 to copyright notices.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../recipes-core/jpeg/libjpeg-turbo_8d+1.3.1.bb    | 39 ----------------------
 .../recipes-core/jpeg/libjpeg-turbo_8d+1.4.0.bb    | 39 ++++++++++++++++++++++
 2 files changed, 39 insertions(+), 39 deletions(-)
 delete mode 100644 meta-oe/recipes-core/jpeg/libjpeg-turbo_8d+1.3.1.bb
 create mode 100644 meta-oe/recipes-core/jpeg/libjpeg-turbo_8d+1.4.0.bb

diff --git a/meta-oe/recipes-core/jpeg/libjpeg-turbo_8d+1.3.1.bb b/meta-oe/recipes-core/jpeg/libjpeg-turbo_8d+1.3.1.bb
deleted file mode 100644
index 6a09fda..0000000
--- a/meta-oe/recipes-core/jpeg/libjpeg-turbo_8d+1.3.1.bb
+++ /dev/null
@@ -1,39 +0,0 @@
-DESCRIPTION = "libjpeg-turbo is a derivative of libjpeg that uses SIMD instructions (MMX, SSE2, NEON) to accelerate baseline JPEG compression and decompression"
-HOMEPAGE = "http://libjpeg-turbo.org/"
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://cdjpeg.h;endline=12;md5=78fa8dbac547bb5b2a0e6457a6cfe21d \
-                    file://jpeglib.h;endline=14;md5=a08bb0a80f782a9f8da313cc4015ed6f \
-                    file://djpeg.c;endline=9;md5=7629c51aed78174711c20a40194a8f1b \
-"
-
-BASEPV = "${@d.getVar('PV',True).split('+')[1]}"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${BASEPV}.tar.gz"
-SRC_URI[md5sum] = "2c3a68129dac443a72815ff5bb374b05"
-SRC_URI[sha256sum] = "c132907417ddc40ed552fe53d6b91d5fecbb14a356a60ddc7ea50d6be9666fb9"
-
-S = "${WORKDIR}/${BPN}-${BASEPV}"
-
-# Drop-in replacement for jpeg
-PROVIDES = "jpeg"
-RPROVIDES_${PN} += "jpeg"
-RREPLACES_${PN} += "jpeg"
-RCONFLICTS_${PN} += "jpeg"
-
-inherit autotools pkgconfig
-
-EXTRA_OECONF = "--with-jpeg8 "
-
-PACKAGES =+ "jpeg-tools libturbojpeg"
-
-DESCRIPTION_jpeg-tools = "The jpeg-tools package includes client programs to access libjpeg functionality.  These tools allow for the compression, decompression, transformation and display of JPEG files and benchmarking of the libjpeg library."
-FILES_jpeg-tools = "${bindir}/*"
-
-FILES_libturbojpeg = "${libdir}/libturbojpeg.so"
-INSANE_SKIP_libturbojpeg = "dev-so"
-
-BBCLASSEXTEND = "native"
-DEPENDS = "nasm-native"
-
-LEAD_SONAME = "libjpeg.so.8"
diff --git a/meta-oe/recipes-core/jpeg/libjpeg-turbo_8d+1.4.0.bb b/meta-oe/recipes-core/jpeg/libjpeg-turbo_8d+1.4.0.bb
new file mode 100644
index 0000000..8e214c9
--- /dev/null
+++ b/meta-oe/recipes-core/jpeg/libjpeg-turbo_8d+1.4.0.bb
@@ -0,0 +1,39 @@
+DESCRIPTION = "libjpeg-turbo is a derivative of libjpeg that uses SIMD instructions (MMX, SSE2, NEON) to accelerate baseline JPEG compression and decompression"
+HOMEPAGE = "http://libjpeg-turbo.org/"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://cdjpeg.h;endline=12;md5=cad955d15145c3fdceec6855e078e953 \
+                    file://jpeglib.h;endline=14;md5=dfc803dc51ae21178d1376ec73c4454d \
+                    file://djpeg.c;endline=9;md5=e93a8f2061e8a0ac71c7a485c10489e2 \
+"
+
+BASEPV = "${@d.getVar('PV',True).split('+')[1]}"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${BASEPV}.tar.gz"
+SRC_URI[md5sum] = "039153dabe61e1ac8d9323b5522b56b0"
+SRC_URI[sha256sum] = "d93ad8546b510244f863b39b4c0da0fa4c0d53a77b61a8a3880f258c232bbbee"
+
+S = "${WORKDIR}/${BPN}-${BASEPV}"
+
+# Drop-in replacement for jpeg
+PROVIDES = "jpeg"
+RPROVIDES_${PN} += "jpeg"
+RREPLACES_${PN} += "jpeg"
+RCONFLICTS_${PN} += "jpeg"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF = "--with-jpeg8 "
+
+PACKAGES =+ "jpeg-tools libturbojpeg"
+
+DESCRIPTION_jpeg-tools = "The jpeg-tools package includes client programs to access libjpeg functionality.  These tools allow for the compression, decompression, transformation and display of JPEG files and benchmarking of the libjpeg library."
+FILES_jpeg-tools = "${bindir}/*"
+
+FILES_libturbojpeg = "${libdir}/libturbojpeg.so"
+INSANE_SKIP_libturbojpeg = "dev-so"
+
+BBCLASSEXTEND = "native"
+DEPENDS = "nasm-native"
+
+LEAD_SONAME = "libjpeg.so.8"
-- 
1.9.1


