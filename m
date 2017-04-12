Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 62B1B77CD7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 19:56:52 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id u2so32062550wmu.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 12:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=O8Wnbo3S+xFilKRy5fU2oc4O18t4BYJZAOLDDpvN19o=;
	b=o+rgUvB9j6QnNveVezPJpjwUoj6UN6y7B++RObcWDYtAHQbJsH8whv1rYPjuLm80Nd
	MUXxvPoD6KT2cThwFTTDpUUZ1e3MTiuLbmh4qzi9v0liSMQg6w++21ByVmTgkbdONafo
	nJfykBPUT7O+AkzMEub9SgCjre4LX04W53uOWjzc62prSC8CfcjB3CzsijhMFI2onK5+
	61r/+0Spapk+u0hbqNIFzMGQU3T1i1/KB9YQ4WilAv/hL9iaa+tezApNeDrlJW+sMbay
	r04ETJJTyC7du9E6huJqekpRYVuC62id6K54r3eTKN9OSJHg37rGCcdd8Yeo+D00rVl1
	VYig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=O8Wnbo3S+xFilKRy5fU2oc4O18t4BYJZAOLDDpvN19o=;
	b=eMySKkW0I9vKNk2/IPXlFu/lW7uDB+mavZ7sY5jLXGNEXUzeM2Xlr8fzrpb1T9MHUC
	sZWyuonDWtkkTkjOtK6DDgNscEkxUKiV47ZVIyisbRGr1i743xfAagVqtTPRDWe1SYdB
	yJXOgNqsLifRokYNUf4GjTQ5dVlXt2HZe52Q0AE8sqC84dL/6CIjd/y/DYTzTijtFH/F
	gfo1saRfGBLptRaDtxkGolHEvzEa6AdhkKRwuZKxD4kjFB0qn9zNzenIqqv48fWzTAEK
	5rUay7XkyNPLbH7eItfvOsEDfmOjKPzHjndAa1xhZSnApdHuvRZJXcz1wmzwzOCcZ8iE
	UYDw==
X-Gm-Message-State: AN3rC/7miLXyJ0L7Tu8KfcJGV7Nd7UNZIaq19tzHYWrKY4zqhwF31IEH
	C3V+s7ilSfoglA8B
X-Received: by 10.28.218.197 with SMTP id r188mr5369wmg.0.1492027013314;
	Wed, 12 Apr 2017 12:56:53 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911F1781E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:f178:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	t100sm3522637wrc.24.2017.04.12.12.56.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Apr 2017 12:56:52 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Apr 2017 21:56:10 +0200
Message-Id: <20170412195638.3243-2-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170412195638.3243-1-schnitzeltony@googlemail.com>
References: <20170412195638.3243-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 01/29] fltk: rework completely
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
X-List-Received-Date: Wed, 12 Apr 2017 19:56:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* Use cmake as build system. Projects also using cmake and depending on fltk
  would not find all required components. Note that FindFLTK.cmake is part of
  cmake.
* Add a native recipe and split out common - we need fluid (Fast Light User
  Interface Designer) as working binary

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-support/fltk/fltk-native.bb        | 16 ++++++++
 meta-oe/recipes-support/fltk/fltk.bb               | 34 ++++++++++++++++
 meta-oe/recipes-support/fltk/fltk.inc              | 21 ++++++++++
 ...ces.cxx-do-not-use-dlopen-in-case-glibc-s.patch | 39 ++++++++++++++++++
 ...02-always-build-fluid-and-export-pointers.patch | 31 ++++++++++++++
 meta-oe/recipes-support/fltk/fltk_1.3.4-1.bb       | 47 ----------------------
 6 files changed, 141 insertions(+), 47 deletions(-)
 create mode 100644 meta-oe/recipes-support/fltk/fltk-native.bb
 create mode 100644 meta-oe/recipes-support/fltk/fltk.bb
 create mode 100644 meta-oe/recipes-support/fltk/fltk.inc
 create mode 100644 meta-oe/recipes-support/fltk/fltk/0001-Fl_Preferences.cxx-do-not-use-dlopen-in-case-glibc-s.patch
 create mode 100644 meta-oe/recipes-support/fltk/fltk/0002-always-build-fluid-and-export-pointers.patch
 delete mode 100644 meta-oe/recipes-support/fltk/fltk_1.3.4-1.bb

