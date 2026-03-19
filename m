Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67FC91088E69
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 03:02:41 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2993.1773889353589121604
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Mar 2026 20:02:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=C+juLMxw;
 spf=pass (domain: axis.com, ip: 52.101.65.66, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vFhz4cT5vUqUXrHtbBsDtqFfuwDbgkgg/pG188PdvV0dlgk94Cgg2GIJaa0zlvcf5nrT5v7fQjhxKSRPyDbuAqFlNnNw+/e2HnWsib1PVt+6/V/dkEsAd9GD+F1i7tNdtGa7kTv3knjR9d2TYQsf0D/DGcPwiTCUC8eRMDbtnvjQXlOQAM0GQXmcH4QEPZP/A7l83uJy2wKSQmL8+rnppxYEa2tsKLT6JkMd1FXX6WR2VVT+3jEHkHbntIqZjYMdezdvtUs6NirhdHgr02BhSdpFQ90r9v4OHWyZCx7KFeQqU07DZRRHQZv8zUp1bVgsI1aGtbqX4zzRdIjMpvEAkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pR3qytAYN7Jqzrwtv9D1kP/M4oECaI67231Ufiph+Ss=;
 b=XqyVu1vOFpPlRX1ja+ONM29Oh5+oTJ5YEelxwdoc5TxjckPeUF29ZzvrHwvPt+/KovP8CKCeQgc3+iywM9B3a1D7CiVRhayjMDKtYi8qu0NG8IOgcWv2azn6KYnPdIgNA/zzhryZWYmXd1dqP1OzqOQhj6NzVsEa5pFqDN4DR3kNk6pYIOrD5lBQX98KGR0qXYEtyUiYk0AZIfydnkk2+/xlQg//3hcrpscdgzTHfNwjzcL6aW2YgdGrciADdjLDrbL2PtLYXfGUV0wCnR/coc6BJ3YjBdMBUgsCnuluT+lzINJf4X5u2tD0Gz1V57zlB1cH2zdklkHpteveCeOvgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pR3qytAYN7Jqzrwtv9D1kP/M4oECaI67231Ufiph+Ss=;
 b=C+juLMxw1LOtX08zpHiTfutt3EAFadmZ/fSEDPvD0y+OEXw4URPtwJu8lj356TKq2Y0xz+3su1CA9vwyH9BycVsb+UPDAeXvf+0jH3NwxS+oVTQYnLYa8NiH8LUfcHyyTiWEMTwYul/wnkCJ/c6lkAraHrQaRW3/sY9dTdsAUvE=
Received: from DU2PR04CA0355.eurprd04.prod.outlook.com (2603:10a6:10:2b4::34)
 by AS4PR02MB8645.eurprd02.prod.outlook.com (2603:10a6:20b:58c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 03:02:27 +0000
Received: from DB3PEPF0000885C.eurprd02.prod.outlook.com
 (2603:10a6:10:2b4:cafe::79) by DU2PR04CA0355.outlook.office365.com
 (2603:10a6:10:2b4::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via Frontend Transport; Thu,
 19 Mar 2026 03:02:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB3PEPF0000885C.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 03:02:26 +0000
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Thu, 19 Mar
 2026 04:02:26 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Thu, 19 Mar 2026 04:02:26 +0100
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 4EACF2C3E
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 04:02:26 +0100 (CET)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 6E3901208D1; Thu, 19 Mar 2026 04:02:26 +0100 (CET)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] cjose: Remove PV
Date: Thu, 19 Mar 2026 04:02:20 +0100
Message-ID: <20260319030220.1630910-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885C:EE_|AS4PR02MB8645:EE_
X-MS-Office365-Filtering-Correlation-Id: 3411d8b0-7998-4fd2-6001-08de8563f3a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	m6CnPOPx0f4nsUvvlQDzq/nsvlWUYVqY9yMfnjClClY5MuLN/xkuI80DWX6zJwK8gXfa5hcVVHnYJ1l38njDN0TZ4pDr+aFZ0dJgygB4a7AzduqFCoyJ8t2j8RJUwM6dfUHmkeMSHmlbEVUQ90lcnZd8YBjTIPlNpx6/jb6v2X0aeF2WlxLZW4NS98RVHil29I3MLi/WRbehodpXt/tkL2li8YO0DMQvSxDPUI/pq4omEkbB8RXzcEe2krO6prVM6yfYVahuRg3x18Nb6NdpWHb99udjherRdiLyb/98+OU+Z75q3oa23KffGjg6Cf0/GEPWrrXv1jP/Sj8pPGkzAjS16uqqEIRcvrj3hNXkICzyYAaEUNIH31tRX/0eBAe1FaeZYPe9s+LN4L+MH5mWu90Y3Ik9N0pVpjbriOsI0z9CcppPvKJPxvz1EW+4fQdZ7ZkSp+EKXJ3fYTb/dNv0xYbd66B/fK1IAs40/1boeVqodMLzsezzcETgV9EbvN0UH2Od0LSRWym239t9w6nIdtN3CJuryTj9eahbmn9mL5YOLY+/h0dKKE2ChRhki9TMGxZ36Wjua3IzmSeZclCV3ZZmIVHHB/G+GYPnVTLWC8kBvoq9H+EStU5sbTBAAI0ypJJUHqWS/A1khLhefnnyDDWye5X8AgNOf6mVDAEwPb6XapXZ4ntT3mT1TUjW3/p8ORCZD0yFUfKQQSS1cwXcb4bu2cWpHAWO43vB3Cdrk6m9UPFQTkmrXDMrbCRB7iBNNZzCW8Qe82eN+168AITytg==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	LXLH+AcYcO5nu35css3/RgadvDLczzv3lFc9yE3OgjFr74lmb/pLi8TyiAW2Z/RBXVCnx8da4ZXCxfvJbWSW9vbTDLASJLQHynJYbT+eADRAxn6p6Sp7fadrjS78m+E4FYnKBmfFB5Vt/M2ydOr9J8AcrYy17mGMd8SxDkWhiih3OA/hseO5RdH6vzt9rU7r2MUtJXDK8Rp9vcDttnt702jJaRf7Xhq7ECl5IeNOapdBI1aY3TNIu0rwK0rFFrdIzpP9mRZ7a5ZenU7WtaJ4nPIH/lix7tE8tBgRRQJ1xOIqg/HDnMN5pGheDZOIZDBFc1QYmnqjiSJkYt7ftF7MA0+MntI0LsA+Cwh9rAVkFia1E5bjBWmoXaWfysYYweiTpYNZRicWsDYtgRYkG2xfa1FB3FJaIbTPHh0qJ65qZ7cSONjrsX8mpPdR2WIU2zr+
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 03:02:26.8373
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3411d8b0-7998-4fd2-6001-08de8563f3a1
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF0000885C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR02MB8645
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 03:02:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125370

There is no need to set PV since the version is in the recipe file name.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-support/cjose/cjose_0.6.2.4.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/cjose/cjose_0.6.2.4.bb b/meta-oe/recip=
es-support/cjose/cjose_0.6.2.4.bb
index f6a5d15a9b..eb1db40705 100644
--- a/meta-oe/recipes-support/cjose/cjose_0.6.2.4.bb
+++ b/meta-oe/recipes-support/cjose/cjose_0.6.2.4.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7249e2f9437adfb8=
c88d870438042f0e"
=20
 SRC_URI =3D "git://github.com/OpenIDC/cjose;protocol=3Dhttps;branch=3Dvers=
ion-0.6.2.x;tag=3Dv${PV}"
=20
-PV =3D "0.6.2.4"
 SRCREV =3D "8d94c3ad3237ab6a83d2e92fa541542b1b92c023"
=20
 DEPENDS =3D "openssl libcheck jansson"

