Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web09.7740.1613738404255215582
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Feb 2021 04:40:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=WOxkc6UO;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: anbelski@linux.microsoft.com)
Received: from anbelski-lsg-linux-yocto-1.irsgb21fvobu5fvmalxug44hib.xx.internal.cloudapp.net (unknown [52.247.218.173])
	by linux.microsoft.com (Postfix) with ESMTPSA id 7387A20B6C40
	for <openembedded-devel@lists.openembedded.org>; Fri, 19 Feb 2021 04:40:03 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 7387A20B6C40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1613738403;
	bh=MsLJcv2j9GgzENjWoNX0s48+V83rOc1OgjloENcBh3Y=;
	h=From:To:Subject:Date:From;
	b=WOxkc6UODvNWnqBtyCRWKeOyGB6NjqpxKmSFHPhP1YnaAYPjltKq/Z1l3/pPSz7Kk
	 cExinkw+K7G/IUxTLQhKSB5b4BZb620tDN6Z+KLylsi5abl6sFtnyBNjF2kjCkFSVS
	 GlHXdfqdjeQsWFO3L0/pCtyflHKiWDsvLFAYP3ug=
From: "Anatol Belski" <anbelski@linux.microsoft.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] grpc: Upgrade 1.24.3 -> 1.35.0
Date: Fri, 19 Feb 2021 12:39:55 +0000
Message-Id: <20210219123955.26446-1-anbelski@linux.microsoft.com>
X-Mailer: git-send-email 2.17.1

This is a really huge jump in versions, but this package has been not
upgraded for quite some time. The previous patches are not necessary
anymore, they're integrated upstream.

Signed-off-by: Anatol Belski <anbelski@linux.microsoft.com>
---
 ...ix-grpc_cpp_plugin-path-during-cross.patch |  45 -----
 ...Fix-libraries-installation-for-Linux.patch | 177 ------------------
 .../grpc/{grpc_1.24.3.bb => grpc_1.35.0.bb}   |  15 +-
 3 files changed, 5 insertions(+), 232 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch
 delete mode 100644 meta-oe/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch
 rename meta-oe/recipes-devtools/grpc/{grpc_1.24.3.bb => grpc_1.35.0.bb} (80%)

