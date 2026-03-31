Return-Path: <s-jain1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBA1DFF60ED
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 08:34:24 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.63])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15589.1774946055952434942
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Mar 2026 01:34:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=WGx/saEc;
 spf=pass (domain: ti.com, ip: 40.107.208.63, mailfrom: s-jain1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fzOW48brvNdPJI3j9q+AD5t910HzTo3LjSiFICWrW2bLU/GghAeZaWcG3JE3blZYJ5x5km/8xAVsjEjLind0A1+yRCwLKJ820CZUdOWE94/pK6nxHUoWs9fpIRKbZriuwMBg/C8Mpons4b6LClxYX64CDuZ5ftq0w9A24vHgeKU2AfsSSTjVSENNDbLEva+BWp7ARgHx0ncWzamXdbEF/w7bJB+ywHBwDFOX5DEc8M21/e/r+MVJM5WThNsTap2287Wz/F16cHG93NcpafkPyUSfvK8meWTKrmAwdXzS8/PWDWhM8thoAvBohydjKlCLNohmHR3BGXG7qhLwpf8F3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FsuIHeilOyGFe4fUskwjNJG7BcP7iqXKP97HNSJNHio=;
 b=l7rc1NjnfOkze1Xrz6mcNnbMhdBOto7pnOqEWZlLyezxMl4B+K1Dexv4FhzIDaKSXlKIEuSe9Ic/Fu6Z+zWAtlNia/JfHgdVWbaDrbPqsxqEYuVV4pP/+SZTmBl2IqS0ZPO7Qup4q6ijHPRJqNSxOVRYckIiXufEGikKuJ/43fbzk12hFrXDIjdLSXsEMq+VJ5EGHG7u/o6FNfLo1A06cXTnrVsSrsZfzi84uPdV3NGhOXiC+UoU1IanvA3BDUcP4gCC6NgBKh32NX8qdEytSrULNN7JoRwIUQCTG8/yZR97XOs32RropueFGcu1ja1a6bVi8WHQuB0cIjocRQYCqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FsuIHeilOyGFe4fUskwjNJG7BcP7iqXKP97HNSJNHio=;
 b=WGx/saEcIBRG2z8HFE67R4IBJUAMvMMqUbvALbKCymY6T3RI0DVhqlP2dRY4MQjoNnAmeqFWOaAlCBncZwU0r1tg0uErs9sUuDy6zkbaZ2/zgjvGPT4MEjRkD8fbNU9H0FaOxKN0Mi/Aut8KtpbsRqzqYd42UHbjEKQ+aiQIh6w=
Received: from SJ0PR03CA0363.namprd03.prod.outlook.com (2603:10b6:a03:3a1::8)
 by DS7PR10MB7252.namprd10.prod.outlook.com (2603:10b6:8:ee::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 08:34:13 +0000
Received: from SJ1PEPF00001CE0.namprd05.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::9a) by SJ0PR03CA0363.outlook.office365.com
 (2603:10b6:a03:3a1::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.28 via Frontend Transport; Tue,
 31 Mar 2026 08:34:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00001CE0.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Tue, 31 Mar 2026 08:34:12 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 31 Mar
 2026 03:34:09 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 31 Mar
 2026 03:34:09 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 31 Mar 2026 03:34:09 -0500
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [172.24.233.20])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62V8Y7aY1960052;
	Tue, 31 Mar 2026 03:34:07 -0500
From: Swamil Jain <s-jain1@ti.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <devarsht@ti.com>, <praneeth@ti.com>, <s-jain1@ti.com>
Subject: [PATCH] kmsxx: update SRCREV
Date: Tue, 31 Mar 2026 14:04:06 +0530
Message-ID: <20260331083406.1879674-1-s-jain1@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE0:EE_|DS7PR10MB7252:EE_
X-MS-Office365-Filtering-Correlation-Id: 6588284c-b846-4bd5-3ecd-08de8f004918
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	eklqUdjvz2K7vxRm/lLpxUVErNhlVHEio1a/3Ld2m6VLSmGfLAH3ehzxP1FIyiRjdfZv+VGV9oaMtP5cY6p5ueeHhPMfEXEED75qWoZE8Yik8ME+OgE6SHGM5pUceQimo8i35DeFUbrACl6z24PjHSeN65DIfOaN4K/kJZJp16XuerP5/iGfGM1lKqvfilycL5qe6n3saLCPFgQW4A8jsfk+Z3GAvIRO9S7gVqUwBjd+E9pY9B6paPtfVUAucK0wurG8wZItJYCGr6ry1Zgr1oYErGIuaMBG2+MHDkje+o/xnzILXFcDwQVS55bhc/8CF04l0Sw+BwL3EF29Mx1rDMJWjHAgpPSQJjBPmurR4zrnqr9mqHMFYVhs2AwzzodVFE7wrJov8SWyNTjO07K6cVloV4/jvAKiA79tt+0fkZdG36MChqxgeCYBE+I3WzvUUvBGdh6P33GuoY1Xu4gxZO54hmkOmOw02e8vMjE69UrAAvU4CLZEwpw5WuxU6Ny/nG5BuQIaDfmKRA51Cxs5Knp1Gat5cEQjYAUty952eGRGbCOaA2yFntF6WraEgLumBXwANTtDRd6+AAzBLraz2tRLi/lvpjVYbTGG/NTXn6HPtZaGquEoYJuIKbEsmonImw/KJVgUSLKo1FzRjufR0ztECd4yhgtyhihsiNf+M0cUlgj1ksugCMDQ8i8Qz14OXKPDMX8zgmZh/Pe33X/rs3tSj4xruP4HFFBTTittGCrFXqQpAuqtD+i5z8nxayug4n43Uz49Va5wEAPW4hVLCQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	+IWDHoFxoXi832Tiw1Ooo799271uSE5Xp0hDV2s+VR/zahaJ53VbbEqeFTZZlmw3E0GCys52iSxWt0Lt+TtmSzTSwGgItBqs/tefCyv9nXIQQOMRggH92rTSNtKlcHg2JYjIvCudoH+/57gl70o78c1KrXZL4CRDVSIfDFY6IR9jHZZFVCoqdBXj7qeVqIrgQjf5DBMQlJCH+7/l+AkYMgFrv1EZFewz7n20xMiyXAb8V2eMv4hsT9iMnx/SbA+3vUk0ysRTZbZc4G5jZVwuRypeMzuerTUAEMSdWeV9PHFjLqgS4/VJaW6YuFPZ33pmHT/HOOb8BhypKvN2fHTHVNujTwNBSf3zC5I44huO+i8tG+Z3wmzAzxuZ1AkQODZpG0/LlBBhx8iCv1BKowIF5DeyOhsDCyeGIUCqB7lYStateId33VUVko7EaDWuF1hb
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 08:34:12.0915
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6588284c-b846-4bd5-3ecd-08de8f004918
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CE0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7252
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2026 08:34:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125879

Update SRCREV to pick the latest changes for kmsxx

Signed-off-by: Swamil Jain <s-jain1@ti.com>
---
 .../meta-python/recipes-multimedia/kmsxx/kmsxx_git.bb           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-multimedia/kmsxx/km=
sxx_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-multimedia/kmsxx/km=
sxx_git.bb
index c8caaff221..583101f082 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-multimedia/kmsxx/kmsxx_git=
.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-multimedia/kmsxx/kmsxx_git=
.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D815ca599c9df24=
7a0c7f619bab123dad"
=20
 BRANCH =3D "master"
 SRC_URI =3D "git://github.com/tomba/kmsxx.git;protocol=3Dhttps;branch=3D${=
BRANCH}"
-SRCREV =3D "412935a47b762c33e54a464243f2d789b065bbb6"
+SRCREV =3D "4a7836fe42a7bc0664d912246c5fbf17f240d152"
 PACKAGES =3D+ "${PN}-python"
=20
 PACKAGECONFIG ?=3D "utils python "

