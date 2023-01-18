Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CFFBC38147
	for <webhook@archiver.kernel.org>; Wed, 18 Jan 2023 03:30:11 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web11.7404.1674012594208151969
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Jan 2023 19:30:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=TAZ/iKzZ;
 spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674012602; x=1705548602;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=lptSpZllybLvKRZnd1zZsmE5AnVI+WuHDpzJ9gy9csM=;
  b=TAZ/iKzZg0oM0sSawBfJY3QyCATq5S23WGBeF8WjoDa7rSH9ulU4IVfj
   ACdqVbsKDLEyQ/x3bA5gj0LYHR7mJLunaCx7JzCw1rubACM6Znrkm18Ge
   D47+bOzCnHdhaELpyC/608ck781LMdFdtAYeeweIn/OKX+yTxw/R0HexF
   +HFz6oSriyvIaIJxFCelsBvy3LRwv9UqoIgT50OOaQJwQuJ9Cx62h7iQa
   cURRjRw7TH9Wy6AHIvbyOFdN2d4D7kU3mUzXLFvINLR2REvK7oVqfuk98
   Y5m+kMs4yIT7Tag1kUAEkxIg7bymJtiADZQKsfnQ1oRit0X308XXwzi1m
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="312764830"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; 
   d="scan'208";a="312764830"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2023 19:29:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="833397267"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; 
   d="scan'208";a="833397267"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga005.jf.intel.com with ESMTP; 17 Jan 2023 19:29:42 -0800
From: chee.yang.lee@intel.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][langdale][PATCH 2/5] redis: 7.0.5 -> 7.0.7
Date: Wed, 18 Jan 2023 11:29:31 +0800
Message-Id: <20230118032934.1556599-2-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230118032934.1556599-1-chee.yang.lee@intel.com>
References: <20230118032934.1556599-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Jan 2023 03:30:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100646

From: Changqing Li <changqing.li@windriver.com>

This upgrade include fix for CVE-2022-3647

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
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
2.37.3


