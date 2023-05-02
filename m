Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51E91C7EE22
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 18:51:16 +0000 (UTC)
Received: from esa1.mentor.iphmx.com (esa1.mentor.iphmx.com [68.232.129.153])
 by mx.groups.io with SMTP id smtpd.web11.1966.1683052130524398433
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 May 2023 11:28:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: mentor.com, ip: 68.232.129.153, mailfrom: bhargav_das@mentor.com)
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; 
   d="scan'208";a="4659444"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa1.mentor.iphmx.com with ESMTP; 02 May 2023 10:28:49 -0800
IronPort-SDR: H6f3vjhjhEfb2Kv4/yhT+sC7vkKJ6SdK/clPyGaNvIw3LfjTFUm3mrWISTc0rQuaBfqF2Z7ZSO
 BJvpxsX7hxxxK14TNC2BMYEqI0GbPS2hyV2x5/r7jd52hEz968u5iPVhfoa9mHobAHnUQG4fCT
 KYPpaFyRkAr70W3+hD2wyGZ1Qh49K1H4jgqllB5OzF2D4St1hmlKkGQHWX+9QgR0GS7gdqZ8R7
 JLGlavP9FpXxhgDcLK80wsZBAVKLRxGylH4du51Rk/r6R8vJ6p0rm4Kga0d3udA3/6/QioX1ht
 bV8=
From: "Bhargav Das" <bhargav_das@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Bhargav Das <bhargav.das@siemens.com>
Subject: [meta-oe][PATCH 2/2] pointercal: Add native & nativestdk package support
Date: Tue, 2 May 2023 23:57:59 +0530
Message-ID: <20230502182759.149005-2-bhargav_das@mentor.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230502182759.149005-1-bhargav_das@mentor.com>
References: <20230502182759.149005-1-bhargav_das@mentor.com>
MIME-Version: 1.0
X-ClientProxiedBy: svr-orw-mbx-14.mgc.mentorg.com (147.34.90.214) To
 svr-orw-mbx-13.mgc.mentorg.com (147.34.90.213)
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 May 2023 18:51:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102278

From: Bhargav Das <bhargav.das@siemens.com>

Add support for building native and nativesdk variants.

Signed-off-by: Bhargav Das <bhargav.das@siemens.com>
---
 meta-oe/recipes-bsp/pointercal/pointercal_0.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-bsp/pointercal/pointercal_0.0.bb b/meta-oe/recipes-bsp/pointercal/pointercal_0.0.bb
index d3e797332..9b72ffefe 100644
--- a/meta-oe/recipes-bsp/pointercal/pointercal_0.0.bb
+++ b/meta-oe/recipes-bsp/pointercal/pointercal_0.0.bb
@@ -20,3 +20,5 @@ do_install() {
 ALLOW_EMPTY:${PN} = "1"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 INHIBIT_DEFAULT_DEPS = "1"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


