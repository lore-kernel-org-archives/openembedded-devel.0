Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f178.google.com (mail-wr0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id AE18278447
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jan 2018 07:27:15 +0000 (UTC)
Received: by mail-wr0-f178.google.com with SMTP id e41so6533932wre.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jan 2018 23:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=30LSlwTKxBd9dl4iDglZB96K9bEYk7WxsK1HVzz3N5I=;
	b=WeFdrVNVmaU9cGCcMbzhyx+IpwCndh34HtL5w4EPFfSxFIjmVWOT5W4U3+vfTpRFNn
	MSON0DSYLrQvjhnICwPgmOf/4BhEafLs1uCcWzQsnjLgqNwSJSlW8cdjyPIxmVBw0F6Q
	GclPMR30VJcOUU5SaebuBfFFXvRIOqD7R8Quo4i5NCTiLqbI3yEWFeRIv8HkGQ8paS5/
	KfqAnN6OLYUKwrz1KHuxR+2dYPFiwq+Lc4qnbCIX3khluhjyh87Q2/e3JRSfRDa3Caq1
	LGFpoJhAn+SQ3lDc1QAex0t0oq61QCjkIR/J2K8LIq+xWQyU8olBVr9P7Xh7KTiSeGUh
	ml9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=30LSlwTKxBd9dl4iDglZB96K9bEYk7WxsK1HVzz3N5I=;
	b=RzZ9WQEU4YT00NAknWDOggvskjJbvUHf4d9eQBdtHlEO3vRjlk8C9D5Q9wXMc9UpUs
	Muk0vl5bmLkBOmcLuRs+0xQAaXTCcqLUWqmcA+yjXMGmh3yU7HSSOUZNNigjTVHXGWLX
	JYy2q/F0V30UkgM3E+IJbtvBI1kRbJm4Wa4vnDR1j1fGSCk1JE9oxDInN/UbvCl3aezT
	8ZBS4l+MSiN76pDJZRq0c46exzNC2CHvE8Sck/c1GnGgsvHFkoCNZqoEaw72G749lPX+
	bs4BXdweX+UKM0pgVsbFylfaAbU04JWQme2Eyb10k7uAehAJ2FR/Dd+YIGpWYJiC3U+n
	VGYA==
X-Gm-Message-State: AKwxyte4iRZghWG6RhqYmjeazBEVZfqbGS5TVq44LfpNbntOX8yCa4lY
	uTx1kuvF6s6P4UfUVTxfUC2ZQg==
X-Google-Smtp-Source: AH8x224hYZioHatq9+T2ai1sNObBOPPLJSvjfyU5NIMowrd/SRaZeGa8S8XwvsIkycsCXbkWufX28g==
X-Received: by 10.223.201.2 with SMTP id m2mr7240562wrh.264.1516865235986;
	Wed, 24 Jan 2018 23:27:15 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC194041E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:9404:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id w83sm559369wma.47.2018.01.24.23.27.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 24 Jan 2018 23:27:15 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Jan 2018 08:27:07 +0100
Message-Id: <20180125072707.3349-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
Subject: [PATCH][rocko][meta-qt5 V2] qwt-qt5: rewrite completely
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
X-List-Received-Date: Thu, 25 Jan 2018 07:27:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

commit 1be652e5075bf3c65b521093556e9611c4a57541 master.

* install pkgconfig
* fix examples
* DESCRIPTION -> SUMMARY
* overall cleanup

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---

V1 -> V2: Commit ID was incorrect (from my private work-branch)

 recipes-qt/qwt/qwt-qt5.inc                         | 48 ---------------
 ...h-from-binaries-they-point-to-buuild-area.patch | 69 ++++++++++++++++++++++
 recipes-qt/qwt/qwt-qt5/remove_rpath.patch          | 17 ------
 recipes-qt/qwt/qwt-qt5_6.1.3.bb                    | 45 +++++++++++++-
 4 files changed, 112 insertions(+), 67 deletions(-)
 delete mode 100644 recipes-qt/qwt/qwt-qt5.inc
 create mode 100644 recipes-qt/qwt/qwt-qt5/0001-Remove-rpath-from-binaries-they-point-to-buuild-area.patch
 delete mode 100644 recipes-qt/qwt/qwt-qt5/remove_rpath.patch

diff --git a/recipes-qt/qwt/qwt-qt5.inc b/recipes-qt/qwt/qwt-qt5.inc
deleted file mode 100644
index f3ece39..0000000
--- a/recipes-qt/qwt/qwt-qt5.inc
+++ /dev/null
@@ -1,48 +0,0 @@
-DESCRIPTION = "Qt Widget Extension for Technical Applications"
-SECTION = "libs"
-
-# LGPLv2.1 + some exceptions
-LICENSE = "QWTv1.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=dac2743472b0462ff3cfb4af42051c88"
-
-DEPENDS = "qtbase qtsvg qttools"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/qwt/qwt-${PV}.tar.bz2;name=qwt \
-           file://remove_rpath.patch \
-          "
-
-S = "${WORKDIR}/qwt-${PV}"
-
-do_configure_prepend() {
-    cd ${S}
-    sed -i -e 's:RELEASE_SUFFIX      = :RELEASE_SUFFIX      = ${QT_LIBINFIX}:' *.pri
-    sed -i -e 's:qtAddLibrary(qwt:qtAddLibrary(qwt)${QT_LIBINFIX}:g' *.prf
-    sed -e 's/# QWT_CONFIG     += QwtExamples/QWT_CONFIG     += QwtExamples/g' -i qwtconfig.pri
-    sed -i -e 's:/usr/local/qwt-$$QWT_VERSION:${D}${prefix}:g' ${S}/*.pri
-}
-
-do_install() {
-    cd ${S}
-    oe_runmake -e install
-#    install -d ${D}${datadir}/doc/${PN}
-#    mv ${D}${prefix}/doc/* ${D}${datadir}/doc/${PN}/
-#    rmdir ${D}${prefix}/doc
-#    cd ${S}/examples
-#    install -d ${D}/${bindir}
-#    cd bin${QT_LIBINFIX}/
-#    for i in * ; do
-#        cp -pPR ${i} ${D}/${bindir}/${i}${QT_LIBINFIX}
-#    done
-#    install -d ${D}${libdir}/${QT_DIR_NAME}
-#    mv ${D}${prefix}/plugins ${D}${libdir}/${QT_DIR_NAME}
-}
-
-PACKAGES_prepend = "${PN}-examples ${PN}-features ${PN}-plugins "
-FILES_${PN}-examples = "${bindir}/*"
-FILES_${PN}-features = "${prefix}/features"
-FILES_${PN}-plugins = "${prefix}/plugins/designer/*.so"
-FILES_${PN}-dbg += "${prefix}/plugins/designer/.debug"
-FILES_${PN}-doc += "${prefix}/doc"
-
-INSANE_SKIP_${PN}-plugins += "libdir"
-INSANE_SKIP_${PN}-dbg += "libdir"
diff --git a/recipes-qt/qwt/qwt-qt5/0001-Remove-rpath-from-binaries-they-point-to-buuild-area.patch b/recipes-qt/qwt/qwt-qt5/0001-Remove-rpath-from-binaries-they-point-to-buuild-area.patch
new file mode 100644
index 0000000..fa63c34
--- /dev/null
+++ b/recipes-qt/qwt/qwt-qt5/0001-Remove-rpath-from-binaries-they-point-to-buuild-area.patch
@@ -0,0 +1,69 @@
+From ff950c71bf841a4d62952aac72f3c5a830cf9cff Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Wed, 29 Nov 2017 22:31:07 +0100
+Subject: [PATCH] Remove rpath from binaries - they point to buuild area
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This is a rework of the patch submitted by Khem Raj.
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ designer/designer.pro     | 1 -
+ examples/examples.pri     | 1 -
+ playground/playground.pri | 1 -
+ qwt.prf                   | 1 -
+ 4 files changed, 4 deletions(-)
+
+diff --git a/designer/designer.pro b/designer/designer.pro
+index 7d44a44..a11847d 100644
+--- a/designer/designer.pro
++++ b/designer/designer.pro
+@@ -83,7 +83,6 @@ contains(QWT_CONFIG, QwtDesigner) {
+         # compile the path for finding the Qwt library
+         # into the plugin. Not supported on Windows !
+ 
+-        QMAKE_RPATHDIR *= $${QWT_INSTALL_LIBS}
+         qwtAddLibrary($${QWT_OUT_ROOT}/lib, qwt)
+ 
+         contains(QWT_CONFIG, QwtDll) {
+diff --git a/examples/examples.pri b/examples/examples.pri
+index 200b188..b7776a8 100644
+--- a/examples/examples.pri
++++ b/examples/examples.pri
+@@ -34,7 +34,6 @@ else {
+     }
+ }
+ 
+-QMAKE_RPATHDIR *= $${QWT_OUT_ROOT}/lib
+ qwtAddLibrary($${QWT_OUT_ROOT}/lib, qwt)
+ 
+ greaterThan(QT_MAJOR_VERSION, 4) {
+diff --git a/playground/playground.pri b/playground/playground.pri
+index c544360..fd0275f 100644
+--- a/playground/playground.pri
++++ b/playground/playground.pri
+@@ -35,7 +35,6 @@ else {
+ }
+ 
+ 
+-QMAKE_RPATHDIR *= $${QWT_ROOT}/lib
+ qwtAddLibrary($${QWT_OUT_ROOT}/lib, qwt)
+ 
+ greaterThan(QT_MAJOR_VERSION, 4) {
+diff --git a/qwt.prf b/qwt.prf
+index 2625b31..7860153 100644
+--- a/qwt.prf
++++ b/qwt.prf
+@@ -33,5 +33,4 @@ else {
+     INCLUDEPATH *= $${QWT_INSTALL_HEADERS}
+ }   
+ 
+-# QMAKE_RPATHDIR *= $${QWT_INSTALL_LIBS}
+ qwtAddLibrary($${QWT_INSTALL_LIBS}, qwt)
+-- 
+2.9.5
+
diff --git a/recipes-qt/qwt/qwt-qt5/remove_rpath.patch b/recipes-qt/qwt/qwt-qt5/remove_rpath.patch
deleted file mode 100644
index 14b65d6..0000000
--- a/recipes-qt/qwt/qwt-qt5/remove_rpath.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Remove rpath from library, it points to build area which is not
-ok
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: qwt-6.1.3/designer/designer.pro
-===================================================================
---- qwt-6.1.3.orig/designer/designer.pro
-+++ qwt-6.1.3/designer/designer.pro
-@@ -83,7 +83,6 @@ contains(QWT_CONFIG, QwtDesigner) {
-         # compile the path for finding the Qwt library
-         # into the plugin. Not supported on Windows !
- 
--        QMAKE_RPATHDIR *= $${QWT_INSTALL_LIBS}
-         qwtAddLibrary($${QWT_OUT_ROOT}/lib, qwt)
- 
-         contains(QWT_CONFIG, QwtDll) {
diff --git a/recipes-qt/qwt/qwt-qt5_6.1.3.bb b/recipes-qt/qwt/qwt-qt5_6.1.3.bb
index 626bd0a..1c6e10b 100644
--- a/recipes-qt/qwt/qwt-qt5_6.1.3.bb
+++ b/recipes-qt/qwt/qwt-qt5_6.1.3.bb
@@ -1,8 +1,49 @@
-inherit qmake5
+SUMMARY = "Qt Widget Extension for Technical Applications"
+SECTION = "libs"
+HOMEPAGE = "http://qwt.sourceforge.net/index.html"
+
+# LGPLv2.1 + some exceptions
+LICENSE = "QWTv1.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=dac2743472b0462ff3cfb4af42051c88"
+
+DEPENDS = "qtbase qtsvg qttools"
 
-require qwt-qt5.inc
+inherit qmake5
 
+SRC_URI = " \
+    ${SOURCEFORGE_MIRROR}/qwt/qwt-${PV}.tar.bz2;name=qwt \
+    file://0001-Remove-rpath-from-binaries-they-point-to-buuild-area.patch \
+"
 SRC_URI[qwt.md5sum] = "19d1f5fa5e22054d22ee3accc37c54ba"
 SRC_URI[qwt.sha256sum] = "f3ecd34e72a9a2b08422fb6c8e909ca76f4ce5fa77acad7a2883b701f4309733"
 
+S = "${WORKDIR}/qwt-${PV}"
+
+EXTRA_QMAKEVARS_PRE += " \
+    QWT_CONFIG+=QwtPkgConfig \
+    QWT_CONFIG+=QwtExamples \
+"
+
+do_configure_prepend() {
+    sed -i 's:/usr/local/qwt-$$QWT_VERSION:${prefix}:' ${S}/*.pri
+}
+
+do_install_append() {
+    # seems out of tree build confuses installation of examples
+    # so install them manually
+    install -d ${D}${bindir}/
+    cp ${B}/examples/bin/* ${D}${bindir}/
+}
+
+
+PACKAGES_prepend = "${PN}-examples ${PN}-features ${PN}-plugins "
+FILES_${PN}-examples = "${bindir}/*"
+FILES_${PN}-features = "${prefix}/features"
+FILES_${PN}-plugins = "${prefix}/plugins/designer/*.so"
+FILES_${PN}-dbg += "${prefix}/plugins/designer/.debug"
+FILES_${PN}-doc += "${prefix}/doc"
+
+INSANE_SKIP_${PN}-plugins += "libdir"
+INSANE_SKIP_${PN}-dbg += "libdir"
+
 RPROVIDES_${PN}-dev = "libqwt-qt5-dev"
-- 
2.14.3


