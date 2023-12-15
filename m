Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C374FC4332F
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 03:47:34 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.52779.1702612053083951392
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 19:47:33 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="145077624"
X-IronPort-AV: E=Sophos;i="6.04,277,1695654000"; 
   d="scan'208";a="145077624"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 12:47:30 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 28484DC656
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 12:47:28 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4F79CBF4C3
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 12:47:27 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.165])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id BF87D2FC7080;
	Fri, 15 Dec 2023 12:47:25 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] hwdata: upgrade 0.376 -> 0.377
Date: Fri, 15 Dec 2023 11:47:05 +0800
Message-Id: <1702612025-3238-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28058.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28058.004
X-TMASE-Result: 10-0.501200-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yQPZZctd3P4Bchr4pBLGIvAH8UzOewTxw+z9
	H+EUMUMlIvrftAIhWmIOYgThO+DmX+DLvvVL3eB4tw+xHnsmQjMQhNjZQYyI3LRPJs/q8vyUIY6
	e+Xi1ah/tAdDE/EtBJIAy6p60ZV62To3UJuRLIoTdB/CxWTRRu+rAZ8KTspSzdPSIqvM/EeDIjo
	wYP4qh8wsZPAEnI7kitUx8AxuGOa3GP7WvjAywYhbiP6iZbCmiHf/zXoIrEZzJjkwLjnJpbTXSp
	oXW8MhPiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 03:47:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107482

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/hwdata/{hwdata_0.376.bb => hwdata_0.377.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/hwdata/{hwdata_0.376.bb => hwdata_0.377.bb} (91%)

diff --git a/meta-oe/recipes-support/hwdata/hwdata_0.376.bb b/meta-oe/recipes-support/hwdata/hwdata_0.377.bb
similarity index 91%
rename from meta-oe/recipes-support/hwdata/hwdata_0.376.bb
rename to meta-oe/recipes-support/hwdata/hwdata_0.377.bb
index 1666d5e4d..dcf6d1e95 100644
--- a/meta-oe/recipes-support/hwdata/hwdata_0.376.bb
+++ b/meta-oe/recipes-support/hwdata/hwdata_0.377.bb
@@ -5,7 +5,7 @@ SECTION = "System/Base"
 LICENSE = "GPL-2.0-or-later | XFree86-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
-SRCREV = "e27f08bda517100746000dacdd882b6a7e7ce19a"
+SRCREV = "7c46440af001d0bc8230b6f009b73a25b614e032"
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


