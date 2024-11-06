Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE47BD29F95
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 06:31:23 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.40128.1730874674374261092
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 22:31:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=oLbPIYmG;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1730874675; x=1762410675;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Dpw6NsjCA6Qhw31wMim5VTVslToCW8C7Y6PhZK1VO78=;
  b=oLbPIYmG2O3yFbrrHbIy7Dn72BKVUWP4ud1ErKe4FQFEiUK/YFwRe3nh
   NJqncjqyRG9tVxmG0BqWLPutgCs7cX8HdBG9UKagfSsX/nDHdCFsfuaSD
   X9LyyYoDnw7Zv6KnfZ48jJ0X8KQokB5qCgogthfMc1ABkoRT7BewWVgYY
   0AQTMJW9l0tMDmeALOdr35WqZN+O3s5UCISRbF1vNeeKCzBgj968IYonK
   EIfReoYWH8oMiRMix/Lerik1c2EGFrM918yI8mKOCyC+p0ipfoN5/znEL
   blhHfhnJlDe8PQSpLaOD+Ep24XmM1kUoTknXzub75w2N3mKfmcYq6flao
   g==;
X-CSE-ConnectionGUID: YL7h9+l0Th6PWVA29ETyNg==
X-CSE-MsgGUID: B8ddtPOzTiG5EhVnAZ603A==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="167293838"
X-IronPort-AV: E=Sophos;i="6.11,262,1725289200"; 
   d="scan'208";a="167293838"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 15:31:12 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 986A12F636
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:10 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id DD922CF7C2
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:09 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7BC2E20071A01
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:09 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2A6331A000A;
	Wed,  6 Nov 2024 14:31:09 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 09/46] libnvme: upgrade 1.10 -> 1.11
Date: Wed,  6 Nov 2024 14:30:23 +0800
Message-Id: <1730874660-2364-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
References: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28778.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28778.005
X-TMASE-Result: 10--1.001700-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mr+KgiyLtJrSBoOe42HKVRDr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3LRPJs/q8vyUIY6
	e+Xi1ah+GOq73doEniIAy6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSz98uR8uJByfZP37
	HX374HQWatiAKPFFqpVFyiEhaHvB28r1FPGTU27ZimzOyCofkHf7KpYRCwBNzW0EDZ01Yf2GMsB
	1OuxkOyiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 06:31:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113694

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/linux-nvme/libnvme/releases/tag/v1.11

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libnvme/{libnvme_1.10.bb => libnvme_1.11.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libnvme/{libnvme_1.10.bb => libnvme_1.11.bb} (94%)

diff --git a/meta-oe/recipes-support/libnvme/libnvme_1.10.bb b/meta-oe/recipes-support/libnvme/libnvme_1.11.bb
similarity index 94%
rename from meta-oe/recipes-support/libnvme/libnvme_1.10.bb
rename to meta-oe/recipes-support/libnvme/libnvme_1.11.bb
index a05d1168e..05336d2a3 100644
--- a/meta-oe/recipes-support/libnvme/libnvme_1.10.bb
+++ b/meta-oe/recipes-support/libnvme/libnvme_1.11.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://ccan/licenses/CC0;md5=c17af43b05840255a6fedc5eda9d56cc \
                     file://ccan/licenses/BSD-MIT;md5=838c366f69b72c5df05c96dff79b35f2"
 DEPENDS = "json-c"
-SRCREV = "dd51fa8550564c93436423a4d8ed4be92ae50290"
+SRCREV = "2b3cb1746451f58583408a25857ca897d18cd4ca"
 
 SRC_URI = "git://github.com/linux-nvme/libnvme;protocol=https;branch=master"
 
-- 
2.34.1


