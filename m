Return-Path: <rapphil@gmail.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id 34A4571F2C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Dec 2014 01:23:25 +0000 (UTC)
Received: by mail-qg0-f43.google.com with SMTP id q108so2854988qgd.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Dec 2014 17:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=BKj5vtBSh2RomteIbmeL/+ZcILeJAmVynWIi7LJ+mdA=;
	b=ntcCixrT74TTYHFdFSw6eTPwXMKT2A4SlIAOBBaKHEhF5VXGEu88DOKqWLb4HEonlJ
	HEunKAxS8mXDbBWXE2bBDEYgxdgQzBtRo/EB4/WzjarNswOJ/HqMzO4VxDPpDJqg6/6T
	ErdNiNkApRZjNEyK/66zT7MBRVVMP3+awO942rmQRSEMLgn3zXrkOK00v1T7xwyc7jdB
	kU9zZTFhJt/lAAaFr5Y9fKQXT+bHEOSTxz4pjd+Nce2lGzr5kIN/Hs4u1OiKB+VB4yrh
	i0STykHBBcAN33V+XojLlfL140gTfsX9yijf574yme5kV1svus0aN+fUydfCRaeNPj73
	XY0A==
X-Received: by 10.224.97.72 with SMTP id k8mr19570885qan.46.1418001806381;
	Sun, 07 Dec 2014 17:23:26 -0800 (PST)
Received: from localhost.localdomain ([186.222.41.67])
	by mx.google.com with ESMTPSA id
	c75sm36514829qge.20.2014.12.07.17.23.24 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 07 Dec 2014 17:23:26 -0800 (PST)
From: Raphael Silva <rapphil@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  7 Dec 2014 23:23:16 -0200
Message-Id: <1418001796-7522-1-git-send-email-rapphil@gmail.com>
X-Mailer: git-send-email 2.2.0
Subject: [meta-oe][PATCH v2] libftdi: update to 1.1
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
X-List-Received-Date: Mon, 08 Dec 2014 01:23:27 -0000

Previous version was 0.19 but it had a failing recipe due to
the fact that libusb was not detect during do_configure.
This problem does not happen in version 1.1.

Signed-off-by: Mario Goulart <mario.goulart@gmail.com>
Signed-off-by: Raphael Silva <rapphil@gmail.com>
---
 .../libftdi/{libftdi_0.19.bb => libftdi_1.1.bb}    | 28 ++++++++++------------
 1 file changed, 13 insertions(+), 15 deletions(-)
 rename meta-oe/recipes-support/libftdi/{libftdi_0.19.bb => libftdi_1.1.bb} (29%)

diff --git a/meta-oe/recipes-support/libftdi/libftdi_0.19.bb b/meta-oe/recipes-support/libftdi/libftdi_1.1.bb
similarity index 29%
rename from meta-oe/recipes-support/libftdi/libftdi_0.19.bb
rename to meta-oe/recipes-support/libftdi/libftdi_1.1.bb
index 773b791..641e5a7 100644
--- a/meta-oe/recipes-support/libftdi/libftdi_0.19.bb
+++ b/meta-oe/recipes-support/libftdi/libftdi_1.1.bb
@@ -4,28 +4,26 @@ including the popular bitbang mode."
 HOMEPAGE = "http://www.intra2net.com/en/developer/libftdi/"
 SECTION = "libs"
 
-PR = "r1"
-
 LICENSE = "LGPLv2.1 GPLv2"
-LIC_FILES_CHKSUM= "file://COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe \
-                   file://COPYING.LIB;md5=db979804f025cf55aabec7129cb671ed \
+LIC_FILES_CHKSUM= "\
+    file://COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe \
+    file://COPYING.LIB;md5=db979804f025cf55aabec7129cb671ed \
 "
 
-PNBLACKLIST[libftdi] = "BROKEN: needs to be updated to detect libusb with pkg-config instead of libusb-config"
+DEPENDS = "libusb1"
 
-DEPENDS = "virtual/libusb0"
-DEPENDS_virtclass-native = "virtual/libusb0-native"
+SRC_URI = "http://www.intra2net.com/en/developer/${BPN}/download/${BPN}1-${PV}.tar.bz2"
 
-SRC_URI = "http://www.intra2net.com/en/developer/libftdi/download/libftdi-${PV}.tar.gz \
-           file://libtool-m4.patch \
-"
-SRC_URI[md5sum] = "e6e25f33b4327b1b7aa1156947da45f3"
-SRC_URI[sha256sum] = "567c9d2c42d92fc401c5aba2deed45ffb2433990984e816bcdf31e441aef06be"
+SRC_URI[md5sum] = "b79a6356978aa8e69f8eecc3a720ff79"
+SRC_URI[sha256sum] = "c0b1af1a13e2c6682a1d8041e5b164a1e0d90267cd378bb51e059bd62f821e21"
+
+S = "${WORKDIR}/${BPN}1-${PV}"
 
 PACKAGECONFIG ??= ""
-PACKAGECONFIG[cpp-wrapper] = "--enable-libftdipp,--disable-libftdipp,boost"
+PACKAGECONFIG[cpp-wrapper] = "-DFTDI_BUILD_CPP=on,-DFTDI_BUILD_CPP=off,boost"
 
-inherit autotools binconfig pkgconfig
+inherit cmake binconfig pkgconfig
 
-BBCLASSEXTEND = "native"
+FILES_${PN}-dev += "${libdir}/cmake"
 
+BBCLASSEXTEND = "native"
-- 
2.2.0


