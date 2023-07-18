Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B6DDEB64DC
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 04:26:06 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.681.1689654362314687023
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jul 2023 21:26:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="113108719"
X-IronPort-AV: E=Sophos;i="6.01,213,1684767600"; 
   d="scan'208";a="113108719"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 13:25:59 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9C4E2D3EA3
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:25:57 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id E2F5FD21AF
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:25:56 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5F18320077821;
	Tue, 18 Jul 2023 13:25:56 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] c-periphery: upgrade 2.4.1 -> 2.4.2
Date: Tue, 18 Jul 2023 12:25:03 +0800
Message-Id: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27758.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27758.004
X-TMASE-Result: 10--3.820300-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrTfK5j0EZbyuhuT/MQ6uAV/J6
	+2BvyWGyh+OfMCcJO4lR4Xyks9lwTe1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQRBg
	61kSK4DiBkESMI05d4qHvyg1ZsxTfW2EXohiB6drdCok3ibXlQX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtBp6y28uWkAm4L6gRNbS4/84f7ZTv15g6k+6cZtiej64ryhIJq0MEI0iJk
	C1OxF0cXcFBXQE8v7KdeQ/v8+al5xh5oifnhUiNHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 04:26:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103893

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* GPIO
 * Fix building under Linux kernel headers missing realtime event
   timestamp support in the gpio-cdev v2 ABI.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../c-periphery/{c-periphery_2.4.1.bb => c-periphery_2.4.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/c-periphery/{c-periphery_2.4.1.bb => c-periphery_2.4.2.bb} (91%)

diff --git a/meta-oe/recipes-support/c-periphery/c-periphery_2.4.1.bb b/meta-oe/recipes-support/c-periphery/c-periphery_2.4.2.bb
similarity index 91%
rename from meta-oe/recipes-support/c-periphery/c-periphery_2.4.1.bb
rename to meta-oe/recipes-support/c-periphery/c-periphery_2.4.2.bb
index 3379ba16e4..8e38517448 100644
--- a/meta-oe/recipes-support/c-periphery/c-periphery_2.4.1.bb
+++ b/meta-oe/recipes-support/c-periphery/c-periphery_2.4.2.bb
@@ -9,7 +9,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=be30d45bdc453f70a494c149c2168289"
 
 SRC_URI = "git://github.com/vsergeev/c-periphery;protocol=https;branch=master"
-SRCREV = "6c5302cf8255c9bb75e535c566a8f1d94cfded5d"
+SRCREV = "91f9678d2a35a3af3c633f20165bdde8bea32209"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


