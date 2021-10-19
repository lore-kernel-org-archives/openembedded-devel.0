Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B62F8C433FE
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:18:48 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web08.11253.1634656727182481879
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:18:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MYR8BUs5;
 spf=pass (domain: gmail.com, ip: 209.85.128.50,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id
 n40-20020a05600c3ba800b0030da2439b21so3268514wms.0
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9owTXw4N0O2I2aBmYdp0GEuMxVb9kgGTLORGxC9NQmk=;
        b=MYR8BUs5GgDsW1l6VMa+oRgWI4gAL/Gt2k2FqfwUoroCSw5IABR0wOlvgK0UjoTgv3
         JrBPzicOQA4ybXHTlV1Q5M9iLrHcDDunEvgrz+EHZlONfsBCqki9NiTNF9NWPxgvaRLK
         ffIZabH0EnpcYxiZa7a9kLZnd94cnuXnPgk5VxdmhWkEZO86ta5xQGTypjbPuaXF86uZ
         GrPCWK35l19MV9O6QmDtqUFIr0dgErHmvhnGYnyMyDhuVxIaxB65GKg9zT6bLcYuiLUC
         to8kdYyYwxqUrvZkx7pH1oFxx6ZtatL9SPJJpv5ojZmvLwc4cwPcRsngcsSbtI+KYtjc
         k2IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9owTXw4N0O2I2aBmYdp0GEuMxVb9kgGTLORGxC9NQmk=;
        b=forJkXc6YyMAveghhfXMXCjFy7eRh0AuYjKDY7OF/7ULRhHN7wX4y1ma8W9MJ7H7CK
         sRA0ulJ4vjcZ1v79Nma8yWUyDdd2yF4Ifvp2UhzTw7wVPIFElCGCYeif2cdvOsnBLe+W
         oCOvDdp5gY16X42Ii1p3aktyMfYriAz6wB/re3DdHbZXsHvfK18GG8ENcT1AboMfseZc
         SRrGSKcP9C2lrIiZEjgHREqJuoawLEgTC1PcQTn7UW3kU5+/atYAzKMRGePTs9dnW4Ob
         RIB+0ezYP7aL/uUahtd4V4iabddqmQJoz0rQ7EyFSXRvYmawnPbA+XAdVhvARGLjHbc1
         MzjA==
X-Gm-Message-State: AOAM532dT8WEdAoYZ/205pa16RhgjhiTiXNoDHo3FEB3brvld/GQrbze
	Tzvjieoj4yAgN5tpys4/mfl+A58JDmk=
X-Google-Smtp-Source: 
 ABdhPJxX9gcG8cIbh1dFkLfgltmJEdR/rPrHC6/Vxguky6mpnQRcr8cSpeU2ZCxAiK/5uUi/DlkizQ==
X-Received: by 2002:a1c:3586:: with SMTP id c128mr6843842wma.78.1634656725791;
        Tue, 19 Oct 2021 08:18:45 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 r17sm2653374wmq.47.2021.10.19.08.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:18:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/2] grpc: revert GRPCPP_ABSEIL_SYNC change from
 1.40.0 to fix undefined references to absl::lts_20210324::Mutex::~Mutex()
Date: Tue, 19 Oct 2021 17:18:41 +0200
Message-Id: <20211019151841.306791-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211019151841.306791-1-Martin.Jansa@gmail.com>
References: <20211019151841.306791-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Oct 2021 15:18:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93470

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...RPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch | 60 +++++++++++++++++++
 meta-oe/recipes-devtools/grpc/grpc_1.41.0.bb  |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/grpc/grpc/0001-Revert-Changed-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch

