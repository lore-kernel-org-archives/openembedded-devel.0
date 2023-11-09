Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EAD7C4167D
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 04:39:12 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.115035.1699504748441606487
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Nov 2023 20:39:08 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="127385559"
X-IronPort-AV: E=Sophos;i="6.03,288,1694703600"; 
   d="scan'208";a="127385559"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 13:39:05 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3FD4FDCB68
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Nov 2023 13:39:03 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6DB5BD5E2D
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Nov 2023 13:39:02 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5474386D4E;
	Thu,  9 Nov 2023 13:39:01 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-argh: upgrade 0.30.3 -> 0.30.4
Date: Thu,  9 Nov 2023 12:37:54 +0800
Message-Id: <1699504674-16496-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27986.002
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27986.002
X-TMASE-Result: 10--0.414600-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mr2FA7wK9mP9fdtCoZAk3E1Lm9
	PM3V9QryEpOBzVcqqX4Nyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG21vZ
	7s3YIVDJRFHBShklV4UC4xNfx9paorWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNQBzqJ7g6EUBc5ySt7kqPaX17CGq41NvUq1cK7RMUcjt+ECA3IAIZKHzIw3DvcmXk1mi+
	QnIOMk/E6ixbEUod3oJ+TtgqQ0d3WJbZ4D2dIMgU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Nov 2023 04:39:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106500

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
-The handling introduced in v.0.30.2 (raising an exception for clarity)
 is retained for cases when no name mapping policy is specified but function
 signature contains defaults in non-kwonly args and kwonly args are also
 defined

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-argh_0.30.3.bb => python3-argh_0.30.4.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-argh_0.30.3.bb => python3-argh_0.30.4.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-argh_0.30.3.bb b/meta-python/recipes-devtools/python/python3-argh_0.30.4.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-argh_0.30.3.bb
rename to meta-python/recipes-devtools/python/python3-argh_0.30.4.bb
index 33e159738..82cfa3b8e 100644
--- a/meta-python/recipes-devtools/python/python3-argh_0.30.3.bb
+++ b/meta-python/recipes-devtools/python/python3-argh_0.30.4.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=3000208d539ec061b899bce1d9ce9404 \
                     file://README.rst;beginline=261;endline=275;md5=39ec83a704aed9f33618c5d04e478a08 \
                     "
 
-SRC_URI[sha256sum] = "68a276bfe670c658a080eedb3f656cc2a1772a656818396d580dc752a18d31c9"
+SRC_URI[sha256sum] = "9fca8e69c4dad4f8d2a7bdfbdd80b0754462b53510a03e1b5cf2b43a87e6e960"
 
 inherit pypi python_flit_core
 
-- 
2.34.1


