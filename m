Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9551C83003
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 07:53:31 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.2148.1685951606506372365
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jun 2023 00:53:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="98829091"
X-IronPort-AV: E=Sophos;i="6.00,217,1681138800"; 
   d="scan'208";a="98829091"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 16:53:24 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 01448DDC61
	for <openembedded-devel@lists.openembedded.org>; Mon,  5 Jun 2023 16:53:22 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 38915BF3C6
	for <openembedded-devel@lists.openembedded.org>; Mon,  5 Jun 2023 16:53:21 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 59A5F2FC80F4;
	Mon,  5 Jun 2023 16:53:20 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ctags: upgrade 6.0.20230528.0 -> 6.0.20230604.0
Date: Mon,  5 Jun 2023 15:52:55 +0800
Message-Id: <1685951589-29920-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685951589-29920-1-git-send-email-wangmy@fujitsu.com>
References: <1685951589-29920-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27672.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27672.004
X-TMASE-Result: 10-1.026400-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZaDCzqDR7DPauLG21Eb4T84Fum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e1cppCzPq+1UxlblqLlYqXJRsa+0tFX+C5ioaS7Bpknb6+lQ/zw3NVL8eO
	ItjRV2A9ixYObPOmQjLdjViHj/KGa9HbP2+b02vUpEsfbMq9H15jDW6ggdNBv+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Jun 2023 07:53:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103111

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.0.20230528.0.bb => ctags_6.0.20230604.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.0.20230528.0.bb => ctags_6.0.20230604.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.0.20230528.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.0.20230604.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.0.20230528.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.0.20230604.0.bb
index 6c9a08f13..1b869a862 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.0.20230528.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.0.20230604.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "b3e1ad7db92a5fbe6df96e576210001c74bc7949"
+SRCREV = "4ab3954a07dd1c598791d98b8e98aa64c13ff8e9"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


