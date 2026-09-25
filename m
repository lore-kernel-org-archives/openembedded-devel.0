Return-Path: <mark.jonas@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C30CC9830D
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 13:40:48 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.39])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8336.1790343641212696331
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Sep 2026 06:40:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@de.bosch.com header.s=selector2 header.b=X3hm2mmw;
 spf=pass (domain: de.bosch.com, ip: 40.107.159.39, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IYNuqYu7JagLoyVtZLWF/bCxUsCSH5yP7xLgW7HT2DZ+ZIeQWbfuGBHdgTmDQ1Gi341Xx5kMdzDXeJT6QDPTYW88aSeTMcojiBjpMulAuax85pHACraMC1LOkmG2J0/6HoAwDK9bs2bcbFRX6kGp7psGGP2SNBOvq0GgP0ikazXtXyZxB0qb+Jiv4xlRl3PZG568nuqSEgqBb9eElhz9cJ64pTbiwj69vXQzoQZDNAtvEEAcB1nezpcY9r3PJuG6AU+t0D4XSU6wdGF3QCpVOB/wTpqhIwgkIeLmJOXEpS2XSqF6kP5tVsRRa4sHovJ+urjMmVFkxAf83JkmNg5i3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7gDO25uTi6ZWXDbMCqDYMCtSeT3njOLEsY/oKWSxb1E=;
 b=QsQpDacDCV68KUBxIGt3dIoKEB4gmKaMtQu7U0Pg5exWErwaf0xhIdHe2825nT0le+zVJ7JE+pUDzen2c21O7fwJYCzASFM2+9uPNGnrKmx99cMH0lUQpKiEPnqHxLMotE7z8CXROurlNS8+pHvZaTNvJ91YZuag3pmU/415pIjSX+ErBnvVeimkRhdYAlm9tS2SzKU20sMg3/E3risyWSP5Jy5t6CHK6Vws47HZ98F3ivCoXGwlU12XDxHH2FqRHcOEg2Ur+Fntpahcyy609AXUVMIjdRei5WtC4Xk+u3MNXCMNuZPMJd4wdBc9r4yKHLruwCsfDF8ADGgppcAYfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7gDO25uTi6ZWXDbMCqDYMCtSeT3njOLEsY/oKWSxb1E=;
 b=X3hm2mmwq9RTij4scy0qgdLBDe9rQTtLlQy1g1NwNCkbMuYawulrQDIcB1WMAEzyrZiBq4/eqJrgjqxYAPtvfWGjIFV/55VC+huqmaDH+FHDouAoKlcNX+IIfzC+kYgK4DNNWfwvuzNKK96WO2O42yxKzzKDIGXlXwHtI0cFSQHvW7f5KNMJXSJkIFvR+epClTfGRdjU+vX9v9S48u4Gr+ZEA+bESfFq5UaavXRJnapadtKKgKv66/U6FumnB7CH5+blEq2dIJRQBdCPQF3T7LMIgVqRiJ2db2+7eOwFxqtpF5ddWL3h/m9i8MFFDwB4Yw0TWEytfWFpaHtPQrvtqg==
Received: from DUZPR01CA0056.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::7) by AMBPR10MB422559.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:6ed::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 13:40:37 +0000
Received: from DB1PEPF000509FD.eurprd03.prod.outlook.com
 (2603:10a6:10:469:cafe::a0) by DUZPR01CA0056.outlook.office365.com
 (2603:10a6:10:469::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.18 via Frontend Transport; Fri,
 25 Sep 2026 13:40:37 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 139.15.153.205) smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 DB1PEPF000509FD.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Fri, 25 Sep 2026 13:40:36 +0000
Received: from RNGMBX3003.de.bosch.com (10.124.11.208) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 25 Sep
 2026 15:40:17 +0200
