Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89A07E7544B
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 12:11:31 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.119497.1766578289270142489
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Dec 2025 04:11:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EROuyAH3;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47796a837c7so39885755e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 04:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766578287; x=1767183087; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e5znPyawQJMKY0ag3h5sTbpW2jMUYFDTsTMUWh5Fl+w=;
        b=EROuyAH3szhuur8vSTQN+WsOwTUvcJRZGFoprm42NjJ2/F3jnECTHod1cRiCIh33cu
         nq2tUy72gPgNtfoVjdk5UUKim1iWax28OL0binjxlf4wOK4hxEbQq+MeK8D7PWN552fD
         2sLRAQKmaGa5cuvEZ57JIQtcEiktgI/+RwL2OxkwRdkd4JlUeQj4zORHKjHe70B7P80J
         T9fgCTjc2rTzsqDS5qU0+niwcCagiTre7t+qfjFQnwTgr2Osjfw35gHqS1MyNjq90fU1
         jsLHg09fDc6aXjywVlTYxlg2N49II4SI56YhxVVuPXqeUP8dig+YuP1G56FFYMTVUR8U
         0SCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766578287; x=1767183087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e5znPyawQJMKY0ag3h5sTbpW2jMUYFDTsTMUWh5Fl+w=;
        b=A8OqA16J0hiYGFkxi4aS2n+w/ZKWZfqgifq5JPA1Ps/ER/7kmyoBV6jhStp/TxN7Ve
         unKkqjUhO9lQUcvKkipVNk6XEbxWwKxiqj5ivmdW+6xH7g9Qiqa8UKZII7BssiAX9yBW
         WPXB1Kam3TUf6ulPY0OGMKHA2VhCVZe0djA5MCGUMeKDXafeNOyUgIOHMPxYtccwWFm9
         Ix14EVTnsYBgiytkWWxe7Vi3Uf4LUCMZzXUHLzpVIyYLRM5KEIfyutzERPj54cEJxPwQ
         cYajspOX1sIyMSsc1bfN9EogwldD+Vb4gnTVpDc9i0QFokuQR0QA0GdXtcQ4fvGDzfBo
         wmGw==
X-Gm-Message-State: AOJu0YxkkRL2LNJzpPu8CGPSX78tbTPw9S7nQyokyyHlXuDP+RNZXpWP
	ououEINtc6PQDi7R/aQ7mKPihkrFaehRQSELt+HKtPbdnvv/mbWqd3zYLaY9rg==
X-Gm-Gg: AY/fxX4Vq343oklmOTEP8y30RyBWF9RWDinulxX7KX0B9YvnZSUfq+Z45eaKkkuJWFj
	H6NFDlD/TXczO9Qa+FcG27b1mi4d1ToKJ9Ws34WH14ZeoeIQaGyYGkSCOBR0A0cZuIrV39W0OWV
	5rbESMvOBOlys5UvCudCQ3kEfL7kYgK2CLR8y/GqgGL3hgCmLCJkvTnX6ZTBqqGpwfmTWYtf3eA
	6Ti9q5JMsV6rd6xCEDgGTilA4NySaYCvWKcu45QD1LfajBZbxGpzlpLXT0WybS8vBxM88yqQAoR
	y01LSe+JA9jte+pUUdhS7Rw9k9gYHWs09Q4871oPsQnaZZPIWPDlsi0qjDYJhaGXpzj47JU0wpe
	k8j3ezbtNEqiijksFyTS3NghJe0v0Pp/5CYmGSW2uujVqy9wTuSzebJa2N8pfRQbmVjhsY6F06z
	MQJVyZYu3ilNdvKkKXWEH1o9bMaUoArMCGuePyHJ7owZ1syv/AMcUNHrmvqoLbz8oLMr2WFXhuz
	icw9PiZRWysZAny0PoKY1o015OrTv+0LIDZrELqnextm1pvtO+CB5D7yh4W5w==
X-Google-Smtp-Source: AGHT+IGInnjlm6oZqT1IA+wfEWtj9uwtAbVl79PHHdgyApL+OIB5ge4ysQdBmeBw1rUm3rVtvZ+fag==
X-Received: by 2002:a05:600c:a31c:b0:47d:264e:b435 with SMTP id 5b1f17b1804b1-47d264eb68dmr102553125e9.22.1766578286988;
        Wed, 24 Dec 2025 04:11:26 -0800 (PST)
