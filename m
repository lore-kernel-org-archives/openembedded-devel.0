Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D298EB64DD
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 07:42:28 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.7641.1690875746764236702
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Aug 2023 00:42:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="126613542"
X-IronPort-AV: E=Sophos;i="6.01,246,1684767600"; 
   d="scan'208";a="126613542"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 16:42:26 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 46368CA1E9
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:23 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7C24FD5D15
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:22 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 02DCB10232;
	Tue,  1 Aug 2023 16:42:21 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-marshmallow: upgrade 3.19.0 -> 3.20.1
Date: Tue,  1 Aug 2023 15:41:48 +0800
Message-Id: <1690875717-21608-28-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
References: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27786.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27786.005
X-TMASE-Result: 10--0.650200-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrTfK5j0EZbytHbPZGpUWEGr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3LKeTtOdjMy6ATZ
	fNN7GqKjtAdDE/EtBJIAy6p60ZV62To3UJuRLIoTdB/CxWTRRu+rAZ8KTspSzAMAImaG6Nimfgy
	q+Padir53Zu/DSdfHOiYHA4ppPlOvpapYUMv+NXufBr0m1UBVTeybH93Z3xVHR3prxOwWx0Gduc
	Iqlo+cGiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Aug 2023 07:42:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104190

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fix call to get_declared_fields: pass dict_cls again

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-marshmallow_3.19.0.bb => python3-marshmallow_3.20.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-marshmallow_3.19.0.bb => python3-marshmallow_3.20.1.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-marshmallow_3.19.0.bb b/meta-python/recipes-devtools/python/python3-marshmallow_3.20.1.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-marshmallow_3.19.0.bb
rename to meta-python/recipes-devtools/python/python3-marshmallow_3.20.1.bb
index 91f6462b35..5024b25122 100644
--- a/meta-python/recipes-devtools/python/python3-marshmallow_3.19.0.bb
+++ b/meta-python/recipes-devtools/python/python3-marshmallow_3.20.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "\
 
 SRC_URI = "git://github.com/marshmallow-code/marshmallow.git;protocol=https;branch=dev"
 
-SRCREV = "78edf5582ee325bba99f097cb7167ef73b6f84d8"
+SRCREV = "dda9a8014dfe1bcb35e21307cfd5a8e19615a284"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


