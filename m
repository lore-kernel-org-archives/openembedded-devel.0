Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 935CC71993
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Feb 2017 06:26:25 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id 196so55483957wmm.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2017 22:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2hlD1GXH02K2erTXNDjIu5LgBXF96b60uybxUf8c3FQ=;
	b=tLyOMQomsUREVH4XiZtor8nLk2Abo34asoHMX3JfOiKdBbr7OTBK1OgvsKCevOCB9v
	ZcbvWi8e2Xi4+TeW/i1b73deVlVTcfOYFAstGObnlkUw8bNMH+hZNhoSeXphaZ3i2Vzi
	yGJy66a3Q6YPutcN8ldTJWcV9SyoGYdHQwhceYYhKPjkZ3TNDVSfv0ecrHtSDcmRGQih
	W2CER/Ds0j01ODIar/BkCfen3SRxj3Q6UIVVZ8KkYottXUiZPegDhDCI3QtPwHtu9QBw
	n97c3f8pv593Ys1r79XBEKRyhj1JBxRpHZfKjbP4GMLQFOTt0GP+v6rbsWMVBsHv4tFh
	jShA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2hlD1GXH02K2erTXNDjIu5LgBXF96b60uybxUf8c3FQ=;
	b=cV9yZmUcgEF/obpII3FOki/jElxUA6apw3JxyI6AB6CB4y0suRiQCSe8sXe+eauMvN
	dlYL3hGgN5A2iHh3vs4FdgR0TjZMmnm3SbgArat2UjfPLA/M+mdQZU38GyWPa2UOqN3r
	OPfhZzEHtml0BQyQU7xaAEpxsP40vL/NvpJfISWTrW1D9L6GuVGv7DqSxeHMhfmVRWug
	ppyGVmNfm32rmgn0ZM5f0F0pdsNRmX21mA3WyBuF2qkXC3L+1+31pOC04hsDh1AyeLV0
	rhjECxIDHt+Zyk7w/16G6ZFUKTAzV5vwnhstfLYibIdqmW72shKpJc0GHxTic5x5+NzG
	0Blw==
X-Gm-Message-State: AMke39m+eFnvwG1OI9a0JpVHgAyjjOoxYlx4lOz4c8/vili798VX04BMoQJoiXkhxxjxXQ==
X-Received: by 10.28.132.9 with SMTP id g9mr1480125wmd.28.1486621584599;
	Wed, 08 Feb 2017 22:26:24 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E91173331E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:7333:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	198sm7100600wmn.11.2017.02.08.22.26.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Feb 2017 22:26:23 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Feb 2017 07:26:09 +0100
Message-Id: <20170209062609.1132-1-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [meta-qt5][PATCH] qmake5_base.bbclass: set qt.conf by environment variable again
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
X-List-Received-Date: Thu, 09 Feb 2017 06:26:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Qt update to 5.8 caused fallout in meta-qt5-extra. It turned out that
qmake pulled in many pointers to native sysroot. Native sysroot is qmake's
default in case no configuration file qt.conf is set.
The problem with the new way of setting qt.conf by cmd parameter is that is has
to be set explicitly. For instance all the packages coming from [1] use
autotools for configuration. These ask qmake for paths during configuration
and build further Makefiles during compile. To patch these for additional cmd
parameter is nasty business.
Setting qt.conf when building all qtbase's causes errors during configuration.
To fix this we set the filename to a non existent file so that Qt's default is
used. This dirty hack was necessary because there was no way found to export
an empty variable OE_QMAKE_QTCONF_PATH.

This patch was tested by building huge parts of meta-qt5-extra. The meta-layers
did not yet contain oe-core's recipe-specific-sysroot changes so master build
might fail for missing dependencies.

[1] http://www.rncbc.org/drupal/

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 classes/qmake5_base.bbclass                        |  9 ++---
 recipes-qt/qt5/nativesdk-qtbase_git.bb             |  5 +++
 recipes-qt/qt5/qtbase-native_git.bb                |  5 +++
 ...o-allow-to-set-qt.conf-from-the-outside-u.patch | 38 ++++++++++++++++++++++
 recipes-qt/qt5/qtbase_git.bb                       |  5 +++
 recipes-qt/qt5/qtwebengine_git.bb                  |  2 +-
 6 files changed, 59 insertions(+), 5 deletions(-)
 create mode 100644 recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch

