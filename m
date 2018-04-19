Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0979D744DA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Apr 2018 12:13:57 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id v24-v6so13405865wra.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Apr 2018 05:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=67DscRgqSJqy9DEF2T7kR0UPKIvmo3tr95HZVpSVhBM=;
	b=Z4RW8GJD+xkpQaJlnbRhx3l4iss+ZSJ96jwyqq3y7v5Pd4jtxw6Wq2PSztMXh3iPcS
	0bwq/MC+435cguyBehkG0LyAjbM1T9kWmMXKc3mYcB2q2/82q2JV75FDakLYCLPpp4Qv
	7x+ksh4tQbfRPXHYS0i8wm4A7A0ZVO1Z0siPbXChgkQcu1dydU9cHiyYzet89ohvE3q+
	VS4AQBYEQG7SwuA1br4jH9cbCp4hMA/zCseKB/oE4fFZF4kB9Yog618DdwwEqtGpx6gL
	DEVhnNyF1Ta/Mi66UJNTRahM8iYqIgSoJJPxi3KZtwG6XoKH460Pf2/X6txgI3khYJIH
	g5FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=67DscRgqSJqy9DEF2T7kR0UPKIvmo3tr95HZVpSVhBM=;
	b=gLP+q4kYh1QXG+7tXcUiHl8AIEmQj419W/XJHAq1bkQZe7Rqu6313z5B48o6wnnpsk
	6vF/S8+/DSbwnw4C05Pn/S6Bc8t+coH2vHI3pE7X1BbbjTepvgTIL5izCx4tuht41x4X
	gXwxCtqcQc/xnjUc7wQD0KI88vFcLrP1lmiKBijaLTbqK/te5ykUAGXMCxO4RVIDmOaK
	wo7zTniEX9B9ocOE4vwzbsFCIOroFreem6c9f+Dg6rFw0fK27q1i24cXmswN/EtGduuF
	AB50519RkxH98tAXUd8mgYfIhejRSYlodHxCBHoKw5zQ2KvHCn9gOX8VRcTpbfIW0YNt
	quRA==
X-Gm-Message-State: ALQs6tA7ul/MvdjcgC9BSTRG7TYmJ0mwGGXLVbVSViMeBTf9yv/xXdEF
	nHH1l01/GtpBS5OZbxpqSx8XLw==
X-Google-Smtp-Source: AIpwx49mERFg4w4XFfdv5rLx/skgBulek+fYXk5BlKqrDTwF5dg66cGWnYwNVVB0ny0316eRs311Sw==
X-Received: by 10.28.158.2 with SMTP id h2mr4239556wme.157.1524140038386;
	Thu, 19 Apr 2018 05:13:58 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	63-v6sm4093878wrh.70.2018.04.19.05.13.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 19 Apr 2018 05:13:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Apr 2018 12:13:56 +0000
Message-Id: <20180419121356.24099-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [meta-qt5][WIP][PATCH] qt5-creator: upgrade to 4.5.1
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
X-List-Received-Date: Thu, 19 Apr 2018 12:13:58 -0000

* old 3.5.1 isn't compatible with Qt 5.11
  qt-creator-opensource-src-3.5.1/src/libs/qmleditorwidgets/contextpanewidgetimage.cpp:891:23:
  error: invalid use of incomplete type 'class QStyle'
  |      QIcon icon(style()->standardIcon(QStyle::SP_DockWidgetCloseButton));
  |                        ^~

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...ator-to-build-on-arm-aarch32-and-aar.patch |  6 +--
 ...compilation-with-QT_NO_ACCESSIBILITY.patch | 35 -----------------
 .../0002-Link-with-libexecinfo-on-musl.patch  | 20 ++++++++++
 .../0003-Qmlpuppet-add-missing-includes.patch | 38 -------------------
 .../0004-Link-with-libexecinfo-on-musl.patch  | 30 ---------------
 ...-creator_3.5.1.bb => qt5-creator_4.5.1.bb} | 38 +++++++------------
 6 files changed, 36 insertions(+), 131 deletions(-)
 delete mode 100644 recipes-qt/qt5/qt5-creator/0002-Fix-compilation-with-QT_NO_ACCESSIBILITY.patch
 create mode 100644 recipes-qt/qt5/qt5-creator/0002-Link-with-libexecinfo-on-musl.patch
 delete mode 100644 recipes-qt/qt5/qt5-creator/0003-Qmlpuppet-add-missing-includes.patch
 delete mode 100644 recipes-qt/qt5/qt5-creator/0004-Link-with-libexecinfo-on-musl.patch
 rename recipes-qt/qt5/{qt5-creator_3.5.1.bb => qt5-creator_4.5.1.bb} (67%)

