Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84C64C7EE23
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 07:53:41 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.2115.1685951611707613055
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jun 2023 00:53:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="107179351"
X-IronPort-AV: E=Sophos;i="6.00,217,1681138800"; 
   d="scan'208";a="107179351"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 16:53:28 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id EDBB6DDC61
	for <openembedded-devel@lists.openembedded.org>; Mon,  5 Jun 2023 16:53:26 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2AEE7D4BD5
	for <openembedded-devel@lists.openembedded.org>; Mon,  5 Jun 2023 16:53:26 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4AF2B2FC85E5;
	Mon,  5 Jun 2023 16:53:25 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-api-python-client: upgrade 2.87.0 -> 2.88.0
Date: Mon,  5 Jun 2023 15:53:03 +0800
Message-Id: <1685951589-29920-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685951589-29920-1-git-send-email-wangmy@fujitsu.com>
References: <1685951589-29920-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27672.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27672.004
X-TMASE-Result: 10-1.445100-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mr9pLnYtQ99xIwS+fKi1+IroIB
	CrHXdfvc4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat054xHfiujuTbedlNc
	WZ7137CiBkESMI05d4iiOf1NDnCI+rWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNVbrT+ifGfdtMBGLEhU9yUuuUKUbnnro63Ogt7LkjorAacCTw4nivRJk32kTbuDuggar/
	GQ4X3RmHcjoV5i9yR8yYWSf3VH1cWOCjzW1o6/EU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Jun 2023 07:53:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103120

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://github.com/googleapis/google-api-python-client/blob/main/CHANGELOG.md

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ent_2.87.0.bb => python3-google-api-python-client_2.88.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.87.0.bb => python3-google-api-python-client_2.88.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.87.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.88.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.87.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.88.0.bb
index c6a7663436..6ea78ee812 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.87.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.88.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "bbea5869877c822d12d318943833d988497b3a18b9ca2386967118074db676f3"
+SRC_URI[sha256sum] = "37068453f79ea28e5394a8fe20a4ba620594e7f8541068bea2e844dacdcc9d33"
 
 inherit pypi setuptools3
 
-- 
2.34.1


