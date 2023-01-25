Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABC1FC27C76
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 13:32:06 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.web11.44967.1674653489724429460
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 05:31:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AnuSJZ9Q;
 spf=pass (domain: gmail.com, ip: 209.85.161.43, mailfrom: akuster808@gmail.com)
Received: by mail-oo1-f43.google.com with SMTP id j10-20020a4aa64a000000b004f9b746ee29so3156792oom.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 05:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dtHjm+fvj22IWeq33SMCw53s5uRHNpO2r1wvJsB328Q=;
        b=AnuSJZ9QKFnSnGNQK/RCWtXtPAYl5+0N7Dw3Ec0v6SmEK17LjuOrAcnIXMUiEDkOOn
         f8XNWSAyAezsfkG0tPfUR9flUYdqskN0EtGfBTpMW+WPPNFgyeCgPMB4/QKV4/4rRhCZ
         LqL2P0YznJYh44hipBbkSWsRvrnFCRJ6v813WKKymOaUoC4KmKWRgu76T1Hopu9kk6PF
         zHUaHsYY2h5sBC/NzqmG+jj16VNE/zX4YeratFTkZD8tLWitTSEgj8hVXG9AF9M/Zm8U
         FgWKkkZfIFXx8pcjy3MtQ3OmzGdF4l1QYrkuKwr38JJmkQgGvdCbXmp0uNcn+QihZW5m
         EjwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dtHjm+fvj22IWeq33SMCw53s5uRHNpO2r1wvJsB328Q=;
        b=2eSPUTqSru7cPhyNHW14fn9Z/PrIAT38/tMD1TjCkUzimt1bIXM+6FVTebBmix3u6/
         Fr82SSXlJ8c7/CLke9Ub7d0TqyhneipjUmjQ7iXrtS+5GC+JB2g18vpXKwD5QyktH4JM
         BJIV5Wk/gE8sFBR4nO6dJiKZo5JXYFCaUZu+KIeVz7etIdFzCbIl+CBVG1XZaRyZ2pOE
         6sFUMspPntxjGF1vod3k2rdmS+vV+PNBFRyb5w/gByLLn+5ZCRr/KAV9Ssech/tppoCD
         4dFBg4nkUsCLpafmigrgymEG0xb1QxGMEQNd0r3EPKEQmHB/eN0XLAPxUAb5wfNp4WJL
         D/Tw==
X-Gm-Message-State: AFqh2koMPkn/0fEQZCSvz5coqLQQsrx+gw7sJOggkXNFplNNjs3k2U1J
	csTSj8retv9js5bPfyOxYBUAw35d0WA=
X-Google-Smtp-Source: AMrXdXscAKJjN0mi7hS/hgRtSltKLs2NjymqYqQBsBXs9V2ery2+laZKIX7ebcTKk5ycKroDLrKaxQ==
X-Received: by 2002:a4a:dcce:0:b0:4f2:cf1:c3db with SMTP id h14-20020a4adcce000000b004f20cf1c3dbmr15362609oou.1.1674653516176;
        Wed, 25 Jan 2023 05:31:56 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:434e:23f3:d1f1:25c3])
        by smtp.gmail.com with ESMTPSA id b43-20020a4a98ee000000b0051134f333d3sm914383ooj.16.2023.01.25.05.31.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 05:31:55 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 29/41] redis: 7.0.5 -> 7.0.7
Date: Wed, 25 Jan 2023 08:31:11 -0500
Message-Id: <e32295911edf7be94f8b08214e9a210f2d7cb0b3.1674653280.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674653280.git.akuster808@gmail.com>
References: <cover.1674653280.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 13:32:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100764

From: Changqing Li <changqing.li@windriver.com>

This upgrade include fix for CVE-2022-3647

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
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
index 7ed1519224..58055166cc 100644
--- a/meta-oe/recipes-extended/redis/redis_7.0.5.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.0.7.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE-7.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            "
-SRC_URI[sha256sum] = "67054cc37b58c125df93bd78000261ec0ef4436a26b40f38262c780e56315cc3"
+SRC_URI[sha256sum] = "8d327d7e887d1bb308fc37aaf717a0bf79f58129e3739069aaeeae88955ac586"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.25.1


