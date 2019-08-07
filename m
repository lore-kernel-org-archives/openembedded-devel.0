Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id 4382B7F37C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Aug 2019 16:43:32 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id b7so41690749pls.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Aug 2019 09:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=G8hjmfIMzuxHdiRZo65l5A32TDgCyzT8qWHGteQEpDo=;
	b=lqDz4to4aC1U1Tla0PM473q4xvavAzFDypPvxOWsVDoQe1evyyFUqHXnryzcI5CbXH
	5IWNu6Xw1bdP854iq7vGJodZStT3Mz8oV2q6OkEhSRTBA5TRZlGMEkUUoQm1FxqxSpNm
	FdTJn1kCvWSD5lEnbLcIu/U2C2nQKXIydFSVjzuZHHKclObtcIbPo6k9XxFXEQcZJBDl
	mjnAY0OeEkxx+D1keDFf8K1wsP9UBpf833I8/wuxqboMLRY43RRYDRnvtyNaOcuAncbk
	6ZWlNCaNPxtQEtEll+Szxk9f9h9G+qY+fgFMatwkzCZ0n7QBG68SIDqJMYO5RUL7gOHk
	vxrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=G8hjmfIMzuxHdiRZo65l5A32TDgCyzT8qWHGteQEpDo=;
	b=uipfyHYNLDE0g3/FH2YQsNtPgPJCGscHBzt/jNnQ4/UEPhVQEsvimzFrYOqEWjlbWs
	B5NkO1c+pAwPzxaMJ3Orm27xBP9ol+VRzaCldTckd+8XyUkWqBtu+RjxiZNNDsRY3wZw
	bJu0LQ7F76Cl5cHfCykCpHQz0Gp4Ez5vRp3w1JCd8MoxoSFoAUkAmZ8pSPLUCmsH2Gx2
	2P4TFVp7zcyvE7GxoltKQhzVPa7y4qRoXGT3a7+6cKWroSTpsHoRF5vcfAOAO4h41MkB
	OANW2+kZTY8hPXVQjvQd9z1PdWiBrI1rS1dJFL3Jxq+RhXnpZ31XrnnPgHdp+OqD1B36
	34oQ==
X-Gm-Message-State: APjAAAWYO5IFehXdI8eQi5EgLxLpU5j3uYTPKLkp01J4JmOLzYgCOF2r
	UAw5plKdOezJDZVGkISuG5impytSnug=
X-Google-Smtp-Source: APXvYqwP2h4tG7kv035UuJIdcPt+9piwmQ1p6aaSD4pYGB8Mr9MVvGrH4TOetNuwXEYrxCc5hzO0UA==
X-Received: by 2002:a17:902:7407:: with SMTP id
	g7mr9129649pll.214.1565196212704; 
	Wed, 07 Aug 2019 09:43:32 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	o11sm168735060pfh.114.2019.08.07.09.43.32
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 07 Aug 2019 09:43:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Aug 2019 09:43:20 -0700
Message-Id: <20190807164321.44571-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190807164321.44571-1-raj.khem@gmail.com>
References: <20190807164321.44571-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 2/3] grpc: Update to 1.22.0
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
X-List-Received-Date: Wed, 07 Aug 2019 16:43:32 -0000
Content-Transfer-Encoding: 8bit

Fix build with glibc 2.30
Forward port patches
Add versioiniing to grpcpp_channelz plugin

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ix-grpc_cpp_plugin-path-during-cross.patch | 32 ++---------
 ...Fix-libraries-installation-for-Linux.patch | 44 ++++++++-------
 ...01-Define-gettid-only-for-glibc-2.30.patch | 53 +++++++++++++++++++
 .../grpc/{grpc_1.14.1.bb => grpc_1.22.0.bb}   |  8 +--
 4 files changed, 86 insertions(+), 51 deletions(-)
 create mode 100644 meta-networking/recipes-devtools/grpc/grpc/0001-Define-gettid-only-for-glibc-2.30.patch
 rename meta-networking/recipes-devtools/grpc/{grpc_1.14.1.bb => grpc_1.22.0.bb} (86%)

diff --git a/meta-networking/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch b/meta-networking/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch
index 54e0b99a46..6cad533964 100644
--- a/meta-networking/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch
+++ b/meta-networking/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch
@@ -1,8 +1,7 @@
 From 6d606f1101c1a172fb6d738d6f1865aa61849e68 Mon Sep 17 00:00:00 2001
 From: Alexey Firago <alexey_firago@mentor.com>
 Date: Fri, 20 Oct 2017 00:04:19 +0300
