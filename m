Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40957C3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 13:31:05 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.6463.1704720659496599036
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jan 2024 05:30:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="144934863"
X-IronPort-AV: E=Sophos;i="6.04,341,1695654000"; 
   d="scan'208";a="144934863"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 22:30:57 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 27BDCD69D5
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:30:55 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 68F0330FB1
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:30:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id F2337202CFE87
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:30:53 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7FCAD1A0072;
	Mon,  8 Jan 2024 21:30:53 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] tgt: upgrade 1.0.83 -> 1.0.90
Date: Mon,  8 Jan 2024 21:28:18 +0800
Message-Id: <1704720498-30233-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28106.007
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28106.007
X-TMASE-Result: 10-0.973100-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yQPZZctd3P4Bchr4pBLGIvAH8UzOewTxw+z9
	H+EUMUMlIvrftAIhWmLP85tlrdTfE3uDhljfG03rOwpfLMeBwRuC7C2rJeUToU5PhDXd42by0A4
	5IAXRxM2D/SpuYoqPDS5rYfHE0OO95UcZtwNsCroURSScn+QSXpjDMT0TyDk5+gtHj7OwNO19R4
	Ss0oUmJw15p1/rzXWZj1693J0/xlns98Imgj/Vqrw44j4S1ESlk+LGbuGmhfa6qmJH2bxhm4WgN
	zsgTNcqqX8MKqsc/4xZ4jV5nHn7dPIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 13:31:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108142

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-extended/tgt/{tgt_git.bb => tgt_1.0.90.bb}         | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-networking/recipes-extended/tgt/{tgt_git.bb => tgt_1.0.90.bb} (97%)

diff --git a/meta-networking/recipes-extended/tgt/tgt_git.bb b/meta-networking/recipes-extended/tgt/tgt_1.0.90.bb
similarity index 97%
rename from meta-networking/recipes-extended/tgt/tgt_git.bb
rename to meta-networking/recipes-extended/tgt/tgt_1.0.90.bb
index c74ebb2a6..f68ae99db 100644
--- a/meta-networking/recipes-extended/tgt/tgt_git.bb
+++ b/meta-networking/recipes-extended/tgt/tgt_1.0.90.bb
@@ -4,8 +4,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://scripts/tgtd.spec;beginline=7;endline=7;md5=21c19ea7dad04648b9c2f791b6e29b4c"
 DEPENDS = "sg3-utils libaio"
 
-SRCREV = "a6bd1f0578bf85788a1563cbfb42a75e500d5318"
-PV = "1.0.83"
+SRCREV = "df991fa788e22cd8b8e3013cfae306988c19c3d0"
 
 SRC_URI = "git://github.com/fujita/tgt.git;branch=master;protocol=https \
 	file://0001-Correct-the-path-of-header-files-check-in-Yocto-buil.patch \
-- 
2.34.1


