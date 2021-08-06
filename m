Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
 by mx.groups.io with SMTP id smtpd.web10.1416.1628230449943637477
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Aug 2021 23:14:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: siemens.com, ip: 192.35.17.2, mailfrom: andrej.valek@siemens.com)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 1766E79Y007357
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>; Fri, 6 Aug 2021 08:14:07 +0200
Received: from dev.vm6.ccp.siemens.com ([144.145.220.57])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id 1766E6PQ010651;
	Fri, 6 Aug 2021 08:14:07 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 61729950A87;
	Fri,  6 Aug 2021 08:14:06 +0200 (CEST)
From: "Andrej Valek" <andrej.valek@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrej Valek <andrej.valek@siemens.com>
Subject: [OE-core][PATCH] thrift: upgrade to 0.14.2
Date: Fri,  6 Aug 2021 08:13:14 +0200
Message-Id: <20210806061314.26188-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0

License-Update: Added new sections for new files

Configuration changes:
 - BUILD_EXAMPLES - does not exist anymore
 - WITH_SHARED_LIB -> BUILD_SHARED_LIBS, WITH_STATIC_LIB are not to be
 allowed together
 - WITH_AS3=OFF - adobe action script 3 not available

Added new options (disabled by default):
 - javascript, nodejs


Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 ...llationPaths.cmake-Define-libdir-in-terms.patch |  8 ++++----
 .../thrift/{thrift_0.13.0.bb => thrift_0.14.2.bb}  | 22 ++++++++++++----------
 2 files changed, 16 insertions(+), 14 deletions(-)
 rename meta-oe/recipes-connectivity/thrift/{thrift_0.13.0.bb => thrift_0.14.2.bb} (72%)

diff --git a/meta-oe/recipes-connectivity/thrift/thrift/0001-DefineInstallationPaths.cmake-Define-libdir-in-terms.patch b/meta-oe/recipes-connectivity/thrift/thrift/0001-DefineInstallationPaths.cmake-Define-libdir-in-terms.patch
index 485d7a4b0..e1e474ab0 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift/0001-DefineInstallationPaths.cmake-Define-libdir-in-terms.patch
+++ b/meta-oe/recipes-connectivity/thrift/thrift/0001-DefineInstallationPaths.cmake-Define-libdir-in-terms.patch
@@ -12,9 +12,9 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 --- a/build/cmake/DefineInstallationPaths.cmake
 +++ b/build/cmake/DefineInstallationPaths.cmake
-@@ -22,11 +22,11 @@
- set(BIN_INSTALL_DIR "bin" CACHE PATH "The binary install dir (default: bin)")
- set(LIB_INSTALL_DIR "lib${LIB_SUFFIX}" CACHE PATH "The library install dir (default: lib${LIB_SUFFIX})")
+@@ -26,11 +26,11 @@
+     set(LIB_INSTALL_DIR "lib${LIB_SUFFIX}" CACHE PATH "The library install dir (default: lib${LIB_SUFFIX})")
+ endif()
  set(INCLUDE_INSTALL_DIR "include" CACHE PATH "The library install dir (default: include)")
 -set(CMAKE_INSTALL_DIR "lib/cmake" CACHE PATH "The subdirectory to install cmake config files (default: cmake)")
 -set(PKGCONFIG_INSTALL_DIR "lib/pkgconfig" CACHE PATH "The subdirectory to install pkgconfig config files (default: lib/pkgconfig)")
@@ -29,7 +29,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  set(cmakedir "${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_DIR}")
 --- a/build/cmake/DefineCMakeDefaults.cmake
 +++ b/build/cmake/DefineCMakeDefaults.cmake
-@@ -44,8 +44,8 @@ include(BuildType)
+@@ -44,8 +44,8 @@
  # top of the build tree rather than in hard-to-find leaf
  # directories. This simplifies manual testing and the use of the build
  # tree rather than installed thrift libraries.
diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.13.0.bb b/meta-oe/recipes-connectivity/thrift/thrift_0.14.2.bb
similarity index 72%
rename from meta-oe/recipes-connectivity/thrift/thrift_0.13.0.bb
rename to meta-oe/recipes-connectivity/thrift/thrift_0.14.2.bb
index 5a0969710..014613e5d 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift_0.13.0.bb
+++ b/meta-oe/recipes-connectivity/thrift/thrift_0.14.2.bb
@@ -3,16 +3,16 @@ DESCRIPTION =  "A software framework, for scalable cross-language services devel
 HOMEPAGE = "https://thrift.apache.org/"
 
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=394465e125cffc0f133695ed43f14047 \
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c40a383cb3f747e0c7abbf1482f194f0 \
                     file://NOTICE;md5=2659b43daca219f99a2f2626ea128f73"
 
-DEPENDS = "thrift-native boost flex-native bison-native openssl"
+DEPENDS = "thrift-native boost flex-native bison-native openssl zlib"
 
 SRC_URI = "https://www-eu.apache.org/dist/thrift//${PV}/${BPN}-${PV}.tar.gz \
            file://0001-DefineInstallationPaths.cmake-Define-libdir-in-terms.patch \
           "
-SRC_URI[md5sum] = "38a27d391a2b03214b444cb13d5664f1"
-SRC_URI[sha256sum] = "7ad348b88033af46ce49148097afe354d513c1fca7c607b59c33ebb6064b5179"
+SRC_URI[md5sum] = "284a48df355aa3910687ee9b894d3ae8"
+SRC_URI[sha256sum] = "4191bfc0b7490e20cc69f9f4dc6e991fbb612d4551aa9eef1dbf7f4c47ce554d"
 
 BBCLASSEXTEND = "native nativesdk"
 
@@ -25,22 +25,24 @@ export HOST_SYS
 
 EXTRA_OECMAKE = " \
     -DBUILD_LIBRARIES=ON \
+    -DBUILD_SHARED_LIBS=ON \
     -DBUILD_COMPILER=ON \
     -DBUILD_TESTING=OFF \
-    -DBUILD_EXAMPLES=OFF \
     -DBUILD_TUTORIALS=OFF \
+    -DWITH_AS3=OFF \
     -DWITH_CPP=ON \
     -DWITH_JAVA=OFF \
-    -DWITH_PYTHON=OFF \
-    -DWITH_STATIC_LIB=ON \
-    -DWITH_SHARED_LIB=ON \
     -DWITH_OPENSSL=ON \
     -DWITH_QT5=OFF \
+    -DWITH_ZLIB=ON \
 "
 
-PACKAGECONFIG ??= "libevent glib"
-PACKAGECONFIG[libevent] = "-DWITH_LIBEVENT=ON,-DWITH_LIBEVENT=OFF,libevent"
+PACKAGECONFIG ??= "glib libevent"
 PACKAGECONFIG[glib] = "-DWITH_C_GLIB=ON,-DWITH_C_GLIB=OFF,glib-2.0"
+PACKAGECONFIG[libevent] = "-DWITH_LIBEVENT=ON,-DWITH_LIBEVENT=OFF,libevent"
+PACKAGECONFIG[javascript] = "-DWITH_JAVASCRIPT=ON,-DWITH_JAVASCRIPT=OFF,nodejs"
+PACKAGECONFIG[nodejs] = "-DWITH_NODEJS=ON,-DWITH_NODEJS=OFF,nodejs"
+PACKAGECONFIG[python] = "-DWITH_PYTHON=ON,-DWITH_PYTHON=OFF,python"
 
 do_install:append () {
     ln -sf thrift ${D}/${bindir}/thrift-compiler
-- 
2.11.0

