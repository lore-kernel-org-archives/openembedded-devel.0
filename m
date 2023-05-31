Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B44A3C77B7A
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 07:40:50 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.8610.1685518848320459906
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 00:40:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="97671602"
X-IronPort-AV: E=Sophos;i="6.00,205,1681138800"; 
   d="scan'208";a="97671602"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 16:40:45 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id E0423C68E4
	for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 16:40:43 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 36289D67B2
	for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 16:40:43 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id AA76468957;
	Wed, 31 May 2023 16:40:42 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-license-expression: upgrade 30.1.0 -> 30.1.1
Date: Wed, 31 May 2023 15:40:13 +0800
Message-Id: <1685518820-20028-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685518820-20028-1-git-send-email-wangmy@fujitsu.com>
References: <1685518820-20028-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27662.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27662.006
X-TMASE-Result: 10--1.755200-10.000000
X-TMASE-MatchedRID: KH0UlMEvP5MFWIzFaWZsv31zro62qhdCcDzcoONn/M6U8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNnVTWWiNp+v9uTKBinxl/umAN6i+va16uBqd
	FRjHdIbhbJcQH3furV3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w7Q0G
	gppcy4E1uQTT5dAs1yx7Nn3QkBcMBD3HDmc+37lit084v1Qob6cKqTtQYjAqcN7IPwqDOKggs4X
	tLjRG4RTnG+HsC7a32CvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 07:40:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102920

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
    Use latest skeleton
    Update license list to latest ScanCode and SPDX 3.20

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...xpression_30.1.0.bb => python3-license-expression_30.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-license-expression_30.1.0.bb => python3-license-expression_30.1.1.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-license-expression_30.1.0.bb b/meta-python/recipes-devtools/python/python3-license-expression_30.1.1.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-license-expression_30.1.0.bb
rename to meta-python/recipes-devtools/python/python3-license-expression_30.1.1.bb
index 5dfd02be4..31fb88d6e 100644
--- a/meta-python/recipes-devtools/python/python3-license-expression_30.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-license-expression_30.1.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/nexB/license-expression"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://apache-2.0.LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "943b1d2cde251bd30a166b509f78990fdd060be9750f3f1a324571e804857a53"
+SRC_URI[sha256sum] = "42375df653ad85e6f5b4b0385138b2dbea1f5d66360783d8625c3e4f97f11f0c"
 
 inherit pypi ptest python_setuptools_build_meta
 
-- 
2.34.1


