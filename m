Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9384C83F17
	for <webhook@archiver.kernel.org>; Fri, 18 Jul 2025 04:15:19 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.13212.1752812110127007330
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Jul 2025 21:15:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iJGHoyEb;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-74b56b1d301so1224706b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 17 Jul 2025 21:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752812109; x=1753416909; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sZJ2Kb6rmkJvF8Dcu0v+EAgnTf6s+8yPv1ea7JcacRQ=;
        b=iJGHoyEb+bPYDYlUt9DBdOxa20w73Y3E6nAzyNB1qwb4swFhSOVEFTC9bZu/FDMGd+
         NOOcz0XuXjqfik4vaWJelIkLTRb8VN/viScybsR7MPJah2NbjvQqx+YLIToTpgSIayc7
         LMatjlXT9rppkwad5uM1LPFIIU9qMy/r2y2NrFexd/s27WaSn/V52GK+BVkdrlsbGrLV
         W5WNo9zXrg0Cef37TJawzzqlUDb4kj4BlsHsM1LmJRQmtjvAQBTpAy6NZjv2AarAUDEL
         8I3OAz+dvhrr8AORuQwCQkVJz9h3R1NlrhgkzdEgA6bLCQPnnnBsBmHS9LbhP5eDa/Hu
         fV1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752812109; x=1753416909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sZJ2Kb6rmkJvF8Dcu0v+EAgnTf6s+8yPv1ea7JcacRQ=;
        b=AsIjQnQj5TYyFTIDdffUcGOqV3fKKk/RxI6M5dJJ16dIQSj8RdZ73ZKCcW84EvB3eO
         pN9WBvu1sJUGG8UpPrmXS3nkt/ekX2ndsgDXpSoR5r0fNqD6j6eYItGH7OqLcrZ9tRim
         V7XM0HwtbEYBBW60nd+tWsVVbUlAMDtNZYy84Hn6BR30aial9MU6S9/2BnqrUrAgHJs8
         vsbgxfSUhfAwDGHBTcvh26sbv/5H4QByJHCDjBZPo9gmiAEIkYXPcxo5Xl1aODA+xEHT
         TSRd8P17VdK/g0Z0z+GmtN21ADf8LZVrRVmfSGoNsdn9+EdO8WXH1nRJ52aMo78PpZfK
         GOCA==
X-Gm-Message-State: AOJu0Yz+LZ0+d4OxUGbYx30EkIvSgS7SbgG2L9roX7XnMgBbBsHIJ5Ui
	x2G0DGCAlAM+ATKKnHlBNYi4J1Qodv62TMrFmuxQsahbsit5p4J90UkL4iW+ebyYQh4=
X-Gm-Gg: ASbGncusZfVfVkfObRrKEaamcQyBG7YQC1ylSm0WGsG8YGUYpnj8tniEiNxYYpb788F
	G2VXPRYJiY4K/vLE8Ehq65Z1E7vpyBTYAfSFBOysYqOo6yLxZ+vkchMbIIjfHlFDy7LAOPrdm0O
	6qJYHc0cVqn4i5AoyUh2ViAVHGckoTt89IQ1lweTsQ8L7X/Ulr9+R39OoH4+cqBB6QAnJr/FroZ
	NyLy3HVECBazLnUPw6VKje1lTCdBzpb06x+wvaBLBrvTOkEptZC18CF+33LV1MXdIqrf8A72MPU
	o3KbfBrQYGqwaZqdmG8QF5D2EirArvK/GL7mUnyezrLEskFt4D2xQzVX1iG0HFWu/69ZIkwKcfq
	xhn/R+T2sdbTYzw==
X-Google-Smtp-Source: AGHT+IFTktERBKH2vO9YY+MtQGdNw9EjPudY+FmBef6hGH08L6XC6hxd8GCF3O2kP0tcYhvFX7au8Q==
X-Received: by 2002:a05:6a00:2306:b0:74b:4dcc:a150 with SMTP id d2e1a72fcca58-75722b73091mr12587851b3a.6.1752812109072;
        Thu, 17 Jul 2025 21:15:09 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::519c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cb152227sm345593b3a.79.2025.07.17.21.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 21:15:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v2] nss: Fix build when using clang toolchain
Date: Thu, 17 Jul 2025 21:15:06 -0700
Message-ID: <20250718041506.3809637-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Jul 2025 04:15:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118621

When using clang cross compiler, nss make system adds
some clang specific options e.g. Qunused-options to CFLAGS
which is fine for cross/target compile but some portions e.g.
nsinstall is build natively so it uses NATIVE_CC to compile this
utility, its is set to BUILD_CC rightly but when using clang for CC
and gcc for BUILD_CC, nss build system is confused because its
trying to use the computed set of warnings for both native and cross
compile and they may not match between clang and gcc. So here we
explicitly use clang for NATIVE_CC when TOOLCHAIN is clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Pass options to use libgcc for C runtime for native builds

 meta-oe/recipes-support/nss/nss_3.112.bb | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/nss/nss_3.112.bb b/meta-oe/recipes-support/nss/nss_3.112.bb
index cf0b20d48b..cb35539b04 100644
--- a/meta-oe/recipes-support/nss/nss_3.112.bb
+++ b/meta-oe/recipes-support/nss/nss_3.112.bb
@@ -73,11 +73,15 @@ do_compile:prepend:class-native() {
     RPATH="-Wl,-rpath-link,${STAGING_LIBDIR_NATIVE} -Wl,-rpath-link,${STAGING_BASE_LIBDIR_NATIVE} -Wl,-rpath,${STAGING_LIBDIR_NATIVE} -Wl,-rpath,${STAGING_BASE_LIBDIR_NATIVE}"
 }
 
+NATIVE_CC:class-target:toolchain-clang = "clang --rtlib=libgcc --unwindlib=libgcc"
+NATIVE_CC:class-nativesdk:toolchain-clang = "clang --rtlib=libgcc --unwindlib=libgcc"
+NATIVE_CC ?= "${BUILD_CC}"
+
 do_compile() {
     export NSPR_INCLUDE_DIR=${STAGING_INCDIR}/nspr
 
     export CROSS_COMPILE=1
-    export NATIVE_CC="${BUILD_CC}"
+    export NATIVE_CC="${NATIVE_CC}"
     # Additional defines needed on Centos 7
     export NATIVE_FLAGS="${BUILD_CFLAGS} -DLINUX -Dlinux"
     export BUILD_OPT=1
@@ -91,7 +95,6 @@ do_compile() {
 
     export LIBDIR=${libdir}
     export MOZILLA_CLIENT=1
-    export NS_USE_GCC=1
     export NSS_USE_SYSTEM_SQLITE=1
     export NSS_ENABLE_ECC=1
     export NSS_ENABLE_WERROR=0
@@ -144,14 +147,13 @@ do_install:prepend:class-nativesdk() {
 
 do_install() {
     export CROSS_COMPILE=1
-    export NATIVE_CC="${BUILD_CC}"
+    export NATIVE_CC="${NATIVE_CC}"
     export BUILD_OPT=1
 
     export FREEBL_NO_DEPEND=1
 
     export LIBDIR=${libdir}
     export MOZILLA_CLIENT=1
-    export NS_USE_GCC=1
     export NSS_USE_SYSTEM_SQLITE=1
     export NSS_ENABLE_ECC=1
 

