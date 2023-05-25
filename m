Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DD71C7EE2F
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 06:57:47 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.6207.1684997865706388716
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 23:57:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="96646857"
X-IronPort-AV: E=Sophos;i="6.00,190,1681138800"; 
   d="scan'208";a="96646857"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 15:57:44 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8B5CACA1E4
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:57:42 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id C62F315700
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:57:41 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id F048C2FC91FB;
	Thu, 25 May 2023 15:57:40 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-flask-restful: upgrade 0.3.9 -> 0.3.10
Date: Thu, 25 May 2023 14:57:28 +0800
Message-Id: <1684997851-2098-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1684997851-2098-1-git-send-email-wangmy@fujitsu.com>
References: <1684997851-2098-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27648.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27648.005
X-TMASE-Result: 10-1.473700-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJorNUVnqixiMOuce7gFxhKa0BQOqUsWgx5g9r3iN/4cJv1+0
	KsXaxWz7i8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFJchfA3ZkFkOC5x91JzZr0EZij
	Iv7MbW1bAAvometnWujKKNA7tNoHrNsTwn/XslGyAsqT3aorf9pQbCl/BGwDD0EP4YH7rJrOx9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 06:57:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102826

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
Compatibility with Flask 2.3

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...3-flask-restful_0.3.9.bb => python3-flask-restful_0.3.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask-restful_0.3.9.bb => python3-flask-restful_0.3.10.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-restful_0.3.9.bb b/meta-python/recipes-devtools/python/python3-flask-restful_0.3.10.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-flask-restful_0.3.9.bb
rename to meta-python/recipes-devtools/python/python3-flask-restful_0.3.10.bb
index 294e3b092..7d5f1ea41 100644
--- a/meta-python/recipes-devtools/python/python3-flask-restful_0.3.9.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-restful_0.3.10.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/flask-restful/flask-restful"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=685bb55ed99a366bb431995f5eef2783"
 
-SRC_URI[sha256sum] = "ccec650b835d48192138c85329ae03735e6ced58e9b2d9c2146d6c84c06fa53e"
+SRC_URI[sha256sum] = "fe4af2ef0027df8f9b4f797aba20c5566801b6ade995ac63b588abf1a59cec37"
 
 inherit pypi setuptools3
 
-- 
2.34.1