diff --git a/recipes-qt/qt5/qt5-creator/0001-Fix-Allow-qt-creator-to-build-on-arm-aarch32-and-aar.patch b/recipes-qt/qt5/qt5-creator/0001-Fix-Allow-qt-creator-to-build-on-arm-aarch32-and-aar.patch
index c4ee34b..28dc475 100644
--- a/recipes-qt/qt5/qt5-creator/0001-Fix-Allow-qt-creator-to-build-on-arm-aarch32-and-aar.patch
+++ b/recipes-qt/qt5/qt5-creator/0001-Fix-Allow-qt-creator-to-build-on-arm-aarch32-and-aar.patch
@@ -1,4 +1,4 @@
-From 056bc88a15df06443a4a6bdea2b1ead045f89bf6 Mon Sep 17 00:00:00 2001
+From 231e0cf0c764d3b63cd5ec788ac0ee901b47fc8e Mon Sep 17 00:00:00 2001
 From: Greg Nietsky <gregory@distrotech.co.za>
 Date: Tue, 4 Mar 2014 11:33:40 +0200
 Subject: [PATCH] Fix: Allow qt-creator to build on arm aarch32 and aarch64
@@ -14,7 +14,7 @@ Change-Id: Iddea28f21c9fa1afd2fdd5d16a44e6c96a516a7a
  2 files changed, 17 insertions(+), 1 deletion(-)
 
 diff --git a/src/libs/3rdparty/botan/botan.cpp b/src/libs/3rdparty/botan/botan.cpp
-index e6a5f22..7b625ac 100644
+index 87736d5..2e950d8 100644
 --- a/src/libs/3rdparty/botan/botan.cpp
 +++ b/src/libs/3rdparty/botan/botan.cpp
 @@ -1101,6 +1101,8 @@ class Montgomery_Exponentiator : public Modular_Exponentiator
@@ -76,7 +76,7 @@ index e6a5f22..7b625ac 100644
  * Helper Macros for x86 Assembly
  */
 diff --git a/src/libs/3rdparty/botan/botan.h b/src/libs/3rdparty/botan/botan.h
-index 2caa4a3..39b8079 100644
+index d7b90cc..26ca8ac 100644
 --- a/src/libs/3rdparty/botan/botan.h
 +++ b/src/libs/3rdparty/botan/botan.h
 @@ -85,7 +85,9 @@
