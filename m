Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF8F8C4332F
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 00:20:33 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.45715.1702599624224005319
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 16:20:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="122837311"
X-IronPort-AV: E=Sophos;i="6.04,277,1695654000"; 
   d="scan'208";a="122837311"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 09:20:22 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7A5E3E8CC0
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 09:20:19 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id A8830C8BFD
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 09:20:18 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.165])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8BC8786578;
	Fri, 15 Dec 2023 09:20:17 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-tornado: upgrade 6.3.3 -> 6.4
Date: Fri, 15 Dec 2023 08:19:22 +0800
Message-Id: <1702599562-1669-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28058.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28058.003
X-TMASE-Result: 10--2.647800-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mr+KgiyLtJrSBoOe42HKVRDr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74Br9+Kgn2XgeEukIs3g1HjelNc
	WZ7137CiBkESMI05d4iiOf1NDnCI+rWL/xQJnm46eAiCmPx4NwGmRqNBHmBveeFIQTy0Zb4bfaY
	87m2dqxydET58jp62Sa7Y9VumnjeoqsE/BsRZPraa1vGyfhN6W89UX9VizIKtuCePHGgGGvyJ/t
	+B/izyIAVUTLFmF44D6jrNbQoS6qzHbXlRfT/qvS7+RMq/2CK6rA4c7UV2fQpvi2PQO/FFQiz2u
	jrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 00:20:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107472

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  https://github.com/tornadoweb/tornado/releases/tag/v6.4.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-tornado_6.3.3.bb => python3-tornado_6.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tornado_6.3.3.bb => python3-tornado_6.4.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.3.3.bb b/meta-python/recipes-devtools/python/python3-tornado_6.4.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-tornado_6.3.3.bb
rename to meta-python/recipes-devtools/python/python3-tornado_6.4.bb
index c58742296..e3d0209e1 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_6.4.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://www.tornadoweb.org/en/stable/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "e7d8db41c0181c80d76c982aacc442c0783a2c54d6400fe028954201a2e032fe"
+SRC_URI[sha256sum] = "72291fa6e6bc84e626589f1c29d90a5a6d593ef5ae68052ee2ef000dfd273dee"
 
 inherit pypi setuptools3
 
-- 
2.34.1


