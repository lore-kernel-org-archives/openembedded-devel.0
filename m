Return-Path: <Alexey_Firago@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 4A47C6069C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Oct 2017 20:47:07 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtps (TLSv1:ECDHE-RSA-AES256-SHA:256)
	id 1e9dRF-0003MG-9w from Alexey_Firago@mentor.com ;
	Tue, 31 Oct 2017 13:47:09 -0700
Received: from localhost.localdomain (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server id 14.3.224.2; Tue, 31 Oct 2017 20:47:08 +0000
From: Alexey Firago <alexey_firago@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 31 Oct 2017 23:47:03 +0300
Message-ID: <1509482823-26267-3-git-send-email-alexey_firago@mentor.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1509482823-26267-1-git-send-email-alexey_firago@mentor.com>
References: <1509482823-26267-1-git-send-email-alexey_firago@mentor.com>
MIME-Version: 1.0
Cc: koen@dominion.thruhere.net
Subject: [meta-oe][PATCH 2/2] grpc: Add recipe for grpc v1.6.6
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
X-List-Received-Date: Tue, 31 Oct 2017 20:47:08 -0000
Content-Type: text/plain

Add recipe to build the C based gRPC libraries.

Regular gRPC build process uses git sub-modules for dependcies on external
libraries/tools (c-ares, protobuf, etc). This recipe add patches and configs
to use libraries provided by Yocto/bitbake/OE.

grpc-native is required to build grpc for target - it uses some grpc plugins
built for host.

Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
---
 ...when-cross-compiling-the-host-grpc_cpp_pl.patch |  68 +++++++++
 ...txt-Fix-grpc_cpp_plugin-path-during-cross.patch |  68 +++++++++
 ....txt-Fix-libraries-installation-for-Linux.patch | 157 +++++++++++++++++++++
 ...ht-protoc-executable-regardless-of-protob.patch |  77 ++++++++++
 meta-oe/recipes-devtools/grpc/grpc_1.6.6.bb        |  38 +++++
 5 files changed, 408 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/grpc/grpc-1.6.6/0001-CMakeLists-when-cross-compiling-the-host-grpc_cpp_pl.patch
 create mode 100644 meta-oe/recipes-devtools/grpc/grpc-1.6.6/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch
 create mode 100644 meta-oe/recipes-devtools/grpc/grpc-1.6.6/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch
 create mode 100644 meta-oe/recipes-devtools/grpc/grpc-1.6.6/0001-use-the-right-protoc-executable-regardless-of-protob.patch
 create mode 100644 meta-oe/recipes-devtools/grpc/grpc_1.6.6.bb

diff --git a/meta-oe/recipes-devtools/grpc/grpc-1.6.6/0001-CMakeLists-when-cross-compiling-the-host-grpc_cpp_pl.patch b/meta-oe/recipes-devtools/grpc/grpc-1.6.6/0001-CMakeLists-when-cross-compiling-the-host-grpc_cpp_pl.patch
new file mode 100644
index 0000000..31c3642
--- /dev/null
+++ b/meta-oe/recipes-devtools/grpc/grpc-1.6.6/0001-CMakeLists-when-cross-compiling-the-host-grpc_cpp_pl.patch
@@ -0,0 +1,68 @@
+From 43ae4e81056888623a73069c11da28a80c39a297 Mon Sep 17 00:00:00 2001
+From: Alexey Firago <alexey_firago@mentor.com>
+Date: Thu, 19 Oct 2017 00:20:36 +0300
+Subject: [PATCH] CMakeLists: when cross-compiling, the host grpc_cpp_plugin
+ should be used
+
+Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
+---
+ CMakeLists.txt                    | 9 ++++++++-
+ templates/CMakeLists.txt.template | 9 ++++++++-
+ 2 files changed, 16 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 2f66066..af2046c 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -333,6 +333,13 @@ function(protobuf_generate_grpc_cpp)
+     get_filename_component(REL_DIR ${REL_FIL} DIRECTORY)
+     set(RELFIL_WE "${REL_DIR}/${FIL_WE}")
+
++    #if cross-compiling, find host plugin
++    if(CMAKE_CROSSCOMPILING)
++        find_program(gRPC_CPP_PLUGIN grpc_cpp_plugin)
++    else()
++        set(gRPC_CPP_PLUGIN $<TARGET_FILE:grpc_cpp_plugin>)
++    endif()
++
+     add_custom_command(
+       OUTPUT "${_gRPC_PROTO_GENS_DIR}/${RELFIL_WE}.grpc.pb.cc"
+              "${_gRPC_PROTO_GENS_DIR}/${RELFIL_WE}.grpc.pb.h"
+@@ -342,7 +349,7 @@ function(protobuf_generate_grpc_cpp)
+       COMMAND ${_gRPC_PROTOBUF_PROTOC}
+       ARGS --grpc_out=generate_mock_code=true:${_gRPC_PROTO_GENS_DIR}
+            --cpp_out=${_gRPC_PROTO_GENS_DIR}
+-           --plugin=protoc-gen-grpc=$<TARGET_FILE:grpc_cpp_plugin>
++           --plugin=protoc-gen-grpc=${gRPC_CPP_PLUGIN}
+            ${_protobuf_include_path}
+            ${REL_FIL}
+       DEPENDS ${ABS_FIL} ${_gRPC_PROTOBUF_PROTOC} grpc_cpp_plugin
+diff --git a/templates/CMakeLists.txt.template b/templates/CMakeLists.txt.template
+index 850404b..09c1388 100644
+--- a/templates/CMakeLists.txt.template
++++ b/templates/CMakeLists.txt.template
+@@ -378,6 +378,13 @@
+       get_filename_component(REL_DIR <%text>${REL_FIL}</%text> DIRECTORY)
+       set(RELFIL_WE "<%text>${REL_DIR}/${FIL_WE}</%text>")
+
++      #if cross-compiling, find host plugin
++      if(CMAKE_CROSSCOMPILING)
++          find_program(gRPC_CPP_PLUGIN grpc_cpp_plugin)
++      else()
++          set(gRPC_CPP_PLUGIN $<TARGET_FILE:grpc_cpp_plugin>)
++      endif()
++
+       add_custom_command(
+         OUTPUT <%text>"${_gRPC_PROTO_GENS_DIR}/${RELFIL_WE}.grpc.pb.cc"</%text>
+                <%text>"${_gRPC_PROTO_GENS_DIR}/${RELFIL_WE}.grpc.pb.h"</%text>
+@@ -387,7 +394,7 @@
+         COMMAND <%text>$<TARGET_FILE:${_gRPC_PROTOBUF_PROTOC}></%text>
+         ARGS --grpc_out=<%text>generate_mock_code=true:${_gRPC_PROTO_GENS_DIR}</%text>
+              --cpp_out=<%text>${_gRPC_PROTO_GENS_DIR}</%text>
+-             --plugin=protoc-gen-grpc=$<TARGET_FILE:grpc_cpp_plugin>
++             --plugin=protoc-gen-grpc=${gRPC_CPP_PLUGIN}
+              <%text>${_protobuf_include_path}</%text>
+              <%text>${REL_FIL}</%text>
+         DEPENDS <%text>${ABS_FIL}</%text> <%text>${_gRPC_PROTOBUF_PROTOC}</%text> grpc_cpp_plugin
+--
+2.7.4
diff --git a/meta-oe/recipes-devtools/grpc/grpc-1.6.6/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch b/meta-oe/recipes-devtools/grpc/grpc-1.6.6/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch
new file mode 100644
index 0000000..5774e62
--- /dev/null
+++ b/meta-oe/recipes-devtools/grpc/grpc-1.6.6/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch
@@ -0,0 +1,68 @@
+From cc6dbabea0e452ebc93682df860a79ed9a45722e Mon Sep 17 00:00:00 2001
+From: Alexey Firago <alexey_firago@mentor.com>
+Date: Fri, 20 Oct 2017 00:04:19 +0300
+Subject: [PATCH] CMakeLists.txt: Fix grpc_cpp_plugin path during
+ cross-compilation
+
+Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
+---
+ CMakeLists.txt                    | 9 ++++++++-
+ templates/CMakeLists.txt.template | 9 ++++++++-
+ 2 files changed, 16 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index f9cd630..9663934 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -328,6 +328,13 @@ function(protobuf_generate_grpc_cpp)
+     return()
+   endif()
+
++  #if cross-compiling, find host plugin
++  if(CMAKE_CROSSCOMPILING)
++      find_program(gRPC_CPP_PLUGIN grpc_cpp_plugin)
++  else()
++      set(gRPC_CPP_PLUGIN $<TARGET_FILE:grpc_cpp_plugin>)
++  endif()
++
+   set(_protobuf_include_path -I . -I ${PROTOBUF_WELLKNOWN_IMPORT_DIR})
+   foreach(FIL ${ARGN})
+     get_filename_component(ABS_FIL ${FIL} ABSOLUTE)
+@@ -345,7 +352,7 @@ function(protobuf_generate_grpc_cpp)
+       COMMAND ${_gRPC_PROTOBUF_PROTOC_EXECUTABLE}
+       ARGS --grpc_out=generate_mock_code=true:${_gRPC_PROTO_GENS_DIR}
+            --cpp_out=${_gRPC_PROTO_GENS_DIR}
+-           --plugin=protoc-gen-grpc=$<TARGET_FILE:grpc_cpp_plugin>
++           --plugin=protoc-gen-grpc=${gRPC_CPP_PLUGIN}
+            ${_protobuf_include_path}
+            ${REL_FIL}
+       DEPENDS ${ABS_FIL} ${_gRPC_PROTOBUF_PROTOC} grpc_cpp_plugin
+diff --git a/templates/CMakeLists.txt.template b/templates/CMakeLists.txt.template
+index 64daf04..a7e8629 100644
+--- a/templates/CMakeLists.txt.template
++++ b/templates/CMakeLists.txt.template
+@@ -373,6 +373,13 @@
+       return()
+     endif()
+
++    #if cross-compiling, find host plugin
++    if(CMAKE_CROSSCOMPILING)
++        find_program(gRPC_CPP_PLUGIN grpc_cpp_plugin)
++    else()
++        set(gRPC_CPP_PLUGIN $<TARGET_FILE:grpc_cpp_plugin>)
++    endif()
++
+     set(_protobuf_include_path -I . -I <%text>${PROTOBUF_WELLKNOWN_IMPORT_DIR}</%text>)
+     foreach(FIL <%text>${ARGN}</%text>)
+       get_filename_component(ABS_FIL <%text>${FIL}</%text> ABSOLUTE)
+@@ -390,7 +397,7 @@
+         COMMAND <%text>${_gRPC_PROTOBUF_PROTOC_EXECUTABLE}</%text>
+         ARGS --grpc_out=<%text>generate_mock_code=true:${_gRPC_PROTO_GENS_DIR}</%text>
+              --cpp_out=<%text>${_gRPC_PROTO_GENS_DIR}</%text>
+-             --plugin=protoc-gen-grpc=$<TARGET_FILE:grpc_cpp_plugin>
++             --plugin=protoc-gen-grpc=${gRPC_CPP_PLUGIN}
+              <%text>${_protobuf_include_path}</%text>
+              <%text>${REL_FIL}</%text>
+         DEPENDS <%text>${ABS_FIL}</%text> <%text>${_gRPC_PROTOBUF_PROTOC}</%text> grpc_cpp_plugin
+--
+2.7.4
diff --git a/meta-oe/recipes-devtools/grpc/grpc-1.6.6/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch b/meta-oe/recipes-devtools/grpc/grpc-1.6.6/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch
new file mode 100644
index 0000000..c3d406e
--- /dev/null
+++ b/meta-oe/recipes-devtools/grpc/grpc-1.6.6/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch
@@ -0,0 +1,157 @@
+From cc170860e5b77d7c9f3b9ce8730b719976dab2bb Mon Sep 17 00:00:00 2001
+From: Alexey Firago <alexey_firago@mentor.com>
+Date: Mon, 30 Oct 2017 23:24:49 +0300
+Subject: [PATCH] CMakeLists.txt: Fix libraries installation for Linux
+
+* Set libs versions as in Makefile
+
+Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
+---
+ CMakeLists.txt | 55 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 55 insertions(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 9663934..5719435 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -30,6 +30,15 @@ set(PACKAGE_TARNAME   "${PACKAGE_NAME}-${PACKAGE_VERSION}")
+ set(PACKAGE_BUGREPORT "https://github.com/grpc/grpc/issues/")
+ project(${PACKAGE_NAME} C CXX)
+
++set (CORE_VERSION_MAJOR "4")
++set (CORE_VERSION "4.0.0")
++
++set (CPP_VERSION_MAJOR "1")
++set (CPP_VERSION "1.6.6")
++
++set (CSHARP_VERSION_MAJOR "1")
++set (CSHARP_VERSION "1.6.6")
++
+ set(gRPC_INSTALL_BINDIR "${CMAKE_INSTALL_PREFIX}/bin" CACHE PATH "Installation directory for executables")
+ set(gRPC_INSTALL_LIBDIR "${CMAKE_INSTALL_PREFIX}/lib" CACHE PATH "Installation directory for libraries")
+ set(gRPC_INSTALL_INCLUDEDIR "${CMAKE_INSTALL_PREFIX}/include" CACHE PATH "Installation directory for headers")
+@@ -840,6 +849,10 @@ if(WIN32 AND MSVC)
+   endif()
+ endif()
+
++if(_gRPC_PLATFORM_LINUX)
++  set_property(TARGET gpr PROPERTY VERSION ${CORE_VERSION})
++  set_property(TARGET gpr PROPERTY SOVERSION ${CORE_VERSION_MAJOR})
++endif()
+
+ target_include_directories(gpr
+   PUBLIC $<INSTALL_INTERFACE:include> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
+@@ -1228,6 +1241,10 @@ if(WIN32 AND MSVC)
+   endif()
+ endif()
+
++if(_gRPC_PLATFORM_LINUX)
++  set_property(TARGET grpc PROPERTY VERSION ${CORE_VERSION})
++  set_property(TARGET grpc PROPERTY SOVERSION ${CORE_VERSION_MAJOR})
++endif()
+
+ target_include_directories(grpc
+   PUBLIC $<INSTALL_INTERFACE:include> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
+@@ -1534,6 +1551,10 @@ if(WIN32 AND MSVC)
+   endif()
+ endif()
+
++if(_gRPC_PLATFORM_LINUX)
++  set_property(TARGET grpc_cronet PROPERTY VERSION ${CORE_VERSION})
++  set_property(TARGET grpc_cronet PROPERTY SOVERSION ${CORE_VERSION_MAJOR})
++endif()
+
+ target_include_directories(grpc_cronet
+   PUBLIC $<INSTALL_INTERFACE:include> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
+@@ -2366,6 +2387,10 @@ if(WIN32 AND MSVC)
+   endif()
+ endif()
+
++if(_gRPC_PLATFORM_LINUX)
++  set_property(TARGET grpc_unsecure PROPERTY VERSION ${CORE_VERSION})
++  set_property(TARGET grpc_unsecure PROPERTY SOVERSION ${CORE_VERSION_MAJOR})
++endif()
+
+ target_include_directories(grpc_unsecure
+   PUBLIC $<INSTALL_INTERFACE:include> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
+@@ -2583,6 +2608,10 @@ if(WIN32 AND MSVC)
+   endif()
+ endif()
+
++if(_gRPC_PLATFORM_LINUX)
++  set_property(TARGET grpc++ PROPERTY VERSION ${CPP_VERSION})
++  set_property(TARGET grpc++ PROPERTY SOVERSION ${CPP_VERSION_MAJOR})
++endif()
+
+ target_include_directories(grpc++
+   PUBLIC $<INSTALL_INTERFACE:include> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
+@@ -3013,6 +3042,10 @@ if(WIN32 AND MSVC)
+   endif()
+ endif()
+
++if(_gRPC_PLATFORM_LINUX)
++  set_property(TARGET grpc++_cronet PROPERTY VERSION ${CPP_VERSION})
++  set_property(TARGET grpc++_cronet PROPERTY SOVERSION ${CPP_VERSION_MAJOR})
++endif()
+
+ target_include_directories(grpc++_cronet
+   PUBLIC $<INSTALL_INTERFACE:include> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
+@@ -3213,6 +3246,11 @@ protobuf_generate_grpc_cpp(
+   src/proto/grpc/status/status.proto
+ )
+
++if(_gRPC_PLATFORM_LINUX)
++  set_property(TARGET grpc++_error_details PROPERTY VERSION ${CPP_VERSION})
++  set_property(TARGET grpc++_error_details PROPERTY SOVERSION ${CPP_VERSION_MAJOR})
++endif()
++
+ target_include_directories(grpc++_error_details
+   PUBLIC $<INSTALL_INTERFACE:include> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
+   PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}
+@@ -3343,6 +3381,11 @@ protobuf_generate_grpc_cpp(
+   src/proto/grpc/reflection/v1alpha/reflection.proto
+ )
+
++if(_gRPC_PLATFORM_LINUX)
++  set_property(TARGET grpc++_reflection PROPERTY VERSION ${CPP_VERSION})
++  set_property(TARGET grpc++_reflection PROPERTY SOVERSION ${CPP_VERSION_MAJOR})
++endif()
++
+ target_include_directories(grpc++_reflection
+   PUBLIC $<INSTALL_INTERFACE:include> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
+   PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}
+@@ -3762,6 +3805,10 @@ if(WIN32 AND MSVC)
+   endif()
+ endif()
+
++if(_gRPC_PLATFORM_LINUX)
++  set_property(TARGET grpc++_unsecure PROPERTY VERSION ${CPP_VERSION})
++  set_property(TARGET grpc++_unsecure PROPERTY SOVERSION ${CPP_VERSION_MAJOR})
++endif()
+
+ target_include_directories(grpc++_unsecure
+   PUBLIC $<INSTALL_INTERFACE:include> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
+@@ -4075,6 +4122,10 @@ if(WIN32 AND MSVC)
+   endif()
+ endif()
+
++if(_gRPC_PLATFORM_LINUX)
++  set_property(TARGET grpc_plugin_support PROPERTY VERSION ${CORE_VERSION})
++  set_property(TARGET grpc_plugin_support PROPERTY SOVERSION ${CORE_VERSION_MAJOR})
++endif()
+
+ target_include_directories(grpc_plugin_support
+   PUBLIC $<INSTALL_INTERFACE:include> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
+@@ -4599,6 +4650,10 @@ if(WIN32 AND MSVC)
+   endif()
+ endif()
+
++if(_gRPC_PLATFORM_LINUX)
++  set_property(TARGET grpc_csharp_ext PROPERTY VERSION ${CSHARP_VERSION})
++  set_property(TARGET grpc_csharp_ext PROPERTY SOVERSION ${CSHARP_VERSION_MAJOR})
++endif()
+
+ target_include_directories(grpc_csharp_ext
+   PUBLIC $<INSTALL_INTERFACE:include> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
+--
+2.7.4
diff --git a/meta-oe/recipes-devtools/grpc/grpc-1.6.6/0001-use-the-right-protoc-executable-regardless-of-protob.patch b/meta-oe/recipes-devtools/grpc/grpc-1.6.6/0001-use-the-right-protoc-executable-regardless-of-protob.patch
new file mode 100644
index 0000000..4621dc6
--- /dev/null
+++ b/meta-oe/recipes-devtools/grpc/grpc-1.6.6/0001-use-the-right-protoc-executable-regardless-of-protob.patch
@@ -0,0 +1,77 @@
+From f640fcc81c76953b2e84fc3087f905141b6643b9 Mon Sep 17 00:00:00 2001
+From: Jan Tattermusch <jtattermusch@google.com>
+Date: Thu, 24 Aug 2017 17:51:47 +0200
+Subject: [PATCH] use the right protoc executable regardless of protobuf
+ provider
+
+---
+ CMakeLists.txt                    | 5 ++++-
+ templates/CMakeLists.txt.template | 5 ++++-
+ 2 files changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index bde8946..f9cd630 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -190,6 +190,7 @@ if("${gRPC_PROTOBUF_PROVIDER}" STREQUAL "module")
+     endif()
+     if(TARGET protoc)
+       set(_gRPC_PROTOBUF_PROTOC protoc)
++      set(_gRPC_PROTOBUF_PROTOC_EXECUTABLE $<TARGET_FILE:protoc>)
+     endif()
+   else()
+       message(WARNING "gRPC_PROTOBUF_PROVIDER is \"module\" but PROTOBUF_ROOT_DIR is wrong")
+@@ -213,8 +214,10 @@ elseif("${gRPC_PROTOBUF_PROVIDER}" STREQUAL "package")
+     endif()
+     if(TARGET protobuf::protoc)
+       set(_gRPC_PROTOBUF_PROTOC protobuf::protoc)
++      set(_gRPC_PROTOBUF_PROTOC_EXECUTABLE $<TARGET_FILE:protobuf::protoc>)
+     else()
+       set(_gRPC_PROTOBUF_PROTOC ${PROTOBUF_PROTOC_EXECUTABLE})
++      set(_gRPC_PROTOBUF_PROTOC_EXECUTABLE ${PROTOBUF_PROTOC_EXECUTABLE})
+     endif()
+     set(_gRPC_FIND_PROTOBUF "if(NOT Protobuf_FOUND AND NOT PROTOBUF_FOUND)\n  find_package(Protobuf ${gRPC_PROTOBUF_PACKAGE_TYPE})\nendif()")
+   endif()
+@@ -339,7 +342,7 @@ function(protobuf_generate_grpc_cpp)
+              "${_gRPC_PROTO_GENS_DIR}/${RELFIL_WE}_mock.grpc.pb.h"
+              "${_gRPC_PROTO_GENS_DIR}/${RELFIL_WE}.pb.cc"
+              "${_gRPC_PROTO_GENS_DIR}/${RELFIL_WE}.pb.h"
+-      COMMAND $<TARGET_FILE:${_gRPC_PROTOBUF_PROTOC}>
++      COMMAND ${_gRPC_PROTOBUF_PROTOC_EXECUTABLE}
+       ARGS --grpc_out=generate_mock_code=true:${_gRPC_PROTO_GENS_DIR}
+            --cpp_out=${_gRPC_PROTO_GENS_DIR}
+            --plugin=protoc-gen-grpc=$<TARGET_FILE:grpc_cpp_plugin>
+diff --git a/templates/CMakeLists.txt.template b/templates/CMakeLists.txt.template
+index 850404b..64daf04 100644
+--- a/templates/CMakeLists.txt.template
++++ b/templates/CMakeLists.txt.template
+@@ -235,6 +235,7 @@
+       endif()
+       if(TARGET protoc)
+         set(_gRPC_PROTOBUF_PROTOC protoc)
++        set(_gRPC_PROTOBUF_PROTOC_EXECUTABLE $<TARGET_FILE:protoc>)
+       endif()
+     else()
+         message(WARNING "gRPC_PROTOBUF_PROVIDER is \"module\" but PROTOBUF_ROOT_DIR is wrong")
+@@ -258,8 +259,10 @@
+       endif()
+       if(TARGET protobuf::protoc)
+         set(_gRPC_PROTOBUF_PROTOC protobuf::protoc)
++        set(_gRPC_PROTOBUF_PROTOC_EXECUTABLE $<TARGET_FILE:protobuf::protoc>)
+       else()
+         set(_gRPC_PROTOBUF_PROTOC <%text>${PROTOBUF_PROTOC_EXECUTABLE}</%text>)
++        set(_gRPC_PROTOBUF_PROTOC_EXECUTABLE <%text>${PROTOBUF_PROTOC_EXECUTABLE}</%text>)
+       endif()
+       set(_gRPC_FIND_PROTOBUF "if(NOT Protobuf_FOUND AND NOT PROTOBUF_FOUND)\n  find_package(Protobuf <%text>${gRPC_PROTOBUF_PACKAGE_TYPE}</%text>)\nendif()")
+     endif()
+@@ -384,7 +387,7 @@
+                <%text>"${_gRPC_PROTO_GENS_DIR}/${RELFIL_WE}_mock.grpc.pb.h"</%text>
+                <%text>"${_gRPC_PROTO_GENS_DIR}/${RELFIL_WE}.pb.cc"</%text>
+                <%text>"${_gRPC_PROTO_GENS_DIR}/${RELFIL_WE}.pb.h"</%text>
+-        COMMAND <%text>$<TARGET_FILE:${_gRPC_PROTOBUF_PROTOC}></%text>
++        COMMAND <%text>${_gRPC_PROTOBUF_PROTOC_EXECUTABLE}</%text>
+         ARGS --grpc_out=<%text>generate_mock_code=true:${_gRPC_PROTO_GENS_DIR}</%text>
+              --cpp_out=<%text>${_gRPC_PROTO_GENS_DIR}</%text>
+              --plugin=protoc-gen-grpc=$<TARGET_FILE:grpc_cpp_plugin>
+--
+2.7.4
diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.6.6.bb b/meta-oe/recipes-devtools/grpc/grpc_1.6.6.bb
new file mode 100644
index 0000000..6fde33d
--- /dev/null
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.6.6.bb
@@ -0,0 +1,38 @@
+DESCRIPTION = "A high performance, open source, general-purpose RPC framework. \
+Provides gRPC libraries for multiple languages written on top of shared C core library \
+(C++, Node.js, Python, Ruby, Objective-C, PHP, C#)"
+HOMEPAGE = "https://github.com/grpc/grpc"
+SECTION = "libs"
+LICENSE = "Apache-2"
+
+DEPENDS = "gflags c-ares protobuf protobuf-native protobuf-c protobuf-c-native openssl"
+DEPENDS_append_class-target = " gtest grpc-native "
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+SRC_URI = "https://github.com/grpc/grpc/archive/v1.6.6.tar.gz"
+SRC_URI[md5sum] = "a960878ad0231189d48ac8ff17eeca3c"
+SRC_URI[sha256sum] = "b97eaa0c8a63b0492dc94bdad621795b4815278e841f06b0c78d6bcbd4c8bdec"
+
+SRC_URI += " \
+    file://0001-use-the-right-protoc-executable-regardless-of-protob.patch \
+    file://0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch \
+"
+
+SRC_URI_append_class-target = " file://0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch"
+
+inherit cmake
+
+EXTRA_OECMAKE = " \
+    -DgRPC_CARES_PROVIDER=package \
+    -DgRPC_ZLIB_PROVIDER=package \
+    -DgRPC_SSL_PROVIDER=package \
+    -DgRPC_PROTOBUF_PROVIDER=package \
+    -DgRPC_GFLAGS_PROVIDER=package \
+    -DgRPC_INSTALL=1 \
+    -DBUILD_SHARED_LIBS=ON \
+    "
+
+FILES_${PN}-dev += "${libdir}/cmake"
+
+BBCLASSEXTEND = "native"
-- 
2.7.4


