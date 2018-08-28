Return-Path: <rehsack@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id EED9778EFB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Aug 2018 13:22:27 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id v90-v6so1592271wrc.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Aug 2018 06:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=fvZK32N5QStVwmrLu54i3U43mMt7aQYeF1m2X1qXZOA=;
	b=be/A/RIpxceGwt1x2mDAarDE+3lKnhyFM4H8B9M2kLoIkxc4OgEfs8IapjxHV9F78F
	xsTzlumjUxFgDpnu75/vLWPl6/0LVqxFJ0bG2BPmeZ6BvXyZdXLkTBKNcNNsd0J1F528
	8bjrMjoB2Q+TRap0t8g4ts46kBaMv/3HOPdrPR9f/4laaNKtHjO6c4Inh3M7jUfa1Kc8
	odTn3p2V50Z47AR214zRUpkH/1hyxxXB3LsvI7N5U/11uEHQ4yaMz6kzGpHXFCOMEJ0s
	8Af7vCvhxm0sW6/MtmcbV4MAYvACXaU6FLMLIM1zOjHoRVO3t4IzNwU/xHOPSx4kEPTA
	LpjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=fvZK32N5QStVwmrLu54i3U43mMt7aQYeF1m2X1qXZOA=;
	b=mbcEuMkj3I8k8C9Hah0/3lSirRdwI86nmwqqX4JTZyub5KyE+8uG2CQcJ6qzqTU8OJ
	oCljmw8yxlmI9F8EAUo+6BmCgtYtuR5Vb1Y+8mEGsDSnhx4LBqi0iIj+xBgiZTfyp3UX
	b2kPBzx9dQZ+VPd5th/r3/EA08QPughPt77sfALy2M3yzyj8H8pkwOp6dm8db2ZQN3L2
	mujoAfyxZltldlRt+R4cKclphxGJ+qU+y8K6rwxdCA2VV9QyfSheUh8fwQpUi/PboH3i
	E78tUC+vZuG6Qgf5ATtBCi6xjvdi5qSliFfdLkVzb8Wfdfk6NLsBkjK1zoQMHV+ECgh4
	7eyQ==
X-Gm-Message-State: APzg51CDz9/Yl1c9AoZ+MFF1wamnzSRbq3Iqi1hBUNUXjo7L7nkdt38b
	O5blgoGZM0joprXIIi7nv2mmdD0f
X-Google-Smtp-Source: ANB0VdYfKDbITb30vICM5qareb3FVgs6t1aKG4hGRpWs30HL1/uG1nk1gJi8R44aWSGMTZG/KmwJKg==
X-Received: by 2002:adf:b202:: with SMTP id u2-v6mr1072784wra.19.1535462548322;
	Tue, 28 Aug 2018 06:22:28 -0700 (PDT)
Received: from beaker.muppets.liwing.de (b2b-78-94-80-58.unitymedia.biz.
	[78.94.80.58]) by smtp.gmail.com with ESMTPSA id
	j20-v6sm827100wmh.9.2018.08.28.06.22.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Aug 2018 06:22:27 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Aug 2018 15:22:22 +0200
Message-Id: <20180828132222.22199-1-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1
Cc: Jens Rehsack <sno@netbsd.org>
Subject: [meta-networking][PATCH v2] grpc: update from 1.8.5 -> 1.14.1
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
X-List-Received-Date: Tue, 28 Aug 2018 13:22:28 -0000

Update gRPC to 1.14.1 and fix cause for issues like
  https://stackoverflow.com/questions/49975541/how-to-port-grpc-helloworldcpp-example-on-yocto

For release notes check https://github.com/grpc/grpc/releases

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 ...ix-grpc_cpp_plugin-path-during-cross.patch |  8 +--
 ...Fix-libraries-installation-for-Linux.patch | 61 ++++++++++---------
 ...-Find-c-ares-in-target-sysroot-alone.patch | 42 -------------
 .../grpc/{grpc_1.8.5.bb => grpc_1.14.1.bb}    | 15 +++--
 4 files changed, 47 insertions(+), 79 deletions(-)
 delete mode 100644 meta-networking/recipes-devtools/grpc/grpc/0004-CMakeLists.txt-Find-c-ares-in-target-sysroot-alone.patch
 rename meta-networking/recipes-devtools/grpc/{grpc_1.8.5.bb => grpc_1.14.1.bb} (77%)

diff --git a/meta-networking/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch b/meta-networking/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch
index 5774e62eb..a83d85407 100644
--- a/meta-networking/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch
+++ b/meta-networking/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch
@@ -14,7 +14,7 @@ diff --git a/CMakeLists.txt b/CMakeLists.txt
 index f9cd630..9663934 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -328,6 +328,13 @@ function(protobuf_generate_grpc_cpp)
