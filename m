Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0387CDB474
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 08:41:09 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.116053.1698050461407041322
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 01:41:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="138662182"
X-IronPort-AV: E=Sophos;i="6.03,244,1694703600"; 
   d="scan'208";a="138662182"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 17:40:59 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id DEA85D9DAC
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:40:56 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 25FB2D39CC
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:40:56 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 135012FC7AED;
	Mon, 23 Oct 2023 17:40:54 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-executing: upgrade 1.2.0 -> 2.0.0
Date: Mon, 23 Oct 2023 16:40:43 +0800
Message-Id: <1698050443-25503-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27952.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27952.006
X-TMASE-Result: 10-0.060600-10.000000
X-TMASE-MatchedRID: V7gFd1X8+4Wjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmK2oB9n2uCv2uVHGbcDbAq6FEUknJ/kEl6YwzE9E8g5OfoLR4+zsDTtCQv
	lWYtoEBFNstvUzdtv6zAcmJ/+MZS5Gm2nfk/yjCfr4CTcWMhUDIVCs7SCI8e7hqAacY2wuX/vnu
	AiycSs5t+7sAJWwS/7rJ52MgWboPvyDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgAQ4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 08:41:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105663

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-executing_1.2.0.bb => python3-executing_2.0.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-executing_1.2.0.bb => python3-executing_2.0.0.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-executing_1.2.0.bb b/meta-python/recipes-devtools/python/python3-executing_2.0.0.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-executing_1.2.0.bb
rename to meta-python/recipes-devtools/python/python3-executing_2.0.0.bb
index 89f935c672..4c4fd45166 100644
--- a/meta-python/recipes-devtools/python/python3-executing_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-executing_2.0.0.bb
@@ -6,4 +6,4 @@ DEPENDS = "python3-setuptools-scm-native"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "19da64c18d2d851112f09c287f8d3dbbdf725ab0e569077efb6cdcbd3497c107"
+SRC_URI[sha256sum] = "0ff053696fdeef426cda5bd18eacd94f82c91f49823a2e9090124212ceea9b08"
-- 
2.34.1


