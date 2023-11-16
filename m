Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC697C47071
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 08:48:56 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.3056.1700124534462613015
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 00:48:54 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="127887349"
X-IronPort-AV: E=Sophos;i="6.03,307,1694703600"; 
   d="scan'208";a="127887349"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 17:48:51 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 79A03D6186
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 17:48:49 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id B657CE6474
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 17:48:48 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D9A0670B02;
	Thu, 16 Nov 2023 17:48:47 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] unbound: upgrade 1.18.0 -> 1.19.0
Date: Thu, 16 Nov 2023 16:43:46 +0800
Message-Id: <1700124226-22824-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28000.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28000.003
X-TMASE-Result: 10--1.001700-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mr+KgiyLtJrSBoOe42HKVRDr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3LRPJs/q8vyUIY6
	e+Xi1ah9bJcQH3furV3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w5oQ6
	aos7tRkaAcQ1qde3XCkqvd6JbwiY80xqWUJrfydOjRrdP6X06Wk90UleD4homQEh8dNPHYgD31Y
	1Pqecjeuwc/vFp3RAWCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 08:48:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106807

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/NLnetLabs/unbound/releases/tag/release-1.19.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../unbound/{unbound_1.18.0.bb => unbound_1.19.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/unbound/{unbound_1.18.0.bb => unbound_1.19.0.bb} (96%)

diff --git a/meta-networking/recipes-support/unbound/unbound_1.18.0.bb b/meta-networking/recipes-support/unbound/unbound_1.19.0.bb
similarity index 96%
rename from meta-networking/recipes-support/unbound/unbound_1.18.0.bb
rename to meta-networking/recipes-support/unbound/unbound_1.19.0.bb
index 179af8050..ed8c5bd97 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.18.0.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.19.0.bb
@@ -10,7 +10,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5308494bc0590c0cb036afd781d78f06"
 
 SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=master"
-SRCREV = "3795e374107ac7a5a977c516e144a3cd9b0da998"
+SRCREV = "3352b1090ea1098883f6bf64236fa877e18e458b"
 
 inherit autotools pkgconfig systemd update-rc.d
 
-- 
2.34.1


