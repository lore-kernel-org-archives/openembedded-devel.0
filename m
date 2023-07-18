Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08ABDC001DE
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 04:26:27 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.739.1689654382117899190
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jul 2023 21:26:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="124851900"
X-IronPort-AV: E=Sophos;i="6.01,213,1684767600"; 
   d="scan'208";a="124851900"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 13:26:22 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 88FD3E8524
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:20 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id BB355CF7C6
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:19 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1278F2008A3EB;
	Tue, 18 Jul 2023 13:26:19 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] redis: upgrade 7.0.11 -> 7.0.12
Date: Tue, 18 Jul 2023 12:25:43 +0800
Message-Id: <1689654348-30702-41-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
References: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27758.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27758.004
X-TMASE-Result: 10--11.100100-10.000000
X-TMASE-MatchedRID: +qH7TW9/Rkejz0nOeth/yUIIxwDaU5mrT5ysQDj6eFls1Ir4NZzFmpgU
	Ly4zAbFBxUgiF4o61dbTq8WLFBPUkOm4jgMXwUpGhQTFC/ew50bfuNwtNj3IRN9RlPzeVuQQ8y0
	S9JacVy8smgs5IfYoxk9/lgt7fEZQLUdbH1fNNYXy3h9RQZ4StBCE2NlBjIjcB/FMznsE8cOxSH
	46Ro6Gl4qFdXtpEJJS5p98cjyQCaIMCLEGW7c2cAN+CmNIOQU3cuFRT+prg4athMFibFDjzJ6ba
	/D5x6cp4vM1YF6AJbZT3DhdVcNYJgtuKBGekqUpI/NGWt0UYPByVcX5QIwLFIDeAPOYfRVQxrEr
	tdVV/DMzMM613J4F5HoGAEEg4pV0
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 04:26:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103933

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Re-enable downscale rehashing while there is a fork child (#12276)
-Fix possible hang in HRANDFIELD, SRANDMEMBER, ZRANDMEMBER when used with <count> (#12276)
-Improve fairness issue in RANDOMKEY, HRANDFIELD, SRANDMEMBER, ZRANDMEMBER, SPOP, and eviction (#12276)
-Fix WAIT to be effective after a blocked module command being unblocked (#12220)
-Avoid unnecessary full sync after master restart in a rare case (#12088)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-src-Do-not-reset-FINAL_LIBS.patch                      | 0
 .../0006-Define-correct-gregs-for-RISCV32.patch                 | 0
 .../redis/{redis-7.0.11 => redis-7.0.12}/GNU_SOURCE-7.patch     | 0
 .../hiredis-use-default-CC-if-it-is-set.patch                   | 0
 .../redis/{redis-7.0.11 => redis-7.0.12}/init-redis-server      | 0
 .../lua-update-Makefile-to-use-environment-build-setting.patch  | 0
 .../{redis-7.0.11 => redis-7.0.12}/oe-use-libc-malloc.patch     | 0
 .../redis/{redis-7.0.11 => redis-7.0.12}/redis.conf             | 0
 .../redis/{redis-7.0.11 => redis-7.0.12}/redis.service          | 0
 .../recipes-extended/redis/{redis_7.0.11.bb => redis_7.0.12.bb} | 2 +-
 10 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis/{redis-7.0.11 => redis-7.0.12}/0001-src-Do-not-reset-FINAL_LIBS.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.11 => redis-7.0.12}/0006-Define-correct-gregs-for-RISCV32.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.11 => redis-7.0.12}/GNU_SOURCE-7.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.11 => redis-7.0.12}/hiredis-use-default-CC-if-it-is-set.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.11 => redis-7.0.12}/init-redis-server (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.11 => redis-7.0.12}/lua-update-Makefile-to-use-environment-build-setting.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.11 => redis-7.0.12}/oe-use-libc-malloc.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.11 => redis-7.0.12}/redis.conf (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.11 => redis-7.0.12}/redis.service (100%)
 rename meta-oe/recipes-extended/redis/{redis_7.0.11.bb => redis_7.0.12.bb} (96%)

