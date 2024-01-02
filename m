Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC8A5C46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 07:08:45 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.24374.1704179319464253983
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jan 2024 23:08:39 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="133448244"
X-IronPort-AV: E=Sophos;i="6.04,324,1695654000"; 
   d="scan'208";a="133448244"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2024 16:08:36 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 63B51D69D5
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jan 2024 16:08:34 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9D18217D47
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jan 2024 16:08:33 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 207CD2008E698
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jan 2024 16:08:33 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 831AB1A0070;
	Tue,  2 Jan 2024 15:08:32 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python][PATCH] python3-flask: upgrade 2.3.3 -> 3.0.0
Date: Tue,  2 Jan 2024 15:08:15 +0800
Message-Id: <1704179295-8140-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28094.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28094.005
X-TMASE-Result: 10--2.545900-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yUIIxwDaU5mrMVx/3ZYby7/Jt7aD46KTu2Ma
	pnFC68Xm8e/ZrhxBgIs2CkNYCK7dx3Xo24sP1JtCNcwCMbCA8ajGhlMdn5cIUeoWVODXAWfcupC
	V1Tw0TOl3N52GD+AbMQ3KvrUy7pE6bRev5+PfDD/y3h9RQZ4StME5XPQnBzGXBX18z5X2O3vnAw
	8yp081LIGQRIwjTl3iDVS4QmWw8VRjAM4vu3dHId0KiTeJteVBfS0Ip2eEHnz3IzXlXlpamPoLR
	4+zsDTtRcDSKgj6IG0IoBuc5NoMLEV4vmXILdXvSr9mQjk7YvuC20eAYW2D5G+0y0evelI7fyIS
	fXTP0IDF7ZwFR49sWZUr6Ejb9aTGdDqCnJfr5tLyDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgA
	Q4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jan 2024 07:08:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108001

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Remove previously deprecated code.
-Deprecate the __version__ attribute. Use feature detection,
 or importlib.metadata.version("flask"), instead.
-Restructure the code such that the Flask (app) and Blueprint classes have
 Sans-IO bases.
-Allow self as an argument to url_for.
-Require Werkzeug >= 3.0.0.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-flask_2.3.3.bb => python3-flask_3.0.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask_2.3.3.bb => python3-flask_3.0.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-flask_2.3.3.bb b/meta-python/recipes-devtools/python/python3-flask_3.0.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-flask_2.3.3.bb
rename to meta-python/recipes-devtools/python/python3-flask_3.0.0.bb
index 99a61f136..e0afd3718 100644
--- a/meta-python/recipes-devtools/python/python3-flask_2.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-flask_3.0.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/mitsuhiko/flask/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
 
-SRC_URI[sha256sum] = "09c347a92aa7ff4a8e7f3206795f30d826654baf38b873d0744cd571ca609efc"
+SRC_URI[sha256sum] = "cfadcdb638b609361d29ec22360d6070a77d7463dcb3ab08d2c2f2f168845f58"
 
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/Flask"
 UPSTREAM_CHECK_REGEX = "/Flask/(?P<pver>(\d+[\.\-_]*)+)"
-- 
2.34.1


