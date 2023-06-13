Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40C4FC88CBC
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 01:40:53 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.3819.1686620440878148778
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jun 2023 18:40:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="120229200"
X-IronPort-AV: E=Sophos;i="6.00,238,1681138800"; 
   d="scan'208";a="120229200"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 10:40:51 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id A5D49E05AB
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:40:48 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id E41E0CF7C3
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:40:47 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 675B520074724;
	Tue, 13 Jun 2023 10:40:47 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] pcsc-lite: upgrade 1.9.9 -> 2.0.0
Date: Tue, 13 Jun 2023 09:40:06 +0800
Message-Id: <1686620422-29962-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
References: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27688.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27688.004
X-TMASE-Result: 10-3.468400-10.000000
X-TMASE-MatchedRID: QR1SVCCbVGSjz0nOeth/yUIIxwDaU5mrJFnpClbCtUS0OCa9XYfw+dNm
	+w5IIlW6Cseo5GIVbMauQefY9MyLNC8oE1Ngob6lEhGH3CRdKUVNLPQl0QAltGRT+XJluvlJuI8
	WAK0NiDvgK2NiZClvaQXURz+hQhGVWkIi5GvRHEpO5y1KmK5bJTZlY6a4lRLZYA3qL69rXq4Cgi
	IaveBs07QTipD9bsvIV0XlRZnkQ+cbcm3b1gDB8N0KiTeJteVBfS0Ip2eEHnwj/1Rbkzl1E2nuo
	SGaY+DLjoczmuoPCq0B9AXlY5S4JV3CfSeF68mdq7koboMYFyZ/SaMbFbqSyGf8cqWn6bLId6bs
	Obyw0BtLMWTClRIcmFM4wi6Ov3yF71z2mv1+MvAdJuEZuYbKVcUkrvIudlEZl07dDrsiYvyCLhF
	TP3QRDAbYwClu/qh3
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 01:40:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103235

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Adjust USB drivers path at run-time via environment variable PCSCLITE_HP_DROPDIR
- Add '--disable-polkit' option
- Reset eventCounter when a reader is removed
- Add "polkit" in "pcscd -v" output if enabled
- Doxygen: document SCARD_E_INVALID_VALUE for some functions
- use secure_getenv(3) if available
- Some other minor improvements

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../pcsc-lite/{pcsc-lite_1.9.9.bb => pcsc-lite_2.0.0.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/pcsc-lite/{pcsc-lite_1.9.9.bb => pcsc-lite_2.0.0.bb} (95%)

diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.9.9.bb b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.0.0.bb
similarity index 95%
rename from meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.9.9.bb
rename to meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.0.0.bb
index c84c94dd5..e7f4551af 100644
--- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.9.9.bb
+++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.0.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=628c01ba985ecfa21677f5ee2d5202f6"
 DEPENDS = "autoconf-archive-native flex-native"
 
 SRC_URI = "https://pcsclite.apdu.fr/files/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "cbcc3b34c61f53291cecc0d831423c94d437b188eb2b97b7febc08de1c914e8a"
+SRC_URI[sha256sum] = "d6c3e2b64510e5ed6fcd3323febf2cc2a8e5fda5a6588c7671f2d77f9f189356"
 
 inherit autotools systemd pkgconfig perlnative
 
-- 
2.34.1


