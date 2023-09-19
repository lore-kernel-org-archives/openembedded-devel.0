Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80025CD549A
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 07:51:19 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.2583.1695109873681810941
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Sep 2023 00:51:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="111997932"
X-IronPort-AV: E=Sophos;i="6.02,158,1688396400"; 
   d="scan'208";a="111997932"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 16:51:11 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 67104C68E6
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:51:09 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id A1995D3F11
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:51:08 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id C26372FC6B2A;
	Tue, 19 Sep 2023 16:51:07 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pymisp: upgrade 2.4.175 -> 2.4.176
Date: Tue, 19 Sep 2023 15:50:41 +0800
Message-Id: <1695109841-7964-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27884.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27884.005
X-TMASE-Result: 10-0.643300-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mr2FA7wK9mP9fSCgqR50UUhb6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3LRPJs/q8vyU+Hv
	2UJ08907L1mqbsS9tOc5462iIVZCxkfRhdidsajMURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO0Nst
	CXmf87HETum0wvgpXyetz6HHtm9iciHdy4GD8EwSXV5bcul8l6tZGW2HchFeqD1FhGetvVrarBA
	8lU3paXBJg9eL6XyVjumZsKmS0cEfIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 07:51:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104988

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- Avoid exception when data is an empty iterator.
- Revert "build(deps): bump codecov/codecov-action from 3 to 4"
- Build(deps): bump codecov/codecov-action from 3 to 4.
- Build(deps): bump actions/checkout from 3 to 4.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymisp_2.4.175.bb => python3-pymisp_2.4.176.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.175.bb => python3-pymisp_2.4.176.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.175.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.176.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.175.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.176.bb
index 969e4b7b5a..56f34d4123 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.175.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.176.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
 SRC_URI = "git://github.com/MISP/PyMISP.git;protocol=https;branch=main"
-SRCREV = "69e660ef03108cc16a52b170e7ab4440bd202520"
+SRCREV = "249cf20f3516100cea0adb0396635e2c13d7695d"
 S = "${WORKDIR}/git"
 
 inherit python_poetry_core
-- 
2.34.1


