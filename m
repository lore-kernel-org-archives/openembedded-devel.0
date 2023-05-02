Return-Path: <bhargav_das@mentor.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16008C77B78
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 18:37:46 +0000 (UTC)
Received: from esa2.mentor.iphmx.com (esa2.mentor.iphmx.com [68.232.141.98])
 by mx.groups.io with SMTP id smtpd.web11.2208.1683052657294668015
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 May 2023 11:37:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: mentor.com, ip: 68.232.141.98, mailfrom: bhargav_das@mentor.com)
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; 
   d="scan'208";a="4633657"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 02 May 2023 10:37:36 -0800
IronPort-SDR: kIDngdVGlOkd7o0GBuKZtr/SAbHr1v9mh+cL62h9PK+TREXNE+CHJHXeMsJY7/us0msMzDtKB+
 16l1Sf2aq82DsGqCp5226Fx1Fw3Y6zatB3QXq9g9c4BtKAkPOTykf0XYN6l+9iAJMELLtftK6b
 a1HG5kblY92bIBtuHx6xpXMrWLb2gzrQrqb5wJBjd4t6dTuDCE+8plWeAjnsP01mG7l9l7j/Pl
 O47i8BwFn5PBM1VMwLeSaF5TxXK07tZh3yCmEyt3+H1kudNLhYh2q2UQkOZC+wCO95Hu9/r/mm
 57I=
From: Bhargav Das <bhargav_das@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Bhargav Das <bhargav.das@siemens.com>
Subject: [meta-oe][kirkstone][PATCH 2/2] pointercal: Add native & nativestdk package support
Date: Wed, 3 May 2023 00:07:09 +0530
Message-ID: <20230502183709.150505-2-bhargav_das@mentor.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230502183709.150505-1-bhargav_das@mentor.com>
References: <20230502183709.150505-1-bhargav_das@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: svr-orw-mbx-13.mgc.mentorg.com (147.34.90.213) To
 svr-orw-mbx-13.mgc.mentorg.com (147.34.90.213)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 May 2023 18:37:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102276

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


