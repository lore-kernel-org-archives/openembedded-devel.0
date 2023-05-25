Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B5D0C7EE31
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 06:57:47 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.6207.1684997865706388716
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 23:57:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="96646853"
X-IronPort-AV: E=Sophos;i="6.00,190,1681138800"; 
   d="scan'208";a="96646853"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 15:57:43 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 54609DDC62
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:57:41 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 85713156D6
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:57:40 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id B06812FC91FB;
	Thu, 25 May 2023 15:57:39 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-dominate: upgrade 2.7.0 -> 2.8.0
Date: Thu, 25 May 2023 14:57:26 +0800
Message-Id: <1684997851-2098-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1684997851-2098-1-git-send-email-wangmy@fujitsu.com>
References: <1684997851-2098-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27648.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27648.005
X-TMASE-Result: 10-2.001400-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrTfK5j0EZbys8a+/GjoiAqr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74CDy+T4Lu/PHmAN6i+va16uBqd
	FRjHdIbixfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzKTWBoStwoedZ86
	i7svLDgp1dV/TZQ8y5kEciI8TdK2O7sNBVShV3pNcVA7vgx3cVpmiMVXJwz/zSiHwVluYmLdBAD
	ZfcLyNLiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 06:57:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102824

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  Fix incorrect context handling when a tag is used 2+ levels deeper than it was created.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-dominate_2.7.0.bb => python3-dominate_2.8.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-dominate_2.7.0.bb => python3-dominate_2.8.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-dominate_2.7.0.bb b/meta-python/recipes-devtools/python/python3-dominate_2.8.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-dominate_2.7.0.bb
rename to meta-python/recipes-devtools/python/python3-dominate_2.8.0.bb
index bee89ed75..73701ec72 100644
--- a/meta-python/recipes-devtools/python/python3-dominate_2.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dominate_2.8.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Dominate is a Python library for creating and manipulating HTML docum
 LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b52f2d57d10c4f7ee67a7eb9615d5d24"
 
-SRC_URI[sha256sum] = "520101360892ebf9d0553f67d37e359ff92403d8a1e33814030503088a05da49"
+SRC_URI[sha256sum] = "4c90c3befaf88e612b71f4b39af7bcbef8977acfa855cec957225a8fbf504007"
 
 inherit pypi setuptools3 ptest
 
-- 
2.34.1


