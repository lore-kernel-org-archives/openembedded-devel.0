Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.41945.1597053891269007363
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2020 03:04:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: wonjong.lee@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 07AA4SJ3005917
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2020 03:04:39 -0700
Received: from SEL-WLEE-D1.wrs.com (128.224.239.83) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Mon, 10 Aug 2020
 03:04:06 -0700
From: "wonjong.lee" <wonjong.lee@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <Junhwa.Rhee@windriver.com>, <jeff.kim@windriver.com>,
        <andy.kang@windriver.com>
Subject: [meta-oe][PATCH v4] minifi: Add recipe for c++ version
Date: Mon, 10 Aug 2020 19:02:31 +0900
Message-ID: <20200810100231.20870-1-wonjong.lee@windriver.com>
X-Mailer: git-send-email 2.28.0
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
 ...essl-avoid-BSWAP-assembly-for-ARM-v6.patch |  34 +++++
 .../files/fix-libressl-compile.patch          |  43 +++++++
 .../minifi-cpp/files/fix-minifi-compile.patch |  60 +++++++++
 .../files/fix-osspuuid-compile.patch          |  36 ++++++
 .../files/fix-osspuuid-cross-compile.patch    |  37 ++++++
 .../files/fix-osspuuid-musl-compile.patch     |  25 ++++
 .../files/fix-rocksdb-cross-compile.patch     |  12 ++
 .../minifi-cpp/files/minifi.service           |  13 ++
 .../minifi-cpp/files/systemd-volatile.conf    |   2 +
 .../minifi-cpp/files/sysvinit-volatile.conf   |   2 +
 .../minifi-cpp/minifi-cpp_0.7.0.bb            | 116 ++++++++++++++++++
 11 files changed, 380 insertions(+)
 create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/fix-libressl-avoid-BSWAP-assembly-for-ARM-v6.patch
 create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/fix-libressl-compile.patch
 create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/fix-minifi-compile.patch
 create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/fix-osspuuid-compile.patch
 create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/fix-osspuuid-cross-compile.patch
 create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/fix-osspuuid-musl-compile.patch
 create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/fix-rocksdb-cross-compile.patch
 create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/minifi.service
 create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/systemd-volatile.conf
 create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/sysvinit-volatile.conf
 create mode 100644 meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb

diff --git a/meta-oe/recipes-extended/minifi-cpp/files/fix-libressl-avoid-BSWAP-assembly-for-ARM-v6.patch b/meta-oe/recipes-extended/minifi-cpp/files/fix-libressl-avoid-BSWAP-assembly-for-ARM-v6.patch
new file mode 100644
index 000000000..d0febfd53
--- /dev/null
+++ b/meta-oe/recipes-extended/minifi-cpp/files/fix-libressl-avoid-BSWAP-assembly-for-ARM-v6.patch
@@ -0,0 +1,34 @@
+diff -urN -x .git orig/thirdparty/libressl/avoid-BSWAP-assembly-for-ARM-v6.patch patched/thirdparty/libressl/avoid-BSWAP-assembly-for-ARM-v6.patch
+--- orig/thirdparty/libressl/avoid-BSWAP-assembly-for-ARM-v6.patch	1970-01-01 09:00:00.000000000 +0900
++++ patched/thirdparty/libressl/avoid-BSWAP-assembly-for-ARM-v6.patch	2020-08-07 23:14:46.196764271 +0900
+@@ -0,0 +1,30 @@
++This patch was imported from the libressl potable.
++https://github.com/libressl-portable/portable/commit/a9332ccecfce63bf54924e70c11f420edd3ae312
++
++From a9332ccecfce63bf54924e70c11f420edd3ae312 Mon Sep 17 00:00:00 2001
++From: Brent Cook <bcook@openbsd.org>
++Date: Sun, 17 Jul 2016 18:12:23 -0500
++Subject: [PATCH] avoid BSWAP assembly for ARM <= v6
++
++diff -urN orig/crypto/modes/modes_lcl.h patched/crypto/modes/modes_lcl.h
++--- orig/crypto/modes/modes_lcl.h	2018-11-18 21:27:10.000000000 +0900
+++++ patched/crypto/modes/modes_lcl.h	2020-08-07 23:11:01.960764745 +0900
++@@ -45,14 +45,16 @@
++ 			asm ("bswapl %0"		\
++ 			: "+r"(ret));	ret;		})
++ # elif (defined(__arm__) || defined(__arm)) && !defined(__STRICT_ALIGNMENT)
++-#  define BSWAP8(x) ({	u32 lo=(u64)(x)>>32,hi=(x);	\
+++#  if (__ARM_ARCH >= 6)
+++#   define BSWAP8(x) ({	u32 lo=(u64)(x)>>32,hi=(x);	\
++ 			asm ("rev %0,%0; rev %1,%1"	\
++ 			: "+r"(hi),"+r"(lo));		\
++ 			(u64)hi<<32|lo;			})
++-#  define BSWAP4(x) ({	u32 ret;			\
+++#   define BSWAP4(x) ({	u32 ret;			\
++ 			asm ("rev %0,%1"		\
++ 			: "=r"(ret) : "r"((u32)(x)));	\
++ 			ret;				})
+++#  endif
++ # endif
++ #endif
++ #endif
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/fix-libressl-compile.patch b/meta-oe/recipes-extended/minifi-cpp/files/fix-libressl-compile.patch
new file mode 100644
index 000000000..84b8c8cb0
--- /dev/null
+++ b/meta-oe/recipes-extended/minifi-cpp/files/fix-libressl-compile.patch
@@ -0,0 +1,43 @@
+diff -urN -x .git orig/cmake/LibreSSL.cmake patched/cmake/LibreSSL.cmake
+--- orig/cmake/LibreSSL.cmake	2020-08-07 21:58:34.660773928 +0900
++++ patched/cmake/LibreSSL.cmake	2020-08-07 22:51:18.620767245 +0900
+@@ -18,6 +18,9 @@
+ function(use_libre_ssl SOURCE_DIR BINARY_DIR)
+ 	message("Using bundled LibreSSL from release")
+ 	
++	find_package(Patch REQUIRED)
++	set(PATCH "${Patch_EXECUTABLE}" -p1 -i "${SOURCE_DIR}/thirdparty/libressl/avoid-BSWAP-assembly-for-ARM-v6.patch")
++
+ 	set(BYPRODUCT_PREFIX "lib" CACHE STRING "" FORCE)
+ 	set(BYPRODUCT_SUFFIX ".a" CACHE STRING "" FORCE)
+ 	
+@@ -27,16 +30,29 @@
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
+ 	URL_HASH "SHA256=9b640b13047182761a99ce3e4f000be9687566e0828b4a72709e9e6a3ef98477"
+ 	SOURCE_DIR "${BINARY_DIR}/thirdparty/libressl-src"
++	PATCH_COMMAND ${PATCH}
+ 	CMAKE_ARGS ${PASSTHROUGH_CMAKE_ARGS}
+ 				"-DCMAKE_INSTALL_PREFIX=${BINARY_DIR}/thirdparty/libressl-install"
+ 				"-DLIBRESSL_APPS=OFF"
+ 				"-DLIBRESSL_TESTS=OFF"
+ 				"${BUILD_ARGS}"
++	BUILD_BYPRODUCTS ${LIBRESSL_LIBRARIES_LIST}
+ 	)
+ 
+ 	add_library(crypto STATIC IMPORTED)
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/fix-minifi-compile.patch b/meta-oe/recipes-extended/minifi-cpp/files/fix-minifi-compile.patch
new file mode 100644
index 000000000..9653ba342
--- /dev/null
+++ b/meta-oe/recipes-extended/minifi-cpp/files/fix-minifi-compile.patch
@@ -0,0 +1,60 @@
+diff -urN -x .git orig/CMakeLists.txt patched/CMakeLists.txt
+--- orig/CMakeLists.txt	2020-08-07 21:58:34.656773928 +0900
++++ patched/CMakeLists.txt	2020-08-10 15:08:31.800278357 +0900
+@@ -119,13 +119,28 @@
+ 	endif()
+ endif()
+ 
++include(CheckCXXSourceCompiles)
++CHECK_CXX_SOURCE_COMPILES("
++    #include <atomic>
++    int main(int argc, char **argv) {
++        uint8_t m;
++        __atomic_load_8(&m, 0);
++        __atomic_fetch_add_1(&m , 0, 0);
++        return 0;
++    }"
++    HAVE_ATOMIC
++)
++if(NOT HAVE_ATOMIC)
++    set(LIB_ATOMIC atomic)
++endif()
++
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
+@@ -303,8 +318,10 @@
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
+diff -urN -x .git orig/libminifi/CMakeLists.txt patched/libminifi/CMakeLists.txt
+--- orig/libminifi/CMakeLists.txt	2020-08-07 21:58:34.676773928 +0900
++++ patched/libminifi/CMakeLists.txt	2020-08-10 15:06:17.124278642 +0900
+@@ -108,6 +108,7 @@
+ add_library(spdlog STATIC ${SPD_SOURCES})
+ add_library(core-minifi STATIC ${SOURCES})
+ target_link_libraries(core-minifi ${CMAKE_DL_LIBS} yaml-cpp)
++target_link_libraries(core-minifi ${LIB_ATOMIC})
+ 
+ #target_link_libraries(core-minifi  PRIVATE bsdiff )
+ 
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/fix-osspuuid-compile.patch b/meta-oe/recipes-extended/minifi-cpp/files/fix-osspuuid-compile.patch
new file mode 100644
index 000000000..42e1e583c
--- /dev/null
+++ b/meta-oe/recipes-extended/minifi-cpp/files/fix-osspuuid-compile.patch
@@ -0,0 +1,36 @@
+diff -urN -x .git orig/cmake/BundledOSSPUUID.cmake patched/cmake/BundledOSSPUUID.cmake
+--- orig/cmake/BundledOSSPUUID.cmake	2020-08-07 21:58:34.660773928 +0900
++++ patched/cmake/BundledOSSPUUID.cmake	2020-08-07 22:05:57.404772993 +0900
+@@ -22,7 +22,9 @@
+ 
+     # Define patch step
+     find_package(Patch REQUIRED)
+-    set(PC "${Patch_EXECUTABLE}" -p1 -i "${SOURCE_DIR}/thirdparty/ossp-uuid/ossp-uuid-mac-fix.patch")
++    set(PATCH1 "${Patch_EXECUTABLE}" -p1 -i "${SOURCE_DIR}/thirdparty/ossp-uuid/ossp-uuid-mac-fix.patch")
++    set(PATCH2 "${Patch_EXECUTABLE}" -p1 -i "${SOURCE_DIR}/thirdparty/ossp-uuid/ossp-uuid-cross-compile-fix.patch")
++    set(PATCH3 "${Patch_EXECUTABLE}" -p1 -i "${SOURCE_DIR}/thirdparty/ossp-uuid/ossp-uuid-musl-compile-fix.patch")
+ 
+     # Define byproducts
+     set(BYPRODUCTS "lib/libuuid.a"
+@@ -35,7 +37,9 @@
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
+@@ -52,8 +56,8 @@
+             UPDATE_COMMAND ""
+             INSTALL_COMMAND make install
+             BUILD_BYPRODUCTS ${OSSPUUID_LIBRARIES_LIST}
+-            CONFIGURE_COMMAND ""
+-            PATCH_COMMAND ${PC} && ${CONFIGURE_COMMAND}
++            CONFIGURE_COMMAND ${CONFIGURE_COMMAND}
++            PATCH_COMMAND ${PATCH1} && ${PATCH2} && ${PATCH3}
+             STEP_TARGETS build
+             EXCLUDE_FROM_ALL TRUE
+     )
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/fix-osspuuid-cross-compile.patch b/meta-oe/recipes-extended/minifi-cpp/files/fix-osspuuid-cross-compile.patch
new file mode 100644
index 000000000..dc354d9ac
--- /dev/null
+++ b/meta-oe/recipes-extended/minifi-cpp/files/fix-osspuuid-cross-compile.patch
@@ -0,0 +1,37 @@
+diff -urN -x .git orig/thirdparty/ossp-uuid/ossp-uuid-cross-compile-fix.patch patched/thirdparty/ossp-uuid/ossp-uuid-cross-compile-fix.patch
+--- orig/thirdparty/ossp-uuid/ossp-uuid-cross-compile-fix.patch	1970-01-01 09:00:00.000000000 +0900
++++ patched/thirdparty/ossp-uuid/ossp-uuid-cross-compile-fix.patch	2020-08-07 22:28:04.396770190 +0900
+@@ -0,0 +1,33 @@
++diff -urN orig/config.sub patched/config.sub
++--- orig/config.sub	2008-07-05 06:43:08.000000000 +0900
+++++ patched/config.sub	2020-08-07 22:23:48.412770731 +0900
++@@ -238,6 +238,8 @@
++ 	# Some are omitted here because they have special meanings below.
++ 	1750a | 580 \
++ 	| a29k \
+++	| aarch64 | aarch64_be \
+++	| riscv32 | riscv64 \
++ 	| alpha | alphaev[4-8] | alphaev56 | alphaev6[78] | alphapca5[67] \
++ 	| alpha64 | alpha64ev[4-8] | alpha64ev56 | alpha64ev6[78] | alpha64pca5[67] \
++ 	| am33_2.0 \
++@@ -314,6 +316,8 @@
++ 	# Recognize the basic CPU types with company name.
++ 	580-* \
++ 	| a29k-* \
+++	| aarch64-* | aarch64_be-* \
+++	| riscv32-* | riscv64-* \
++ 	| alpha-* | alphaev[4-8]-* | alphaev56-* | alphaev6[78]-* \
++ 	| alpha64-* | alpha64ev[4-8]-* | alpha64ev56-* | alpha64ev6[78]-* \
++ 	| alphapca5[67]-* | alpha64pca5[67]-* | arc-* \
++diff -urN orig/shtool patched/shtool
++--- orig/shtool	2008-07-05 06:43:08.000000000 +0900
+++++ patched/shtool	2020-08-07 22:21:23.192771037 +0900
++@@ -1400,7 +1400,7 @@
++             if [ ".$opt_t" = .yes ]; then
++                 echo "strip $dsttmp" 1>&2
++             fi
++-            strip $dsttmp || shtool_exit $?
+++            $STRIP $dsttmp || shtool_exit $?
++         fi
++         if [ ".$opt_o" != . ]; then
++             if [ ".$opt_t" = .yes ]; then
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/fix-osspuuid-musl-compile.patch b/meta-oe/recipes-extended/minifi-cpp/files/fix-osspuuid-musl-compile.patch
new file mode 100644
index 000000000..7caf848eb
--- /dev/null
+++ b/meta-oe/recipes-extended/minifi-cpp/files/fix-osspuuid-musl-compile.patch
@@ -0,0 +1,25 @@
+diff -urN -x .git orig/thirdparty/ossp-uuid/ossp-uuid-musl-compile-fix.patch patched/thirdparty/ossp-uuid/ossp-uuid-musl-compile-fix.patch
+--- orig/thirdparty/ossp-uuid/ossp-uuid-musl-compile-fix.patch	1970-01-01 09:00:00.000000000 +0900
++++ patched/thirdparty/ossp-uuid/ossp-uuid-musl-compile-fix.patch	2020-08-07 11:22:49.344854508 +0900
+@@ -0,0 +1,21 @@
++diff -urN orig/config.sub patched/config.sub
++--- orig/config.sub	2008-07-05 06:43:08.000000000 +0900
+++++ patched/config.sub	2020-08-07 11:19:25.948854937 +0900
++@@ -120,7 +120,7 @@
++ # Here we must recognize all the valid KERNEL-OS combinations.
++ maybe_os=`echo $1 | sed 's/^\(.*\)-\([^-]*-[^-]*\)$/\2/'`
++ case $maybe_os in
++-  nto-qnx* | linux-gnu* | linux-dietlibc | linux-newlib* | linux-uclibc* | \
+++  nto-qnx* | linux-gnu* | linux-dietlibc | linux-newlib* | linux-uclibc* | linux-musl* | \
++   uclinux-uclibc* | uclinux-gnu* | kfreebsd*-gnu* | knetbsd*-gnu* | netbsd*-gnu* | \
++   storm-chaos* | os2-emx* | rtmk-nova*)
++     os=-$maybe_os
++@@ -1250,7 +1250,7 @@
++ 	      | -udi* | -eabi* | -lites* | -ieee* | -go32* | -aux* \
++ 	      | -chorusos* | -chorusrdb* \
++ 	      | -cygwin* | -pe* | -psos* | -moss* | -proelf* | -rtems* \
++-	      | -mingw32* | -linux-gnu* | -linux-newlib* | -linux-uclibc* \
+++	      | -mingw32* | -linux-gnu* | -linux-newlib* | -linux-uclibc* | -linux-musl* \
++ 	      | -uxpv* | -beos* | -mpeix* | -udk* \
++ 	      | -interix* | -uwin* | -mks* | -rhapsody* | -darwin* | -opened* \
++ 	      | -openstep* | -oskit* | -conix* | -pw32* | -nonstopux* \
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/fix-rocksdb-cross-compile.patch b/meta-oe/recipes-extended/minifi-cpp/files/fix-rocksdb-cross-compile.patch
new file mode 100644
index 000000000..8c5db7c9e
--- /dev/null
+++ b/meta-oe/recipes-extended/minifi-cpp/files/fix-rocksdb-cross-compile.patch
@@ -0,0 +1,12 @@
+diff -urN orig/thirdparty/rocksdb/CMakeLists.txt patched/thirdparty/rocksdb/CMakeLists.txt
+--- orig/thirdparty/rocksdb/CMakeLists.txt	2020-07-28 11:39:40.254677515 +0900
++++ patched/thirdparty/rocksdb/CMakeLists.txt	2020-07-28 11:51:11.898676054 +0900
+@@ -618,6 +618,7 @@
+ add_library(${ROCKSDB_STATIC_LIB} STATIC ${SOURCES})
+ target_link_libraries(${ROCKSDB_STATIC_LIB}
+   ${THIRDPARTY_LIBS} ${SYSTEM_LIBS})
++target_link_libraries(${ROCKSDB_STATIC_LIB} ${LIB_ATOMIC})
+ 
+ if(WIN32)
+ #  add_library(${ROCKSDB_IMPORT_LIB} SHARED ${SOURCES})
+
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/minifi.service b/meta-oe/recipes-extended/minifi-cpp/files/minifi.service
new file mode 100644
index 000000000..5802a7b2f
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
+WorkingDirectory=@LOCALSTATEDIR@/run/minifi
+Environment=MINIFI_HOME=@SYSCONFDIR@/minifi
+ExecStart=@BINDIR@/minifi
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/systemd-volatile.conf b/meta-oe/recipes-extended/minifi-cpp/files/systemd-volatile.conf
new file mode 100644
index 000000000..c828b49fa
--- /dev/null
+++ b/meta-oe/recipes-extended/minifi-cpp/files/systemd-volatile.conf
@@ -0,0 +1,2 @@
+d @MINIFI_RUN@ 0755 root root -
+d @MINIFI_LOG@ 0755 root root -
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/sysvinit-volatile.conf b/meta-oe/recipes-extended/minifi-cpp/files/sysvinit-volatile.conf
new file mode 100644
index 000000000..2ad14e677
--- /dev/null
+++ b/meta-oe/recipes-extended/minifi-cpp/files/sysvinit-volatile.conf
@@ -0,0 +1,2 @@
+d root root 0755 @MINIFI_RUN@ none
+d root root 0755 @MINIFI_LOG@ none
diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
new file mode 100644
index 000000000..150d1fa53
--- /dev/null
+++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
@@ -0,0 +1,116 @@
+SUMMARY = "A subproject of Apache NiFi to collect data where it originates."
+DESCRIPTION = "MiNiFi--a subproject of Apache NiFi--is a complementary \
+data collection approach that supplements the core tenets of NiFi in dataflow \
+management, focusing on the collection of data at the source of its creation."
+HOMEPAGE = "https://nifi.apache.org/minifi/index.html"
+SECTION = "console/network"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f9534eb5f4ab800b573a37bffc62f3a7"
+
+DEPENDS = "virtual/crypt expat flex python3 bison-native"
+RDEPENDS_${PN} = "python3-core"
+
+SRCREV = "aa42957a2e227df41510047cece3cd606dc1cb6a"
+SRC_URI = "git://github.com/apache/nifi-minifi-cpp.git \
+            file://fix-minifi-compile.patch \
+            file://fix-libressl-compile.patch \
+            file://fix-libressl-avoid-BSWAP-assembly-for-ARM-v6.patch \
+            file://fix-osspuuid-compile.patch \
+            file://fix-osspuuid-cross-compile.patch \
+            file://fix-osspuuid-musl-compile.patch \
+            file://fix-rocksdb-cross-compile.patch \
+            file://minifi.service \
+            file://systemd-volatile.conf \
+            file://sysvinit-volatile.conf \
+            "
+S = "${WORKDIR}/git"
+
+inherit pkgconfig cmake systemd
+
+SYSTEMD_PACKAGES = "minifi-cpp"
+SYSTEMD_SERVICE_${PN} = "minifi.service"
+SYSTEMD_AUTO_ENABLE = "disable"
+
+OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM = "BOTH"
+
+EXTRA_OECMAKE += " \
+    -DHOST_SYS=${HOST_SYS} -DBUILD_SYS=${BUILD_SYS} \
+    -DSKIP_TESTS=ON \
+    "
+
+# There are endian issues when communicating with the x86 nifi on the the mips and the ppc machines.
+COMPATIBLE_MACHINE_mips = "(!.*mips).*"
+COMPATIBLE_MACHINE_mips64 = "(!.*mips64).*"
+COMPATIBLE_MACHINE_powerpc = "(!.*ppc).*"
+
+TARGET_CFLAGS_append_riscv32 += "-fpic"
+TARGET_CXXFLAGS_append_riscv32 += "-fpic"
+TARGET_CFLAGS_append_riscv64 += "-fpic"
+TARGET_CXXFLAGS_append_riscv64 += "-fpic"
+
+
+do_install() {
+    DESTDIR='${B}/minifi-install' cmake_runcmake_build --target ${OECMAKE_TARGET_INSTALL}
+
+    MINIFI_BIN=${base_prefix}${bindir}
+    MINIFI_HOME=${base_prefix}${sysconfdir}/minifi
+    MINIFI_RUN=${base_prefix}${localstatedir}/run/minifi
+    MINIFI_LOG=${base_prefix}${localstatedir}/log/minifi
+
+    install -d ${D}${MINIFI_BIN}
+    install -d ${D}${MINIFI_HOME}/conf
+    cp -a ${B}/minifi-install/usr/bin/*   ${D}${MINIFI_BIN}/
+    cp -a ${B}/minifi-install/usr/conf/*  ${D}${MINIFI_HOME}/conf/
+
+    sed -i 's|#appender.rolling.directory=.*|appender.rolling.directory='${MINIFI_LOG}'|g' \
+        ${D}${MINIFI_HOME}/conf/minifi-log.properties
+    sed -i 's|nifi.provenance.repository.directory.default=.*|nifi.provenance.repository.directory.default='${MINIFI_RUN}'/provenance_repository|g' \
+        ${D}${MINIFI_HOME}/conf/minifi.properties
+    sed -i 's|nifi.flowfile.repository.directory.default=.*|nifi.flowfile.repository.directory.default='${MINIFI_RUN}'/flowfile_repository|g' \
+        ${D}${MINIFI_HOME}/conf/minifi.properties
+    sed -i 's|nifi.database.content.repository.directory.default=.*|nifi.database.content.repository.directory.default='${MINIFI_RUN}'/content_repository|g' \
+        ${D}${MINIFI_HOME}/conf/minifi.properties
+    sed -i 's|nifi.flow.configuration.file=.*|nifi.flow.configuration.file='${MINIFI_HOME}'/conf/config.yml|g' \
+        ${D}${MINIFI_HOME}/conf/minifi.properties
+
+    sed -i 's|export MINIFI_HOME=.*|export MINIFI_HOME='${MINIFI_HOME}'|g' ${D}${MINIFI_BIN}/minifi.sh
+    sed -i 's|bin_dir=${MINIFI_HOME}/bin|bin_dir='${MINIFI_BIN}'|g' ${D}${MINIFI_BIN}/minifi.sh
+    sed -i 's|pid_file=${bin_dir}|pid_file='${MINIFI_RUN}'|g' ${D}${MINIFI_BIN}/minifi.sh
+
+    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+        install -d ${D}${sysconfdir}/tmpfiles.d/
+        install -m 0644 ${WORKDIR}/systemd-volatile.conf ${D}${sysconfdir}/tmpfiles.d/
+        install -m 0755 -d ${D}${systemd_unitdir}/system
+        install -m 0644 ${WORKDIR}/minifi.service ${D}${systemd_unitdir}/system/
+
+        sed -i 's|@LOCALSTATEDIR@|${localstatedir}|g' ${D}${systemd_unitdir}/system/minifi.service
+        sed -i 's|@SYSCONFDIR@|${sysconfdir}|g' ${D}${systemd_unitdir}/system/minifi.service
+        sed -i 's|@BINDIR@|${bindir}|g' ${D}${systemd_unitdir}/system/minifi.service
+
+        sed -i 's|@MINIFI_RUN@|'${MINIFI_RUN}'|g' ${D}${sysconfdir}/tmpfiles.d/systemd-volatile.conf
+        sed -i 's|@MINIFI_LOG@|'${MINIFI_LOG}'|g' ${D}${sysconfdir}/tmpfiles.d/systemd-volatile.conf
+
+    elif ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+        install -d ${D}${sysconfdir}/default/volatiles
+        install -m 0644 ${WORKDIR}/sysvinit-volatile.conf ${D}${sysconfdir}/default/volatiles/99_minifi
+
+        sed -i 's|@MINIFI_RUN@|'${MINIFI_RUN}'|g' ${D}${sysconfdir}/default/volatiles/99_minifi
+        sed -i 's|@MINIFI_LOG@|'${MINIFI_LOG}'|g' ${D}${sysconfdir}/default/volatiles/99_minifi
+    fi
+}
+
+pkg_postinst_${PN}() {
+    if [ -z "$D" ]; then
+        if type systemd-tmpfiles >/dev/null; then
+            systemd-tmpfiles --create
+        elif [ -e ${sysconfdir}/init.d/populate-volatile.sh ]; then
+            ${sysconfdir}/init.d/populate-volatile.sh update
+        fi
+    fi
+}
+
+FILES_${PN} = " \
+        ${bindir} \
+        ${sysconfdir} \
+        ${systemd_unitdir} \
+        "
-- 
2.28.0