Received: from localhost.localdomain (2a02-1812-512-2c00-5cba-763c-2ed2-f98a.ip6.access.telenet.be. [2a02:1812:512:2c00:5cba:763c:2ed2:f98a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be27b28a7sm347951525e9.12.2025.12.24.04.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 04:11:26 -0800 (PST)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Rob.Woolley@windriver.com,
	Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-oe][PATCH v2] freeglut: version 3.4.0 -> 3.8.0
Date: Wed, 24 Dec 2025 13:10:55 +0100
Message-ID: <20251224121055.1826975-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 12:11:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122882

patch to add support for legacy OpenGL (Thanks Rob Woolley)

| -- Found OpenGL: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-linux/freeglut/3.8.0/recipe-sysroot/usr/lib/libGL.so  found components: OpenGL
| -- Found PkgConfig: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-linux/freeglut/3.8.0/recipe-sysroot-native/usr/bin/pkg-config (found version "0.29.2")
| CMake Error at /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-linux/freeglut/3.8.0/recipe-sysroot-native/usr/share/cmake-4.2/Modules/FindPackageHandleStandardArgs.cmake:290 (message):
|   Could NOT find OpenGL (missing: OPENGL_opengl_LIBRARY)

Changlog:

2025-11-16  John Tsiombikas <nuclear@mutantstargoat.com>

	freeglut 3.8 changes:

	* New experimental Cocoa (native MacOS X) backend.
	* Add glutSwapInterval, to control vsync (currently X11 and win32 only).
	* glutExtensionSupported now also reports platform extensions (GLX/WGL).
	* Fix build issues with new cmake versions while maintaining
	  compatibility with old cmake.
	* Fix handling of UTF8 window/icon titles.
	* Fix issue with some X11 window managers not properly restoring
	  iconified windows (send _NET_ACTIVE_WINDOW EWMH client message).
	* Fix build issues with C23 compilers (empty argument list semantics).
	* Fix compatibility with older versions of windows which don't have
	  RAWHID support (before XP), by loading the entry points dynamically.
	* Fix glutInitDisplayString parsing of "aux", and add =N parsing support
	  to specify samples and auxbufs.
	* Various fixes and improvements in the GameCube/Wii backend.
	* Altbuild support for Solaris 2.6/SUN Workshop C.
	* Started conversion of documentation from the website to markdown in
	  the source tree: doc/api.md
	* Added the original GLUT manpages, with permission from Mark Kilgard.
	* New demos: accum, vsync, and windows.
	* Cleanup of some old and no longer relevant, or redundant comments in
	  the source code.
	* Removed some out of date README files, and updated others.

2024-06-08  John Tsiombikas <nuclear@member.fsf.org>

	freeglut 3.6 changes:

	* New platforms: Nintendo Gamecube and Nintendo Wii.
	* Minimum cmake version raised to 3.1.
	* Make XInput an optional dependency.
	* Fix incorrect modifier bit mapped to GLUT_ACTIVE_SUPER on X11.
	* Add support for ARM64 MSVC targets.
	* Fix for unicode builds on windows.
	* Fix build on some versions of MinGW carrying an incorrect winuser.h.
	* Fix menu-related memory leak when an error occurs.
	* Various build improvements & fixes.

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../0001-Add-support-for-legacy-OpenGL.patch  | 45 +++++++++++++++++++
 .../{freeglut_3.4.0.bb => freeglut_3.8.0.bb}  | 14 +++---
 2 files changed, 54 insertions(+), 5 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/freeglut/freeglut/0001-Add-support-for-legacy-OpenGL.patch
 rename meta-oe/recipes-graphics/freeglut/{freeglut_3.4.0.bb => freeglut_3.8.0.bb} (73%)

diff --git a/meta-oe/recipes-graphics/freeglut/freeglut/0001-Add-support-for-legacy-OpenGL.patch b/meta-oe/recipes-graphics/freeglut/freeglut/0001-Add-support-for-legacy-OpenGL.patch
new file mode 100644
index 0000000000..b7dc2a58aa
--- /dev/null
+++ b/meta-oe/recipes-graphics/freeglut/freeglut/0001-Add-support-for-legacy-OpenGL.patch
@@ -0,0 +1,45 @@
+From a4c51ae7897f1ad82d10e593344511b3d7b81dbc Mon Sep 17 00:00:00 2001
+From: Jan Vermaete <jan.vermaete@gmail.com>
+Date: Wed, 24 Dec 2025 12:58:36 +0100
+Subject: [PATCH 1/1] Add support for legacy OpenGL
+
+Upstream-Status: Pending
+
+Signed-off-by: Rob Woolley <rob.woolley@windriver.com>
+Commited-by: Jan Vermaete <jan.vermaete@gmail.com>
+---
+ CMakeLists.txt | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 23741bf..31b3ac8 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -378,13 +378,13 @@ IF(FREEGLUT_GLES)
+       FIND_PACKAGE(OpenGL REQUIRED COMPONENTS EGL GLES2 OpenGL)
+       CMAKE_PATH(GET OPENGL_gles2_LIBRARY PARENT_PATH _OPENGL_LIBDIR)
+       FIND_LIBRARY(GLES1_LIBRARY GLESv1_CM HINTS ${_OPENGL_LIBDIR} REQUIRED)
+-      LIST(APPEND LIBS ${GLES1_LIBRARY} OpenGL::EGL OpenGL::GLES2 OpenGL::OpenGL)
++      LIST(APPEND LIBS ${GLES1_LIBRARY} OpenGL::EGL OpenGL::GLES2 OpenGL::GL)
+     elseif(NOT CMAKE_VERSION VERSION_LESS "3.10")
+       FIND_PACKAGE(OpenGL REQUIRED COMPONENTS EGL OpenGL)
+       GET_FILENAME_COMPONENT(_OPENGL_LIBDIR ${OPENGL_egl_LIBRARY} DIRECTORY)
+       FIND_LIBRARY(GLES1_LIBRARY GLESv1_CM HINTS ${_OPENGL_LIBDIR})
+       FIND_LIBRARY(GLES2_LIBRARY GLESv2 HINTS ${_OPENGL_LIBDIR})
+-      LIST(APPEND LIBS ${GLES1_LIBRARY} ${GLES2_LIBRARY} OpenGL::EGL OpenGL::OpenGL)
++      LIST(APPEND LIBS ${GLES1_LIBRARY} ${GLES2_LIBRARY} OpenGL::EGL OpenGL::GL)
+     else()
+       FIND_PACKAGE(OpenGL REQUIRED)
+       LIST(GET ${OPENGL_LIBRARIES} 0 _OPENGL_LIB)
+@@ -433,7 +433,7 @@ IF(FREEGLUT_WAYLAND)
+   INCLUDE(FindPkgConfig)
+   if(NOT CMAKE_VERSION VERSION_LESS "3.10")
+     FIND_PACKAGE(OpenGL REQUIRED COMPONENTS EGL OpenGL)
+-    LIST(APPEND LIBS OpenGL::EGL OpenGL::OpenGL)
++    LIST(APPEND LIBS OpenGL::EGL OpenGL::GL)
+   else()
+     FIND_PACKAGE(OpenGL REQUIRED)
+     LIST(GET ${OPENGL_LIBRARIES} 0 _OPENGL_LIB)
+-- 
+2.47.3
+
diff --git a/meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb b/meta-oe/recipes-graphics/freeglut/freeglut_3.8.0.bb
similarity index 73%
rename from meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb
rename to meta-oe/recipes-graphics/freeglut/freeglut_3.8.0.bb
index 13f3d111fe..5c6ab1a1d7 100644
--- a/meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb
+++ b/meta-oe/recipes-graphics/freeglut/freeglut_3.8.0.bb
@@ -4,21 +4,25 @@ HOMEPAGE = "https://freeglut.sourceforge.net"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=89c0b58a3e01ce3d8254c9f59e78adfb"
 
-SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BPN}-${PV}.tar.gz"
-SRC_URI[sha256sum] = "3c0bcb915d9b180a97edaebd011b7a1de54583a838644dcd42bb0ea0c6f3eaec"
+SRC_URI = "\
+    https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BPN}-${PV}.tar.gz \
+    file://0001-Add-support-for-legacy-OpenGL.patch \
+    "
+SRC_URI[sha256sum] = "674dcaff25010e09e450aec458b8870d9e98c46f99538db457ab659b321d9989"
 
 inherit cmake features_check pkgconfig
 
