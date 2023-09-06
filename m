Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8146FCCFA01
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 01:50:35 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.2246.1693965033720691795
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Sep 2023 18:50:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="130922022"
X-IronPort-AV: E=Sophos;i="6.02,230,1688396400"; 
   d="scan'208";a="130922022"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 10:50:31 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 54F13E8520
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 10:50:29 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 954A4D5EA3
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 10:50:28 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id C84E787908;
	Wed,  6 Sep 2023 10:50:27 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] debootstrap: upgrade 1.0.131 -> 1.0.132
Date: Wed,  6 Sep 2023 09:50:19 +0800
Message-Id: <1693965019-13736-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27858.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27858.004
X-TMASE-Result: 10-0.218600-10.000000
X-TMASE-MatchedRID: uzDfqB7OXkqjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmKN5v0jh1hv2/KZUMHzJkSUngIgpj8eDcBpkajQR5gb3mn0m688Eo38Kra
	uXd3MZDVW60/onxn3bU9iJs3YR4O8g6116tiSiUvtX/GAIGHCCrzx1jrvemNsPJCizWL81xmYSY
	cW1zVCvIT20NWg0GbVItx7S9f9/9cEOVjMf4VojFPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWL
	WlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 01:50:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104731

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{debootstrap_1.0.131.bb => debootstrap_1.0.132.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/debootstrap/{debootstrap_1.0.131.bb => debootstrap_1.0.132.bb} (89%)

diff --git a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.131.bb b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.132.bb
similarity index 89%
rename from meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.131.bb
rename to meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.132.bb
index c2cfe2a808..c28a51749c 100644
--- a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.131.bb
+++ b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.132.bb
@@ -11,7 +11,7 @@ SRC_URI  = "\
     file://0001-do-not-hardcode-the-full-path-of-dpkg.patch \
 "
 
-SRC_URI[sha256sum] = "ee5bebfaff92f4019804f900902d5c67d9f075870942dee87ec09862b2ab54c3"
+SRC_URI[sha256sum] = "d963a465314ac0e8fd5392573def042e6663e8edf3d08ace4bbd0d27ee8431f7"
 
 S = "${WORKDIR}/debootstrap"
 
-- 
2.34.1