-Subject: [PATCH] CMakeLists.txt: Fix grpc_cpp_plugin path during
- cross-compiling or native build
+Subject: [PATCH] CMakeLists.txt: Fix grpc_cpp_plugin path during cross-compiling or native build
 
 Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
 Signed-off-by: Hiram Lew <lew@avast.com>
@@ -12,11 +11,9 @@ Signed-off-by: Jan Kaisrlik <jan.kaisrlik@avast.com>
  templates/CMakeLists.txt.template | 9 ++++++++-
  2 files changed, 16 insertions(+), 2 deletions(-)
 
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index a59fd81..cd90424 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -160,6 +160,13 @@ function(protobuf_generate_grpc_cpp)
+@@ -193,6 +193,13 @@ function(protobuf_generate_grpc_cpp)
      return()
    endif()
  
@@ -30,20 +27,9 @@ index a59fd81..cd90424 100644
    set(_protobuf_include_path -I . -I ${_gRPC_PROTOBUF_WELLKNOWN_INCLUDE_DIR})
    foreach(FIL ${ARGN})
      get_filename_component(ABS_FIL ${FIL} ABSOLUTE)
-@@ -177,7 +184,7 @@ function(protobuf_generate_grpc_cpp)
-       COMMAND ${_gRPC_PROTOBUF_PROTOC_EXECUTABLE}
-       ARGS --grpc_out=generate_mock_code=true:${_gRPC_PROTO_GENS_DIR}
-            --cpp_out=${_gRPC_PROTO_GENS_DIR}
--           --plugin=protoc-gen-grpc=$<TARGET_FILE:grpc_cpp_plugin>
-+           --plugin=protoc-gen-grpc=${gRPC_CPP_PLUGIN}
-            ${_protobuf_include_path}
-            ${REL_FIL}
-       DEPENDS ${ABS_FIL} ${_gRPC_PROTOBUF_PROTOC} grpc_cpp_plugin
-diff --git a/templates/CMakeLists.txt.template b/templates/CMakeLists.txt.template
-index de13d02..b22bd5c 100644
 --- a/templates/CMakeLists.txt.template
 +++ b/templates/CMakeLists.txt.template
-@@ -209,6 +209,13 @@
+@@ -233,6 +233,13 @@
        return()
      endif()
  
@@ -57,15 +43,3 @@ index de13d02..b22bd5c 100644
      set(_protobuf_include_path -I . -I <%text>${_gRPC_PROTOBUF_WELLKNOWN_INCLUDE_DIR}</%text>)
      foreach(FIL <%text>${ARGN}</%text>)
        get_filename_component(ABS_FIL <%text>${FIL}</%text> ABSOLUTE)
-@@ -226,7 +233,7 @@
-         COMMAND <%text>${_gRPC_PROTOBUF_PROTOC_EXECUTABLE}</%text>
-         ARGS --grpc_out=<%text>generate_mock_code=true:${_gRPC_PROTO_GENS_DIR}</%text>
-              --cpp_out=<%text>${_gRPC_PROTO_GENS_DIR}</%text>
--             --plugin=protoc-gen-grpc=$<TARGET_FILE:grpc_cpp_plugin>
-+             --plugin=protoc-gen-grpc=${gRPC_CPP_PLUGIN}
-              <%text>${_protobuf_include_path}</%text>
-              <%text>${REL_FIL}</%text>
-         DEPENDS <%text>${ABS_FIL}</%text> <%text>${_gRPC_PROTOBUF_PROTOC}</%text> grpc_cpp_plugin
--- 
-2.7.4
-
diff --git a/meta-networking/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch b/meta-networking/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch
index 459dc45a41..3282b5413e 100644
--- a/meta-networking/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch
+++ b/meta-networking/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch
@@ -7,16 +7,13 @@ Subject: [PATCH] CMakeLists.txt: Fix libraries installation for Linux
 
 Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
 
