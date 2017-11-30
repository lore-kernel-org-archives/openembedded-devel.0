Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1867F60017
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Nov 2017 08:10:36 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id b76so10680833wmg.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Nov 2017 00:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7DtJhKI12jB9jr4dV4JlyLxE2gqtUHo9NfZ+815AFY8=;
	b=hSUv7lWIbiR+mSU0Hxxd4MX4SNkYMkX1K20okw4XdivUOEHcQtErfhG8J+gIwR+P3B
	u9PSafxfxLGnalnA1Pj/W3oNC67TEx/zhQhjgoNBqrpVj3x1ZdSIeI3pPkNcgIUlZYdJ
	p4847jGm9NOJu8sdg2q7hP3Uq0fEKADtZFt9+ctxSi/pSnuKG0tZn71/zHo5aDQPWD0+
	RDLeMGmchpAG8WoX0nZ7/vj5Hygw1nppNZy58a7nFkFdIXtNN0CX+6T0voAw88aMCHTH
	0LOUiLwoL8+4lwEQOukodGnXcdPNDhsxqmXhJxDVatHs4n32v8HtmaR6mOd3wLJviNx/
	AgYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7DtJhKI12jB9jr4dV4JlyLxE2gqtUHo9NfZ+815AFY8=;
	b=rhkUtAykQ1taGDtHuONLOn/4vFqEF1IuTXtGFdZV6Hzg6d9RuxKdTcbNjePIEFSNJj
	MP+Vgv9SkPmrnGVtQQe9DX3gEXgiPXGajaRImwoInsxzOzH/qxqR9fAt1Q9+HU89m24R
	sCDX1FlSC9SgJDAeDiBw9rk1U0rZ4yW59fekENJsEcPKv957F8onBOCYCnfuMQGtEeVY
	fEm6jVDGX7iPhuy58GAXSYq8R5jnevjUipUonMft68odAhWQz1hLT/DNw/JH1s/K1aaU
	fPUoCfmQ85AQGo10Jfwidk2KXdyuJPXFJ95MDTZQe1wZaCGvHz33hGBzpHqo6/IQUa+t
	ApXw==
X-Gm-Message-State: AJaThX4MlzOVpT0iUPzw634YeTFeU7tb1l7kepI88/V+Dp8xzLfZ/uAi
	6nysoQVX1yLEWxjCoqQzTP/NPQ==
X-Google-Smtp-Source: AGs4zMbHGyBqxpBKpDnUpzeGXV35RRg9wfdijZ7EqzTdZwrt/erIo3cKlITLJ9lqaWWnzOtMoomUTg==
X-Received: by 10.28.178.85 with SMTP id b82mr1074390wmf.47.1512029436918;
	Thu, 30 Nov 2017 00:10:36 -0800 (PST)
Received: from mueller-a-nb-linux.zera.local
	(ip-88-152-111-130.hsi03.unitymediagroup.de. [88.152.111.130])
	by smtp.gmail.com with ESMTPSA id
	192sm4336818wmg.32.2017.11.30.00.10.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Nov 2017 00:10:36 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 Nov 2017 09:10:26 +0100
Message-Id: <20171130081026.25414-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.9.5
MIME-Version: 1.0
Subject: [meta-qt5][PATCH] qwt-qt5: rewrite completely
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
X-List-Received-Date: Thu, 30 Nov 2017 08:10:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* install pkgconfig
* fix examples
* DESCRIPTION -> SUMMARY
* overall cleanup

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
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
2.9.5