-EXTRA_OECMAKE = "-DCMAKE_POLICY_VERSION_MINIMUM=3.5"
-
 # depends on virtual/libgl and libxi
 REQUIRED_DISTRO_FEATURES = "opengl x11"
 
-PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11', d)}"
+PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11 glvnd', d)} \
+                  ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gles', '', d)}"
+PACKAGECONFIG[glvnd] = "-DOpenGL_GL_PREFERENCE=GLVND,-DOpenGL_GL_PREFERENCE=LEGACY, libglvnd"
 PACKAGECONFIG[gles] = "-DFREEGLUT_GLES=ON,-DFREEGLUT_GLES=OFF,"
 PACKAGECONFIG[wayland] = "-DFREEGLUT_WAYLAND=ON,-DFREEGLUT_WAYLAND=OFF,libxkbcommon"
 PACKAGECONFIG[demos] = "-DFREEGLUT_BUILD_DEMOS=ON,-DFREEGLUT_BUILD_DEMOS=OFF,"
 PACKAGECONFIG[x11] = ",,virtual/libx11 libice libxmu libglu libxrandr libxext"
+
 # Add -Wno-implicit-function-declaration since it might be otherwise treated at
 # error by clang16+ and this is not really a problem
 CFLAGS += "-Wno-implicit-function-declaration"
-- 
2.47.3


