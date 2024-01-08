Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50906C3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 13:16:25 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.6199.1704719779771391576
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jan 2024 05:16:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="124858273"
X-IronPort-AV: E=Sophos;i="6.04,341,1695654000"; 
   d="scan'208";a="124858273"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 22:16:17 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 2A066D2A1C
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:16:15 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 497C5106204
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:16:14 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C149C202CFE8F
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:16:13 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 78AFD1A0072;
	Mon,  8 Jan 2024 21:16:13 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] dialog: upgrade 1.3-20231002 -> 1.3-20240101
Date: Mon,  8 Jan 2024 21:16:07 +0800
Message-Id: <1704719767-29744-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28106.007
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28106.007
X-TMASE-Result: 10-0.711800-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrSc4iQ7VD4M2U8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNuce7gFxhKa2YkAyCbA7KV+CbuVI7hVbLOM7
	m2YrKFkxuH2/lT2WG6fbwUE3l2V0wrWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNQgLHAeOmjfVVBsq7d5YGkOSDCqXFmhNvzlEJGqWPsIM4AQjfdPs3ddrgumKAnhrsCyca
	ddGNzIHksm9GGrLouFyffqYAPEMB5ltc/b1pfHmU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 13:16:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108131

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
========
* updated configure script
* updated lv.po

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../dialog/{dialog_1.3-20231002.bb => dialog_1.3-20240101.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/dialog/{dialog_1.3-20231002.bb => dialog_1.3-20240101.bb} (92%)

diff --git a/meta-oe/recipes-extended/dialog/dialog_1.3-20231002.bb b/meta-oe/recipes-extended/dialog/dialog_1.3-20240101.bb
similarity index 92%
rename from meta-oe/recipes-extended/dialog/dialog_1.3-20231002.bb
rename to meta-oe/recipes-extended/dialog/dialog_1.3-20240101.bb
index 8887700e8..988a8ee2b 100644
--- a/meta-oe/recipes-extended/dialog/dialog_1.3-20231002.bb
+++ b/meta-oe/recipes-extended/dialog/dialog_1.3-20240101.bb
@@ -9,7 +9,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
 SRC_URI = "https://invisible-mirror.net/archives/${BPN}/${BP}.tgz"
-SRC_URI[sha256sum] = "315640ab0719225d5cbcab130585c05f0791fcf073072a5fe9479969aa2b833b"
+SRC_URI[sha256sum] = "9419eb52b95837312a76ccb26002c5d624fab53abde0859f1c7364179dc0ebad"
 
 # hardcoded here for use in dialog-static recipe
 S = "${WORKDIR}/dialog-${PV}"
-- 
2.34.1


