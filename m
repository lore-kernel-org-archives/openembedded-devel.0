Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C683C433F5
	for <webhook@archiver.kernel.org>; Tue, 12 Oct 2021 18:04:02 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.17908.1634061841193435192
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Oct 2021 11:04:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eGATkwGR;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id g25so78551wrb.2
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Oct 2021 11:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mx5Z2ZLZrF4RC+kxutzyLg2WLl+xxxpKpTYpR8yjidk=;
        b=eGATkwGRsolApIfAliouBgC+W6XOda4fRZmrKzfkNNQ8T8AKhPVTtDVNJE18ZjLATb
         ZqIJFeMLqDSWP3gy4wProE8+GY8I+J8+0lFCOtOMOIo467cbczhf+bIn0D86lnBhmcX+
         BMIBYqVRbxNQGhHux5UobSMpgP5BrRa7jQzE4k4sEOtkATQqd0kNMn9vFC/EWlYwFumz
         epa6812GKBX7914MZo4FiIOZyAOwo0o+hXhmdERcuWIir3F2inQ1jW2ojifR+bkA0v5T
         ZaKnqdCDs95CY0F4AIxhRj1p7eTiRFC3GkGarLCUyCI+UDtwfSn9Dw7DcYb0FWAdtZRt
         SdVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mx5Z2ZLZrF4RC+kxutzyLg2WLl+xxxpKpTYpR8yjidk=;
        b=yt98hI3FWZRPpw+roFgEKL+16WHrJO4RZNgenj8diGDZ2S4I5nzMxAIfu6dsR6GLes
         ED0j/pucRqOz+Ld3SBXTbVaQfSjQr+y8hXYYZzWW4kjYh+00OcEZ5xwZZKrvYeQO82qZ
         SRa8y43eJ987Wa+A5zTQeAp75E5pX8VkZsxtAZ8QKscYBJ417Nwl5bE+h0Vj/+Id+L9T
         S/ZuP0lZLxQeHrjRTqU/jBZwweWrLbqKQQLuptEzR0aXrXOevejB5Jv2x0WGJpkKRHBV
         xXftLb+M9aNpspQOwL0RsR4Lvdf88ia/YCHCDfwikr8ODQsSLguMAER42CNM+0zyDIrM
         +xBA==
X-Gm-Message-State: AOAM530U0P3fMZohccNOo5eiMmc8FislBvoLrYuk6qTIfAll8P1V3aqV
	lOWQZ1s7vQ01pCML5IlX2FevUIxZBb63pCHa
X-Google-Smtp-Source: 
 ABdhPJw0ScpVjQF/p0T37yiElfXt3GSxbsCLBKrSl+4l8o23tMQ8Qde4MrO6Saifz++SUx+FSQi11A==
X-Received: by 2002:adf:a45e:: with SMTP id
 e30mr33788674wra.269.1634061839190;
        Tue, 12 Oct 2021 11:03:59 -0700 (PDT)
Received: from slackware.local ([91.199.118.72])
        by smtp.gmail.com with ESMTPSA id
 j14sm5758386wrw.12.2021.10.12.11.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 11:03:58 -0700 (PDT)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [meta-oe][PATCH] grpc: upgrade 1.38.1 -> 1.41.0
Date: Tue, 12 Oct 2021 20:03:42 +0200
Message-Id: <20211012180342.108190-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Oct 2021 18:04:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93256

Drop the patch that fixes cross compilation, because it's already in
1.41.0. Add the patch for regression fix [1], which should be dropped on
the recipe upgrade.

