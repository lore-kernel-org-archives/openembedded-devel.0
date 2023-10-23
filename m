Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A144C00A8F
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 23:39:05 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.6635.1698104343792811759
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 16:39:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="125584401"
X-IronPort-AV: E=Sophos;i="6.03,246,1694703600"; 
   d="scan'208";a="125584401"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 08:39:00 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id DD5AECA1E9
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Oct 2023 08:38:58 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1458AD88AF
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Oct 2023 08:38:58 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 48D942005A580;
	Tue, 24 Oct 2023 08:38:57 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-tzlocal: upgrade 5.0.1 -> 5.1
Date: Tue, 24 Oct 2023 07:38:45 +0800
Message-Id: <1698104325-31903-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27954.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27954.003
X-TMASE-Result: 10--0.119300-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrsk61leL8Ml/Rnp8Qx+pp65Ky
	Pf1j7t43OelJXrqHws0ScHHX0rLXBO1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQ7m0
	K7bkUDKINUccATRyd1KEfeQTpODV8eBzEkCCpnRndCok3ibXlQX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtc9o1Cvv/ghAegBmcsc0nM6XNFUjOhBpUpD9sop/fXZ08llVNbecy1TlMQ
	zlzQrk67cszAwas5n/+RqjSEnSxquTyQN6kyz3zHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 23:39:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105700

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
- The Unicode data doesn't change tz names when IANA does, so what is current
  in IANA is treated as an alias in Unicode data. This version handles that.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-tzlocal_5.0.1.bb => python3-tzlocal_5.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tzlocal_5.0.1.bb => python3-tzlocal_5.1.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-tzlocal_5.0.1.bb b/meta-python/recipes-devtools/python/python3-tzlocal_5.1.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-tzlocal_5.0.1.bb
rename to meta-python/recipes-devtools/python/python3-tzlocal_5.1.bb
index 9673c5d0ea..2f69000b3a 100644
--- a/meta-python/recipes-devtools/python/python3-tzlocal_5.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-tzlocal_5.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/tzlocal/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=57e0bd61643d81d05683cdce65b11d10"
 
-SRC_URI[sha256sum] = "46eb99ad4bdb71f3f72b7d24f4267753e240944ecfc16f25d2719ba89827a803"
+SRC_URI[sha256sum] = "a5ccb2365b295ed964e0a98ad076fe10c495591e75505d34f154d60a7f1ed722"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


