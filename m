Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3BA2C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 08:55:36 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.17819.1702544129251257361
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 00:55:29 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="144920911"
X-IronPort-AV: E=Sophos;i="6.04,274,1695654000"; 
   d="scan'208";a="144920911"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 17:55:26 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 8295BE8D8A
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 17:55:23 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id A3E68D63DF
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 17:55:22 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.165])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7C74286A76;
	Thu, 14 Dec 2023 17:55:21 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-auth: upgrade 2.23.4 -> 2.25.2
Date: Thu, 14 Dec 2023 16:55:13 +0800
Message-Id: <1702544113-27952-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28056.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28056.006
X-TMASE-Result: 10--1.038300-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyuvGtPCFlL+hjDt
	KfcvtYTm6zBPuCbw++mKqj/Q4qKOvKT4BhrRHlF4EhGH3CRdKUWyiNuZzgQ4vJ28ggsYZGPVg9x
	e4gtUJtrQZQHRdaJJZAXURz+hQhGVWkIi5GvRHEpO5y1KmK5bJTZlY6a4lRLZYA3qL69rXq4Gp0
	VGMd0huFslxAfd+6tXeTjw/FyRX6QfE8yM4pjsDwtuKBGekqUpnH7sbImOEBSQmczkWNja5Ugn5
	mtXYQFjBvM5N14KpM7lWqiWcpCyen/gkgwFsw7+aq0P+CdUKHPtEY1xjf+lV7dzsUR3ZxPkqKEB
	knHgC3zsfZ9V6Q6rCZgvUoiYqGrVm457vI8IG8B/Y4nFsBWAdD6Qrn3xh/cy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 08:55:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107436

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Fix user cred universe domain issue
-Fix vm universe_domain bug
-Add custom tls signer for ECP Provider.
-Add custom tls signer for ECP Provider.
-Add with_universe_domain
-Fixes issue where Python37DeprecationWarning cannot be filtered
-Remove broken link in Python37DeprecationWarning
-Add support for Python 3.12
-Add universe domain support for VM cred
-Modify the token refresh window
-Add missing before request to async oauth2 credentials.
-Auto create self signed jwt cred
-Migrate datetime.utcnow for python 3.12
-Update user cred doc

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-google-auth_2.23.4.bb => python3-google-auth_2.25.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.23.4.bb => python3-google-auth_2.25.2.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.23.4.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.25.2.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.23.4.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.25.2.bb
index c7bf2857a..2f527611e 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.23.4.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.25.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "79905d6b1652187def79d491d6e23d0cbb3a21d3c7ba0dbaa9c8a01906b13ff3"
+SRC_URI[sha256sum] = "42f707937feb4f5e5a39e6c4f343a17300a459aaf03141457ba505812841cc40"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-asyncio \
-- 
2.34.1


