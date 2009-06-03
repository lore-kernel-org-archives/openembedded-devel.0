Received: from [209.85.218.219] (helo=mail-bw0-f219.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1MBsfm-0000eP-7P
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Jun 2009 17:46:38 +0200
Received: by bwz19 with SMTP id 19so72910bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jun 2009 08:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=3LBVX2q0FTpsW3BN3sk18OkxBDVWLO4Km1eYpwOcmrM=;
	b=Zz+LJONVbaqt3PyjX8o9/KCr07eIH5+VxGB5UECoWCCin2sBHm3qOrkosbjrwZDo9S
	hjKGvwFSvXY24ahKWxPCJuecfeuzWrdbqn01hoHWkZksYrOE556uc6CBUoiEmTebtiFE
	MyvLVs2pSCaNhvreHx4icdEwJenIXX24NfUPE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=UpZfeU+uo1PXvhHzMGRsz7HhrcZIv7ac5ap41crLNNraor5hZDfq9XgvUZXSSmA4yR
	Ql9OvIbB6AdywZqZLxOlKm0YTqZ79/Z0/WRMFxBT1PPnNx+6hmm44RGYfde7QHN/W3yi
	/X7qRCVdrVHb+SXds6xLykPc2YjthsFLg4t8k=
Received: by 10.103.24.17 with SMTP id b17mr700277muj.89.1244043458574;
	Wed, 03 Jun 2009 08:37:38 -0700 (PDT)
Received: from localhost (cpmsq.epam.com [217.21.56.2])
	by mx.google.com with ESMTPS id 23sm94745mum.35.2009.06.03.08.37.34
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 03 Jun 2009 08:37:37 -0700 (PDT)
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Jun 2009 18:37:11 +0300
Message-Id: <1244043442-3868-2-git-send-email-ihar.hrachyshka@gmail.com>
X-Mailer: git-send-email 1.6.3.1
In-Reply-To: <1244043442-3868-1-git-send-email-ihar.hrachyshka@gmail.com>
References: <20090603151754.GI26065@smtp.west.cox.net>
	<1244043442-3868-1-git-send-email-ihar.hrachyshka@gmail.com>
Subject: [PATCH 01/12] qt4-embedded: reworked directory layout for the next changes.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Jun 2009 15:46:38 -0000

Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
---
 recipes/qt4/files/0003-no-tools.patch              |   16 -------
 .../qt4/files/0006-freetype-host-includes.patch    |   23 ----------
 recipes/qt4/files/0007-openssl-host-includes.patch |   23 ----------
 recipes/qt4/files/0008-qt-lib-infix.patch          |   45 --------------------
 recipes/qt4/files/4.5.1/0003-no-tools.patch        |   18 --------
 .../files/4.5.1/0006-freetype-host-includes.patch  |   20 ---------
 .../files/4.5.1/0007-openssl-host-includes.patch   |   20 ---------
 recipes/qt4/files/4.5.1/0008-qt-lib-infix.patch    |   34 ---------------
 .../4.5.1/0010-no-simpledecoration-example.patch   |    9 ----
 recipes/qt4/qt4-embedded-4.4.3/0003-no-tools.patch |   16 +++++++
 .../0006-freetype-host-includes.patch              |   23 ++++++++++
 .../0007-openssl-host-includes.patch               |   23 ++++++++++
 .../qt4/qt4-embedded-4.4.3/0008-qt-lib-infix.patch |   45 ++++++++++++++++++++
 recipes/qt4/qt4-embedded-4.5.1/0003-no-tools.patch |   18 ++++++++
 .../0006-freetype-host-includes.patch              |   20 +++++++++
 .../0007-openssl-host-includes.patch               |   20 +++++++++
 .../qt4/qt4-embedded-4.5.1/0008-qt-lib-infix.patch |   34 +++++++++++++++
 .../0010-no-simpledecoration-example.patch         |    9 ++++
 recipes/qt4/qt4-embedded.inc                       |   40 +++++++++++++++++
 recipes/qt4/qt4-embedded_4.4.3.bb                  |   40 +----------------
 recipes/qt4/qt4-embedded_4.5.1.bb                  |   41 ++----------------
 21 files changed, 254 insertions(+), 283 deletions(-)
 delete mode 100644 recipes/qt4/files/0003-no-tools.patch
 delete mode 100644 recipes/qt4/files/0006-freetype-host-includes.patch
 delete mode 100644 recipes/qt4/files/0007-openssl-host-includes.patch
 delete mode 100644 recipes/qt4/files/0008-qt-lib-infix.patch
 delete mode 100644 recipes/qt4/files/4.5.1/0003-no-tools.patch
 delete mode 100644 recipes/qt4/files/4.5.1/0006-freetype-host-includes.patch
 delete mode 100644 recipes/qt4/files/4.5.1/0007-openssl-host-includes.patch
 delete mode 100644 recipes/qt4/files/4.5.1/0008-qt-lib-infix.patch
 delete mode 100644 recipes/qt4/files/4.5.1/0010-no-simpledecoration-example.patch
 create mode 100644 recipes/qt4/qt4-embedded-4.4.3/0003-no-tools.patch
 create mode 100644 recipes/qt4/qt4-embedded-4.4.3/0006-freetype-host-includes.patch
 create mode 100644 recipes/qt4/qt4-embedded-4.4.3/0007-openssl-host-includes.patch
 create mode 100644 recipes/qt4/qt4-embedded-4.4.3/0008-qt-lib-infix.patch
 create mode 100644 recipes/qt4/qt4-embedded-4.5.1/0003-no-tools.patch
 create mode 100644 recipes/qt4/qt4-embedded-4.5.1/0006-freetype-host-includes.patch
 create mode 100644 recipes/qt4/qt4-embedded-4.5.1/0007-openssl-host-includes.patch
 create mode 100644 recipes/qt4/qt4-embedded-4.5.1/0008-qt-lib-infix.patch
 create mode 100644 recipes/qt4/qt4-embedded-4.5.1/0010-no-simpledecoration-example.patch
 create mode 100644 recipes/qt4/qt4-embedded.inc

diff --git a/recipes/qt4/files/0003-no-tools.patch b/recipes/qt4/files/0003-no-tools.patch
deleted file mode 100644
index bb36444..0000000
--- a/recipes/qt4/files/0003-no-tools.patch
+++ /dev/null
@@ -1,16 +0,0 @@
---- /tmp/src.pro	2008-07-08 10:43:30.000000000 +0200
-+++ qt-embedded-linux-opensource-src-4.4.0/src/src.pro	2008-07-08 11:28:24.000000000 +0200
-@@ -6,12 +6,9 @@
- wince*:{
-   SRC_SUBDIRS += src_corelib src_xml src_gui src_sql src_network src_script src_testlib
- } else {
--    SRC_SUBDIRS += src_tools_moc src_tools_rcc src_tools_uic src_corelib src_xml src_network src_gui src_sql src_script src_testlib
-+    SRC_SUBDIRS += src_corelib src_xml src_network src_gui src_sql src_script src_testlib
-     contains(QT_CONFIG, qt3support): SRC_SUBDIRS += src_qt3support
-     contains(QT_CONFIG, dbus):SRC_SUBDIRS += src_dbus
--    !cross_compile {
--        contains(QT_CONFIG, qt3support): SRC_SUBDIRS += src_tools_uic3
--    }
- }
- win32:!contains(QT_EDITION, OpenSource|Console): {
-     SRC_SUBDIRS += src_activeqt
diff --git a/recipes/qt4/files/0006-freetype-host-includes.patch b/recipes/qt4/files/0006-freetype-host-includes.patch
deleted file mode 100644
index cc8e115..0000000
--- a/recipes/qt4/files/0006-freetype-host-includes.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From c9ab62bd9a56643574b3ae6e59e0ca776d4860d2 Mon Sep 17 00:00:00 2001
-From: Michael Krelin <hacker@klever.net>
-Date: Mon, 4 Jun 2007 14:48:50 +0200
-Subject: [PATCH] freetype host includes
-
----
- config.tests/unix/freetype/freetype.pri |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/config.tests/unix/freetype/freetype.pri b/config.tests/unix/freetype/freetype.pri
-index 84974bf..ab9a6f2 100644
---- a/config.tests/unix/freetype/freetype.pri
-+++ b/config.tests/unix/freetype/freetype.pri
-@@ -1,5 +1,5 @@
- !cross_compile {
--    TRY_INCLUDEPATHS = /include /usr/include $$QMAKE_INCDIR $$QMAKE_INCDIR_X11 $$INCLUDEPATH
-+    TRY_INCLUDEPATHS = $$QMAKE_INCDIR $$QMAKE_INCDIR_X11 $$INCLUDEPATH
-     for(p, TRY_INCLUDEPATHS) {
-         p = $$join(p, "", "", "/freetype2")
-         exists($$p):INCLUDEPATH *= $$p
--- 
-1.5.0.7
-
diff --git a/recipes/qt4/files/0007-openssl-host-includes.patch b/recipes/qt4/files/0007-openssl-host-includes.patch
deleted file mode 100644
index 35b71d9..0000000
--- a/recipes/qt4/files/0007-openssl-host-includes.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From d45943adb443ad4b85ca4504952dee743c675e1e Mon Sep 17 00:00:00 2001
-From: Michael Krelin <hacker@klever.net>
-Date: Mon, 4 Jun 2007 14:58:34 +0200
-Subject: [PATCH] openssl host includes
-
----
- config.tests/unix/openssl/openssl.pri |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/config.tests/unix/openssl/openssl.pri b/config.tests/unix/openssl/openssl.pri
-index 756e5fe..19b4061 100644
---- a/config.tests/unix/openssl/openssl.pri
-+++ b/config.tests/unix/openssl/openssl.pri
-@@ -1,5 +1,5 @@
- !cross_compile {
--    TRY_INCLUDEPATHS = /include /usr/include /usr/local/include $$QMAKE_INCDIR $$INCLUDEPATH
-+    TRY_INCLUDEPATHS = $$QMAKE_INCDIR $$INCLUDEPATH
-     for(p, TRY_INCLUDEPATHS) {
-         pp = $$join(p, "", "", "/openssl")
-         exists($$pp):INCLUDEPATH *= $$p
--- 
-1.5.0.7
-
diff --git a/recipes/qt4/files/0008-qt-lib-infix.patch b/recipes/qt4/files/0008-qt-lib-infix.patch
deleted file mode 100644
index b1a443f..0000000
--- a/recipes/qt4/files/0008-qt-lib-infix.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-diff -urN qt-embedded-linux-opensource-src-4.4.3.orig/mkspecs/features/uitools.prf qt-embedded-linux-opensource-src-4.4.3/mkspecs/features/uitools.prf
---- qt-embedded-linux-opensource-src-4.4.3.orig/mkspecs/features/uitools.prf	2008-09-27 11:01:24.000000000 +0200
-+++ qt-embedded-linux-opensource-src-4.4.3/mkspecs/features/uitools.prf	2008-12-11 20:47:10.000000000 +0100
-@@ -2,10 +2,10 @@
- qt:load(qt)
- 
- # Include the correct version of the UiLoader library
--QTUITOOLS_LINKAGE = -lQtUiTools
-+QTUITOOLS_LINKAGE = -lQtUiTools$${QT_LIBINFIX}
- CONFIG(debug, debug|release) {
--    mac: QTUITOOLS_LINKAGE = -lQtUiTools_debug
--    win32: QTUITOOLS_LINKAGE = -lQtUiToolsd
-+    mac: QTUITOOLS_LINKAGE = -lQtUiTools$${QT_LIBINFIX}_debug
-+    win32: QTUITOOLS_LINKAGE = -lQtUiTools$${QT_LIBINFIX}d
- }
- LIBS += $$QTUITOOLS_LINKAGE
- 
-diff -urN qt-embedded-linux-opensource-src-4.4.3.orig/tools/designer/src/lib/lib.pro qt-embedded-linux-opensource-src-4.4.3/tools/designer/src/lib/lib.pro
---- qt-embedded-linux-opensource-src-4.4.3.orig/tools/designer/src/lib/lib.pro	2008-09-27 11:01:29.000000000 +0200
-+++ qt-embedded-linux-opensource-src-4.4.3/tools/designer/src/lib/lib.pro	2008-12-11 20:36:40.000000000 +0100
-@@ -58,8 +58,8 @@
- include(shared/shared.pri)
- PRECOMPILED_HEADER=lib_pch.h
- 
--include(../components/component.pri)
- include(../sharedcomponents.pri)
-+include(../components/component.pri)
- 
- target.path=$$[QT_INSTALL_LIBS]
- INSTALLS        += target
-diff -urN qt-embedded-linux-opensource-src-4.4.3.orig/tools/designer/src/uitools/uitools.pro qt-embedded-linux-opensource-src-4.4.3/tools/designer/src/uitools/uitools.pro
---- qt-embedded-linux-opensource-src-4.4.3.orig/tools/designer/src/uitools/uitools.pro	2008-09-27 11:01:30.000000000 +0200
-+++ qt-embedded-linux-opensource-src-4.4.3/tools/designer/src/uitools/uitools.pro	2008-12-11 19:56:34.000000000 +0100
-@@ -1,5 +1,5 @@
- TEMPLATE = lib
--TARGET = $$qtLibraryTarget(QtUiTools)
-+TARGET = QtUiTools
- QT += xml
- CONFIG += qt staticlib
- DESTDIR = ../../../../lib
-@@ -38,3 +38,4 @@
-    QMAKE_PKGCONFIG_DESTDIR = pkgconfig
- }
- 
-+TARGET = $$qtLibraryTarget($$TARGET$$QT_LIBINFIX) #do this towards the end
diff --git a/recipes/qt4/files/4.5.1/0003-no-tools.patch b/recipes/qt4/files/4.5.1/0003-no-tools.patch
deleted file mode 100644
index 3829ffc..0000000
--- a/recipes/qt4/files/4.5.1/0003-no-tools.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Index: qt-embedded-linux-opensource-src-4.5.0/src/src.pro
-===================================================================
---- qt-embedded-linux-opensource-src-4.5.0.orig/src/src.pro	2009-02-25 22:32:41.000000000 +0100
-+++ qt-embedded-linux-opensource-src-4.5.0/src/src.pro	2009-03-26 17:11:07.000000000 +0100
-@@ -6,12 +6,9 @@
- wince*:{
-   SRC_SUBDIRS += src_corelib src_xml src_gui src_sql src_network src_script src_testlib
- } else {
--    SRC_SUBDIRS += src_tools_bootstrap src_tools_moc src_tools_rcc src_tools_uic src_corelib src_xml src_network src_gui src_sql src_script src_testlib
-+    SRC_SUBDIRS += src_corelib src_xml src_network src_gui src_sql src_script src_testlib
-     contains(QT_CONFIG, qt3support): SRC_SUBDIRS += src_qt3support
-     contains(QT_CONFIG, dbus):SRC_SUBDIRS += src_dbus
--    !cross_compile {
--        contains(QT_CONFIG, qt3support): SRC_SUBDIRS += src_tools_uic3
--    }
- }
- win32:!contains(QT_EDITION, OpenSource|Console): {
-     SRC_SUBDIRS += src_activeqt
diff --git a/recipes/qt4/files/4.5.1/0006-freetype-host-includes.patch b/recipes/qt4/files/4.5.1/0006-freetype-host-includes.patch
deleted file mode 100644
index 987c425..0000000
--- a/recipes/qt4/files/4.5.1/0006-freetype-host-includes.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-From c9ab62bd9a56643574b3ae6e59e0ca776d4860d2 Mon Sep 17 00:00:00 2001
-From: Michael Krelin <hacker@klever.net>
-Date: Mon, 4 Jun 2007 14:48:50 +0200
-Subject: [PATCH] freetype host includes
-
----
- config.tests/unix/freetype/freetype.pri |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-Index: qt-embedded-linux-opensource-src-4.5.0/config.tests/unix/freetype/freetype.pri
-===================================================================
---- qt-embedded-linux-opensource-src-4.5.0.orig/config.tests/unix/freetype/freetype.pri	2009-02-25 22:32:32.000000000 +0100
-+++ qt-embedded-linux-opensource-src-4.5.0/config.tests/unix/freetype/freetype.pri	2009-03-26 17:14:16.000000000 +0100
-@@ -1,5 +1,5 @@
- !cross_compile {
--    TRY_INCLUDEPATHS = /include /usr/include $$QMAKE_INCDIR $$QMAKE_INCDIR_X11 $$INCLUDEPATH
-+    TRY_INCLUDEPATHS = $$QMAKE_INCDIR $$QMAKE_INCDIR_X11 $$INCLUDEPATH
-     # LSB doesn't allow using headers from /include or /usr/include
-     linux-lsb-g++:TRY_INCLUDEPATHS = $$QMAKE_INCDIR $$QMAKE_INCDIR_X11 $$INCLUDEPATH
-     for(p, TRY_INCLUDEPATHS) {
diff --git a/recipes/qt4/files/4.5.1/0007-openssl-host-includes.patch b/recipes/qt4/files/4.5.1/0007-openssl-host-includes.patch
deleted file mode 100644
index 3409cc0..0000000
--- a/recipes/qt4/files/4.5.1/0007-openssl-host-includes.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-From d45943adb443ad4b85ca4504952dee743c675e1e Mon Sep 17 00:00:00 2001
-From: Michael Krelin <hacker@klever.net>
-Date: Mon, 4 Jun 2007 14:58:34 +0200
-Subject: [PATCH] openssl host includes
-
----
- config.tests/unix/openssl/openssl.pri |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-Index: qt-embedded-linux-opensource-src-4.5.0/config.tests/unix/openssl/openssl.pri
-===================================================================
---- qt-embedded-linux-opensource-src-4.5.0.orig/config.tests/unix/openssl/openssl.pri	2009-02-25 22:32:32.000000000 +0100
-+++ qt-embedded-linux-opensource-src-4.5.0/config.tests/unix/openssl/openssl.pri	2009-03-26 17:16:28.000000000 +0100
-@@ -1,5 +1,5 @@
- !cross_compile {
--    TRY_INCLUDEPATHS = /include /usr/include /usr/local/include $$QMAKE_INCDIR $$INCLUDEPATH
-+    TRY_INCLUDEPATHS = $$QMAKE_INCDIR $$INCLUDEPATH
-     # LSB doesn't allow using headers from /include or /usr/include
-     linux-lsb-g++:TRY_INCLUDEPATHS = $$QMAKE_INCDIR $$INCLUDEPATH
-     for(p, TRY_INCLUDEPATHS) {
diff --git a/recipes/qt4/files/4.5.1/0008-qt-lib-infix.patch b/recipes/qt4/files/4.5.1/0008-qt-lib-infix.patch
deleted file mode 100644
index 3efaff3..0000000
--- a/recipes/qt4/files/4.5.1/0008-qt-lib-infix.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-Index: qt-embedded-linux-opensource-src-4.5.0/mkspecs/features/uitools.prf
-===================================================================
---- qt-embedded-linux-opensource-src-4.5.0.orig/mkspecs/features/uitools.prf	2009-02-25 22:32:34.000000000 +0100
-+++ qt-embedded-linux-opensource-src-4.5.0/mkspecs/features/uitools.prf	2009-03-26 17:17:27.000000000 +0100
-@@ -2,10 +2,10 @@
- qt:load(qt)
- 
- # Include the correct version of the UiLoader library
--QTUITOOLS_LINKAGE = -lQtUiTools
-+QTUITOOLS_LINKAGE = -lQtUiTools$${QT_LIBINFIX}
- CONFIG(debug, debug|release) {
--    mac: QTUITOOLS_LINKAGE = -lQtUiTools_debug
--    win32: QTUITOOLS_LINKAGE = -lQtUiToolsd
-+    mac: QTUITOOLS_LINKAGE = -lQtUiTools$${QT_LIBINFIX}_debug
-+    win32: QTUITOOLS_LINKAGE = -lQtUiTools$${QT_LIBINFIX}d
- }
- LIBS += $$QTUITOOLS_LINKAGE
- 
-Index: qt-embedded-linux-opensource-src-4.5.0/tools/designer/src/uitools/uitools.pro
-===================================================================
---- qt-embedded-linux-opensource-src-4.5.0.orig/tools/designer/src/uitools/uitools.pro	2009-02-25 22:32:42.000000000 +0100
-+++ qt-embedded-linux-opensource-src-4.5.0/tools/designer/src/uitools/uitools.pro	2009-03-26 17:17:27.000000000 +0100
-@@ -1,5 +1,5 @@
- TEMPLATE = lib
--TARGET = $$qtLibraryTarget(QtUiTools)
-+TARGET = QtUiTools
- QT += xml
- CONFIG += qt staticlib
- DESTDIR = ../../../../lib
-@@ -39,3 +39,4 @@
-    QMAKE_PKGCONFIG_REQUIRES += QtXml
- }
- 
-+TARGET = $$qtLibraryTarget($$TARGET$$QT_LIBINFIX) #do this towards the end
diff --git a/recipes/qt4/files/4.5.1/0010-no-simpledecoration-example.patch b/recipes/qt4/files/4.5.1/0010-no-simpledecoration-example.patch
deleted file mode 100644
index 070b4ac..0000000
--- a/recipes/qt4/files/4.5.1/0010-no-simpledecoration-example.patch
+++ /dev/null
@@ -1,9 +0,0 @@
---- qt-embedded-linux-opensource-src-4.5.0.orig/examples/qws/qws.pro	2009-02-25 22:32:34.000000000 +0100
-+++ qt-embedded-linux-opensource-src-4.5.0/examples/qws/qws.pro	2009-03-26 19:53:19.000000000 +0100
-@@ -1,5 +1,5 @@
- TEMPLATE      = subdirs
--SUBDIRS       = framebuffer mousecalibration simpledecoration
-+SUBDIRS       = framebuffer mousecalibration
- 
- # install
- sources.files = $$SOURCES $$HEADERS $$RESOURCES $$FORMS README *.pro
diff --git a/recipes/qt4/qt4-embedded-4.4.3/0003-no-tools.patch b/recipes/qt4/qt4-embedded-4.4.3/0003-no-tools.patch
new file mode 100644
index 0000000..bb36444
--- /dev/null
+++ b/recipes/qt4/qt4-embedded-4.4.3/0003-no-tools.patch
@@ -0,0 +1,16 @@
+--- /tmp/src.pro	2008-07-08 10:43:30.000000000 +0200
++++ qt-embedded-linux-opensource-src-4.4.0/src/src.pro	2008-07-08 11:28:24.000000000 +0200
+@@ -6,12 +6,9 @@
+ wince*:{
+   SRC_SUBDIRS += src_corelib src_xml src_gui src_sql src_network src_script src_testlib
+ } else {
+-    SRC_SUBDIRS += src_tools_moc src_tools_rcc src_tools_uic src_corelib src_xml src_network src_gui src_sql src_script src_testlib
++    SRC_SUBDIRS += src_corelib src_xml src_network src_gui src_sql src_script src_testlib
+     contains(QT_CONFIG, qt3support): SRC_SUBDIRS += src_qt3support
+     contains(QT_CONFIG, dbus):SRC_SUBDIRS += src_dbus
+-    !cross_compile {
+-        contains(QT_CONFIG, qt3support): SRC_SUBDIRS += src_tools_uic3
+-    }
+ }
+ win32:!contains(QT_EDITION, OpenSource|Console): {
+     SRC_SUBDIRS += src_activeqt
diff --git a/recipes/qt4/qt4-embedded-4.4.3/0006-freetype-host-includes.patch b/recipes/qt4/qt4-embedded-4.4.3/0006-freetype-host-includes.patch
new file mode 100644
index 0000000..cc8e115
--- /dev/null
+++ b/recipes/qt4/qt4-embedded-4.4.3/0006-freetype-host-includes.patch
@@ -0,0 +1,23 @@
+From c9ab62bd9a56643574b3ae6e59e0ca776d4860d2 Mon Sep 17 00:00:00 2001
+From: Michael Krelin <hacker@klever.net>
+Date: Mon, 4 Jun 2007 14:48:50 +0200
+Subject: [PATCH] freetype host includes
+
+---
+ config.tests/unix/freetype/freetype.pri |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/config.tests/unix/freetype/freetype.pri b/config.tests/unix/freetype/freetype.pri
+index 84974bf..ab9a6f2 100644
+--- a/config.tests/unix/freetype/freetype.pri
++++ b/config.tests/unix/freetype/freetype.pri
+@@ -1,5 +1,5 @@
+ !cross_compile {
+-    TRY_INCLUDEPATHS = /include /usr/include $$QMAKE_INCDIR $$QMAKE_INCDIR_X11 $$INCLUDEPATH
++    TRY_INCLUDEPATHS = $$QMAKE_INCDIR $$QMAKE_INCDIR_X11 $$INCLUDEPATH
+     for(p, TRY_INCLUDEPATHS) {
+         p = $$join(p, "", "", "/freetype2")
+         exists($$p):INCLUDEPATH *= $$p
+-- 
+1.5.0.7
+
diff --git a/recipes/qt4/qt4-embedded-4.4.3/0007-openssl-host-includes.patch b/recipes/qt4/qt4-embedded-4.4.3/0007-openssl-host-includes.patch
new file mode 100644
index 0000000..35b71d9
--- /dev/null
+++ b/recipes/qt4/qt4-embedded-4.4.3/0007-openssl-host-includes.patch
@@ -0,0 +1,23 @@
+From d45943adb443ad4b85ca4504952dee743c675e1e Mon Sep 17 00:00:00 2001
+From: Michael Krelin <hacker@klever.net>
+Date: Mon, 4 Jun 2007 14:58:34 +0200
+Subject: [PATCH] openssl host includes
+
+---
+ config.tests/unix/openssl/openssl.pri |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/config.tests/unix/openssl/openssl.pri b/config.tests/unix/openssl/openssl.pri
+index 756e5fe..19b4061 100644
+--- a/config.tests/unix/openssl/openssl.pri
++++ b/config.tests/unix/openssl/openssl.pri
+@@ -1,5 +1,5 @@
+ !cross_compile {
+-    TRY_INCLUDEPATHS = /include /usr/include /usr/local/include $$QMAKE_INCDIR $$INCLUDEPATH
++    TRY_INCLUDEPATHS = $$QMAKE_INCDIR $$INCLUDEPATH
+     for(p, TRY_INCLUDEPATHS) {
+         pp = $$join(p, "", "", "/openssl")
+         exists($$pp):INCLUDEPATH *= $$p
+-- 
+1.5.0.7
+
diff --git a/recipes/qt4/qt4-embedded-4.4.3/0008-qt-lib-infix.patch b/recipes/qt4/qt4-embedded-4.4.3/0008-qt-lib-infix.patch
new file mode 100644
index 0000000..b1a443f
--- /dev/null
+++ b/recipes/qt4/qt4-embedded-4.4.3/0008-qt-lib-infix.patch
@@ -0,0 +1,45 @@
+diff -urN qt-embedded-linux-opensource-src-4.4.3.orig/mkspecs/features/uitools.prf qt-embedded-linux-opensource-src-4.4.3/mkspecs/features/uitools.prf
+--- qt-embedded-linux-opensource-src-4.4.3.orig/mkspecs/features/uitools.prf	2008-09-27 11:01:24.000000000 +0200
++++ qt-embedded-linux-opensource-src-4.4.3/mkspecs/features/uitools.prf	2008-12-11 20:47:10.000000000 +0100
+@@ -2,10 +2,10 @@
+ qt:load(qt)
+ 
+ # Include the correct version of the UiLoader library
+-QTUITOOLS_LINKAGE = -lQtUiTools
++QTUITOOLS_LINKAGE = -lQtUiTools$${QT_LIBINFIX}
+ CONFIG(debug, debug|release) {
+-    mac: QTUITOOLS_LINKAGE = -lQtUiTools_debug
+-    win32: QTUITOOLS_LINKAGE = -lQtUiToolsd
++    mac: QTUITOOLS_LINKAGE = -lQtUiTools$${QT_LIBINFIX}_debug
++    win32: QTUITOOLS_LINKAGE = -lQtUiTools$${QT_LIBINFIX}d
+ }
+ LIBS += $$QTUITOOLS_LINKAGE
+ 
+diff -urN qt-embedded-linux-opensource-src-4.4.3.orig/tools/designer/src/lib/lib.pro qt-embedded-linux-opensource-src-4.4.3/tools/designer/src/lib/lib.pro
+--- qt-embedded-linux-opensource-src-4.4.3.orig/tools/designer/src/lib/lib.pro	2008-09-27 11:01:29.000000000 +0200
++++ qt-embedded-linux-opensource-src-4.4.3/tools/designer/src/lib/lib.pro	2008-12-11 20:36:40.000000000 +0100
+@@ -58,8 +58,8 @@
+ include(shared/shared.pri)
+ PRECOMPILED_HEADER=lib_pch.h
+ 
+-include(../components/component.pri)
+ include(../sharedcomponents.pri)
++include(../components/component.pri)
+ 
+ target.path=$$[QT_INSTALL_LIBS]
+ INSTALLS        += target
+diff -urN qt-embedded-linux-opensource-src-4.4.3.orig/tools/designer/src/uitools/uitools.pro qt-embedded-linux-opensource-src-4.4.3/tools/designer/src/uitools/uitools.pro
+--- qt-embedded-linux-opensource-src-4.4.3.orig/tools/designer/src/uitools/uitools.pro	2008-09-27 11:01:30.000000000 +0200
++++ qt-embedded-linux-opensource-src-4.4.3/tools/designer/src/uitools/uitools.pro	2008-12-11 19:56:34.000000000 +0100
+@@ -1,5 +1,5 @@
+ TEMPLATE = lib
+-TARGET = $$qtLibraryTarget(QtUiTools)
++TARGET = QtUiTools
+ QT += xml
+ CONFIG += qt staticlib
+ DESTDIR = ../../../../lib
+@@ -38,3 +38,4 @@
+    QMAKE_PKGCONFIG_DESTDIR = pkgconfig
+ }
+ 
++TARGET = $$qtLibraryTarget($$TARGET$$QT_LIBINFIX) #do this towards the end
diff --git a/recipes/qt4/qt4-embedded-4.5.1/0003-no-tools.patch b/recipes/qt4/qt4-embedded-4.5.1/0003-no-tools.patch
new file mode 100644
index 0000000..3829ffc
--- /dev/null
+++ b/recipes/qt4/qt4-embedded-4.5.1/0003-no-tools.patch
@@ -0,0 +1,18 @@
+Index: qt-embedded-linux-opensource-src-4.5.0/src/src.pro
+===================================================================
+--- qt-embedded-linux-opensource-src-4.5.0.orig/src/src.pro	2009-02-25 22:32:41.000000000 +0100
++++ qt-embedded-linux-opensource-src-4.5.0/src/src.pro	2009-03-26 17:11:07.000000000 +0100
+@@ -6,12 +6,9 @@
+ wince*:{
+   SRC_SUBDIRS += src_corelib src_xml src_gui src_sql src_network src_script src_testlib
+ } else {
+-    SRC_SUBDIRS += src_tools_bootstrap src_tools_moc src_tools_rcc src_tools_uic src_corelib src_xml src_network src_gui src_sql src_script src_testlib
++    SRC_SUBDIRS += src_corelib src_xml src_network src_gui src_sql src_script src_testlib
+     contains(QT_CONFIG, qt3support): SRC_SUBDIRS += src_qt3support
+     contains(QT_CONFIG, dbus):SRC_SUBDIRS += src_dbus
+-    !cross_compile {
+-        contains(QT_CONFIG, qt3support): SRC_SUBDIRS += src_tools_uic3
+-    }
+ }
+ win32:!contains(QT_EDITION, OpenSource|Console): {
+     SRC_SUBDIRS += src_activeqt
diff --git a/recipes/qt4/qt4-embedded-4.5.1/0006-freetype-host-includes.patch b/recipes/qt4/qt4-embedded-4.5.1/0006-freetype-host-includes.patch
new file mode 100644
index 0000000..987c425
--- /dev/null
+++ b/recipes/qt4/qt4-embedded-4.5.1/0006-freetype-host-includes.patch
@@ -0,0 +1,20 @@
+From c9ab62bd9a56643574b3ae6e59e0ca776d4860d2 Mon Sep 17 00:00:00 2001
+From: Michael Krelin <hacker@klever.net>
+Date: Mon, 4 Jun 2007 14:48:50 +0200
+Subject: [PATCH] freetype host includes
+
+---
+ config.tests/unix/freetype/freetype.pri |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+Index: qt-embedded-linux-opensource-src-4.5.0/config.tests/unix/freetype/freetype.pri
+===================================================================
+--- qt-embedded-linux-opensource-src-4.5.0.orig/config.tests/unix/freetype/freetype.pri	2009-02-25 22:32:32.000000000 +0100
++++ qt-embedded-linux-opensource-src-4.5.0/config.tests/unix/freetype/freetype.pri	2009-03-26 17:14:16.000000000 +0100
+@@ -1,5 +1,5 @@
+ !cross_compile {
+-    TRY_INCLUDEPATHS = /include /usr/include $$QMAKE_INCDIR $$QMAKE_INCDIR_X11 $$INCLUDEPATH
++    TRY_INCLUDEPATHS = $$QMAKE_INCDIR $$QMAKE_INCDIR_X11 $$INCLUDEPATH
+     # LSB doesn't allow using headers from /include or /usr/include
+     linux-lsb-g++:TRY_INCLUDEPATHS = $$QMAKE_INCDIR $$QMAKE_INCDIR_X11 $$INCLUDEPATH
+     for(p, TRY_INCLUDEPATHS) {
diff --git a/recipes/qt4/qt4-embedded-4.5.1/0007-openssl-host-includes.patch b/recipes/qt4/qt4-embedded-4.5.1/0007-openssl-host-includes.patch
new file mode 100644
index 0000000..3409cc0
--- /dev/null
+++ b/recipes/qt4/qt4-embedded-4.5.1/0007-openssl-host-includes.patch
@@ -0,0 +1,20 @@
+From d45943adb443ad4b85ca4504952dee743c675e1e Mon Sep 17 00:00:00 2001
+From: Michael Krelin <hacker@klever.net>
+Date: Mon, 4 Jun 2007 14:58:34 +0200
+Subject: [PATCH] openssl host includes
+
+---
+ config.tests/unix/openssl/openssl.pri |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+Index: qt-embedded-linux-opensource-src-4.5.0/config.tests/unix/openssl/openssl.pri
+===================================================================
+--- qt-embedded-linux-opensource-src-4.5.0.orig/config.tests/unix/openssl/openssl.pri	2009-02-25 22:32:32.000000000 +0100
++++ qt-embedded-linux-opensource-src-4.5.0/config.tests/unix/openssl/openssl.pri	2009-03-26 17:16:28.000000000 +0100
+@@ -1,5 +1,5 @@
+ !cross_compile {
+-    TRY_INCLUDEPATHS = /include /usr/include /usr/local/include $$QMAKE_INCDIR $$INCLUDEPATH
++    TRY_INCLUDEPATHS = $$QMAKE_INCDIR $$INCLUDEPATH
+     # LSB doesn't allow using headers from /include or /usr/include
+     linux-lsb-g++:TRY_INCLUDEPATHS = $$QMAKE_INCDIR $$INCLUDEPATH
+     for(p, TRY_INCLUDEPATHS) {
diff --git a/recipes/qt4/qt4-embedded-4.5.1/0008-qt-lib-infix.patch b/recipes/qt4/qt4-embedded-4.5.1/0008-qt-lib-infix.patch
new file mode 100644
index 0000000..3efaff3
--- /dev/null
+++ b/recipes/qt4/qt4-embedded-4.5.1/0008-qt-lib-infix.patch
@@ -0,0 +1,34 @@
+Index: qt-embedded-linux-opensource-src-4.5.0/mkspecs/features/uitools.prf
+===================================================================
+--- qt-embedded-linux-opensource-src-4.5.0.orig/mkspecs/features/uitools.prf	2009-02-25 22:32:34.000000000 +0100
++++ qt-embedded-linux-opensource-src-4.5.0/mkspecs/features/uitools.prf	2009-03-26 17:17:27.000000000 +0100
+@@ -2,10 +2,10 @@
+ qt:load(qt)
+ 
+ # Include the correct version of the UiLoader library
+-QTUITOOLS_LINKAGE = -lQtUiTools
++QTUITOOLS_LINKAGE = -lQtUiTools$${QT_LIBINFIX}
+ CONFIG(debug, debug|release) {
+-    mac: QTUITOOLS_LINKAGE = -lQtUiTools_debug
+-    win32: QTUITOOLS_LINKAGE = -lQtUiToolsd
++    mac: QTUITOOLS_LINKAGE = -lQtUiTools$${QT_LIBINFIX}_debug
++    win32: QTUITOOLS_LINKAGE = -lQtUiTools$${QT_LIBINFIX}d
+ }
+ LIBS += $$QTUITOOLS_LINKAGE
+ 
+Index: qt-embedded-linux-opensource-src-4.5.0/tools/designer/src/uitools/uitools.pro
+===================================================================
+--- qt-embedded-linux-opensource-src-4.5.0.orig/tools/designer/src/uitools/uitools.pro	2009-02-25 22:32:42.000000000 +0100
++++ qt-embedded-linux-opensource-src-4.5.0/tools/designer/src/uitools/uitools.pro	2009-03-26 17:17:27.000000000 +0100
+@@ -1,5 +1,5 @@
+ TEMPLATE = lib
+-TARGET = $$qtLibraryTarget(QtUiTools)
++TARGET = QtUiTools
+ QT += xml
+ CONFIG += qt staticlib
+ DESTDIR = ../../../../lib
+@@ -39,3 +39,4 @@
+    QMAKE_PKGCONFIG_REQUIRES += QtXml
+ }
+ 
++TARGET = $$qtLibraryTarget($$TARGET$$QT_LIBINFIX) #do this towards the end
diff --git a/recipes/qt4/qt4-embedded-4.5.1/0010-no-simpledecoration-example.patch b/recipes/qt4/qt4-embedded-4.5.1/0010-no-simpledecoration-example.patch
new file mode 100644
index 0000000..070b4ac
--- /dev/null
+++ b/recipes/qt4/qt4-embedded-4.5.1/0010-no-simpledecoration-example.patch
@@ -0,0 +1,9 @@
+--- qt-embedded-linux-opensource-src-4.5.0.orig/examples/qws/qws.pro	2009-02-25 22:32:34.000000000 +0100
++++ qt-embedded-linux-opensource-src-4.5.0/examples/qws/qws.pro	2009-03-26 19:53:19.000000000 +0100
+@@ -1,5 +1,5 @@
+ TEMPLATE      = subdirs
+-SUBDIRS       = framebuffer mousecalibration simpledecoration
++SUBDIRS       = framebuffer mousecalibration
+ 
+ # install
+ sources.files = $$SOURCES $$HEADERS $$RESOURCES $$FORMS README *.pro
diff --git a/recipes/qt4/qt4-embedded.inc b/recipes/qt4/qt4-embedded.inc
new file mode 100644
index 0000000..bae52ab
--- /dev/null
+++ b/recipes/qt4/qt4-embedded.inc
@@ -0,0 +1,40 @@
+SUMMARY = "Qt is a versatile cross-platform application framework -- this is the embedded version."
+SECTION = "libs"
+LICENSE = "GPL QPL"
+PRIORITY = "optional"
+HOMEPAGE = "http://www.trolltech.com"
+DEPENDS += "tslib"
+INC_PR = "r11"
+
+SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-embedded-linux-opensource-src-${PV}.tar.bz2 \
+           file://0001-cross-compile.patch;patch=1 \
+           file://0002-fix-resinit-declaration.patch;patch=1 \
+           file://0003-no-tools.patch;patch=1 \
+           file://0004-no-qmake.patch;patch=1 \
+           file://0006-freetype-host-includes.patch;patch=1 \
+           file://0007-openssl-host-includes.patch;patch=1 \
+           file://0008-qt-lib-infix.patch;patch=1 \
+           file://0009-support-2bpp.patch;patch=1 \
+           file://g++.conf \
+           file://linux.conf \
+           "
+S = "${WORKDIR}/qt-embedded-linux-opensource-src-${PV}"
+
+QT_CONFIG_FLAGS += " \
+    -qtlibinfix E \
+    -qt-decoration-styled -plugin-decoration-default -plugin-decoration-windows \
+    -plugin-gfx-transformed -plugin-gfx-qvfb -plugin-gfx-vnc \
+    -plugin-mouse-tslib -qt-mouse-pc -qt-mouse-qvfb \
+    -qt-kbd-tty -qt-kbd-usb -qt-kbd-qvfb \
+    -DQT_KEYPAD_NAVIGATION \
+    "
+
+QT_BASE_NAME = "qt4-embedded"
+QT_BASE_LIB  = "libqt-embedded"
+QT_DIR_NAME = "qtopia"
+QT_LIBINFIX="E"
+
+require qt4.inc
+
+inherit qt4e
+
diff --git a/recipes/qt4/qt4-embedded_4.4.3.bb b/recipes/qt4/qt4-embedded_4.4.3.bb
index c7685c3..f5358a0 100644
--- a/recipes/qt4/qt4-embedded_4.4.3.bb
+++ b/recipes/qt4/qt4-embedded_4.4.3.bb
@@ -1,39 +1,3 @@
-SUMMARY = "Qt is a versatile cross-platform application framework -- this is the embedded version."
-SECTION = "libs"
-LICENSE = "GPL QPL"
-PRIORITY = "optional"
-HOMEPAGE = "http://www.trolltech.com"
-DEPENDS += "tslib"
-PR = "r11"
+include qt4-embedded.inc
 
-SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-embedded-linux-opensource-src-${PV}.tar.bz2 \
-           file://0001-cross-compile.patch;patch=1 \
-           file://0002-fix-resinit-declaration.patch;patch=1 \
-           file://0003-no-tools.patch;patch=1 \
-           file://0004-no-qmake.patch;patch=1 \
-           file://0006-freetype-host-includes.patch;patch=1 \
-           file://0007-openssl-host-includes.patch;patch=1 \
-           file://0008-qt-lib-infix.patch;patch=1 \
-           file://0009-support-2bpp.patch;patch=1 \
-           file://g++.conf \
-           file://linux.conf \
-           "
-S = "${WORKDIR}/qt-embedded-linux-opensource-src-${PV}"
-
-QT_CONFIG_FLAGS += " \
-    -qtlibinfix E \
-    -qt-decoration-styled -plugin-decoration-default -plugin-decoration-windows \
-    -plugin-gfx-transformed -plugin-gfx-qvfb -plugin-gfx-vnc \
-    -plugin-mouse-tslib -qt-mouse-pc -qt-mouse-qvfb \
-    -qt-kbd-tty -qt-kbd-usb -qt-kbd-qvfb \
-    -DQT_KEYPAD_NAVIGATION \
-    "
-
-QT_BASE_NAME = "qt4-embedded"
-QT_BASE_LIB  = "libqt-embedded"
-QT_DIR_NAME = "qtopia"
-QT_LIBINFIX="E"
-
-require qt4.inc
-
-inherit qt4e
+PR = "${INC_PR}.1"
diff --git a/recipes/qt4/qt4-embedded_4.5.1.bb b/recipes/qt4/qt4-embedded_4.5.1.bb
index 3ec4b9a..dff754c 100644
--- a/recipes/qt4/qt4-embedded_4.5.1.bb
+++ b/recipes/qt4/qt4-embedded_4.5.1.bb
@@ -1,39 +1,6 @@
-SUMMARY = "Qt is a versatile cross-platform application framework -- this is the embedded version."
-SECTION = "libs"
-LICENSE = "GPL LGPL QPL"
-PRIORITY = "optional"
-HOMEPAGE = "http://www.trolltech.com"
-DEPENDS += "tslib"
+include qt4-embedded.inc
 
-SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-embedded-linux-opensource-src-${PV}.tar.bz2 \
-           file://0001-cross-compile.patch;patch=1 \
-           file://0002-fix-resinit-declaration.patch;patch=1 \
-           file://${PV}/0003-no-tools.patch;patch=1 \
-           file://0004-no-qmake.patch;patch=1 \
-           file://${PV}/0006-freetype-host-includes.patch;patch=1 \
-           file://${PV}/0007-openssl-host-includes.patch;patch=1 \ 
-           file://${PV}/0008-qt-lib-infix.patch;patch=1 \
-           file://0009-support-2bpp.patch;patch=1 \
-           file://${PV}/0010-no-simpledecoration-example.patch;patch=1 \
-           file://g++.conf \
-           file://linux.conf \
-           "
-S = "${WORKDIR}/qt-embedded-linux-opensource-src-${PV}"
+PR = "${INC_PR}.1"
 
-QT_CONFIG_FLAGS += " \
-    -qtlibinfix E \
-    -qt-decoration-styled -plugin-decoration-default -plugin-decoration-windows \
-    -plugin-gfx-transformed -plugin-gfx-qvfb -plugin-gfx-vnc \
-    -plugin-mouse-tslib -qt-mouse-pc -qt-mouse-qvfb \
-    -qt-kbd-tty -qt-kbd-usb -qt-kbd-qvfb \
-    -DQT_KEYPAD_NAVIGATION \
-    "
-
-QT_BASE_NAME = "qt4-embedded"
-QT_BASE_LIB  = "libqt-embedded"
-QT_DIR_NAME = "qtopia"
-QT_LIBINFIX="E"
-
-require qt4.inc
-
-inherit qt4e
+LICENSE += "LGPL"
+SRC_URI += "file://0010-no-simpledecoration-example.patch;patch=1"
-- 
1.6.3.1



