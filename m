Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E682EEB57C
	for <webhook@archiver.kernel.org>; Sat,  9 Sep 2023 09:35:36 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.13865.1694252128965666266
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 Sep 2023 02:35:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=C99A4tGV;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: peron.clem@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-500b66f8b27so4849629e87.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 09 Sep 2023 02:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694252126; x=1694856926; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gkv9uYqqRXuLgzSVdKXWadVzG+mXH3w7YITLIbmyoNo=;
        b=C99A4tGVs8zwNE73g9NXP++M3GjTLdNtmaUKqV5wIqwWUPy2yNwCGBHmLYLHkR2U2O
         2EL9Im53MMIc7SKXh1KNJPMBb0L8VxMke7eE0skDsrsqnuHNNlNpmxu6vOM7h+n03UQz
         4Sib942IaFH1JOlZ97z0F06wkIPTezat7B1Pa1UQpVGsa9Gkh9IIqxftDxpdcL7YTNn/
         Zs28HZkQwggQ8pjtYyT7KVcm6jW/3kZiJmyb61hRDwsFQNwRCy6N6Phd7NKi9kwoEgkU
         l7olylvsB9UhCwV6iHaSzDX6jqHOFHgykLIms3WyfQnufLNS2pkmZ4rTyJBIJBKsZfjc
         5cuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694252126; x=1694856926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gkv9uYqqRXuLgzSVdKXWadVzG+mXH3w7YITLIbmyoNo=;
        b=AO5oSyOrEI/8hpGfMNhW65Fs3YIneljyKWK5MrpLA1wZ7fcUm46lJkqJyEPLtqHEVG
         adTADD1PPPnMhTxn6JzZCAYqjrrWLVagwVWXnKYABSR3M//xil8IJaxh8ivPB+Eep9XE
         g2gBELhaJ/hCJuEfVsRlB1p4Pd/OvrYSjqccuUsKNQhZXfvgIkcmCTLHZa5PvNODK9ji
         5gfPr1mvuv74ZJ+XPb/cQybtzwE5BkzHpwGFis3KobUJQ98q+9gucUclLtfs0cvjHV0Z
         dPq3zgxXXAWDHabmE+rC+8DBmCH/kSQV+LY/hOaWaC5tVQzTC+g7lbwCJnKPXjggS2mC
         Ee4Q==
X-Gm-Message-State: AOJu0YxbxCsq9ruFaOgFcegF9mHUpVEQHGytsplduV4SmVib6kQBRAoY
	ORVZOzCAe6Tt8Oe7b+Xo1KxDlO3P50c=
X-Google-Smtp-Source: AGHT+IHtEz0aXOofrk2Yl4f/+6ETnlSaBhBiQ5eqG3lI7xn/uD8GPIW9yXkNPZOA8hU2HYWtxLKtPQ==
X-Received: by 2002:a19:430f:0:b0:500:8512:c7de with SMTP id q15-20020a19430f000000b005008512c7demr2840315lfa.28.1694252125957;
        Sat, 09 Sep 2023 02:35:25 -0700 (PDT)
Received: from firmware-builder.outsight.local (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
        by smtp.gmail.com with ESMTPSA id w3-20020a05600c014300b003fefe70ec9csm7302565wmm.10.2023.09.09.02.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Sep 2023 02:35:24 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH 4/4] devtools: grpc: bump to 1.56.2
Date: Sat,  9 Sep 2023 11:35:17 +0200
Message-Id: <20230909093517.444924-5-peron.clem@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230909093517.444924-1-peron.clem@gmail.com>
References: <20230909093517.444924-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 09 Sep 2023 09:35:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104813

Remove merged patch that export plugin to a separate targets

Remove no more applicatable patch

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 ...RPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch | 62 -------------
 ...d-separate-export-for-plugin-targets.patch | 93 -------------------
 .../grpc/{grpc_1.50.1.bb => grpc_1.56.2.bb}   |  6 +-
 3 files changed, 2 insertions(+), 159 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/grpc/grpc/0001-Revert-Changed-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch
 delete mode 100644 meta-oe/recipes-devtools/grpc/grpc/0001-cmake-add-separate-export-for-plugin-targets.patch
 rename meta-oe/recipes-devtools/grpc/{grpc_1.50.1.bb => grpc_1.56.2.bb} (92%)

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
diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.50.1.bb b/meta-oe/recipes-devtools/grpc/grpc_1.56.2.bb
similarity index 92%
rename from meta-oe/recipes-devtools/grpc/grpc_1.50.1.bb
rename to meta-oe/recipes-devtools/grpc/grpc_1.56.2.bb
index 45bfcb857..ac54d704a 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.50.1.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.56.2.bb
@@ -20,11 +20,9 @@ RDEPENDS:${PN}-dev:append:class-native = " ${PN}-compiler"
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
            file://0001-fix-CVE-2023-32732.patch \
            "
-- 
2.34.1


