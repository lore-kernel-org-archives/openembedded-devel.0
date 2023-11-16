Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8358BC197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 08:10:56 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.2629.1700122254038066543
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 00:10:54 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="139897362"
X-IronPort-AV: E=Sophos;i="6.03,307,1694703600"; 
   d="scan'208";a="139897362"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 17:10:52 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id DFC3FD64A7
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 17:10:49 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 12457D6027
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 17:10:49 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id E4EC52FC703D;
	Thu, 16 Nov 2023 17:10:47 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-awesomeversion: upgrade 23.8.0 -> 23.11.0
Date: Thu, 16 Nov 2023 16:10:09 +0800
Message-Id: <1700122209-21889-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28000.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28000.003
X-TMASE-Result: 10-0.759300-10.000000
X-TMASE-MatchedRID: QR1SVCCbVGSjz0nOeth/yUIIxwDaU5mrJ7Rnqmx7r5v+Aw16GgqpO+z7
	d6pPgEtrPQy6oQaP4bF/KLaJof5FWz879zET5UZx34e73Z9qT+uR1LeQ+VpnJVSOymiJfTYXfDo
	fTpsyCK+XjR6JyN6uluJ1bGVFUFjBxEEtnnH5KRc/QdUh6LEl0DeXamXCCu1YIPUd1fKoOcQPn4
	RjXbQDehab+AC2MJ3sBhQWw3lZ+IXW/qXiYia/It0KiTeJteVBfS0Ip2eEHnwj/1Rbkzl1E2nuo
	SGaY+DLjoczmuoPCq1sNip+V54bOj0MbVIV3iD6Lbn3Lpc0cWR4jNC6g3P67PoKrcEG7WUl0Vb6
	8eYbtKR9M4578vFtQTgytxlbFjFgy4vEZrGKA30dJuEZuYbKVcUkrvIudlEZl07dDrsiYvyCLhF
	TP3QRDAbYwClu/qh3
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 08:10:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106785

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Update lockfile
-Set checkout depth to 0 in codecov action
-Force string when checking diff
-Add snapshot testing
-Allow PEP440 to access major/minor/patch properties
-Remove diff snapshots
-Fix sections property with blank string
-Remove base class workaround

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...esomeversion_23.8.0.bb => python3-awesomeversion_23.11.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-awesomeversion_23.8.0.bb => python3-awesomeversion_23.11.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-awesomeversion_23.8.0.bb b/meta-python/recipes-devtools/python/python3-awesomeversion_23.11.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-awesomeversion_23.8.0.bb
rename to meta-python/recipes-devtools/python/python3-awesomeversion_23.11.0.bb
index 6fd1364ad..67b78c9e9 100644
--- a/meta-python/recipes-devtools/python/python3-awesomeversion_23.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-awesomeversion_23.11.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE.md;md5=92622b5a8e216099be741d78328bae5d"
 
-SRC_URI[sha256sum] = "d788b2917a716adb912ba1c31b831aedd4c37858fcfe080105dc8da30c2e21c3"
+SRC_URI[sha256sum] = "9146329196f0f045887de6c195730750f8f7a9302d1c149378db73ab5dc468f0"
 
 RDEPENDS:${PN} += "python3-profile python3-logging"
 
-- 
2.34.1


