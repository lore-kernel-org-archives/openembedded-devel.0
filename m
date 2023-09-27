Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53961E810B2
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 08:42:58 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.13271.1695804172087419817
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Sep 2023 01:42:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LPIvILQa;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: peron.clem@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-50444e756deso13144286e87.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 01:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695804169; x=1696408969; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Paz36ekLcpCZCJW0j7qgHyStRY/rvanK8tOH6fnzNk=;
        b=LPIvILQaSX4fTWYam9bxQOvI7Rl2Wmf0V3x3Pv4uiIzzEg4V8JR49afJc1hl1JXuMf
         ZZpFHgKaOmOsWh3pbuoA3k9di/fY8OwFejbuDRLTiJNFxTzbUhVfpnNiNQhcrv6iiJv9
         JIV+XbpmVTbqruZXfGRJuiqSLVAqPrRIsNo/wQE+bnv8AtviGvn1VFIxgEAVhe+s2mtj
         Z+lurWQV38SK4op4SXUsu8JAob/oL7n8r+vcDGxVLtvWJiHWWKYmWh2vIZkOP6Twxhdt
         VEg0GNEn2+isXq2kimoHzaQyfmaclRkfaHIUFW3gYnNbN5ncgOHfz+JkBOqUho3vSKew
         I53Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695804169; x=1696408969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Paz36ekLcpCZCJW0j7qgHyStRY/rvanK8tOH6fnzNk=;
        b=l/EER+Mfw8K1i/yPCY7TOuNmMoi67T693zqK6RFei//Wsuk8ydfMWoxhJFQ30KKLVD
         Jco4yXwMVU/0NRsyleDjexesceN67BaOf2StSHS449yiY+wF5hhClPQbYcG+52R/0VLH
         V0O09QDk1l93N7Q/E1DTpmpLB6TS392vMh39i17G+4At8K/JOXjCs1RooK43R/ADTPJn
         kLwRCq8diDnTfUviOvHUyjzgxT3fqtptUUSNsZRsrKf3F3OR5JadyZgU5JzaKtNEJgsm
         bSd68FMRtnnxmLe1VVxzhw2xxwOkwuef2+w4OpQPAavoPsCjD8l97y6XEsLdDN2fyH6a
         62lw==
X-Gm-Message-State: AOJu0YyvYJYiZKtWIRdGoxjtH4FYbW5+mOzfIcNFmLWll5fQNHKt2PEH
	haRmvM/pMnPWH88KP6RCokHfqAh5bQk=
X-Google-Smtp-Source: AGHT+IE3jlYjzrlx4bbbbGtonBIbxzPoSBspsbHeAwQRHzjA01UYnp0N7eVhj9LuLfWQTPUqZv0MOw==
X-Received: by 2002:a19:4f07:0:b0:503:38ef:eb54 with SMTP id d7-20020a194f07000000b0050338efeb54mr1015037lfb.37.1695804168919;
        Wed, 27 Sep 2023 01:42:48 -0700 (PDT)
Received: from firmware-builder.outsight.local (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
        by smtp.gmail.com with ESMTPSA id c24-20020a7bc858000000b004030c778396sm20008616wml.4.2023.09.27.01.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 01:42:48 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v3 4/9] devtools: grpc: bump to 1.56.2
Date: Wed, 27 Sep 2023 10:42:37 +0200
Message-Id: <20230927084242.1195772-5-peron.clem@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230927084242.1195772-1-peron.clem@gmail.com>
References: <20230927084242.1195772-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 08:42:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105179

Remove merged patch that export plugin to a separate targets

Remove no more applicatable patch

