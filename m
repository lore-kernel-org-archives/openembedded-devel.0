Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1613C46CD2
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 00:57:44 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.379.1705971454339459998
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jan 2024 16:57:34 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="146780759"
X-IronPort-AV: E=Sophos;i="6.05,212,1701097200"; 
   d="scan'208";a="146780759"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 09:57:32 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id BAFACD4F64
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 09:57:29 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 03D2ECFBB5
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 09:57:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8D4F4228841
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 09:57:28 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 152F61A006A;
	Tue, 23 Jan 2024 08:57:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ctags: upgrade 6.1.20231231.0 -> 6.1.20240114.0
Date: Tue, 23 Jan 2024 08:52:54 +0800
Message-Id: <1705971174-24361-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28136.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28136.003
X-TMASE-Result: 10-1.026400-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZaDCzqDR7DPauLG21Eb4T84Fum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e1cppCzPq+1UxlblqLlYqXLJDC5IE/ttTwjieQ11IZEzxbmZ4M+6rLag6X
	vavml9hqKv21cgDYQc0KomlpkVCjn76zxOx3h6ddTTs9wKUKOi3WWzvm1XiI/+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 00:57:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108380

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.1.20231231.0.bb => ctags_6.1.20240114.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.1.20231231.0.bb => ctags_6.1.20240114.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.1.20231231.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.1.20240114.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.1.20231231.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.1.20240114.0.bb
index b788d6fd0..6fab92015 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.1.20231231.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.1.20240114.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "e4cb2a0f9ba947d23e526888930bb1487c2cf1d8"
+SRCREV = "be3439eb01caeadbf52a8ec4d00cb6cf16a61225"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


