Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58E3BC25B67
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 23:48:35 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.136623.1698104908207143166
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 16:48:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="116652659"
X-IronPort-AV: E=Sophos;i="6.03,246,1694703600"; 
   d="scan'208";a="116652659"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 08:48:25 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9B3DCCD7E4
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Oct 2023 08:48:23 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id BF30113F3B
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Oct 2023 08:48:22 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 000B170BE1;
	Tue, 24 Oct 2023 08:48:21 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] redis: upgrade 7.2.1 -> 7.2.2
Date: Tue, 24 Oct 2023 07:47:39 +0800
Message-Id: <1698104859-32239-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27954.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27954.003
X-TMASE-Result: 10--13.714000-10.000000
X-TMASE-MatchedRID: 242WXRytjV6jz0nOeth/yUIIxwDaU5mrk45XNF39dU5CbDVw9++Pqaf8
	D6OeWXC1a2Kv+d3OHJ98vLO0YKIqwgW2ISv3KJsWqdwbW9Wx9tD5UnqVnIHSz1gLks93sG9tmaP
	XwDG+OHTmCes3XHUEZqoOpL/9B06GLT4SwCkKtFFURfNbW2avkNDEMPvvoocvPZSk8XZgZOH1CT
	e/iI7r7vMg+Vd0XoGtBlShLAm3Hw76eJVowF9Ts2vOwg12ikVSBo3qlq98FP9FzOMg8O3UPwec3
	JTmkn8uJMPD8FR5f58F1Ec/oUIRlfwfgLToPWSuTuctSpiuWyUUi4Ehat054zP3WYNhkszlsCQZ
	JC3mzKmw7DiBLXLxnIDYPhAGqvQ55UcZtwNsCroURSScn+QSXgGlEJORGTlJ+gtHj7OwNO35N/S
	1zEq4uqXIUP7R/pmfUxDDmfMCFJISF7XE/49P2zzIAQj0g351
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 23:48:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105708

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* (CVE-2023-45145) The wrong order of listen(2) and chmod(2) calls creates a
  race condition that can be used by another process to bypass desired Unix
  socket permissions on startup.
* Fix compilation error on MacOS 13 (#12611)
* WAITAOF could timeout in the absence of write traffic in case a new AOF is
  created and an AOF rewrite can't immediately start (#12620)
* Fix crash when running rebalance command in a mixed cluster of 7.0 and 7.2
  nodes (#12604)
* Fix the return type of the slot number in cluster shards to integer, which
  makes it consistent with past behavior (#12561)
* Fix CLUSTER commands are called from modules or scripts to return TLS info
  appropriately (#12569)
* redis-cli, fix crash on reconnect when in SUBSCRIBE mode (#12571)
* Fix overflow calculation for next timer event (#12474)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-src-Do-not-reset-FINAL_LIBS.patch                      | 0
 .../0006-Define-correct-gregs-for-RISCV32.patch                 | 0
 .../redis/{redis-7.2.1 => redis-7.2.2}/GNU_SOURCE-7.patch       | 0
 .../hiredis-use-default-CC-if-it-is-set.patch                   | 0
 .../redis/{redis-7.2.1 => redis-7.2.2}/init-redis-server        | 0
 .../lua-update-Makefile-to-use-environment-build-setting.patch  | 0
 .../redis/{redis-7.2.1 => redis-7.2.2}/oe-use-libc-malloc.patch | 0
 .../redis/{redis-7.2.1 => redis-7.2.2}/redis.conf               | 0
 .../redis/{redis-7.2.1 => redis-7.2.2}/redis.service            | 0
 .../recipes-extended/redis/{redis_7.2.1.bb => redis_7.2.2.bb}   | 2 +-
 10 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis/{redis-7.2.1 => redis-7.2.2}/0001-src-Do-not-reset-FINAL_LIBS.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.1 => redis-7.2.2}/0006-Define-correct-gregs-for-RISCV32.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.1 => redis-7.2.2}/GNU_SOURCE-7.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.1 => redis-7.2.2}/hiredis-use-default-CC-if-it-is-set.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.1 => redis-7.2.2}/init-redis-server (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.1 => redis-7.2.2}/lua-update-Makefile-to-use-environment-build-setting.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.1 => redis-7.2.2}/oe-use-libc-malloc.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.1 => redis-7.2.2}/redis.conf (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.1 => redis-7.2.2}/redis.service (100%)
 rename meta-oe/recipes-extended/redis/{redis_7.2.1.bb => redis_7.2.2.bb} (96%)