diff --git a/meta-oe/recipes-devtools/grpc/grpc/0001-Revert-Changed-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch b/meta-oe/recipes-devtools/grpc/grpc/0001-Revert-Changed-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch
new file mode 100644
index 0000000000..2f1483f97c
--- /dev/null
+++ b/meta-oe/recipes-devtools/grpc/grpc/0001-Revert-Changed-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch
@@ -0,0 +1,60 @@
+From dc593958e556dd496b774f35c5992285510d6859 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Tue, 19 Oct 2021 17:09:55 +0200
+Subject: [PATCH] Revert "Changed GRPCPP_ABSEIL_SYNC to GPR_ABSEIL_SYNC
+ (#25681)"
+
+This reverts commit 931f91b745cd5b2864a0d1787815871d0bd844ae.
+
+Fixes sysdig from meta-oe and other recipes (like com.webos.service.tts
+libgoogleassistant from meta-webosose) failing with:
+
+| FAILED: userspace/sysdig/sysdig
+| : && /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/x86_64-oe-linux-g++ -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-sec
+urity  --sysroot=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0=/usr/src/debug/sysdig/0.27.1-r0                      -f
+debug-prefix-map=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0=/usr/src/debug/sysdig/0.27.1-r0                      -fdebug-prefix-map=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/OE/bu
+ild/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/OE/build
+/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot -Wall -ggdb   -std=c++0x -O3 -fno-strict-aliasing -DNDEBUG  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
+--sysroot=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0=/usr/src/debug/sysdig/0.27.1-r0                      -fdebug-p
+refix-map=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0=/usr/src/debug/sysdig/0.27.1-r0                      -fdebug-prefix-map=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/OE/build/oe-
+core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/OE/build/oe-cor
+e/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fmacro-prefix-map=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0=/usr/src/debug/sysdig/0.27.1-r0                      -fdebug-prefix-map=/OE/build/oe-cor
+e/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0=/usr/src/debug/sysdig/0.27.1-r0                      -fdebug-prefix-map=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/OE/build/oe-core/tmp-glibc/work/core2-
+64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot-native=  -Wl,-z,relro,-z,now -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fmacro-prefix-map=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0=/usr/src/debug/sysdig/0.27.1-r0                      -fdebug-prefix-map=/OE/build/
+oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0=/usr/src/debug/sysdig/0.27.1-r0                      -fdebug-prefix-map=/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/OE/build/oe-core/tmp-glibc/work/
+core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot-native=  -Wl,-z,relro,-z,now   -rdynamic userspace/sysdig/CMakeFiles/sysdig.dir/fields_info.cpp.o userspace/sysdig/CMakeFiles/sysdig.dir/sysdig.cpp.o -o userspace/sysdig/sysdig  userspace/libsinsp/libsinsp.a  userspace/libscap/libscap.a
+ -lelf  -lz  -lcurl  -ljsoncpp  -ltbb  -lcares  -lgrpc++_unsecure  -lgrpc_unsecure  -lprotobuf  -lcares  -lgrpc++_unsecure  -lgrpc_unsecure  -lprotobuf  -ljq  -lb64  -lrt  -lanl  -lssl  -lcrypto  -lluajit-5.1  -ldl  -lpthread && :
+| /usr/include/grpcpp/impl/codegen/completion_queue.h:121: error: undefined reference to 'absl::lts_20210324::Mutex::~Mutex()'
+| /usr/include/grpcpp/impl/codegen/completion_queue.h:121: error: undefined reference to 'absl::lts_20210324::Mutex::~Mutex()'
+| /usr/include/grpcpp/impl/codegen/completion_queue.h:121: error: undefined reference to 'absl::lts_20210324::Mutex::~Mutex()'
+| /usr/include/grpcpp/impl/codegen/completion_queue.h:259: error: undefined reference to 'absl::lts_20210324::Mutex::~Mutex()'
+| collect2: error: ld returned 1 exit status
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
+---
+ include/grpcpp/impl/codegen/sync.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/include/grpcpp/impl/codegen/sync.h b/include/grpcpp/impl/codegen/sync.h
+index 4cb8133c7c..3d10d9a3a0 100644
+--- a/include/grpcpp/impl/codegen/sync.h
++++ b/include/grpcpp/impl/codegen/sync.h
+@@ -47,7 +47,7 @@
+ namespace grpc {
+ namespace internal {
+ 
+-#ifdef GPR_ABSEIL_SYNC
++#ifdef GRPCPP_ABSEIL_SYNC
+ 
+ using Mutex = absl::Mutex;
+ using MutexLock = absl::MutexLock;
+@@ -142,7 +142,7 @@ class CondVar {
+   gpr_cv cv_;
+ };
+ 
+-#endif  // GPR_ABSEIL_SYNC
++#endif  // GRPCPP_ABSEIL_SYNC
+ 
+ template <typename Predicate>
+ GRPC_DEPRECATED("incompatible with thread safety analysis")
diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.41.0.bb b/meta-oe/recipes-devtools/grpc/grpc_1.41.0.bb
index 3385e2ada6..f961c533e0 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.41.0.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.41.0.bb
@@ -24,6 +24,7 @@ SRCREV_grpc = "fc662b7964384b701af5bd3ce6994d2180080eb4"
 BRANCH = "v1.41.x"
 SRC_URI = "git://github.com/grpc/grpc.git;protocol=https;name=grpc;branch=${BRANCH} \
            file://0001-cmake-revert-db88fb0ee826e73323e06ac6166ac038ee71f6a.patch \
+           file://0001-Revert-Changed-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch \
            "
 # Fixes build with older compilers 4.8 especially on ubuntu 14.04
 CXXFLAGS:append:class-native = " -Wl,--no-as-needed"
-- 
2.32.0


