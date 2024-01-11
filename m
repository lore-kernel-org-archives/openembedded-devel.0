Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC173C47077
	for <webhook@archiver.kernel.org>; Thu, 11 Jan 2024 15:20:41 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.13849.1704986437726101061
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jan 2024 07:20:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WyDW7GgX;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-336dcebcdb9so5002726f8f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Jan 2024 07:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704986436; x=1705591236; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GZV6+tuE3DLJ//Ovcfh0dMnqkr2UrE1/k75sxnDBtIU=;
        b=WyDW7GgXj4rQQxwfYA/+ND4tl6ID9Bs5cPiGiB08cq2hH/E5dJ+evTLv5G+ahKIi0Z
         3FO1WpXq21xcCCmAkG7CeD6+jzGpE+mYw/oriXl1wJsuL2BT0ToegqUpRHhYEPnposCN
         Oqg/oqqXvIlVWXWOWk3r7Ej4TARiCah0y0StDBEbX47l0zYb5hA7h0fFz3E93l4m/NhO
         YCgGQ7zohZt0/Dt9T0aspbLimTewBIik+QrWDLGg1De/397RVq2hK/GimpLdeckNmOSJ
         sXFTKKcgfxq3W2VEtlviThpDsdnTEouZaOKuKkjnSy5R7aheHTFEFtyFnrXnB25u8Bfb
         Nzww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704986436; x=1705591236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GZV6+tuE3DLJ//Ovcfh0dMnqkr2UrE1/k75sxnDBtIU=;
        b=RyJ1k1Wrm0bFlM+8VLVYIYJ6UEa6n97Z+iQ1k7oxwqursSLIQTPh4NFUbM4TmH6hJ2
         W8Xt1SuTSgvJU4iVxusbVUnfWu5W7ek/kHEBPGfBaEcxIqrgNKlOrniSxrs/O164D/Kb
         EFSYbNPiON7bnLnHuVwdgJ35k2nRbycYUJeKivZGeBP5rsVNLQc0j0NBUf2gZJ1EubLt
         WaBj/zCKwboUUeX+qw7e3U9nM1LJpGyVXFZ/6PzNt2uVmwzIAHBPwe9qDuVYkcPPQmHP
         G+eARNKozK0NU3NJLPzjRv3u6Mm0OYp4LFACrQODtM1CgjKcJllH1gdwoHS9+BjMSkuq
         9XfA==
X-Gm-Message-State: AOJu0Yzy4bumzALOmENnzTJGqJNSbrz9ejS0fKKihiIJcwzwJrfABlcB
	Wr9tQLXFhPVPAGd9FSQVEGx/AEBswxo=
X-Google-Smtp-Source: AGHT+IGajtCtWvDYGbw6WiBvRuEK+Pop6hwpOhOfGbkIeDcFngaHui4vt3S+LMo7TQdioCpNg0MUZw==
X-Received: by 2002:a5d:6d05:0:b0:336:ef13:3008 with SMTP id e5-20020a5d6d05000000b00336ef133008mr548936wrq.5.1704986435273;
        Thu, 11 Jan 2024 07:20:35 -0800 (PST)
Received: from localhost.localdomain ([176.33.66.82])
        by smtp.gmail.com with ESMTPSA id u14-20020adfa18e000000b003376d4248a9sm1458890wru.71.2024.01.11.07.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 07:20:34 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] grpc: upgrade 1.59.2 -> 1.60.0
Date: Thu, 11 Jan 2024 18:20:27 +0300
Message-Id: <20240111152027.956402-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Jan 2024 15:20:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108225

0001-cmake-Link-with-libatomic-on-rv32-rv64.patch refreshed

Changelog:

