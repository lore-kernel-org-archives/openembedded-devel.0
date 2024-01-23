Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D97B5C46CD2
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 01:25:44 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.1125.1705973139187890587
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jan 2024 17:25:39 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="147206632"
X-IronPort-AV: E=Sophos;i="6.05,212,1701097200"; 
   d="scan'208";a="147206632"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 10:25:36 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id E5D33D6187
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:25:33 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3140AD9680
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:25:33 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id B1A2620081328
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:25:32 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4C7341A006A;
	Tue, 23 Jan 2024 09:25:32 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] redis: upgrade 7.2.3 -> 7.2.4
Date: Tue, 23 Jan 2024 09:20:40 +0800
Message-Id: <1705972840-25182-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28136.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28136.003
X-TMASE-Result: 10--7.710400-10.000000
X-TMASE-MatchedRID: FBE0XpCroJijz0nOeth/yR1qGr6sYOf/lKW//2SWQOL4dLz0bZ+n/j4t
	lu4+KTBz0l/F8lyZO8HZ1cdJCCBX400Wf2cLgjHkKsurITpSv+Mqnkb4tCjVzpx8gfCx4YqfybH
	Yg2T9d7Kw6vVepXJtPRdRZEXKlIRjuII/lqBLVHFIK2DGByysyvGx0VGs6vfUoxCLfriDzzhIIM
	qfCNGpDjrgq7GNaFKoivFp0d/OglZtF6/n498MP/LeH1FBnhK0b/A0Dvek73/AuQ0xDMaXkBR9C
	CnoYWqGX9I5ZCQqL1mGOOm8slgiJeVbVfdLscbX72Rb2bEJC+0aBwTAX34rK33gfGZAU8fL0K24
	po7Dw/9lIwXkV+BR7YyCITJXo1PuzA16DrgJTi4wo+sXt0rnsyBr3Ab7SNDagW6bY8SOq3WjxYy
	RBa/qJV/Hpl/zcOjl5MIx11wv+CM7AFczfjr/7E5D3tEH6wmdpQw+II+9N7WUQKwKwtazponN+O
	T8DYSBejt4uq0SFGs=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 01:25:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108396

From: Wang Mingyu <wangmy@fujitsu.com>

0001-src-Do-not-reset-FINAL_LIBS.patch
0006-Define-correct-gregs-for-RISCV32.patch
lua-update-Makefile-to-use-environment-build-setting.patch
refreshed for 7.2.4

Changelog:
============
-(CVE-2023-41056) In some cases, Redis may incorrectly handle resizing of memory
 buffers which can result in incorrect accounting of buffer sizes and lead to
 heap overflow and potential remote code execution.
-Fix crashes of cluster commands clusters with mixed versions of 7.0 and 7.2
-Fix slot ownership not being properly handled when deleting a slot from a node
-Fix atomicity issues with the RedisModuleEvent_Key module API event

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-src-Do-not-reset-FINAL_LIBS.patch           |  6 +++---
 .../0006-Define-correct-gregs-for-RISCV32.patch      | 12 +++++-------
 .../{redis-7.2.3 => redis-7.2.4}/GNU_SOURCE-7.patch  |  0
 .../hiredis-use-default-CC-if-it-is-set.patch        |  0
 .../{redis-7.2.3 => redis-7.2.4}/init-redis-server   |  0
 ...e-Makefile-to-use-environment-build-setting.patch |  8 +++-----
 .../oe-use-libc-malloc.patch                         |  0
 .../redis/{redis-7.2.3 => redis-7.2.4}/redis.conf    |  0
 .../redis/{redis-7.2.3 => redis-7.2.4}/redis.service |  0
 .../redis/{redis_7.2.3.bb => redis_7.2.4.bb}         |  2 +-
 10 files changed, 12 insertions(+), 16 deletions(-)
 rename meta-oe/recipes-extended/redis/{redis-7.2.3 => redis-7.2.4}/0001-src-Do-not-reset-FINAL_LIBS.patch (86%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.3 => redis-7.2.4}/0006-Define-correct-gregs-for-RISCV32.patch (91%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.3 => redis-7.2.4}/GNU_SOURCE-7.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.3 => redis-7.2.4}/hiredis-use-default-CC-if-it-is-set.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.3 => redis-7.2.4}/init-redis-server (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.3 => redis-7.2.4}/lua-update-Makefile-to-use-environment-build-setting.patch (93%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.3 => redis-7.2.4}/oe-use-libc-malloc.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.3 => redis-7.2.4}/redis.conf (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.3 => redis-7.2.4}/redis.service (100%)
 rename meta-oe/recipes-extended/redis/{redis_7.2.3.bb => redis_7.2.4.bb} (96%)

