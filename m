Return-Path: <mark.jonas@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61C94CA5FA2
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 13:07:42 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.35])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.57030.1790600855478855497
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2026 06:07:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@de.bosch.com header.s=selector2 header.b=bDiMYJUW;
 spf=pass (domain: de.bosch.com, ip: 52.101.72.35, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=al7aYL9hnGVFswsxcnz3OKUgPTJ9/NeB0lEVuooPdyFSDeBb8gzzRSE3ceOHP0y3fOjgKRTPx8KeXFvIRjETEQaBJxNLx8JEfno1vJ+C6G85KsXMC+b64AamGN/GqIP1kaF5XJHA8HvOR+CK41SzjLloHqz67spA71sny+KDRSfEg0XAdZ3NO5Vt8ReJZLzzcyADdBClLc9R0/yIxrH6BrIrsYBDS1KIOvVtT6WqcXNy8j2kF4QBZAT3fmNCuP/b9dorZdrUflsclFbxXsBO4/Y7Snn51uG//EbVNi+v/DpoAZKM/9TTdl5ymLY94GQDQq/PRAelcYBJy2g/yHFHvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qUVdOzmN3VJ1ICHGjSwo7kko1cCRHEx3lcSszlll6qw=;
 b=m7RhpsP6SlWTeFLFAJnTsAAUjWTAvyNL/vrJP0/Zx/SVu4Tdj1e4Of+uPfKfzZD1NTfA/rvuHhfUmn+Kyv+ATaWSNEVypBbAgWiQ6bAQDrIPHB4LRNnOOMlsqLYxp+N7YnzHrIznNKmdjGJ6iGCiBMg6T8aC5ZOFb64LqgyCcKQv5BSWw3zY559dHjeFrHKgOo/MSBl6uz7OqGosIX3dQfcPVx4ngrL7X8f4r2vZ0L6ZXw/lImzgpDlTHG36LeBirXNC/hkXjDTYP+hFmA0ARLz2QDVc7cwnopicv82/ZeKXV4iYeHExfkZOwXn3r2PKhNKXzwffRc03MelpBPukmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qUVdOzmN3VJ1ICHGjSwo7kko1cCRHEx3lcSszlll6qw=;
 b=bDiMYJUWHosBZ2t92lFed4A6gKWdKbVOZbpvuMIfnuuUpreVtDL7z9ffmt8gOK3shuIn/ji7/K3mVLLepUgRhFkaT6sDKRHWezUbjQVA/vhHTHtRZQwpxfMREMg4Dsqch9kKK5ylCyfg0aeU3XQph4MSkwah/7g1G7gFqcATxxdquGBgopSswEdoPJo1+0ExYlYJYjCdu5So8iMDk7Tt/Mlrmw/GIqk3UTYoT9otlj4PvWUfgspci0nOde1vepDPTOw5up6a3+KAIdO11dfybTxcH9mFW1ukzkQS7xf0aMj6tbGoiqbF/cNxKEWJYT6KtPkPJnbtax5wCbsLt+MhCw==
Received: from AS4P250CA0010.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:5df::7)
 by GVXPR10MB5935.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 13:07:26 +0000
Received: from AMS1EPF0000009A.eurprd02.prod.outlook.com
 (2603:10a6:20b:5df:cafe::9a) by AS4P250CA0010.outlook.office365.com
 (2603:10a6:20b:5df::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 13:07:26 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 139.15.153.205) smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 AMS1EPF0000009A.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 13:07:26 +0000
