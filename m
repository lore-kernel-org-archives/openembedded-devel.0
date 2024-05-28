Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9BFCC25B74
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 01:50:28 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.12705.1716861019070421634
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 May 2024 18:50:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=EAw9P0AJ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716861019; x=1748397019;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=KUM2BpzxbocdMu/An4xsUNgyB8aoeDzTTBM63DIwO2o=;
  b=EAw9P0AJa4X27wCwpP+ELUFez5bPCKZl9dqQFpFYXIyTeKO2/XkkK4t/
   UooRtZDqe091oMMStmuUhK5dTlO5nImMeIgixfryA4ri4aJZJ4UiX4om/
   U4HeXsw4pAh/F+UUuMOJb4ItvuKeDMtuIRlxKKko32P5RS8FAKwD0yTVl
   BHjPdfhmiUJSVkYTc5dyk3oQOW/0u6d62rPOBfMsfdfVrfYWXZhr4qO3z
   7ZkB2DSgTQhqMmEKkKwdS22j1HII2mWgeZ0/Kj/ApgKCZtmtotBxhFKZa
   1y4lp9kx9EVe0EpthCW02INEwZ84iBv/60MKHtkEntuDncQOZ3hxcd3iP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="160573579"
X-IronPort-AV: E=Sophos;i="6.08,194,1712588400"; 
   d="scan'208";a="160573579"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 10:50:17 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 98116D4240
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:50:14 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id C3F9CBF3CB
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:50:13 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5DA57411AA
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:50:13 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0AC071A000A;
	Tue, 28 May 2024 09:50:13 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 25/40] python3-rapidjson: upgrade 1.14 -> 1.17
Date: Tue, 28 May 2024 09:48:06 +0800
Message-Id: <1716860901-863-25-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
References: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28414.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28414.004
X-TMASE-Result: 10--4.778300-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrC//1TMV5chNmNqUsn94Y276p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74D4qCLIu0mtIGAN6i+va16uBoa
	RMwn0B/eLM7N9YiFHjuhAZQXEXXZurWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNUD0IbepO/YJcnmrb3L0ErGy8ZF/2POh//+VOfXn3WOnWAGH0jkdnQ/DMpbBvWwnzZ49b
	OE4JTnKLwG++D0ldSkfHQ1H5xpXDjKgHg/t0KH2U8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 01:50:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110560

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Use current master__ version of rapidjson
- Generate wheels on PyPI using Python 3.13b1 release, thanks to cibuildwheel 2.18.0__

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-rapidjson_1.14.bb => python3-rapidjson_1.17.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-rapidjson_1.14.bb => python3-rapidjson_1.17.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-rapidjson_1.14.bb b/meta-python/recipes-devtools/python/python3-rapidjson_1.17.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-rapidjson_1.14.bb
rename to meta-python/recipes-devtools/python/python3-rapidjson_1.17.bb
index 22868d8df..d7a56b051 100644
--- a/meta-python/recipes-devtools/python/python3-rapidjson_1.14.bb
+++ b/meta-python/recipes-devtools/python/python3-rapidjson_1.17.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/python-rapidjson/python-rapidjson"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4daf3929156304df67003c33274a98bd"
 
-SRC_URI[sha256sum] = "26806f0a658c34b48d2951d8d3f846ca9deb93a34e664ef436db632a188b6779"
+SRC_URI[sha256sum] = "95a111da29d996af8549f8b32ec701dab3af2ab7c6cd9c79540391ecb05f20c8"
 
 # Inheriting ptest provides functionality for packaging and installing runtime tests for this recipe
 inherit setuptools3 pypi ptest
-- 
2.34.1


