Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF117CD6E4A
	for <webhook@archiver.kernel.org>; Thu,  4 Jun 2026 14:35:04 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.25])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13081.1780583700638080971
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Jun 2026 07:35:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=fTjNn4LH;
 spf=pass (domain: axis.com, ip: 52.101.66.25, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i26j0aiXrQhCp7NqiNjkg7dntlF8DZ8YCIUikPbfD5vkaUJCkrICvmYBHV1Pef6jAansqnYTl+c6NSTbm9FXTlwKej0dCZTXGhYTrw88T9Y6W9yCnAMl5aUPu3aLcyu6JPJuwvlsj7Hzi3TrB8ec6OhjxK3WI4fDlhaYzsoezMm8HJaBN0arGxBaLd8oOjukyf55ovgowrMURgiEzXuJ6wRxvVFYUMldSgyu+GkkbnI7u6F77BGnWoo7K+GZUOBlW9fbIE4R6LT/qMubBww8HWKm6XXw4q+Hf0nR8H8bLz2/wOUh0+KUOc2x2x3XZfVmyye+OUY6+shChM/XyWMbNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bMuBHCKHemFObzbDWIeQRgdmQWBehtYS6iyJzWQFtKs=;
 b=Sy0NF0ZcxbN0Oa+b8eo0sVJZZ3mIPh32ZdgSL+Hak2KmaG40pzURpOmOgRQPNzq0WzCt0NmTTI9eRfrjIbvrj7OEqYGAN3jHJmrOks4Y2f7gv0vhqejCjViUZiXcu91kQIKa4fWLMOvhehuKtvr0c1u6Jg3KF+t/azCDo508QtUgUnKkzntuAnjt6ByVSO5WsqpqdO+5X8wFm2mnBT7SHsIhBFEDhVxkWLOO3C77gT06TxumNevA3pFO6HsbakNkoCMW3oXFg1Qs9MtPkzRty1pRf0/56I8N+I/5PKf3IBSKMKbLfHkCd9O8tWRK1h/lEu0hyi9nsBGJ5kgLeC/Xtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bMuBHCKHemFObzbDWIeQRgdmQWBehtYS6iyJzWQFtKs=;
 b=fTjNn4LHqdb7Oh2kcVXrNtjXfsH3k/IfWu7XDPFipDtfDSvCbNuAR6UIrBvSFtUj5t7+rg5ugR6tCHQniLZJUq9lJqfPwxDbFTY9/bk/wFUrDiGEUiFt3JXsYSNU7kBWzQeXazNmt+Daw/Hhr3+7dzKgn8PVTFdXxW7ulrOBaYM=
Received: from DU2PR04CA0049.eurprd04.prod.outlook.com (2603:10a6:10:234::24)
 by PAVPR02MB10415.eurprd02.prod.outlook.com (2603:10a6:102:32b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 14:34:55 +0000
Received: from DU6PEPF0000B620.eurprd02.prod.outlook.com
 (2603:10a6:10:234:cafe::74) by DU2PR04CA0049.outlook.office365.com
 (2603:10a6:10:234::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Thu, 4
 Jun 2026 14:34:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU6PEPF0000B620.mail.protection.outlook.com (10.167.8.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Thu, 4 Jun 2026 14:34:54 +0000
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Thu, 4 Jun
 2026 16:34:54 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Thu, 4 Jun 2026 16:34:54 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 3BB4A15D1
	for <openembedded-devel@lists.openembedded.org>; Thu,  4 Jun 2026 16:34:54 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 3572712C055; Thu,  4 Jun 2026 16:34:54 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] ttf-dejavu: Use "Bitstream-Vera" instead of "BitstreamVera" as license
Date: Thu, 4 Jun 2026 16:34:51 +0200
Message-ID: <20260604143452.3409713-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B620:EE_|PAVPR02MB10415:EE_
X-MS-Office365-Filtering-Correlation-Id: 06c9d57e-344b-4096-75ee-08dec24671d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|11063799006|56012099006|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	3Kqso4Ildo4RwIatCUbssbXG0Zrqe1fOlFRBVkt8ayF2zCuEzrjT/MvMJfiSYsMSi06yZxCLagv7XNXA30qr7gIOoTSodsB1PJ3KFE0byhSkCCd+TJmFHxfV8amqcuPyzaSVO1zCmUOtB/RoNKNqiPLl8KKyQm8GL+SV/7WHTeWIRyqRo0K0ju2tHJit3G9bgz6HkI3EuLkcukbGQhjX0lrIdyL4VFpoAnycnuzufWEVNPlHjHZ7+Rn3d3bVDcSpObirl3jr1wtWpkBenJnE+MA/ByDqTyT42djPVWtidOnA3/vIRdd1pPqDL9pQXb2fk4IMidpCiJgYagBlvNg9ct2sCfN3xzMTLBgLm+Y0ftI/BfER1TXxqHAFpydYHpA0TqTMOSbMJfcJCDDzcYvCUzM3Ziz4u9J9vfUmp87bMR/XTP6XtfEjww0f8kVjAl5uyeyUJ5l0qUfGFoQhv7Skfk2tDxBAsa/wwaHk01i5aAwZCGOouKRIk6ehe4GjL8m0hpVMXM58+SJWahWw8wYmey/gl2UyJ2v0587YavGh2Qj5ScC5hLxU3yeEA/bMZaKsD2EyCzSaoS/W6LTWDKdNNGS94FzJovd5Rn4ch0qb9OyC7uY1SSR2RlxfrXf0cSCShKSHslPUb3Bgo/Y01z0cgMmaquj0IDH8sDtGbOU9r8rZ2pvPoeoBYgRDUNMuhAxy0bRYxXnYIHMXhpDQA1K7AlSL5IySiKVahgpRZHmLUvU=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(11063799006)(56012099006)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	fpd7eZweaHR4Qw3fcOZ7anK31WmSgJV1MM9KyFy+a9X0lUW1XZQg+dmyFkL2hUDSmv/hredE0DpBQ5URRfOzm4XMm38AqvK5KFR2cNDpmkYBUdC7znpuvYsU4rzllH1OASQz5ARw0xsLNVDNkNX3G34bnSSdM21uQoUZqebBygYmAfHr0sop/B517sR+aCU31n5XOpwAGxyuB1xB2TQTqMtJHTzi4YW1b0Sj3X5UtHEZhwvy2ysqsIqVTBZvEHwN4xvRFlCp4sZYU9cdBI88L3HrMG+1dx19ifcHduib9myzDMZwA2sz6Od7duQ+PYtDUgdJO67qssECuwhg366fFLmPowmhlDqGLUYQmgGRI0A2PdDNG5Ka4MFPpwn3DXTRfilu4Lt2dLWWIJklpcpdXUMhLH7NHuY85tgLDkMWFYNu5/tfiU2ImblEGPrDLe/0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 14:34:54.6057
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06c9d57e-344b-4096-75ee-08dec24671d6
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B620.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR02MB10415
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Jun 2026 14:35:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127398

"Bitstream-Vera" is the official SPDX license identifier for the
license.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.37.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.37.bb b/meta-o=
e/recipes-graphics/ttf-fonts/ttf-dejavu_2.37.bb
index 9dc23fc4c7..98c0660ad2 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.37.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.37.bb
@@ -2,7 +2,7 @@ require ttf.inc
=20
 SUMMARY =3D "DejaVu font - TTF Edition"
 HOMEPAGE =3D "http://dejavu.sourceforge.net/wiki/"
-LICENSE =3D "BitstreamVera"
+LICENSE =3D "Bitstream-Vera"
 LIC_FILES_CHKSUM =3D "file://../LICENSE;md5=3D449b2c30bfe5fa897fe87b8b70b1=
6cfa"
=20
 # all subpackages except ${PN}-common itself rdepends on ${PN}-common