diff --git a/meta-oe/recipes-extended/redis/redis-7.2.3/0001-src-Do-not-reset-FINAL_LIBS.patch b/meta-oe/recipes-extended/redis/redis-7.2.4/0001-src-Do-not-reset-FINAL_LIBS.patch
similarity index 86%
rename from meta-oe/recipes-extended/redis/redis-7.2.3/0001-src-Do-not-reset-FINAL_LIBS.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.4/0001-src-Do-not-reset-FINAL_LIBS.patch
index e8d8b1d53..01e53e3f2 100644
--- a/meta-oe/recipes-extended/redis/redis-7.2.3/0001-src-Do-not-reset-FINAL_LIBS.patch
+++ b/meta-oe/recipes-extended/redis/redis-7.2.4/0001-src-Do-not-reset-FINAL_LIBS.patch
@@ -1,4 +1,4 @@
-From e97a572d4aef099a961e43d528c0268e10d9f1e2 Mon Sep 17 00:00:00 2001
+From d9d1f9a501ef7caa80d1e6595218898e9989ec2b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 10 Sep 2019 20:04:26 -0700
 Subject: [PATCH] src: Do not reset FINAL_LIBS
@@ -16,10 +16,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/Makefile b/src/Makefile
-index ddabd44..5133884 100644
+index 39decee..f5efe82 100644
 --- a/src/Makefile
 +++ b/src/Makefile
-@@ -118,7 +118,7 @@ endif
+@@ -119,7 +119,7 @@ endif
  
  FINAL_CFLAGS=$(STD) $(WARN) $(OPT) $(DEBUG) $(CFLAGS) $(REDIS_CFLAGS)
  FINAL_LDFLAGS=$(LDFLAGS) $(REDIS_LDFLAGS) $(DEBUG)
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.3/0006-Define-correct-gregs-for-RISCV32.patch b/meta-oe/recipes-extended/redis/redis-7.2.4/0006-Define-correct-gregs-for-RISCV32.patch
similarity index 91%
rename from meta-oe/recipes-extended/redis/redis-7.2.3/0006-Define-correct-gregs-for-RISCV32.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.4/0006-Define-correct-gregs-for-RISCV32.patch
index 385b0aeed..93c359526 100644
--- a/meta-oe/recipes-extended/redis/redis-7.2.3/0006-Define-correct-gregs-for-RISCV32.patch
+++ b/meta-oe/recipes-extended/redis/redis-7.2.4/0006-Define-correct-gregs-for-RISCV32.patch
@@ -1,4 +1,4 @@
-From b6b2c652abfa98093401b232baca8719c50cadf4 Mon Sep 17 00:00:00 2001
+From 634f62be6c135ece93cb4e44a69ce3cb66f394ca Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 26 Oct 2020 21:32:22 -0700
 Subject: [PATCH] Define correct gregs for RISCV32
@@ -8,15 +8,16 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 Updated patch for 6.2.8
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
 ---
  src/debug.c | 26 ++++++++++++++++++++++++--
  1 file changed, 24 insertions(+), 2 deletions(-)
 
 diff --git a/src/debug.c b/src/debug.c
-index ebda858..90bc450 100644
+index 684f692..2ee151f 100644
 --- a/src/debug.c
 +++ b/src/debug.c
