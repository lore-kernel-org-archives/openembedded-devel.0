Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4048C197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 08:42:16 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.2981.1700124132120050231
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 00:42:12 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="119255526"
X-IronPort-AV: E=Sophos;i="6.03,307,1694703600"; 
   d="scan'208";a="119255526"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 17:42:09 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id C69FAD66C3
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 17:42:07 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 13A592FC03
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 17:42:07 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3D2BA2005932A;
	Thu, 16 Nov 2023 17:42:06 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ser2net: upgrade 4.5.0 -> 4.5.1
Date: Thu, 16 Nov 2023 16:40:41 +0800
Message-Id: <1700124041-22730-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28000.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28000.003
X-TMASE-Result: 10-7.416300-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJwk5p7o69tnZcLewwAa76fIbyXNwz2gvs1/AFBKYcY9IFum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e1cppCzPq+1UsjvNV98mpPNjSy5sK9bxg7GwHX8qnBcW+koeKCn4TqOzAs
	aEBnDDgEi+5j3/G4U+IpX67aIKkdMt608HJ1ElKkNJHsgeOgyTIdfrJ12aY8E=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 08:42:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106805

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ser2net/{ser2net_4.5.0.bb => ser2net_4.5.1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/ser2net/{ser2net_4.5.0.bb => ser2net_4.5.1.bb} (83%)

diff --git a/meta-oe/recipes-connectivity/ser2net/ser2net_4.5.0.bb b/meta-oe/recipes-connectivity/ser2net/ser2net_4.5.1.bb
similarity index 83%
rename from meta-oe/recipes-connectivity/ser2net/ser2net_4.5.0.bb
rename to meta-oe/recipes-connectivity/ser2net/ser2net_4.5.1.bb
index c7f545318..250793309 100644
--- a/meta-oe/recipes-connectivity/ser2net/ser2net_4.5.0.bb
+++ b/meta-oe/recipes-connectivity/ser2net/ser2net_4.5.1.bb
@@ -9,7 +9,7 @@ DEPENDS = "gensio libyaml"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/ser2net/ser2net/ser2net-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "6ee1b217aad026948fd17ea00c5ecf6e982de822384c4349118461ad83caa0da"
+SRC_URI[sha256sum] = "6d60c2eb9e15f6a23743ce7fc3687a8880042d7fca43572e73ca76ed003de258"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/ser2net/files/ser2net"
 
-- 
2.34.1


