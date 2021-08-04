Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web09.6629.1628068669605244972
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Aug 2021 02:17:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 1749HlvM014403
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 4 Aug 2021 02:17:47 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 4 Aug 2021 02:17:47 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 4 Aug 2021 02:17:46 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] hdf5: improve reproducibility
Date: Wed, 4 Aug 2021 17:15:18 +0800
Message-ID: <20210804091518.2934-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Remove the build flags to improve reproducibility.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../files/0001-cmake-remove-build-flags.patch | 65 +++++++++++++++++++
 meta-oe/recipes-support/hdf5/hdf5_1.8.21.bb   |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta-oe/recipes-support/hdf5/files/0001-cmake-remove-build-flags.patch

diff --git a/meta-oe/recipes-support/hdf5/files/0001-cmake-remove-build-flags.patch b/meta-oe/recipes-support/hdf5/files/0001-cmake-remove-build-flags.patch
new file mode 100644
index 000000000..288e642fc
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/files/0001-cmake-remove-build-flags.patch
@@ -0,0 +1,65 @@
+From 39572baac462f16b39dc385751d5c642646718d3 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Wed, 4 Aug 2021 17:05:10 +0800
+Subject: [PATCH] cmake: remove build flags
+
+Remove the build flags to improve reproducibility.
+
+Upstream-Status: Inappropriate[oe specific]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ config/cmake/libh5cc.in                |  2 +-
+ config/cmake/libhdf5.settings.cmake.in | 12 ++++++------
+ 2 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/config/cmake/libh5cc.in b/config/cmake/libh5cc.in
+index f462d56..93c7137 100644
+--- a/config/cmake/libh5cc.in
++++ b/config/cmake/libh5cc.in
+@@ -29,4 +29,4 @@ printf 'dir is %s\n' "$dir"
+ 
+ export PKG_CONFIG_PATH=$dir/lib/pkgconfig
+ 
+-@_PKG_CONFIG_COMPILER@ `pkg-config --define-variable=prefix=$dir --cflags --libs @_PKG_CONFIG_LIBNAME@-@_PKG_CONFIG_VERSION@` $@
++`pkg-config --define-variable=prefix=$dir --cflags --libs @_PKG_CONFIG_LIBNAME@-@_PKG_CONFIG_VERSION@` $@
+diff --git a/config/cmake/libhdf5.settings.cmake.in b/config/cmake/libhdf5.settings.cmake.in
+index c337dea..0ab9066 100644
+--- a/config/cmake/libhdf5.settings.cmake.in
++++ b/config/cmake/libhdf5.settings.cmake.in
+@@ -16,8 +16,8 @@ General Information:
+ Compiling Options:
+ ------------------
+                Compilation Mode: @CMAKE_BUILD_TYPE@ @CMAKE_C_COMPILER_VERSION@
+-                     C Compiler: @CMAKE_C_COMPILER@
+-                         CFLAGS: @CMAKE_C_FLAGS@
++                     C Compiler:
++                         CFLAGS:
+                       H5_CFLAGS: @H5_CFLAGS@
+                       AM_CFLAGS: @AM_CFLAGS@
+                        CPPFLAGS: @CPPFLAGS@
+@@ -29,8 +29,8 @@ Compiling Options:
+                         LDFLAGS: @CMAKE_SHARED_LINKER_FLAGS@
+                      AM_LDFLAGS: @AM_LDFLAGS@
+                 Extra libraries: @LINK_LIBS@
+-                       Archiver: @CMAKE_AR@
+-                         Ranlib: @CMAKE_RANLIB@
++                       Archiver:
++                         Ranlib:
+               Debugged Packages: @DEBUG_PKG@
+                     API Tracing: @HDF5_ENABLE_TRACE@
+ 
+@@ -46,8 +46,8 @@ Languages:
+ @BUILD_FORTRAN_CONDITIONAL_TRUE@         Static Fortran Library: YES
+ 
+                             C++: @HDF5_BUILD_CPP_LIB@
+-@BUILD_CXX_CONDITIONAL_TRUE@                   C++ Compiler: @CMAKE_CXX_COMPILER@ @CMAKE_CXX_COMPILER_VERSION@
+-@BUILD_CXX_CONDITIONAL_TRUE@                      C++ Flags: @CMAKE_CXX_FLAGS@
++@BUILD_CXX_CONDITIONAL_TRUE@                   C++ Compiler:
++@BUILD_CXX_CONDITIONAL_TRUE@                      C++ Flags:
+ @BUILD_CXX_CONDITIONAL_TRUE@                   H5 C++ Flags: @H5_CXXFLAGS@
+ @BUILD_CXX_CONDITIONAL_TRUE@                   AM C++ Flags: @AM_CXXFLAGS@
+ @BUILD_CXX_CONDITIONAL_TRUE@             Shared C++ Library: @H5_ENABLE_SHARED_LIB@
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.8.21.bb b/meta-oe/recipes-support/hdf5/hdf5_1.8.21.bb
index b1de0d8b7..7b886a463 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_1.8.21.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_1.8.21.bb
@@ -16,6 +16,7 @@ SRC_URI = " \
     file://H5Tinit-32.c \
     file://0001-cross-compiling-support.patch \
     file://0002-Remove-suffix-shared-from-shared-library-name.patch \
+    file://0001-cmake-remove-build-flags.patch \
 "
 SRC_URI[md5sum] = "2d2408f2a9dfb5c7b79998002e9a90e9"
 SRC_URI[sha256sum] = "e5b1b1dee44a64b795a91c3321ab7196d9e0871fe50d42969761794e3899f40d"
-- 
2.17.1

