Return-Path: <shin.matsunaga@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5BAAC48BCB
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:48 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com
 [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.2513.1649135282304803706
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Apr 2022 22:08:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=neutral (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: shin.matsunaga@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10307"; a="48377822"
X-IronPort-AV: E=Sophos;i="5.90,235,1643641200";
   d="scan'208";a="48377822"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP; 05 Apr 2022 14:07:59 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com
 [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 35BF2C9459
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  5 Apr 2022 14:07:58 +0900 (JST)
Received: from yto-om4.fujitsu.com (yto-om4.o.css.fujitsu.com [10.128.89.165])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 59ED3D060F
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  5 Apr 2022 14:07:56 +0900 (JST)
Received: from localhost.localdomain (bakeccha.fct.css.fujitsu.com
 [10.126.195.136])
	by yto-om4.fujitsu.com (Postfix) with ESMTP id 4162D400C30CB;
	Tue,  5 Apr 2022 14:07:56 +0900 (JST)
From: matsunaga-shinji <shin.matsunaga@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: shin.matsunaga@fujitsu.com
Subject: [oe][meta-oe][PATCH] libzip: add CVE-2017-12858 to allowlist
Date: Tue,  5 Apr 2022 14:03:10 +0900
Message-Id: <20220405050310.1515346-1-shin.matsunaga@fujitsu.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Apr 2022 17:24:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96393

Patch for CVE-2017-12858 is applied in version 1.2.0.

Signed-off-by: matsunaga-shinji <shin.matsunaga@fujitsu.com>
---
 meta-oe/recipes-extended/libzip/libzip_1.8.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-extended/libzip/libzip_1.8.0.bb b/meta-oe/recipes-extended/libzip/libzip_1.8.0.bb
index 23ac76a2d..71072a592 100644
--- a/meta-oe/recipes-extended/libzip/libzip_1.8.0.bb
+++ b/meta-oe/recipes-extended/libzip/libzip_1.8.0.bb
@@ -22,3 +22,6 @@ inherit cmake
 SRC_URI = "https://libzip.org/download/libzip-${PV}.tar.xz"
 
 SRC_URI[sha256sum] = "f0763bda24ba947e80430be787c4b068d8b6aa6027a26a19923f0acfa3dac97e"
+
+# Patch for CVE-2017-12858 is applied in version 1.2.0.
+CVE_CHECK_IGNORE += "CVE-2017-12858"
-- 
2.25.1


