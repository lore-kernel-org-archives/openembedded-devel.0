Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9119C2BD05
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 02:58:57 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.2489.1718161122553454466
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jun 2024 19:58:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FZJomsUj;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718161130; x=1749697130;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=FvnJmXg9HeHOZYpLQA4zOUcz86csSA9Qq5tPzq48CqY=;
  b=FZJomsUjMRd7vXAtWqlsvkvDDacJXWt3aE7ID/NzxAwlRTa1cNegvVMP
   7N6jdsqymg3cJNie7pq2/akz5tWOcJYoqS5XFFVsL3QyoAK/CSMCFI7V6
   2EgfdeQxCIx1UYoyaQCL8NYKZlZivhSwayUbysohYb30OcZMo+bAZ6DWu
   J1ISrlvMumAe4NpvwrEtjTM0PLPdttzG6TC6V4kVS9WzXLZXz0XEjyQvo
   GRoOjczigOOkLf5HFoCuhrt0oyMBEX0EP0C+x/amvUPIRZpNx/yTJpT8n
   qzVrKcDL/Yd8GybTb4dxHJLeipombUjj8FqLzRTJFqZDgtxHoJM0eXYxK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="162710875"
X-IronPort-AV: E=Sophos;i="6.08,232,1712588400"; 
   d="scan'208";a="162710875"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 11:58:48 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id DCC2ED8008
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:45 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1F907D8B0F
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:45 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id AD374E290B
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:44 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5011C1A0002;
	Wed, 12 Jun 2024 10:58:44 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 27/43] python3-redis: upgrade 5.0.1 -> 5.0.4
Date: Wed, 12 Jun 2024 10:58:00 +0800
Message-Id: <1718161096-29710-27-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
References: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28448.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28448.004
X-TMASE-Result: 10--1.794400-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbysMEcL8oiHOyiGu
	zVLLKJdOSB2ZMiq//YjW+lYjv9p4Hr1MabCtVw9LA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYgB/8cibO8IYLxEFvMLiU987Cl8sx4HBG30tCKdnhB58I/9UW5M5dRMQpr
	Z/7WnuveTCMddcL/gjxlblqLlYqXIoy9F/orK0tVny8IHeobE40+p1vHXlxnlEEPiYO0zQlSnOg
	hBiJYm46V8U9jfFSzcnUHVHhTdUAHbyE3Aya9C07Bw6/Pt3V7T+v9v52ZIoWjoAf389xF3XFSk9
	HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 02:58:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110863

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Make it possible to customize SSL ciphers
- Fix breaking change: message in LockError is now optional
- Allow setting the minimum SSL version
- Add modules support to Async RedisCluster

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-redis_5.0.1.bb => python3-redis_5.0.4.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-redis_5.0.1.bb => python3-redis_5.0.4.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-redis_5.0.1.bb b/meta-python/recipes-devtools/python/python3-redis_5.0.4.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-redis_5.0.1.bb
rename to meta-python/recipes-devtools/python/python3-redis_5.0.4.bb
index 2c473c03e..506e3bc1a 100644
--- a/meta-python/recipes-devtools/python/python3-redis_5.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-redis_5.0.4.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://github.com/andymccurdy/redis-py"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=609ded3add9111c4c6e102f1d421d3f8"
 
-SRC_URI[sha256sum] = "0dab495cd5753069d3bc650a0dde8a8f9edde16fc5691b689a566eda58100d0f"
+SRC_URI[sha256sum] = "ec31f2ed9675cc54c21ba854cfe0462e6faf1d83c8ce5944709db8a4700b9c61"
 
 inherit pypi setuptools3
 
-- 
2.34.1