Remove CVE patch already present

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 ...RPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch | 62 -------------
 ...d-separate-export-for-plugin-targets.patch | 93 -------------------
 .../grpc/grpc/0001-fix-CVE-2023-32732.patch   | 81 ----------------
 .../grpc/{grpc_1.50.1.bb => grpc_1.56.2.bb}   |  7 +-
 4 files changed, 2 insertions(+), 241 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/grpc/grpc/0001-Revert-Changed-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch
 delete mode 100644 meta-oe/recipes-devtools/grpc/grpc/0001-cmake-add-separate-export-for-plugin-targets.patch
 delete mode 100644 meta-oe/recipes-devtools/grpc/grpc/0001-fix-CVE-2023-32732.patch
 rename meta-oe/recipes-devtools/grpc/{grpc_1.50.1.bb => grpc_1.56.2.bb} (90%)

diff --git a/meta-oe/recipes-devtools/grpc/grpc/0001-Revert-Changed-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch b/meta-oe/recipes-devtools/grpc/grpc/0001-Revert-Changed-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch
deleted file mode 100644
index b245ad865..000000000
--- a/meta-oe/recipes-devtools/grpc/grpc/0001-Revert-Changed-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From dc593958e556dd496b774f35c5992285510d6859 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Tue, 19 Oct 2021 17:09:55 +0200
-Subject: [PATCH] Revert "Changed GRPCPP_ABSEIL_SYNC to GPR_ABSEIL_SYNC
- (#25681)"
-
-This reverts commit 931f91b745cd5b2864a0d1787815871d0bd844ae.
-
-Fixes sysdig from meta-oe and other recipes (like com.webos.service.tts
-libgoogleassistant from meta-webosose) failing with:
-
-| FAILED: userspace/sysdig/sysdig
-| : && /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/x86_64-oe-linux-g++ -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-sec
-urity  --sysroot=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0=/usr/src/debug/sysdig/0.27.1-r0                      -f
-debug-prefix-map=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0=/usr/src/debug/sysdig/0.27.1-r0                      -fdebug-prefix-map=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/OE/bu
-ild/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/OE/build
-/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot -Wall -ggdb   -std=c++0x -O3 -fno-strict-aliasing -DNDEBUG  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
---sysroot=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0=/usr/src/debug/sysdig/0.27.1-r0                      -fdebug-p
-refix-map=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0=/usr/src/debug/sysdig/0.27.1-r0                      -fdebug-prefix-map=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/OE/build/oe-
-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/OE/build/oe-cor
-e/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fmacro-prefix-map=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0=/usr/src/debug/sysdig/0.27.1-r0                      -fdebug-prefix-map=/OE/build/oe-cor
-e/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0=/usr/src/debug/sysdig/0.27.1-r0                      -fdebug-prefix-map=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/OE/build/oe-core/tmp-glibc/work/core2-
-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot-native=  -Wl,-z,relro,-z,now -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fmacro-prefix-map=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0=/usr/src/debug/sysdig/0.27.1-r0                      -fdebug-prefix-map=/OE/build/
-oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0=/usr/src/debug/sysdig/0.27.1-r0                      -fdebug-prefix-map=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/OE/build/oe-core/tmp-glibc/work/
-core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot-native=  -Wl,-z,relro,-z,now   -rdynamic userspace/sysdig/CMakeFiles/sysdig.dir/fields_info.cpp.o userspace/sysdig/CMakeFiles/sysdig.dir/sysdig.cpp.o -o userspace/sysdig/sysdig  userspace/libsinsp/libsinsp.a  userspace/libscap/libscap.a
- -lelf  -lz  -lcurl  -ljsoncpp  -ltbb  -lcares  -lgrpc++_unsecure  -lgrpc_unsecure  -lprotobuf  -lcares  -lgrpc++_unsecure  -lgrpc_unsecure  -lprotobuf  -ljq  -lb64  -lrt  -lanl  -lssl  -lcrypto  -lluajit-5.1  -ldl  -lpthread && :
-| /usr/include/grpcpp/impl/codegen/completion_queue.h:121: error: undefined reference to 'absl::lts_20210324::Mutex::~Mutex()'
-| /usr/include/grpcpp/impl/codegen/completion_queue.h:121: error: undefined reference to 'absl::lts_20210324::Mutex::~Mutex()'
-| /usr/include/grpcpp/impl/codegen/completion_queue.h:121: error: undefined reference to 'absl::lts_20210324::Mutex::~Mutex()'
-| /usr/include/grpcpp/impl/codegen/completion_queue.h:259: error: undefined reference to 'absl::lts_20210324::Mutex::~Mutex()'
-| collect2: error: ld returned 1 exit status
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
----
-Upstream-Status: Pending
-
- include/grpcpp/impl/codegen/sync.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/include/grpcpp/impl/codegen/sync.h b/include/grpcpp/impl/codegen/sync.h
-index 4cb8133c7c..3d10d9a3a0 100644
---- a/include/grpcpp/impl/codegen/sync.h
-+++ b/include/grpcpp/impl/codegen/sync.h
-@@ -47,7 +47,7 @@
- namespace grpc {
- namespace internal {
- 
--#ifdef GPR_ABSEIL_SYNC
-+#ifdef GRPCPP_ABSEIL_SYNC
- 
- using Mutex = absl::Mutex;
- using MutexLock = absl::MutexLock;
-@@ -142,7 +142,7 @@ class CondVar {
-   gpr_cv cv_;
- };
- 
--#endif  // GPR_ABSEIL_SYNC
-+#endif  // GRPCPP_ABSEIL_SYNC
- 
- template <typename Predicate>
- GRPC_DEPRECATED("incompatible with thread safety analysis")
diff --git a/meta-oe/recipes-devtools/grpc/grpc/0001-cmake-add-separate-export-for-plugin-targets.patch b/meta-oe/recipes-devtools/grpc/grpc/0001-cmake-add-separate-export-for-plugin-targets.patch
deleted file mode 100644
index 679bd3882..000000000
--- a/meta-oe/recipes-devtools/grpc/grpc/0001-cmake-add-separate-export-for-plugin-targets.patch
+++ /dev/null
@@ -1,93 +0,0 @@
-From 3150cb043363e05588062dd392b940be25594713 Mon Sep 17 00:00:00 2001
-From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
-Date: Tue, 18 Feb 2020 14:17:07 +0100
-Subject: [PATCH] cmake: add separate export for plugin targets
-
-Upstream-Status: Submitted [https://github.com/grpc/grpc/pull/29328]
-
-
----
- CMakeLists.txt | 18 +++++++++++-------
- 1 file changed, 11 insertions(+), 7 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index efdaf8936d..6608b1b00c 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -10935,7 +10935,7 @@ target_link_libraries(grpc_cpp_plugin
- 
- 
- if(gRPC_INSTALL)
--  install(TARGETS grpc_cpp_plugin EXPORT gRPCTargets
-+  install(TARGETS grpc_cpp_plugin EXPORT gRPCPluginTargets
-     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
-     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
-     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
-@@ -10975,7 +10975,7 @@ target_link_libraries(grpc_csharp_plugin
- 
- 
- if(gRPC_INSTALL)
--  install(TARGETS grpc_csharp_plugin EXPORT gRPCTargets
-+  install(TARGETS grpc_csharp_plugin EXPORT gRPCPluginTargets
-     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
-     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
-     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
-@@ -11015,7 +11015,7 @@ target_link_libraries(grpc_node_plugin
- 
- 
- if(gRPC_INSTALL)
--  install(TARGETS grpc_node_plugin EXPORT gRPCTargets
-+  install(TARGETS grpc_node_plugin EXPORT gRPCPluginTargets
-     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
-     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
-     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
-@@ -11055,7 +11055,7 @@ target_link_libraries(grpc_objective_c_plugin
- 
- 
- if(gRPC_INSTALL)
--  install(TARGETS grpc_objective_c_plugin EXPORT gRPCTargets
-+  install(TARGETS grpc_objective_c_plugin EXPORT gRPCPluginTargets
-     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
-     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
-     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
-@@ -11095,7 +11095,7 @@ target_link_libraries(grpc_php_plugin
- 
- 
- if(gRPC_INSTALL)
--  install(TARGETS grpc_php_plugin EXPORT gRPCTargets
-+  install(TARGETS grpc_php_plugin EXPORT gRPCPluginTargets
-     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
-     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
-     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
-@@ -11135,7 +11135,7 @@ target_link_libraries(grpc_python_plugin
- 
- 
- if(gRPC_INSTALL)
--  install(TARGETS grpc_python_plugin EXPORT gRPCTargets
-+  install(TARGETS grpc_python_plugin EXPORT gRPCPluginTargets
-     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
-     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
-     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
-@@ -11175,7 +11175,7 @@ target_link_libraries(grpc_ruby_plugin
- 
- 
- if(gRPC_INSTALL)
--  install(TARGETS grpc_ruby_plugin EXPORT gRPCTargets
-+  install(TARGETS grpc_ruby_plugin EXPORT gRPCPluginTargets
-     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
-     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
-     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
-@@ -17349,6 +17349,10 @@ if(gRPC_INSTALL)
-     DESTINATION ${gRPC_INSTALL_CMAKEDIR}
-     NAMESPACE gRPC::
-   )
-+  install(EXPORT gRPCPluginTargets
-+    DESTINATION ${gRPC_INSTALL_CMAKEDIR}
-+    NAMESPACE gRPC::
-+  )
- endif()
- 
- include(CMakePackageConfigHelpers)
--- 
-2.30.2
-
diff --git a/meta-oe/recipes-devtools/grpc/grpc/0001-fix-CVE-2023-32732.patch b/meta-oe/recipes-devtools/grpc/grpc/0001-fix-CVE-2023-32732.patch
deleted file mode 100644
index ab46897b1..000000000
--- a/meta-oe/recipes-devtools/grpc/grpc/0001-fix-CVE-2023-32732.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From d39489045b5aa73e27713e3cbacb8832c1140ec8 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Wed, 9 Aug 2023 13:33:45 +0800
-Subject: [PATCH] fix CVE-2023-32732
-
-CVE: CVE-2023-32732
-
-Upstream-Status: Backport [https://github.com/grpc/grpc/pull/32309/commits/6a7850ef4f042ac26559854266dddc79bfbc75b2]
-The original patch is adjusted to fit the current 1.50.1 version.
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- .../ext/transport/chttp2/transport/hpack_parser.cc     | 10 +++++++---
- src/core/ext/transport/chttp2/transport/internal.h     |  2 --
- src/core/ext/transport/chttp2/transport/parsing.cc     |  6 ++----
- 3 files changed, 9 insertions(+), 9 deletions(-)
-
-diff --git a/src/core/ext/transport/chttp2/transport/hpack_parser.cc b/src/core/ext/transport/chttp2/transport/hpack_parser.cc
-index f2e49022dc3..cd459d15238 100644
---- a/src/core/ext/transport/chttp2/transport/hpack_parser.cc
-+++ b/src/core/ext/transport/chttp2/transport/hpack_parser.cc
-@@ -1211,12 +1211,16 @@ class HPackParser::Parser {
-             "). GRPC_ARG_MAX_METADATA_SIZE can be set to increase this limit.",
-             *frame_length_, metadata_size_limit_);
-     if (metadata_buffer_ != nullptr) metadata_buffer_->Clear();
-+    // StreamId is used as a signal to skip this stream but keep the connection
-+    // alive
-     return input_->MaybeSetErrorAndReturn(
-         [] {
-           return grpc_error_set_int(
--              GRPC_ERROR_CREATE_FROM_STATIC_STRING(
--                  "received initial metadata size exceeds limit"),
--              GRPC_ERROR_INT_GRPC_STATUS, GRPC_STATUS_RESOURCE_EXHAUSTED);
-+	      grpc_error_set_int(
-+                  GRPC_ERROR_CREATE_FROM_STATIC_STRING(
-+                      "received initial metadata size exceeds limit"),
-+                  GRPC_ERROR_INT_GRPC_STATUS, GRPC_STATUS_RESOURCE_EXHAUSTED),
-+	      GRPC_ERROR_INT_STREAM_ID, 0);
-         },
-         false);
-   }
-diff --git a/src/core/ext/transport/chttp2/transport/internal.h b/src/core/ext/transport/chttp2/transport/internal.h
-index 4a2f4261d83..f8b544d9583 100644
---- a/src/core/ext/transport/chttp2/transport/internal.h
-+++ b/src/core/ext/transport/chttp2/transport/internal.h
-@@ -542,8 +542,6 @@ struct grpc_chttp2_stream {
- 
-   grpc_core::Timestamp deadline = grpc_core::Timestamp::InfFuture();
- 
--  /** saw some stream level error */
--  grpc_error_handle forced_close_error = GRPC_ERROR_NONE;
-   /** how many header frames have we received? */
-   uint8_t header_frames_received = 0;
-   /** number of bytes received - reset at end of parse thread execution */
-diff --git a/src/core/ext/transport/chttp2/transport/parsing.cc b/src/core/ext/transport/chttp2/transport/parsing.cc
-index 980f13543f6..afe6da190b6 100644
---- a/src/core/ext/transport/chttp2/transport/parsing.cc
-+++ b/src/core/ext/transport/chttp2/transport/parsing.cc
-@@ -22,6 +22,7 @@
- #include <string.h>
- 
- #include <string>
-+#include <utility>
- 
- #include "absl/base/attributes.h"
- #include "absl/status/status.h"
-@@ -719,10 +720,7 @@ static grpc_error_handle parse_frame_slice(grpc_chttp2_transport* t,
-     }
-     grpc_chttp2_parsing_become_skip_parser(t);
-     if (s) {
--      s->forced_close_error = err;
--      grpc_chttp2_add_rst_stream_to_next_write(t, t->incoming_stream_id,
--                                               GRPC_HTTP2_PROTOCOL_ERROR,
--                                               &s->stats.outgoing);
-+      grpc_chttp2_cancel_stream(t, s, std::exchange(err, absl::OkStatus()));
-     } else {
-       GRPC_ERROR_UNREF(err);
-     }
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.50.1.bb b/meta-oe/recipes-devtools/grpc/grpc_1.56.2.bb
similarity index 90%
rename from meta-oe/recipes-devtools/grpc/grpc_1.50.1.bb
rename to meta-oe/recipes-devtools/grpc/grpc_1.56.2.bb
index 45bfcb857..c4dd6b985 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.50.1.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.56.2.bb
@@ -20,13 +20,10 @@ RDEPENDS:${PN}-dev:append:class-native = " ${PN}-compiler"
 # RDEPENDS:${PN}-dev += "${PN}-compiler"
 
 S = "${WORKDIR}/git"
-SRCREV_grpc = "90ccf24d22b6fc909a1021ebd89fd8c838467d26"
-BRANCH = "v1.50.x"
+SRCREV_grpc = "c0d1c393d9365664d47df41746e992ae97b651ef"
+BRANCH = "v1.56.x"
 SRC_URI = "gitsm://github.com/grpc/grpc.git;protocol=https;name=grpc;branch=${BRANCH} \
-           file://0001-Revert-Changed-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch \
-           file://0001-cmake-add-separate-export-for-plugin-targets.patch \
            file://0001-cmake-Link-with-libatomic-on-rv32-rv64.patch \
-           file://0001-fix-CVE-2023-32732.patch \
            "
 # Fixes build with older compilers 4.8 especially on ubuntu 14.04
 CXXFLAGS:append:class-native = " -Wl,--no-as-needed"
-- 
2.34.1


