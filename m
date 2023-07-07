Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A171C001E0
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 03:14:17 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.4899.1688699647226579111
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jul 2023 20:14:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="111930526"
X-IronPort-AV: E=Sophos;i="6.01,187,1684767600"; 
   d="scan'208";a="111930526"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 12:14:10 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5F45AD29E1
	for <openembedded-devel@lists.openembedded.org>; Fri,  7 Jul 2023 12:14:08 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 90200D55E0
	for <openembedded-devel@lists.openembedded.org>; Fri,  7 Jul 2023 12:14:07 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id A6F7387E03;
	Fri,  7 Jul 2023 12:14:06 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] thingsboard-gateway: upgrade 3.2 -> 3.3
Date: Fri,  7 Jul 2023 11:13:35 +0800
Message-Id: <1688699627-2519-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1688699627-2519-1-git-send-email-wangmy@fujitsu.com>
References: <1688699627-2519-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27736.002
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27736.002
X-TMASE-Result: 10--1.792100-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrCZa9cSpBOblJEjJjpEhCn0nr
	DDSVv0HOjD2u30TwDiiQnFvl7AMut3hgNuVRdcUTA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYgB/8cibO8IY0Dg2p0ztpjSDIpcBQ49iRAFA6pSxaDHmgW6bY8SOq3WjxY
	yRBa/qJShNCXvA0fw+jaPj0W1qn0TGVuWouVipcpHFPZwbarMF3ZPXwYwbCrr7+BdsKWX97Vls5
	Hjg5g4MjqrtgZXFEeN4f3rVUKTVwiHb1vttoJm7sPyfBNp70YSBw3HtM14B4f6/2/nZkihaOgB/
	fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jul 2023 03:14:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103696

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Added data duplicate detector
Added statistics files examples for different OS
Added minEventsProcess parameter
Added Gateway Shell
Added device filtering
Fixed reconnecting
Added device provisioning
Added converter remote configuration update
General Improvements

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{thingsboard-gateway_3.2.bb => thingsboard-gateway_3.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/{thingsboard-gateway_3.2.bb => thingsboard-gateway_3.3.bb} (95%)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.2.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.3.bb
similarity index 95%
rename from meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.2.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.3.bb
index 7c3197778f..0987522ac8 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.2.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.3.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://thingsboard.io/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
 
-SRC_URI[sha256sum] = "06fdb1000cb3f25ff78a2441c0e0f9e5bb2abec3eff907d57f58c1709c110217"
+SRC_URI[sha256sum] = "4d27661113c54e3b0998328f15ca7fd9e4837d1975c7c213595cb940f4b11484"
 
 inherit pypi setuptools3
 
-- 
2.34.1


