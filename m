Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D4E8C46CD3
	for <webhook@archiver.kernel.org>; Tue, 26 Dec 2023 08:41:30 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.76943.1703580082650412362
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Dec 2023 00:41:23 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="144884896"
X-IronPort-AV: E=Sophos;i="6.04,304,1695654000"; 
   d="scan'208";a="144884896"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2023 17:41:19 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 23DD7D4F60
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 17:41:17 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 58121D5E8B
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 17:41:16 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id E8FE120093246
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 17:41:15 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A35E21A0072;
	Tue, 26 Dec 2023 16:41:15 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] zchunk: upgrade 1.3.2 -> 1.4.0
Date: Tue, 26 Dec 2023 16:41:09 +0800
Message-Id: <1703580069-13948-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28080.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28080.006
X-TMASE-Result: 10-2.243400-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yQPZZctd3P4Bchr4pBLGIvAH8UzOewTxw+z9
	H+EUMUMlIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZaDCzqDR7DPZqp573tpzEIwIZ++dWnH7bnpt
	r8PnHpyni8zVgXoAltr8hWd4lAsFlC24oEZ6SpSmcfuxsiY4QFEUXTz5OjnbeL3t59q8uJ/C85C
	NNECOXn2vFiWb5Gp+Dn7AXpLUNQS6wkfMGU44v6uio/d7CS2ydxESTqFSboPaQANmh5V4vG+x9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 08:41:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107808

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/zchunk/{zchunk_1.3.2.bb => zchunk_1.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/zchunk/{zchunk_1.3.2.bb => zchunk_1.4.0.bb} (93%)

diff --git a/meta-oe/recipes-support/zchunk/zchunk_1.3.2.bb b/meta-oe/recipes-support/zchunk/zchunk_1.4.0.bb
similarity index 93%
rename from meta-oe/recipes-support/zchunk/zchunk_1.3.2.bb
rename to meta-oe/recipes-support/zchunk/zchunk_1.4.0.bb
index 27ebd6394..0c8a9c7a5 100644
--- a/meta-oe/recipes-support/zchunk/zchunk_1.3.2.bb
+++ b/meta-oe/recipes-support/zchunk/zchunk_1.4.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=daf6e68539f564601a5a5869c31e5242"
 
 SRC_URI = "git://github.com/zchunk/zchunk.git;protocol=https;branch=main"
 
-SRCREV = "bdd6d6fc150d53d89658bebbfa73a7bfd9a89cb4"
+SRCREV = "4dd91d31157ede4a1b092721d944ae2fdd161cd9"
 S = "${WORKDIR}/git"
 
 DEPENDS = "zstd"
-- 
2.34.1


