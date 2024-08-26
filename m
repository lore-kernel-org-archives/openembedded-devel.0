Return-Path: <mark.jonas@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91EC3C5321E
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 14:17:22 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.48])
 by mx.groups.io with SMTP id smtpd.web10.53891.1724681835088411647
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Aug 2024 07:17:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@de.bosch.com header.s=selector2 header.b=IVLZDow0;
 spf=pass (domain: de.bosch.com, ip: 40.107.249.48, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K+vi8i4MRe5MQdXZbLKmm1bmWv/Bz5ZcbaFa2TD8esF2wpcNUmL4HxxkAT/0Lz8L8E/wUHRzo4peahhDtLVFNjCDNwWe3tR3rbxB/vrRx5G/R++WBWcjz8mWitJcY+rF7M/77W3JgdBmqfHL6xyyjwgRCnjRF44QmADHd0cHseD4WIWzW5vzJDE9WzdD6p/ZceHHlE9z8cY1A99IaXV6SLFvmlqYjppQAym6OmKt3iak9MFMVeInJoKO+scXVByyC7N79MkiybF3nDXsadBLzPlsm7Z2MELUOzYE8HPQUsfmrF7lazXFmgf6YmO1pD03+vAwT0jm9MuPsHKChQT4ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cDeNncNATYTYj7ZKt+8g4RG2P4yZUJYPjioi4lAoZhc=;
 b=Kz1oXktlKWqjof57u46hBfwH85my+1E/qZGEL4vBFmLQD6Ycf7ZKryOyefFihfzmTJv8RGIo/38hkDmHN0AOo5QPD6ifKfMB/jUYXVNBHViHyb9JlZgkpwD0XT6toFJAvMWLdQUl0x882tkkKMQcdA/se6QrYSgGndPJwlLjk15e2SY2xp1qYCOVrxnECO9DEiHz4188b6RlvLOXWcVwHKEB0LosMYkV2RPp+bStrWwmg6Eds5i8PDWHNFhhOhC/0QhHw0a3tTrNFk8/BEgm2WaanufrAJlxMfF+Rx8vlm01NFbEvgtVzf4U6vYmr+ER2oG0B590NufWHo18C2+GvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cDeNncNATYTYj7ZKt+8g4RG2P4yZUJYPjioi4lAoZhc=;
 b=IVLZDow0s6mI1S18pWzG4pRtn5IGl7ArAui+Tt8S3BGKGxpL56Wmic6LI7KRAfovvGxqpaH5/hhIYaURRxOGq50psV61/J3cVmh0VjWXejiYWnWOQWta91gFrhaefqhUuqfD8e0ApVsQj9NArHUfByW7r35I/oSiWiDoUrIXzaBwKR/qfugQxU3QilQGQyjSBe0353Qpy+VhH5SuT7xSc9YL8mk8f6kxg3y1oYVorv2fOniTj9woMjYYJClZiwD7lRNZfmIjh/MCelSKwB6VVoPJhWkh0+SC7MAld0GkzvDD7LgJqdMU4QJNq2FLiwPgC0KjswczDacKHuUGGXP5Pw==
Received: from AS9PR06CA0737.eurprd06.prod.outlook.com (2603:10a6:20b:487::13)
 by VI0PR10MB8382.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:21c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.23; Mon, 26 Aug
 2024 14:17:11 +0000
Received: from AM1PEPF000252DA.eurprd07.prod.outlook.com
 (2603:10a6:20b:487:cafe::7) by AS9PR06CA0737.outlook.office365.com
 (2603:10a6:20b:487::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25 via Frontend
 Transport; Mon, 26 Aug 2024 14:17:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 AM1PEPF000252DA.mail.protection.outlook.com (10.167.16.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.13 via Frontend Transport; Mon, 26 Aug 2024 14:17:11 +0000
Received: from SI-EXCAS2000.de.bosch.com (10.139.217.201) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 26 Aug
 2024 16:17:03 +0200
Received: from GRB-C-0009M.ot.de.bosch.com (10.139.217.196) by
 SI-EXCAS2000.de.bosch.com (10.139.217.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 26 Aug 2024 16:17:03 +0200
From: <mark.jonas@de.bosch.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <raj.khem@gmail.com>, <ricardo.simoes@pt.bosch.com>, Mark Jonas
	<mark.jonas@de.bosch.com>
Subject: [meta-oe][PATCH 0/4] directfb: Do recipe maintenance
Date: Mon, 26 Aug 2024 16:16:40 +0200
Message-ID: <20240826141644.78746-1-mark.jonas@de.bosch.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.139.217.196]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000252DA:EE_|VI0PR10MB8382:EE_
X-MS-Office365-Filtering-Correlation-Id: fd8f81a3-6132-440e-27e5-08dcc5d9c6d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?moI3S5740Io3fANti+NDsHGXxfsQ47nTWB3Elt1h3DDmrbz8+ZJoeUwdVJyC?=
 =?us-ascii?Q?bHWJ94FAHX7TTuXI/jNJCoZaniZohWY+bwL7mCOSWBQfbHGdRFatlaA2oppl?=
 =?us-ascii?Q?yj3ixlCdwVGnwjyvWhIEeIQTKHevoFY/bCmxnZd2yawzOheda2AYFsRMK9j8?=
 =?us-ascii?Q?LEHx+aay35PR6Z3rrZqF2oNuGG/wyDZ06siraV9tipvYT0dkJ8YJX7oOMY3x?=
 =?us-ascii?Q?PW7luliz9eFCqWQe2YJflAA1BmFFv3bnB4G8ZChpczTDZ2qC09GCCgfZ/n6n?=
 =?us-ascii?Q?yrPWcFaZULxQ7N+3IdNs2C4zSlGr6lBdSAdJ1/ZTYeqHrJopEJpf3q6lxbls?=
 =?us-ascii?Q?lakCpke3ehM+1b3rI2dtYfk37ZrXKQktUdutlcxeIR5ICQxLZIWVNe/bQG1H?=
 =?us-ascii?Q?JLa8C9TCvqTDIdeVRL9dV+FOMDoXw8nkkvwdFt1sMVV2X5oEYCe1uXuwPD78?=
 =?us-ascii?Q?aRdybc6d1b1vr2hqxu/0xwUdCB3qafcmXfetp7P4WO4LeZ96F7g+cMI7ZRHh?=
 =?us-ascii?Q?/BTpPWqFlbWp2627g0AvsTwc+j6qa3D7X/9XqmAQV2FIYVBHiUBfxwvwuExb?=
 =?us-ascii?Q?B38Tngn1vUT6rmo9nPI/RsYi4iNc92M7NJgbZ9N5qspdK/ijISwL8t3HQdDh?=
 =?us-ascii?Q?e74/gj61mXwvJ83Bi88P1EHbiz3qurxawtB7mGxpR8JHNLrhqnUuYkRhzPtd?=
 =?us-ascii?Q?fP1dPXf0wxL/8raTIXcaPRKZnbtRvGatZBgiPSHsRXFOLXrBLiARPURhnLqM?=
 =?us-ascii?Q?hsc2iId1NIQKUGJpXt1H2Fp0CtgPITZRrj01oF09vyLuRf0qC7PFHk54Nx+o?=
 =?us-ascii?Q?uSAAYkoH/SHb76xk4qgvfqm2h623FagznLGMSmRPdyhfdnAUfy1n0uOodhkp?=
 =?us-ascii?Q?1Mgp8FiuI2hpl37saBTZTIqs/eVs1t/HCs2/0Rl4cuznl5LagPVDamUPxnEe?=
 =?us-ascii?Q?lC1QvIM1ry5kZ0/h7cKwCJV76dfZ7qzzmgCrsKKVlyXccWptuywysfN6V1+a?=
 =?us-ascii?Q?Lr0lIQHdbajO9Y+xxYBjN8NEU07fqCjOQKhQXYZ5qpTcyLa1hQ/7IPBvIxQ3?=
 =?us-ascii?Q?ZgAO599DBD47NPW3nruOy4q/zDpkZbvPJ8cTd1OrT0uQw4IGpc2ftPBZVU16?=
 =?us-ascii?Q?Sexy7GbE9Lkw2VM+SDdkhUVj/RG4EiocUvoRn2a1yKP3T2oFMFXt1pFRj7Xe?=
 =?us-ascii?Q?rjqSaR3Y/wAcBk632G6A6Ief+iZOITfMfTDAkYszJwTxCkI2pvyP2vJwkbcr?=
 =?us-ascii?Q?KWDErAvEsoTt01lARL3zVyTIo79B56sLFjSDaD4gvqlHtTeccVEDN3/J3IZx?=
 =?us-ascii?Q?Drzq57b7PhYacQV5/GUntcRHUBvjD8NATHKpq6zYC9StgvnKZLCOuJtbz8qH?=
 =?us-ascii?Q?qXApBXGfE7PYvKC/IJVF1o+AIiBlyfQJaA2M2YmUWvMl8/Irhie0exKVOTLp?=
 =?us-ascii?Q?iMBDMqTEThP33CkjEPvBHrkTg0N2JdwR?=
X-Forefront-Antispam-Report: 
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 14:17:11.3641
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd8f81a3-6132-440e-27e5-08dcc5d9c6d6
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM1PEPF000252DA.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8382
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Aug 2024 14:17:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111963

From: Mark Jonas <mark.jonas@de.bosch.com>

This patch series for directfb will
 - order PACKAGECONFIG features alphabetically
 - add freetype PACKAGECONFIG feature
 - add zlib PACKAGECONFIG feature
 - resolve compilation warning with C++17 and later

Ricardo Simoes (4):
  directfb: Order PACKAGECONFIG alphabetically
  directfb: Add freetype PACKAGECONFIG
  directfb: Add zlib PACKAGECONFIG
  directfb: Fix C++17 build warning

 .../recipes-graphics/directfb/directfb.inc    | 19 ++++----
 ...irect-remove-use-of-keyword-register.patch | 44 +++++++++++++++++++
 2 files changed, 54 insertions(+), 9 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/directfb/directfb/0001-libdire=
ct-remove-use-of-keyword-register.patch

--
2.34.1