+@@ -170,6 +170,13 @@ function(protobuf_generate_grpc_cpp)
      return()
    endif()
 
@@ -25,7 +25,7 @@ index f9cd630..9663934 100644
 +      set(gRPC_CPP_PLUGIN $<TARGET_FILE:grpc_cpp_plugin>)
 +  endif()
 +
-   set(_protobuf_include_path -I . -I ${PROTOBUF_WELLKNOWN_IMPORT_DIR})
+   set(_protobuf_include_path -I . -I ${_gRPC_PROTOBUF_WELLKNOWN_INCLUDE_DIR})
    foreach(FIL ${ARGN})
      get_filename_component(ABS_FIL ${FIL} ABSOLUTE)
 @@ -345,7 +352,7 @@ function(protobuf_generate_grpc_cpp)
@@ -41,7 +41,7 @@ diff --git a/templates/CMakeLists.txt.template b/templates/CMakeLists.txt.templa
 index 64daf04..a7e8629 100644
 --- a/templates/CMakeLists.txt.template
 +++ b/templates/CMakeLists.txt.template
-@@ -373,6 +373,13 @@
+@@ -209,6 +209,13 @@
        return()
      endif()
 
@@ -52,7 +52,7 @@ index 64daf04..a7e8629 100644
 +        set(gRPC_CPP_PLUGIN $<TARGET_FILE:grpc_cpp_plugin>)
 +    endif()
 +
-     set(_protobuf_include_path -I . -I <%text>${PROTOBUF_WELLKNOWN_IMPORT_DIR}</%text>)
+     set(_protobuf_include_path -I . -I <%text>${_gRPC_PROTOBUF_WELLKNOWN_INCLUDE_DIR}</%text>)
      foreach(FIL <%text>${ARGN}</%text>)
        get_filename_component(ABS_FIL <%text>${FIL}</%text> ABSOLUTE)
 @@ -390,7 +397,7 @@
diff --git a/meta-networking/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch b/meta-networking/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch
index f8d965294..459dc45a4 100644
--- a/meta-networking/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch
+++ b/meta-networking/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch
@@ -1,7 +1,7 @@
-From 8e9bf962a45a82f1c2eb5858e29fa89a3a60b564 Mon Sep 17 00:00:00 2001
+From 2279e30be5796e9b185545543ea54fe68633cbdd Mon Sep 17 00:00:00 2001
 From: Alexey Firago <alexey_firago@mentor.com>
 Date: Mon, 30 Oct 2017 23:24:49 +0300
-Subject: [PATCH 1/4] CMakeLists.txt: Fix libraries installation for Linux
+Subject: [PATCH] CMakeLists.txt: Fix libraries installation for Linux
 
 * Set libs versions as in Makefile
 
@@ -9,21 +9,19 @@ Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
 
 %% original patch: 0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch
 ---
- CMakeLists.txt                        | 55 +++++++++++++++++++++++++++++++++++
- CMakeLists.txt => CMakeLists.txt.orig |  0
- 2 files changed, 55 insertions(+)
- copy CMakeLists.txt => CMakeLists.txt.orig (100%)
+ CMakeLists.txt | 59 ++++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 59 insertions(+)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index b1a49df..13e64ac 100644
+index a59fd818e3..5066f44a32 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -30,6 +30,15 @@ set(PACKAGE_TARNAME   "${PACKAGE_NAME}-${PACKAGE_VERSION}")
  set(PACKAGE_BUGREPORT "https://github.com/grpc/grpc/issues/")
  project(${PACKAGE_NAME} C CXX)
  
-+set (CORE_VERSION_MAJOR "4")
-+set (CORE_VERSION "4.0.0")
++set (CORE_VERSION_MAJOR "6")
++set (CORE_VERSION "6.0.0")
 +
 +set (CPP_VERSION_MAJOR "1")
 +set (CPP_VERSION "${PACKAGE_VERSION}")
@@ -31,10 +29,21 @@ index b1a49df..13e64ac 100644
 +set (CSHARP_VERSION_MAJOR "1")
 +set (CSHARP_VERSION "${PACKAGE_VERSION}")
 +
