Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5A05C072A2
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 06:28:15 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.13737.1700634486677145219
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Nov 2023 22:28:07 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="128197691"
X-IronPort-AV: E=Sophos;i="6.04,218,1695654000"; 
   d="scan'208";a="128197691"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 15:28:04 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id C89E9E4946
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 15:28:01 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id F151BD9491
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 15:28:00 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id EAB7B2FC843A;
	Wed, 22 Nov 2023 15:27:59 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-imageio: upgrade 2.32.0 -> 2.33.0
Date: Wed, 22 Nov 2023 14:23:08 +0800
Message-Id: <1700634188-8037-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28012.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28012.005
X-TMASE-Result: 10-2.010600-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrXs5nqGvDCfN7c1y+5T8A/zol
	6Yfi0eMdCs57sNpjyhgNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG2h+t
	oLLKXwRGBkESMI05d4iiOf1NDnCI+rWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNd9+1CrHH+K0EueU7A4VirSrO8SlwG4R+qPxNhtAzxDtGFnwROyrO4xSn2vPzG8jKqO/o
	u5vKNDFBu5eGQL/qGwI5IMgUVIpH4ByMfv2BEtbU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 06:28:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106999

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Update pyav plugin to reflect AV changes
-Unpin Pillow and allow versions >=10.1.0
-Support for AVIF image format

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-imageio_2.32.0.bb => python3-imageio_2.33.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-imageio_2.32.0.bb => python3-imageio_2.33.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.32.0.bb b/meta-python/recipes-devtools/python/python3-imageio_2.33.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-imageio_2.32.0.bb
rename to meta-python/recipes-devtools/python/python3-imageio_2.33.0.bb
index fa0c4b591..f6275754b 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.32.0.bb
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.33.0.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=24cb9a367a9e641b459a01c4d15256ba"
 
-SRC_URI[sha256sum] = "e425ad36c605308d9ea6d93eda7b0987926059b8b86220e142a599a7975128dd"
+SRC_URI[sha256sum] = "39999d05eb500089e60be467dd7d618f56e142229b44c3961c2b420eeb538d7e"
 
 inherit pypi setuptools3
 
-- 
2.34.1


