Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web08.26641.1629737483803839445
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Aug 2021 09:51:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=RqZFpvYb;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: okaya@kernel.org)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5F95861371;
	Mon, 23 Aug 2021 16:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1629737482;
	bh=pQl9yZgfAyO+Ac4A8jDLceAiFH5VMTPXZDSxw2BWdpQ=;
	h=From:To:Cc:Subject:Date:From;
	b=RqZFpvYborPC/+xeDIvaOskXQjX8NsHtmgFgZON0bwHtdJERpJrtH3stwzkmNq9wm
	 /atTmQw2LVNr6w1iyVd0JprIG2yA2Hv6S0t5FlWv9A3EOUFi55gLbe1DzWbqewsc05
	 swbKN4y1YSkL3vRgrJrd3DUtNVM1jSqKFDsC24rNptDSaZbtfiIEsN56iio455Mb1/
	 EY/22Qaf1tAnUgnPFvK9uW5H9lLEhBEwCUEaZlDAxNXk5YwNKv8+HLC82xzv3ItPEc
	 nSht54QeRW7vIATCTyfn7IHDTsYGbuq4BPd5RGKc8Bxv3dCsZgIBvYzMnR340VsQOx
	 jVT4dRSp10J/A==
From: "Sinan Kaya" <okaya@kernel.org>
To: openembedded-devel@lists.openembedded.org
Cc: Sinan Kaya <okaya@kernel.org>
Subject: [meta-oe][PATCH v2] c-ares: remove custom patches
Date: Mon, 23 Aug 2021 16:51:15 +0000
Message-Id: <20210823165115.27210-1-okaya@kernel.org>
X-Mailer: git-send-email 2.17.1

Current patch is breaking the library dependencies added by cmake
especially when you are static linking.

Applications need the ws2_32 library to be linked for mingw32
and with the existing patch this is not getting passed to the users.

Current patch seems to address this issue:
https://github.com/c-ares/c-ares/issues/373

Both issues are resolved in 1.17.2:

1.17.2-r0/git $ find . | grep c-ares-config.cmake.in
./c-ares-config.cmake.in
1.17.2-r0/git $ find . | grep libcares.pc.cmake
./libcares.pc.cmake

Signed-off-by: Sinan Kaya <okaya@kernel.org>
---
 ...ror-mv-libcares.pc.cmakein-to-libcar.patch | 27 -------
 .../c-ares/cmake-install-libcares.pc.patch    | 77 -------------------
 .../recipes-support/c-ares/c-ares_1.17.2.bb   |  5 +-
 3 files changed, 1 insertion(+), 108 deletions(-)
 delete mode 100644 meta-oe/recipes-support/c-ares/c-ares/0001-fix-configure-error-mv-libcares.pc.cmakein-to-libcar.patch
 delete mode 100644 meta-oe/recipes-support/c-ares/c-ares/cmake-install-libcares.pc.patch

