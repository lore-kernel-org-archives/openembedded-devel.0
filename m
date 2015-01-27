Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id 93330718E1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jan 2015 05:54:09 +0000 (UTC)
Received: by mail-we0-f177.google.com with SMTP id l61so12869485wev.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jan 2015 21:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=DZmywJa4UVTcZEQJQGod5yxC8fj/+yar6lvLO02VSw0=;
	b=prhWS+/gReQixLtGe3vWpfGSRTmGZMGtcglEpIHzS8yq6cNCjV9iT7RCVM2c9BQ7+J
	7y/hZcEgPurJmyOMVFJi68zra+ueGffXJWYayQGSc9Ylw3D+L2x3OI0x5+90AF1e96LQ
	9jxuGiVqxUSSFppTJ2deNtKArUMkPLJCdbyOAaDTQ03BDWwklO/QrAsg8SCLqBLpykH9
	mUNUnxSfpjOC32S0e5JFPixr7wuKDI/Z7QI3h1eVE6zWs04S9DeNg+4o5JekDTnKuLlt
	Ui2+VrUVwKlJG/QidZ4aqml+GohfxWa8exhfp52LoV9fa5HwgXa/8C6ic6ivsz/eQ3yD
	c1QQ==
X-Received: by 10.180.87.42 with SMTP id u10mr33343135wiz.51.1422338049465;
	Mon, 26 Jan 2015 21:54:09 -0800 (PST)
Received: from localhost.localdomain
	(ip-176-198-254-85.hsi05.unitymediagroup.de. [176.198.254.85])
	by mx.google.com with ESMTPSA id
	gm10sm16610857wib.19.2015.01.26.21.54.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Jan 2015 21:54:08 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Jan 2015 06:53:51 +0100
Message-Id: <1422338033-18521-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1422338033-18521-1-git-send-email-schnitzeltony@googlemail.com>
References: <1422338033-18521-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 3/5] qtbase: build qmake for target with paths aligned
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
X-List-Received-Date: Tue, 27 Jan 2015 05:54:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Proper qmake operation was tested with qt5-creator.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtbase.inc                          | 25 ++++----
 ...-build-it-in-configure-but-allow-to-build.patch | 27 +++++---
 .../0015-Set-paths-for-target-properly.patch       | 72 ++++++++++++++++++++++
 recipes-qt/qt5/qtbase_git.bb                       |  1 +
 4 files changed, 106 insertions(+), 19 deletions(-)
 create mode 100644 recipes-qt/qt5/qtbase/0015-Set-paths-for-target-properly.patch

diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
index a8748ef..cbb8e4f 100644
--- a/recipes-qt/qt5/qtbase.inc
+++ b/recipes-qt/qt5/qtbase.inc
@@ -16,6 +16,7 @@ SRC_URI += "\
 # specific for qtbase
 SRC_URI += "\
     file://0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch \
+    file://0015-Set-paths-for-target-properly.patch \
 "
 
 DEPENDS += "qtbase-native"
