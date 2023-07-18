Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70706EB64DD
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 04:26:16 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.686.1689654373914029342
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jul 2023 21:26:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="126111077"
X-IronPort-AV: E=Sophos;i="6.01,213,1684767600"; 
   d="scan'208";a="126111077"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 13:26:12 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id D0243D3EB4
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:09 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0ED55D5E97
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:09 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8CF9820077821;
	Tue, 18 Jul 2023 13:26:08 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-arpeggio: upgrade 2.0.0 -> 2.0.2
Date: Tue, 18 Jul 2023 12:25:23 +0800
Message-Id: <1689654348-30702-21-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
References: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27758.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27758.004
X-TMASE-Result: 10-3.504700-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyu/UKSk38cGDOik
	wR/RlN8a4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat054xHfiujuTbedp/E
	Ni4s95siBkESMI05d4iiOf1NDnCI+rWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNUfWYctxsSnFKFEgXQ6Aya5lcneMklcCQWgJPwKn51y4eTMkPxDOLVg2636k0TchwwrtP
	qusg/o669yVKkhLAaUkFUm70NminAQ5WMx/hWiMU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 04:26:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103913

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
 fix: drop deprecated setup_requires and tests_require
 fix: replace \n with \\n in error reports for matches

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-arpeggio_2.0.0.bb => python3-arpeggio_2.0.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-arpeggio_2.0.0.bb => python3-arpeggio_2.0.2.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-arpeggio_2.0.0.bb b/meta-python/recipes-devtools/python/python3-arpeggio_2.0.2.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-arpeggio_2.0.0.bb
rename to meta-python/recipes-devtools/python/python3-arpeggio_2.0.2.bb
index 96d6de6a69..1a48a88c29 100644
--- a/meta-python/recipes-devtools/python/python3-arpeggio_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-arpeggio_2.0.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/Arpeggio/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=33b8d1ba459a2fa4d801acfd1d1b7ceb"
 
-SRC_URI[sha256sum] = "d6b03839019bb8a68785f9292ee6a36b1954eb84b925b84a6b8a5e1e26d3ed3d"
+SRC_URI[sha256sum] = "c790b2b06e226d2dd468e4fbfb5b7f506cec66416031fde1441cf1de2a0ba700"
 
 PYPI_PACKAGE = "Arpeggio"
 inherit pypi setuptools3
-- 
2.34.1


