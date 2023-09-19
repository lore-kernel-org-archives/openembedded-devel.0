Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D5E1CD5486
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 07:35:59 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.2291.1695108957273351700
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Sep 2023 00:35:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="111494510"
X-IronPort-AV: E=Sophos;i="6.02,158,1688396400"; 
   d="scan'208";a="111494510"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 16:35:55 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id BD66CC68E6
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:35:52 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id ED1FBD3F15
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:35:51 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1E6562FC6B2A;
	Tue, 19 Sep 2023 16:35:51 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libtommath: upgrade 1.2.0 -> 1.2.1
Date: Tue, 19 Sep 2023 15:35:35 +0800
Message-Id: <1695108935-7276-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27884.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27884.005
X-TMASE-Result: 10-0.367400-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mr2fAhmGsftsbh30ag2D9pQL6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74CuQ+NGN1YRWKB5jk2TXXjF1+0
	KsXaxWz7i8zVgXoAltr8hWd4lAsFlC24oEZ6SpSmcfuxsiY4QFHa2XTF82cDGXi8EZ4XMRaM4le
	4CyMv3hB25d5bSVLvWg/97jh2hBjTqBx4iscfB+Az5wdvw3o3WEwpPazKH01YU/oVBgq3+UOx9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 07:35:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104970

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 -- Bugfix release because of potential integer overflow
          c.f. PR #546 resp. CVE-2023-36328

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libtommath/{libtommath_1.2.0.bb => libtommath_1.2.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libtommath/{libtommath_1.2.0.bb => libtommath_1.2.1.bb} (91%)

diff --git a/meta-oe/recipes-support/libtommath/libtommath_1.2.0.bb b/meta-oe/recipes-support/libtommath/libtommath_1.2.1.bb
similarity index 91%
rename from meta-oe/recipes-support/libtommath/libtommath_1.2.0.bb
rename to meta-oe/recipes-support/libtommath/libtommath_1.2.1.bb
index 1efccdd843..32ec290c16 100644
--- a/meta-oe/recipes-support/libtommath/libtommath_1.2.0.bb
+++ b/meta-oe/recipes-support/libtommath/libtommath_1.2.1.bb
@@ -8,7 +8,7 @@ DEPENDS = "libtool-cross"
 
 SRC_URI = "git://github.com/libtom/libtommath.git;protocol=https;branch=master"
 
-SRCREV = "6ca6898bf37f583c4cc9943441cd60dd69f4b8f2"
+SRCREV = "97e500351e653472b2ea00b37137ad0414165efe"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


