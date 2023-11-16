Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A977C197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 07:48:26 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.2422.1700120896633367697
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Nov 2023 23:48:17 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="119249738"
X-IronPort-AV: E=Sophos;i="6.03,307,1694703600"; 
   d="scan'208";a="119249738"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 16:48:13 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 88BDED9D8F
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 16:48:11 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id B38E4D5FE7
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 16:48:10 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id EBC7E200649DF;
	Thu, 16 Nov 2023 16:48:09 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ctags: upgrade 6.0.20231105.0 -> 6.0.20231112.0
Date: Thu, 16 Nov 2023 15:47:28 +0800
Message-Id: <1700120848-21465-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28000.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28000.003
X-TMASE-Result: 10-1.026400-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZaDCzqDR7DPauLG21Eb4T84Fum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e1cppCzPq+1UxlblqLlYqXJWOogt0+nYO7JWBdXMlOZXADOmdHY4dlfe33
	i/UVTLd7B6ImqK6ibQRg7vWN7sAMwUmyjUSy69gy842xPnXqI9H/9S0w8gH/T+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 07:48:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106777

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.0.20231105.0.bb => ctags_6.0.20231112.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.0.20231105.0.bb => ctags_6.0.20231112.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.0.20231105.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.0.20231112.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.0.20231105.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.0.20231112.0.bb
index 6d12eb244..fcb2f55d8 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.0.20231105.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.0.20231112.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "9397eb9a7c99f50372c858785378488a8dd73200"
+SRCREV = "10399406a9bc2e2fc7f17a8f1adbad69395b5e43"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


