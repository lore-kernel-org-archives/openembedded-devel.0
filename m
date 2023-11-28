Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8006C07CA9
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 08:26:04 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.28278.1701159958863671962
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 00:25:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="140701761"
X-IronPort-AV: E=Sophos;i="6.04,233,1695654000"; 
   d="scan'208";a="140701761"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 17:25:56 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 38014D772B
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 17:25:54 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 74775D5E9F
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 17:25:53 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.149])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id A50CD2005019B;
	Tue, 28 Nov 2023 17:25:52 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-aiohttp: upgrade 3.9.0 -> 3.9.1
Date: Tue, 28 Nov 2023 16:25:01 +0800
Message-Id: <1701159901-28014-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28024.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28024.006
X-TMASE-Result: 10--4.709000-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mr5sPqcQkI8psAIXlMppp3XyMO
	uGtF4L1EEK5M1jLAU5rKy9u8e12hg7MqLhXt9oHXA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYgB/8cibO8IY5gZGm/RVVHG5x7uAXGEprQFA6pSxaDHmAhn751acftuem2
	vw+cenKeLzNWBegCW2wgn7iDBesS0nRE+fI6etkq675pM1hO8RGKatBxOKHNzaGraoLBZDAyhH/
	e4DgYoSH1vkDajUsRxiE0y7RPr1cA6Dw9aQXwtEaU8U0OsMD1q4inUq4QbrlUu/kTKv9giuqwOH
	O1Fdn0Kb4tj0DvxRUIs9ro6z1cfchCFNTbTJJtE=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 08:26:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107077

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Fixed importing aiohttp under PyPy on Windows.
-Fixed async concurrency safety in websocket compressor.
-Fixed ClientResponse.close() releasing the connection instead of closing.
-Fixed a regression where connection may get closed during upgrade.
-Fixed messages being reported as upgraded without an Upgrade header in Python parser. 

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-aiohttp_3.9.0.bb => python3-aiohttp_3.9.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohttp_3.9.0.bb => python3-aiohttp_3.9.1.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.0.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.1.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-aiohttp_3.9.0.bb
rename to meta-python/recipes-devtools/python/python3-aiohttp_3.9.1.bb
index d71f3df00..566417047 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/aiohttp"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=748073912af33aa59430d3702aa32d41"
 
-SRC_URI[sha256sum] = "09f23292d29135025e19e8ff4f0a68df078fe4ee013bca0105b2e803989de92d"
+SRC_URI[sha256sum] = "8fc49a87ac269d4529da45871e2ffb6874e87779c3d0e2ccd813c0899221239d"
 
 PYPI_PACKAGE = "aiohttp"
 inherit python_setuptools_build_meta pypi
-- 
2.34.1


