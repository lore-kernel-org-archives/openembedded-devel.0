Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D512CC4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 08:53:04 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.28698.1701161581607735491
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 00:53:02 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="129591709"
X-IronPort-AV: E=Sophos;i="6.04,233,1695654000"; 
   d="scan'208";a="129591709"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 17:52:58 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id DC291D6186
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 17:52:56 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 2BB03CFAAD
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 17:52:56 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.149])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 09BBF8859E;
	Tue, 28 Nov 2023 17:52:54 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] thingsboard-gateway: upgrade 3.4.2 -> 3.4.3.1
Date: Tue, 28 Nov 2023 16:51:55 +0800
Message-Id: <1701161515-28771-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28024.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28024.006
X-TMASE-Result: 10--3.378900-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yQPZZctd3P4Bgl+ryMS6Q9gH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJorNUVnqixiMOMKPrF7dK57NuTKBinxl/umAN6i+va16uBqd
	FRjHdIbixfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzehSYQzY2vKWcjB
	J3RyD9eCjK5IugIyEderTA0ZqZByU1405ofLp9RADQOZwo0DHC63KXGHXaWpg1cVQ43nhNajDV8
	UMylLCTiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 08:53:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107094

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ngsboard-gateway_3.4.2.bb => thingsboard-gateway_3.4.3.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/{thingsboard-gateway_3.4.2.bb => thingsboard-gateway_3.4.3.1.bb} (95%)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.4.2.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.4.3.1.bb
similarity index 95%
rename from meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.4.2.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.4.3.1.bb
index 52bcffe71..868887a47 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.4.2.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.4.3.1.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://thingsboard.io/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
 
-SRC_URI[sha256sum] = "a54953c53c0ee72a1aa270bc018db7cc853f56ca29e2c98938ff4138109fd41a"
+SRC_URI[sha256sum] = "52e9aa97b39a3309ba5f3a2e0dc127ebe04cadfefc8eb57222a9ebd32e8faa16"
 
 inherit pypi setuptools3
 
-- 
2.34.1