Received: from RNGMBX3003.de.bosch.com (10.124.11.208) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 15:07:09 +0200
Received: from GRB-C-0009M.ot.de.bosch.com (10.22.65.242) by
 smtp.app.bosch.com (10.124.11.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 28 Sep 2026 15:07:08 +0200
From: <mark.jonas@de.bosch.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <bartosz.golaszewski@oss.qualcomm.com>, <khem.raj@oss.qualcomm.com>, "Mark
 Jonas" <mark.jonas@de.bosch.com>
Subject: [meta-oe][PATCH v3 0/2] libgpiod: detail package licensing
Date: Mon, 28 Sep 2026 15:06:29 +0200
Message-ID: <20260928130631.4254-1-mark.jonas@de.bosch.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.22.65.242]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000009A:EE_|GVXPR10MB5935:EE_
X-MS-Office365-Filtering-Correlation-Id: 41cf73bb-49fe-480f-9f0f-08df1d6171a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|376014|82310400026|36860700016|6133799003|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	w39PgiGjNpcHqwxUyz91in4CYwMhcNenoJLroEssLHKAvWU1HCFSmAEIOLbCOEFMOHFcloxpBMrkJmExjxVd67JLWq6IuvZ/HYVQ2SNCdlZ7q/W60aDytjR7IkW5/3Kth6fic4J8QYkyzYRubYRqzdFUvvic9pM3SG2Q1QqOeIn3FhoCAxelQxtcXQqjWcTxF6W3Sfzl0BjN9I6BAqsFEYVGuUulKsFPKXFay9K3lIqjkEhLXoUExoiE8jOOKzCu9mz/R7+TmLJTpaWIGozvLsn7LfTKqN1c3SRHV/WtBlfejiX8cp2oq8i94i0uYiVjXnDBvhwFeQGEo1izsmpnLWwTSuA3apAewbDCLEErlbgYuH2cAZaFC3L11JyFVY/6aq5Uen+sjL6Opm7OgvclIlO+io0dIBM1YCww9p7GmMQ1doFUthPJIJvP8R7vDI59y0BlSbFUjX4Qa9KwQ9Q1P5cJcVZGv0zWeMQQ0Ha3xJaMCXynaIhCwSIghGxjhWQUlKDI+5YqER/+WYuW95vwgB7SUGrDOGgajpFWU3Gl/z3/tr1eDKzwpqBMxvq3IM+88hVDxWKDU1xDxqSMrpUEkFnR9law4wyjrUjvKM1/sMNHlYti/G4m1UYTCIA03iaiQW5oTgkMqqii2nJj20p58t+Z8zOy7f1SnY8eaOE1d11YIoppeI0rjquSneWii/95ITbuNZ3FVhbfJg/ypZ72Ng==
X-Forefront-Antispam-Report: 
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(82310400026)(36860700016)(6133799003)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	dK2VSmFRURpYBPDHTP1BBa7ofvpy28U/APkBYrptQPmRufS6jIO0iYTAajBNiBxZYkSXEnQwLeVaw3CDsl0/MfGiIs4X+h77LzxTr+IEMBwpoTkHF4FS1BzCn7ztvAX/2aYLFBDGD/26dJcI3dGqgitik5V7S/LsaQhNuFy6dD6FbK8ioEOZpx2k0d71WrRzn5/8Wk1EP8b9cF6Cz26agV7+xR8csGWj9hC0zRjvY5fNhenx9+uiQP8F1tpVelOPInR8Ux0kO7DLYb6le06pLgfAsOwnY92IWMFuKrNplczwHWpY61C5EqBbBzJYSEFcUMq/wr+9XLrWlgy+2JIb8gX2OcRjm7iArstVwCGtcSkbR6wI1lNm9S0cr4LpHen/Sf6Iw6+GglasywOICPl1hX3cPK/eAUoIV1Z5xerVDUqoYh2UcwweEfHNGStkBr0A
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 13:07:26.4455
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41cf73bb-49fe-480f-9f0f-08df1d6171a0
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF0000009A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB5935
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 13:07:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130439

From: Mark Jonas <mark.jonas@de.bosch.com>

This series corrects the licensing metadata:

  - Patch 1 backports a patch which fixes the libgpiodbus license

  - Patch 2 splits the recipe-wide LICENSE into per-package assignments,
    so each package reports its own license (e.g. the library as
    LGPL-2.1-or-later, the CLI tools as GPL-2.0-or-later).

Changes since v2:
- Inversed the order of the commits.

Changes since v1:
- Squashed addition of missing CC0-1.0 license into setting of
  per-package license assignements.
- Backported the license change of libgpiodbus from GPL-2.0-or-later to
  LGPL-2.1-or-later.=20

Ricardo Simoes (2):
  libgpiod: update libgpiodbus license
  libgpiod: set per-package license assignments

 .../libgpiod-2.x/fix_gpiodbus_license.patch   | 26 +++++++++++++++++++
 .../libgpiod/libgpiod_2.3.1.bb                | 15 ++++++++++-
 2 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod-2.x/fix_gpiod=
bus_license.patch

--=20
2.34.1


