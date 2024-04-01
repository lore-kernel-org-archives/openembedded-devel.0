Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AABACD1292
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 14:51:54 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.39359.1711983104494179967
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Apr 2024 07:51:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Mm1UcoLw;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711983104; x=1743519104;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=q0Fts7plmo3i/ioDDtnU7OzTk3II7W3+ziVXdCJpds4=;
  b=Mm1UcoLwHCmGnV7YwYiUxY3gmSIrMXh3/69zQ17UuW46dICmdctEKPOF
   DCKtvP2MITR8lQ/aiqod8MVhEk6fsf++PLoH35nx2qVmiF6gu87RzZ06M
   SKufXgTOdr/8+q+lSeN19ithWBhs/cbE9p0igvtsQgsXTKun8ZE6f4wsV
   IsBRGEQylmg1ZiGzeEFUZx7AFsY/5l62Pd+4RJ5tut7ommMYZjm2W4EGN
   1FR3z1xA6rOdI9bdkgONARgMKVzfKy5vPIbjtQs96tLhTiGf9yGrLHE/K
   Pej1ctT99qOko0OsudajQ5Uk7XlSBedWtAxp6aI4rfj/ZbR3OkjLUr3fT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="133053928"
X-IronPort-AV: E=Sophos;i="6.07,172,1708354800"; 
   d="scan'208";a="133053928"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 23:51:42 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 943E9D2AEB
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:40 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id D0AEEC520A
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:39 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5F36420093240
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:39 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1574F1A000A;
	Mon,  1 Apr 2024 22:51:39 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 31/47] python3-pytest-lazy-fixtures: upgrade 1.0.6 -> 1.0.7
Date: Mon,  1 Apr 2024 22:51:03 +0800
Message-Id: <1711983079-16849-31-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
References: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28292.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28292.000
X-TMASE-Result: 10-0.625000-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvuebKrFNJkRb6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74D4qCLIu0mtILgbJOZ434Bs1vZ
	7s3YIVDKbepuhA18xJM5462iIVZCxTvHzGcGqiIKeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNX5zpKL4AeeTpWS8OYhAbVXb2VjfeYE4adahw10KjHHB4Zpp0ztm5HlHVrcu8SB6vOfo1
	NPvkrJlmAwHk7emkEtXVFaODTbW8TKgHg/t0KH2U8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Apr 2024 14:51:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109747

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Fix coverage
-Add shortcut for lazy fixtures

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-fixtures_1.0.6.bb => python3-pytest-lazy-fixtures_1.0.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-lazy-fixtures_1.0.6.bb => python3-pytest-lazy-fixtures_1.0.7.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-lazy-fixtures_1.0.6.bb b/meta-python/recipes-devtools/python/python3-pytest-lazy-fixtures_1.0.7.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-pytest-lazy-fixtures_1.0.6.bb
rename to meta-python/recipes-devtools/python/python3-pytest-lazy-fixtures_1.0.7.bb
index 43e4f37ee..f5e6dbfcd 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-lazy-fixtures_1.0.6.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-lazy-fixtures_1.0.7.bb
@@ -12,7 +12,7 @@ HOMEPAGE = "https://github.com/dev-petrov/pytest-lazy-fixtures"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4475e66fcfabe27395e6764c8f69c876"
 
-SRC_URI[sha256sum] = "d69320b53b7e10888a2b1e98a89d891fa7b39f210b9f2087ebe3042a38e28a2e"
+SRC_URI[sha256sum] = "87ef7424dc0229ff9cb72d482f49b7806535c3500641f612c13ddf243c9adacb"
 
 inherit pypi python_poetry_core
 
-- 
2.34.1


