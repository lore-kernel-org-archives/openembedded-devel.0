Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E9ABF41808
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 21:55:49 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com (BL0PR03CU003.outbound.protection.outlook.com [52.101.53.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6923.1773179741049633130
 for <Openembedded-devel@lists.openembedded.org>;
 Tue, 10 Mar 2026 14:55:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=ISXRlOHa;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.53.33, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KHB2VA3t3eJUt6dAh6GjnirVR5ltOd1nX3j4BDZeeKogEuN+Ft+QPPjJc95H0h2pmA9RCnxFVo804IO97kj00HrGVx0l2bnicJmVHTNKKil37BOAShAcIWpIVfq1kDtJ9CUu+QzzSaL6Z9WQAnUFpV7IT63NnAJh5QgJoaP+j8sAf47UeSV2PtImxWG4tt8vComgl7VaOWrnZ6MPu03C+oUm6TJ84mO2WIDxs9d5aL3HNbqzsGi6AV0FCqplPvZJJU6IEHOFoJOrlEQBcO3G2hSfvqXl9U2rIWgzfb2hpgf1CzBKoJWFEY7A5FZYdxlOfiNrdzgoVEaNAi768XWClg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TpQjdFzGOc7U+DXZYbuvN0xbzXn1qddxpNABpiujy8Q=;
 b=CsMqFGAhWeX8Nerhon0dksA+HTjJQRRWmXiDUSLmn677PbddrE5Y2E6jgutxuF/zts/ZQ/dX14o5tfV1G2JwqAwFqqObJUlrzvq86hrQdTtDTuoq+lFU4lg/nr1TrSIdwTKIo+cLhRe1XyjceV0jKWOo8yMZGyXoXpwmU0c1Q/bFLumY9vLS9PsyaHpxiJXVUL2ePFA2R2XeeDwpE5Q8gmyDP3TI5dj3hpLe9wr6ssDU/I77ZJDcXjE1h1WW6xqkmM4nmwy+eCaGYmu3JMWOIoGaIQv9Sc+/lfJF+etvY/MkAG84k/3APm8xK540g5kjB7NrUra1DlrNkalw/X3CXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TpQjdFzGOc7U+DXZYbuvN0xbzXn1qddxpNABpiujy8Q=;
 b=ISXRlOHaz+cGLif2eSDyE2765rpumc1IBdBu7BtAaZ21WMtkEg53xWcjLP3elAA2OedKcsBdMbhfBOEKHogAU4Ky4ukFHTyjyZ+tVyzK4CQflzdrfOIKuQ4dRY9V67AW1x7Cn7jqFJ2Y8Ui9OkKZt1GAXkZYqYq6FL09y7+gtHw=
Received: from CH0PR08CA0013.namprd08.prod.outlook.com (2603:10b6:610:33::18)
 by DM4PR10MB7425.namprd10.prod.outlook.com (2603:10b6:8:180::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 21:55:37 +0000
Received: from DS2PEPF000061C5.namprd02.prod.outlook.com
 (2603:10b6:610:33:cafe::ab) by CH0PR08CA0013.outlook.office365.com
 (2603:10b6:610:33::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Tue,
 10 Mar 2026 21:55:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS2PEPF000061C5.mail.protection.outlook.com (10.167.23.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Tue, 10 Mar 2026 21:55:36 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Mar
 2026 16:55:36 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Mar
 2026 16:55:36 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 10 Mar 2026 16:55:36 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62ALtZVc3849728;
	Tue, 10 Mar 2026 16:55:36 -0500
From: <rs@ti.com>
To: <raj.khem@gmail.com>
CC: <Openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][PATCH 2/2] icewm: update for emptty
Date: Tue, 10 Mar 2026 16:55:22 -0500
Message-ID: <20260310215522.2836352-3-rs@ti.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310215522.2836352-1-rs@ti.com>
References: <20260310215522.2836352-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C5:EE_|DM4PR10MB7425:EE_
X-MS-Office365-Filtering-Correlation-Id: f784ac64-41fe-455f-5169-08de7eefc311
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	tpqwsnW/DOQ/lehtGzarEECAxS5LfA6aiPSWCoGQVGkocoRXYgYfa9NgIiqfc4UX1bRBPGk9JDtQWvfb6ne7X4srQI0RB/tK+drDpcs6ir+khCYl3EDBr51MXn7WgN4bpypJ+ejV7eHNm0M5j+fj+SBPLsAmFP0Ktx1xIcfVYLYclrc6DoZWpsZAPDMNqDXsbgzVl0fX5HKoOsD+M7Bk8T1Bk5KzzYX3y4aFa2vYPU6QNdibQ8Mmz2Y+9NaRuz6rD/PSZuUQMZXQsY6UFHqJKGEFACoP9fr9zbqKNtsGxCdEtFJG0FrvWTXwoolcFfY900LDGZmGivd8kIvt5JNAeDz6IkgMim7RCIO9r6Dt5Q5ivMJwlrT+oXyNpwXvN7YLvgo+paGFYITsDTGXKHy7G4MybnC6JsP2ojDwjEyJP7Z9SNkSz9LlSCtLtlPhOiUuDisRglRtt4QrEAfpqf43rfjqYH6pqQRLbrzy95GFIp+rdT4zFWDum4Kv3HSez0zLEm41wHeHj6Nk5hyfwIEkyqkAjuM1Tj+bUrGDFbvmYJJoxK6o2/Fcvee7UYpGqSCUI0Ct5QJ1cZGPFlDBygvNY2OPHgE7l0p5xclaPVBIwnSXYE0iHM+0hEgCu9SalkhfUmNPaxT0o9kgBUVyEIcqMwGzLP9UUOVjtk5lpCDTLfoSBCThdy9ZsqgmWDGR5OKsnUT3ymdhntbVhLNXP0PiuPLiM27cXTfOyGIQv92mi+0=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	3BYSog4aY7LxrHjs8tt9OavJnGQcBfF7nDjzqUJ+B7v0V04tsPwynVIOe3KJesWDWCFoYPsicF9xzihTU8SPI9oRjURgoUld+fwdmc0sR1elmqwBC4+me7NM2JwcxqTI0e38yjNeTGnUpIFffDAmct+lJhKYZcwREHyC5ML5masDJYBbHOFfdZQd6TpjDIJq+ZOvhX3tty9d4sTA9GULlAGyk7K7HbBQz4s0WhRinFhGMkx+nY7zd3eLMZsELmYWvdMqGNvskSiSX/w5fXbuxNJaPAQzPvpun5sPvfelQMG9Px1sMVoRhprPJpZUB+wQnaKw6Qi5tKXD+tJc6uIjq2zzF+KE8HWhET8JS8Jes4NWW6k76roDx5qjdcrQ2fMurVxKTvp/4oi1DyCeIEjRTMiTS/p6aM4VyWqGhjCKulh7G67P1CwtXbZa9+Ilz6F5
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 21:55:36.7260
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f784ac64-41fe-455f-5169-08de7eefc311
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF000061C5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7425
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 21:55:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125041

From: Randolph Sapp <rs@ti.com>

The x-session-manager alternative link has been removed. Instead a
distro should choose what the default session is by using the
DEFAULT_SESSION variable of xserver-nodm-init.

If the default session cannot be found the user will be presented with a
menu to pick the session themselves. This relies on the xsessions
desktop entries, which IceWM already provides.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-oe/recipes-extended/icewm/icewm_3.8.2.bb | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta-oe/recipes-extended/icewm/icewm_3.8.2.bb b/meta-oe/recipe=
s-extended/icewm/icewm_3.8.2.bb
index ad92b7b294..e49f1b90a3 100644
--- a/meta-oe/recipes-extended/icewm/icewm_3.8.2.bb
+++ b/meta-oe/recipes-extended/icewm/icewm_3.8.2.bb
@@ -10,7 +10,7 @@ SRC_URI[sha256sum] =3D "c64b1b7c8ee262a3c4796be57349a3198=
998564d70ed26f11e724e1b73
 UPSTREAM_CHECK_URI =3D "https://github.com/ice-wm/${BPN}/releases"
 UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)"
=20
-inherit autotools pkgconfig gettext perlnative features_check qemu update-=
alternatives
+inherit autotools pkgconfig gettext perlnative features_check qemu
 REQUIRED_DISTRO_FEATURES =3D "x11"
=20
 EXTRA_OECONF +=3D "--with-libdir=3D${datadir}/icewm \
@@ -40,8 +40,4 @@ EOF
     ./qemuwrapper > src/preferences
 }
=20
-ALTERNATIVE:${PN} =3D "x-session-manager"
-ALTERNATIVE_TARGET[x-session-manager] =3D "${bindir}/icewm-session"
-ALTERNATIVE_PRIORITY_${PN} =3D "100"
-
 FILES:${PN} +=3D "${datadir}/xsessions"
--=20
2.53.0


