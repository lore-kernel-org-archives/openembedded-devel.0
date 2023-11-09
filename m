Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB1E9C4332F
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 05:36:42 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.115421.1699508196796857280
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Nov 2023 21:36:37 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="118470733"
X-IronPort-AV: E=Sophos;i="6.03,288,1694703600"; 
   d="scan'208";a="118470733"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 14:36:35 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id AFA26E8D35
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Nov 2023 14:36:31 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id EDC58D9C5F
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Nov 2023 14:36:30 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 385696B808;
	Thu,  9 Nov 2023 14:36:30 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-jsbeautifier: upgrade 1.14.9 -> 1.14.11
Date: Thu,  9 Nov 2023 13:35:54 +0800
Message-Id: <1699508154-16971-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27986.002
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27986.002
X-TMASE-Result: 10-2.463800-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy6avPqv3X7/XOwpfLMeBwRtV4BnlVId1nZsoi2XrUn/J8m+
	hzBStantdY+ZoWiLImydET58jp62SPGN22SZTL5Z1W2Q92VeqcNVtTkUc5dka0nXp6uLKotuDwz
	1FwOWHYfFxe4V/MRTKM9+0DFcVxrvkWCwBiRm87Z5w0fxE6QLpS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Nov 2023 05:36:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106504

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...3-jsbeautifier_1.14.9.bb => python3-jsbeautifier_1.14.11.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-jsbeautifier_1.14.9.bb => python3-jsbeautifier_1.14.11.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-jsbeautifier_1.14.9.bb b/meta-python/recipes-devtools/python/python3-jsbeautifier_1.14.11.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-jsbeautifier_1.14.9.bb
rename to meta-python/recipes-devtools/python/python3-jsbeautifier_1.14.11.bb
index ac3c4319c..7b438778e 100644
--- a/meta-python/recipes-devtools/python/python3-jsbeautifier_1.14.9.bb
+++ b/meta-python/recipes-devtools/python/python3-jsbeautifier_1.14.11.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "c738ebc36b47bd94e4ca6dd17a9004c3cc74edad582ca1d60e0e5d5945a63cb9"
+SRC_URI[sha256sum] = "6b632581ea60dd1c133cd25a48ad187b4b91f526623c4b0fb5443ef805250505"
 
 PYPI_PACKAGE="jsbeautifier"
 
-- 
2.34.1