diff --git a/recipes-qt/qt5/qt5-creator/0002-Fix-compilation-with-QT_NO_ACCESSIBILITY.patch b/recipes-qt/qt5/qt5-creator/0002-Fix-compilation-with-QT_NO_ACCESSIBILITY.patch
deleted file mode 100644
index 8d953c9..0000000
--- a/recipes-qt/qt5/qt5-creator/0002-Fix-compilation-with-QT_NO_ACCESSIBILITY.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From fbae8e85e74976b79308c203d38839b364757302 Mon Sep 17 00:00:00 2001
-From: Eike Ziller <eike.ziller@qt.io>
-Date: Fri, 24 Jun 2016 10:23:24 +0200
-Subject: [PATCH] Fix compilation with QT_NO_ACCESSIBILITY
-
-Task-number: QTCREATORBUG-16446
-Change-Id: If75122c23a697f26ccf56391fe2e8d316aad6367
-Reviewed-by: hjk <hjk@theqtcompany.com>
----
- src/libs/utils/fancymainwindow.cpp | 7 +++++--
- 1 file changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/src/libs/utils/fancymainwindow.cpp b/src/libs/utils/fancymainwindow.cpp
-index 9477f17..1ee425f 100644
---- a/src/libs/utils/fancymainwindow.cpp
-+++ b/src/libs/utils/fancymainwindow.cpp
-@@ -159,13 +159,16 @@ public:
- 
-         m_floatButton = new DockWidgetTitleButton(this);
-         m_floatButton->setIcon(q->style()->standardIcon(QStyle::SP_TitleBarNormalButton, &opt, q));
--        m_floatButton->setAccessibleName(QDockWidget::tr("Float"));
--        m_floatButton->setAccessibleDescription(QDockWidget::tr("Undocks and re-attaches the dock widget"));
- 
-         m_closeButton = new DockWidgetTitleButton(this);
-         m_closeButton->setIcon(q->style()->standardIcon(QStyle::SP_TitleBarCloseButton, &opt, q));
-+
-+#ifndef QT_NO_ACCESSIBILITY
-+        m_floatButton->setAccessibleName(QDockWidget::tr("Float"));
-+        m_floatButton->setAccessibleDescription(QDockWidget::tr("Undocks and re-attaches the dock widget"));
-         m_closeButton->setAccessibleName(QDockWidget::tr("Close"));
-         m_closeButton->setAccessibleDescription(QDockWidget::tr("Closes the dock widget"));
-+#endif
- 
-         setActive(false);
- 
diff --git a/recipes-qt/qt5/qt5-creator/0002-Link-with-libexecinfo-on-musl.patch b/recipes-qt/qt5/qt5-creator/0002-Link-with-libexecinfo-on-musl.patch
new file mode 100644
index 0000000..40e277f
--- /dev/null
+++ b/recipes-qt/qt5/qt5-creator/0002-Link-with-libexecinfo-on-musl.patch
@@ -0,0 +1,20 @@
+From a30f4335d49516eb4654111af5bf073b633f7336 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 16 Jan 2018 13:26:57 +0000
+Subject: [PATCH] Link with libexecinfo on musl
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/plugins/debugger/debugger.pro | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/plugins/debugger/debugger.pro b/src/plugins/debugger/debugger.pro
+index f5a34aa..4a1359d 100644
+--- a/src/plugins/debugger/debugger.pro
++++ b/src/plugins/debugger/debugger.pro
+@@ -141,3 +141,4 @@ include(console/console.pri)
+ include(analyzer/analyzer.pri)
+ 
+ include(shared/shared.pri)
++LIBS  *= -lexecinfo
diff --git a/recipes-qt/qt5/qt5-creator/0003-Qmlpuppet-add-missing-includes.patch b/recipes-qt/qt5/qt5-creator/0003-Qmlpuppet-add-missing-includes.patch
deleted file mode 100644
index e64b6d9..0000000
--- a/recipes-qt/qt5/qt5-creator/0003-Qmlpuppet-add-missing-includes.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 896624d715e20e658344ac85db91cd55d25e7211 Mon Sep 17 00:00:00 2001
-From: Marco Benelli <marco.benelli@qt.io>
-Date: Thu, 6 Jul 2017 09:31:41 +0200
-Subject: [PATCH] Qmlpuppet: add missing includes
-
-Task-number:  QTCREATORBUG-18498
-Change-Id: Ie40a066508bb52f53b8ad528f9d4cf6969fc0632
-Reviewed-by: Thomas Hartmann <thomas.hartmann@qt.io>
----
- .../qtcreator/qml/qmlpuppet/qml2puppet/instances/layoutnodeinstance.cpp | 2 ++
- .../qtcreator/qml/qmlpuppet/qml2puppet/instances/objectnodeinstance.cpp | 1 +
- 2 files changed, 3 insertions(+)
-
-diff --git a/share/qtcreator/qml/qmlpuppet/qml2puppet/instances/layoutnodeinstance.cpp b/share/qtcreator/qml/qmlpuppet/qml2puppet/instances/layoutnodeinstance.cpp
-index 3f9f148..160e5c4 100644
---- a/share/qtcreator/qml/qmlpuppet/qml2puppet/instances/layoutnodeinstance.cpp
-+++ b/share/qtcreator/qml/qmlpuppet/qml2puppet/instances/layoutnodeinstance.cpp
-@@ -29,6 +29,8 @@
- ****************************************************************************/
- #include "layoutnodeinstance.h"
- 
-+#include <QCoreApplication>
-+
- namespace QmlDesigner {
- namespace Internal {
- 
-diff --git a/share/qtcreator/qml/qmlpuppet/qml2puppet/instances/objectnodeinstance.cpp b/share/qtcreator/qml/qmlpuppet/qml2puppet/instances/objectnodeinstance.cpp
-index 5a9342f..bacbc12 100644
---- a/share/qtcreator/qml/qmlpuppet/qml2puppet/instances/objectnodeinstance.cpp
-+++ b/share/qtcreator/qml/qmlpuppet/qml2puppet/instances/objectnodeinstance.cpp
-@@ -33,6 +33,7 @@
- #include <enumeration.h>
- #include <qmlprivategate.h>
- 
-+#include <QDebug>
- #include <QEvent>
- #include <QQmlContext>
- #include <QQmlError>
diff --git a/recipes-qt/qt5/qt5-creator/0004-Link-with-libexecinfo-on-musl.patch b/recipes-qt/qt5/qt5-creator/0004-Link-with-libexecinfo-on-musl.patch
deleted file mode 100644
index 59687e5..0000000
--- a/recipes-qt/qt5/qt5-creator/0004-Link-with-libexecinfo-on-musl.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 7fb65b82d247123c7fdb61436183f1d76067b66b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 16 Jan 2018 13:26:57 +0000
-Subject: [PATCH] Link with libexecinfo on musl
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- src/plugins/debugger/debugger.pro  | 1 +
- src/plugins/qmldesigner/config.pri | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/src/plugins/debugger/debugger.pro b/src/plugins/debugger/debugger.pro
-index c40bd63..96ab542 100644
---- a/src/plugins/debugger/debugger.pro
-+++ b/src/plugins/debugger/debugger.pro
-@@ -148,3 +148,4 @@ include(qml/qml.pri)
- include(namedemangler/namedemangler.pri)
- 
- include(shared/shared.pri)
-+LIBS  *= -lexecinfo
-diff --git a/src/plugins/qmldesigner/config.pri b/src/plugins/qmldesigner/config.pri
-index 1b559b2..b485b63 100644
---- a/src/plugins/qmldesigner/config.pri
-+++ b/src/plugins/qmldesigner/config.pri
-@@ -9,3 +9,4 @@ equals(TMP_BAUHAUS_NO_OUTPUT, true):DEFINES += QT_NO_DEBUG_OUTPUT \
- DEFINES += ENABLE_TEXT_VIEW
- 
- isEmpty($$(BAUHAUS_OUTPUT_IN_TEST)):DEFINES += QDEBUG_IN_TESTS WARNINGS_IN_TESTS
-+LIBS  *= -lexecinfo
diff --git a/recipes-qt/qt5/qt5-creator_3.5.1.bb b/recipes-qt/qt5/qt5-creator_4.5.1.bb
similarity index 67%
rename from recipes-qt/qt5/qt5-creator_3.5.1.bb
rename to recipes-qt/qt5/qt5-creator_4.5.1.bb
index fe9cb41..e97e591 100644
--- a/recipes-qt/qt5/qt5-creator_3.5.1.bb
+++ b/recipes-qt/qt5/qt5-creator_4.5.1.bb
@@ -7,11 +7,9 @@ SUMMARY = "Qt Creator is a new cross-platform Qt IDE"
 # 'System GDB at /usr/bin/gdb.
 
 HOMEPAGE = "https://qt-project.org/"
-LICENSE = "LGPLv2.1 | GPLv3"
+LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = " \
-    file://LGPL_EXCEPTION.TXT;md5=f4748b0d1a72c5c8fb5dab2dd1f7fa46 \
-    file://LICENSE.LGPLv21;md5=825920de5f6db2eeb1bebe625476346d \
-    file://LICENSE.LGPLv3;md5=0786418af032b9e608909874f334a2d1 \
+    file://LICENSE.GPL3-EXCEPT;md5=763d8c535a234d9a3fb682c7ecb6c073 \
 "
 
 inherit qmake5
@@ -19,39 +17,25 @@ inherit qmake5
 DEPENDS = "qtbase qtscript qtwebkit qtxmlpatterns qtx11extras qtdeclarative qttools qttools-native qtsvg qtquick1"
 DEPENDS_append_libc-musl = " libexecinfo"
 
-# Patches from https://github.com/meta-qt5/qtcreator/commits/b5.3.1
-# 5.3.1.meta-qt5.1
+# Patches from https://github.com/meta-qt5/qtcreator/commits/b5.4.1
+# 5.4.1.meta-qt5.1
 SRC_URI = " \
-    http://download.qt.io/official_releases/qtcreator/3.5/${PV}/qt-creator-opensource-src-${PV}.tar.gz \
+    http://download.qt.io/official_releases/qtcreator/4.5/${PV}/qt-creator-opensource-src-${PV}.tar.gz \
     file://0001-Fix-Allow-qt-creator-to-build-on-arm-aarch32-and-aar.patch \
-    file://0002-Fix-compilation-with-QT_NO_ACCESSIBILITY.patch \
-    file://0003-Qmlpuppet-add-missing-includes.patch \
     file://qtcreator.desktop.in \
 "
+SRC_URI_append_libc-musl = " file://0002-Link-with-libexecinfo-on-musl.patch"
 
-SRC_URI_append_libc-musl = " file://0004-Link-with-libexecinfo-on-musl.patch"
-
-
-SRC_URI[md5sum] = "77aef7df837eba07c7ce6037ee504c05"
-SRC_URI[sha256sum] = "5925ac818a08be919094e0f28fb4c5d8896765e0975d54d353e4c50f13d63e65"
+SRC_URI[md5sum] = "bd7fdbcdfa84df1171fb28174353e57f"
+SRC_URI[sha256sum] = "5fdfc8f05694e37162f208616627262c9971749d6958d8881d62933b3b53e909"
 
 S = "${WORKDIR}/qt-creator-opensource-src-${PV}"
 
 EXTRA_QMAKEVARS_PRE += "IDE_LIBRARY_BASENAME=${baselib}${QT_DIR_NAME}"
 
-LDFLAGS_append_libc-musl = " -lexecinfo "
 do_configure_append() {
     # Find native tools
-    sed -i 's:${STAGING_BINDIR}.*/lrelease:${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}/lrelease:g' ${B}/share/qtcreator/translations/Makefile
     sed -i 's:${STAGING_BINDIR}.*/qdoc:${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}/qdoc:g' ${B}/Makefile
-
-    # see qtbase-native.inc
-    # sed -i 's:QT_INSTALL_DOCS=${docdir}:QT_INSTALL_DOCS=${STAGING_DATADIR_NATIVE}${QT_DIR_NAME}/doc:g' ${B}/Makefile
-}
-
-do_compile_append() {
-    # build docs
-    #oe_runmake docs_online
 }
 
 do_install() {
@@ -65,6 +49,7 @@ do_install() {
 
 FILES_${PN} += " \
     ${datadir}/qtcreator \
+    ${datadir}/metainfo \
     ${datadir}/icons \
     ${libdir}${QT_DIR_NAME}/qtcreator \
 "
@@ -79,7 +64,7 @@ FILES_${PN}-dev += " \
     ${libdir}${QT_DIR_NAME}/qtcreator/*${SOLIBSDEV} \
 "
 
-RDEPENDS_${PN} += "perl"
+RDEPENDS_${PN} += "perl python"
 RCONFLICTS_${PN} = "qt-creator"
 
 # To give best user experience out of the box..
@@ -91,3 +76,6 @@ RRECOMMENDS_${PN} += " \
     gcc-symlinks g++-symlinks cpp-symlinks \
     gdb \
 "
+
+# ERROR: qt5-creator-4.5.1-r0 do_package_qa: QA Issue: No GNU_HASH in the elf binary: '/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/qt5-creator/4.5.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcreator/libqbscore.so.1.10.1'
+INSANE_SKIP_${PN} += "ldflags"
-- 
2.17.0


