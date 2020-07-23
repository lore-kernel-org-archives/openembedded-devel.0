Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.6133.1595481771944431460
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2020 22:22:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: wonjong.lee@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 06N5MkgW027487
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2020 22:22:47 -0700 (PDT)
Received: from SEL-WLEE-D1.wrs.com (128.224.239.83) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Wed, 22 Jul 2020
 22:22:45 -0700
From: "wonjong.lee" <wonjong.lee@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <Junhwa.Rhee@windriver.com>, <jeff.kim@windriver.com>,
        <andy.kang@windriver.com>, <wonjong.lee@windriver.com>
Subject: [meta-oe][PATCH v2] minifi: Add recipe for c++ version
Date: Thu, 23 Jul 2020 14:21:22 +0900
Message-ID: <20200723052122.22468-1-wonjong.lee@windriver.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

MiNiFi--a subproject of Apache NiFi--is a complementary data
collection approach that supplements the core tenets of NiFi
in dataflow management, focusing on the collection of data at
the source of its creation. The C++ implementation is an
additional implementation to the one in Java with the aim of
an even smaller resource footprint.

Signed-off-by: wonjong.lee <wonjong.lee@windriver.com>
---
 .../files/fix-OSSPUUID-cross-compile.patch    | 70 +++++++++++++++++++
 .../files/fix-build-issue-in-yocto.patch      | 62 ++++++++++++++++
 .../minifi-cpp/files/minifi.service           | 13 ++++
 .../minifi-cpp/minifi-cpp_0.7.0.bb            | 64 +++++++++++++++++
 4 files changed, 209 insertions(+)
 create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/fix-OSSPUUID-cross-compile.patch
 create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/fix-build-issue-in-yocto.patch
 create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/minifi.service
 create mode 100644 meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb

diff --git a/meta-oe/recipes-extended/minifi-cpp/files/fix-OSSPUUID-cross-compile.patch b/meta-oe/recipes-extended/minifi-cpp/files/fix-OSSPUUID-cross-compile.patch
new file mode 100644
index 000000000..6af47cafb
--- /dev/null
+++ b/meta-oe/recipes-extended/minifi-cpp/files/fix-OSSPUUID-cross-compile.patch
@@ -0,0 +1,70 @@
+diff -urN orig/cmake/BundledOSSPUUID.cmake patched/cmake/BundledOSSPUUID.cmake
+--- orig/cmake/BundledOSSPUUID.cmake	2020-01-07 22:55:55.000000000 +0900
++++ patched/cmake/BundledOSSPUUID.cmake	2020-07-14 11:32:28.221092406 +0900
+@@ -22,7 +22,8 @@
+ 
+     # Define patch step
+     find_package(Patch REQUIRED)
+-    set(PC "${Patch_EXECUTABLE}" -p1 -i "${SOURCE_DIR}/thirdparty/ossp-uuid/ossp-uuid-mac-fix.patch")
++    set(PATCH1 "${Patch_EXECUTABLE}" -p1 -i "${SOURCE_DIR}/thirdparty/ossp-uuid/ossp-uuid-mac-fix.patch")
++    set(PATCH2 "${Patch_EXECUTABLE}" -p1 -i "${SOURCE_DIR}/thirdparty/ossp-uuid/cross-compile-fix.patch")
+ 
+     # Define byproducts
+     set(BYPRODUCTS "lib/libuuid.a"
+@@ -35,7 +36,9 @@
+     ENDFOREACH(BYPRODUCT)
+ 
+     # Build project
+-    set(CONFIGURE_COMMAND ./configure "CFLAGS=-fPIC" "CXXFLAGS=-fPIC" --with-cxx --without-perl --without-php --without-pgsql "--prefix=${BINARY_DIR}/thirdparty/ossp-uuid-install")
++    set(CONFIGURE_COMMAND ac_cv_va_copy=C99 ./configure CFLAGS=-fPIC CXXFLAGS=-fPIC --host=${HOST_SYS}
++        --with-cxx --without-perl --without-php --without-pgsql
++        --prefix=${BINARY_DIR}/thirdparty/ossp-uuid-install)
+     string(TOLOWER "${CMAKE_BUILD_TYPE}" build_type)
+     if(NOT build_type MATCHES debug)
+         list(APPEND CONFIGURE_COMMAND --enable-debug=yes)
+@@ -52,8 +55,8 @@
+             UPDATE_COMMAND ""
+             INSTALL_COMMAND make install
+             BUILD_BYPRODUCTS ${OSSPUUID_LIBRARIES_LIST}
+-            CONFIGURE_COMMAND ""
+-            PATCH_COMMAND ${PC} && ${CONFIGURE_COMMAND}
++            CONFIGURE_COMMAND ${CONFIGURE_COMMAND}
++            PATCH_COMMAND ${PATCH1} && ${PATCH2}
+             STEP_TARGETS build
+             EXCLUDE_FROM_ALL TRUE
+     )
+diff -urN orig/thirdparty/ossp-uuid/cross-compile-fix.patch patched/thirdparty/ossp-uuid/cross-compile-fix.patch
+--- orig/thirdparty/ossp-uuid/cross-compile-fix.patch	1970-01-01 09:00:00.000000000 +0900
++++ patched/thirdparty/ossp-uuid/cross-compile-fix.patch	2020-07-14 11:48:13.781090409 +0900
+@@ -0,0 +1,31 @@
++diff -urN orig/config.sub patched/config.sub
++--- orig/config.sub	2008-07-05 06:43:08.000000000 +0900
+++++ patched/config.sub	2020-07-14 11:46:47.249090591 +0900
++@@ -238,6 +238,7 @@
++ 	# Some are omitted here because they have special meanings below.
++ 	1750a | 580 \
++ 	| a29k \
+++	| aarch64 | aarch64_be \
++ 	| alpha | alphaev[4-8] | alphaev56 | alphaev6[78] | alphapca5[67] \
++ 	| alpha64 | alpha64ev[4-8] | alpha64ev56 | alpha64ev6[78] | alpha64pca5[67] \
++ 	| am33_2.0 \
++@@ -314,6 +315,7 @@
++ 	# Recognize the basic CPU types with company name.
++ 	580-* \
++ 	| a29k-* \
+++	| aarch64-* | aarch64_be-* \
++ 	| alpha-* | alphaev[4-8]-* | alphaev56-* | alphaev6[78]-* \
++ 	| alpha64-* | alpha64ev[4-8]-* | alpha64ev56-* | alpha64ev6[78]-* \
++ 	| alphapca5[67]-* | alpha64pca5[67]-* | arc-* \
++diff -urN orig/shtool patched/shtool
++--- orig/shtool	2008-07-05 06:43:08.000000000 +0900
+++++ patched/shtool	2020-07-13 19:35:49.557213657 +0900
++@@ -1400,7 +1400,7 @@
++             if [ ".$opt_t" = .yes ]; then
++                 echo "strip $dsttmp" 1>&2
++             fi
++-            strip $dsttmp || shtool_exit $?
+++            $STRIP $dsttmp || shtool_exit $?
++         fi
++         if [ ".$opt_o" != . ]; then
++             if [ ".$opt_t" = .yes ]; then
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/fix-build-issue-in-yocto.patch b/meta-oe/recipes-extended/minifi-cpp/files/fix-build-issue-in-yocto.patch
new file mode 100644
index 000000000..a7232c025
--- /dev/null
+++ b/meta-oe/recipes-extended/minifi-cpp/files/fix-build-issue-in-yocto.patch
@@ -0,0 +1,62 @@
+diff -urN orig/cmake/LibreSSL.cmake patched/cmake/LibreSSL.cmake
+--- orig/cmake/LibreSSL.cmake	2020-01-07 22:55:55.000000000 +0900
++++ patched/cmake/LibreSSL.cmake	2020-07-14 12:01:28.321088730 +0900
+@@ -27,6 +27,17 @@
+ 		set(BYPRODUCT_PREFIX "" CACHE STRING "" FORCE)
+ 	set(BUILD_ARGS " -GVisual Studio 15 2017")
+ 	endif(WIN32)
++
++	set(BYPRODUCTS
++		"lib/${BYPRODUCT_PREFIX}crypto${BYPRODUCT_SUFFIX}"
++		"lib/${BYPRODUCT_PREFIX}ssl${BYPRODUCT_SUFFIX}"
++		"lib/${BYPRODUCT_PREFIX}tls${BYPRODUCT_SUFFIX}"
++	)
++	set(LIBRESSL_INSTALL_DIR "${BINARY_DIR}/thirdparty/libressl-install" CACHE STRING "" FORCE)
++	FOREACH(BYPRODUCT ${BYPRODUCTS})
++		LIST(APPEND LIBRESSL_LIBRARIES_LIST "${LIBRESSL_INSTALL_DIR}/${BYPRODUCT}")
++	ENDFOREACH(BYPRODUCT)
++
+ 	ExternalProject_Add(
+ 	libressl-portable
+ 	URL https://cdn.openbsd.org/pub/OpenBSD/LibreSSL/libressl-2.8.3.tar.gz https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-2.8.3.tar.gz https://gentoo.osuosl.org/distfiles/libressl-2.8.3.tar.gz
+@@ -37,6 +48,7 @@
+ 				"-DLIBRESSL_APPS=OFF"
+ 				"-DLIBRESSL_TESTS=OFF"
+ 				"${BUILD_ARGS}"
++	BUILD_BYPRODUCTS ${LIBRESSL_LIBRARIES_LIST}
+ 	)
+ 
+ 	add_library(crypto STATIC IMPORTED)
+diff -urN orig/CMakeLists.txt patched/CMakeLists.txt
+--- orig/CMakeLists.txt	2020-01-07 22:55:55.000000000 +0900
++++ patched/CMakeLists.txt	2020-07-14 16:25:51.581055220 +0900
+@@ -120,12 +120,12 @@
+ endif()
+ 
+ # Use ccache if present
+-find_program(CCACHE_FOUND ccache)
+-if(CCACHE_FOUND)
+-    set_property(GLOBAL PROPERTY RULE_LAUNCH_COMPILE ccache)
+-    set_property(GLOBAL PROPERTY RULE_LAUNCH_LINK ccache)
+-    message("-- Found ccache: ${CCACHE_FOUND}")
+-endif(CCACHE_FOUND)
++#find_program(CCACHE_FOUND ccache)
++#if(CCACHE_FOUND)
++#    set_property(GLOBAL PROPERTY RULE_LAUNCH_COMPILE ccache)
++#    set_property(GLOBAL PROPERTY RULE_LAUNCH_LINK ccache)
++#    message("-- Found ccache: ${CCACHE_FOUND}")
++#endif(CCACHE_FOUND)
+ 
+ if (UNIX AND USE_GOLD_LINKER AND NOT APPLE )
+   execute_process(COMMAND ${CMAKE_C_COMPILER} -fuse-ld=gold -Wl,--version ERROR_QUIET OUTPUT_VARIABLE ld_version)
+@@ -303,8 +303,10 @@
+     GIT_TAG "f3294d9d86e6a7915a967efff2842089b8b0d071"  # Version 7.64.0
+     SOURCE_DIR "${CMAKE_CURRENT_BINARY_DIR}/thirdparty/curl-src"
+     LIST_SEPARATOR % # This is needed for passing semicolon-separated lists
++    TLS_VERIFY OFF
+     CMAKE_ARGS ${PASSTHROUGH_CMAKE_ARGS}
+                "-DCMAKE_INSTALL_PREFIX=${CMAKE_CURRENT_BINARY_DIR}/thirdparty/curl-install"
++               "-DCMAKE_INSTALL_LIBDIR=lib${LIBSUFFIX}"
+                 -DCMAKE_POSITION_INDEPENDENT_CODE=ON
+                 -DBUILD_CURL_EXE=OFF
+                 -DBUILD_TESTING=OFF
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/minifi.service b/meta-oe/recipes-extended/minifi-cpp/files/minifi.service
new file mode 100644
index 000000000..c0e419c67
--- /dev/null
+++ b/meta-oe/recipes-extended/minifi-cpp/files/minifi.service
@@ -0,0 +1,13 @@
+[Unit]
+Description=MiNiFi Service
+After=network.target
+RequiresMountsFor=/var
+
+[Service]
+Type=simple
+Environment=MINIFI_HOME=/etc/minifi
+ExecStartPre=@BASE_BINDIR@/mkdir -p /var/lib/minifi /var/log/minifi
+ExecStart=@BINDIR@/minifi
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
new file mode 100644
index 000000000..b7e6c26fd
--- /dev/null
+++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
@@ -0,0 +1,64 @@
+SUMMARY = "A subproject of Apache NiFi to collect data where it originates."
+DESCRIPTION = "MiNiFi--a subproject of Apache NiFi--is a complementary \
+data collection approach that supplements the core tenets of NiFi in dataflow \
+management, focusing on the collection of data at the source of its creation."
+HOMEPAGE = "https://nifi.apache.org/minifi/index.html"
+SECTION = "console/network"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f9534eb5f4ab800b573a37bffc62f3a7"
+
+DEPENDS = "libxcrypt bzip2 expat flex zlib python3 bison-native"
+RDEPENDS_${PN} = "python3-core"
+
+SRCREV = "aa42957a2e227df41510047cece3cd606dc1cb6a"
+SRC_URI = "git://github.com/apache/nifi-minifi-cpp.git \
+           file://fix-build-issue-in-yocto.patch \
+           file://fix-OSSPUUID-cross-compile.patch \
+           file://minifi.service \
+           "
+
+S = "${WORKDIR}/git"
+
+inherit pkgconfig cmake systemd
+
+SYSTEMD_PACKAGES = "minifi-cpp"
+SYSTEMD_SERVICE_${PN} = "minifi.service"
+
+EXTRA_OECMAKE += " \
+    -DHOST_SYS=${HOST_SYS} -DBUILD_SYS=${BUILD_SYS} \
+    -DSKIP_TESTS=ON \
+    "
+
+OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM = "BOTH"
+
+
+do_install() {
+    DESTDIR='${B}/minifi-install' cmake_runcmake_build --target ${OECMAKE_TARGET_INSTALL}
+
+    CONF_DIR=${D}${base_prefix}/etc/minifi/conf
+    install -d ${D}${base_prefix}/usr/bin
+    install -d ${CONF_DIR}
+    cp -a ${B}/minifi-install/usr/bin/*   ${D}${base_prefix}/usr/bin/
+    cp -a ${B}/minifi-install/usr/conf/*  ${CONF_DIR}/
+    sed -i 's|#appender.rolling.directory=.*|appender.rolling.directory=/var/log/minifi|g' \
+        ${CONF_DIR}/minifi-log.properties
+    sed -i 's|nifi.provenance.repository.directory.default=.*|nifi.provenance.repository.directory.default=/var/lib/minifi/provenance_repository|g' \
+        ${CONF_DIR}/minifi.properties
+    sed -i 's|nifi.flowfile.repository.directory.default=.*|nifi.flowfile.repository.directory.default=/var/lib/minifi/flowfile_repository|g' \
+        ${CONF_DIR}/minifi.properties
+    sed -i 's|nifi.database.content.repository.directory.default=.*|nifi.database.content.repository.directory.default=/var/lib/minifi/content_repository|g' \
+        ${CONF_DIR}/minifi.properties
+    sed -i 's|nifi.flow.configuration.file=.*|nifi.flow.configuration.file=/etc/minifi/conf/config.yml|g' \
+        ${CONF_DIR}/minifi.properties
+
+    install -m 0755 -d ${D}${systemd_unitdir}/system
+    install -m 0644 ${WORKDIR}/minifi.service ${D}${systemd_unitdir}/system/
+    sed -i -e 's|@BASE_BINDIR@|${base_bindir}|g' ${D}${systemd_unitdir}/system/minifi.service
+    sed -i -e 's|@BINDIR@|${bindir}|g' ${D}${systemd_unitdir}/system/minifi.service
+}
+
+FILES_${PN} = " \
+        /usr/bin/* \
+        /etc/minifi/* \
+        ${systemd_unitdir}/system/minifi.service \
+        "
-- 
2.27.0