@@ -196,23 +197,23 @@ do_configure() {
 }
 
 do_compile_append() {
-    # Build qmake for the target arch
-    # Disable for now, because doesn't work well with separate ${B}
-    # cp -ra ${S}/qmake ${B}
-    # cd ${B}/qmake
-    # ${OE_QMAKE_QMAKE}
-    # Fix to use headers in ${B}
-    # sed '/INCPATH/s#${S}#${B}#g' -i Makefile
-    # oe_runmake CC="${CC}" CXX="${CXX}"
-    # cd ${B}
+    # copy corelib/3rdparty/qmake sources required by qmake -> ${B}
+    cp -ra ${S}/src/corelib ${B}/src
+    cp -ra ${S}/src/3rdparty ${B}/src
+    cp -ra ${S}/qmake ${B}
+    cp ${S}/.qmake.conf ${B}/qmake
+    cd ${B}/qmake
+    # align qt5 tools source path to ${S}
+    sed -i 's:\.\./tools:${S}/tools:g' qmake.pro
+    ../${OE_QMAKE_QMAKE}
+    oe_runmake CC="${CC}" CXX="${CXX}"
 }
 
 do_install_append() {
+    install -m 0755 ${B}/qmake/bin/qmake ${D}/${bindir}/${QT_DIR_NAME}
+
     ### Fix up the binaries to the right location
     ### TODO: FIX
-    # qemu built on host breaks do_package, remove it here (will be replaces with right qemu when do_compile is fixed
-    # ERROR: objcopy failed with exit code 1 (cmd was 'arm-oe-linux-gnueabi-objcopy' --only-keep-debug '/OE/oe-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/qtbase/5.0.1-r0.0/package/usr/bin/qmake' '/OE/oe-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/qtbase/5.0.1-r0.0/package/usr/bin/.debug/qmake')
-    rm -f ${D}/${bindir}/${QT_DIR_NAME}/qmake
     # install fonts manually if they are missing
     if [ ! -d ${D}/${OE_QMAKE_PATH_LIBS}/fonts ]; then
         cp -a ${S}/lib/fonts ${D}/${OE_QMAKE_PATH_LIBS}
diff --git a/recipes-qt/qt5/qtbase/0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch b/recipes-qt/qt5/qtbase/0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
index 21e0987..4d4291c 100644
--- a/recipes-qt/qt5/qtbase/0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
+++ b/recipes-qt/qt5/qtbase/0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
@@ -14,17 +14,17 @@ Signed-off-by: Yu Ke <ke.yu@intel.com>
 Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
 Signed-off-by: Mikko Levonmaa <mikko.levonmaa@gmail.com>
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
  configure       | 2 +-
+ qmake/qmake.pri | 3 ++-
  qmake/qmake.pro | 2 ++
- 2 files changed, 3 insertions(+), 1 deletion(-)
+ 3 files changed, 5 insertions(+), 2 deletions(-)
 
 diff --git a/configure b/configure
-index bd43281..5d1b3aa 100755
+index 43be722..39516d2 100755
 --- a/configure
 +++ b/configure
-@@ -3724,7 +3724,7 @@ setBootstrapEvalVariable()
- 
+@@ -3759,7 +3759,7 @@ setBootstrapVariable()
+ }
  
  # build qmake
 -if true; then ###[ '!' -f "$outpath/bin/qmake" ];
@@ -32,15 +32,28 @@ index bd43281..5d1b3aa 100755
      echo "Creating qmake..."
  
      mkdir -p "$outpath/qmake" || exit
