Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0AA7C072A2
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 06:22:25 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.13776.1700634142055655368
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Nov 2023 22:22:22 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="119924180"
X-IronPort-AV: E=Sophos;i="6.04,218,1695654000"; 
   d="scan'208";a="119924180"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 15:22:17 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9570FA7C4B
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 15:22:14 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id E3ECF1001A
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 15:22:13 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id BE4532FC7E11;
	Wed, 22 Nov 2023 15:22:12 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-dateparser: upgrade 1.1.8 -> 1.2.0
Date: Wed, 22 Nov 2023 14:21:22 +0800
Message-Id: <1700634082-7944-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28012.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28012.005
X-TMASE-Result: 10--2.643100-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mrKQNhMboqZlrzB9ACjDXPukRi
	8zfutxCBLwx7XYhzmaZgdVoWika+5JibV5QIc6vO46cXaPycFZtzNCdGumZsSZTx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q2dVNZaI2n6/xCE2NlBjIjcKXqmmYTGpxiUg5
	UD6AlF0rF9uGobEuT7gDLqnrRlXrbIDt27MLDp0t0H8LFZNFG76sBnwpOylLMqX4p3q7tVxImmI
	xrT2ZoM2EBN0ncIq1ZcS1m69B29OE79p8qfJGxZ68GWej1LefJDOh3p9zQqYqNpnlTi3K/7yB2M
	qGiv3VyIHqaUMp7VXtL/LK0d4I30Ze/gJB41STsbqpM7Cr+fvX7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 06:22:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106997

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
-New PREFER_MONTH_OF_YEAR setting (#1146)
-Absolute years in Russian are no longer being treated as a number of years in
 the past (#1129)
-Removed the use of datetime.utcnow, deprecated on Python 3.12 (#1179)
-Applied Black formatting to the code base (#1158)
-Initial integration with OSSFuzz (#1198)
-Extended test cases (#1191)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-dateparser_1.1.8.bb => python3-dateparser_1.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-dateparser_1.1.8.bb => python3-dateparser_1.2.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-dateparser_1.1.8.bb b/meta-python/recipes-devtools/python/python3-dateparser_1.2.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-dateparser_1.1.8.bb
rename to meta-python/recipes-devtools/python/python3-dateparser_1.2.0.bb
index 8b890fb22..a08564b3f 100644
--- a/meta-python/recipes-devtools/python/python3-dateparser_1.1.8.bb
+++ b/meta-python/recipes-devtools/python/python3-dateparser_1.2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/scrapinghub/dateparser"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3d3ed25571191e7aa3f55d0a6efe0051"
 
-SRC_URI[sha256sum] = "86b8b7517efcc558f085a142cdb7620f0921543fcabdb538c8a4c4001d8178e3"
+SRC_URI[sha256sum] = "7975b43a4222283e0ae15be7b4999d08c9a70e2d378ac87385b1ccf2cffbbb30"
 
 PYPI_PACKAGE = "dateparser"
 
-- 
2.34.1


