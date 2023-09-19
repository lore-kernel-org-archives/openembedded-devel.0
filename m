Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9354CD54A5
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 08:01:09 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.2817.1695110465683863537
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Sep 2023 01:01:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="132648357"
X-IronPort-AV: E=Sophos;i="6.02,158,1688396400"; 
   d="scan'208";a="132648357"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 17:01:03 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id EB672DE6B4
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 17:01:00 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1D802D88AD
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 17:01:00 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 52DAC2FC85C9;
	Tue, 19 Sep 2023 17:00:59 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] redis: upgrade 7.2.0 -> 7.2.1
Date: Tue, 19 Sep 2023 16:00:03 +0800
Message-Id: <1695110403-8428-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27884.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27884.005
X-TMASE-Result: 10--6.198500-10.000000
X-TMASE-MatchedRID: 6IstDyeExSCjz0nOeth/yUIIxwDaU5mrlKvhkP88iXTn3ZLCt3rRSY3E
	akIoHWNdKLa1Z0d/Lq6Oeg0p3aVV514wErl2xpIZjhXy0Khej9K5UDmC+JSvrHZd/+jL21I3J0q
	ovrIFnuD3fvqqd34PPijO3N6Wlg4uLBkITZ1S2Vi4u3nS+3EEDvoXCWBk6JguIPUd1fKoOcTW9n
	uzdghUMvu0HEWlaGvJGB895SBn7/a1UOlz1sLXchF4zyLyne+Aa/fioJ9l4Hg3Es3x2dk91WkZ7
	sHaiCh7CmYCHTa1LYB5OPD8XJFfpB8TzIzimOwPFnjKVTYbDMDEQdG7H66TyH4gKq42LRYk6791
	QNlFai2ZQHvPWkKoVWpkMr13f/m2nYrgx4+hYB5+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 08:01:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104999

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-(CVE-2023-41053) Redis does not correctly identify keys accessed by SORT_RO and,
 as a result, may grant users executing this command access to keys that are not
 explicitly authorized by the ACL configuration.
-Fix crashes when joining a node to an existing 7.0 Redis Cluster (#12538)
 Correct request_policy and response_policy command tips on for some admin /
 configuration commands (#12545, #12530)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-src-Do-not-reset-FINAL_LIBS.patch                      | 0
 .../0006-Define-correct-gregs-for-RISCV32.patch                 | 0
 .../redis/{redis-7.2.0 => redis-7.2.1}/GNU_SOURCE-7.patch       | 0
 .../hiredis-use-default-CC-if-it-is-set.patch                   | 0
 .../redis/{redis-7.2.0 => redis-7.2.1}/init-redis-server        | 0
 .../lua-update-Makefile-to-use-environment-build-setting.patch  | 0
 .../redis/{redis-7.2.0 => redis-7.2.1}/oe-use-libc-malloc.patch | 0
 .../redis/{redis-7.2.0 => redis-7.2.1}/redis.conf               | 0
 .../redis/{redis-7.2.0 => redis-7.2.1}/redis.service            | 0
 .../recipes-extended/redis/{redis_7.2.0.bb => redis_7.2.1.bb}   | 2 +-
 10 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis/{redis-7.2.0 => redis-7.2.1}/0001-src-Do-not-reset-FINAL_LIBS.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.0 => redis-7.2.1}/0006-Define-correct-gregs-for-RISCV32.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.0 => redis-7.2.1}/GNU_SOURCE-7.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.0 => redis-7.2.1}/hiredis-use-default-CC-if-it-is-set.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.0 => redis-7.2.1}/init-redis-server (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.0 => redis-7.2.1}/lua-update-Makefile-to-use-environment-build-setting.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.0 => redis-7.2.1}/oe-use-libc-malloc.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.0 => redis-7.2.1}/redis.conf (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.0 => redis-7.2.1}/redis.service (100%)
 rename meta-oe/recipes-extended/redis/{redis_7.2.0.bb => redis_7.2.1.bb} (96%)

diff --git a/meta-oe/recipes-extended/redis/redis-7.2.0/0001-src-Do-not-reset-FINAL_LIBS.patch b/meta-oe/recipes-extended/redis/redis-7.2.1/0001-src-Do-not-reset-FINAL_LIBS.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.0/0001-src-Do-not-reset-FINAL_LIBS.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.1/0001-src-Do-not-reset-FINAL_LIBS.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.0/0006-Define-correct-gregs-for-RISCV32.patch b/meta-oe/recipes-extended/redis/redis-7.2.1/0006-Define-correct-gregs-for-RISCV32.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.0/0006-Define-correct-gregs-for-RISCV32.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.1/0006-Define-correct-gregs-for-RISCV32.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.0/GNU_SOURCE-7.patch b/meta-oe/recipes-extended/redis/redis-7.2.1/GNU_SOURCE-7.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.0/GNU_SOURCE-7.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.1/GNU_SOURCE-7.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.0/hiredis-use-default-CC-if-it-is-set.patch b/meta-oe/recipes-extended/redis/redis-7.2.1/hiredis-use-default-CC-if-it-is-set.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.0/hiredis-use-default-CC-if-it-is-set.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.1/hiredis-use-default-CC-if-it-is-set.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.0/init-redis-server b/meta-oe/recipes-extended/redis/redis-7.2.1/init-redis-server
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.0/init-redis-server
rename to meta-oe/recipes-extended/redis/redis-7.2.1/init-redis-server
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.0/lua-update-Makefile-to-use-environment-build-setting.patch b/meta-oe/recipes-extended/redis/redis-7.2.1/lua-update-Makefile-to-use-environment-build-setting.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.0/lua-update-Makefile-to-use-environment-build-setting.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.1/lua-update-Makefile-to-use-environment-build-setting.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.0/oe-use-libc-malloc.patch b/meta-oe/recipes-extended/redis/redis-7.2.1/oe-use-libc-malloc.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.0/oe-use-libc-malloc.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.1/oe-use-libc-malloc.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.0/redis.conf b/meta-oe/recipes-extended/redis/redis-7.2.1/redis.conf
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.0/redis.conf
rename to meta-oe/recipes-extended/redis/redis-7.2.1/redis.conf
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.0/redis.service b/meta-oe/recipes-extended/redis/redis-7.2.1/redis.service
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.0/redis.service
rename to meta-oe/recipes-extended/redis/redis-7.2.1/redis.service
diff --git a/meta-oe/recipes-extended/redis/redis_7.2.0.bb b/meta-oe/recipes-extended/redis/redis_7.2.1.bb
similarity index 96%
rename from meta-oe/recipes-extended/redis/redis_7.2.0.bb
rename to meta-oe/recipes-extended/redis/redis_7.2.1.bb
index 4f1c97b7e4..f8e30e086d 100644
--- a/meta-oe/recipes-extended/redis/redis_7.2.0.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.2.1.bb
@@ -17,7 +17,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE-7.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            "
-SRC_URI[sha256sum] = "8b12e242647635b419a0e1833eda02b65bf64e39eb9e509d9db4888fb3124943"
+SRC_URI[sha256sum] = "5c76d990a1b1c5f949bcd1eed90d0c8a4f70369bdbdcb40288c561ddf88967a4"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.34.1


