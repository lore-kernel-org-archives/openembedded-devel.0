Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54D26C52D6F
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 15:30:15 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.134])
 by mx.groups.io with SMTP id smtpd.web10.22796.1724254209568502688
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Aug 2024 08:30:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=rhn+UVPy;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.103.134, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yWuGVediPbB+yv0c1X/CfoWQjQsxXH2r+rZl80R/3nwnt4KXTF7FF5AdTBDeUopMvu/xNfznT4t7D8bR2kx/aLuuIDODvDokw9WSEsdpEldW7c29sNT+321yWW/5DJsfXIYet6sv07lLooTI8rMOonMT0+I/QwJZ3/7331NCx8M/VF3pLHxCBGykZSaqfIqq6ZhGUCr2IYwul8Rt4hfeQw9AzzANSgF2gewng4O2tH1tVnp326RORODrEdg1Zbnxul7ZBqHOvkFhwbNXUaP8DIJrF6CM4lk2R+1fIwQ79TnfmnGWeXGet3Y6VBiCDEAtntMjX40NbfgokNdUBOmVtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HydupSUbtlK1lWquejMp6NLvZim1i2MdL6E9aR/Ck7Y=;
 b=jkyLnSoq1eE91npHui39USDvhSD+8BAkTLTYzklrXXbVIu1L9CIR+cSp5vgFL3M+6k7S8uIT2/zsedXp+ZFleVYiS4whbEqcJkdlqEDzZydL6p+jKYkEfSgaO99htcxqkaKYQzLtS3ltvtvGADSu1Mi5vxEDLnKyAbb3R4BFE9ZHFMLba8WnIxV5pT74fVO5TQfBQkkUP5pdgip7+t+2Ix91iM5OCQCqU4R4OLen/k0LfJMz9UM0w8S8hAlm4rzMaa7TyRdwmMtuabcLH9GruDchub50BGauHPVpGVig6HpIMq8rqmn87VvMYFFaK3O70vQcB3YB1CYVFz3BYFwtIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HydupSUbtlK1lWquejMp6NLvZim1i2MdL6E9aR/Ck7Y=;
 b=rhn+UVPybi/mRrDTV5ScfoP1RhNMRzVr/o9a0IuXshhTMsRLuDRkUkAtYZmzgMPbiqS8H5SYuEN6kxYTGWvfZNaQeTJRs3m9zK3Yq4O8oISWU5Uo670/P8LXJUal1B/AwlZw+a201luqINRQk4Kj882EYn+l9ij1SCaogcA59+eaUBnvW9GfzPiqUc3CA5nNprS37ul0wthsx2Ie162cp3FR63wi2lSbGHL8NgH7Vw3sF0wUbmZHyVrs1wWcwRv7auDGHMvmSySW+MsjdBI+WJqgxJoNEcWi1Px1aOtMr8LpEggKTxDqVH4t31Q/mgOBaeuBi04HuxMDzp7J381cIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by DB9PR06MB8140.eurprd06.prod.outlook.com (2603:10a6:10:296::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 21 Aug
 2024 15:30:05 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7897.014; Wed, 21 Aug 2024
 15:30:04 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][PATCH 1/5] opensc: Amend FILES:${PN} declaration
