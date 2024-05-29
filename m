Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33BA8C25B7E
	for <webhook@archiver.kernel.org>; Wed, 29 May 2024 23:14:06 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.49])
 by mx.groups.io with SMTP id smtpd.web11.3449.1717024438931696136
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 May 2024 16:13:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=iIny3GRw;
 spf=pass (domain: axis.com, ip: 40.107.8.49, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PRrHBNhzkfRoMGyE6vDg/wC/dROjeNiCf6elCYtE58RNDzaVkLX5pAxcfWVRkwu5WEbpyxhSjBelDNhyEsWz/tWNEgUJGB+VwEEB7tR74hBtLiREVUqAYfFsgVNxu+7vhZxyXYrn+sIVF3isucyF9Q+CFEAFsnMpO6weG2SElGB01VsOnsNqKuuGNK6/k2KwaPAYN7ux9X1owkmd4g9vHWWB5b2ISBRmNneCFJlQXDiYnCWyfq1C/QtpZmWYetq8KEFC2FKs1Dc08lsBU2mm+f2dFzpcu1cIxEkNu1E3bRUfnt4KMthPLHGJJ8Cl/+PPZFrxNDLdTkJs5qA6dzUleg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jbOCjzLX1h2ueH1PLkZWaLfjZk3B9Vzmp0+wl5dRAaU=;
 b=JIJoqGTpCramZKfgcnzfMk4i6Y894XbikDvJfc/wCS/ornmjWh1GNVKa2gbYftCWau/cSPizHi1QblOZqOioJEQ8Ld2phtMWJuNiWkPVfKrMAw2RkP/eDsC3sHlvbiGd/UeqipGHmc0PwRmnjsEydVz1Q1KGVxndJv7xtqedNksfGXOYIxcEruHpkQAX+CoGJCQeoHxr7uFibqeFsWWCPNTTZEHIPLQcw1D4bSdjGV8wgaNXg8vWYRSd/mrwA5v6LPZcTZADpx/B4O9JtN4cogDJjRnJzhoVRDIsSdQfggnaJfBo9K3zLw7AqoHeQAEhDtNZ5AO7QKeWx6wAcgjoSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jbOCjzLX1h2ueH1PLkZWaLfjZk3B9Vzmp0+wl5dRAaU=;
 b=iIny3GRwvxhSO2iDoj1K3n8CDsJCodU00PuuDIdIF7ORy2W70IBB7tKMF1qo5tn8sOWLrcMsxPGB1eDgY4FH+YR8CvvOcIsMaiVlB1r8f5u8NBPc3TdBBIyEvfgcCFBcy/mwAXMl+NGyQmsD/sQ6YW7926Nhc9uAacoR1Mk5PiE=
Received: from DU7PR01CA0027.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::14) by AM7PR02MB6338.eurprd02.prod.outlook.com
 (2603:10a6:20b:1c1::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.19; Wed, 29 May
 2024 23:13:56 +0000
Received: from DB1PEPF000509F9.eurprd02.prod.outlook.com
 (2603:10a6:10:50e:cafe::3f) by DU7PR01CA0027.outlook.office365.com
 (2603:10a6:10:50e::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30 via Frontend
 Transport; Wed, 29 May 2024 23:13:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509F9.mail.protection.outlook.com (10.167.242.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Wed, 29 May 2024 23:13:55 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 30 May
 2024 01:13:53 +0200
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 30 May 2024 01:13:53 +0200
Received: from saur.se.axis.com (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 292A11DFF
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 May 2024 01:13:53 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur.se.axis.com (8.17.1/8.15.2) with ESMTPS id 44TNDrjm2413910
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 May 2024 01:13:53 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 44TNDreq2413909
	for openembedded-devel@lists.openembedded.org; Thu, 30 May 2024 01:13:53 +0200
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 3/3] libjs-jquery-icheck: Correct LIC_FILES_CHKSUM
Date: Thu, 30 May 2024 01:13:49 +0200
Message-ID: <20240529231349.2413885-3-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240529231349.2413885-1-pkj@axis.com>
References: <20240529231349.2413885-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F9:EE_|AM7PR02MB6338:EE_
X-MS-Office365-Filtering-Correlation-Id: 3788ed94-a0ef-473f-252f-08dc8035037d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|82310400017|36860700004|376005|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8rw9LxodjCfCapRDcZ4jUEhhkP2bvJu98rDYGVRkXXUlLf4p0PrWLMcnhybj?=
 =?us-ascii?Q?IS7VNL1Yl24a3rGzR9It7RVtATF8eaRZ+VUQ7mg61JG/RZt85dQCd3N3u/0q?=
 =?us-ascii?Q?aWyqRiHY+rL/5NPSG6gjJ3N4R7H2go97/IBz+CzXXFrXqFkqW1AmGSU3KvzV?=
 =?us-ascii?Q?UmaDB7+I3t755+rhjkaivULqOlX6y/RiH5hcCD70tw0ZmbtJBLFq/FQLSIAt?=
 =?us-ascii?Q?2uuDIJiF3PbrVCcCRRFWyLDZWWwqKazrT1PHqkHeWaoEQFDpUZYwjeM2TaV9?=
 =?us-ascii?Q?61P8DruPjGQXUAUPwNmb6Y2pBju3YEUdO5c0JRlZwqCexLn7Zjaodi0izm37?=
 =?us-ascii?Q?2NHgUiOQySNazQcMzqScpzj/CFmocEOxn+V0ONuFHgJYFpUmqRfM1T8Cl2pd?=
 =?us-ascii?Q?0VrOTgHY4Q76FpumAeqaayj5e62srC5kJs8u4BtdMDHFyH+rwMU1zQZAmUAc?=
 =?us-ascii?Q?2PwpuzBXwuhTwMNs0G9QoC28NOxBGJSuBYtE9IlxLnxwHAabgeeggrO0bIrn?=
 =?us-ascii?Q?Zoa4r95v2dqTGYJYU3sofLc6ccCdRP2yuSXFKboaRJKNAnU0A4ZJdo9ZNCLg?=
 =?us-ascii?Q?42Gd5nYXffmIw70dWMlANBV1DWYva+ZmbpSwejLbcgHm1Z33Tsr+Uvkr9jjy?=
 =?us-ascii?Q?kHKKXKrFr1pjoLn3MsFCGae5w2boJ8G4K40ok7H+3cdkZWQ68C+fMXn/jVsw?=
 =?us-ascii?Q?xmRGxN7cDIkwN8eZzJlcncm2QQMklwM9mQkMjZhGgHNPGdDabVEK5HoigGW/?=
 =?us-ascii?Q?KY9i0CFF/lbazwCR5JDDvmBC2a1Wen0g96HTVqd+4WXHWLgz1UYoVooxaA0a?=
 =?us-ascii?Q?2gdJGGgdqvWxlD+m4eBtbJKE1aSbf/rElOsfZCTv2Z6arSaJbz8lbHVU739F?=
 =?us-ascii?Q?2ptemwCVgn+kJAg4ZkTiEAxW+Fl0DCNXJhnYRpR8p45x3c8/mUdx7sD4Reko?=
 =?us-ascii?Q?r69//z75aG84oa8LeVB2trCRB2x7/pvnZbfPIYrX0b19+6MiujzUJeFukmeM?=
 =?us-ascii?Q?edzbpzGPvZmjqsaqqQMTvnlpEKFCCEyBQB4ujms4w3CIsgHi9KGgRVIt1P4x?=
 =?us-ascii?Q?/TD7dtZHbqPbnKrnYXd5x0jjmjqTmCYBEpvJiHad12d1b7Tj2YCzYQIS9uNR?=
 =?us-ascii?Q?SC62wDkGvDyDALJulpsIheHUcNXf3V9Q56fZ1lujCAGpEhzblOtPgWIm/td8?=
 =?us-ascii?Q?4t2fd9RgtPUuLWxZLqk9//nbmfhTxwR2MwZ4ZKhEzzAq3N/jXxBuln+EQ+fX?=
 =?us-ascii?Q?WTTVhxzBoEWdUev86FgJs246v0WEkMXDHNLFzQA0drRQw9h7fkoHK1v0KmuV?=
 =?us-ascii?Q?C2Ce/gnwIg7FtKIBO/ruGXzg?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(36860700004)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2024 23:13:55.9141
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3788ed94-a0ef-473f-252f-08dc8035037d
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509F9.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB6338
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 May 2024 23:14:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110620

Only include the lines from icheck.js that cover the copyright and the
license text.

License-Update: Only include the relevant parts of icheck.js
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-support/libjs/libjs-jquery-icheck_1.0.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libjs/libjs-jquery-icheck_1.0.3.bb b/m=
eta-oe/recipes-support/libjs/libjs-jquery-icheck_1.0.3.bb
index 31c3534b8..63dfc6fa7 100644
--- a/meta-oe/recipes-support/libjs/libjs-jquery-icheck_1.0.3.bb
+++ b/meta-oe/recipes-support/libjs/libjs-jquery-icheck_1.0.3.bb
@@ -3,7 +3,7 @@ SECTION =3D "console/network"
 HOMEPAGE =3D "http://fronteed.com/iCheck"
=20
 LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://icheck.js;start_line=3D1;end_line=3D8;md5=3D4=
04078d7de9f05ed64d364274f790055"
+LIC_FILES_CHKSUM =3D "file://icheck.js;beginline=3D6;endline=3D7;md5=3Dea2=
5eee37fc3b14403e215bfe13564bc"
=20
 SRC_URI =3D "git://github.com/fronteed/icheck.git;protocol=3Dhttps;branch=
=3D${PV}"
=20