-%% original patch: 0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch
 ---
  CMakeLists.txt | 59 ++++++++++++++++++++++++++++++++++++++++++++++++++
  1 file changed, 59 insertions(+)
 
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index a59fd818e3..5066f44a32 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -30,6 +30,15 @@ set(PACKAGE_TARNAME   "${PACKAGE_NAME}-${PACKAGE_VERSION}")
+@@ -30,6 +30,15 @@ set(PACKAGE_TARNAME   "${PACKAGE_NAME}-$
  set(PACKAGE_BUGREPORT "https://github.com/grpc/grpc/issues/")
  project(${PACKAGE_NAME} C CXX)
  
@@ -32,7 +29,7 @@ index a59fd818e3..5066f44a32 100644
  set(gRPC_INSTALL_BINDIR "bin" CACHE STRING "Installation directory for executables")
  set(gRPC_INSTALL_LIBDIR "lib" CACHE STRING "Installation directory for libraries")
  set(gRPC_INSTALL_INCLUDEDIR "include" CACHE STRING "Installation directory for headers")
-@@ -702,6 +711,10 @@ if(WIN32 AND MSVC)
+@@ -769,6 +778,10 @@ if(WIN32 AND MSVC)
    endif()
  endif()
  
@@ -43,7 +40,7 @@ index a59fd818e3..5066f44a32 100644
  
  target_include_directories(address_sorting
    PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
-@@ -825,6 +838,10 @@ if(WIN32 AND MSVC)
+@@ -903,6 +916,10 @@ if(WIN32 AND MSVC)
    endif()
  endif()
  
@@ -54,7 +51,7 @@ index a59fd818e3..5066f44a32 100644
  
  target_include_directories(gpr
    PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
-@@ -1259,6 +1276,10 @@ if(WIN32 AND MSVC)
+@@ -1333,6 +1350,10 @@ if(WIN32 AND MSVC)
    endif()
  endif()
  
@@ -65,7 +62,7 @@ index a59fd818e3..5066f44a32 100644
  
  target_include_directories(grpc
    PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
-@@ -1633,6 +1654,10 @@ if(WIN32 AND MSVC)
+@@ -1731,6 +1752,10 @@ if(WIN32 AND MSVC)
    endif()
  endif()
  
@@ -76,7 +73,7 @@ index a59fd818e3..5066f44a32 100644
  
  target_include_directories(grpc_cronet
    PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
-@@ -2575,6 +2600,10 @@ if(WIN32 AND MSVC)
+@@ -2744,6 +2769,10 @@ if(WIN32 AND MSVC)
    endif()
  endif()
  
@@ -87,7 +84,7 @@ index a59fd818e3..5066f44a32 100644
  
  target_include_directories(grpc_unsecure
    PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
-@@ -2791,6 +2820,10 @@ if(WIN32 AND MSVC)
+@@ -3083,6 +3112,10 @@ if(WIN32 AND MSVC)
    endif()
  endif()
  
@@ -98,7 +95,7 @@ index a59fd818e3..5066f44a32 100644
  
  target_include_directories(grpc++
    PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
-@@ -3357,6 +3390,10 @@ if(WIN32 AND MSVC)
+@@ -3703,6 +3736,10 @@ if(WIN32 AND MSVC)
    endif()
  endif()
  
@@ -109,7 +106,7 @@ index a59fd818e3..5066f44a32 100644
  
  target_include_directories(grpc++_cronet
    PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
-@@ -3630,6 +3667,11 @@ protobuf_generate_grpc_cpp(
+@@ -4013,6 +4050,11 @@ protobuf_generate_grpc_cpp(
    src/proto/grpc/status/status.proto
  )
  
@@ -121,7 +118,7 @@ index a59fd818e3..5066f44a32 100644
  target_include_directories(grpc++_error_details
    PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}
-@@ -3762,6 +3804,11 @@ protobuf_generate_grpc_cpp(
+@@ -4147,6 +4189,11 @@ protobuf_generate_grpc_cpp(
    src/proto/grpc/reflection/v1alpha/reflection.proto
  )
  
@@ -133,7 +130,7 @@ index a59fd818e3..5066f44a32 100644
  target_include_directories(grpc++_reflection
    PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}
-@@ -4265,6 +4312,10 @@ if(WIN32 AND MSVC)
+@@ -4704,6 +4751,10 @@ if(WIN32 AND MSVC)
    endif()
  endif()
  
@@ -144,7 +141,7 @@ index a59fd818e3..5066f44a32 100644
  
  target_include_directories(grpc++_unsecure
    PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
-@@ -4649,6 +4700,10 @@ if(WIN32 AND MSVC)
+@@ -5124,6 +5175,10 @@ if(WIN32 AND MSVC)
    endif()
  endif()
  
@@ -155,7 +152,19 @@ index a59fd818e3..5066f44a32 100644
  
  target_include_directories(grpc_plugin_support
    PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
-@@ -5184,6 +5239,10 @@ if(WIN32 AND MSVC)
+@@ -5190,6 +5245,11 @@ protobuf_generate_grpc_cpp(
+   src/proto/grpc/channelz/channelz.proto
+ )
+ 
++if(_gRPC_PLATFORM_LINUX)
++	set_property(TARGET grpcpp_channelz PROPERTY VERSION ${CPP_VERSION})
++  set_property(TARGET grpcpp_channelz PROPERTY SOVERSION ${CPP_VERSION_MAJOR})
++endif()
++
+ target_include_directories(grpcpp_channelz
+   PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
+   PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}
+@@ -5728,6 +5788,10 @@ if(WIN32 AND MSVC)
    endif()
  endif()
  
@@ -166,6 +175,3 @@ index a59fd818e3..5066f44a32 100644
  
  target_include_directories(grpc_csharp_ext
    PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
--- 
-2.17.1
-
diff --git a/meta-networking/recipes-devtools/grpc/grpc/0001-Define-gettid-only-for-glibc-2.30.patch b/meta-networking/recipes-devtools/grpc/grpc/0001-Define-gettid-only-for-glibc-2.30.patch
new file mode 100644
index 0000000000..c6afff2d23
--- /dev/null
+++ b/meta-networking/recipes-devtools/grpc/grpc/0001-Define-gettid-only-for-glibc-2.30.patch
@@ -0,0 +1,53 @@
+From c27261a8bc1e45ff7d7a585c79b2b871d47217e4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 26 Jul 2019 18:56:26 -0700
+Subject: [PATCH] Define gettid() only for glibc < 2.30
+
+glibc 2.30 has added this API, so let us use that when possible
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/core/lib/gpr/log_linux.cc          | 4 ++++
+ src/core/lib/iomgr/ev_epollex_linux.cc | 7 +++++--
+ 2 files changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/src/core/lib/gpr/log_linux.cc b/src/core/lib/gpr/log_linux.cc
+index 561276f0c2..25a74864a1 100644
+--- a/src/core/lib/gpr/log_linux.cc
++++ b/src/core/lib/gpr/log_linux.cc
+@@ -40,7 +40,11 @@
+ #include <time.h>
+ #include <unistd.h>
+ 
++#if defined(__GLIBC__) && (__GLIBC_MINOR__ >= 29)
++#include <unistd.h>
++#else
+ static long gettid(void) { return syscall(__NR_gettid); }
++#endif
+ 
+ void gpr_log(const char* file, int line, gpr_log_severity severity,
+              const char* format, ...) {
+diff --git a/src/core/lib/iomgr/ev_epollex_linux.cc b/src/core/lib/iomgr/ev_epollex_linux.cc
+index 08116b3ab5..d3d3025111 100644
+--- a/src/core/lib/iomgr/ev_epollex_linux.cc
++++ b/src/core/lib/iomgr/ev_epollex_linux.cc
+@@ -1101,10 +1101,13 @@ static void end_worker(grpc_pollset* pollset, grpc_pollset_worker* worker,
+   gpr_atm_no_barrier_fetch_add(&pollset->worker_count, -1);
+ }
+ 
+-#ifndef NDEBUG
++#if !defined(DEBUG)
++#if defined(__GLIBC__) && (__GLIBC_MINOR__ >= 29)
++#include <unistd.h>
++#else
+ static long gettid(void) { return syscall(__NR_gettid); }
+ #endif
+-
++#endif
+ /* pollset->mu lock must be held by the caller before calling this.
+    The function pollset_work() may temporarily release the lock (pollset->po.mu)
+    during the course of its execution but it will always re-acquire the lock and
+-- 
+2.22.0
+
diff --git a/meta-networking/recipes-devtools/grpc/grpc_1.14.1.bb b/meta-networking/recipes-devtools/grpc/grpc_1.22.0.bb
similarity index 86%
rename from meta-networking/recipes-devtools/grpc/grpc_1.14.1.bb
rename to meta-networking/recipes-devtools/grpc/grpc_1.22.0.bb
index 0550866e5b..a80c574cc9 100644
--- a/meta-networking/recipes-devtools/grpc/grpc_1.14.1.bb
+++ b/meta-networking/recipes-devtools/grpc/grpc_1.22.0.bb
@@ -11,12 +11,14 @@ DEPENDS_append_class-target = " googletest grpc-native "
 DEPENDS_append_class-nativesdk = " grpc-native "
 
 S = "${WORKDIR}/git"
-SRCREV = "d8020cb6daa87f1a3bb3b0c299bc081c4a3de1e8"
-BRANCH = "v1.14.x"
+SRCREV = "08fd59f039c7cf62614ab7741b3f34527af103c7"
+BRANCH = "v1.22.x"
 SRC_URI = "git://github.com/grpc/grpc.git;protocol=https;branch=${BRANCH} \
            file://0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch \
            "
-SRC_URI_append_class-target = " file://0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch"
+SRC_URI_append_class-target = " file://0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch \
+                                file://0001-Define-gettid-only-for-glibc-2.30.patch \
+                               "
 SRC_URI_append_class-nativesdk = " file://0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch"
 
 # Fixes build with older compilers 4.8 especially on ubuntu 14.04
-- 
2.22.0


