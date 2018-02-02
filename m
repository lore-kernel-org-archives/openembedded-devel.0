Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id B226571B2A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Feb 2018 07:47:33 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id p1so16865536pfh.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Feb 2018 23:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=IrtEhNiPz3+1Sf0puWzQlgujktW7TKgRfIGkj0HEsDo=;
	b=mqrFVyY3XCOsgMCcTXiZR+//mUGPivX9CemZipjevio3QkGvI5/r5guVFgatPfl1cj
	WppBHXI8N0dYXhywGPsKZx4EfkiQ/xyn2qZzXysEvkh1hn7gsJ6JmZ0KyG9aw2l+XHAU
	g0BuKoVdRUBFpxo9iJlj2vD3db+VXuyKJQta5iX4tPWLlhynIbMvkGyqM1+baEFmnHcv
	lFLezDIt8r1CYFlFUZuquSXPlHRvq44m5ik9C5dX9HJP3fJE5ejKgvMWuppwQlmbhPoc
	Az5bpErU9FoUG0sHUolXrRZeV2xqt9R4Ei/K8lhWBFrS3oySdKrQXBK/cxd5dyXBEwjl
	FZaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=IrtEhNiPz3+1Sf0puWzQlgujktW7TKgRfIGkj0HEsDo=;
	b=t4TVKrmz+k9fUZsFx+PoILkoWJotkz24tTvmu7CYi6u6/l4XUGvPrr98E5TsnO+5GJ
	aryAao1Glphn5B4B5rakG/bJXeB7gt86mpC7J7+cOozqF1whc1fWiFCb0p4H3yRkcNMQ
	IAVEZ3/7y4OE86tAru4eyscD98R1LIxKaId6lTRDycP66JponZiHYbWhIeLMUmzsq/xC
	4Ro4kgcdQ2NIHxV/dm0LG4IamoL3aLAqcGqqokVDpavFgZ50/STGFl/FNZ9pTnAfNEGN
	NfCsBBEaxvoLplor8Ju5OQzdyOlnOEfhHcA3IEaOSHEOpbD4ZD8UfQvCr/Sy7tYOufVf
	Rg8A==
X-Gm-Message-State: AKwxyteKy3on5msxzzjbOjey6pFWL/a6VhHm0jI9yNs4g8Is4JFK7PFA
	y7ctR5K06GEoewPXDAhiCxZWIw==
X-Google-Smtp-Source: AH8x226SNsa7WdrmzJeYSr0a/cmAo2cHBijXLWCok4CpegDaiwQTuEFzq9KeZ7Xg5mPlHEzdzzuvSQ==
X-Received: by 10.99.124.94 with SMTP id l30mr30377443pgn.108.1517557654606;
	Thu, 01 Feb 2018 23:47:34 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c::6dba])
	by smtp.gmail.com with ESMTPSA id 76sm2517441pfp.54.2018.02.01.23.47.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Feb 2018 23:47:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Feb 2018 23:47:25 -0800
Message-Id: <20180202074726.7424-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.1
Subject: [meta-oe][PATCH V2] grpc: Update to 1.8.5
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
X-List-Received-Date: Fri, 02 Feb 2018 07:47:33 -0000

Drop upstream patches which are not needed

update version in the patch to 1.8.5 as well

add a new patch to stop looking into native
sysroot for libcares

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Changes in v2:
- Drop upstreamed patches
- Fix cross build to not look into native sysroot for target libs
- Fix version in CMake file

 ...when-cross-compiling-the-host-grpc_cpp_pl.patch |  68 -------------
 ...ht-protoc-executable-regardless-of-protob.patch |  77 --------------
 ...txt-Fix-grpc_cpp_plugin-path-during-cross.patch |   0
 ....txt-Fix-libraries-installation-for-Linux.patch | 113 +++++++++++----------
 ...s.txt-Find-c-ares-in-target-sysroot-alone.patch |  42 ++++++++
 .../grpc/{grpc_1.6.6.bb => grpc_1.8.5.bb}          |  14 ++-
 6 files changed, 109 insertions(+), 205 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/grpc/grpc-1.6.6/0001-CMakeLists-when-cross-compiling-the-host-grpc_cpp_pl.patch
 delete mode 100644 meta-oe/recipes-devtools/grpc/grpc-1.6.6/0001-use-the-right-protoc-executable-regardless-of-protob.patch
 rename meta-oe/recipes-devtools/grpc/{grpc-1.6.6 => grpc}/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch (100%)
 rename meta-oe/recipes-devtools/grpc/{grpc-1.6.6 => grpc}/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch (60%)
 create mode 100644 meta-oe/recipes-devtools/grpc/grpc/0004-CMakeLists.txt-Find-c-ares-in-target-sysroot-alone.patch
 rename meta-oe/recipes-devtools/grpc/{grpc_1.6.6.bb => grpc_1.8.5.bb} (71%)

