Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B73C3CDB474
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 08:22:39 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.115823.1698049352407178047
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 01:22:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="138660261"
X-IronPort-AV: E=Sophos;i="6.03,244,1694703600"; 
   d="scan'208";a="138660261"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 17:22:30 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 70754CD7E0
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:22:27 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9562EBF3C1
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:22:26 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id CDAE72005932A;
	Mon, 23 Oct 2023 17:22:25 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] lvgl: upgrade 8.3.9 -> 8.3.10
Date: Mon, 23 Oct 2023 16:22:11 +0800
Message-Id: <1698049331-24591-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27952.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27952.006
X-TMASE-Result: 10-2.633400-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mr9pLnYtQ99xKysPB8dBBorYIP
	FubbBVyAoTssFGSH7W3mn3xyPJAJoh2P280ZiGmRuce7gFxhKa2YkAyCbA7KV6B5jk2TXXjFlIO
	VA+gJRdKxfbhqGxLk+4Ay6p60ZV62To3UJuRLIoTdB/CxWTRRu+rAZ8KTspSzadO9iPenlUH5+T
	dhmVXZCJkGoxkMaPkJxuVIp717ds4G5Anc7XS3HDC+lvnNqjfHbJf3+Cfqzl93Rg0rz0HIwsFFq
	67QE4r1iB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 08:22:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105641

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://github.com/lvgl/lvgl/blob/release/v8.3/docs/CHANGELOG.md

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-graphics/lvgl/{lvgl_8.3.9.bb => lvgl_8.3.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/lvgl/{lvgl_8.3.9.bb => lvgl_8.3.10.bb} (96%)

diff --git a/meta-oe/recipes-graphics/lvgl/lvgl_8.3.9.bb b/meta-oe/recipes-graphics/lvgl/lvgl_8.3.10.bb
similarity index 96%
rename from meta-oe/recipes-graphics/lvgl/lvgl_8.3.9.bb
rename to meta-oe/recipes-graphics/lvgl/lvgl_8.3.10.bb
index dc681c249b..ede94ff49d 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl_8.3.9.bb
+++ b/meta-oe/recipes-graphics/lvgl/lvgl_8.3.10.bb
@@ -9,7 +9,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE.txt;md5=bf1198c89ae87f043108cea62460b03a"
 
 SRC_URI = "git://github.com/lvgl/lvgl;protocol=https;branch=release/v8.3"
-SRCREV = "9ec3b8706b098f60940cee6ac211d3cb3141aedf"
+SRCREV = "06e229cc7679c01119ca5d905a1f9dad96f475f0"
 
 inherit cmake
 
-- 
2.34.1


