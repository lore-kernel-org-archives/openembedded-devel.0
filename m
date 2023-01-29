Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6673BC636D4
	for <webhook@archiver.kernel.org>; Sun, 29 Jan 2023 21:00:53 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web11.25725.1675026045420040873
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Jan 2023 13:00:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ti1saiH1;
 spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id s66so8559650oib.7
        for <openembedded-devel@lists.openembedded.org>; Sun, 29 Jan 2023 13:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/IS1L1TDiaRcUFhO137xqFetTsfoi16pvNbkv/FwOL0=;
        b=Ti1saiH1XpLQ+zeVXjjP/k2bOYbPZPDIVx+hU9nFbzi5iaXCS0tTbnjJjVywKpjJj6
         3o0cU/KoykhhXXU50dfho6wJViu3tCvRTuhrY8fW3YsPfq4N+f0n8FR0NOvQ7xxQjm2S
         lsTBUySHbYSAly3IX6tRVYaBjJheLsLJpxp66xzr4K8cvZzyJkRBJNP66K4xC/911VA6
         XlBcw8CLkRZHpbFfnLTybD1lEUMl3OxdansZmzkdh3I/VMLaQJLahU9YTJLw2huQFgPE
         HFy76/JX/Z7DSoqqSWKodFMzFCbQ2AoNZ6Hj7tzOCBjOnfc1kcvV332nZQWIGzgyO+HE
         A4Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/IS1L1TDiaRcUFhO137xqFetTsfoi16pvNbkv/FwOL0=;
        b=280ubh86u7aobQrRLa8Sw/MFrEiCCRfUATNm0ns/lRoimIVmqb2cM8kxL/NDzNgN+6
         F9sNGZr6P2mieUnBHA31BHI2bP9sp/RMUXcHWSFSk2MCFR+eOW/XqVhX22++lQHNnLJ2
         N8vuZ+Jv5MANBnFw/P/zuG0bwjUEhF97KEGRMMWYuhz8dQb3Lw8EZqstPcgOOxhZUKUT
         lPKAKFRyQaAsBd1sZAO1qF2oXcJHCIU2rfW/sDencnaaSAVbU/MRAtmjlYHD/ZNl03FE
         U5+GofHDwx6Ox2U+RdoPowDgxV5pwTimEyWDKH9V8H/H/FdOHqHHPq156z+9JM79lIrk
         2fTg==
X-Gm-Message-State: AO0yUKW1FpllOEEY3ExgpmaxIZUfbXZa4DMQLvrEt0ABE52LcVBXb6pt
	0oFdxsnqcltVyMMWrBKVs8/0DFjV9xI=
X-Google-Smtp-Source: AK7set9RggW9TIPZP7V71Wc/kalSxUpyIB7yGYgcPm5f2SRNWFHcyeNmHl521KXBULZBdRJO15+x0w==
X-Received: by 2002:a05:6808:1148:b0:35e:2b7f:daa6 with SMTP id u8-20020a056808114800b0035e2b7fdaa6mr3510840oiu.28.1675026047439;
        Sun, 29 Jan 2023 13:00:47 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:9bdc:8bb4:6dc0:aa04])
        by smtp.gmail.com with ESMTPSA id m17-20020a0568080f1100b0035028730c90sm4024065oiw.1.2023.01.29.13.00.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jan 2023 13:00:47 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 07/10] redis: 7.0.5 -> 7.0.7
Date: Sun, 29 Jan 2023 16:00:35 -0500
Message-Id: <24870201060b2505dbb51983ff20d9ce743bb25d.1675025970.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675025970.git.akuster808@gmail.com>
References: <cover.1675025970.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 29 Jan 2023 21:00:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100841

From: Changqing Li <changqing.li@windriver.com>

