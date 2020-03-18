Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 7153460267
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2020 01:49:19 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,565,1574092800"; d="scan'208";a="86504502"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Mar 2020 09:49:17 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 9768050A998D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2020 09:39:13 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1497.2; Wed, 18 Mar 2020 09:49:14 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 18 Mar 2020 09:49:23 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 18 Mar 2020 00:19:48 -0700
Message-ID: <1584515992-22564-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 9768050A998D.A453E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] c-ares: upgrade 1.15.0 -> 1.16.0
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
X-List-Received-Date: Wed, 18 Mar 2020 01:49:21 -0000
Content-Type: text/plain

add 0001-fix-configure-error-mv-libcares.pc.cmakein-to-libcar.patch
to fix error of do_configure

refresh cmake-install-libcares.pc.patch

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...ror-mv-libcares.pc.cmakein-to-libcar.patch | 27 ++++++++++
 .../c-ares/cmake-install-libcares.pc.patch    | 54 +++++--------------
 .../{c-ares_1.15.0.bb => c-ares_1.16.0.bb}    |  5 +-
 3 files changed, 43 insertions(+), 43 deletions(-)
 create mode 100644 meta-oe/recipes-support/c-ares/c-ares/0001-fix-configure-error-mv-libcares.pc.cmakein-to-libcar.patch
 rename meta-oe/recipes-support/c-ares/{c-ares_1.15.0.bb => c-ares_1.16.0.bb} (78%)

diff --git a/meta-oe/recipes-support/c-ares/c-ares/0001-fix-configure-error-mv-libcares.pc.cmakein-to-libcar.patch b/meta-oe/recipes-support/c-ares/c-ares/0001-fix-configure-error-mv-libcares.pc.cmakein-to-libcar.patch
new file mode 100644
index 000000000..8f15f8424
--- /dev/null
+++ b/meta-oe/recipes-support/c-ares/c-ares/0001-fix-configure-error-mv-libcares.pc.cmakein-to-libcar.patch
@@ -0,0 +1,27 @@
+From f2f1e134bf5d9d0789942848e03006af8d926cf8 Mon Sep 17 00:00:00 2001
+From: Wang Mingyu <wangmy@cn.fujitsu.com>
+Date: Tue, 17 Mar 2020 12:53:35 +0800
+Subject: [PATCH] fix configure error : mv libcares.pc.cmakein to
+ libcares.pc.cmake
+
+Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 3a5878d..c2e5740 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -563,7 +563,7 @@ IF (CARES_STATIC)
+ ENDIF()
+ 
+ # Write ares_config.h configuration file.  This is used only for the build.
+-CONFIGURE_FILE (libcares.pc.cmakein ${PROJECT_BINARY_DIR}/libcares.pc @ONLY)
++CONFIGURE_FILE (libcares.pc.cmake ${PROJECT_BINARY_DIR}/libcares.pc @ONLY)
+ 
+ 
+ 
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-support/c-ares/c-ares/cmake-install-libcares.pc.patch b/meta-oe/recipes-support/c-ares/c-ares/cmake-install-libcares.pc.patch
index 8cadb2bba..0eb7e4bbb 100644
--- a/meta-oe/recipes-support/c-ares/c-ares/cmake-install-libcares.pc.patch
+++ b/meta-oe/recipes-support/c-ares/c-ares/cmake-install-libcares.pc.patch
@@ -12,39 +12,37 @@ update to 1.14.0, fix patch warning
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
- CMakeLists.txt      | 23 +++++++++++++++++++++++
- libcares.pc.cmakein | 20 ++++++++++++++++++++
- 2 files changed, 43 insertions(+)
- create mode 100644 libcares.pc.cmakein
+ CMakeLists.txt | 28 +++++++++++++++++++++++-----
+ 1 file changed, 23 insertions(+), 5 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 60a880c..71eaa53 100644
+index fd123e1..3a5878d 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -193,22 +193,30 @@ ADD_DEFINITIONS(${SYSFLAGS})
+@@ -214,22 +214,25 @@ ADD_DEFINITIONS(${SYSFLAGS})
  
  
  # Tell C-Ares about libraries to depend on
 +# Also pass these libraries to pkg-config file
 +SET(CARES_PRIVATE_LIBS_LIST)
  IF (HAVE_LIBRESOLV)
- 	LIST (APPEND CARES_DEPENDENT_LIBS resolv)
+-	LIST (APPEND CARES_DEPENDENT_LIBS resolv)
 +	LIST (APPEND CARES_PRIVATE_LIBS_LIST "-lresolv")
  ENDIF ()
  IF (HAVE_LIBNSL)
- 	LIST (APPEND CARES_DEPENDENT_LIBS nsl)
+-	LIST (APPEND CARES_DEPENDENT_LIBS nsl)
 +	LIST (APPEND CARES_PRIVATE_LIBS_LIST "-lnsl")
  ENDIF ()
  IF (HAVE_LIBSOCKET)
