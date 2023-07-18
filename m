Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE2CDC3DA42
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 04:26:16 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.681.1689654362314687023
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jul 2023 21:26:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="113108732"
X-IronPort-AV: E=Sophos;i="6.01,213,1684767600"; 
   d="scan'208";a="113108732"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 13:26:05 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 15F6FE4289
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:04 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5792AD5E97
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:03 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id D56BF20077821;
	Tue, 18 Jul 2023 13:26:02 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] lvgl: upgrade 8.3.7 -> 8.3.8
Date: Tue, 18 Jul 2023 12:25:13 +0800
Message-Id: <1689654348-30702-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
References: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27758.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27758.004
X-TMASE-Result: 10-1.026400-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yfx0ykrbAxjCchr4pBLGIvAH8UzOewTxw78F
	Hrw7frluf146W0iUu2sSuJRtSU84o3gcxJAgqZ0ZaDCzqDR7DPZOdKnCeVjjIZsoi2XrUn/J8m+
	hzBStanvIM9mETCO70ydET58jp62SnstJoVvFwyCRHXOsPnObt8EUOcak1WlgYYE97C9OaMxPL1
	uh2GMArqMTzj1q9GmdFSQ1Hsvk7c/6Im1g2C1vgSnWaCYsw99PS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 04:26:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103901

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-graphics/lvgl/{lvgl_8.3.7.bb => lvgl_8.3.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/lvgl/{lvgl_8.3.7.bb => lvgl_8.3.8.bb} (96%)

diff --git a/meta-oe/recipes-graphics/lvgl/lvgl_8.3.7.bb b/meta-oe/recipes-graphics/lvgl/lvgl_8.3.8.bb
similarity index 96%
rename from meta-oe/recipes-graphics/lvgl/lvgl_8.3.7.bb
rename to meta-oe/recipes-graphics/lvgl/lvgl_8.3.8.bb
index 860ee7a33e..6103a02948 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl_8.3.7.bb
+++ b/meta-oe/recipes-graphics/lvgl/lvgl_8.3.8.bb
@@ -9,7 +9,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE.txt;md5=bf1198c89ae87f043108cea62460b03a"
 
 SRC_URI = "git://github.com/lvgl/lvgl;protocol=https;branch=release/v8.3"
-SRCREV = "2b56e04205481daa6575bd5f7ab5df59d11676eb"
+SRCREV = "e6d7be00bfa5e1df450c7b713003a9effa03c614"
 
 inherit cmake
 
-- 
2.34.1