[1] https://github.com/grpc/grpc/issues/26857

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 ...8fb0ee826e73323e06ac6166ac038ee71f6a.patch | 107 ++++++++++++++++++
 ...compilation-with-gRPC_BUILD_GRPC_CPP.patch |  55 ---------
 .../grpc/{grpc_1.38.1.bb => grpc_1.41.0.bb}   |   6 +-
 3 files changed, 110 insertions(+), 58 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/grpc/grpc/0001-cmake-revert-db88fb0ee826e73323e06ac6166ac038ee71f6a.patch
 delete mode 100644 meta-oe/recipes-devtools/grpc/grpc/0002-cmake-fix-cross-compilation-with-gRPC_BUILD_GRPC_CPP.patch
 rename meta-oe/recipes-devtools/grpc/{grpc_1.38.1.bb => grpc_1.41.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/grpc/grpc/0001-cmake-revert-db88fb0ee826e73323e06ac6166ac038ee71f6a.patch b/meta-oe/recipes-devtools/grpc/grpc/0001-cmake-revert-db88fb0ee826e73323e06ac6166ac038ee71f6a.patch
new file mode 100644
index 000000000..d9cfa009f
--- /dev/null
+++ b/meta-oe/recipes-devtools/grpc/grpc/0001-cmake-revert-db88fb0ee826e73323e06ac6166ac038ee71f6a.patch
@@ -0,0 +1,107 @@
+From 50d54458324c1a19eefb9968e4cb556dbd34b875 Mon Sep 17 00:00:00 2001
+From: Vyacheslav Yurkov <uvv.mail@gmail.com>
+Date: Tue, 12 Oct 2021 19:11:40 +0200
+Subject: [PATCH] cmake: revert db88fb0ee826e73323e06ac6166ac038ee71f6a
+ (#27626)
+
+Fix regression introduced by previous commit. Original problem that
+commit was trying to fix was solved by modification of grpc recipe in
+meta-openembedded project repository
+
+Fixes #26857
+
+Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
+---
+ CMakeLists.txt                    | 16 ++++++++--------
+ templates/CMakeLists.txt.template |  2 --
+ 2 files changed, 8 insertions(+), 10 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 0e8fbdee8b..02cd48bee4 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -3828,7 +3828,7 @@ foreach(_hdr
+ endforeach()
+ 
+ 
+-if(gRPC_INSTALL AND NOT CMAKE_CROSSCOMPILING)
++if(gRPC_INSTALL)
+   install(TARGETS grpc_plugin_support EXPORT gRPCTargets
+     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
+     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
+@@ -11679,7 +11679,7 @@ target_link_libraries(grpc_cpp_plugin
+ 
+ 
+ 
+-if(gRPC_INSTALL AND NOT CMAKE_CROSSCOMPILING)
++if(gRPC_INSTALL)
+   install(TARGETS grpc_cpp_plugin EXPORT gRPCTargets
+     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
+     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
+@@ -11718,7 +11718,7 @@ target_link_libraries(grpc_csharp_plugin
+ 
+ 
+ 
+-if(gRPC_INSTALL AND NOT CMAKE_CROSSCOMPILING)
++if(gRPC_INSTALL)
+   install(TARGETS grpc_csharp_plugin EXPORT gRPCTargets
+     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
+     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
+@@ -11757,7 +11757,7 @@ target_link_libraries(grpc_node_plugin
+ 
+ 
+ 
+-if(gRPC_INSTALL AND NOT CMAKE_CROSSCOMPILING)
++if(gRPC_INSTALL)
+   install(TARGETS grpc_node_plugin EXPORT gRPCTargets
+     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
+     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
+@@ -11796,7 +11796,7 @@ target_link_libraries(grpc_objective_c_plugin
+ 
+ 
+ 
+-if(gRPC_INSTALL AND NOT CMAKE_CROSSCOMPILING)
++if(gRPC_INSTALL)
+   install(TARGETS grpc_objective_c_plugin EXPORT gRPCTargets
+     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
+     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
+@@ -11835,7 +11835,7 @@ target_link_libraries(grpc_php_plugin
+ 
+ 
+ 
+-if(gRPC_INSTALL AND NOT CMAKE_CROSSCOMPILING)
++if(gRPC_INSTALL)
+   install(TARGETS grpc_php_plugin EXPORT gRPCTargets
+     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
+     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
+@@ -11874,7 +11874,7 @@ target_link_libraries(grpc_python_plugin
+ 
+ 
+ 
+-if(gRPC_INSTALL AND NOT CMAKE_CROSSCOMPILING)
++if(gRPC_INSTALL)
+   install(TARGETS grpc_python_plugin EXPORT gRPCTargets
+     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
+     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
+@@ -11913,7 +11913,7 @@ target_link_libraries(grpc_ruby_plugin
+ 
+ 
+ 
+-if(gRPC_INSTALL AND NOT CMAKE_CROSSCOMPILING)
++if(gRPC_INSTALL)
+   install(TARGETS grpc_ruby_plugin EXPORT gRPCTargets
+     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
+     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
+diff --git a/templates/CMakeLists.txt.template b/templates/CMakeLists.txt.template
+index 0f0883e09c..b9a5bc4144 100644
+--- a/templates/CMakeLists.txt.template
++++ b/templates/CMakeLists.txt.template
+@@ -695,8 +695,6 @@
+   # grpcpp_channelz doesn't build with protobuf-lite, so no install required
+   # See https://github.com/grpc/grpc/issues/22826
+   if(gRPC_INSTALL AND NOT gRPC_USE_PROTO_LITE)
+-  % elif tgt.build == 'protoc':
+-  if(gRPC_INSTALL AND NOT CMAKE_CROSSCOMPILING)
+   % else:
+   if(gRPC_INSTALL)
+   % endif
diff --git a/meta-oe/recipes-devtools/grpc/grpc/0002-cmake-fix-cross-compilation-with-gRPC_BUILD_GRPC_CPP.patch b/meta-oe/recipes-devtools/grpc/grpc/0002-cmake-fix-cross-compilation-with-gRPC_BUILD_GRPC_CPP.patch
deleted file mode 100644
index ce660f5cc..000000000
--- a/meta-oe/recipes-devtools/grpc/grpc/0002-cmake-fix-cross-compilation-with-gRPC_BUILD_GRPC_CPP.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 83a66aa45d63d79cbccc47a65998723a7d2d7637 Mon Sep 17 00:00:00 2001
-From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
-Date: Wed, 23 Jun 2021 14:22:59 +0200
-Subject: [PATCH] cmake: fix cross-compilation with
- gRPC_BUILD_GRPC_CPP_PLUGIN=OFF (#26292)
-
-* cmake: fix cross-compilation with gRPC_BUILD_GRPC_CPP_PLUGIN=OFF
-
-When cross-compiling gRPC, a _native_ version of 'grpc_cpp_plugin' is
-searched in the environment. For most use cases, a _cross_ version of this
-file is not needed and gRPC_BUILD_GRPC_CPP_PLUGIN can be set to OFF.
-
-However, when cross-building with -DgRPC_BUILD_GRPC_CPP_PLUGIN=OFF, there
-are some build errors, for example:
-
-make[3]: *** No rule to make target 'grpc_cpp_plugin', needed by 'gens/src/proto/grpc/reflection/v1alpha/reflection.grpc.pb.cc'.  Stop.
-
-This is because there is still a hard dependency on 'grpc_cpp_plugin' for
-these targets, not taking into account the cross-compilation case.
-
-Fix by depending on the variable gRPC_CPP_PLUGIN, which is set correctly for
-either cross or native case.
-
-* regenerate projects
----
- CMakeLists.txt                    | 2 +-
- templates/CMakeLists.txt.template | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index eeaf0b43c7..c60a64917a 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -319,7 +319,7 @@ function(protobuf_generate_grpc_cpp)
-            --plugin=protoc-gen-grpc=${_gRPC_CPP_PLUGIN}
-            ${_protobuf_include_path}
-            ${REL_FIL}
--      DEPENDS ${ABS_FIL} ${_gRPC_PROTOBUF_PROTOC} grpc_cpp_plugin
-+      DEPENDS ${ABS_FIL} ${_gRPC_PROTOBUF_PROTOC} ${_gRPC_CPP_PLUGIN}
-       WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
-       COMMENT "Running gRPC C++ protocol buffer compiler on ${FIL}"
-       VERBATIM)
-diff --git a/templates/CMakeLists.txt.template b/templates/CMakeLists.txt.template
-index cef2534cbd..f0afe5108e 100644
---- a/templates/CMakeLists.txt.template
-+++ b/templates/CMakeLists.txt.template
-@@ -389,7 +389,7 @@
-              --plugin=protoc-gen-grpc=<%text>${_gRPC_CPP_PLUGIN}</%text>
-              <%text>${_protobuf_include_path}</%text>
-              <%text>${REL_FIL}</%text>
--        DEPENDS <%text>${ABS_FIL}</%text> <%text>${_gRPC_PROTOBUF_PROTOC}</%text> grpc_cpp_plugin
-+        DEPENDS <%text>${ABS_FIL}</%text> <%text>${_gRPC_PROTOBUF_PROTOC}</%text> <%text>${_gRPC_CPP_PLUGIN}</%text>
-         WORKING_DIRECTORY <%text>${CMAKE_CURRENT_SOURCE_DIR}</%text>
-         COMMENT "Running gRPC C++ protocol buffer compiler on <%text>${FIL}</%text>"
-         VERBATIM)
diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.38.1.bb b/meta-oe/recipes-devtools/grpc/grpc_1.41.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/grpc/grpc_1.38.1.bb
rename to meta-oe/recipes-devtools/grpc/grpc_1.41.0.bb
index dfb44b819..3385e2ada 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.38.1.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.41.0.bb
@@ -20,10 +20,10 @@ RDEPENDS:${PN}-dev:class_native += "${PN}-compiler"
 # RDEPENDS:${PN}-dev += "${PN}-compiler"
 
 S = "${WORKDIR}/git"
-SRCREV_grpc = "96b73272eadc01afb5fb45b92b408c47e4387274"
-BRANCH = "v1.38.x"
+SRCREV_grpc = "fc662b7964384b701af5bd3ce6994d2180080eb4"
+BRANCH = "v1.41.x"
 SRC_URI = "git://github.com/grpc/grpc.git;protocol=https;name=grpc;branch=${BRANCH} \
-           file://0002-cmake-fix-cross-compilation-with-gRPC_BUILD_GRPC_CPP.patch \
+           file://0001-cmake-revert-db88fb0ee826e73323e06ac6166ac038ee71f6a.patch \
            "
 # Fixes build with older compilers 4.8 especially on ubuntu 14.04
 CXXFLAGS:append:class-native = " -Wl,--no-as-needed"
-- 
2.28.0


