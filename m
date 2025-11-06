Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0254CCFA0D
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 00:16:41 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.102.139.20])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3601.1762388189856188112
 for <Openembedded-devel@lists.openembedded.org>;
 Wed, 05 Nov 2025 16:16:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=C3OXKRbo;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.102.139.20, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aUaAOyaTW8/Sh1UxzmG7xD/3u+hkpvmGfWebJALNID5VxPRgnNJE9B9CnfQwnTUaiv/J3RWKUDBQ8SbVxuxa3/bzTlsyaP+cb3GaHiNcv6SgBMSdcCyisfy7+0mPI5SUsonDK8RHd4nGDFtBW6/LEwq84v1QIdOItBSbTnYcXrxYFnCQ1SOm2UtJTc/ZdshsQxY3Q7FisEeKayPz3guxXcXf5l0HFuTCL+KR0QJBNJ0xW8SCemIEtY3bUAXURKInr0dCZw8GPey4FtKkkWapn7nVtRycnj/UqdcY/JO9BXFwGgnhLgVcqHUK494r3QbTOG/YJSmcBuTBPATe+q3MEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4u6aAuchcge5t369L5DfuUpooLv9bMmNkc9Ji4D2KhQ=;
 b=lxixyx7VPiMtA+7ZuR2E2ESv2pIN8adq2cVwDUFdNcUM+ZfOBQxoO2A6vvAGywnHy+BvlL0Vxwh9Iu4mt5J7MQYcUSFePjNBu5FOdEM9gNaKpOvAKUDI/0g2+6qkIb3IEV0HQscDN2iF1sfEVoNubnCY9LphE6oWX69DO6LTovVoI9Tove4CpYeQcmEplIvujn3UkR4ReXGQWftfxiwFYtBtCR6kbyZ/0jYNMO11cNCOhyvYuGde8MiiOlKjpOdNwNk5SWtMg2n+jDqfXXantj200fC46di8CqWhIaxRH7MzKbALCKw3/cBXI49oDf9uheoIoF44JTF+dYQjVuFtRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4u6aAuchcge5t369L5DfuUpooLv9bMmNkc9Ji4D2KhQ=;
 b=C3OXKRbohLkH90dzYqWS8KNVPpbze4NbG9idrC2x/KNuIH1r77YTcgJFnqeYSWfH1mHgeDWLkNo81V1I2w+ZHdMm8GFdXGcMrbWCtyL02q3Yvd1EQY6fDFaHSh5K5Am5yWQ6mhHvyD2vTAiiA9LdkOuiknLrginHzJV6Fu+Uid4=
