Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F008BC46CD2
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 01:48:54 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.1529.1705974527811180721
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jan 2024 17:48:48 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="146789515"
X-IronPort-AV: E=Sophos;i="6.05,212,1701097200"; 
   d="scan'208";a="146789515"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 10:48:46 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 987B3D618D
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:48:43 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id D9701F26B6
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:48:42 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 657BD6B4C1
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:48:42 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E4E641A006A;
	Tue, 23 Jan 2024 09:48:41 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-flask: upgrade 3.0.0 -> 3.0.1
Date: Tue, 23 Jan 2024 09:48:29 +0800
Message-Id: <1705974509-25946-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28136.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28136.004
X-TMASE-Result: 10--1.903400-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrTfK5j0EZbys1Y73PdzvXZFRG
	1tpaU7lUq9YyptElK5dMQ8GITGODLf+tuWXZk8lIA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYgB/8cibO8IYRY1tl9vG/AY7Cl8sx4HBG+EpCHUsKYYGULHdr+lZw9qem2
	vw+cenKeLzNWBegCW24nmFeyfGnuMLbigRnpKlKZx+7GyJjhAUE/bv5zumQSyVBvgrpzlJnd7ZV
	Q3zwMKGejDkdWlceIFshNMRRofzEbPyxOnT2GxN8oZxJuCtJ9zjADZkAojhQbTJcr0Z0C1D7H2f
	VekOqwmYL1KImKhq1ZuOe7yPCBvAf2OJxbAVgHQ+kK598Yf3Mg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 01:48:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108413

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Correct type for path argument to send_file.
-Fix a typo in an error message for the flask run --key option.
-Session data is untagged without relying on the built-in json.loads object_hook.
-Address more type findings when using mypy strict mode.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-flask_3.0.0.bb => python3-flask_3.0.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask_3.0.0.bb => python3-flask_3.0.1.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-flask_3.0.0.bb b/meta-python/recipes-devtools/python/python3-flask_3.0.1.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-flask_3.0.0.bb
rename to meta-python/recipes-devtools/python/python3-flask_3.0.1.bb
index e0afd3718..0c6128c65 100644
--- a/meta-python/recipes-devtools/python/python3-flask_3.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask_3.0.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/mitsuhiko/flask/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
 
-SRC_URI[sha256sum] = "cfadcdb638b609361d29ec22360d6070a77d7463dcb3ab08d2c2f2f168845f58"
+SRC_URI[sha256sum] = "6489f51bb3666def6f314e15f19d50a1869a19ae0e8c9a3641ffe66c77d42403"
 
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/Flask"
 UPSTREAM_CHECK_REGEX = "/Flask/(?P<pver>(\d+[\.\-_]*)+)"
-- 
2.34.1


