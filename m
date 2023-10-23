Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2B6FC25B41
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 08:42:29 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.116072.1698050541015323047
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 01:42:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="125178585"
X-IronPort-AV: E=Sophos;i="6.03,244,1694703600"; 
   d="scan'208";a="125178585"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 17:42:18 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 97BB8D29E5
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:42:16 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id BE4F2D9467
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:42:15 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id A8B2F86F98;
	Mon, 23 Oct 2023 17:42:14 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-flask-jwt-extended: upgrade 4.5.2 -> 4.5.3
Date: Mon, 23 Oct 2023 16:41:54 +0800
Message-Id: <1698050514-25575-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27952.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27952.006
X-TMASE-Result: 10--2.463600-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrYdBG+bhhiNRUjspoiX02F5tC
	OUPy2BVapPkgFEQ0YZkNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl/qzSYnI5VS9npt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFP9SIhaap0wquaOP8xgz3XA4bR
	VrKCitNVATvikfM7F0DW5iUlen/TM1imkvyw5NLuxfqln9AboOdIroYCsbo2vBAI4fJKokWex9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 08:42:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105665

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Replace "defining" with "define"
-Fix documentation syntax error
-remove duplicate comments
-Support python 3.12 and add support for flask 3.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...wt-extended_4.5.2.bb => python3-flask-jwt-extended_4.5.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask-jwt-extended_4.5.2.bb => python3-flask-jwt-extended_4.5.3.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-jwt-extended_4.5.2.bb b/meta-python/recipes-devtools/python/python3-flask-jwt-extended_4.5.3.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-flask-jwt-extended_4.5.2.bb
rename to meta-python/recipes-devtools/python/python3-flask-jwt-extended_4.5.3.bb
index f55d771745..d5438f11a8 100644
--- a/meta-python/recipes-devtools/python/python3-flask-jwt-extended_4.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-jwt-extended_4.5.3.bb
@@ -7,7 +7,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "Flask-JWT-Extended"
 
-SRC_URI[sha256sum] = "ba56245ba43b71c8ae936784b867625dce8b9956faeedec2953222e57942fb0b"
+SRC_URI[sha256sum] = "061ef3d25ed5743babe4964ab38f36d870e6d2fd8a126bab5d77ddef8a01932b"
 
 RDEPENDS:${PN} += "\
     python3-werkzeug \
-- 
2.34.1


