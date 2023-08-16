Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2760C41513
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 01:50:05 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.152145.1692150598426016952
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Aug 2023 18:49:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="107585779"
X-IronPort-AV: E=Sophos;i="6.01,175,1684767600"; 
   d="scan'208";a="107585779"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 10:49:56 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6AEA67FB66
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:49:54 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id A7224BF3CD
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:49:53 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 02EE821BD42;
	Wed, 16 Aug 2023 10:49:52 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-sh: upgrade 2.0.4 -> 2.0.6
Date: Wed, 16 Aug 2023 09:49:31 +0800
Message-Id: <1692150571-5914-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27816.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27816.003
X-TMASE-Result: 10--1.786600-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrXs5nqGvDCfNLWMri+QqmsZw6
	tnDgS/8FZ7SNREHYHRGhH3kE6Tg1fLpFo7STYPKLA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYgB/8cibO8IY4gdubnRQFgxvTnqYKYXTRlXgGeVUh3WdmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibJ0RPnyOnrZK9/+qHu4cNFFUWGOL+H9/9U7uY2QPghf1M3Uy5y9fIv6xhk
	lIoccI+O7ExkzMbA5rdwUsXEximrKat2KN26lWOPZJJPYc+YV1Lv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 01:50:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104399

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Allow nested with contexts #690
Call correct asyncio function for getting event loop
Add back appropriate sdist files comment

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-sh_2.0.4.bb => python3-sh_2.0.6.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sh_2.0.4.bb => python3-sh_2.0.6.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-sh_2.0.4.bb b/meta-python/recipes-devtools/python/python3-sh_2.0.6.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-sh_2.0.4.bb
rename to meta-python/recipes-devtools/python/python3-sh_2.0.6.bb
index fa9f97a8f9..3a652a58be 100644
--- a/meta-python/recipes-devtools/python/python3-sh_2.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-sh_2.0.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/amoffat/sh"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5317094292296f03405f59ae5f6544b6"
 
-SRC_URI[sha256sum] = "a18920f0839991bc9dfddb6dcc006c360b1064ba96257359f0ea356e9fa75a60"
+SRC_URI[sha256sum] = "9b2998f313f201c777e2c0061f0b1367497097ef13388595be147e2a00bf7ba1"
 
 PYPI_PACKAGE = "sh"
 
-- 
2.34.1


