Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE33BC4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 08:18:14 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.28180.1701159489282733526
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 00:18:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="120013920"
X-IronPort-AV: E=Sophos;i="6.04,233,1695654000"; 
   d="scan'208";a="120013920"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 17:18:06 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7B6CAE8BFC
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 17:18:04 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id B1D33D9471
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 17:18:03 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.149])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id AC74788D8A;
	Tue, 28 Nov 2023 17:18:02 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] gensio: upgrade 2.7.7 -> 2.8.0
Date: Tue, 28 Nov 2023 16:17:17 +0800
Message-Id: <1701159437-27750-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28024.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28024.005
X-TMASE-Result: 10-0.879000-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJopGZilTi8ctSOwpfLMeBwRsNVHotTvuv68EguqiGeZ5Jo8W
	MkQWv6iV3LAytsQR4e1cppCzPq+1UxlblqLlYqXLejokgtUCsvftUdNCHTkSHN24pYSPbaU3RWb
	AcbPLQ4mi1eMCp00/pholKvkvak25MxKWZ7NGze3f80yyhP0WmddGQZbuaunT+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 08:18:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107071

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Release and windows installer.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gensio/{gensio_2.7.7.bb => gensio_2.8.0.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/gensio/{gensio_2.7.7.bb => gensio_2.8.0.bb} (94%)

diff --git a/meta-oe/recipes-connectivity/gensio/gensio_2.7.7.bb b/meta-oe/recipes-connectivity/gensio/gensio_2.8.0.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/gensio/gensio_2.7.7.bb
rename to meta-oe/recipes-connectivity/gensio/gensio_2.8.0.bb
index 3deab25ea..65fcf0a3a 100644
--- a/meta-oe/recipes-connectivity/gensio/gensio_2.7.7.bb
+++ b/meta-oe/recipes-connectivity/gensio/gensio_2.8.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     "
 
-SRCREV = "6af40181c33bf97bde8cb99cccc4c2168abcd24e"
+SRCREV = "2f959c4596d87461a84f6132ca596754ca0beeda"
 
 SRC_URI = "git://github.com/cminyard/gensio;protocol=https;branch=master"
 
-- 
2.34.1