- 	LIST (APPEND CARES_DEPENDENT_LIBS socket)
+-	LIST (APPEND CARES_DEPENDENT_LIBS socket)
 +	LIST (APPEND CARES_PRIVATE_LIBS_LIST "-lsocket")
  ENDIF ()
  IF (HAVE_LIBRT)
- 	LIST (APPEND CARES_DEPENDENT_LIBS rt)
+-	LIST (APPEND CARES_DEPENDENT_LIBS rt)
 +	LIST (APPEND CARES_PRIVATE_LIBS_LIST "-lrt")
  ENDIF ()
  IF (WIN32)
- 	LIST (APPEND CARES_DEPENDENT_LIBS ws2_32)
+-	LIST (APPEND CARES_DEPENDENT_LIBS ws2_32 Advapi32)
 +	LIST (APPEND CARES_PRIVATE_LIBS_LIST "-lws2_32")
  ENDIF ()
  
@@ -52,7 +50,7 @@ index 60a880c..71eaa53 100644
  
  # When checking for symbols, we need to make sure we set the proper
  # headers, libraries, and definitions for the detection to work properly
-@@ -514,6 +522,15 @@ CONFIGURE_FILE (ares_build.h.cmake ${PROJECT_BINARY_DIR}/ares_build.h)
+@@ -554,6 +557,15 @@ CONFIGURE_FILE (ares_build.h.cmake ${PROJECT_BINARY_DIR}/ares_build.h)
  # Write ares_config.h configuration file.  This is used only for the build.
  CONFIGURE_FILE (ares_config.h.cmake ${PROJECT_BINARY_DIR}/ares_config.h)
  
@@ -68,8 +66,8 @@ index 60a880c..71eaa53 100644
  
  # TRANSFORM_MAKEFILE_INC
  #
-@@ -664,6 +681,12 @@ IF (CARES_INSTALL)
- 	INSTALL (FILES "${CMAKE_CURRENT_BINARY_DIR}/libcares.pc" DESTINATION "${CMAKE_INSTALL_LIBDIR}/pkgconfig")
+@@ -728,6 +740,12 @@ IF (CARES_INSTALL)
+ 	INSTALL (FILES "${CMAKE_CURRENT_BINARY_DIR}/libcares.pc" COMPONENT Devel DESTINATION "${CMAKE_INSTALL_LIBDIR}/pkgconfig")
  ENDIF ()
  
 +# pkg-config file
@@ -81,32 +79,6 @@ index 60a880c..71eaa53 100644
  # Legacy chain-building variables (provided for compatibility with old code).
  # Don't use these, external code should be updated to refer to the aliases directly (e.g., Cares::cares).
  SET (CARES_FOUND 1 CACHE INTERNAL "CARES LIBRARY FOUND")
-diff --git a/libcares.pc.cmakein b/libcares.pc.cmakein
-new file mode 100644
-index 0000000..3579256
---- /dev/null
-+++ b/libcares.pc.cmakein
-@@ -0,0 +1,20 @@
-+#***************************************************************************
-+# Project        ___       __ _ _ __ ___  ___ 
-+#               / __|____ / _` | '__/ _ \/ __|
-+#              | (_|_____| (_| | | |  __/\__ \
-+#               \___|     \__,_|_|  \___||___/
-+#
-+prefix=@CMAKE_INSTALL_PREFIX@
-+exec_prefix=@CMAKE_INSTALL_PREFIX@
-+libdir=@CMAKE_INSTALL_FULL_LIBDIR@
-+includedir=@CMAKE_INSTALL_FULL_INCLUDEDIR@
-+
-+Name: c-ares
-+URL: http://daniel.haxx.se/projects/c-ares/
-+Description: asynchronous DNS lookup library
-+Version: @VERSION@
-+Requires: 
-+Requires.private: 
-+Cflags: -I${includedir} @CPPFLAG_CARES_STATICLIB@
-+Libs: -L${libdir} -lcares
-+Libs.private: @CARES_PRIVATE_LIBS@
 -- 
-2.7.4
+2.17.1
 
diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.15.0.bb b/meta-oe/recipes-support/c-ares/c-ares_1.16.0.bb
similarity index 78%
rename from meta-oe/recipes-support/c-ares/c-ares_1.15.0.bb
rename to meta-oe/recipes-support/c-ares/c-ares_1.16.0.bb
index d437529dc..e235b9b95 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.15.0.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.16.0.bb
@@ -5,13 +5,14 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=fb997454c8d62aa6a47f07a8cd48b006"
 
-PV = "1.15.0+gitr${SRCPV}"
+PV = "1.16.0+gitr${SRCPV}"
 
 SRC_URI = "\
     git://github.com/c-ares/c-ares.git \
     file://cmake-install-libcares.pc.patch \
+    file://0001-fix-configure-error-mv-libcares.pc.cmakein-to-libcar.patch \
 "
-SRCREV = "e982924acee7f7313b4baa4ee5ec000c5e373c30"
+SRCREV = "077a587dccbe2f0d8a1987fbd3525333705c2249"
 
 UPSTREAM_CHECK_GITTAGREGEX = "cares-(?P<pver>\d+_(\d_?)+)"
 
-- 
2.17.1