- set(gRPC_INSTALL_BINDIR "${CMAKE_INSTALL_PREFIX}/bin" CACHE PATH "Installation directory for executables")
- set(gRPC_INSTALL_LIBDIR "${CMAKE_INSTALL_PREFIX}/lib" CACHE PATH "Installation directory for libraries")
- set(gRPC_INSTALL_INCLUDEDIR "${CMAKE_INSTALL_PREFIX}/include" CACHE PATH "Installation directory for headers")
-@@ -841,6 +850,10 @@ if(WIN32 AND MSVC)
+ set(gRPC_INSTALL_BINDIR "bin" CACHE STRING "Installation directory for executables")
+ set(gRPC_INSTALL_LIBDIR "lib" CACHE STRING "Installation directory for libraries")
+ set(gRPC_INSTALL_INCLUDEDIR "include" CACHE STRING "Installation directory for headers")
+@@ -702,6 +711,10 @@ if(WIN32 AND MSVC)
+   endif()
+ endif()
+ 
++if(_gRPC_PLATFORM_LINUX)
++  set_property(TARGET address_sorting PROPERTY VERSION ${CORE_VERSION})
++  set_property(TARGET address_sorting PROPERTY SOVERSION ${CORE_VERSION_MAJOR})
++endif()
+ 
+ target_include_directories(address_sorting
+   PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
+@@ -825,6 +838,10 @@ if(WIN32 AND MSVC)
    endif()
  endif()
  
@@ -45,7 +54,7 @@ index b1a49df..13e64ac 100644
  
  target_include_directories(gpr
    PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
-@@ -1221,6 +1234,10 @@ if(WIN32 AND MSVC)
+@@ -1259,6 +1276,10 @@ if(WIN32 AND MSVC)
    endif()
  endif()
  
@@ -56,7 +65,7 @@ index b1a49df..13e64ac 100644
  
  target_include_directories(grpc
    PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
-@@ -1535,6 +1552,10 @@ if(WIN32 AND MSVC)
+@@ -1633,6 +1654,10 @@ if(WIN32 AND MSVC)
    endif()
  endif()
  
@@ -67,7 +76,7 @@ index b1a49df..13e64ac 100644
  
  target_include_directories(grpc_cronet
    PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
-@@ -2377,6 +2398,10 @@ if(WIN32 AND MSVC)
+@@ -2575,6 +2600,10 @@ if(WIN32 AND MSVC)
    endif()
  endif()
  
@@ -78,7 +87,7 @@ index b1a49df..13e64ac 100644
  
  target_include_directories(grpc_unsecure
    PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
-@@ -2592,6 +2617,10 @@ if(WIN32 AND MSVC)
+@@ -2791,6 +2820,10 @@ if(WIN32 AND MSVC)
    endif()
  endif()
  
@@ -89,7 +98,7 @@ index b1a49df..13e64ac 100644
  
  target_include_directories(grpc++
    PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
-@@ -3078,6 +3107,10 @@ if(WIN32 AND MSVC)
+@@ -3357,6 +3390,10 @@ if(WIN32 AND MSVC)
    endif()
  endif()
  
@@ -100,7 +109,7 @@ index b1a49df..13e64ac 100644
  
  target_include_directories(grpc++_cronet
    PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
-@@ -3282,6 +3315,11 @@ protobuf_generate_grpc_cpp(
+@@ -3630,6 +3667,11 @@ protobuf_generate_grpc_cpp(
    src/proto/grpc/status/status.proto
  )
  
@@ -112,7 +121,7 @@ index b1a49df..13e64ac 100644
  target_include_directories(grpc++_error_details
    PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}
-@@ -3408,6 +3446,11 @@ protobuf_generate_grpc_cpp(
+@@ -3762,6 +3804,11 @@ protobuf_generate_grpc_cpp(
    src/proto/grpc/reflection/v1alpha/reflection.proto
  )
  
@@ -124,7 +133,7 @@ index b1a49df..13e64ac 100644
  target_include_directories(grpc++_reflection
    PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}
-@@ -3827,6 +3870,10 @@ if(WIN32 AND MSVC)
+@@ -4265,6 +4312,10 @@ if(WIN32 AND MSVC)
    endif()
  endif()
  
@@ -135,7 +144,7 @@ index b1a49df..13e64ac 100644
  
  target_include_directories(grpc++_unsecure
    PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
-@@ -4140,6 +4187,10 @@ if(WIN32 AND MSVC)
+@@ -4649,6 +4700,10 @@ if(WIN32 AND MSVC)
    endif()
  endif()
  
@@ -146,7 +155,7 @@ index b1a49df..13e64ac 100644
  
  target_include_directories(grpc_plugin_support
    PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
-@@ -4649,6 +4700,10 @@ if(WIN32 AND MSVC)
+@@ -5184,6 +5239,10 @@ if(WIN32 AND MSVC)
    endif()
  endif()
  
@@ -157,10 +166,6 @@ index b1a49df..13e64ac 100644
  
  target_include_directories(grpc_csharp_ext
    PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
-diff --git a/CMakeLists.txt b/CMakeLists.txt.orig
-similarity index 100%
-copy from CMakeLists.txt
-copy to CMakeLists.txt.orig
 -- 
-2.16.1
+2.17.1
 
diff --git a/meta-networking/recipes-devtools/grpc/grpc/0004-CMakeLists.txt-Find-c-ares-in-target-sysroot-alone.patch b/meta-networking/recipes-devtools/grpc/grpc/0004-CMakeLists.txt-Find-c-ares-in-target-sysroot-alone.patch
deleted file mode 100644
index 8985022fa..000000000
--- a/meta-networking/recipes-devtools/grpc/grpc/0004-CMakeLists.txt-Find-c-ares-in-target-sysroot-alone.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From a498b56ba96948015f0f2784b2ab8296946716ee Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 1 Feb 2018 23:28:17 -0800
-Subject: [PATCH 4/4] CMakeLists.txt: Find c-ares in target sysroot alone
-
-Current code lets it look into native sysroot as well
-which is then preferred during cross compile and it adds
-absolute path to libcares into linker flags
-on heterogenous architectures linker complains and build
-fails
-
-| /mnt/a/oe/build/tmp/work/cortexa7t2hf-neon-vfpv4-bec-linux-gnueabi/grpc/1.8.5-r0/recipe-sysroot-native/usr/lib/lib
-cares.so.2.2.0: file not recognized: File format not recognized
-| collect2: error: ld returned 1 exit status
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- CMakeLists.txt | 6 ++----
- 1 file changed, 2 insertions(+), 4 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 1d7eef1..058423d 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -153,10 +153,8 @@ if("${gRPC_CARES_PROVIDER}" STREQUAL "module")
-     set(gRPC_INSTALL FALSE)
-   endif()
- elseif("${gRPC_CARES_PROVIDER}" STREQUAL "package")
--  find_package(c-ares REQUIRED CONFIG)
--  if(TARGET c-ares::cares)
--    set(_gRPC_CARES_LIBRARIES c-ares::cares)
--  endif()
-+  find_package(c-ares REQUIRED)
-+  set(_gRPC_CARES_LIBRARIES cares)
-   set(_gRPC_FIND_CARES "if(NOT c-ares_FOUND)\n  find_package(c-ares CONFIG)\nendif()")
- endif()
- 
--- 
-2.16.1
-
diff --git a/meta-networking/recipes-devtools/grpc/grpc_1.8.5.bb b/meta-networking/recipes-devtools/grpc/grpc_1.14.1.bb
similarity index 77%
rename from meta-networking/recipes-devtools/grpc/grpc_1.8.5.bb
rename to meta-networking/recipes-devtools/grpc/grpc_1.14.1.bb
index 3e44f99c1..24aa15745 100644
--- a/meta-networking/recipes-devtools/grpc/grpc_1.8.5.bb
+++ b/meta-networking/recipes-devtools/grpc/grpc_1.14.1.bb
@@ -10,11 +10,10 @@ DEPENDS = "gflags c-ares protobuf protobuf-native protobuf-c protobuf-c-native o
 DEPENDS_append_class-target = " gtest grpc-native "
 
 S = "${WORKDIR}/git"
-SRCREV = "db68cb3652cc7697647e9934b5316d98a6ba04d1"
-BRANCH = "v1.8.x"
+SRCREV = "d8020cb6daa87f1a3bb3b0c299bc081c4a3de1e8"
+BRANCH = "v1.14.x"
 SRC_URI = "git://github.com/grpc/grpc.git;protocol=https;branch=${BRANCH} \
            file://0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch \
-           file://0004-CMakeLists.txt-Find-c-ares-in-target-sysroot-alone.patch \
            "
 SRC_URI_append_class-target = " file://0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch"
 
@@ -26,8 +25,14 @@ EXTRA_OECMAKE = " \
     -DgRPC_SSL_PROVIDER=package \
     -DgRPC_PROTOBUF_PROVIDER=package \
     -DgRPC_GFLAGS_PROVIDER=package \
-    -DgRPC_INSTALL=1 \
+    -DgRPC_INSTALL=ON \
+    -DCMAKE_CROSSCOMPILING=ON \
     -DBUILD_SHARED_LIBS=ON \
     "
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
+
+SYSROOT_DIRS_BLACKLIST_append_class-target = "${libdir}/cmake/grpc"
+
+FILES_${PN}-dev += "${bindir}/*"
+FILES_${PN}-dev += "${libdir}/cmake/${PN}"
-- 
2.17.1


