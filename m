Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39389C00A5A
	for <webhook@archiver.kernel.org>; Wed, 18 Jan 2023 03:30:11 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web10.7282.1674012602839868771
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Jan 2023 19:30:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=ad9wZnn2;
 spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674012602; x=1705548602;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=JpHAgW6ov1ykouYeGfWHlNQEfvaq058AwfaIwF8VfgM=;
  b=ad9wZnn2ykxwdFiDnU3UmWIcxqmz/Fm+yK2gtXeqstf0CCxSZ7EQQqzn
   RV3n7dhDqRiQcWbT+X0NFDWT7cNf8Kd5OKP7/beaB4jcEiWPkczGCUmCC
   zopinCLJ/TaI5vSadLPi4culPXM6YyEodZVFQfjPtQNYYmHF143u1xYO8
   22tKCbxcPkjtwKsLxg1uaPQEru6tJc6CbaFXf+9WlFORufNsgBBG0q1ze
   s+R1g6rdtXTxeMS+hOUXoJwFRTtJbBVQ8DzZ5H4GzKeWmmP5aLvsayKlp
   4BlsfD0UnIh69ldooAy4FN18Ci0YnKAuZdm4lCAA0LG3RlerU53hBzxAc
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="312764831"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; 
   d="scan'208";a="312764831"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2023 19:29:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="833397270"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; 
   d="scan'208";a="833397270"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga005.jf.intel.com with ESMTP; 17 Jan 2023 19:29:43 -0800
From: chee.yang.lee@intel.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][langdale][PATCH 3/5] redis: 6.2.7 -> 6.2.8
Date: Wed, 18 Jan 2023 11:29:32 +0800
Message-Id: <20230118032934.1556599-3-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230118032934.1556599-1-chee.yang.lee@intel.com>
References: <20230118032934.1556599-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Jan 2023 03:30:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100649

From: Changqing Li <changqing.li@windriver.com>

This upgrade include fix for CVE-2022-3647

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 .../0006-Define-correct-gregs-for-RISCV32.patch   | 15 +++++++++------
 .../redis/{redis_6.2.7.bb => redis_6.2.8.bb}      |  2 +-
 2 files changed, 10 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-extended/redis/{redis_6.2.7.bb => redis_6.2.8.bb} (96%)

diff --git a/meta-oe/recipes-extended/redis/redis/0006-Define-correct-gregs-for-RISCV32.patch b/meta-oe/recipes-extended/redis/redis/0006-Define-correct-gregs-for-RISCV32.patch
index b2d1a32eda..9d7e502717 100644
--- a/meta-oe/recipes-extended/redis/redis/0006-Define-correct-gregs-for-RISCV32.patch
+++ b/meta-oe/recipes-extended/redis/redis/0006-Define-correct-gregs-for-RISCV32.patch
@@ -1,4 +1,4 @@
-From 6134b471c35df826ccb41aab9a47e5c89e15a0c4 Mon Sep 17 00:00:00 2001
+From 26bd72f3b8de22e5036d86e6c79f815853b83473 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 26 Oct 2020 21:32:22 -0700
 Subject: [PATCH] Define correct gregs for RISCV32
@@ -13,10 +13,10 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
  1 file changed, 24 insertions(+), 2 deletions(-)
 
 diff --git a/src/debug.c b/src/debug.c
-index e7fec29..5abb404 100644
+index 5318c14..8c21b47 100644
 --- a/src/debug.c
 +++ b/src/debug.c
-@@ -1039,7 +1039,9 @@ static void *getMcontextEip(ucontext_t *uc) {
+@@ -1055,7 +1055,9 @@ static void* getAndSetMcontextEip(ucontext_t *uc, void *eip) {
      #endif
  #elif defined(__linux__)
      /* Linux */
@@ -24,10 +24,10 @@ index e7fec29..5abb404 100644
 +    #if defined(__riscv) && __riscv_xlen == 32
 +    return (void*) uc->uc_mcontext.__gregs[REG_PC];
 +    #elif defined(__i386__) || ((defined(__X86_64__) || defined(__x86_64__)) && defined(__ILP32__))
-     return (void*) uc->uc_mcontext.gregs[14]; /* Linux 32 */
+     GET_SET_RETURN(uc->uc_mcontext.gregs[14], eip);
      #elif defined(__X86_64__) || defined(__x86_64__)
-     return (void*) uc->uc_mcontext.gregs[16]; /* Linux 64 */
-@@ -1206,8 +1208,28 @@ void logRegisters(ucontext_t *uc) {
+     GET_SET_RETURN(uc->uc_mcontext.gregs[16], eip);
+@@ -1222,8 +1224,28 @@ void logRegisters(ucontext_t *uc) {
      #endif
  /* Linux */
  #elif defined(__linux__)
@@ -57,3 +57,6 @@ index e7fec29..5abb404 100644
      serverLog(LL_WARNING,
      "\n"
      "EAX:%08lx EBX:%08lx ECX:%08lx EDX:%08lx\n"
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-extended/redis/redis_6.2.7.bb b/meta-oe/recipes-extended/redis/redis_6.2.8.bb
similarity index 96%
rename from meta-oe/recipes-extended/redis/redis_6.2.7.bb
rename to meta-oe/recipes-extended/redis/redis_6.2.8.bb
index 7f922a4e0f..02ee19fb7d 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.7.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.8.bb
@@ -17,7 +17,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            "
-SRC_URI[sha256sum] = "b7a79cc3b46d3c6eb52fa37dde34a4a60824079ebdfb3abfbbfa035947c55319"
+SRC_URI[sha256sum] = "f91ab24bcb42673cb853292eb5d43c2017d11d659854808ed6a529c97297fdfe"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.37.3


