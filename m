Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C733C07E8D
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 01:41:39 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.2756.1713318092173863857
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 18:41:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IT8wt3ht;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713318092; x=1744854092;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=NLpO7UzMvnOxqJyvYN5mBzBwOXHKMvRzJZ2CJZOlSCk=;
  b=IT8wt3htXHYasThAE0ibMuZ1QcPu2GQggkoBV49R7HWdGuMM7VipA05u
   cURnnyUKvVRTOb5GD5eeKpkup0x7YDeyNneDinsgvKb6dADrKHCN8VV0E
   MK2NWVyiGQBkDMb8Pm8V7fCTHDzKie31mH0NqE3kEW/OgbRTi1KcxKvQb
   O1/B3IuX+hMHQ1r5FTBUZyRX/sr6jd04gBzfo/+72jcLyA8mAK45jGyBq
   0ryRcUqrXrHC9liBw8NotCcgM8232i7D4cbz3pNxnSGeX2EhHEIFOkVSF
   qMPC2bEQbr7HfFx5tFE2KxGP7+nFYz9jfKLRQKqPm/nJFs2dXfb6S4bI0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="155233198"
X-IronPort-AV: E=Sophos;i="6.07,207,1708354800"; 
   d="scan'208";a="155233198"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 10:41:29 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id CFD0BD3EBA
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:27 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0555BCFAB7
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:27 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 84EBD6B5E9
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:26 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 317661A0002;
	Wed, 17 Apr 2024 09:41:26 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/49] python3-eth-abi: upgrade 5.0.1 -> 5.1.0
Date: Wed, 17 Apr 2024 09:40:31 +0800
Message-Id: <1713318061-17128-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
References: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28326.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28326.004
X-TMASE-Result: 10--1.162600-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrRUYppGmT91fk6Qbi+9i6D/zx
	fg6IZlFl5/gG8CUYdisNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG2h+t
	oLLKXwRGBkESMI05d4iiOf1NDnCI+rWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNcc/LkuEUo/UVgIETxOcjCXpeJ8kkIQOYo8al2C5Xt1dCGyLRtieJuJO1UfdplALrBgDO
	O/MWYfHzOOP/9LRKHPTDedqLK281ujgMZI4KJ30U8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 01:41:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110006

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Upgrade parsimonious from 0.9 to 0.10, which is 15% faster
-Add python 3.12 support, add all-format docs tests and nightly CI runs, reorg
 tests file structure to match CI grouping

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-eth-abi_5.0.1.bb => python3-eth-abi_5.1.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eth-abi_5.0.1.bb => python3-eth-abi_5.1.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-eth-abi_5.0.1.bb b/meta-python/recipes-devtools/python/python3-eth-abi_5.1.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-eth-abi_5.0.1.bb
rename to meta-python/recipes-devtools/python/python3-eth-abi_5.1.0.bb
index a56296188..e8bfb437f 100644
--- a/meta-python/recipes-devtools/python/python3-eth-abi_5.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-abi_5.1.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=731f4de9c79bfeba6d8d55f83d0d2423"
 
-SRC_URI[sha256sum] = "e9425110c6120c585c9f0db2e8a33d76c4b886b148a65e68fc0035d3917a3b9c"
+SRC_URI[sha256sum] = "33ddd756206e90f7ddff1330cc8cac4aa411a824fe779314a0a52abea2c8fc14"
 
 PYPI_PACKAGE = "eth_abi"
 
-- 
2.34.1