diff --git a/meta-oe/recipes-support/c-ares/c-ares/0001-fix-configure-error-mv-libcares.pc.cmakein-to-libcar.patch b/meta-oe/recipes-support/c-ares/c-ares/0001-fix-configure-error-mv-libcares.pc.cmakein-to-libcar.patch
deleted file mode 100644
index 8f15f8424c..0000000000
--- a/meta-oe/recipes-support/c-ares/c-ares/0001-fix-configure-error-mv-libcares.pc.cmakein-to-libcar.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From f2f1e134bf5d9d0789942848e03006af8d926cf8 Mon Sep 17 00:00:00 2001
-From: Wang Mingyu <wangmy@cn.fujitsu.com>
-Date: Tue, 17 Mar 2020 12:53:35 +0800
-Subject: [PATCH] fix configure error : mv libcares.pc.cmakein to
- libcares.pc.cmake
-
-Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 3a5878d..c2e5740 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -563,7 +563,7 @@ IF (CARES_STATIC)
- ENDIF()
- 
- # Write ares_config.h configuration file.  This is used only for the build.
--CONFIGURE_FILE (libcares.pc.cmakein ${PROJECT_BINARY_DIR}/libcares.pc @ONLY)
-+CONFIGURE_FILE (libcares.pc.cmake ${PROJECT_BINARY_DIR}/libcares.pc @ONLY)
- 
- 
- 
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-support/c-ares/c-ares/cmake-install-libcares.pc.patch b/meta-oe/recipes-support/c-ares/c-ares/cmake-install-libcares.pc.patch
deleted file mode 100644
index c6f9c6de61..0000000000
--- a/meta-oe/recipes-support/c-ares/c-ares/cmake-install-libcares.pc.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From 2cc41bee63223cb398ea932aad6ecc94ff5b61dd Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Tue, 24 Jul 2018 13:33:33 +0800
-Subject: [PATCH] cmake: Install libcares.pc
-
-Prepare and install libcares.pc file during cmake build, so libraries
-using pkg-config to find libcares will not fail.
-
-Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
-
-update to 1.14.0, fix patch warning
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
-
----
- CMakeLists.txt | 23 +++++++++++++++++------
- 1 file changed, 17 insertions(+), 6 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 08c0247..0020d6b 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -214,22 +214,25 @@ ADD_DEFINITIONS(${SYSFLAGS})
- 
- 
- # Tell C-Ares about libraries to depend on
-+# Also pass these libraries to pkg-config file
-+SET(CARES_PRIVATE_LIBS_LIST)
- IF (HAVE_LIBRESOLV)
--	LIST (APPEND CARES_DEPENDENT_LIBS resolv)
-+	LIST (APPEND CARES_PRIVATE_LIBS_LIST "-lresolv")
- ENDIF ()
- IF (HAVE_LIBNSL)
--	LIST (APPEND CARES_DEPENDENT_LIBS nsl)
-+	LIST (APPEND CARES_PRIVATE_LIBS_LIST "-lnsl")
- ENDIF ()
- IF (HAVE_LIBSOCKET)
--	LIST (APPEND CARES_DEPENDENT_LIBS socket)
-+	LIST (APPEND CARES_PRIVATE_LIBS_LIST "-lsocket")
- ENDIF ()
- IF (HAVE_LIBRT)
--	LIST (APPEND CARES_DEPENDENT_LIBS rt)
-+	LIST (APPEND CARES_PRIVATE_LIBS_LIST "-lrt")
- ENDIF ()
- IF (WIN32)
--	LIST (APPEND CARES_DEPENDENT_LIBS ws2_32 Advapi32)
-+	LIST (APPEND CARES_PRIVATE_LIBS_LIST "-lws2_32")
- ENDIF ()
- 
-+string (REPLACE ";" " " CARES_PRIVATE_LIBS "${CARES_PRIVATE_LIBS_LIST}")
- 
- # When checking for symbols, we need to make sure we set the proper
- # headers, libraries, and definitions for the detection to work properly
-@@ -551,6 +554,15 @@ ENDIF()
- # Record toplevel CMakeLists.txt path
- set(CARES_TOPLEVEL_DIR "${CMAKE_CURRENT_SOURCE_DIR}")
- 
-+# Pass required CFLAGS to pkg-config in case of static library
-+IF (CARES_STATIC)
-+       SET (CPPFLAG_CARES_STATICLIB "-DCARES_STATICLIB")
-+ENDIF()
-+
-+# Write ares_config.h configuration file.  This is used only for the build.
-+CONFIGURE_FILE (libcares.pc.cmakein ${PROJECT_BINARY_DIR}/libcares.pc @ONLY)
-+
-+
- 
- # TRANSFORM_MAKEFILE_INC
- #
-@@ -624,7 +636,6 @@ IF (CARES_INSTALL)
- 	INSTALL (FILES "${CMAKE_CURRENT_BINARY_DIR}/libcares.pc" COMPONENT Devel DESTINATION "${CMAKE_INSTALL_LIBDIR}/pkgconfig")
- ENDIF ()
- 
--
- # Legacy chain-building variables (provided for compatibility with old code).
- # Don't use these, external code should be updated to refer to the aliases directly (e.g., Cares::cares).
- SET (CARES_FOUND 1 CACHE INTERNAL "CARES LIBRARY FOUND")
diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.17.2.bb b/meta-oe/recipes-support/c-ares/c-ares_1.17.2.bb
index 53cc1b68f0..2109d955d0 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.17.2.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.17.2.bb
@@ -5,10 +5,7 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=fb997454c8d62aa6a47f07a8cd48b006"
 
-SRC_URI = "git://github.com/c-ares/c-ares.git;branch=main \
-           file://cmake-install-libcares.pc.patch \
-           file://0001-fix-configure-error-mv-libcares.pc.cmakein-to-libcar.patch \
-           "
+SRC_URI = "git://github.com/c-ares/c-ares.git;branch=main"
 SRCREV = "6654436a307a5a686b008c1d4c93b0085da6e6d8"
 
 UPSTREAM_CHECK_GITTAGREGEX = "cares-(?P<pver>\d+_(\d_?)+)"
-- 
2.17.1

