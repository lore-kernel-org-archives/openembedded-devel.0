Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE9DEC001B0
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 01:46:35 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.152096.1692150387400355136
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Aug 2023 18:46:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="115966874"
X-IronPort-AV: E=Sophos;i="6.01,175,1684767600"; 
   d="scan'208";a="115966874"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 10:46:25 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3F2E3C68E8
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:46:23 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7DBDBCFBCA
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:46:22 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id EE4C520050193;
	Wed, 16 Aug 2023 10:46:21 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pymisp: upgrade 2.4.173 -> 2.4.174
Date: Wed, 16 Aug 2023 09:45:59 +0800
Message-Id: <1692150359-5748-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27816.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27816.003
X-TMASE-Result: 10--1.865700-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mr/1vXbkGjWeWAI7Mvq/sL53w6
	H06bMgivUmd9UAGWwK0Nyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG21vZ
	7s3YIVDI3lq3YEgY6Jjrmb2Z4b9ZLAJn6tVHL2HJvTnqYKYXTRlXgGeVUh3WdmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibJ0RPnyOnrZIzO/arghhMrK7hzFJ9NDx91s0QNhY8UXww2uuthQn2kBrt+
	bVCdKUMBx4BeVRVAuyGD1IaXCqtV6ZS+Geyt4nq19TajkfHBn1Lv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 01:46:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104395

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Bump version, templates.
- Bump deps, fix code accordingly.
- Push code changes related to deps upgrade... 

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymisp_2.4.173.bb => python3-pymisp_2.4.174.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.173.bb => python3-pymisp_2.4.174.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.173.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.174.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.173.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.174.bb
index 10cc52a7e9..d6ab0d6a88 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.173.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.174.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
 SRC_URI = "git://github.com/MISP/PyMISP.git;protocol=https;branch=main"
-SRCREV = "ccae32ae716c143bea09954e860238e193bc78c6"
+SRCREV = "94983c01ecced6086df28133a38a297111534142"
 S = "${WORKDIR}/git"
 
 inherit python_poetry_core
-- 
2.34.1


