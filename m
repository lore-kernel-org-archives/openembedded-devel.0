Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8570EC83F27
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 12:42:53 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.11623.1753188167612973499
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Jul 2025 05:42:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ggWkIaSK;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: a-christidis@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56MCghvv1493950;
	Tue, 22 Jul 2025 07:42:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753188163;
	bh=efSxFyL6+4Cnlb/QgN5wGwMSFuXC0dLY3acZ2UAsgbk=;
	h=From:To:CC:Subject:Date;
	b=ggWkIaSKExmiDGzPYaIK6r7yNqChWi5IDTRiYAbMbRK8tVCASM6T8ss6oFnQq/S2h
	 8DdycX9MtZcKWJ6k+pYumP2uufOSJn322SMpw2FVXIyyidGxu/sZvigeNQD8X1mP2T
	 ZXTd7vR6B8Qd048QdYirHrAT3lH88qOvzaxENwjw=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56MCghbo4102088
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 22 Jul 2025 07:42:43 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 22
 Jul 2025 07:42:43 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 22 Jul 2025 07:42:42 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56MCggvk1337322;
	Tue, 22 Jul 2025 07:42:42 -0500
From: <a-christidis@ti.com>
To: <raj.khem@gmail.com>
CC: <Ross.Burton@arm.com>, <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][master][PATCH v3 0/2] ktx-software: Add recipe v4.4.0
Date: Tue, 22 Jul 2025 07:42:40 -0500
Message-ID: <20250722124242.190066-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 12:42:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118691

From: Antonios Christidis <a-christidis@ti.com>

Introduce recipe for ktx-software, version 4.4.0.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>

v3: In the patch responsible for adding the ktx-software recipe:
- Disable lfs for git 

v2: In the patch responsible for adding the ktx-software recipe:
- Removed individual LIC_FILES_CHKSUMs of all the LICENSE files. Instead
  now the recipe has 1 LIC_FILES_CHKSUM to REUSE.toml which states which
  parts of the project have what licenses attached to them. If licenses
  change/new ones get added, REUSE.toml should change.

Antonios Christidis (2):
  ktx-software: Add recipe v4.4.0
  licenses: add licenses for ktx-software

 meta-oe/licenses/Cesium-Trademark-Terms       |  39 +++++++
 meta-oe/licenses/ETCSLA                       | 109 ++++++++++++++++++
 meta-oe/licenses/HI-Trademark                 |   5 +
 meta-oe/licenses/Kodak                        |   7 ++
 meta-oe/licenses/PNGSuite                     |  14 +++
 meta-oe/licenses/fmt                          |  27 +++++
 .../ktx-software/ktx-software_4.4.0.bb        |  16 +++
 7 files changed, 217 insertions(+)
 create mode 100644 meta-oe/licenses/Cesium-Trademark-Terms
 create mode 100644 meta-oe/licenses/ETCSLA
 create mode 100644 meta-oe/licenses/HI-Trademark
 create mode 100644 meta-oe/licenses/Kodak
 create mode 100644 meta-oe/licenses/PNGSuite
 create mode 100644 meta-oe/licenses/fmt
 create mode 100644 meta-oe/recipes-graphics/ktx-software/ktx-software_4.4.0.bb

-- 
2.34.1