diff --git a/classes/qmake5_base.bbclass b/classes/qmake5_base.bbclass
index 50e5a30..df8f624 100644
--- a/classes/qmake5_base.bbclass
+++ b/classes/qmake5_base.bbclass
@@ -41,8 +41,9 @@ export OE_QMAKE_LDFLAGS = "${LDFLAGS}"
 export OE_QMAKE_AR = "${AR}"
 export OE_QMAKE_STRIP = "echo"
 export OE_QMAKE_WAYLAND_SCANNER = "${STAGING_BINDIR_NATIVE}/wayland-scanner"
-OE_QMAKE_QTCONF_PATH = "${WORKDIR}/qt.conf"
-export OE_QMAKE_QTCONF = "-qtconf ${OE_QMAKE_QTCONF_PATH}"
+
+# qmake reads if from shell environment
+export OE_QMAKE_QTCONF_PATH = "${WORKDIR}/qt.conf"
 
 inherit qmake5_paths remove-libtool
 
@@ -170,8 +171,8 @@ qmake5_base_do_configure () {
     # for config.tests to read this
     export QMAKE_MAKE_ARGS="${EXTRA_OEMAKE}"
 
-    CMD="${OE_QMAKE_QMAKE} -makefile -o Makefile ${OE_QMAKE_QTCONF} ${OE_QMAKE_DEBUG_OUTPUT} ${OE_QMAKE_RECURSIVE} $QMAKE_VARSUBST_PRE $AFTER $PROFILES $QMAKE_VARSUBST_POST -- $QMAKE_VARSUBST_CONFIGURE"
-    ${OE_QMAKE_QMAKE} -makefile -o Makefile ${OE_QMAKE_QTCONF} ${OE_QMAKE_DEBUG_OUTPUT} ${OE_QMAKE_RECURSIVE} $QMAKE_VARSUBST_PRE $AFTER $PROFILES $QMAKE_VARSUBST_POST -- $QMAKE_VARSUBST_CONFIGURE || die "Error calling $CMD"
+    CMD="${OE_QMAKE_QMAKE} -makefile -o Makefile ${OE_QMAKE_DEBUG_OUTPUT} ${OE_QMAKE_RECURSIVE} $QMAKE_VARSUBST_PRE $AFTER $PROFILES $QMAKE_VARSUBST_POST -- $QMAKE_VARSUBST_CONFIGURE"
+    ${OE_QMAKE_QMAKE} -makefile -o Makefile ${OE_QMAKE_DEBUG_OUTPUT} ${OE_QMAKE_RECURSIVE} $QMAKE_VARSUBST_PRE $AFTER $PROFILES $QMAKE_VARSUBST_POST -- $QMAKE_VARSUBST_CONFIGURE || die "Error calling $CMD"
 }
 
 qmake5_base_native_do_install() {
diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index 7d2ce58..7a4c113 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -27,6 +27,7 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/qtbase:"
 # common for qtbase-native, qtbase-nativesdk and qtbase
 SRC_URI += "\
     file://0001-Add-linux-oe-g-platform.patch \
+    file://0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch \
     file://0003-Add-external-hostbindir-option.patch \
     file://0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch \
     file://0005-configure-bump-path-length-from-256-to-512-character.patch \
@@ -92,6 +93,10 @@ QT_CONFIG_FLAGS += " \
 OE_QMAKE_PATH_HOST_DATA = "${libdir}${QT_DIR_NAME}"
 OE_QMAKE_PATH_HOST_LIBS = "${libdir}"
 
+# for qtbase configuration we need default settings
+# since we cannot set empty set filename to a not existent file
+export OE_QMAKE_QTCONF_PATH = "foodummy"
+
 do_configure() {
     ${S}/configure -v \
         -opensource -confirm-license \
diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index ba1be2c..9cd3dfc 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -22,6 +22,7 @@ require qt5-git.inc
 # common for qtbase-native, qtbase-nativesdk and qtbase
 SRC_URI += "\
     file://0001-Add-linux-oe-g-platform.patch \
+    file://0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch \
     file://0003-Add-external-hostbindir-option.patch \
     file://0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch \
     file://0005-configure-bump-path-length-from-256-to-512-character.patch \
@@ -77,6 +78,10 @@ PACKAGECONFIG_CONFARGS = " \
     -platform linux-oe-g++ \
 "
 
+# for qtbase configuration we need default settings
+# since we cannot set empty set filename to a not existent file
+export OE_QMAKE_QTCONF_PATH = "foodummy"
+
 do_configure_prepend() {
     MAKEFLAGS="${PARALLEL_MAKE}" ${S}/configure -opensource -confirm-license ${PACKAGECONFIG_CONFARGS} || die "Configuring qt failed. PACKAGECONFIG_CONFARGS was ${PACKAGECONFIG_CONFARGS}"
 }
diff --git a/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch b/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
new file mode 100644
index 0000000..4b72ebf
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
@@ -0,0 +1,38 @@
+From e5f8607cfa1d2bcc798686cdf7c87ea0c6577d30 Mon Sep 17 00:00:00 2001
+From: Holger Freyther <zecke@selfish.org>
+Date: Wed, 26 Sep 2012 17:22:30 +0200
+Subject: [PATCH] qlibraryinfo: allow to set qt.conf from the outside using the
+ environment
+
+Allow to set a qt.conf from the outside using the environment. This allows
+to inject new prefixes and other paths into qmake. This is needed when using
+the same qmake binary to build qt/x11 and qt/embedded
+
+Upstream-Status: Inappropriate [embedded specific]
+  again very OE specific to read everything from environment (reusing the same
+  qmake from sstate and replacing all configured paths in it with qt.conf from
+  environment).
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/corelib/global/qlibraryinfo.cpp | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/qlibraryinfo.cpp
+index 27fe10a..29ffcda 100644
+--- a/src/corelib/global/qlibraryinfo.cpp
++++ b/src/corelib/global/qlibraryinfo.cpp
+@@ -164,7 +164,10 @@ void QLibrarySettings::load()
+ QSettings *QLibraryInfoPrivate::findConfiguration()
+ {
+ #ifdef QT_BUILD_QMAKE
+-    QString qtconfig = qmake_libraryInfoFile();
++    QByteArray config = getenv("OE_QMAKE_QTCONF_PATH");
++    QString qtconfig = QFile::decodeName(config);
++    if(!QFile::exists(qtconfig))
++        qtconfig = qmake_libraryInfoFile();
+     if (QFile::exists(qtconfig))
+         return new QSettings(qtconfig, QSettings::IniFormat);
+ #else
+-- 
+2.9.3
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 5db9aad..ecdc763 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -17,6 +17,7 @@ LIC_FILES_CHKSUM = " \
 # common for qtbase-native, qtbase-nativesdk and qtbase
 SRC_URI += "\
     file://0001-Add-linux-oe-g-platform.patch \
+    file://0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch \
     file://0003-Add-external-hostbindir-option.patch \
     file://0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch \
     file://0005-configure-bump-path-length-from-256-to-512-character.patch \
@@ -129,6 +130,10 @@ QT_CONFIG_FLAGS += " \
     ${PACKAGECONFIG_CONFARGS} \
 "
 
+# for qtbase configuration we need default settings
+# since we cannot set empty set filename to a not existent file
+export OE_QMAKE_QTCONF_PATH = "foodummy"
+
 do_configure() {
     # Avoid qmake error "Cannot read [...]/usr/lib/qt5/mkspecs/oe-device-extra.pri: No such file or directory" during configuration
     touch ${S}/mkspecs/oe-device-extra.pri
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 3d139d0..8e60d72 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -78,7 +78,7 @@ do_configure() {
 
     # qmake can't find the OE_QMAKE_* variables on it's own so directly passing them as
     # arguments here
-    ${OE_QMAKE_QMAKE} ${OE_QMAKE_QTCONF} -r ${EXTRA_QMAKEVARS_PRE} ${S} \
+    ${OE_QMAKE_QMAKE} -r ${EXTRA_QMAKEVARS_PRE} ${S} \
         QMAKE_CXX="${OE_QMAKE_CXX}" QMAKE_CC="${OE_QMAKE_CC}" \
         QMAKE_LINK="${OE_QMAKE_LINK}" \
         QMAKE_CFLAGS="${OE_QMAKE_CFLAGS}" \
-- 
2.9.3