diff --git a/meta-oe/recipes-extended/redis/redis-7.0.11/0001-src-Do-not-reset-FINAL_LIBS.patch b/meta-oe/recipes-extended/redis/redis-7.0.12/0001-src-Do-not-reset-FINAL_LIBS.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.0.11/0001-src-Do-not-reset-FINAL_LIBS.patch
rename to meta-oe/recipes-extended/redis/redis-7.0.12/0001-src-Do-not-reset-FINAL_LIBS.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.0.11/0006-Define-correct-gregs-for-RISCV32.patch b/meta-oe/recipes-extended/redis/redis-7.0.12/0006-Define-correct-gregs-for-RISCV32.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.0.11/0006-Define-correct-gregs-for-RISCV32.patch
rename to meta-oe/recipes-extended/redis/redis-7.0.12/0006-Define-correct-gregs-for-RISCV32.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.0.11/GNU_SOURCE-7.patch b/meta-oe/recipes-extended/redis/redis-7.0.12/GNU_SOURCE-7.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.0.11/GNU_SOURCE-7.patch
rename to meta-oe/recipes-extended/redis/redis-7.0.12/GNU_SOURCE-7.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.0.11/hiredis-use-default-CC-if-it-is-set.patch b/meta-oe/recipes-extended/redis/redis-7.0.12/hiredis-use-default-CC-if-it-is-set.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.0.11/hiredis-use-default-CC-if-it-is-set.patch
rename to meta-oe/recipes-extended/redis/redis-7.0.12/hiredis-use-default-CC-if-it-is-set.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.0.11/init-redis-server b/meta-oe/recipes-extended/redis/redis-7.0.12/init-redis-server
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.0.11/init-redis-server
rename to meta-oe/recipes-extended/redis/redis-7.0.12/init-redis-server
diff --git a/meta-oe/recipes-extended/redis/redis-7.0.11/lua-update-Makefile-to-use-environment-build-setting.patch b/meta-oe/recipes-extended/redis/redis-7.0.12/lua-update-Makefile-to-use-environment-build-setting.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.0.11/lua-update-Makefile-to-use-environment-build-setting.patch
rename to meta-oe/recipes-extended/redis/redis-7.0.12/lua-update-Makefile-to-use-environment-build-setting.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.0.11/oe-use-libc-malloc.patch b/meta-oe/recipes-extended/redis/redis-7.0.12/oe-use-libc-malloc.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.0.11/oe-use-libc-malloc.patch
rename to meta-oe/recipes-extended/redis/redis-7.0.12/oe-use-libc-malloc.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.0.11/redis.conf b/meta-oe/recipes-extended/redis/redis-7.0.12/redis.conf
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.0.11/redis.conf
rename to meta-oe/recipes-extended/redis/redis-7.0.12/redis.conf
diff --git a/meta-oe/recipes-extended/redis/redis-7.0.11/redis.service b/meta-oe/recipes-extended/redis/redis-7.0.12/redis.service
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.0.11/redis.service
rename to meta-oe/recipes-extended/redis/redis-7.0.12/redis.service
diff --git a/meta-oe/recipes-extended/redis/redis_7.0.11.bb b/meta-oe/recipes-extended/redis/redis_7.0.12.bb
similarity index 96%
rename from meta-oe/recipes-extended/redis/redis_7.0.11.bb
rename to meta-oe/recipes-extended/redis/redis_7.0.12.bb
index 0fdbfe94bd..321b90dadf 100644
--- a/meta-oe/recipes-extended/redis/redis_7.0.11.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.0.12.bb
@@ -17,7 +17,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE-7.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            "
-SRC_URI[sha256sum] = "ce250d1fba042c613de38a15d40889b78f7cb6d5461a27e35017ba39b07221e3"
+SRC_URI[sha256sum] = "9dd83d5b278bb2bf0e39bfeb75c3e8170024edbaf11ba13b7037b2945cf48ab7"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.34.1