This upgrade include fix for CVE-2022-3647

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d869383b0f9848a07ab3d7fbb5b7f687dce7744a)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...006-Define-correct-gregs-for-RISCV32.patch | 20 ++++++++++---------
 .../redis/{redis_7.0.5.bb => redis_7.0.7.bb}  |  2 +-
 2 files changed, 12 insertions(+), 10 deletions(-)
 rename meta-oe/recipes-extended/redis/{redis_7.0.5.bb => redis_7.0.7.bb} (96%)

diff --git a/meta-oe/recipes-extended/redis/redis-7/0006-Define-correct-gregs-for-RISCV32.patch b/meta-oe/recipes-extended/redis/redis-7/0006-Define-correct-gregs-for-RISCV32.patch
index 01f8421811..385b0aeed0 100644
--- a/meta-oe/recipes-extended/redis/redis-7/0006-Define-correct-gregs-for-RISCV32.patch
+++ b/meta-oe/recipes-extended/redis/redis-7/0006-Define-correct-gregs-for-RISCV32.patch
@@ -1,4 +1,4 @@
-From f26a978c638bcbc621669dce0ab89e43af42af98 Mon Sep 17 00:00:00 2001
+From b6b2c652abfa98093401b232baca8719c50cadf4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 26 Oct 2020 21:32:22 -0700
 Subject: [PATCH] Define correct gregs for RISCV32
@@ -6,18 +6,17 @@ Subject: [PATCH] Define correct gregs for RISCV32
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-Updated patch for 6.2.1
-Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
-
+Updated patch for 6.2.8
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
  src/debug.c | 26 ++++++++++++++++++++++++--
  1 file changed, 24 insertions(+), 2 deletions(-)
 
 diff --git a/src/debug.c b/src/debug.c
-index 2da2c5d..1d778fa 100644
+index ebda858..90bc450 100644
 --- a/src/debug.c
 +++ b/src/debug.c
-@@ -1116,7 +1116,9 @@ static void *getMcontextEip(ucontext_t *uc) {
+@@ -1168,7 +1168,9 @@ static void* getAndSetMcontextEip(ucontext_t *uc, void *eip) {
      #endif
  #elif defined(__linux__)
      /* Linux */
@@ -25,10 +24,10 @@ index 2da2c5d..1d778fa 100644
 +    #if defined(__riscv) && __riscv_xlen == 32
 +    return (void*) uc->uc_mcontext.__gregs[REG_PC];
 +    #elif defined(__i386__) || ((defined(__X86_64__) || defined(__x86_64__)) && defined(__ILP32__))
-     return (void*) uc->uc_mcontext.gregs[14]; /* Linux 32 */
+     GET_SET_RETURN(uc->uc_mcontext.gregs[14], eip);
      #elif defined(__X86_64__) || defined(__x86_64__)
-     return (void*) uc->uc_mcontext.gregs[16]; /* Linux 64 */
-@@ -1298,8 +1300,28 @@ void logRegisters(ucontext_t *uc) {
+     GET_SET_RETURN(uc->uc_mcontext.gregs[16], eip);
+@@ -1350,8 +1352,28 @@ void logRegisters(ucontext_t *uc) {
      #endif
  /* Linux */
  #elif defined(__linux__)
@@ -58,3 +57,6 @@ index 2da2c5d..1d778fa 100644
      serverLog(LL_WARNING,
      "\n"
      "EAX:%08lx EBX:%08lx ECX:%08lx EDX:%08lx\n"
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-extended/redis/redis_7.0.5.bb b/meta-oe/recipes-extended/redis/redis_7.0.7.bb
similarity index 96%
rename from meta-oe/recipes-extended/redis/redis_7.0.5.bb
rename to meta-oe/recipes-extended/redis/redis_7.0.7.bb
index 921f3282f9..83e617c716 100644
--- a/meta-oe/recipes-extended/redis/redis_7.0.5.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.0.7.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            "
-SRC_URI[sha256sum] = "67054cc37b58c125df93bd78000261ec0ef4436a26b40f38262c780e56315cc3"
+SRC_URI[sha256sum] = "8d327d7e887d1bb308fc37aaf717a0bf79f58129e3739069aaeeae88955ac586"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.25.1


