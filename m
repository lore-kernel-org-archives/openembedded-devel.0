Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C575C001DD
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 07:14:25 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.7501.1687850054807051387
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jun 2023 00:14:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="101771688"
X-IronPort-AV: E=Sophos;i="6.01,161,1684767600"; 
   d="scan'208";a="101771688"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 16:14:18 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 073D6DDC64
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 16:14:16 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3C9AABF4AA
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 16:14:15 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4DBDC88D20;
	Tue, 27 Jun 2023 16:14:14 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-aenum: upgrade 3.1.12 -> 3.1.14
Date: Tue, 27 Jun 2023 15:12:07 +0800
Message-Id: <1687849939-19941-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687849939-19941-1-git-send-email-wangmy@fujitsu.com>
References: <1687849939-19941-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27716.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27716.005
X-TMASE-Result: 10-3.825100-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGGzQB0xBvE+luce7gFxhKa0BQOqUsWgx5oFum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e1cppCzPq+1UxlblqLlYqXIoz9nGMtmdWyZVmQrKTynHVY4ko5g4jurQrO
	UmC8wTKa9VTo+B1DE99vcLGmriSs8kFFucp/gi1Ih0nRdI6aCG9Qfogl5jnbb+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 07:14:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103600

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-aenum_3.1.12.bb => python3-aenum_3.1.14.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aenum_3.1.12.bb => python3-aenum_3.1.14.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-aenum_3.1.12.bb b/meta-python/recipes-devtools/python/python3-aenum_3.1.14.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-aenum_3.1.12.bb
rename to meta-python/recipes-devtools/python/python3-aenum_3.1.14.bb
index e3c43823e9..22b3c52f2f 100644
--- a/meta-python/recipes-devtools/python/python3-aenum_3.1.12.bb
+++ b/meta-python/recipes-devtools/python/python3-aenum_3.1.14.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/aenum/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://aenum/LICENSE;md5=c6a85477543f8b8591b9c1f82abebbe9"
 
-SRC_URI[sha256sum] = "3e531c91860a81f885f7e6e97d219ae9772cb899580084788935dad7d9742ef0"
+SRC_URI[sha256sum] = "7c4b04b5c9621533d6311e6ca23ea2ee213c7a992ed0be79a2b944cdaf2a45ec"
 
 inherit pypi setuptools3
 
-- 
2.34.1


