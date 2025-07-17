Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA41EC83F1A
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 19:57:16 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.4777.1752782235251468598
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Jul 2025 12:57:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=zW0j+qKG;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: a-christidis@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56HJvD2X544386;
	Thu, 17 Jul 2025 14:57:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752782233;
	bh=TsNFZIwzSu9kUC0Uxc3+KaxA5v/b83kyxS5W6YIGddU=;
	h=From:To:Subject:Date;
	b=zW0j+qKGE8ejjUhgvnWWP/7NqwGZTFSTkY9YOTeaqqRI1e1bpmoEtQQKY10zNuOQD
	 5vZYcVS4bJHOCkY/BlacZ3I0Sn0xL0id0xM9LH/pvyEY0Oob2XtEyxx/7ov4QzoklJ
	 yZh/98b6uDVGaess0xsRik6+/bT0UY0iudJWc7wc=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56HJvDMl461379
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 17 Jul 2025 14:57:13 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 17
 Jul 2025 14:57:12 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 17 Jul 2025 14:57:12 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56HJvCCN2387890;
	Thu, 17 Jul 2025 14:57:12 -0500
From: <a-christidis@ti.com>
To: <raj.khem@gmail.com>, <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][master][PATCH 0/2] Introducing ktx-software
Date: Thu, 17 Jul 2025 14:57:10 -0500
Message-ID: <20250717195712.2538506-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Jul 2025 19:57:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118617

From: Antonios Christidis <a-christidis@ti.com>

This patch series introduces the ktx-software recipe, as well as
the required licenses for the software. 

Kind Regards,
Antonios

Antonios Christidis (2):
  ktx-software: Add recipe v4.4.0
  licenses: add licenses for ktx-software

 meta-oe/licenses/Cesium-Trademark-Terms       |  39 +++++++
 meta-oe/licenses/ETCSLA                       | 109 ++++++++++++++++++
 meta-oe/licenses/HI-Trademark                 |   5 +
 meta-oe/licenses/Kodak                        |   7 ++
 meta-oe/licenses/PNGSuite                     |  14 +++
 meta-oe/licenses/fmt                          |  27 +++++
 .../ktx-software/ktx-software_4.4.0.bb        |  31 +++++
 7 files changed, 232 insertions(+)
 create mode 100644 meta-oe/licenses/Cesium-Trademark-Terms
 create mode 100644 meta-oe/licenses/ETCSLA
 create mode 100644 meta-oe/licenses/HI-Trademark
 create mode 100644 meta-oe/licenses/Kodak
 create mode 100644 meta-oe/licenses/PNGSuite
 create mode 100644 meta-oe/licenses/fmt
 create mode 100644 meta-oe/recipes-graphics/ktx-software/ktx-software_4.4.0.bb

-- 
2.34.1


