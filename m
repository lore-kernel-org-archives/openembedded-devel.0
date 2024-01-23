Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6E15C47DDB
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 01:58:24 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.1733.1705975098949340648
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jan 2024 17:58:19 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="125718870"
X-IronPort-AV: E=Sophos;i="6.05,212,1701097200"; 
   d="scan'208";a="125718870"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 10:58:16 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id B9DFEE0409
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:58:14 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id A0516D5602
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:58:08 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3538420079DC3
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:58:08 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D114C1A006A;
	Tue, 23 Jan 2024 09:58:07 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-types-psutil: upgrade 5.9.5.17 -> 5.9.5.20240106
Date: Tue, 23 Jan 2024 09:57:52 +0800
Message-Id: <1705975072-26390-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28136.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28136.003
X-TMASE-Result: 10-2.316400-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJopGZilTi8ctSb/oIJuUAIuEBQOqUsWgx5oFum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXKI+zSBmZsPsPRIvB5iLrVugPsrmfXmfGAgsY
	+iFR2fvjbTIYjpQodQ5Q9J2zonake7SziIEXZBJlAPNKTrsEUt3iKgSoTQ7Vv+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 01:58:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108424

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Update typing_extensions imports in third-party stubs

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...sutil_5.9.5.17.bb => python3-types-psutil_5.9.5.20240106.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-types-psutil_5.9.5.17.bb => python3-types-psutil_5.9.5.20240106.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-types-psutil_5.9.5.17.bb b/meta-python/recipes-devtools/python/python3-types-psutil_5.9.5.20240106.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-types-psutil_5.9.5.17.bb
rename to meta-python/recipes-devtools/python/python3-types-psutil_5.9.5.20240106.bb
index 055cecd64..b4b9c5119 100644
--- a/meta-python/recipes-devtools/python/python3-types-psutil_5.9.5.17.bb
+++ b/meta-python/recipes-devtools/python/python3-types-psutil_5.9.5.20240106.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=ef4dc1e740f5c928f1
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "f7d8769812d72a4b513d7ec9eb5580fe2f6013fc270394a603cb6534811f3e4d"
+SRC_URI[sha256sum] = "60b233fb613b41fe859526103dbda0b4812d7a16c5f791119ec7016fbe1c8128"
 
 BBCLASSEXTEND = "native"
-- 
2.34.1