+diff --git a/qmake/qmake.pri b/qmake/qmake.pri
+index 57dcbb0..e2c5845 100644
+--- a/qmake/qmake.pri
++++ b/qmake/qmake.pri
+@@ -82,7 +82,8 @@ bootstrap { #Qt code
+         qjsonparser.cpp \
+         qjsonarray.cpp \
+         qjsonobject.cpp \
+-        qjsonvalue.cpp
++        qjsonvalue.cpp \
++        qdebug.cpp
+ 
+    HEADERS+= \
+         qbitarray.h \
 diff --git a/qmake/qmake.pro b/qmake/qmake.pro
 index 89d6ea5..7c605b9 100644
 --- a/qmake/qmake.pro
 +++ b/qmake/qmake.pro
-@@ -8,6 +8,8 @@ CONFIG -= qt
+@@ -8,6 +8,7 @@ CONFIG -= qt
  DEFINES += \
      QT_BUILD_QMAKE \
      PROEVALUATOR_FULL
-+DESTDIR = ../bin/
 +TARGET = qmake
  
  VPATH += \
diff --git a/recipes-qt/qt5/qtbase/0015-Set-paths-for-target-properly.patch b/recipes-qt/qt5/qtbase/0015-Set-paths-for-target-properly.patch
new file mode 100644
index 0000000..28512f0
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0015-Set-paths-for-target-properly.patch
@@ -0,0 +1,72 @@
+From d84b7386902e024a0cfe5a6689930e5548a60480 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Thu, 22 Jan 2015 16:09:35 +0100
+Subject: [PATCH] Set paths for target properly
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ configure | 42 +++++++++++++++++++++---------------------
+ 1 file changed, 21 insertions(+), 21 deletions(-)
+
+diff --git a/configure b/configure
+index 43be722..0e1a64a 100755
+--- a/configure
++++ b/configure
+@@ -3634,28 +3634,27 @@ static const char qt_configure_prefix_path_strs[][512 + 12] = {
+     "qt_xmplpath=$QT_SYSROOT_EXAMPLES",
+     "qt_tstspath=$QT_SYSROOT_TESTS",
+ #else
+-    "qt_prfxpath=$QT_INSTALL_PREFIX",
+-    "qt_docspath=$QT_INSTALL_DOCS",
+-    "qt_hdrspath=$QT_INSTALL_HEADERS",
+-    "qt_libspath=$QT_INSTALL_LIBS",
+-    "qt_lbexpath=$QT_INSTALL_LIBEXECS",
+-    "qt_binspath=$QT_INSTALL_BINS",
+-    "qt_plugpath=$QT_INSTALL_PLUGINS",
+-    "qt_impspath=$QT_INSTALL_IMPORTS",
+-    "qt_qml2path=$QT_INSTALL_QML",
+-    "qt_adatpath=$QT_INSTALL_ARCHDATA",
+-    "qt_datapath=$QT_INSTALL_DATA",
+-    "qt_trnspath=$QT_INSTALL_TRANSLATIONS",
+-    "qt_xmplpath=$QT_INSTALL_EXAMPLES",
+-    "qt_tstspath=$QT_INSTALL_TESTS",
+-    "qt_ssrtpath=$CFG_SYSROOT",
+-    "qt_hpfxpath=$QT_HOST_PREFIX",
+-    "qt_hbinpath=$QT_HOST_BINS",
+-    "qt_hlibpath=$QT_HOST_LIBS",
+-    "qt_hdatpath=$QT_HOST_DATA",
+-    "qt_ebinpath=$QT_EXTERNAL_HOST_BINS",
+-    "qt_targspec=$shortxspec",
+-    "qt_hostspec=$shortspec",
++    "qt_prfxpath=$QT_SYSROOT_PREFIX",
++    "qt_docspath=$QT_SYSROOT_DOCS",
++    "qt_hdrspath=$QT_SYSROOT_HEADERS",
++    "qt_libspath=$QT_SYSROOT_LIBS",
++    "qt_lbexpath=$QT_SYSROOT_LIBEXECS",
++    "qt_binspath=$QT_SYSROOT_BINS",
++    "qt_plugpath=$QT_SYSROOT_PLUGINS",
++    "qt_impspath=$QT_SYSROOT_IMPORTS",
++    "qt_qml2path=$QT_SYSROOT_QML",
++    "qt_adatpath=$QT_SYSROOT_ARCHDATA",
++    "qt_datapath=$QT_SYSROOT_DATA",
++    "qt_trnspath=$QT_SYSROOT_TRANSLATIONS",
++    "qt_xmplpath=$QT_SYSROOT_EXAMPLES",
++    "qt_tstspath=$QT_SYSROOT_TESTS",
++    "qt_ssrtpath=",
++    "qt_hpfxpath=$QT_SYSROOT_PREFIX",
++    "qt_hbinpath=$QT_SYSROOT_BINS",
++    "qt_hlibpath=$QT_SYSROOT_LIBS",
++    "qt_hdatpath=$QT_SYSROOT_LIBS/qt5",
++    "qt_targspec=linux-g++",
++    "qt_hostspec=linux-g++",
+ #endif
+ };
+ static const char qt_configure_settings_path_str[256 + 12] = "qt_stngpath=$QT_INSTALL_SETTINGS";
+-- 
+1.8.3.1
+
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 611e19a..0424bc2 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -20,6 +20,7 @@ SRC_URI += "\
 # specific for qtbase
 SRC_URI += "\
     file://0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch \
+    file://0015-Set-paths-for-target-properly.patch \
 "
 
 SRCREV = "47326b9c5c38fea39f8539f50f32667d2c391b70"
-- 
1.8.3.1