diff --git a/meta-oe/recipes-support/fltk/fltk-native.bb b/meta-oe/recipes-support/fltk/fltk-native.bb
new file mode 100644
index 0000000..353987e
--- /dev/null
+++ b/meta-oe/recipes-support/fltk/fltk-native.bb
@@ -0,0 +1,16 @@
+require ${BPN}.inc
+
+DEPENDS = "zlib-native jpeg-native libpng-native libxext-native libxft-native"
+
+inherit native
+
+EXTRA_OECMAKE += " \
+    -DOPTION_BUILD_SHARED_LIBS=OFF \
+    -DOPTION_USE_THREADS=OFF \
+    -DOPTION_USE_XDBE=OFF \
+    -DOPTION_USE_XFT=OFF \
+    -DOPTION_BUILD_EXAMPLES=OFF \
+    -DOPTION_USE_XINERAMA=OFF \
+    -DOPTION_USE_XFIXES=OFF \
+    -DOPTION_USE_XCURSOR=OFF \
+"
diff --git a/meta-oe/recipes-support/fltk/fltk.bb b/meta-oe/recipes-support/fltk/fltk.bb
new file mode 100644
index 0000000..542fd66
--- /dev/null
+++ b/meta-oe/recipes-support/fltk/fltk.bb
@@ -0,0 +1,34 @@
+require ${BPN}.inc
+
+DEPENDS = "alsa-lib zlib jpeg libpng libxext libxft  ${BPN}-native"
+
+inherit binconfig lib_package gtk-icon-cache mime
+
+EXTRA_OECMAKE = " \
+    -DOPTION_BUILD_SHARED_LIBS=ON \
+    -DOPTION_USE_THREADS=ON \
+    -DOPTION_USE_XDBE=ON \
+    -DOPTION_USE_XFT=ON \
+    -DFLTK_CONFIG_PATH=${libdir}/cmake \
+"
+
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)}"
+
+PACKAGECONFIG[examples] = "-DOPTION_BUILD_EXAMPLES=ON,-DOPTION_BUILD_EXAMPLES=OFF,"
+PACKAGECONFIG[opengl] = "-DOPTION_USE_GL=ON,-DOPTION_USE_GL=OFF,virtual/libgl"
+PACKAGECONFIG[xinerama] = "-DOPTION_USE_XINERAMA=ON,-DOPTION_USE_XINERAMA=OFF,libxinerama"
+PACKAGECONFIG[xfixes] = "-DOPTION_USE_XFIXES=ON,-DOPTION_USE_XFIXES=OFF,libxfixes"
+PACKAGECONFIG[xcursor] = "-DOPTION_USE_XCURSOR=ON,-DOPTION_USE_XCURSOR=OFF,libxcursor"
+
+do_install_append() {
+    sed -i -e 's,${STAGING_DIR_HOST},,g' ${D}${bindir}/fltk-config
+}
+
+python populate_packages_prepend () {
+    if (d.getVar('DEBIAN_NAMES')):
+        d.setVar('PKG_${BPN}', 'libfltk${PV}')
+}
+
+LEAD_SONAME = "libfltk.so"
+
+FILES_${PN} += "${datadir}/mime"
diff --git a/meta-oe/recipes-support/fltk/fltk.inc b/meta-oe/recipes-support/fltk/fltk.inc
new file mode 100644
index 0000000..dbe700a
--- /dev/null
+++ b/meta-oe/recipes-support/fltk/fltk.inc
@@ -0,0 +1,21 @@
+SUMMARY = "FLTK is a cross-platform C++ GUI toolkit"
+HOMEPAGE = "http://www.fltk.org"
+SECTION = "libs"
+LICENSE = "LGPLv2 & FLTK"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f6b26344a24a941a01a5b0826e80b5ca"
+
+SRC_URI = " \
+    http://fltk.org/pub/fltk/1.3.4/${BP}-source.tar.gz \
+    file://disable_test.patch \
+    file://fltk-no-freetype-config.patch \
+    file://0001-Fl_Preferences.cxx-do-not-use-dlopen-in-case-glibc-s.patch \
+    file://0002-always-build-fluid-and-export-pointers.patch \
+"
+
+PV = "1.3.4-1"
+SRC_URI[md5sum] = "d7fcd27ab928648e1a1366dd2e273970"
+SRC_URI[sha256sum] = "7fb2c8882433ce694e6900c94fda505e8f4ed3fa9c7e597007098a33b85c53f4"
+
+inherit cmake pkgconfig
+
+TARGET_CC_ARCH += "${LDFLAGS} -DXFT_MAJOR=2"
diff --git a/meta-oe/recipes-support/fltk/fltk/0001-Fl_Preferences.cxx-do-not-use-dlopen-in-case-glibc-s.patch b/meta-oe/recipes-support/fltk/fltk/0001-Fl_Preferences.cxx-do-not-use-dlopen-in-case-glibc-s.patch
new file mode 100644
index 0000000..e6e68a0
--- /dev/null
+++ b/meta-oe/recipes-support/fltk/fltk/0001-Fl_Preferences.cxx-do-not-use-dlopen-in-case-glibc-s.patch
@@ -0,0 +1,39 @@
+From e76a062338063615c069fedc5a143cc38c34d9b2 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Tue, 28 Feb 2017 01:00:21 +0100
+Subject: [PATCH] Fl_Preferences.cxx: do not use dlopen in case glibc's headers
+ are missing
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+| /home/work/x86_64-linux/fltk-native/1.3.4-1-r0/fltk-1.3.4-1/src/Fl_Preferences.cxx: In static member function ‘static int Fl_Plugin_Manager::load(const char*)’:
+| /home/work/x86_64-linux/fltk-native/1.3.4-1-r0/fltk-1.3.4-1/src/Fl_Preferences.cxx:1741:27: error: ‘RTLD_LAZY’ was not declared in this scope
+|      dl = dlopen(filename, RTLD_LAZY);
+|                            ^~~~~~~~~
+| /home/work/x86_64-linux/fltk-native/1.3.4-1-r0/fltk-1.3.4-1/src/Fl_Preferences.cxx:1741:36: error: ‘dlopen’ was not declared in this scope
+|      dl = dlopen(filename, RTLD_LAZY);
+|                                     ^
+| src/CMakeFiles/fltk.dir/build.make:1217: recipe for target 'src/CMakeFiles/fltk.dir/Fl_Preferences.cxx.o' failed
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ src/Fl_Preferences.cxx | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/Fl_Preferences.cxx b/src/Fl_Preferences.cxx
+index 1233bb1..7857b9b 100644
+--- a/src/Fl_Preferences.cxx
++++ b/src/Fl_Preferences.cxx
+@@ -1737,7 +1737,7 @@ int Fl_Plugin_Manager::load(const char *filename) {
+   HMODULE dl = LoadLibrary(filename);
+ #else
+   void * dl = NULL;
+-# if HAVE_DLSYM
++# if HAVE_DLSYM && HAVE_DLFCN_H
+     dl = dlopen(filename, RTLD_LAZY);
+ # endif
+ #endif
+-- 
+2.9.3
+
diff --git a/meta-oe/recipes-support/fltk/fltk/0002-always-build-fluid-and-export-pointers.patch b/meta-oe/recipes-support/fltk/fltk/0002-always-build-fluid-and-export-pointers.patch
new file mode 100644
index 0000000..cca977c
--- /dev/null
+++ b/meta-oe/recipes-support/fltk/fltk/0002-always-build-fluid-and-export-pointers.patch
@@ -0,0 +1,31 @@
+From 16010cb1a69ea2326d8102b7f1e34b65aca4b278 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Tue, 28 Feb 2017 01:20:42 +0100
+Subject: [PATCH] always build fluid and export pointers
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ CMake/export.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMake/export.cmake b/CMake/export.cmake
+index 968186a..95e04eb 100644
+--- a/CMake/export.cmake
++++ b/CMake/export.cmake
+@@ -21,7 +21,7 @@
+ # final config and export
+ #######################################################################
+ # Set the fluid executable path
+-if(CMAKE_CROSSCOMPILING)
++if(FALSE)
+    find_file(FLUID_PATH
+       NAMES fluid fluid.exe
+       PATHS ENV PATH
+-- 
+2.9.3
+
diff --git a/meta-oe/recipes-support/fltk/fltk_1.3.4-1.bb b/meta-oe/recipes-support/fltk/fltk_1.3.4-1.bb
deleted file mode 100644
index 801c8e7..0000000
--- a/meta-oe/recipes-support/fltk/fltk_1.3.4-1.bb
+++ /dev/null
@@ -1,47 +0,0 @@
-SUMMARY = "FLTK is a cross-platform C++ GUI toolkit"
-HOMEPAGE = "http://www.fltk.org"
-SECTION = "libs"
-LICENSE = "LGPLv2 & FLTK"
-LIC_FILES_CHKSUM = "file://COPYING;md5=f6b26344a24a941a01a5b0826e80b5ca"
-
-DEPENDS = "alsa-lib zlib jpeg libpng libxext libxft"
-
-SRC_URI = " \
-    http://fltk.org/pub/fltk/1.3.4/${BP}-source.tar.gz \
-    file://disable_test.patch \
-    file://fltk-no-freetype-config.patch \
-"
-
-SRC_URI[md5sum] = "d7fcd27ab928648e1a1366dd2e273970"
-SRC_URI[sha256sum] = "7fb2c8882433ce694e6900c94fda505e8f4ed3fa9c7e597007098a33b85c53f4"
-
-inherit autotools-brokensep binconfig pkgconfig lib_package
-
-EXTRA_AUTORECONF = "--exclude=autopoint,autoheader"
-
-TARGET_CC_ARCH += "${LDFLAGS} -DXFT_MAJOR=2"
-
-EXTRA_OECONF = "--enable-shared \
-                --enable-threads \
-                --enable-xdbe \
-                --enable-xft \
-"
-
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)}"
-
-PACKAGECONFIG[opengl] = "--enable-gl,--disable-gl,virtual/libgl"
-PACKAGECONFIG[xinerama] = "--enable-xinerama,--disable-xinerama,libxinerama"
-PACKAGECONFIG[xfixes] = "--enable-xfixes,--disable-xfixes,libxfixes"
-PACKAGECONFIG[xcursor] = "--enable-xcursor,--disable-xcursor,libxcursor"
-
-do_install_append_class-target() {
-    sed -i -e 's,${STAGING_DIR_HOST},,g' ${D}${bindir}/fltk-config
-}
-
-python populate_packages_prepend () {
-    if (d.getVar('DEBIAN_NAMES')):
-        d.setVar('PKG_${BPN}', 'libfltk${PV}')
-}
-
-LEAD_SONAME = "libfltk.so"
-
-- 
2.9.3


