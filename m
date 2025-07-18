Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 020AEC83F17
	for <webhook@archiver.kernel.org>; Fri, 18 Jul 2025 15:03:24 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.904.1752851001695642925
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Jul 2025 08:03:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=fx28Ljo9;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: a-christidis@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56IF3Gwi741636;
	Fri, 18 Jul 2025 10:03:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752850996;
	bh=z0xEg28pFCq/jSBCoNjg6ST+c27VTaNfhNLTSqt4REQ=;
	h=From:To:Subject:Date;
	b=fx28Ljo93rmY5B9lFdrsh2KOK2W0Ek+mo7EsgLAPBkND2+MF5eHxex4Xnsy383w3X
	 FDLlDp/dhO79XWpWy4Y+RQev7yCePB1k7tiwXdnTag8ep1f9WIDWyFkEC8EeV8K2DG
	 vYbKG/1uLti6/h0KNRxF7ZCSFE/u2eO/U3b1tK5o=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56IF3GI83002812
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 18 Jul 2025 10:03:16 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 18
 Jul 2025 10:03:16 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 18 Jul 2025 10:03:16 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56IF3Gvw3684945;
	Fri, 18 Jul 2025 10:03:16 -0500
From: <a-christidis@ti.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>,
        <Ross.Burton@arm.com>
Subject: [meta-oe][master][PATCH v2 0/2] Introducing ktx-software
Date: Fri, 18 Jul 2025 10:03:14 -0500
Message-ID: <20250718150316.2579996-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Jul 2025 15:03:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118627

From: Antonios Christidis <a-christidis@ti.com>

This patch series introduces the ktx-software recipe, as well as
the required licenses for the software.

Kind Regads,
Antonios Christidis

v2: 
- In the patch responsible for adding the ktx-software recipe: 
  Removed individual LIC_FILES_CHKSUMs of all the LICENSE files. Instead
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


