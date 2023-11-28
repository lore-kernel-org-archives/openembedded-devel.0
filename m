Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D57DDC4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 08:50:14 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.28671.1701161409426741398
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 00:50:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="120645045"
X-IronPort-AV: E=Sophos;i="6.04,233,1695654000"; 
   d="scan'208";a="120645045"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 17:50:07 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 09E80E8D36
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 17:50:05 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2A235D5FF7
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 17:50:04 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.149])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6EB612007912D;
	Tue, 28 Nov 2023 17:50:03 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] redis: upgrade 7.2.2 -> 7.2.3
Date: Tue, 28 Nov 2023 16:49:30 +0800
Message-Id: <1701161370-28678-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28024.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28024.006
X-TMASE-Result: 10--6.656300-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyu6FTbg6ndROZYv
	gWqjMEzaZWizM5wI4mFLTmvmHr3PYmYuAzap1RRQOjf3A4DTYuFIvK4LrXs1aavdPXrAa3LfWTg
	jvcdK4VKiJGJGoluOFgXURz+hQhGV/B+AtOg9ZK5O5y1KmK5bJRSLgSFq3TnjM/dZg2GSzOWwJB
	kkLebMqbDsOIEtcvGcgNg+EAaq9DnlRxm3A2wKuhRFJJyf5BJeAaUQk5EZOUn6C0ePs7A07fUrO
	TjR0Rj1WtMB3XleJrsffk9cHocwTLILgNcAaNsKTX4UwHHvSMo=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 08:50:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107092

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
-Fix file descriptor leak preventing deleted files from freeing disk space on
 replicas
-Fix a possible crash after cluster node removal 

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-src-Do-not-reset-FINAL_LIBS.patch                      | 0
 .../0006-Define-correct-gregs-for-RISCV32.patch                 | 0
 .../redis/{redis-7.2.2 => redis-7.2.3}/GNU_SOURCE-7.patch       | 0
 .../hiredis-use-default-CC-if-it-is-set.patch                   | 0
 .../redis/{redis-7.2.2 => redis-7.2.3}/init-redis-server        | 0
 .../lua-update-Makefile-to-use-environment-build-setting.patch  | 0
 .../redis/{redis-7.2.2 => redis-7.2.3}/oe-use-libc-malloc.patch | 0
 .../redis/{redis-7.2.2 => redis-7.2.3}/redis.conf               | 0
 .../redis/{redis-7.2.2 => redis-7.2.3}/redis.service            | 0
 .../recipes-extended/redis/{redis_7.2.2.bb => redis_7.2.3.bb}   | 2 +-
 10 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis/{redis-7.2.2 => redis-7.2.3}/0001-src-Do-not-reset-FINAL_LIBS.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.2 => redis-7.2.3}/0006-Define-correct-gregs-for-RISCV32.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.2 => redis-7.2.3}/GNU_SOURCE-7.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.2 => redis-7.2.3}/hiredis-use-default-CC-if-it-is-set.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.2 => redis-7.2.3}/init-redis-server (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.2 => redis-7.2.3}/lua-update-Makefile-to-use-environment-build-setting.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.2 => redis-7.2.3}/oe-use-libc-malloc.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.2 => redis-7.2.3}/redis.conf (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.2 => redis-7.2.3}/redis.service (100%)
 rename meta-oe/recipes-extended/redis/{redis_7.2.2.bb => redis_7.2.3.bb} (96%)

diff --git a/meta-oe/recipes-extended/redis/redis-7.2.2/0001-src-Do-not-reset-FINAL_LIBS.patch b/meta-oe/recipes-extended/redis/redis-7.2.3/0001-src-Do-not-reset-FINAL_LIBS.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.2/0001-src-Do-not-reset-FINAL_LIBS.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.3/0001-src-Do-not-reset-FINAL_LIBS.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.2/0006-Define-correct-gregs-for-RISCV32.patch b/meta-oe/recipes-extended/redis/redis-7.2.3/0006-Define-correct-gregs-for-RISCV32.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.2/0006-Define-correct-gregs-for-RISCV32.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.3/0006-Define-correct-gregs-for-RISCV32.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.2/GNU_SOURCE-7.patch b/meta-oe/recipes-extended/redis/redis-7.2.3/GNU_SOURCE-7.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.2/GNU_SOURCE-7.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.3/GNU_SOURCE-7.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.2/hiredis-use-default-CC-if-it-is-set.patch b/meta-oe/recipes-extended/redis/redis-7.2.3/hiredis-use-default-CC-if-it-is-set.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.2/hiredis-use-default-CC-if-it-is-set.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.3/hiredis-use-default-CC-if-it-is-set.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.2/init-redis-server b/meta-oe/recipes-extended/redis/redis-7.2.3/init-redis-server
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.2/init-redis-server
rename to meta-oe/recipes-extended/redis/redis-7.2.3/init-redis-server
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.2/lua-update-Makefile-to-use-environment-build-setting.patch b/meta-oe/recipes-extended/redis/redis-7.2.3/lua-update-Makefile-to-use-environment-build-setting.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.2/lua-update-Makefile-to-use-environment-build-setting.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.3/lua-update-Makefile-to-use-environment-build-setting.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.2/oe-use-libc-malloc.patch b/meta-oe/recipes-extended/redis/redis-7.2.3/oe-use-libc-malloc.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.2/oe-use-libc-malloc.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.3/oe-use-libc-malloc.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.2/redis.conf b/meta-oe/recipes-extended/redis/redis-7.2.3/redis.conf
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.2/redis.conf
rename to meta-oe/recipes-extended/redis/redis-7.2.3/redis.conf
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.2/redis.service b/meta-oe/recipes-extended/redis/redis-7.2.3/redis.service
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.2/redis.service
rename to meta-oe/recipes-extended/redis/redis-7.2.3/redis.service
diff --git a/meta-oe/recipes-extended/redis/redis_7.2.2.bb b/meta-oe/recipes-extended/redis/redis_7.2.3.bb
similarity index 96%
rename from meta-oe/recipes-extended/redis/redis_7.2.2.bb
rename to meta-oe/recipes-extended/redis/redis_7.2.3.bb
index 44fb01bc8..cef979768 100644
--- a/meta-oe/recipes-extended/redis/redis_7.2.2.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.2.3.bb
@@ -17,7 +17,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE-7.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            "
-SRC_URI[sha256sum] = "ca999be08800edc6d265379c4c7aafad92f0ee400692e4e2d69829ab4b4c3d08"
+SRC_URI[sha256sum] = "3e2b196d6eb4ddb9e743088bfc2915ccbb42d40f5a8a3edd8cb69c716ec34be7"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.34.1