diff --git a/meta-oe/recipes-extended/redis/redis-7.2.1/0001-src-Do-not-reset-FINAL_LIBS.patch b/meta-oe/recipes-extended/redis/redis-7.2.2/0001-src-Do-not-reset-FINAL_LIBS.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.1/0001-src-Do-not-reset-FINAL_LIBS.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.2/0001-src-Do-not-reset-FINAL_LIBS.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.1/0006-Define-correct-gregs-for-RISCV32.patch b/meta-oe/recipes-extended/redis/redis-7.2.2/0006-Define-correct-gregs-for-RISCV32.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.1/0006-Define-correct-gregs-for-RISCV32.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.2/0006-Define-correct-gregs-for-RISCV32.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.1/GNU_SOURCE-7.patch b/meta-oe/recipes-extended/redis/redis-7.2.2/GNU_SOURCE-7.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.1/GNU_SOURCE-7.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.2/GNU_SOURCE-7.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.1/hiredis-use-default-CC-if-it-is-set.patch b/meta-oe/recipes-extended/redis/redis-7.2.2/hiredis-use-default-CC-if-it-is-set.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.1/hiredis-use-default-CC-if-it-is-set.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.2/hiredis-use-default-CC-if-it-is-set.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.1/init-redis-server b/meta-oe/recipes-extended/redis/redis-7.2.2/init-redis-server
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.1/init-redis-server
rename to meta-oe/recipes-extended/redis/redis-7.2.2/init-redis-server
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.1/lua-update-Makefile-to-use-environment-build-setting.patch b/meta-oe/recipes-extended/redis/redis-7.2.2/lua-update-Makefile-to-use-environment-build-setting.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.1/lua-update-Makefile-to-use-environment-build-setting.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.2/lua-update-Makefile-to-use-environment-build-setting.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.1/oe-use-libc-malloc.patch b/meta-oe/recipes-extended/redis/redis-7.2.2/oe-use-libc-malloc.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.1/oe-use-libc-malloc.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.2/oe-use-libc-malloc.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.1/redis.conf b/meta-oe/recipes-extended/redis/redis-7.2.2/redis.conf
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.1/redis.conf
rename to meta-oe/recipes-extended/redis/redis-7.2.2/redis.conf
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.1/redis.service b/meta-oe/recipes-extended/redis/redis-7.2.2/redis.service
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.1/redis.service
rename to meta-oe/recipes-extended/redis/redis-7.2.2/redis.service
diff --git a/meta-oe/recipes-extended/redis/redis_7.2.1.bb b/meta-oe/recipes-extended/redis/redis_7.2.2.bb
similarity index 96%
rename from meta-oe/recipes-extended/redis/redis_7.2.1.bb
rename to meta-oe/recipes-extended/redis/redis_7.2.2.bb
index f8e30e086d..44fb01bc85 100644
--- a/meta-oe/recipes-extended/redis/redis_7.2.1.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.2.2.bb
@@ -17,7 +17,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE-7.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            "
-SRC_URI[sha256sum] = "5c76d990a1b1c5f949bcd1eed90d0c8a4f70369bdbdcb40288c561ddf88967a4"
+SRC_URI[sha256sum] = "ca999be08800edc6d265379c4c7aafad92f0ee400692e4e2d69829ab4b4c3d08"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.34.1