-@@ -1168,7 +1168,9 @@ static void* getAndSetMcontextEip(ucontext_t *uc, void *eip) {
+@@ -1215,7 +1215,9 @@ static void* getAndSetMcontextEip(ucontext_t *uc, void *eip) {
      #endif
  #elif defined(__linux__)
      /* Linux */
@@ -27,7 +28,7 @@ index ebda858..90bc450 100644
      GET_SET_RETURN(uc->uc_mcontext.gregs[14], eip);
      #elif defined(__X86_64__) || defined(__x86_64__)
      GET_SET_RETURN(uc->uc_mcontext.gregs[16], eip);
-@@ -1350,8 +1352,28 @@ void logRegisters(ucontext_t *uc) {
+@@ -1401,8 +1403,28 @@ void logRegisters(ucontext_t *uc) {
      #endif
  /* Linux */
  #elif defined(__linux__)
@@ -57,6 +58,3 @@ index ebda858..90bc450 100644
      serverLog(LL_WARNING,
      "\n"
      "EAX:%08lx EBX:%08lx ECX:%08lx EDX:%08lx\n"
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.3/GNU_SOURCE-7.patch b/meta-oe/recipes-extended/redis/redis-7.2.4/GNU_SOURCE-7.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.3/GNU_SOURCE-7.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.4/GNU_SOURCE-7.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.3/hiredis-use-default-CC-if-it-is-set.patch b/meta-oe/recipes-extended/redis/redis-7.2.4/hiredis-use-default-CC-if-it-is-set.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.3/hiredis-use-default-CC-if-it-is-set.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.4/hiredis-use-default-CC-if-it-is-set.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.3/init-redis-server b/meta-oe/recipes-extended/redis/redis-7.2.4/init-redis-server
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.3/init-redis-server
rename to meta-oe/recipes-extended/redis/redis-7.2.4/init-redis-server
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.3/lua-update-Makefile-to-use-environment-build-setting.patch b/meta-oe/recipes-extended/redis/redis-7.2.4/lua-update-Makefile-to-use-environment-build-setting.patch
similarity index 93%
rename from meta-oe/recipes-extended/redis/redis-7.2.3/lua-update-Makefile-to-use-environment-build-setting.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.4/lua-update-Makefile-to-use-environment-build-setting.patch
index bff07535d..b562e2522 100644
--- a/meta-oe/recipes-extended/redis/redis-7.2.3/lua-update-Makefile-to-use-environment-build-setting.patch
+++ b/meta-oe/recipes-extended/redis/redis-7.2.4/lua-update-Makefile-to-use-environment-build-setting.patch
@@ -1,4 +1,4 @@
-From 734ab2f7879c6f94fc18ea6a10adb9bd156ba769 Mon Sep 17 00:00:00 2001
+From aa3d31355f3cc140b1dc2f4fcff8e3c0aa261549 Mon Sep 17 00:00:00 2001
 From: Venture Research <tech@ventureresearch.com>
 Date: Fri, 8 Feb 2013 20:22:19 -0600
 Subject: [PATCH] lua: update Makefile to use environment build settings
@@ -16,18 +16,16 @@ updated to work wtih 6.2.1
 Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
 
 ---
-Upstream-Status: Pending
-
  deps/Makefile         |  1 -
  deps/lua/Makefile     |  1 -
  deps/lua/src/Makefile | 16 ++++++----------
  3 files changed, 6 insertions(+), 12 deletions(-)
 
 diff --git a/deps/Makefile b/deps/Makefile
-index 8592e17..1807af5 100644
+index 3bf0363..fd8765a 100644
 --- a/deps/Makefile
 +++ b/deps/Makefile
-@@ -81,7 +81,6 @@ endif
+@@ -94,7 +94,6 @@ endif
  # lua's Makefile defines AR="ar rcu", which is unusual, and makes it more
  # challenging to cross-compile lua (and redis).  These defines make it easier
  # to fit redis into cross-compilation environments, which typically set AR.
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.3/oe-use-libc-malloc.patch b/meta-oe/recipes-extended/redis/redis-7.2.4/oe-use-libc-malloc.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.3/oe-use-libc-malloc.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.4/oe-use-libc-malloc.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.3/redis.conf b/meta-oe/recipes-extended/redis/redis-7.2.4/redis.conf
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.3/redis.conf
rename to meta-oe/recipes-extended/redis/redis-7.2.4/redis.conf
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.3/redis.service b/meta-oe/recipes-extended/redis/redis-7.2.4/redis.service
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.3/redis.service
rename to meta-oe/recipes-extended/redis/redis-7.2.4/redis.service
diff --git a/meta-oe/recipes-extended/redis/redis_7.2.3.bb b/meta-oe/recipes-extended/redis/redis_7.2.4.bb
similarity index 96%
rename from meta-oe/recipes-extended/redis/redis_7.2.3.bb
rename to meta-oe/recipes-extended/redis/redis_7.2.4.bb
index 7fa0e6372..5d64e9ba7 100644
--- a/meta-oe/recipes-extended/redis/redis_7.2.3.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.2.4.bb
@@ -17,7 +17,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE-7.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            "
-SRC_URI[sha256sum] = "3e2b196d6eb4ddb9e743088bfc2915ccbb42d40f5a8a3edd8cb69c716ec34be7"
+SRC_URI[sha256sum] = "8d104c26a154b29fd67d6568b4f375212212ad41e0c2caa3d66480e78dbd3b59"
 
 inherit autotools-brokensep pkgconfig update-rc.d systemd useradd
 
-- 
2.34.1