Core

    Implemented dualstack IPv4 and IPv6 backend support, as per draft gRFC A61. xDS support currently guarded by GRPC_EXPERIMENTAL_XDS_DUALSTACK_ENDPOINTS env var.
    Dropped Bazel 5 support. (#34813)
    [deps] Upgrade protobuf version to v25.0. (#34513)
    [Security - Revocation] Crl Directory Watcher Implementation. (#34749)
    [server] Cap size of pending request queue with RealRequestMatcher. (#34782)
    [chttp2] Fix outgoing data stats. (#34693)
    [EventEngine] Enable Posix EventEngine Listener on all builds. (#34748)
    [EventEngine] Enable Windows EventEngine Listener on all builds. (#34436)
    [chttp2] Alternative protection for too many streams in the system. (#34697)
    [Proxy] Support for setting proxy for addresses. (#34617)
    [client idleness] client channels go idle after 30 minutes by default. (#34653)
    [chttp2] Add an experiment to separate liveness checks from ping timeouts. (#34647)
    [chttp2] Tarpit invalid requests. (#34641)
    [chttp2] Enforce settings acks. (#34640)
    [chttp2] Limit work per read cycle. (#34639)
    [chttp2] Limit request count before receiving settings ack. (#34638)
    [chttp2] Randomly ping on RST_STREAM. (#34637)

C++

    [xds] C++ XdsServerBuilder Remove src/... header dependency from public header. (#34790)
    [reflection] Add v1 reflection. (#34535)

C#

    [csharp] Grpc.Tools documentation for sharing proto files between projects and nuget packages. (#34521)

Ruby

    [ruby] create debug symbol packages. (#34632)

Python

    [Bug Fix] Change return of grpc.aio.ServicerContext.code() from integer to grpc.StatusCode. (#34292)

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../0001-cmake-Link-with-libatomic-on-rv32-rv64.patch  | 10 +++++-----
 .../grpc/{grpc_1.59.2.bb => grpc_1.60.0.bb}            |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-devtools/grpc/{grpc_1.59.2.bb => grpc_1.60.0.bb} (97%)

diff --git a/meta-oe/recipes-devtools/grpc/grpc/0001-cmake-Link-with-libatomic-on-rv32-rv64.patch b/meta-oe/recipes-devtools/grpc/grpc/0001-cmake-Link-with-libatomic-on-rv32-rv64.patch
index fbdf06d69..594503ae2 100644
--- a/meta-oe/recipes-devtools/grpc/grpc/0001-cmake-Link-with-libatomic-on-rv32-rv64.patch
+++ b/meta-oe/recipes-devtools/grpc/grpc/0001-cmake-Link-with-libatomic-on-rv32-rv64.patch
@@ -1,4 +1,4 @@
-From c321f19ff1cd1251c19d20b17a2d86c4237ce506 Mon Sep 17 00:00:00 2001
+From 54e8dca9b39b8c8a6532576a0286e548f97607fa Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 19 Apr 2022 16:07:19 -0700
 Subject: [PATCH] cmake: Link with libatomic on rv32/rv64
@@ -15,12 +15,12 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 3 insertions(+)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index b272816685..e1fe1102c4 100644
+index 06e6453b5c..476d7f1576 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -303,6 +303,9 @@ if(UNIX AND NOT HAIKU)
-   if(_gRPC_PLATFORM_LINUX OR _gRPC_PLATFORM_POSIX)
-     set(_gRPC_ALLTARGETS_LIBRARIES ${_gRPC_ALLTARGETS_LIBRARIES} rt)
+@@ -306,6 +306,9 @@ if(UNIX AND NOT HAIKU)
+       set(_gRPC_ALLTARGETS_LIBRARIES ${_gRPC_ALLTARGETS_LIBRARIES} rt)
+     endif()
    endif()
 +  if(CMAKE_SYSTEM_PROCESSOR STREQUAL "riscv64" OR CMAKE_SYSTEM_PROCESSOR STREQUAL "riscv32")
 +    set(_gRPC_ALLTARGETS_LIBRARIES ${_gRPC_ALLTARGETS_LIBRARIES} atomic)
diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.59.2.bb b/meta-oe/recipes-devtools/grpc/grpc_1.60.0.bb
similarity index 97%
rename from meta-oe/recipes-devtools/grpc/grpc_1.59.2.bb
rename to meta-oe/recipes-devtools/grpc/grpc_1.60.0.bb
index c30e52263..14fca669d 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.59.2.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.60.0.bb
@@ -20,8 +20,8 @@ RDEPENDS:${PN}-dev:append:class-native = " ${PN}-compiler"
 # RDEPENDS:${PN}-dev += "${PN}-compiler"
 
 S = "${WORKDIR}/git"
-SRCREV_grpc = "883e5f76976b86afee87415dc67bde58d9b295a4"
-BRANCH = "v1.59.x"
+SRCREV_grpc = "0ef13a7555dbaadd4633399242524129eef5e231"
+BRANCH = "v1.60.x"
 SRC_URI = "gitsm://github.com/grpc/grpc.git;protocol=https;name=grpc;branch=${BRANCH} \
            file://0001-cmake-Link-with-libatomic-on-rv32-rv64.patch \
            "
-- 
2.25.1


