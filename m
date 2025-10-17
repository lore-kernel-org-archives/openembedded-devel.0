Return-Path: <m.schwan@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D474CCD199
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 14:54:01 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.138])
 by mx.groups.io with SMTP id smtpd.web11.17715.1760712832068015815
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Oct 2025 07:53:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@phytec.de header.s=selector2 header.b=i11GbYD0;
 spf=pass (domain: phytec.de, ip: 40.107.130.138, mailfrom: m.schwan@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qBGBi2MhLZt1HOWysZcxBWYdod3R40e2D9MasBfIVD0K/x1StIt7slcw2DiLAmfmsp0V4HsycEH5H+pIksvfeknyXyHVs/jgLIdj4NbauZARYp8a7MMMfz0SUHD+5a9J4Ks6Lqdg3+1xIzl2w1GI0vo4VNXhvfAyhsursoTJg2L1aMJsX5BcmMt+YpStPRRFmZnuiC01yf15wpBkMBIVvoGthBal6lSfS6DfXKZJ4kXWyS0Abw9R6spZYl58dTLWmw74XtpBiSHXh2eAsz63m4duzlRBAyNxlhrCErPvZPt6K2uWwKKWkp3XFPthVFqpkguOBZxq1kbUy8I1MWb65Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I+7MI87aAQUdTF88G7aKW5OGTr1yoFmIrQZW4iyTm6Q=;
 b=x8QRi6m8bJOpeurqjZ8VQAMwDIKgriniqDcrWumZamc6r2XNJ5F1ljBPNyMkHLzqd6A7jOxCJ+E5XO9MqfiYiLjtlqlKIzq7X15NUHL0R4/iU2e5gI+PhuNGxYpRu29XQIaa1pNsf6aSmUjPJ+UMiTXdBv3sfkYikvFkFdL3MX2JjswczAJwGKRe+G0otTINw4Qm6ZWLB7d8LYMt0RZUmCWX63ZQEGM0nMrsvWFNNFlmtkeEC6RA5R/EdB3Zp+3NBFJkN384KkwY8qinCY9aEpeQARBEGUNv04le32+eeqIH5oAEy5BkD22j3au74jnVv2+c/bTAKwm8rDUUgM8nzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=phytec.de; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=phytec.de; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I+7MI87aAQUdTF88G7aKW5OGTr1yoFmIrQZW4iyTm6Q=;
 b=i11GbYD05zR2ZKGHQoZ+x3qML+VZic1gSR44/ID1swQoPRLPm4ivhjxzwbLqkdMyuDcmU7sz1WUdj84U3Uul1UeHK9R0sZfL7fIWIu2RyOoFoVspdExPrlUPMKyTSyl4k6YtG0rkyFGYLRTAG9idkVKCRnQM4H8YQCBUUFdmOWm7ob164SlPeKa29Hef5zNarBV1+hEQYqEQs/Yry6XMXbQrVNyv6C/7YFa5ZuKEhVv9OjEZCjPaBtwwwsO86aw2NT0gocpDR86/Qdmlg50P7P92dDsmQtiZWCLvNirk09YELeNYADVxA1CcZGUHx0cbtBHUi3LTbE63/iN+4AJQlg==
Received: from DU2PR04CA0215.eurprd04.prod.outlook.com (2603:10a6:10:2b1::10)
 by DU7PPF35725062C.EURP195.PROD.OUTLOOK.COM (2603:10a6:18:3::bce) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Fri, 17 Oct
 2025 14:53:47 +0000
Received: from DU2PEPF00028D08.eurprd03.prod.outlook.com
 (2603:10a6:10:2b1:cafe::e3) by DU2PR04CA0215.outlook.office365.com
 (2603:10a6:10:2b1::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.13 via Frontend Transport; Fri,
 17 Oct 2025 14:53:47 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DU2PEPF00028D08.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Fri, 17 Oct 2025 14:53:47 +0000
Received: from augenblix2.phytec.de (172.25.0.51) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 17 Oct
 2025 16:53:47 +0200
From: Martin Schwan <m.schwan@phytec.de>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] kronosnet: Fetch version tag with BB_GIT_SHALLOW_EXTRA_REFS
Date: Fri, 17 Oct 2025 16:53:37 +0200
Message-ID: <20251017145337.1853142-1-m.schwan@phytec.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [172.25.0.51]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D08:EE_|DU7PPF35725062C:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ac4328f-19ec-4372-19f1-08de0d8cfa18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?dWTB3vaJV64Ai72EykGgu+9FYqyv/V8Oymlt2dTTugQktsS47GGKRq+az3F8?=
 =?us-ascii?Q?7G+5jBFqvGE+ujBYbu8+MQwbYBIoN642BoFTzAJ/Z8Q/4Lok/BY5o0VAqP8K?=
 =?us-ascii?Q?NchS7TFQJcJe4hhEcNK9ORYsyAs9OJfLHXeXE0nqQXe13+2maojW/0qAbec1?=
 =?us-ascii?Q?/abmS1LNITEkaZWlcajLmrIQGQsK3mwXG1DGTtO2HRHRNU2qBB3LPCHlxU2f?=
 =?us-ascii?Q?Naa147EMSSL2JS67cIjkn/HECU8clfq8H/3im0/s0iWDRzF4wjbqtwXv/rP/?=
 =?us-ascii?Q?tP7OfWYhoSejCtDNd2cO45T8etGSBjSO5QjrJEfc1yFhMYNcsAhh6Sq1tsCG?=
 =?us-ascii?Q?pD25nEe110EhNPsq7BQq1gB9ynowJCmgqz/FuUc9ANa83InDXRMyu1fqpaF8?=
 =?us-ascii?Q?wLi5GTjBvXvpz0k3oKV9zD68gz7/IlWZ8ZRS+2e6knHHeuSWVB4Sew20sCJx?=
 =?us-ascii?Q?4ud3wBB7KR62upL+LEY0BXRuC8VNSTOQE5I1zi3xA3v7+UvY+Qtilq/svci+?=
 =?us-ascii?Q?gjI1xfUpmh7xNtGK0oAdt5Wbn4s4LSsxVbqDlDOxIvUECQ+vyEgID1SmuM2s?=
 =?us-ascii?Q?VrwymC7h1JVarnHpiYPEHdEc8FC/ucvg/mhA9HpD0oCAXXbl75lRfq3hXYw+?=
 =?us-ascii?Q?lkIiE3LlFPwSbtspjmYWR9V2atkLQIXfmgermk3I2Dcgix9Apv2qpGT1dpQu?=
 =?us-ascii?Q?ykXjTN8ZIh5yIs2+aPr51hikQWlNvMG/R9aVaYQBoWTPoEmeYXpOActCjnk1?=
 =?us-ascii?Q?WxrvXZovftoDDLWUx/J7lz/75VSxMWpD8K3O5S5DcUEaEcR7QWYJtJ014vQr?=
 =?us-ascii?Q?Jqte8BiNW/TDoXbfgpayrOSdmmGQONkYfF2aI92CA/5NoXIekSaApf7FKcr9?=
 =?us-ascii?Q?io8HqGojde+6H5NHV3cT2I/kcGdsZyltRC16w+GCDyrfnSKtgngkGe7B6la4?=
 =?us-ascii?Q?OCMoXapkOwm5qSMq1oBx//yt0dZcO8fc3HqeXo4b+kyee9t9MSXHMNqDGe3Y?=
 =?us-ascii?Q?PFJ5BrubNB5poJO1AIew5s/rX5T3RssEpVMYCdsXYQCtdq48kG4ufga41JDO?=
 =?us-ascii?Q?TM6DVA33Yw4zmfh/5b9PdnJb4Dwd+aQ4z1JfJa0NGKpNWQV38rSJ7LhNUzuD?=
 =?us-ascii?Q?NAtCEBvrOWeAcIx7rBwSuGwDdizidb4bPmL2xB0zeHJNbk/EByZL+39Vgdw8?=
 =?us-ascii?Q?tSPlxXjhtCn/CCpg9iPjlU2YOSWYsEQ7YDcliMRs6/XczUEONShP7t/3rnLN?=
 =?us-ascii?Q?moz0gi6Zr8gY5adRM/NukDEnYws87zLyLgjqw4PlZ+02YzWboPmWIug7uKAx?=
 =?us-ascii?Q?A5esWFxE3JOaKoTcHmN7k3NFFvOnd5vRVBCLFHrvOZvqbGKUNWD6AWPg6xnv?=
 =?us-ascii?Q?pf+oOqyXhEOL8GB6Zzync0h76ESspj6dbI95tVOL97HxxkHQY2X//XeztGvR?=
 =?us-ascii?Q?vlzzzh/m4FlFpjOcvhEOd2o2Ee0mbgAe1I+A/Rkkaslr+obnhIvuejPCRh9+?=
 =?us-ascii?Q?5P3Ycu3+PP1QjrvycQ/Z4JevMSiQz5oZYnC9mpx5COELeVMpMQ1pNuclJyiA?=
 =?us-ascii?Q?CSXkwzxTvMOHByiBkLk=3D?=
X-Forefront-Antispam-Report: 
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 14:53:47.4929
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ac4328f-19ec-4372-19f1-08de0d8cfa18
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D08.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PPF35725062C
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 14:54:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120766

Fetch the needed Git tag by using BB_GIT_SHALLOW_EXTRA_REFS. This fixes
the following autotools configuration error:

| build-aux/git-version-gen: WARNING: .gitarchivever doesn't contain valid =
version tag
| build-aux/git-version-gen: ERROR: Can't find valid version. Please use va=
lid git repository, released tarball or version tagged archive
| configure.ac:22: error: AC_INIT should be called with package and version=
 arguments

Signed-off-by: Martin Schwan <m.schwan@phytec.de>
---
 meta-networking/recipes-extended/kronosnet/kronosnet_1.31.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-extended/kronosnet/kronosnet_1.31.bb b=
/meta-networking/recipes-extended/kronosnet/kronosnet_1.31.bb
index d4b76903c4..d95bb81278 100644
--- a/meta-networking/recipes-extended/kronosnet/kronosnet_1.31.bb
+++ b/meta-networking/recipes-extended/kronosnet/kronosnet_1.31.bb
@@ -14,6 +14,8 @@ DEPENDS =3D "doxygen-native libqb-native libxml2-native b=
zip2 libqb libxml2 libnl
 SRCREV =3D "da73f2a1e0ffe2aee15d4f705edf90ee8445e2d4"
 SRC_URI =3D "git://github.com/kronosnet/kronosnet;protocol=3Dhttps;branch=
=3Dstable1;tag=3Dv${PV}"
=20
+BB_GIT_SHALLOW_EXTRA_REFS =3D "refs/tags/v${PV}"
+
 UPSTREAM_CHECK_URI =3D "https://github.com/kronosnet/kronosnet/releases"
=20
 inherit autotools pkgconfig
--=20
2.25.1


