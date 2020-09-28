Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.30590.1601273569515021300
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2020 23:12:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: yi.zhao@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 08S6Cib0011685
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2020 23:12:45 -0700 (PDT)
Received: from localhost (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Sun, 27 Sep
 2020 23:12:43 -0700
From: "Yi Zhao" <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <wonjong.lee@windriver.com>
Subject: [meta-oe][PATCH 1/2] minifi-cpp: do not download source during compile
Date: Mon, 28 Sep 2020 14:12:35 +0800
Message-ID: <20200928061236.7572-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [128.224.162.174]
Content-Type: text/plain

The minifi-cpp needs to download and compile several sources
during compile. Add these sources to SRC_URI to make sure they are
downloaded in do_fetch not in do_compile.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...ts.txt-use-curl-local-source-tarball.patch | 34 +++++++++++++++++++
 ...make-use-libressl-local-source-tarba.patch | 32 +++++++++++++++++
 ...PUUID.cmake-use-ossp-uuid-local-sour.patch | 34 +++++++++++++++++++
 .../minifi-cpp/minifi-cpp_0.7.0.bb            | 14 ++++++++
 4 files changed, 114 insertions(+)
 create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0001-CMakeLists.txt-use-curl-local-source-tarball.patch
 create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0002-cmake-LibreSSL.cmake-use-libressl-local-source-tarba.patch
 create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0003-cmake-BundledOSSPUUID.cmake-use-ossp-uuid-local-sour.patch

diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0001-CMakeLists.txt-use-curl-local-source-tarball.patch b/meta-oe/recipes-extended/minifi-cpp/files/0001-CMakeLists.txt-use-curl-local-source-tarball.patch
new file mode 100644
index 000000000..183a006e8
--- /dev/null
+++ b/meta-oe/recipes-extended/minifi-cpp/files/0001-CMakeLists.txt-use-curl-local-source-tarball.patch
@@ -0,0 +1,34 @@
+From 8d99edeefb23c9d7574a0b5a0e2e3f41b0433490 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Thu, 10 Sep 2020 16:14:10 +0800
+Subject: [PATCH] CMakeLists.txt: use curl local source tarball
+
+Do not download curl source during compile.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ CMakeLists.txt | 6 +-----
+ 1 file changed, 1 insertion(+), 5 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 7cd550fb..215a4ef4 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -314,11 +314,7 @@ endif()
+ 
+   ExternalProject_Add(
+     curl-external
+-    GIT_REPOSITORY "https://github.com/curl/curl.git"
+-    GIT_TAG "f3294d9d86e6a7915a967efff2842089b8b0d071"  # Version 7.64.0
+-    SOURCE_DIR "${CMAKE_CURRENT_BINARY_DIR}/thirdparty/curl-src"
+-    LIST_SEPARATOR % # This is needed for passing semicolon-separated lists
+-    TLS_VERIFY OFF
++    SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/thirdparty/curl-7.64.0"
+     CMAKE_ARGS ${PASSTHROUGH_CMAKE_ARGS}
+                "-DCMAKE_INSTALL_PREFIX=${CMAKE_CURRENT_BINARY_DIR}/thirdparty/curl-install"
+                "-DCMAKE_INSTALL_LIBDIR=lib${LIBSUFFIX}"
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0002-cmake-LibreSSL.cmake-use-libressl-local-source-tarba.patch b/meta-oe/recipes-extended/minifi-cpp/files/0002-cmake-LibreSSL.cmake-use-libressl-local-source-tarba.patch
new file mode 100644
index 000000000..da5ee9754
--- /dev/null
+++ b/meta-oe/recipes-extended/minifi-cpp/files/0002-cmake-LibreSSL.cmake-use-libressl-local-source-tarba.patch
@@ -0,0 +1,32 @@
+From 5a5317044b0039e9e19aabcecb7b666a3f13e136 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Thu, 10 Sep 2020 15:08:19 +0800
+Subject: [PATCH] cmake/LibreSSL.cmake: use libressl local source tarball
+
+Do not download libressl source during compile.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ cmake/LibreSSL.cmake | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/cmake/LibreSSL.cmake b/cmake/LibreSSL.cmake
+index 57319e40..bab30129 100644
+--- a/cmake/LibreSSL.cmake
++++ b/cmake/LibreSSL.cmake
+@@ -43,9 +43,7 @@ function(use_libre_ssl SOURCE_DIR BINARY_DIR)
+ 
+ 	ExternalProject_Add(
+ 	libressl-portable
+-	URL https://cdn.openbsd.org/pub/OpenBSD/LibreSSL/libressl-2.8.3.tar.gz https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-2.8.3.tar.gz https://gentoo.osuosl.org/distfiles/libressl-2.8.3.tar.gz
+-	URL_HASH "SHA256=9b640b13047182761a99ce3e4f000be9687566e0828b4a72709e9e6a3ef98477"
+-	SOURCE_DIR "${BINARY_DIR}/thirdparty/libressl-src"
++	SOURCE_DIR "${SOURCE_DIR}/thirdparty/libressl-2.8.3"
+ 	PATCH_COMMAND ${PATCH}
+ 	CMAKE_ARGS ${PASSTHROUGH_CMAKE_ARGS}
+ 				"-DCMAKE_INSTALL_PREFIX=${BINARY_DIR}/thirdparty/libressl-install"
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0003-cmake-BundledOSSPUUID.cmake-use-ossp-uuid-local-sour.patch b/meta-oe/recipes-extended/minifi-cpp/files/0003-cmake-BundledOSSPUUID.cmake-use-ossp-uuid-local-sour.patch
new file mode 100644
index 000000000..a39e15b79
--- /dev/null
+++ b/meta-oe/recipes-extended/minifi-cpp/files/0003-cmake-BundledOSSPUUID.cmake-use-ossp-uuid-local-sour.patch
@@ -0,0 +1,34 @@
+From 74ade26f7ccd0dbc4ad97cb3082204118a67c92b Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Thu, 10 Sep 2020 15:12:41 +0800
+Subject: [PATCH] cmake/BundledOSSPUUID.cmake: use ossp-uuid local source
+ tarball
+
+Do not download ossp-uuid source during compile.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ cmake/BundledOSSPUUID.cmake | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/cmake/BundledOSSPUUID.cmake b/cmake/BundledOSSPUUID.cmake
+index 1103156d..0cf4bac0 100644
+--- a/cmake/BundledOSSPUUID.cmake
++++ b/cmake/BundledOSSPUUID.cmake
+@@ -47,10 +47,8 @@ function(use_bundled_osspuuid SOURCE_DIR BINARY_DIR)
+ 
+     ExternalProject_Add(
+             ossp-uuid-external
+-            URL "https://deb.debian.org/debian/pool/main/o/ossp-uuid/ossp-uuid_1.6.2.orig.tar.gz"
+-            URL_HASH "SHA256=11a615225baa5f8bb686824423f50e4427acd3f70d394765bdff32801f0fd5b0"
+             BUILD_IN_SOURCE true
+-            SOURCE_DIR "${BINARY_DIR}/thirdparty/ossp-uuid-src"
++            SOURCE_DIR "${SOURCE_DIR}/thirdparty/uuid-1.6.2"
+             BUILD_COMMAND make
+             CMAKE_COMMAND ""
+             UPDATE_COMMAND ""
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
index 37036ebbb..d6f92128c 100644
--- a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
+++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
@@ -12,6 +12,9 @@ RDEPENDS_${PN} = "python3-core"
 
 SRCREV = "aa42957a2e227df41510047cece3cd606dc1cb6a"
 SRC_URI = "git://github.com/apache/nifi-minifi-cpp.git \
+            https://curl.haxx.se/download/curl-7.64.0.tar.bz2;name=curl;subdir=git/thirdparty \
+            https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-2.8.3.tar.gz;name=libressl;subdir=git/thirdparty \
+            ${DEBIAN_MIRROR}/main/o/ossp-uuid/ossp-uuid_1.6.2.orig.tar.gz;name=ossp-uuid;subdir=git/thirdparty \
             file://fix-minifi-compile.patch \
             file://fix-libressl-compile.patch \
             file://fix-libressl-avoid-BSWAP-assembly-for-ARM-v6.patch \
@@ -21,10 +24,21 @@ SRC_URI = "git://github.com/apache/nifi-minifi-cpp.git \
             file://fix-rocksdb-cross-compile.patch \
             file://remove_const_due_to_std_lock_guard.patch \
             file://0001-Add-lxml2-to-linker-cmdline-of-xml-is-found.patch \
+            file://0001-CMakeLists.txt-use-curl-local-source-tarball.patch \
+            file://0002-cmake-LibreSSL.cmake-use-libressl-local-source-tarba.patch \
+            file://0003-cmake-BundledOSSPUUID.cmake-use-ossp-uuid-local-sour.patch \
             file://minifi.service \
             file://systemd-volatile.conf \
             file://sysvinit-volatile.conf \
             "
+
+SRC_URI[curl.md5sum] = "d0bcc586873cfef08b4b9594e5395a33"
+SRC_URI[curl.sha256sum] = "d573ba1c2d1cf9d8533fadcce480d778417964e8d04ccddcc76e591d544cf2eb"
+SRC_URI[libressl.md5sum] = "0f1127bd21b4aa8495a910379c2ad936"
+SRC_URI[libressl.sha256sum] = "9b640b13047182761a99ce3e4f000be9687566e0828b4a72709e9e6a3ef98477"
+SRC_URI[ossp-uuid.md5sum] = "5db0d43a9022a6ebbbc25337ae28942f"
+SRC_URI[ossp-uuid.sha256sum] = "11a615225baa5f8bb686824423f50e4427acd3f70d394765bdff32801f0fd5b0"
+
 S = "${WORKDIR}/git"
 
 inherit pkgconfig cmake systemd
-- 
2.17.1

