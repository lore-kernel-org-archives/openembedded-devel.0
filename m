Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58180C27C40
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 08:16:54 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.6343.1692865006434285400
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Aug 2023 01:16:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="128796835"
X-IronPort-AV: E=Sophos;i="6.01,195,1684767600"; 
   d="scan'208";a="128796835"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 17:16:43 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0BC6CDDC61
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 17:16:40 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4691DD9496
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 17:16:39 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5EC0A2FC85E6;
	Thu, 24 Aug 2023 17:16:38 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pycocotools: upgrade 2.0.6 -> 2.0.7
Date: Thu, 24 Aug 2023 16:15:56 +0800
Message-Id: <1692864956-2787-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27832.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27832.006
X-TMASE-Result: 10-1.001800-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0Z3QqJN4m15UF9LQinZ4QefCP/VFuTOXUTae6
	hIZpj4MuOhzOa6g8KrV5ACWeurkLfRXuNPof5MaKFJ5Jzo15fPt7OTA4iteVob6uCK3q1LhVFii
	m6BqmyzdU7C+AS/772dhyTIJtTje4U0lylli2pyB0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 08:16:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104576

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-pycocotools_2.0.6.bb => python3-pycocotools_2.0.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pycocotools_2.0.6.bb => python3-pycocotools_2.0.7.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pycocotools_2.0.6.bb b/meta-python/recipes-devtools/python/python3-pycocotools_2.0.7.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pycocotools_2.0.6.bb
rename to meta-python/recipes-devtools/python/python3-pycocotools_2.0.7.bb
index 16d7721ee3..bebfb128f2 100644
--- a/meta-python/recipes-devtools/python/python3-pycocotools_2.0.6.bb
+++ b/meta-python/recipes-devtools/python/python3-pycocotools_2.0.7.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://pycocotools/coco.py;beginline=45;endline=45;md5=12cb5
 
 inherit setuptools3 pypi
 
-SRC_URI[sha256sum] = "7fe089b05cc18e806dcf3bd764708d86dab922a100f3734eb77fb77a70a1d18c"
+SRC_URI[sha256sum] = "da8b7815196eebf0adabf67fcc459126cbc6498bbc6ab1fd144c371465d86879"
 
 DEPENDS = "python3-cython-native python3-numpy-native virtual/crypt"
 RDEPENDS:${PN} = "python3-matplotlib python3-pillow python3-profile"
-- 
2.34.1


