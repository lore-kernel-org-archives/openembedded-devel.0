Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8B17C27C76
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 13:32:16 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web11.44964.1674653488006792407
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 05:32:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gPDD/off;
 spf=pass (domain: gmail.com, ip: 209.85.161.41, mailfrom: akuster808@gmail.com)
Received: by mail-oo1-f41.google.com with SMTP id r1-20020a4a3701000000b004f2b4f8200eso3141814oor.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 05:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3MxQJdBaMGxoJiXPUFc5thKtkVqYLQcqpIv8cqzIwbs=;
        b=gPDD/offl84ScOSGQWJJFAzHfSpbjL+GoQTFJmFrvU/EeDIgdxhqKWwvleC1uEVB5b
         fpsoyJBzAMaM6x00rhSf4Yg/6i5hu0wYSFZ3L7KKFKKyV9Qfm2EOxbZAO2hkAj+M1NWn
         J2zbGFuYwUmoU9qRPq8xQT0gBkjMHUxyoX18yJeBZm07I6zsMxgu8DWwFU6zaqkg2bYN
         7+1z64DeVRxQfNvg0dFS1jDajN3uPrIPDmrb2xGXbvGJ4czVOEb1D5egyNqQHI7a7p9l
         wErbmtO1uXt4lYj9Omv/aO/GKbXfv8qH0r4GxzAckYIbOhoS8tFvREdYbiyJ2pHK0w3i
         0PnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3MxQJdBaMGxoJiXPUFc5thKtkVqYLQcqpIv8cqzIwbs=;
        b=7JoiSUxk9jmqwxevLR0gu8C3iqLpm9CE0+k1cnIWC0Wn/gcu9TPzWFlLMH1g85dx+E
         C6U0O44WZ2s2DeC3bgzY1gCUA3QiNRu09sP5QBvr2vC0XrW8WXNnbpp0p3/GohoRUo85
         1VsAKl47VTAK2opYhjCiyPJ9JcCZg9iKMLMe5DJzq3xgn4sWYjtVIbJFR/bMHDARt9df
         KDa9hfiAbC+CngpHfTXR+gUiotujW1ca/m2GKvTR2/6+C3vlSdu43LkaE+VaoNv9YDy5
         vr2QMjVsBwQTgw9OTkiYl2VDVQ1IGqNyHLlGDeWd7NKwvfBoV7uQ66w4KGdnQ5wvJSwB
         DA1g==
X-Gm-Message-State: AFqh2kopJ+/sI5pdpAHYfRZesaVsU2FuaTR71Gu2T0vpfgTBXyaN2eRd
	/wbd1SHLgBn/oxn5LE2s8GhCBNkoc9c=
X-Google-Smtp-Source: AMrXdXsmLgsbeKfWCq5PzbNsb73TJdk2XF6LakQFjpMORV4ZtQDSi0AoVDI4tkI1jtcOWX8EYVFuDA==
X-Received: by 2002:a4a:d38b:0:b0:50d:d797:f186 with SMTP id i11-20020a4ad38b000000b0050dd797f186mr2633076oos.0.1674653526112;
        Wed, 25 Jan 2023 05:32:06 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:434e:23f3:d1f1:25c3])
        by smtp.gmail.com with ESMTPSA id b43-20020a4a98ee000000b0051134f333d3sm914383ooj.16.2023.01.25.05.32.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 05:32:05 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 41/41] perfetto: Do not pass TUNE_CCARGS to native/host compiler
Date: Wed, 25 Jan 2023 08:31:23 -0500
Message-Id: <f8cb46d803190bb02085c8a7d20957a71d32f311.1674653280.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674653280.git.akuster808@gmail.com>
References: <cover.1674653280.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 13:32:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100776

From: Khem Raj <raj.khem@gmail.com>

TUNE_CCARGS are meant to be passed to target compilers only. This fixes
build failures seen on qemux6

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>
(cherry picked from commit 90ea68fc11181a62741e4ca79dfef0fefe48cb41)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/perfetto/perfetto.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-devtools/perfetto/perfetto.bb b/meta-oe/recipes-devtools/perfetto/perfetto.bb
index 86ab18cacf..d1980a0097 100644
--- a/meta-oe/recipes-devtools/perfetto/perfetto.bb
+++ b/meta-oe/recipes-devtools/perfetto/perfetto.bb
@@ -100,12 +100,12 @@ do_configure () {
 
     # If using the clang toolchain: use the clang host-side binaries built by Bitbake
     if [ "${TOOLCHAIN}" = "clang" ]; then
-        BB_CLANGXX="${BUILD_CXX} ${BUILD_LDFLAGS} ${TUNE_CCARGS}"
-        BB_CLANG="${BUILD_CC} ${TUNE_CCARGS}"
+        BB_CLANGXX="${BUILD_CXX} ${BUILD_LDFLAGS}"
+        BB_CLANG="${BUILD_CC}"
         BB_LLVM_OBJCOPY="${RECIPE_SYSROOT_NATIVE}/usr/bin/llvm-objcopy"
         
-        HOST_CLANGXX="${STAGING_DIR_NATIVE}/usr/bin/clang++ -stdlib=libc++ -rtlib=libgcc -unwindlib=libgcc ${TUNE_CCARGS}"
-        HOST_CLANG="${STAGING_DIR_NATIVE}/usr/bin/clang ${TUNE_CCARGS}"
+        HOST_CLANGXX="${STAGING_DIR_NATIVE}/usr/bin/clang++ -stdlib=libc++ -rtlib=libgcc -unwindlib=libgcc"
+        HOST_CLANG="${STAGING_DIR_NATIVE}/usr/bin/clang"
         HOST_LLVM_OBJCOPY="${STAGING_DIR_NATIVE}/usr/bin/llvm-objcopy"
 
         cd gcc_like_host
-- 
2.25.1


