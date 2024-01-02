Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB4CAC46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 07:07:25 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.24365.1704179236885175416
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jan 2024 23:07:17 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="145060507"
X-IronPort-AV: E=Sophos;i="6.04,324,1695654000"; 
   d="scan'208";a="145060507"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2024 16:07:14 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3A46ED2A02
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jan 2024 16:07:12 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 36AE1CA27D
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jan 2024 16:07:11 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C6E6E2008E698
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jan 2024 16:07:10 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6295F1A0070;
	Tue,  2 Jan 2024 15:07:10 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-cantools: upgrade 39.4.1 -> 39.4.2
Date: Tue,  2 Jan 2024 15:06:55 +0800
Message-Id: <1704179215-8066-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28094.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28094.005
X-TMASE-Result: 10-2.245600-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrYdBG+bhhiNTVtKZKT0dQ2r6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74D4qCLIu0mtIGAN6i+va16uBqd
	FRjHdIbixfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzoHwRIZEIhZjn3V
	r2gBX4SyKI8SspBCbaKoF8z1sIOERR0AbCbphmJ4AsEMer2hi38NOil+t76+xp9xsRTq64sARmt
	O+xH4bHiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jan 2024 07:07:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107999

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fix range check with negative scalings

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-cantools_39.4.1.bb => python3-cantools_39.4.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cantools_39.4.1.bb => python3-cantools_39.4.2.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-cantools_39.4.1.bb b/meta-python/recipes-devtools/python/python3-cantools_39.4.2.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-cantools_39.4.1.bb
rename to meta-python/recipes-devtools/python/python3-cantools_39.4.2.bb
index e26405dd7..ad2025e64 100644
--- a/meta-python/recipes-devtools/python/python3-cantools_39.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cantools_39.4.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/eerimoq/cantools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
 
-SRC_URI[sha256sum] = "98c4d007a6d9803c6433c743c0240e73de930530f8255e1e21d2e20e8991a30b"
+SRC_URI[sha256sum] = "8069a8f473bb1679990bea0903f3a22d58df5495aebbf09f58d49f627511b619"
 
 PYPI_PACKAGE = "cantools"
 
-- 
2.34.1


