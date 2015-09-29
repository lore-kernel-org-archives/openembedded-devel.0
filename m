Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 9F38B60232
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Sep 2015 15:43:44 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so156922659wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Sep 2015 08:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=tLaq3hzOBPePK1zrtu/BMZHefrAPg/qu7rqNEB9vyqA=;
	b=lPLXx1B2iJ3vs12rD0vo3PINcAVCw8rqPlsYrVnjQ+62QAGOohdjlWbmcDZtN4F3Nn
	a7ADKfSQQ/AKG67kIkN/PJ3+xtIKQzW+ndDpxYT9BEMGmUjm8sisTDpj2XEYU9kQ+hs/
	kC98tIrydEtwfdgjpLCPPGU5B1EcNx++ut3rw7GkPrTIq2PimWiqbsBwvgiip4DxxWTH
	WcNm5D9ugWyTbjG0Hh+Vx+Tg0kzM9sbyXT8G9Rio6Ml/osgIUdTrGOm2J5KH/pSisy+K
	Cjc9b6pmjYAH9CieJYh2ktjURojiqRDoWic/mVCE8WMQqvAyiHuLLZjn8/JeTcxEgN1E
	djkA==
X-Received: by 10.180.88.4 with SMTP id bc4mr28230065wib.68.1443541424087;
	Tue, 29 Sep 2015 08:43:44 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id p1sm24494217wif.7.2015.09.29.08.43.42
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Sep 2015 08:43:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Sep 2015 17:44:19 +0200
Message-Id: <1443541459-3591-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.0
Subject: [PATCH][meta-qt5] qmake5_paths, qtbase: add OE_QMAKE_PATH_QT_FONTS
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
X-List-Received-Date: Tue, 29 Sep 2015 15:43:47 -0000

* people using fontconfig may want to change this path to
  ${datadir}/fonts, it was set to OE_QMAKE_PATH_LIBS in
  commit 1fdab229df6000eb52ac721a3ff4cdd218a0c308
  to follow mkspecs/features/qpa/genericunixfontdatabase.prf
  fonts.path = $$[QT_INSTALL_LIBS]/fonts

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 classes/qmake5_paths.bbclass |  2 ++
 recipes-qt/qt5/qtbase_git.bb | 24 ++++++++++++------------
 2 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/classes/qmake5_paths.bbclass b/classes/qmake5_paths.bbclass
index 90e1789..6f2c25f 100644
--- a/classes/qmake5_paths.bbclass
+++ b/classes/qmake5_paths.bbclass
@@ -47,3 +47,5 @@ OE_QMAKE_PATH_QT_DOCS = "${docdir}${QT_DIR_NAME}"
 OE_QMAKE_PATH_QT_SETTINGS = "${sysconfdir}${QT_DIR_NAME}"
 OE_QMAKE_PATH_QT_EXAMPLES = "${datadir}${QT_DIR_NAME}/examples"
 OE_QMAKE_PATH_QT_TESTS = "${datadir}${QT_DIR_NAME}/tests"
+
+OE_QMAKE_PATH_QT_FONTS = "${OE_QMAKE_PATH_LIBS}/fonts"
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 63f52f4..39d02a9 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -226,10 +226,10 @@ do_install_append() {
     ### Fix up the binaries to the right location
     ### TODO: FIX
     # install fonts manually if they are missing
-    if [ ! -d ${D}/${OE_QMAKE_PATH_LIBS}/fonts ]; then
-        mkdir -p ${D}/${OE_QMAKE_PATH_LIBS}/fonts
-        cp -a ${S}/lib/fonts/* ${D}/${OE_QMAKE_PATH_LIBS}/fonts
-        chown -R root:root ${D}/${OE_QMAKE_PATH_LIBS}/fonts
+    if [ ! -d ${D}/${OE_QMAKE_PATH_QT_FONTS} ]; then
+        mkdir -p ${D}/${OE_QMAKE_PATH_QT_FONTS}
+        cp -a ${S}/lib/fonts/* ${D}/${OE_QMAKE_PATH_QT_FONTS}
+        chown -R root:root ${D}/${OE_QMAKE_PATH_QT_FONTS}
     fi
     cp -a ${B}/lib/libqt* ${D}${libdir}
     # Remove example.pro file as it is useless
@@ -264,19 +264,19 @@ RRECOMMENDS_${PN}-fonts = " \
 
 ALLOW_EMPTY_${PN}-fonts = "1"
 
-FILES_${PN}-fonts-ttf-vera       = "${OE_QMAKE_PATH_LIBS}/fonts/Vera*.ttf"
-FILES_${PN}-fonts-ttf-dejavu     = "${OE_QMAKE_PATH_LIBS}/fonts/DejaVu*.ttf"
-FILES_${PN}-fonts-pfa            = "${OE_QMAKE_PATH_LIBS}/fonts/*.pfa"
-FILES_${PN}-fonts-pfb            = "${OE_QMAKE_PATH_LIBS}/fonts/*.pfb"
-FILES_${PN}-fonts-qpf            = "${OE_QMAKE_PATH_LIBS}/fonts/*.qpf*"
-FILES_${PN}-fonts                = "${OE_QMAKE_PATH_LIBS}/fonts/README \
-                                    ${OE_QMAKE_PATH_LIBS}/fonts/fontdir"
+FILES_${PN}-fonts-ttf-vera       = "${OE_QMAKE_PATH_QT_FONTS}/Vera*.ttf"
+FILES_${PN}-fonts-ttf-dejavu     = "${OE_QMAKE_PATH_QT_FONTS}/DejaVu*.ttf"
+FILES_${PN}-fonts-pfa            = "${OE_QMAKE_PATH_QT_FONTS}/*.pfa"
+FILES_${PN}-fonts-pfb            = "${OE_QMAKE_PATH_QT_FONTS}/*.pfb"
+FILES_${PN}-fonts-qpf            = "${OE_QMAKE_PATH_QT_FONTS}/*.qpf*"
+FILES_${PN}-fonts                = "${OE_QMAKE_PATH_QT_FONTS}/README \
+                                    ${OE_QMAKE_PATH_QT_FONTS}/fontdir"
 
 RRECOMMENDS_${PN}-plugins += "${@base_contains('DISTRO_FEATURES', 'x11', 'libx11-locale', '', d)}"
 
 sysroot_stage_dirs_append() {
     # $to is 2nd parameter passed to sysroot_stage_dir, e.g. ${SYSROOT_DESTDIR} passed from sysroot_stage_all
-    rm -rf $to${OE_QMAKE_PATH_LIBS}/fonts
+    rm -rf $to${OE_QMAKE_PATH_QT_FONTS}
 }
 
 SRCREV = "c619d2daac9b1f61e8ad2320b59c648b6af6af90"
-- 
2.6.0