Date: Wed, 21 Aug 2024 15:29:42 +0000
Message-ID: <20240821152946.650107-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GVX0EPF00011B55.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:8:0:19) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|DB9PR06MB8140:EE_
X-MS-Office365-Filtering-Correlation-Id: f93a81a3-4111-4f09-c7c8-08dcc1f62105
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?a8tf2tO6UWY1mINFZhHf9zzGYYghigvM8QvbRZdRDZs4GfqSsl4XIi8Qk4fR?=
 =?us-ascii?Q?D2RzBIMPxYKHBcNKhxE7l7VgKOz4+imPBvDnkHJSLHbbNtN+QxQg7Mh83OY5?=
 =?us-ascii?Q?CneTXfVXfu9izw/gVwexaMgdd8jq31kI/RnZycldtgw5u/KntWHusJv6cr30?=
 =?us-ascii?Q?VrbiwWl0N5d5YUStQTRJq9lhtDMA8M1S3QRwOe+GSo/5XB+w4HiyViiHH07o?=
 =?us-ascii?Q?g9qkk7HQpDgwHFvnlRTaRT+M7s8iQ0vsExo0oRYbBgL3RII12tFz3r3YIQME?=
 =?us-ascii?Q?xf5JqLOuQDBMtIaWdpuU8NxJDIrHZEmeZtApPln1lYEZ4OEx6ksgLUOG0Ivs?=
 =?us-ascii?Q?paVPiqomKJ01vk7cw2G2cDFWhGHyldSp13/JSVAKXr/w89qjKZiCurAjy7Fb?=
 =?us-ascii?Q?zkUFn/fLkEtmaIf+jdjsEISx1etq9w/RP9IdtEtCYOA7Tu3OgN45XSOafYuH?=
 =?us-ascii?Q?JYPxwC2LaZHpoEpArZ3HujVsqRFtMgcoQ5X2tnhIJYdh/KmoByc6YtCjVy2/?=
 =?us-ascii?Q?cNsKaVFz3cNMzsP655ELZ1feN6vPRx9EB/t5wLgj1bOGzcwYrbp08FR3vJNK?=
 =?us-ascii?Q?unoOk5dIrpB/ZJ71D2Kti5/GM6VFQ9JnrWzyLcsSx4l/sFH1dZeaFn2kUS8Z?=
 =?us-ascii?Q?9CRm4OSGnjqEcRmtxFGcrhLXEXwMwLTeO6MlEdqd9nDuVQ1ttM6GEQx78vOa?=
 =?us-ascii?Q?z2w4B/LBFSXd3TJMH9dEEvC6+b1j+b44sg5DBGXXLwQ/20M/YxoL/3aTMrI2?=
 =?us-ascii?Q?nUlMEVerRJ0hBRqAli8xnnPgA/HaDa6whxyVMb98AnwwiChcTt/dfzspAJ/u?=
 =?us-ascii?Q?15SqqTYnZW0CC5knMPMkoT8Dk9M+VdZcK22LPciCfWEKvN01yRVIdDmP4wPX?=
 =?us-ascii?Q?Zsd8ow3WWdfTq0LKABElwzCq9/+6xSVdoeDH81v3+Gblt8VMq0KHXOldkk6z?=
 =?us-ascii?Q?syGPtD+QgV1mS8sDv3wjazGddPjrvaN6z6TChYOfo9P9WGFdpXL+ZO1UE2U/?=
 =?us-ascii?Q?4FBxigKu3RAEKVym+OAcGvRbKyFDLYW9lNaMWX8XNrLaEY+m5D3xKf2RHEEg?=
 =?us-ascii?Q?QHf7mMBhH5pDm2aHdQAco2g1Q0wdp7RVyoCrkTZ+Yi8Dkk54mWTySSvsOt31?=
 =?us-ascii?Q?QPsFsQw+Xvj5lgYyokzBZEAAlRv7Hnq9+cEStKLALCdSj2V0FyQZ7VXHBaqD?=
 =?us-ascii?Q?o0KoXkHhYDBKuyjs+o0Ur9wZLBJmxm8+o1IgriCY8qOoD+dRfYW9FtgTo7k7?=
 =?us-ascii?Q?7Xw9Boq3NTLGvvKRMlCPFbVH7QLojF6/lmbwRjaTQTa/gbFQcPxyoby6Q+1L?=
 =?us-ascii?Q?8yBjWbNuqq3zNlRaDdYH3OBKDWi+KH02iJy1EoMJrfRVM9HoXjgotMh+cbZ/?=
 =?us-ascii?Q?P97pkqimYuDn7Y44sHKoPYYXlxeDxaDFBz7YZ0VoHIf3Y/9S7A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cQ90Wahxb7Ck8PSZxJ5bKIhV8ABUK+F3R0lwpzhwdzWVYY7ngwt2WBqfvaIf?=
 =?us-ascii?Q?brln+sB7UQ3C6QwODh7qI9QoTCeBfNs1g361QIoxH78Vw6z35lv69LQToE+G?=
 =?us-ascii?Q?XSY5Si8ZnlG9sgL6OGa99WzKqv3bZrmsWsBtt9lQxgBt0ImN53o7xtI5BNhZ?=
 =?us-ascii?Q?QkvEadRxIJdZi3Yjr+OlL6FkfgePm+/0LrGj5+hBQ9i1UycXisOaWukBEJ2C?=
 =?us-ascii?Q?o2ElS0TawZJ+3T1mXwDTia0Jb1oKtojr1axQpRKVKvGp9oqO0SGW4tnMA+Zs?=
 =?us-ascii?Q?G3xcBC5+iME4uo8jQHUzHVd8Gmqz5M+3rxlqznAeT9Hdcd8JjBGTptLALk7I?=
 =?us-ascii?Q?kXVTuBehKA3tv6e064iOzofBUmFY2YlL/ak3PVVQYLwZGajOwC/5W71wqTEg?=
 =?us-ascii?Q?qS0BA5Uc1HBFw1Rom0c/+6tOGNub4/u5L08mjZ/V7XhnRKN7q35tRvRlV6a1?=
 =?us-ascii?Q?rb0NIzCuQ6n9Urxl08of82fn/973wsOdLoAcSc5W6q8NrtqyVXvk3LKuBldr?=
 =?us-ascii?Q?PylKMN08rObF1lQNlpGh+vO61BgTiCPIhMX2oYRFSLk1pli1WRHytCz2gtEf?=
 =?us-ascii?Q?0ZIicKYC1SmoTH0OOQdb/bxtklGjCsr08esNkj3zPeEtHWA5wvveThFOOxrS?=
 =?us-ascii?Q?jLQzvKnvp+u+V5TO3j8t0xEOtyPCv06PnVCg+XuNI4BVFXvem8y6rPJggOpR?=
 =?us-ascii?Q?EiPjqTQaHRn/hhvz3UxUGgpl+AED0SqLLWVO1ph+jasCUZypf1VqyL+Xpbm2?=
 =?us-ascii?Q?yEY7LldA+nlroyM6at5dUf3bMiolYjuDgbwQASFyKlPN43ibIHOloKGD+UhY?=
 =?us-ascii?Q?+yJyxqvKM3mOUUfdZRRjDEdQ7SBGxSHabT4vGQ5bfvbMw330lAw2t4aSRFj1?=
 =?us-ascii?Q?YiAkcLd4ZE+V1zuLQemgFAl1b8D3cvUTiy1iIyouzEN3Ub9SKSvCS4ZJmdKX?=
 =?us-ascii?Q?rhuC/sCloIvgBxzpeoOFcfbCyX9ipY1DMzvl3w46x6bIk+1t+PsDaXKGbRub?=
 =?us-ascii?Q?5mbPyRFBAjboQLVXgJXS1OaTv8+K8mfKamQ4H5lQULMESiX5FstqOpaKv5cp?=
 =?us-ascii?Q?lepjh0+FqpCpaBRDUZkViWneLAuyXt9+bhAKWdJhSQH02ssYRgcwLMgN6osc?=
 =?us-ascii?Q?p/IBB9JPbtHHvM5kMZ9gPYTVxozMJfi+FnbQvfX4uTWa8zHE4wy+n5ixPeNx?=
 =?us-ascii?Q?efJiCuTMToC1+FOZcylIflYnj1gOHTXWfums8fMHbWqReOXjBFE7PHuSxl4i?=
 =?us-ascii?Q?6pqScvFPSU7YVyppgRQl/Ht0QhEpYdd08eN6Er4XvPo1hXsX2Vxf1o2i6AT3?=
 =?us-ascii?Q?RkJHJneEZg3JZ7o53zH1Dxk/DEc0XLSVk4WCY4Z9epOfjitAL8RN68VDLEDC?=
 =?us-ascii?Q?AzyEzjLkydQlbBLgvpK45beA8qqORXHhK2ZtNXKYiBUio7Tx3q8tKOeJNHrs?=
 =?us-ascii?Q?a1DOFzcs8Mh2edYaNuMbYiINkav8wgACdTxygBhuaOoxqM/jcurTXyRsidOk?=
 =?us-ascii?Q?h+4kDqsT323CFvZntcgTyIH9SMFW2I6MrCvVNQoqsZvNNid24Cgy6B7cAYCD?=
 =?us-ascii?Q?yA4RpzPz4IAzccmeAiS93RLsxYIO0soEp8DJPhlaT0GAsnjYU50j1Mqy3wZJ?=
 =?us-ascii?Q?Ew=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f93a81a3-4111-4f09-c7c8-08dcc1f62105
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 15:30:04.1440
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vCan6afaIE7GJVrXk2r0k7hF5sCKzzzYmGQu14emu+jkDuaH9nVZx/jYdxNGiHUsIdUOCEqCPJAKOW7/EOMKSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB8140
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Aug 2024 15:30:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111885

Commit da68f807bd718fb848acc792fd9326df719e0880 added the symlink .so
path to FILES:${PN}-dev to fix QA error, complement the operation by
removing identical line from FILES:${PN}

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-oe/recipes-support/opensc/opensc_0.25.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/opensc/opensc_0.25.1.bb b/meta-oe/reci=
pes-support/opensc/opensc_0.25.1.bb
index 19fb78092..145bbfe25 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.25.1.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.25.1.bb
@@ -36,7 +36,6 @@ RDEPENDS:${PN} =3D "readline"
=20
 FILES:${PN} +=3D "\
     ${libdir}/opensc-pkcs11.so \
-    ${libdir}/onepin-opensc-pkcs11.so \
     ${libdir}/pkcs11-spy.so \
 "
 FILES:${PN}-dev +=3D "\
--=20
2.39.2


