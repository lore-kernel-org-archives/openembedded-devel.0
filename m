Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 687C2C77B7A
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 06:58:27 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.6216.1684997896268261365
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 23:58:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="117964481"
X-IronPort-AV: E=Sophos;i="6.00,190,1681138800"; 
   d="scan'208";a="117964481"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 15:58:16 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 54112DAE0B
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:58:13 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 96272D3F3C
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:58:12 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1EAB82008FF8C;
	Thu, 25 May 2023 15:58:12 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] zchunk: upgrade 1.3.0 -> 1.3.1
Date: Thu, 25 May 2023 14:58:06 +0800
Message-Id: <1684997886-2137-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1684997886-2137-1-git-send-email-wangmy@fujitsu.com>
References: <1684997886-2137-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27648.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27648.005
X-TMASE-Result: 10-2.243400-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yQPZZctd3P4Bchr4pBLGIvAH8UzOewTxw+z9
	H+EUMUMlIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZaDCzqDR7DPZqp573tpzEIw9r3iN/4cJv1+0
	KsXaxWz7i8zVgXoAltr8hWd4lAsFlC24oEZ6SpSmcfuxsiY4QFBg57lK8GMvclKlSpiY2n3uGIm
	L/o6AhXqhDwyHjYlBYAHJNbaFY6J9dtAxaHJunhna+xGnamjdo2NNPjO2tEZ/LnpHVgDF4Hex9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 06:58:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102836

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/zchunk/{zchunk_1.3.0.bb => zchunk_1.3.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/zchunk/{zchunk_1.3.0.bb => zchunk_1.3.1.bb} (93%)

diff --git a/meta-oe/recipes-support/zchunk/zchunk_1.3.0.bb b/meta-oe/recipes-support/zchunk/zchunk_1.3.1.bb
similarity index 93%
rename from meta-oe/recipes-support/zchunk/zchunk_1.3.0.bb
rename to meta-oe/recipes-support/zchunk/zchunk_1.3.1.bb
index 07ab28375..9bf380924 100644
--- a/meta-oe/recipes-support/zchunk/zchunk_1.3.0.bb
+++ b/meta-oe/recipes-support/zchunk/zchunk_1.3.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=daf6e68539f564601a5a5869c31e5242"
 
 SRC_URI = "git://github.com/zchunk/zchunk.git;protocol=https;branch=main"
 
-SRCREV = "1d8f14484b4e0b507487abe6c294fb2059b7b72f"
+SRCREV = "b462b1587f7d3aa782689430e83e96c737748f33"
 S = "${WORKDIR}/git"
 
 DEPENDS = "zstd"
-- 
2.34.1