diff --git a/meta-oe/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch b/meta-oe/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch
deleted file mode 100644
index 6cad533964..0000000000
--- a/meta-oe/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 6d606f1101c1a172fb6d738d6f1865aa61849e68 Mon Sep 17 00:00:00 2001
-From: Alexey Firago <alexey_firago@mentor.com>
-Date: Fri, 20 Oct 2017 00:04:19 +0300
-Subject: [PATCH] CMakeLists.txt: Fix grpc_cpp_plugin path during cross-compiling or native build
-
-Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
-Signed-off-by: Hiram Lew <lew@avast.com>
-Signed-off-by: Jan Kaisrlik <jan.kaisrlik@avast.com>
----
- CMakeLists.txt                    | 9 ++++++++-
- templates/CMakeLists.txt.template | 9 ++++++++-
- 2 files changed, 16 insertions(+), 2 deletions(-)
-
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -193,6 +193,13 @@ function(protobuf_generate_grpc_cpp)
-     return()
-   endif()
- 
-+  #if cross-compiling or nativesdk, find host plugin
-+  if(CMAKE_CROSSCOMPILING)
-+      find_program(gRPC_CPP_PLUGIN grpc_cpp_plugin)
-+  else()
-+      set(gRPC_CPP_PLUGIN $<TARGET_FILE:grpc_cpp_plugin>)
-+  endif()
-+
-   set(_protobuf_include_path -I . -I ${_gRPC_PROTOBUF_WELLKNOWN_INCLUDE_DIR})
-   foreach(FIL ${ARGN})
-     get_filename_component(ABS_FIL ${FIL} ABSOLUTE)
---- a/templates/CMakeLists.txt.template
-+++ b/templates/CMakeLists.txt.template
-@@ -233,6 +233,13 @@
-       return()
-     endif()
- 
-+    #if cross-compiling or nativesdk, find host plugin
-+    if(CMAKE_CROSSCOMPILING)
-+        find_program(gRPC_CPP_PLUGIN grpc_cpp_plugin)
-+    else()
-+        set(gRPC_CPP_PLUGIN $<TARGET_FILE:grpc_cpp_plugin>)
-+    endif()
-+
-     set(_protobuf_include_path -I . -I <%text>${_gRPC_PROTOBUF_WELLKNOWN_INCLUDE_DIR}</%text>)
-     foreach(FIL <%text>${ARGN}</%text>)
-       get_filename_component(ABS_FIL <%text>${FIL}</%text> ABSOLUTE)
diff --git a/meta-oe/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch b/meta-oe/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch
deleted file mode 100644
index e517355d34..0000000000
--- a/meta-oe/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch
+++ /dev/null
@@ -1,177 +0,0 @@
-From 2279e30be5796e9b185545543ea54fe68633cbdd Mon Sep 17 00:00:00 2001
-From: Alexey Firago <alexey_firago@mentor.com>
-Date: Mon, 30 Oct 2017 23:24:49 +0300
-Subject: [PATCH] CMakeLists.txt: Fix libraries installation for Linux
-
-* Set libs versions as in Makefile
-
-Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
-
----
- CMakeLists.txt | 59 ++++++++++++++++++++++++++++++++++++++++++++++++++
- 1 file changed, 59 insertions(+)
-
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -30,6 +30,15 @@ set(PACKAGE_TARNAME   "${PACKAGE_NAME}-$
- set(PACKAGE_BUGREPORT "https://github.com/grpc/grpc/issues/")
- project(${PACKAGE_NAME} C CXX)
- 
-+set (CORE_VERSION_MAJOR "6")
-+set (CORE_VERSION "6.0.0")
-+
-+set (CPP_VERSION_MAJOR "1")
-+set (CPP_VERSION "${PACKAGE_VERSION}")
-+
-+set (CSHARP_VERSION_MAJOR "1")
-+set (CSHARP_VERSION "${PACKAGE_VERSION}")
-+
- set(gRPC_INSTALL_BINDIR "bin" CACHE STRING "Installation directory for executables")
- set(gRPC_INSTALL_LIBDIR "lib" CACHE STRING "Installation directory for libraries")
- set(gRPC_INSTALL_INCLUDEDIR "include" CACHE STRING "Installation directory for headers")
-@@ -777,6 +786,10 @@ if(WIN32 AND MSVC)
-   endif()
- endif()
- 
-+if(_gRPC_PLATFORM_LINUX)
-+  set_property(TARGET address_sorting PROPERTY VERSION ${CORE_VERSION})
-+  set_property(TARGET address_sorting PROPERTY SOVERSION ${CORE_VERSION_MAJOR})
-+endif()
- 
- target_include_directories(address_sorting
-   PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
-@@ -903,6 +916,10 @@ if(WIN32 AND MSVC)
-   endif()
- endif()
- 
-+if(_gRPC_PLATFORM_LINUX)
-+  set_property(TARGET gpr PROPERTY VERSION ${CORE_VERSION})
-+  set_property(TARGET gpr PROPERTY SOVERSION ${CORE_VERSION_MAJOR})
-+endif()
- 
- target_include_directories(gpr
-   PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
-@@ -1367,6 +1384,10 @@ if(WIN32 AND MSVC)
-   endif()
- endif()
- 
-+if(_gRPC_PLATFORM_LINUX)
-+  set_property(TARGET grpc PROPERTY VERSION ${CORE_VERSION})
-+  set_property(TARGET grpc PROPERTY SOVERSION ${CORE_VERSION_MAJOR})
-+endif()
- 
- target_include_directories(grpc
-   PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
-@@ -1782,6 +1803,10 @@ if(WIN32 AND MSVC)
-   endif()
- endif()
- 
-+if(_gRPC_PLATFORM_LINUX)
-+  set_property(TARGET grpc_cronet PROPERTY VERSION ${CORE_VERSION})
-+  set_property(TARGET grpc_cronet PROPERTY SOVERSION ${CORE_VERSION_MAJOR})
-+endif()
- 
- target_include_directories(grpc_cronet
-   PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
-@@ -2869,6 +2894,10 @@ if(WIN32 AND MSVC)
-   endif()
- endif()
- 
-+if(_gRPC_PLATFORM_LINUX)
-+  set_property(TARGET grpc_unsecure PROPERTY VERSION ${CORE_VERSION})
-+  set_property(TARGET grpc_unsecure PROPERTY SOVERSION ${CORE_VERSION_MAJOR})
-+endif()
- 
- target_include_directories(grpc_unsecure
-   PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
-@@ -3206,6 +3235,10 @@ if(WIN32 AND MSVC)
-   endif()
- endif()
- 
-+if(_gRPC_PLATFORM_LINUX)
-+  set_property(TARGET grpc++ PROPERTY VERSION ${CPP_VERSION})
-+  set_property(TARGET grpc++ PROPERTY SOVERSION ${CPP_VERSION_MAJOR})
-+endif()
- 
- target_include_directories(grpc++
-   PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
-@@ -3589,6 +3622,11 @@ protobuf_generate_grpc_cpp(
-   src/proto/grpc/status/status.proto
- )
- 
-+if(_gRPC_PLATFORM_LINUX)
-+  set_property(TARGET grpc++_error_details PROPERTY VERSION ${CPP_VERSION})
-+  set_property(TARGET grpc++_error_details PROPERTY SOVERSION ${CPP_VERSION_MAJOR})
-+endif()
-+
- target_include_directories(grpc++_error_details
-   PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
-   PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}
-@@ -3727,6 +3765,11 @@ protobuf_generate_grpc_cpp(
-   src/proto/grpc/reflection/v1alpha/reflection.proto
- )
- 
-+if(_gRPC_PLATFORM_LINUX)
-+  set_property(TARGET grpc++_reflection PROPERTY VERSION ${CPP_VERSION})
-+  set_property(TARGET grpc++_reflection PROPERTY SOVERSION ${CPP_VERSION_MAJOR})
-+endif()
-+
- target_include_directories(grpc++_reflection
-   PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
-   PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}
-@@ -3816,6 +3859,10 @@ target_link_libraries(grpc++_test_config
-   ${_gRPC_GFLAGS_LIBRARIES}
- )
- 
-+if(_gRPC_PLATFORM_LINUX)
-+  set_property(TARGET grpc++_cronet PROPERTY VERSION ${CPP_VERSION})
-+  set_property(TARGET grpc++_cronet PROPERTY SOVERSION ${CPP_VERSION_MAJOR})
-+endif()
- 
- endif (gRPC_BUILD_TESTS)
- if (gRPC_BUILD_TESTS)
-@@ -4307,6 +4354,10 @@ if(WIN32 AND MSVC)
-   endif()
- endif()
- 
-+if(_gRPC_PLATFORM_LINUX)
-+  set_property(TARGET grpc++_unsecure PROPERTY VERSION ${CPP_VERSION})
-+  set_property(TARGET grpc++_unsecure PROPERTY SOVERSION ${CPP_VERSION_MAJOR})
-+endif()
- 
- target_include_directories(grpc++_unsecure
-   PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
-@@ -4745,6 +4796,10 @@ if(WIN32 AND MSVC)
-   endif()
- endif()
- 
-+if(_gRPC_PLATFORM_LINUX)
-+  set_property(TARGET grpc_plugin_support PROPERTY VERSION ${CORE_VERSION})
-+  set_property(TARGET grpc_plugin_support PROPERTY SOVERSION ${CORE_VERSION_MAJOR})
-+endif()
- 
- target_include_directories(grpc_plugin_support
-   PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
-@@ -4813,6 +4868,11 @@ protobuf_generate_grpc_cpp(
-   src/proto/grpc/channelz/channelz.proto
- )
- 
-+if(_gRPC_PLATFORM_LINUX)
-+	set_property(TARGET grpcpp_channelz PROPERTY VERSION ${CPP_VERSION})
-+  set_property(TARGET grpcpp_channelz PROPERTY SOVERSION ${CPP_VERSION_MAJOR})
-+endif()
-+
- target_include_directories(grpcpp_channelz
-   PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
-   PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}
-@@ -5367,6 +5427,10 @@ if(WIN32 AND MSVC)
-   endif()
- endif()
- 
-+if(_gRPC_PLATFORM_LINUX)
-+  set_property(TARGET grpc_csharp_ext PROPERTY VERSION ${CSHARP_VERSION})
-+  set_property(TARGET grpc_csharp_ext PROPERTY SOVERSION ${CSHARP_VERSION_MAJOR})
-+endif()
- 
- target_include_directories(grpc_csharp_ext
-   PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.24.3.bb b/meta-oe/recipes-devtools/grpc/grpc_1.35.0.bb
similarity index 80%
rename from meta-oe/recipes-devtools/grpc/grpc_1.24.3.bb
rename to meta-oe/recipes-devtools/grpc/grpc_1.35.0.bb
index c25ce360e7..5097b2b1b8 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.24.3.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.35.0.bb
@@ -6,22 +6,15 @@ SECTION = "libs"
 LICENSE = "Apache-2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-DEPENDS = "gflags c-ares protobuf protobuf-native protobuf-c protobuf-c-native openssl libnsl2"
+DEPENDS = "gflags c-ares protobuf protobuf-native protobuf-c protobuf-c-native openssl libnsl2 abseil-cpp re2"
 DEPENDS_append_class-target = " googletest grpc-native "
 DEPENDS_append_class-nativesdk = " grpc-native "
 
 S = "${WORKDIR}/git"
-SRCREV_grpc = "2de2e8dd8921e1f7d043e01faf7fe8a291fbb072"
-SRCREV_upb = "9effcbcb27f0a665f9f345030188c0b291e32482"
-BRANCH = "v1.24.x"
+SRCREV_grpc = "627a22541a1836ce00cdc40a3977aa8928de98bc"
+BRANCH = "v1.35.x"
 SRC_URI = "git://github.com/grpc/grpc.git;protocol=https;name=grpc;branch=${BRANCH} \
-           git://github.com/protocolbuffers/upb;name=upb;destsuffix=git/third_party/upb \
-           file://0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch \
            "
-SRC_URI_append_class-target = " file://0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch \
-                               "
-SRC_URI_append_class-nativesdk = " file://0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch"
-
 # Fixes build with older compilers 4.8 especially on ubuntu 14.04
 CXXFLAGS_append_class-native = " -Wl,--no-as-needed"
 
@@ -33,6 +26,8 @@ EXTRA_OECMAKE = " \
     -DgRPC_SSL_PROVIDER=package \
     -DgRPC_PROTOBUF_PROVIDER=package \
     -DgRPC_GFLAGS_PROVIDER=package \
+    -DgRPC_ABSL_PROVIDER=package \
+    -DgRPC_RE2_PROVIDER=package \
     -DgRPC_INSTALL=ON \
     -DCMAKE_CROSSCOMPILING=ON \
     -DBUILD_SHARED_LIBS=ON \
-- 
2.17.1

