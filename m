Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38360C02198
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 00:30:16 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.15])
 by mx.groups.io with SMTP id smtpd.web10.724.1739233809432556017
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 16:30:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=kIPqrfe1;
 spf=pass (domain: axis.com, ip: 52.101.66.15, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bNc1t3f8Ao90NuQFkE+KOYk0lh2zIitNpWy7bRw19+xb6Ery5VYBuz79Bo3rSWDjDZZ7B47hEOfT6kBuXRv33ynHr2Z/y4ydxlGyUHcFMkS7KUDJjXA3iBqYDkB8f7rvl1cJTzYf+lTW2rC6HweRcUeBSpcZCiFtA2bp7VDV/djIFYJDcPZEvLO+pPNkkaUCDeT5CUaJUYuURj3TGuf1r4Cb3kMPYMjdms/ByqfAuQPPxrSw5CMaf9uhzWvVlcNaZRV8vlYYGZbGHhOq8nijfR8h37UXnLlpqKuePxSQ2mR5fLNY/DgwwHtqGj0Gp+V4clEZRG9MwrxQKK5ZOzpXMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jOO/NC0xJre2LqjOySAw2w/RwXPOuRqI8DSb3s7bWL8=;
 b=POZ1rClc5FK09ysb+UBILW9b5cibvcvr+5RnTSaV4AyNyeP2VWY2Kujhfp09cHZ1iWt4fwC5mngEA3nVylik6iizIgXAexsEaqoeSCMsnTc1beJSCtUSwWxBMdesMI9JH9LkZeS+WUSg7R0o9+J5ZSMrvwc3MfweWbQPNKrESEZ2TU4BsNRPcWLfUEULFZJnGb7ixJebxlN9OPJyZiL4jps3Q0fOCxgaEZcjp2ieALJB9AVR1flHR6hSIr428sYoe5RJRBHTh3rE5+Aa78rk9p1/4qURxqZnA7qie3Y772lQ6nxrTenrYKQplAUO+pIJuqpB68kAHA99mYlPoPsZBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jOO/NC0xJre2LqjOySAw2w/RwXPOuRqI8DSb3s7bWL8=;
 b=kIPqrfe1aGQrBHcEg7IaizQdpxCoAyi2ZtPa3794/GLAvLlVRvhrsortgtQDDJ4BhlWF4Oaz25xMxvxjxIKnq+kRUl8CKy2MikbMhj5M5Kf0rrSs8lH+KSK/DybH7msMUxTIv32j80oMb6mCMP2bACVWfhGQ7bo+jo6m9tArqNk=
Received: from DUZPR01CA0235.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::19) by AS8PR02MB9719.eurprd02.prod.outlook.com
 (2603:10a6:20b:5ec::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Tue, 11 Feb
 2025 00:30:05 +0000
Received: from DU2PEPF00028D0C.eurprd03.prod.outlook.com
 (2603:10a6:10:4b5:cafe::4e) by DUZPR01CA0235.outlook.office365.com
 (2603:10a6:10:4b5::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.31 via Frontend Transport; Tue,
 11 Feb 2025 00:30:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF00028D0C.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8445.10 via Frontend Transport; Tue, 11 Feb 2025 00:30:04 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 11 Feb
 2025 01:30:04 +0100
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 11 Feb
 2025 01:30:03 +0100
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Tue, 11 Feb 2025 01:30:03 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id E231A235
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Feb 2025 01:30:03 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 51B0U3YX4186205
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Feb 2025 01:30:03 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 51B0U3364186202
	for openembedded-devel@lists.openembedded.org; Tue, 11 Feb 2025 01:30:03 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [scarthgap][PATCH 0/2] Backport of two patches from master
Date: Tue, 11 Feb 2025 01:29:56 +0100
Message-ID: <20250211002958.4186149-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0C:EE_|AS8PR02MB9719:EE_
X-MS-Office365-Filtering-Correlation-Id: e2f8747c-cfcd-4729-666e-08dd4a333af3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?FxZGgqq2x2Ots/50rC3y30Pxvrae7NcStxsVv0CnFtPgeyWPMpK2yUlNs2sO?=
 =?us-ascii?Q?PA1dz9sEuivEKBxkALIbElACTj9tXum5NhUKifyYYD8Lrmq6vqFKd5BeifUg?=
 =?us-ascii?Q?0hxKwUqilLFwj0E/b1OhmINhkYEiASyIugtsLD4BMegBQZQM33WmlKhKGNjE?=
 =?us-ascii?Q?J6OsNn4BkXjld70Ogqh9/YIuSWoKiDNJA27WCk4MzVyrOHM60M0lPvIN/FNB?=
 =?us-ascii?Q?6uLtfOUfetPtBxi6nniMJcygDFocVQpFtv7mzrGrw9maeNvxwSRGcFavqlW4?=
 =?us-ascii?Q?tkN2s4X5dLmwcB943Mw0po0xVnS0I2LOCAJYRnISY0iAdKLA5m+jVbecW/Xm?=
 =?us-ascii?Q?09Eb7NXaXXlSTM6JSFAEtfUZOo+VxDtNriIdJUYiGVIIw7uDyasD2rhNhWn1?=
 =?us-ascii?Q?ufklJYba7W+9Q90t13XT3hES2w8CNSKeeZQEb30v69obvG3HBVZrD9Eot4Vb?=
 =?us-ascii?Q?A0gSG0hckZMgY82swZeSB/28+GF/DRHAPQNofmg6jJuMuoJ2uXyW08rwMKcP?=
 =?us-ascii?Q?KejHnjZ+AaYn5dBzj0VrvnYTxTKu/F4owFZMTNxirPIE9zDK22/wSkM8ZXZ+?=
 =?us-ascii?Q?d6iFsByK4iy99YQTgkOV99pjayCSyXJND7tU9OVpapOvUVjIvjf6LQs7TJ08?=
 =?us-ascii?Q?/HAQDtO6F8NLgH95oNvqdY0+mEPXPxl8qrz7MnBSBGA4Zjr4a8XrFlvDhJu6?=
 =?us-ascii?Q?X19VPTKZf1aN0V0/EhWiR5HYl5gJskT74BHhyht/kM3w36cecJ58C5M17lMj?=
 =?us-ascii?Q?d+YZj+Wnig2BjNzatPt8Dg5ybOsSDjayGDUcABSN/HwIFh8vLJH9oRKeRQQV?=
 =?us-ascii?Q?t3Z4w6qzmtejOvfPg8gHo3aJV9+PXEzOi28n0o+eO9Kr5z+2I+jA0T3jnKx/?=
 =?us-ascii?Q?vTXToGi4Fmys3feyYZfVVUAxl1aYyFvNpBVe7rwqLh1paluduoqpfk02RSFM?=
 =?us-ascii?Q?szueohXRbrknqdalnR97EZtra09PrMqng4fZt/UijG6eZ/5L6N+a4KwucSBN?=
 =?us-ascii?Q?04e8MOozIjqdNGZroMIp+lYNpPCmle+iNU0o8RJ1uooyCC13qd7MubmWQRKm?=
 =?us-ascii?Q?+R9R+bI6kHTNrsiX4+M5AAxTaSSiXVxwaZD/BEko1SJAz0Gwf5DH3Zofesuw?=
 =?us-ascii?Q?Y0xMELNKCafFVn/aZuMoukSWUZ73quztxLETDS5qxz39COi7F7VuMbaO18ei?=
 =?us-ascii?Q?xPVl7ZOr8YA8IXpBRA5vGZSYVouvoHujffaQVjCl9EBnEEyi9doGyevuiU1U?=
 =?us-ascii?Q?PAQ5J7F3RdzX8Jjro/0OEzys+eNaCLgSF+GdQRVICbtp11ze8nn1bA9EmTCl?=
 =?us-ascii?Q?WQCs5BkjUjSarY39iZwFQuIF/0ytR7OXsdqxCsuOPiybP3KFnD82cWSq2/08?=
 =?us-ascii?Q?VrfYJdCe9zmK3RlarPA3+ODXzbgbxke0bmKB8mSek9ReyncWzJTUk7bIuXob?=
 =?us-ascii?Q?kQcGMPEX8J27/6sEkuVvF8iIlwtV8w9WIHbV37/nLVlT0BDSmWG2Pw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 00:30:04.8670
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2f8747c-cfcd-4729-666e-08dd4a333af3
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D0C.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB9719
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Feb 2025 00:30:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115417

This patch series backports two of my commits from master.

Compared to master, the second patch does not change the MIPACK license
to Minpack since the latter is not avilable in OE-Core Scarthgap.

//Peter

Peter Kjellerstedt (2):
  ebtables: Remove the dependecy on bash
  libeigen: Remove LGPL code

 .../ebtables-2.0.11/ebtables-legacy-save      |   19 +-
 .../ebtables/ebtables_2.0.11.bb               |    2 -
 ...0002-Remove-LGPL-Code-and-references.patch | 1040 +++++++++++++++++
 .../libeigen/libeigen_3.4.0.bb                |    9 +-
 4 files changed, 1056 insertions(+), 14 deletions(-)
 create mode 100644 meta-oe/recipes-support/libeigen/libeigen/0002-Remove-L=
GPL-Code-and-references.patch


