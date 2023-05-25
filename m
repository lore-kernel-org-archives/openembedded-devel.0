Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 671C2C7EE2E
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 06:57:57 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.6209.1684997868112515576
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 23:57:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="105955030"
X-IronPort-AV: E=Sophos;i="6.00,190,1681138800"; 
   d="scan'208";a="105955030"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 15:57:46 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 62C06D772C
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:57:44 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id A0094D3F37
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:57:43 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id D1F762FC91FB;
	Thu, 25 May 2023 15:57:42 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pulsectl: upgrade 23.5.1 -> 23.5.2
Date: Thu, 25 May 2023 14:57:31 +0800
Message-Id: <1684997851-2098-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1684997851-2098-1-git-send-email-wangmy@fujitsu.com>
References: <1684997851-2098-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27648.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27648.005
X-TMASE-Result: 10-1.473700-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrYdBG+bhhiNSU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNnVTWWiNp+v8QhNjZQYyI3Cl6ppmExqcYlIO
	VA+gJRdKxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSz41JEt4luZL+J+Q
	bL7zK+WNC9w1+BC85+wWVfkDgXumwAQ+25K5IyTgDJiHb0iyrPoXK3uqVFLbwLmjsFE0iZHBjXB
	vZN5CfWiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 06:57:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102830

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  Fix incorrect type for PA_SAMPLE_SPEC.channels, affecting big-endian architectures

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pulsectl_23.5.1.bb => python3-pulsectl_23.5.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pulsectl_23.5.1.bb => python3-pulsectl_23.5.2.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pulsectl_23.5.1.bb b/meta-python/recipes-devtools/python/python3-pulsectl_23.5.2.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pulsectl_23.5.1.bb
rename to meta-python/recipes-devtools/python/python3-pulsectl_23.5.2.bb
index ca4cdce22..4da72904f 100644
--- a/meta-python/recipes-devtools/python/python3-pulsectl_23.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pulsectl_23.5.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/mk-fg/python-pulse-control"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f1d10048469ff90123263eb5e214061d"
 
-SRC_URI[sha256sum] = "8efc260ed7212ee4f9e50a8b856c84911265f4eac42cc6c02c7b37c851a2834b"
+SRC_URI[sha256sum] = "e911d398eaf0539cf3c63b4217357b51a3d1b7e4a50607d1591cf2b49f5d2c6a"
 
 RDEPENDS:${PN} += " \
 	libpulse \
-- 
2.34.1


