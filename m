Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D1D9C25B67
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 23:53:25 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.6908.1698105203684505101
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 16:53:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="137287064"
X-IronPort-AV: E=Sophos;i="6.03,246,1694703600"; 
   d="scan'208";a="137287064"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 08:53:22 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 774A7CA1E6
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Oct 2023 08:53:19 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id A9C6FD88A6
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Oct 2023 08:53:18 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 948BE86FD2;
	Tue, 24 Oct 2023 08:53:17 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] zchunk: upgrade 1.3.1 -> 1.3.2
Date: Tue, 24 Oct 2023 07:53:01 +0800
Message-Id: <1698105181-32517-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27954.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27954.003
X-TMASE-Result: 10-2.243400-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4Bchr4pBLGIvAH8UzOewTxw+z9
	H+EUMUMlIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZaDCzqDR7DPZqp573tpzEI8EguqiGeZ5Jo8W
	MkQWv6iV3LAytsQR4e1cppCzPq+1UxlblqLlYqXJsZPLQOx2LRCG0pGJbF4c76dR24UwLhohwO5
	g84v3Qp4KaCflsjuhxNEx4fKHnjNTOMGYuvCZhFc/MLcRRl2CJQDhYwtuvZgn+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 23:53:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105715

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/zchunk/{zchunk_1.3.1.bb => zchunk_1.3.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/zchunk/{zchunk_1.3.1.bb => zchunk_1.3.2.bb} (93%)

diff --git a/meta-oe/recipes-support/zchunk/zchunk_1.3.1.bb b/meta-oe/recipes-support/zchunk/zchunk_1.3.2.bb
similarity index 93%
rename from meta-oe/recipes-support/zchunk/zchunk_1.3.1.bb
rename to meta-oe/recipes-support/zchunk/zchunk_1.3.2.bb
index 2961e449f1..27ebd63949 100644
--- a/meta-oe/recipes-support/zchunk/zchunk_1.3.1.bb
+++ b/meta-oe/recipes-support/zchunk/zchunk_1.3.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=daf6e68539f564601a5a5869c31e5242"
 
 SRC_URI = "git://github.com/zchunk/zchunk.git;protocol=https;branch=main"
 
-SRCREV = "b462b1587f7d3aa782689430e83e96c737748f33"
+SRCREV = "bdd6d6fc150d53d89658bebbfa73a7bfd9a89cb4"
 S = "${WORKDIR}/git"
 
 DEPENDS = "zstd"
-- 
2.34.1