diff --git a/meta-oe/recipes-devtools/grpc/grpc-1.6.6/0001-CMakeLists-when-cross-compiling-the-host-grpc_cpp_pl.patch b/meta-oe/recipes-devtools/grpc/grpc-1.6.6/0001-CMakeLists-when-cross-compiling-the-host-grpc_cpp_pl.patch
deleted file mode 100644
index 31c36422e..000000000
--- a/meta-oe/recipes-devtools/grpc/grpc-1.6.6/0001-CMakeLists-when-cross-compiling-the-host-grpc_cpp_pl.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From 43ae4e81056888623a73069c11da28a80c39a297 Mon Sep 17 00:00:00 2001
-From: Alexey Firago <alexey_firago@mentor.com>
-Date: Thu, 19 Oct 2017 00:20:36 +0300
-Subject: [PATCH] CMakeLists: when cross-compiling, the host grpc_cpp_plugin
- should be used
-
-Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
----
- CMakeLists.txt                    | 9 ++++++++-
- templates/CMakeLists.txt.template | 9 ++++++++-
- 2 files changed, 16 insertions(+), 2 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 2f66066..af2046c 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -333,6 +333,13 @@ function(protobuf_generate_grpc_cpp)
-     get_filename_component(REL_DIR ${REL_FIL} DIRECTORY)
-     set(RELFIL_WE "${REL_DIR}/${FIL_WE}")
-
-+    #if cross-compiling, find host plugin
-+    if(CMAKE_CROSSCOMPILING)
-+        find_program(gRPC_CPP_PLUGIN grpc_cpp_plugin)
-+    else()
-+        set(gRPC_CPP_PLUGIN $<TARGET_FILE:grpc_cpp_plugin>)
-+    endif()
-+
-     add_custom_command(
-       OUTPUT "${_gRPC_PROTO_GENS_DIR}/${RELFIL_WE}.grpc.pb.cc"
-              "${_gRPC_PROTO_GENS_DIR}/${RELFIL_WE}.grpc.pb.h"
-@@ -342,7 +349,7 @@ function(protobuf_generate_grpc_cpp)
-       COMMAND ${_gRPC_PROTOBUF_PROTOC}
-       ARGS --grpc_out=generate_mock_code=true:${_gRPC_PROTO_GENS_DIR}
-            --cpp_out=${_gRPC_PROTO_GENS_DIR}
--           --plugin=protoc-gen-grpc=$<TARGET_FILE:grpc_cpp_plugin>
-+           --plugin=protoc-gen-grpc=${gRPC_CPP_PLUGIN}
-            ${_protobuf_include_path}
-            ${REL_FIL}
-       DEPENDS ${ABS_FIL} ${_gRPC_PROTOBUF_PROTOC} grpc_cpp_plugin
-diff --git a/templates/CMakeLists.txt.template b/templates/CMakeLists.txt.template
-index 850404b..09c1388 100644
---- a/templates/CMakeLists.txt.template
-+++ b/templates/CMakeLists.txt.template
-@@ -378,6 +378,13 @@
-       get_filename_component(REL_DIR <%text>${REL_FIL}</%text> DIRECTORY)
-       set(RELFIL_WE "<%text>${REL_DIR}/${FIL_WE}</%text>")
-
-+      #if cross-compiling, find host plugin
-+      if(CMAKE_CROSSCOMPILING)
-+          find_program(gRPC_CPP_PLUGIN grpc_cpp_plugin)
-+      else()
-+          set(gRPC_CPP_PLUGIN $<TARGET_FILE:grpc_cpp_plugin>)
-+      endif()
-+
-       add_custom_command(
-         OUTPUT <%text>"${_gRPC_PROTO_GENS_DIR}/${RELFIL_WE}.grpc.pb.cc"</%text>
-                <%text>"${_gRPC_PROTO_GENS_DIR}/${RELFIL_WE}.grpc.pb.h"</%text>
-@@ -387,7 +394,7 @@
-         COMMAND <%text>$<TARGET_FILE:${_gRPC_PROTOBUF_PROTOC}></%text>
-         ARGS --grpc_out=<%text>generate_mock_code=true:${_gRPC_PROTO_GENS_DIR}</%text>
-              --cpp_out=<%text>${_gRPC_PROTO_GENS_DIR}</%text>
--             --plugin=protoc-gen-grpc=$<TARGET_FILE:grpc_cpp_plugin>
-+             --plugin=protoc-gen-grpc=${gRPC_CPP_PLUGIN}
-              <%text>${_protobuf_include_path}</%text>
-              <%text>${REL_FIL}</%text>
-         DEPENDS <%text>${ABS_FIL}</%text> <%text>${_gRPC_PROTOBUF_PROTOC}</%text> grpc_cpp_plugin
---
-2.7.4
diff --git a/meta-oe/recipes-devtools/grpc/grpc-1.6.6/0001-use-the-right-protoc-executable-regardless-of-protob.patch b/meta-oe/recipes-devtools/grpc/grpc-1.6.6/0001-use-the-right-protoc-executable-regardless-of-protob.patch
deleted file mode 100644
index 4621dc6fd..000000000
--- a/meta-oe/recipes-devtools/grpc/grpc-1.6.6/0001-use-the-right-protoc-executable-regardless-of-protob.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From f640fcc81c76953b2e84fc3087f905141b6643b9 Mon Sep 17 00:00:00 2001
-From: Jan Tattermusch <jtattermusch@google.com>
-Date: Thu, 24 Aug 2017 17:51:47 +0200
-Subject: [PATCH] use the right protoc executable regardless of protobuf
- provider
-
----
- CMakeLists.txt                    | 5 ++++-
- templates/CMakeLists.txt.template | 5 ++++-
- 2 files changed, 8 insertions(+), 2 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index bde8946..f9cd630 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -190,6 +190,7 @@ if("${gRPC_PROTOBUF_PROVIDER}" STREQUAL "module")
-     endif()
-     if(TARGET protoc)
-       set(_gRPC_PROTOBUF_PROTOC protoc)
-+      set(_gRPC_PROTOBUF_PROTOC_EXECUTABLE $<TARGET_FILE:protoc>)
-     endif()
-   else()
-       message(WARNING "gRPC_PROTOBUF_PROVIDER is \"module\" but PROTOBUF_ROOT_DIR is wrong")
-@@ -213,8 +214,10 @@ elseif("${gRPC_PROTOBUF_PROVIDER}" STREQUAL "package")
-     endif()
-     if(TARGET protobuf::protoc)
-       set(_gRPC_PROTOBUF_PROTOC protobuf::protoc)
-+      set(_gRPC_PROTOBUF_PROTOC_EXECUTABLE $<TARGET_FILE:protobuf::protoc>)
-     else()
-       set(_gRPC_PROTOBUF_PROTOC ${PROTOBUF_PROTOC_EXECUTABLE})
-+      set(_gRPC_PROTOBUF_PROTOC_EXECUTABLE ${PROTOBUF_PROTOC_EXECUTABLE})
-     endif()
-     set(_gRPC_FIND_PROTOBUF "if(NOT Protobuf_FOUND AND NOT PROTOBUF_FOUND)\n  find_package(Protobuf ${gRPC_PROTOBUF_PACKAGE_TYPE})\nendif()")
-   endif()
-@@ -339,7 +342,7 @@ function(protobuf_generate_grpc_cpp)
-              "${_gRPC_PROTO_GENS_DIR}/${RELFIL_WE}_mock.grpc.pb.h"
-              "${_gRPC_PROTO_GENS_DIR}/${RELFIL_WE}.pb.cc"
-              "${_gRPC_PROTO_GENS_DIR}/${RELFIL_WE}.pb.h"
--      COMMAND $<TARGET_FILE:${_gRPC_PROTOBUF_PROTOC}>
-+      COMMAND ${_gRPC_PROTOBUF_PROTOC_EXECUTABLE}
-       ARGS --grpc_out=generate_mock_code=true:${_gRPC_PROTO_GENS_DIR}
-            --cpp_out=${_gRPC_PROTO_GENS_DIR}
-            --plugin=protoc-gen-grpc=$<TARGET_FILE:grpc_cpp_plugin>
-diff --git a/templates/CMakeLists.txt.template b/templates/CMakeLists.txt.template
-index 850404b..64daf04 100644
---- a/templates/CMakeLists.txt.template
-+++ b/templates/CMakeLists.txt.template
-@@ -235,6 +235,7 @@
-       endif()
-       if(TARGET protoc)
-         set(_gRPC_PROTOBUF_PROTOC protoc)
-+        set(_gRPC_PROTOBUF_PROTOC_EXECUTABLE $<TARGET_FILE:protoc>)
-       endif()
-     else()
-         message(WARNING "gRPC_PROTOBUF_PROVIDER is \"module\" but PROTOBUF_ROOT_DIR is wrong")
-@@ -258,8 +259,10 @@
-       endif()
-       if(TARGET protobuf::protoc)
-         set(_gRPC_PROTOBUF_PROTOC protobuf::protoc)
-+        set(_gRPC_PROTOBUF_PROTOC_EXECUTABLE $<TARGET_FILE:protobuf::protoc>)
-       else()
-         set(_gRPC_PROTOBUF_PROTOC <%text>${PROTOBUF_PROTOC_EXECUTABLE}</%text>)
-+        set(_gRPC_PROTOBUF_PROTOC_EXECUTABLE <%text>${PROTOBUF_PROTOC_EXECUTABLE}</%text>)
-       endif()
-       set(_gRPC_FIND_PROTOBUF "if(NOT Protobuf_FOUND AND NOT PROTOBUF_FOUND)\n  find_package(Protobuf <%text>${gRPC_PROTOBUF_PACKAGE_TYPE}</%text>)\nendif()")
-     endif()
-@@ -384,7 +387,7 @@
-                <%text>"${_gRPC_PROTO_GENS_DIR}/${RELFIL_WE}_mock.grpc.pb.h"</%text>
-                <%text>"${_gRPC_PROTO_GENS_DIR}/${RELFIL_WE}.pb.cc"</%text>
-                <%text>"${_gRPC_PROTO_GENS_DIR}/${RELFIL_WE}.pb.h"</%text>
--        COMMAND <%text>$<TARGET_FILE:${_gRPC_PROTOBUF_PROTOC}></%text>
-+        COMMAND <%text>${_gRPC_PROTOBUF_PROTOC_EXECUTABLE}</%text>
-         ARGS --grpc_out=<%text>generate_mock_code=true:${_gRPC_PROTO_GENS_DIR}</%text>
-              --cpp_out=<%text>${_gRPC_PROTO_GENS_DIR}</%text>
-              --plugin=protoc-gen-grpc=$<TARGET_FILE:grpc_cpp_plugin>
---
-2.7.4
diff --git a/meta-oe/recipes-devtools/grpc/grpc-1.6.6/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch b/meta-oe/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch
similarity index 100%
rename from meta-oe/recipes-devtools/grpc/grpc-1.6.6/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch
rename to meta-oe/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch
diff --git a/meta-oe/recipes-devtools/grpc/grpc-1.6.6/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch b/meta-oe/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch
similarity index 60%
rename from meta-oe/recipes-devtools/grpc/grpc-1.6.6/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch
rename to meta-oe/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch
index c3d406ea3..f8d965294 100644
--- a/meta-oe/recipes-devtools/grpc/grpc-1.6.6/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch
+++ b/meta-oe/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch
@@ -1,157 +1,166 @@
-From cc170860e5b77d7c9f3b9ce8730b719976dab2bb Mon Sep 17 00:00:00 2001
+From 8e9bf962a45a82f1c2eb5858e29fa89a3a60b564 Mon Sep 17 00:00:00 2001
 From: Alexey Firago <alexey_firago@mentor.com>
 Date: Mon, 30 Oct 2017 23:24:49 +0300
-Subject: [PATCH] CMakeLists.txt: Fix libraries installation for Linux
+Subject: [PATCH 1/4] CMakeLists.txt: Fix libraries installation for Linux
 
 * Set libs versions as in Makefile
 
 Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
+
+%% original patch: 0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch
 ---
- CMakeLists.txt | 55 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
- 1 file changed, 55 insertions(+)
+ CMakeLists.txt                        | 55 +++++++++++++++++++++++++++++++++++
+ CMakeLists.txt => CMakeLists.txt.orig |  0
+ 2 files changed, 55 insertions(+)
+ copy CMakeLists.txt => CMakeLists.txt.orig (100%)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 9663934..5719435 100644
+index b1a49df..13e64ac 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -30,6 +30,15 @@ set(PACKAGE_TARNAME   "${PACKAGE_NAME}-${PACKAGE_VERSION}")
  set(PACKAGE_BUGREPORT "https://github.com/grpc/grpc/issues/")
  project(${PACKAGE_NAME} C CXX)
-
+ 
 +set (CORE_VERSION_MAJOR "4")
 +set (CORE_VERSION "4.0.0")
 +
 +set (CPP_VERSION_MAJOR "1")
-+set (CPP_VERSION "1.6.6")
++set (CPP_VERSION "${PACKAGE_VERSION}")
 +
 +set (CSHARP_VERSION_MAJOR "1")
-+set (CSHARP_VERSION "1.6.6")
++set (CSHARP_VERSION "${PACKAGE_VERSION}")
 +
  set(gRPC_INSTALL_BINDIR "${CMAKE_INSTALL_PREFIX}/bin" CACHE PATH "Installation directory for executables")
  set(gRPC_INSTALL_LIBDIR "${CMAKE_INSTALL_PREFIX}/lib" CACHE PATH "Installation directory for libraries")
  set(gRPC_INSTALL_INCLUDEDIR "${CMAKE_INSTALL_PREFIX}/include" CACHE PATH "Installation directory for headers")
-@@ -840,6 +849,10 @@ if(WIN32 AND MSVC)
+@@ -841,6 +850,10 @@ if(WIN32 AND MSVC)
    endif()
  endif()
-
+ 
 +if(_gRPC_PLATFORM_LINUX)
 +  set_property(TARGET gpr PROPERTY VERSION ${CORE_VERSION})
 +  set_property(TARGET gpr PROPERTY SOVERSION ${CORE_VERSION_MAJOR})
 +endif()
-
+ 
  target_include_directories(gpr
-   PUBLIC $<INSTALL_INTERFACE:include> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
-@@ -1228,6 +1241,10 @@ if(WIN32 AND MSVC)
+   PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
+@@ -1221,6 +1234,10 @@ if(WIN32 AND MSVC)
    endif()
  endif()
-
+ 
 +if(_gRPC_PLATFORM_LINUX)
 +  set_property(TARGET grpc PROPERTY VERSION ${CORE_VERSION})
 +  set_property(TARGET grpc PROPERTY SOVERSION ${CORE_VERSION_MAJOR})
 +endif()
-
+ 
  target_include_directories(grpc
-   PUBLIC $<INSTALL_INTERFACE:include> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
-@@ -1534,6 +1551,10 @@ if(WIN32 AND MSVC)
+   PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
+@@ -1535,6 +1552,10 @@ if(WIN32 AND MSVC)
    endif()
  endif()
-
+ 
 +if(_gRPC_PLATFORM_LINUX)
 +  set_property(TARGET grpc_cronet PROPERTY VERSION ${CORE_VERSION})
 +  set_property(TARGET grpc_cronet PROPERTY SOVERSION ${CORE_VERSION_MAJOR})
 +endif()
-
+ 
  target_include_directories(grpc_cronet
-   PUBLIC $<INSTALL_INTERFACE:include> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
-@@ -2366,6 +2387,10 @@ if(WIN32 AND MSVC)
+   PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
+@@ -2377,6 +2398,10 @@ if(WIN32 AND MSVC)
    endif()
  endif()
-
+ 
 +if(_gRPC_PLATFORM_LINUX)
 +  set_property(TARGET grpc_unsecure PROPERTY VERSION ${CORE_VERSION})
 +  set_property(TARGET grpc_unsecure PROPERTY SOVERSION ${CORE_VERSION_MAJOR})
 +endif()
-
+ 
  target_include_directories(grpc_unsecure
-   PUBLIC $<INSTALL_INTERFACE:include> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
-@@ -2583,6 +2608,10 @@ if(WIN32 AND MSVC)
+   PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
+@@ -2592,6 +2617,10 @@ if(WIN32 AND MSVC)
    endif()
  endif()
-
+ 
 +if(_gRPC_PLATFORM_LINUX)
 +  set_property(TARGET grpc++ PROPERTY VERSION ${CPP_VERSION})
 +  set_property(TARGET grpc++ PROPERTY SOVERSION ${CPP_VERSION_MAJOR})
 +endif()
-
+ 
  target_include_directories(grpc++
-   PUBLIC $<INSTALL_INTERFACE:include> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
-@@ -3013,6 +3042,10 @@ if(WIN32 AND MSVC)
+   PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
+@@ -3078,6 +3107,10 @@ if(WIN32 AND MSVC)
    endif()
  endif()
-
+ 
 +if(_gRPC_PLATFORM_LINUX)
 +  set_property(TARGET grpc++_cronet PROPERTY VERSION ${CPP_VERSION})
 +  set_property(TARGET grpc++_cronet PROPERTY SOVERSION ${CPP_VERSION_MAJOR})
 +endif()
-
+ 
  target_include_directories(grpc++_cronet
-   PUBLIC $<INSTALL_INTERFACE:include> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
-@@ -3213,6 +3246,11 @@ protobuf_generate_grpc_cpp(
+   PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
+@@ -3282,6 +3315,11 @@ protobuf_generate_grpc_cpp(
    src/proto/grpc/status/status.proto
  )
-
+ 
 +if(_gRPC_PLATFORM_LINUX)
 +  set_property(TARGET grpc++_error_details PROPERTY VERSION ${CPP_VERSION})
 +  set_property(TARGET grpc++_error_details PROPERTY SOVERSION ${CPP_VERSION_MAJOR})
 +endif()
 +
  target_include_directories(grpc++_error_details
-   PUBLIC $<INSTALL_INTERFACE:include> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
+   PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}
-@@ -3343,6 +3381,11 @@ protobuf_generate_grpc_cpp(
+@@ -3408,6 +3446,11 @@ protobuf_generate_grpc_cpp(
    src/proto/grpc/reflection/v1alpha/reflection.proto
  )
-
+ 
 +if(_gRPC_PLATFORM_LINUX)
 +  set_property(TARGET grpc++_reflection PROPERTY VERSION ${CPP_VERSION})
 +  set_property(TARGET grpc++_reflection PROPERTY SOVERSION ${CPP_VERSION_MAJOR})
 +endif()
 +
  target_include_directories(grpc++_reflection
-   PUBLIC $<INSTALL_INTERFACE:include> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
+   PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}
-@@ -3762,6 +3805,10 @@ if(WIN32 AND MSVC)
+@@ -3827,6 +3870,10 @@ if(WIN32 AND MSVC)
    endif()
  endif()
-
+ 
 +if(_gRPC_PLATFORM_LINUX)
 +  set_property(TARGET grpc++_unsecure PROPERTY VERSION ${CPP_VERSION})
 +  set_property(TARGET grpc++_unsecure PROPERTY SOVERSION ${CPP_VERSION_MAJOR})
 +endif()
-
+ 
  target_include_directories(grpc++_unsecure
-   PUBLIC $<INSTALL_INTERFACE:include> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
-@@ -4075,6 +4122,10 @@ if(WIN32 AND MSVC)
+   PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
+@@ -4140,6 +4187,10 @@ if(WIN32 AND MSVC)
    endif()
  endif()
-
+ 
 +if(_gRPC_PLATFORM_LINUX)
 +  set_property(TARGET grpc_plugin_support PROPERTY VERSION ${CORE_VERSION})
 +  set_property(TARGET grpc_plugin_support PROPERTY SOVERSION ${CORE_VERSION_MAJOR})
 +endif()
-
+ 
  target_include_directories(grpc_plugin_support
-   PUBLIC $<INSTALL_INTERFACE:include> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
-@@ -4599,6 +4650,10 @@ if(WIN32 AND MSVC)
+   PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
+@@ -4649,6 +4700,10 @@ if(WIN32 AND MSVC)
    endif()
  endif()
-
+ 
 +if(_gRPC_PLATFORM_LINUX)
 +  set_property(TARGET grpc_csharp_ext PROPERTY VERSION ${CSHARP_VERSION})
 +  set_property(TARGET grpc_csharp_ext PROPERTY SOVERSION ${CSHARP_VERSION_MAJOR})
 +endif()
-
+ 
  target_include_directories(grpc_csharp_ext
-   PUBLIC $<INSTALL_INTERFACE:include> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
---
-2.7.4
+   PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
+diff --git a/CMakeLists.txt b/CMakeLists.txt.orig
+similarity index 100%
+copy from CMakeLists.txt
+copy to CMakeLists.txt.orig
+-- 
+2.16.1
+
diff --git a/meta-oe/recipes-devtools/grpc/grpc/0004-CMakeLists.txt-Find-c-ares-in-target-sysroot-alone.patch b/meta-oe/recipes-devtools/grpc/grpc/0004-CMakeLists.txt-Find-c-ares-in-target-sysroot-alone.patch
new file mode 100644
index 000000000..8985022fa
--- /dev/null
+++ b/meta-oe/recipes-devtools/grpc/grpc/0004-CMakeLists.txt-Find-c-ares-in-target-sysroot-alone.patch
@@ -0,0 +1,42 @@
+From a498b56ba96948015f0f2784b2ab8296946716ee Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 1 Feb 2018 23:28:17 -0800
+Subject: [PATCH 4/4] CMakeLists.txt: Find c-ares in target sysroot alone
+
+Current code lets it look into native sysroot as well
+which is then preferred during cross compile and it adds
+absolute path to libcares into linker flags
+on heterogenous architectures linker complains and build
+fails
+
+| /mnt/a/oe/build/tmp/work/cortexa7t2hf-neon-vfpv4-bec-linux-gnueabi/grpc/1.8.5-r0/recipe-sysroot-native/usr/lib/lib
+cares.so.2.2.0: file not recognized: File format not recognized
+| collect2: error: ld returned 1 exit status
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ CMakeLists.txt | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 1d7eef1..058423d 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -153,10 +153,8 @@ if("${gRPC_CARES_PROVIDER}" STREQUAL "module")
+     set(gRPC_INSTALL FALSE)
+   endif()
+ elseif("${gRPC_CARES_PROVIDER}" STREQUAL "package")
+-  find_package(c-ares REQUIRED CONFIG)
+-  if(TARGET c-ares::cares)
+-    set(_gRPC_CARES_LIBRARIES c-ares::cares)
+-  endif()
++  find_package(c-ares REQUIRED)
++  set(_gRPC_CARES_LIBRARIES cares)
+   set(_gRPC_FIND_CARES "if(NOT c-ares_FOUND)\n  find_package(c-ares CONFIG)\nendif()")
+ endif()
+ 
+-- 
+2.16.1
+
diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.6.6.bb b/meta-oe/recipes-devtools/grpc/grpc_1.8.5.bb
similarity index 71%
rename from meta-oe/recipes-devtools/grpc/grpc_1.6.6.bb
rename to meta-oe/recipes-devtools/grpc/grpc_1.8.5.bb
index 6fde33d85..0883ec176 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.6.6.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.8.5.bb
@@ -10,14 +10,12 @@ DEPENDS_append_class-target = " gtest grpc-native "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI = "https://github.com/grpc/grpc/archive/v1.6.6.tar.gz"
-SRC_URI[md5sum] = "a960878ad0231189d48ac8ff17eeca3c"
-SRC_URI[sha256sum] = "b97eaa0c8a63b0492dc94bdad621795b4815278e841f06b0c78d6bcbd4c8bdec"
-
-SRC_URI += " \
-    file://0001-use-the-right-protoc-executable-regardless-of-protob.patch \
-    file://0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch \
-"
+SRC_URI = "https://github.com/grpc/grpc/archive/v${PV}.tar.gz \
+           file://0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch \
+           file://0004-CMakeLists.txt-Find-c-ares-in-target-sysroot-alone.patch \
+           "
+SRC_URI[md5sum] = "b565fa6787e42f4969395870c2ad436e"
+SRC_URI[sha256sum] = "df9168da760fd2ee970c74c9d1b63377e0024be248deaa844e784d0df47599de"
 
 SRC_URI_append_class-target = " file://0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch"
 
-- 
2.16.1


