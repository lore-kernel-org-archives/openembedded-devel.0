Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38C4FC369D5
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 18:12:51 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.78])
 by mx.groups.io with SMTP id smtpd.web11.55274.1745863961201433755
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Apr 2025 11:12:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=JpYQBnQF;
 spf=pass (domain: axis.com, ip: 40.107.22.78, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uv1afDqcHrIdc5U63GmDREX9Ha9IMDQMM44OZ9DsEGrULHyR0kM1U6g6EgqqDy56VI6Eyjpeb4WIz3FJRH7dDyNYBP/fVqYw1+kFvZBFTPKuO8Lvz1v5WCVqp4nA4kGEauVzNlIYah1XvHPyzXyOS1qmyk+73BMiAUFcK2B8U9hHo6OcqK3RAylX1QCvjAvRjIgsmGrLotDZUT1x3mUQ+bSJpVMUudKkd34nMc/YRZne039eFska+cdy8pXln7BtKbiJR0Cu0Ltx5UEcvxhOox+7o7LH5HAUi5R5FOaTw+yMHvKcqMQnfVXEvL0I/yxiL2OXdDbasVuSLzLccr+SiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5qFDYlKWReHbEl8oTNH99pzK6ub1lHLX7bMboWd+tr0=;
 b=hM2aoAifvApfVi/sohv0pWexG8ielnf0NK5HQfm1hhOiJbp1QIEjZGm4c4l6x2owrL4+Mj0cHmFEn+a0NpEJ0gIrXkB2/QxjMenD/TI72QrvjvIUvlyqUHixXTSCYJpKbCRptPbt993QcJCTUHBumwew5aaCQu82bh8NH2T58FphLw57psRThFns3gmsj+/SOtkKzy2Z5nPoAmYSB9f5Uul2WtRR1v1BW0ZDpjeHtrTv+g95P1HRg/Y9QKExd326sXfCuDeAcC2tIgAGQ2BkZK9QsIWxKCv4Dqc1B8mYxY7nzqjzcPZsmy1Dxm0Qmiy5RNWfv7c44DgPlnKl/4pZfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5qFDYlKWReHbEl8oTNH99pzK6ub1lHLX7bMboWd+tr0=;
 b=JpYQBnQFHC/4MB52xPKjhmoDtYBf/7vWP+rMSJBIexekGDR4b4vBR43TVZpWgNeLdnfAuLXhT9mDexf9z076Ake8u6eL6N0UCxEd3pUhM0LEB47gWDZh2t6VE8Ujc9fozXgHITHWztBwGt7nW3VIyhIDzAQxJ1nqUoDw2hJQyR4=
Received: from AM0P190CA0014.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::24)
 by GV2PR02MB10045.eurprd02.prod.outlook.com (2603:10a6:150:dd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.17; Mon, 28 Apr
 2025 18:12:36 +0000
Received: from AM4PEPF00025F9B.EURPRD83.prod.outlook.com
 (2603:10a6:208:190:cafe::c2) by AM0P190CA0014.outlook.office365.com
 (2603:10a6:208:190::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.18 via Frontend Transport; Mon,
 28 Apr 2025 18:12:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM4PEPF00025F9B.mail.protection.outlook.com (10.167.16.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.2 via Frontend Transport; Mon, 28 Apr 2025 18:12:35 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Mon, 28 Apr
 2025 20:12:34 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Mon, 28 Apr 2025 20:12:34 +0200
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id CB4B8B2
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Apr 2025 20:12:34 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 53SICYg9937745
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Apr 2025 20:12:34 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 53SICYvP937705
	for openembedded-devel@lists.openembedded.org; Mon, 28 Apr 2025 20:12:34 +0200
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-multimedia][PATCH] pipewire: Avoid having pipewire-native depend on pipewire
Date: Mon, 28 Apr 2025 20:12:31 +0200
Message-ID: <20250428181231.937575-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F9B:EE_|GV2PR02MB10045:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a3233ee-c227-4e77-f8b3-08dd86804083
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?LUIzH/pbrt0dnZin1WRb3s+s51l9zHRF3lMSlvhhRf7tlWIZTAf9QVOQUc63?=
 =?us-ascii?Q?vGb2RO/Z8Jw+lRGr5L6WNYACT4TH1XhDo01HIyGvSFWJbFIjBjk7jp8iZ4Q6?=
 =?us-ascii?Q?dRsO1LNL0DfEDAcBkJE8mIeyly2f/EknjFHbTmMSchdLhagdpcduW8BV2YyU?=
 =?us-ascii?Q?05fPcUku3AkfYRl71NEquz05zWKkLMCHiQnGQ5aW51/T7ecxc+MsJtIvnNdb?=
 =?us-ascii?Q?kFy8jpIQSLiPy5LUS4BtI0b1axSFJlP2byr2f35Nuby6oYV4y/R8VeHza5MK?=
 =?us-ascii?Q?bot9RSHD9C9Uvf58WDR4s1ScgBrLOtka7IjM28VSE4lNoYTMnXN0OiOTF5nK?=
 =?us-ascii?Q?XaK6MGFvOlO95saSi7Oig1F5mcQmZy+FxLC6d8YTUothZN1xvcN4Jr+OFu1t?=
 =?us-ascii?Q?4A67Oqcxg/bbqPKZPmcTnt7nSFxjdxlVdpI+k6QNoDNR1e1TviEtCsysOD2f?=
 =?us-ascii?Q?BU6CJ1vlNJCNRCToVJA5KCCzxqSzZUpufdLAOfCM7xATUUInZ//srGcEK4aX?=
 =?us-ascii?Q?l0/ah9EKhgfVXFMQS45XVasKcQ3bO7ijBASyopvdIX9273M1WsQghhAsz8Mj?=
 =?us-ascii?Q?Ij27YzP6sC6tLOMIig3asqMNjnpwRJvqGdiwGx3DQxdEtLG9se+kwFDAP5Xs?=
 =?us-ascii?Q?c3kWAw2hWkAflfmzOm0TaGyGDxizfFtnaVsIUDZqWqPlKiejBwrCwQxIpIxW?=
 =?us-ascii?Q?JLmadQLU6g7/1WAFrqBhJyDiocIr+rZoyIdG2ibJZzM4Q5U8Rw91qAe+nt63?=
 =?us-ascii?Q?lYtdGhP9rS043V8T8euWEOAPZkF8I3GWH8VfkacSg9NtbKvQNA/LDMAJcOVj?=
 =?us-ascii?Q?cDabMX8THRVVEHtyfS3mvnjkuWYaageoK8W+zaa79WAj5teqRDYk+63vZbwO?=
 =?us-ascii?Q?KznX2P0NXJYNORA1/mxzefTgrgvhOi4z88b/lmsZwdbmycMDswA6cRJj/Pig?=
 =?us-ascii?Q?boaSjaqs0Z1DXayTCX7sLJt6Zfz9GnIVkXyNO8RDXV5mNyNPLRZYmo3Ly8ms?=
 =?us-ascii?Q?aj5b+MhjFbJZWiiC96Q8TqGKBZBLgi+rfghdk4gCc1K3rRNClaXMn2mXfkVN?=
 =?us-ascii?Q?AlAVfFehEfM1F95a2jkzAzNJQWrv92GU52MWuDdrJUuv6lWn8Qc0Fy8D7zxt?=
 =?us-ascii?Q?uw/S/DD9t9Mf7B3kstKAHju4BuXCf6equGR7sHD0ylt7wAMuEnkEjwfdUkC2?=
 =?us-ascii?Q?8U4LiT81l2N7rydfhzeRVpTIDB8YLAMfLs9zB9SXW9YBnGZLpdKBHYJihly5?=
 =?us-ascii?Q?0N1/JorzUrGTJPT29OhxkqvKHhQaGZSPZWHciVGgkzzJHl21VFY3eGRoHwrH?=
 =?us-ascii?Q?to8ffj3JFjsJ3vYNcuesVT/Ds2Gdd4pW6yl5yEtN/xu8AO377Gyn81yBYoqn?=
 =?us-ascii?Q?hpX63vph6iNPjQDO6a/a1V214BbTFgs7kmKinV9WQMaH+6Qhol6BMDI+uHcu?=
 =?us-ascii?Q?5yxcqykI4Wtnsg5PRAhEKGPJDE2yARfW+BshV9KsbWPEDdRngvTWBFp1eqEZ?=
 =?us-ascii?Q?FRNbAl5tsaZcl0p6DhXBg1tPiE8E2z3Fi5CA?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 18:12:35.2360
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a3233ee-c227-4e77-f8b3-08dd86804083
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00025F9B.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR02MB10045
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Apr 2025 18:12:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117201

Make pipewire-pulse only depend on pipewire-modules-protocol-pulse for
target. Otherwise the magic behind BBCLASSEXTEND and PACKAGES_DYNAMIC
results in pipewire-native ending up depending on pipewire (for target).

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.1.bb =
b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.1.bb
index e0141f6c7a..e1cf2a55ba 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.1.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.1.bb
@@ -334,7 +334,9 @@ FILES:${PN}-pulse =3D " \
     ${systemd_user_unitdir}/pipewire-pulse.* \
     ${bindir}/pipewire-pulse \
 "
-RDEPENDS:${PN}-pulse +=3D " \
+# This uses :append:class-target rather than +=3D to avoid a dependency fr=
om
+# pipewire-native to pipewire.
+RDEPENDS:${PN}-pulse:append:class-target =3D " \
     ${PN}-modules-protocol-pulse \
 "
=20

