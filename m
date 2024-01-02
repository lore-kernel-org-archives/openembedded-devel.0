Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAE53C46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 07:06:35 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.24356.1704179194289961970
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jan 2024 23:06:34 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="144531196"
X-IronPort-AV: E=Sophos;i="6.04,324,1695654000"; 
   d="scan'208";a="144531196"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2024 16:06:32 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 43A06D4F5A
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jan 2024 16:06:29 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 83C841414A
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jan 2024 16:06:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 02B7520080783
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jan 2024 16:06:28 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 90E4F1A0070;
	Tue,  2 Jan 2024 15:06:27 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] plocate: upgrade 1.1.19 -> 1.1.20
Date: Tue,  2 Jan 2024 15:06:20 +0800
Message-Id: <1704179180-8011-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28094.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28094.005
X-TMASE-Result: 10-0.270500-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrTfK5j0EZbys6FHRWx2FGsCmF
	OYJJbPqpz5GQk/h/7vDTqzyZdKfBmNz07adr0VnOJTyMiqml0imnuTRQtg5OxZTx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q2dVNZaI2n6/2VHNkCQpEYN118T8WwfutWem2
	vw+cenKeLzNWBegCW24nmFeyfGnuMLbigRnpKlKZx+7GyJjhAUsZoIe2abqJnynKU2ar5CvP2Mo
	YXQGQYeZhglaqljMA3QD1yveh2bjsPvCCXGgG5p/ebjUfiBKUSuopo+N6Fivpd0sI3ffmu37H2f
	VekOqwmYL1KImKhq1ZuOe7yPCBvAf2OJxbAVgHQ+kK598Yf3Mg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jan 2024 07:06:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107998

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fix updatedb writing incomplete .db files under Termux.
- Make the systemd timer run more consistently during the night.
- Add an (undocumented) flag --ignore-visibility to plocate,
  giving the equivalent of building the database with
  --require-visibility no. Drops setgid, of course, so you
  will usually need to be root to use it.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../plocate/{plocate_1.1.19.bb => plocate_1.1.20.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/plocate/{plocate_1.1.19.bb => plocate_1.1.20.bb} (84%)

diff --git a/meta-oe/recipes-extended/plocate/plocate_1.1.19.bb b/meta-oe/recipes-extended/plocate/plocate_1.1.20.bb
similarity index 84%
rename from meta-oe/recipes-extended/plocate/plocate_1.1.19.bb
rename to meta-oe/recipes-extended/plocate/plocate_1.1.20.bb
index 6b3160f09..5f45d7fbd 100644
--- a/meta-oe/recipes-extended/plocate/plocate_1.1.19.bb
+++ b/meta-oe/recipes-extended/plocate/plocate_1.1.20.bb
@@ -11,4 +11,4 @@ DEPENDS = "zstd liburing"
 
 SRC_URI = "https://plocate.sesse.net/download/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "d95bc8ee8a9f79b9f69ce63df53fb85b202139f243bbb84c399555eda22e6165"
+SRC_URI[sha256sum] = "9b3d2842a08e69633c0ffa480c139603514ce59f1d021c263e9301324976959f"
-- 
2.34.1


