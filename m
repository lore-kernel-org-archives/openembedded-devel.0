Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id A9A667210A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 May 2015 21:14:24 +0000 (UTC)
Received: by wgme6 with SMTP id e6so12548813wgm.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 May 2015 14:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=rObj0wxrb+YoO9F1KsMat5W+cArCH4oWAkAti6Qau74=;
	b=dJkR2pmw7tlD0uYx6jzGGq756aAcQwo9VUDY2VRIcNBN7CnsPC749xlBRi9q6FQeSf
	rWCUmLigqcA2Zbq7JXcajii0hQrCXjpj399of1gs7hrDzZlbXwdfQ10YizbUzunMmvjW
	zCTGZ5PI1DpHPMGmSBCicNZv1nBR3y5Xdl0dHv4tfn1IWXEzXkZl7MAhdccucN6UECzg
	wUsW1MTPZyyHqT1JVYqeRc4TjDNAJfqTYu8hX3iwxcupQOHkhwvr1LWiMIenas67BDzS
	+nx9yP840VvLyRIK17/NDFuYpICUG+WHXwwwBnF0qIrbb75XlLcDJsD50oRj+0ty71bS
	xF8g==
X-Received: by 10.180.206.45 with SMTP id ll13mr25648905wic.94.1432588465750; 
	Mon, 25 May 2015 14:14:25 -0700 (PDT)
Received: from localhost.localdomain (p5B0A35C6.dip0.t-ipconnect.de.
	[91.10.53.198])
	by mx.google.com with ESMTPSA id 16sm18515406wjs.41.2015.05.25.14.14.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 May 2015 14:14:23 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 May 2015 23:13:58 +0200
Message-Id: <1432588449-31413-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1432588449-31413-1-git-send-email-schnitzeltony@googlemail.com>
References: <1432588449-31413-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 01/12] fontforge: add 20141126
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
X-List-Received-Date: Mon, 25 May 2015 21:14:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Have this recipe in my meta-qt5-extra but would be happy to get it under the
hood of Martin's world.

It started with the native part to build kde's oxygen-fonts but maybe somebody
likes to have it on target.

Tested native part by gazillions of builds / target part in xfce environment.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../fontforge/fontforge_20141126.bb                | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge_20141126.bb

diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20141126.bb b/meta-oe/recipes-graphics/fontforge/fontforge_20141126.bb
new file mode 100644
index 0000000..72020db
--- /dev/null
+++ b/meta-oe/recipes-graphics/fontforge/fontforge_20141126.bb
@@ -0,0 +1,41 @@
+SUMMARY = "A font editor"
+HOMEPAGE = "http://fontforge.github.io/en-US/"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = " \
+    file://COPYING.gplv3;md5=d32239bcb673463ab874e80d47fae504 \
+    file://LICENSE;md5=71d636ba7678baa1573e1b531041386e \
+"
+
+inherit autotools pkgconfig pythonnative
+
+DEPENDS = "glib-2.0 pango giflib tiff libxml2 jpeg python libtool"
+DEPENDS_append_class-target = " libxi"
+
+SRC_URI = "https://github.com/${BPN}/${BPN}/archive/${PV}.tar.gz"
+SRC_URI[md5sum] = "0d6f5112c4e5689087339a94aceadf77"
+SRC_URI[sha256sum] = "9c90c640023463c0b2b97b87575a014fcf44f688c3763f4cd136d3c267092106"
+
+EXTRA_OECONF_append_class-native = " with_x=no --disable-python-extension --disable-python-scripting"
+
+do_configure_prepend() {
+    currdir=`pwd`
+    cd ${S}
+    ./bootstrap --force
+    cd $currdir
+}
+
+EXTRA_OEMAKE = "CFLAGS='${CFLAGS} -I${B}/uthash/src'"
+
+PACKAGES =+ "${PN}-python-dbg ${PN}-python"
+
+FILES_${PN} += " \
+    ${datadir}/mime \
+    ${datadir}/icons \
+"
+
+FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR} ${datadir}/${PN}/python"
+FILES_${PN}-python-dbg = "${PYTHON_SITEPACKAGES_DIR}/.debug"
+RDEPENDS_${PN}-python = "python"
+
+# for e.g kde's oxygen-fonts
+BBCLASSEXTEND = "native"
-- 
1.9.3


