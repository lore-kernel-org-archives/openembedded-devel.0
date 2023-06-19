Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8A2DC001E0
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 06:50:31 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.2315.1687157422805220444
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Jun 2023 23:50:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="121324654"
X-IronPort-AV: E=Sophos;i="6.00,254,1681138800"; 
   d="scan'208";a="121324654"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 15:50:21 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 02BF3D3EB2
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 15:50:18 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3AF26D5E90
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 15:50:17 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6DB6E2FC8442;
	Mon, 19 Jun 2023 15:50:16 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] redis-plus-plus: upgrade 1.3.8 -> 1.3.9
Date: Mon, 19 Jun 2023 14:48:09 +0800
Message-Id: <1687157308-17342-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687157308-17342-1-git-send-email-wangmy@fujitsu.com>
References: <1687157308-17342-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27700.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27700.005
X-TMASE-Result: 10--5.839900-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/ySrLqyE6Ur/j1QQ6Jx/fflZOaDdl7pggvd9G
	7A5l4wBGmg3Dwk1+6homEDFX9cEEF1Kd65OZ0BzJOIQ9GP2P2u9MkOX0UoduuV70lsqJNmce1vZ
	7s3YIVDL7tBxFpWhrycYoh/qEF/tVoYY7KoErjW8ReM8i8p3vgId5TLtlbtYCEd+K6O5Nt530Iy
	jEvJxIV96Ap/+vpvjqtWKNR2epAFaR9GF2J2xqMxRFJJyf5BJe3QfwsVk0UbtuRXh7bFKB7g0u7
	2/8D52wrrxFT4z/Uo3DSGNxIY+HsVNv5RyC2lKtNkUSDDq742k=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:50:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103360

From: Wang Mingyu <wangmy@fujitsu.com>

0001-CMakeLists.txt-fix-substitution-for-static-libs.patch
refresh for new version

Changelog:
===========
    Fix async interface bug
    More built-in commands support for AsyncRedis
    Fix incorrect hiredis static lib dependency when building with TSL
    Breaking change: make HSET related methods return long long instead of bool

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ists.txt-fix-substitution-for-static-libs.patch | 14 +++++++-------
 ...plus-plus_1.3.8.bb => redis-plus-plus_1.3.9.bb} |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)
 rename meta-oe/recipes-extended/redis-plus-plus/{redis-plus-plus_1.3.8.bb => redis-plus-plus_1.3.9.bb} (95%)

diff --git a/meta-oe/recipes-extended/redis-plus-plus/files/0001-CMakeLists.txt-fix-substitution-for-static-libs.patch b/meta-oe/recipes-extended/redis-plus-plus/files/0001-CMakeLists.txt-fix-substitution-for-static-libs.patch
index 627b929b4..b652e6bb7 100644
--- a/meta-oe/recipes-extended/redis-plus-plus/files/0001-CMakeLists.txt-fix-substitution-for-static-libs.patch
+++ b/meta-oe/recipes-extended/redis-plus-plus/files/0001-CMakeLists.txt-fix-substitution-for-static-libs.patch
@@ -17,14 +17,14 @@ Upstream-Status: Submitted [https://github.com/sewenew/redis-plus-plus/issues/48
 
 Signed-off-by: Peter Bergin <peter.bergin@windriver.com>
 ---
- CMakeLists.txt | 5 ++---
- 1 file changed, 2 insertions(+), 3 deletions(-)
+ CMakeLists.txt | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 69794d9..08c265d 100644
+index 23a1840..5478271 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -160,13 +160,12 @@ if(REDIS_PLUS_PLUS_BUILD_STATIC)
+@@ -184,13 +184,13 @@ if(REDIS_PLUS_PLUS_BUILD_STATIC)
      set(REDIS_PLUS_PLUS_HIREDIS_LIBS_STATIC ${REDIS_PLUS_PLUS_HIREDIS_LIBS})
  
      if (TARGET hiredis::hiredis_static)
@@ -32,11 +32,11 @@ index 69794d9..08c265d 100644
 +      string(REPLACE "hiredis::hiredis;" "hiredis::hiredis_static;" REDIS_PLUS_PLUS_HIREDIS_LIBS_STATIC
          "${REDIS_PLUS_PLUS_HIREDIS_LIBS_STATIC}")
      endif()
--
+ 
      if (TARGET hiredis::hiredis_ssl_static)
        # If SSL is not enabled, this line will have no effect
--      string(REPLACE "hiredis::hiredis_ssl" "hiredis::hiredis_ssl_static" REDIS_PLUS_PLUS_HIREDIS_LIBS_STATIC
-+      string(REPLACE "hiredis::hiredis_ssl;" "hiredis::hiredis_ssl_static;" REDIS_PLUS_PLUS_HIREDIS_LIBS_STATIC
+-      string(REPLACE "hiredis::hiredis_static_ssl" "hiredis::hiredis_ssl_static" REDIS_PLUS_PLUS_HIREDIS_LIBS_STATIC
++      string(REPLACE "hiredis::hiredis_static_ssl;" "hiredis::hiredis_ssl_static;" REDIS_PLUS_PLUS_HIREDIS_LIBS_STATIC
          "${REDIS_PLUS_PLUS_HIREDIS_LIBS_STATIC}")
      endif()
  
diff --git a/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.8.bb b/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.9.bb
similarity index 95%
rename from meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.8.bb
rename to meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.9.bb
index bea1f0b18..a8a93868e 100644
--- a/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.8.bb
+++ b/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.9.bb
@@ -8,7 +8,7 @@ DEPENDS += "hiredis"
 
 SRC_URI = "git://github.com/sewenew/redis-plus-plus;branch=master;protocol=https \
            file://0001-CMakeLists.txt-fix-substitution-for-static-libs.patch"
-SRCREV = "4368319fb668204f345da05b9dd79762506c67b6"
+SRCREV = "0c4ba0370e46c3d0d443c0368d02195faa791219"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


