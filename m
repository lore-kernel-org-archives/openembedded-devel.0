Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B812DC04A6A
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 06:50:31 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.2318.1687157430824285363
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Jun 2023 23:50:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="109589155"
X-IronPort-AV: E=Sophos;i="6.00,254,1681138800"; 
   d="scan'208";a="109589155"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 15:50:28 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4B0E4CA1E9
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 15:50:26 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7F009D4F4D
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 15:50:25 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id B7C992FC8442;
	Mon, 19 Jun 2023 15:50:24 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-rich: upgrade 13.4.1 -> 13.4.2
Date: Mon, 19 Jun 2023 14:48:22 +0800
Message-Id: <1687157308-17342-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687157308-17342-1-git-send-email-wangmy@fujitsu.com>
References: <1687157308-17342-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27700.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27700.005
X-TMASE-Result: 10--0.999300-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mr/Eo10sZXT1Mlr/X7qYoEs76p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3Hf7mdD84mFnYPp
	eF4FI8iqxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSz6Nu6IQRgnUYbxO
	Tn3U1wSjfG2NHw76LSnaQ9WWlL+04cauFkMS/bWIUeq+omrBzLZ3TDFST2OXqRpVv8ISxz2Rwbd
	oUHZaeDiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:50:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103374

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Relaxed markdown-it-py dependency

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-rich_13.4.1.bb => python3-rich_13.4.2.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python-rich/{python3-rich_13.4.1.bb => python3-rich_13.4.2.bb} (85%)

diff --git a/meta-python/recipes-extended/python-rich/python3-rich_13.4.1.bb b/meta-python/recipes-extended/python-rich/python3-rich_13.4.2.bb
similarity index 85%
rename from meta-python/recipes-extended/python-rich/python3-rich_13.4.1.bb
rename to meta-python/recipes-extended/python-rich/python3-rich_13.4.2.bb
index 09882e629..e7ddf7098 100644
--- a/meta-python/recipes-extended/python-rich/python3-rich_13.4.1.bb
+++ b/meta-python/recipes-extended/python-rich/python3-rich_13.4.2.bb
@@ -8,7 +8,7 @@ LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b5f0b94fbc94f5ad9ae4efcf8a778303"
 
-SRC_URI[sha256sum] = "76f6b65ea7e5c5d924ba80e322231d7cb5b5981aa60bfc1e694f1bc097fe6fe1"
+SRC_URI[sha256sum] = "d653d6bccede5844304c605d5aac802c7cf9621efd700b46c7ec2b51ea914898"
 
 inherit pypi python_poetry_core
 
-- 
2.34.1