Received: from GRB-C-0009M.ot.de.bosch.com (10.22.65.242) by
 smtp.app.bosch.com (10.124.11.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 25 Sep 2026 15:40:17 +0200
From: <mark.jonas@de.bosch.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <bartosz.golaszewski@oss.qualcomm.com>, <khem.raj@oss.qualcomm.com>, "Mark
 Jonas" <mark.jonas@de.bosch.com>, Ricardo Simoes
	<ricardo.simoes@pt.bosch.com>
Subject: [meta-oe][PATCH 0/2] libgpiod: detail package licensing
Date: Fri, 25 Sep 2026 15:39:27 +0200
Message-ID: <20260925133929.1991-1-mark.jonas@de.bosch.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.22.65.242]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FD:EE_|AMBPR10MB422559:EE_
X-MS-Office365-Filtering-Correlation-Id: ca1bd5c4-dd82-41b3-e24d-08df1b0a94d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|23010399003|18002099003|10067099003|56012099006|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info: 
	yKdE3dJYtpeIVIYOftSS+oslSf7CTw9krElfaNJOFKs2OW/De8oOn1AR44/VUsKaSlR9UUSQ3f/caOb74vUlLIGKBZuhFL2Kt4l6oD5iSc1ibVDJ3vIv1k47Xc71pPbih27Zn/viE5PSkQ0pHtv26WJwUphrDP1t2bq6yMEvgb6X4zGxrh4z+7QrSqGB8kG8d044JeyBGpdcl/gr47A9QRahksl391O+C04hjSOsh5RukKFUWw+dSQk8WrENw6uBf06tM4xg7mqf0NGxAPNgCNaKMpdUkIjUGKu1bb/RMI/X4Z1wqPqeuQOyYGZWuA4xxczEpGH8cyWbdgpI0xzzW7BoWA/4dDVTO7+qQX+W8YHV7+wYNfMwTvh6VnyRBlxQauupJxbDemxISv62EaQlZhOBFG6B5KjYEs/U7+wsSYqPnBUN2Hp14gSd1PsTQ6ehU3hwPZsxjXodap1kjkCBCuTR006fWXk12/C+B5iyBAMO3oD8VQmt4CwC5zC2zv7VaoWNWV0q18z3deR00v3FJ6kXidPjVC6CaMXXOJtuNu8ECayLgSfskkjLnfuW6u3J5sIMREvx64dVr3tQxr1VWg7+U8gqrVrI9PZlWzOW6zgRfa+Bif4TGqPk3eZcyIEEodVTMZm5R8OifLN+wD925mo9SZ9NTfEBWlB/qxKaP4H1N5sEDnS7GpQoPbpP8P1+LL90j5ZtZdNzbjAo+Hzkeg==
X-Forefront-Antispam-Report: 
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(23010399003)(18002099003)(10067099003)(56012099006)(6133799003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Gsna8j5WA0BvD4zIGie+eOskwgH8hJ0weVVtjaM+HB2QEhAhzrW4bjwtQL0Kfl/Q5wtT0XGQLFImZ1UM45oawPJomvYUwz9p8doCUOrMElybUZZihHBh6IuW5w4eRJ/hwxyX2l8qXn4BPQ5cvtEt1B+PT4Ghkd4XW7LDKGoZs7oeIpKnZFfnnZuuOsbh8BxkrC4vqngtLFmmIoTecwesKG7FHny7pY2mMZ0GbJTe9ZdmRJDIQV9onLYCw5Q33MH+qNh33/2P2hHeaCQF4lktlwhx6u1UX8LkcD6OmBA61ljWEyQrDlet89LBmek/Swc+npkW96+RHJyIRNv/CaReefgcxr8P6KPV6R3E03X3+LZl0it6fPXFT8Ngc9Sz6DX7u/8jTkaZrE37c3sZg7sNwOoVatKkm0/rK7NOG600/QCGcY4a6Njh+7caOli/xaSD
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 13:40:36.9451
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca1bd5c4-dd82-41b3-e24d-08df1b0a94d3
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FD.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR10MB422559
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Sep 2026 13:40:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130302

From: Mark Jonas <mark.jonas@de.bosch.com>

This series details the licensing metadata:

  - Patch 1 splits the recipe-wide LICENSE into per-package assignments,
    so each package reports its own license (e.g. the library as
    LGPL-2.1-or-later, the CLI tools as GPL-2.0-or-later).

  - Patch 2 adds the missing CC0-1.0 license, which applies to the
    90-gpio.rules file shipped in the PN-manager-cfg package, and wires
    up the corresponding LIC_FILES_CHKSUM entry.

Signed-off-by: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>

Ricardo Simoes (2):
  libgpiod: set per-package license assignments
  libgpiod: Add missing CC0-1.0

 meta-oe/recipes-support/libgpiod/libgpiod_2.3.1.bb | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

--=20
2.34.1