Received: from CH0PR03CA0396.namprd03.prod.outlook.com (2603:10b6:610:11b::16)
 by IA4PR10MB8375.namprd10.prod.outlook.com (2603:10b6:208:560::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Thu, 6 Nov
 2025 00:16:22 +0000
Received: from CH2PEPF00000099.namprd02.prod.outlook.com
 (2603:10b6:610:11b:cafe::62) by CH0PR03CA0396.outlook.office365.com
 (2603:10b6:610:11b::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.8 via Frontend Transport; Thu, 6
 Nov 2025 00:16:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH2PEPF00000099.mail.protection.outlook.com (10.167.244.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Thu, 6 Nov 2025 00:16:21 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 5 Nov
 2025 18:16:17 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 5 Nov
 2025 18:16:17 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 5 Nov 2025 18:16:17 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A60GHtQ312651;
	Wed, 5 Nov 2025 18:16:17 -0600
From: <rs@ti.com>
To: <akuster808@gmail.com>
CC: <Openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][scarthgap][PATCH] glm: add nativesdk to BBCLASSEXTEND
Date: Wed, 5 Nov 2025 18:15:42 -0600
Message-ID: <20251106001541.569231-2-rs@ti.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000099:EE_|IA4PR10MB8375:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ae5d634-078c-4abe-c8bf-08de1cc9b73c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|34020700016|36860700013|1800799024|82310400026|12100799066;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Yqadd0Kt4S/WTjTAsrLAqZru3SGEiT5lKvAcXYtaPAG5d37XWRgVYz8wvAGD?=
 =?us-ascii?Q?USzN/I2eFG74OsM6Bq5stEQrUYPe5B7+5dUmq5SoM4vJ1AC2sVw5oJK5cvTw?=
 =?us-ascii?Q?3d+4cjQJhyUwC6KHGHd/dM6GoTlobjtw10JLIHLEqeXTbXPaop1dVtGfXjPs?=
 =?us-ascii?Q?7j7V3PE34xvLpgEYsYODHUoE29Ar17uZqRFD2UXM8yLIQPkXhztkswTPlKP8?=
 =?us-ascii?Q?hhpAzQ7w8OLRSIQRlh30QIid8cD9VxUxrOr52pqkkHEMEDKjWIaL9Spob7VV?=
 =?us-ascii?Q?7KQVBZ/Aufail6PowGpeYrw2cqjQDKtjnsBWKJzTbyQRudlcJ0BCFTgn9ep4?=
 =?us-ascii?Q?83bilBdy/S8JqpF637LAOYBs4u6ZRkcRVLkYyJXS4NC0NPW05chbrEDRQRLg?=
 =?us-ascii?Q?Dqr4Gn/8AfxTAPXF4Hiu9+gf/RuIdiDPhfVYRHQQlCtzpk2utsAeQu/gE94V?=
 =?us-ascii?Q?NuTJZ2QLsrsr6KGHLheKs/pIg0T0QRRF2THnq+/xZHaWyjgwq0cC9ykcx0RR?=
 =?us-ascii?Q?2cMqRIJHdYkE4U6A+lARKVkFQH2YMeM7nlYFMMAL5YCovcDPhhfC3yBWJoV2?=
 =?us-ascii?Q?Ki14NbyrQk3In0nmAS1Jg48Odm++vvBl8joJU1Kw4Y4v7+JXF8tZWzjihvqu?=
 =?us-ascii?Q?0A7p7Lvy+NwO159/r0mc/8kXrqVtm6UgH4dSV2hcx31IpOCcRKX1whdtTXIG?=
 =?us-ascii?Q?fii7AP9k6jk/1RxeiQJYWVgn8MfTzfW+PU191kNp20Qw5lRjvl0TnOjennSm?=
 =?us-ascii?Q?26Wsthbbylh8JPOztt4OU/1bbc62JvOJBMyBddht657r2sj39XYPIZU+jIO6?=
 =?us-ascii?Q?rdluuKb9SzDob/0L35cCRC8A5jwFJNDfRzCopNpCIotATUzEaIzH1aKnYOsJ?=
 =?us-ascii?Q?c1IBcCq2cPrAtfw3g+jf6Tk8Xw0KpiHwAi7bPKDQaFFsj1AiHBgxjY+D6uqU?=
 =?us-ascii?Q?W4r9oCFbDKwp5or9s1s1ah/iAFrKPR5K737jy8zH++Kx3E2TSp/YeZHNdFpi?=
 =?us-ascii?Q?u9fKI3BefJFPs19qcCcKnnd9yIQu6/UfEqTpZsEs5oLJz8BAnw2OtvHqj/ml?=
 =?us-ascii?Q?9chC4UzNNarXClYwFgijcv3jXrvpzq+FkGer7Ter3GtRXUACtLHrucxzQjBh?=
 =?us-ascii?Q?qUnK/MEkUlOvx0fovggC1wJl3KAEQhb5YuiULUqsjE7bYdk0KdPhDQrVCA5s?=
 =?us-ascii?Q?xIFwK7t71IS5VPMctRdyfua7rPRP0CFbr2RSQ91AKIMsrK3LgPWysk4sHUxE?=
 =?us-ascii?Q?LKJJck6z//4Gp2uLoY/ag9kdyh6dY0uXGp4dzwclM6d82y3AO5hoMNealeG6?=
 =?us-ascii?Q?cyNMJGtfxassfNdxNBZJZLHjdzVCw9oDtnYHRi7l6QUD77JO4zgeVi8aUKCp?=
 =?us-ascii?Q?u6QxVLmIL88xuBvpWfcM7NopL2M+CfuRJeUPvwSiTC2NXpbqbJhaX76C3o4Q?=
 =?us-ascii?Q?l5+xoF+qf1qJ1rXKrFomxRvqDkvTgCzMljmFvlzttNPcfJfxu9UeVlLLwx4E?=
 =?us-ascii?Q?nLL0UWdqYQrg4WYGyZesr0depFmOia9kKehmYc6UHh7h03f6zZpnDVP3wN+F?=
 =?us-ascii?Q?7c3TjS3015o8Y2XnZlk=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(34020700016)(36860700013)(1800799024)(82310400026)(12100799066);DIR:OUT;SFP:1501;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 00:16:21.9897
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ae5d634-078c-4abe-c8bf-08de1cc9b73c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF00000099.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8375
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Nov 2025 00:16:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121353

From: Randolph Sapp <rs@ti.com>

This is a header only package. It may be useful to the native machine
but it is definitely useful for the nativesdk machine.

Signed-off-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---

Backport this quick modification to the BBCLASSEXTEND for glm since it was
requested. If it's too late for this type of change feel free to let me kno=
w.
We'll carry it on our end if necessary.

Forgive the resubmission. Noticed the email was wrong too late.

 meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb b/meta-oe/recipes-=
graphics/glm/glm_0.9.9.8.bb
index dd520b245e..a7d27f7fcc 100644
--- a/meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb
+++ b/meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb
@@ -38,4 +38,4 @@ do_install() {
=20
 RDEPENDS:${PN}-dev =3D ""
=20
-BBCLASSEXTEND =3D "native"
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.51.1


