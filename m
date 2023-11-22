Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98E4AC61D92
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 06:16:35 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.13720.1700633787571688364
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Nov 2023 22:16:27 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="119344193"
X-IronPort-AV: E=Sophos;i="6.04,218,1695654000"; 
   d="scan'208";a="119344193"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 15:16:24 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id DB801A7C47
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 15:16:22 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 268F2143E0
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 15:16:22 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 65E5B1E9CAA;
	Wed, 22 Nov 2023 15:16:21 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ctags: upgrade 6.0.20231112.0 -> 6.0.20231119.0
Date: Wed, 22 Nov 2023 14:15:44 +0800
Message-Id: <1700633744-7702-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28012.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28012.005
X-TMASE-Result: 10-1.026400-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZaDCzqDR7DPauLG21Eb4T84Fum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e1cppCzPq+1UxlblqLlYqXLJDC5IE/ttTwjieQ11IZEzxbmZ4M+6rLag6X
	vavml9hsZ4L/XPJzOSIbEPRNxlI14Mz3KhTTVDstfIEi+2waJfX7+GTPcpKVv+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 06:16:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106991

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.0.20231112.0.bb => ctags_6.0.20231119.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.0.20231112.0.bb => ctags_6.0.20231119.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.0.20231112.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.0.20231119.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.0.20231112.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.0.20231119.0.bb
index fcb2f55d8..b53753c12 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.0.20231112.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.0.20231119.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "10399406a9bc2e2fc7f17a8f1adbad69395b5e43"
+SRCREV = "f727e74001ec5081818669635fc2bae377be6eda"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


