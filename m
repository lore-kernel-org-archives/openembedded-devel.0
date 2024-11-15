Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D774D68BC1
	for <webhook@archiver.kernel.org>; Fri, 15 Nov 2024 14:36:53 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.10])
 by mx.groups.io with SMTP id smtpd.web11.22078.1731681407821623555
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Nov 2024 06:36:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=XA1kuPg5;
 spf=pass (domain: prevas.dk, ip: 52.101.66.10, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P+28c/rMz15ySpmCGei/Y9PUcY2QoRYqzn641cIHkx0B5gn9rRMA/S9agr2R5oZosPImjBUqXDT1J4hWyxaRze+0GAKpwjnfKChyAzHBvZMLteDM+9qnvuoDOw4AigPB+aKa676GY3wB+dgaTBlwOvfpLW96ICUN6EC6PWINvaZ83bTM/FAlUc040A6+6jbHFI7QRH0bS6893BUWwtIX0QLfv1TPA+GHnDpxMAbClrbrxvZHB+c1J2w7o9OwPRKSeP3CUEvg33gR2xuS6X+21AY0zW/s+kfjsOMKwD2O6cAQVWIZGx/hkjJ9obxgltES33SsMRskts/vs73qaG/kog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T4JDABvp1PdGVIeH6UToV4hUYR/RfE1DRFt3lF2M0uI=;
 b=LOclueXJVnsXq9G2/tgvNeDcYV7SzpUwJy3UTOtwojquLDshsFGrozRXW2PMNThdkXrgJmVBaO775xLhkTHvOvANnT4+TS1mmqsRqNrvIJfEkklp+IzLt/8V1XBTl+vB4yPx9iW1yOPYrJf+Bw3YQa2iscEZOwPb3z6/prRLcdy3RTT0hA1GhD8Np3ZOS6H74PQ1Uov4T13RcojwTs86NS+BuJGcSQgnQUBoTwSiMz7AT5P8vtiHsx6kMQg8dsVWyOETdLG0FwIKwlPDjfiadhMUZV4LEAp/LI9Ade1CfesWpz4VOdFZncl9wVPDzvG75C7u4nxRbMyQwTkGLhm59A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T4JDABvp1PdGVIeH6UToV4hUYR/RfE1DRFt3lF2M0uI=;
 b=XA1kuPg5i/aKntUBEijogyc1z/iyno9e+pACw5tzG3foneT/MXEn9bjLOTZYUQSc3469iW4OC5FCnLe1KR1i5e+A+DrFwgamfNHgnsxNKFr1bPIiU4+sCIqKazN+a8RS3bHS1x/eFvEdFKAope+dxWmQJzoM3R5D2O7tqw/5xWE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:41::17)
 by DB4PR10MB7061.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3f3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.16; Fri, 15 Nov
 2024 14:36:43 +0000
Received: from DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7e2c:5309:f792:ded4]) by DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7e2c:5309:f792:ded4%5]) with mapi id 15.20.8158.013; Fri, 15 Nov 2024
 14:36:43 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: openembedded-devel@lists.openembedded.org
CC: Khem Raj <raj.khem@gmail.com>,
	Rasmus Villemoes <ravi@prevas.dk>
Subject: [meta-oe][PATCH] cryptsetup: demote udev runtime dependency to recommendation
Date: Fri, 15 Nov 2024 15:36:50 +0100
Message-ID: <20241115143650.3577853-1-ravi@prevas.dk>
X-Mailer: git-send-email 2.47.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0024.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:a::13) To DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:41::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR10MB2475:EE_|DB4PR10MB7061:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b692a6b-f47f-4fa9-4dcf-08dd0582ecdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5yyAQ+8NE1YTO9wUuBHN/rq0/Y7vW/7YT41CP8cHZaO30Oz955lVr8YzmnwV?=
 =?us-ascii?Q?RizhzdHt8MZ8eNTEjbRUS+cCMvWHDpyLl4GJowYET/S26D0cEi16kjWEErdX?=
 =?us-ascii?Q?QKacIK6Sxn7uD8cGj5XxeTVQmUwJtHavlt+6gngdnxCjhmlz4uPu5jxg1rvB?=
 =?us-ascii?Q?y+vWzKC/1ym/mrrTtPGCzkxPplHNNujZ2yIDeo9ONV+PVlppqPJqCPBVkJG2?=
 =?us-ascii?Q?2ggR0zj/UbbWMCpWDKsDlcEITUpVRsbYu/rMiYGW/pzQIJRjUDJXWFAETXPF?=
 =?us-ascii?Q?9Wd6gmRqXpJbJHTpFXVc0Y8H6kKGlTbF0AiWWdHd6ucc2r71t7xAiDK9+tCA?=
 =?us-ascii?Q?xOuUGMy+Lay87VhENg7PSaRAaBFASHnG7M3XM6yxZAtdtBkjUoL+BD+BAGIA?=
 =?us-ascii?Q?XpTHxXYgqFOwVP0azS/e7gZudJtS1ZwjR6x1ZMu/Ddb2OyspQHkYZvCgIhz1?=
 =?us-ascii?Q?jDOHhRLrh0OMcBXA3Bq45i/a9bH3NFSVanJua1ZCYdzwT2OQIMl3okxcVUow?=
 =?us-ascii?Q?W+2Q6gE3wG7NHixwWb0IzXqufqRCbd6I5hH/BK32lvH3q4LQjTCIx4Cq3Mo7?=
 =?us-ascii?Q?PrsS0kUKeBqidT62rUeypNj6t9AUJTVyXny/07WkQH4lDoCvm+BaLQnG/0tM?=
 =?us-ascii?Q?KxoN8fMmzj+alxjTkODIL9t4U2ul4Xtuaa5y0VyFO0dCCrlaYPAFjEh88pVA?=
 =?us-ascii?Q?W3wlia9xUxWOADIQy14eJstSwX81RDoEMgp49Xg48/YDBtgt5hVJipahVdsC?=
 =?us-ascii?Q?rT3q4jty9TTcQpx3w0icn4lPqgzrRKh02OgEJR8LqhPuVbNwwWtVSLDfGYP6?=
 =?us-ascii?Q?bmBngdMtW34t3etM4s/f9QiOSdfotiMM6xSUqXRu9RtGDub3pozOdoE3hxRV?=
 =?us-ascii?Q?lB7U1XckiZyWpZjllUAxObl7z/KA/VAmbY1kdvzxFqS27ALGbhU37ByqJhFN?=
 =?us-ascii?Q?ckwWcrBg7lknPXk2BjyjcBG9win5+hqOja2rMC2jzwqnBjtpnKLBC//w/Hby?=
 =?us-ascii?Q?0Jh1OG5T70vQAT1cI2/rns7o627OfEkvPrxLSz3F/N1zer4l1lfRNJLT5iQN?=
 =?us-ascii?Q?0ZQVVqbhHtN9r02p91oOqyU8jP1ZG1pfPbtAL2g7lZ33vxKRMlzMbzFHlH0O?=
 =?us-ascii?Q?NtGiStVa8Cya7wtRcr9ZMIzEMn5KBy/CwuC+2UezE9FPj4L8HG0Br54aNVK0?=
 =?us-ascii?Q?wA4k0G19P8J87hFnONG3VBtGNegnRFRNwRUC/mD3aPmIirx8VkSPaCS4iEKk?=
 =?us-ascii?Q?/EirhWhnj3yj5N7J1vV+xT4lkS/Fz2oecMTSabHNV2B4WM9ZUcffeaLM0VIo?=
 =?us-ascii?Q?Dq3AxF6Ae++7octlvi45U4D+gHSwdElkeaQN+cwCSE0Huyi9LaB7j9Ml8Hqx?=
 =?us-ascii?Q?YRiBBcU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CndvpHLIlHu3t/tm9Ob+b6BTsRI3BECOHnfaczB9y64rxuRGpKSOpy56T9SV?=
 =?us-ascii?Q?WApfkwlp3vEsRSV9m1E7xmYnzOvDff/nDHIwe5TGXsg9miWav9wP9xiHuxQw?=
 =?us-ascii?Q?WoIMavockLttRigrfSn1bCR0Vgg1RBB9sfI5vM8DnWlzbI/j3WTJBs2OVm4H?=
 =?us-ascii?Q?120js/EojoQurcfcLEAv1qj5mf4zE2ZDE0cYiQBjaHcWfvWJ7zf4dmxAFSv7?=
 =?us-ascii?Q?vBpsbXnxVBC9vWT2aPls4eUNltvALc8oX1hVvw/E9I3AGXoX1S1crzmITlZh?=
 =?us-ascii?Q?viktw5PYaJDSe3EOgLpQn7pWmbLmXUl0wQZJsyvYV1WKIL5DFM53Mf6kt9q4?=
 =?us-ascii?Q?RzfmvgGm3GvHehkUlEN18aOTdR0wA9i900Db8Ex0d2szcRdWcGeQmPdKQ3+X?=
 =?us-ascii?Q?KtlJztlIeL63ztC6DmIoNUAT7IowdVmE7DZoxZc+i+DNY2BA2xF2PLCskhU/?=
 =?us-ascii?Q?xhkpKeRpsNdrYE4PpGp07pGKeXr0H94Qt6+S5Fxh0CGyQ/8iSI8QeXtRvCtq?=
 =?us-ascii?Q?2udYPXbLu4c1NDsv5wa315eGxBHnAGJJyZMsRizEA/m3lFKqNDU08STEa4Uq?=
 =?us-ascii?Q?P++tGLe1SZUbYB3hZ6LcOVkk7j4CQlChUTPnPFQKYfkF0+n20gUc3/P8k3f/?=
 =?us-ascii?Q?J93w6leMuP/H+mLmwLtTe/V1H1Yar3hjOBY+0uGeg+vLxQXFQ7jtfGOs/FeW?=
 =?us-ascii?Q?z2AiqR3zrH7VfKq68/cua+Rfn6SMZkQNjTPsrxeFI2S40gaPD4BKP2DsU16M?=
 =?us-ascii?Q?bCNfbnEI1lZoK43kGwjUbsYcgaxVhBslV9Gp549lvGJwpojeij4AZECoFhux?=
 =?us-ascii?Q?RWAwaEuuYz1WPMrJptD3I1egOIkvbyfeG7oRTnf5iHRhoNiQ6U9TQXJOEvug?=
 =?us-ascii?Q?5XTI/Vu2ad0lwwLb2+fhUneHdY6UMazcyYAvn9EHLWjSjbHYb3fzVEtv1Fvu?=
 =?us-ascii?Q?pb+6lCJnGe5LHtANEGyErCnbeZDQmA2wDwJGgxDWL5BBoZXVc3grfpgyG2vi?=
 =?us-ascii?Q?8xLYJhVupIddnP6prML2eY+egn17FOJh94lzf9a4gRhKtXd94Z2r8DizahIk?=
 =?us-ascii?Q?tdJxMGFyYajrjCbHSGi8sMTI/NNtAHyx45VMWxHifAhTILjvHOzrjjChzSZ4?=
 =?us-ascii?Q?AuSH0pT0yeQND+ejMxnDX7TrKOfwFiyNGnROR4kpymTP/jFBsD2vZOh8wLNf?=
 =?us-ascii?Q?r5PoRk3Od1VRr0g1evFZE5MWco0FHlWt9WnjNUmu12VPV+lQM969V1keuAgH?=
 =?us-ascii?Q?dtYAkrzgFo3WF06ejSapWIr69QiLopWaDDv9oE3td4+q9aaKn7bSncYMGh6o?=
 =?us-ascii?Q?erwi5rwoaMCeif1H15iTwHpVnPom6iT5y1vrPf7xKQGBV2/4ehJUKnu48pFT?=
 =?us-ascii?Q?ZhoX+v0rshlxgPq8h2dIeEGohm9DHJt1D8JoTvKSIlpI9elCVs6C8OzFXZ6g?=
 =?us-ascii?Q?GiusyhpkwrhxUVtQtFQ+KVMNmUZSzt8AR07sd+zdnTyYXeOedlfcv06QVKgU?=
 =?us-ascii?Q?quIgBfU/ggU3LG4OG9h8Eml0cvw6IVN67Tj8sEhqMJw6I9AnrTX4Gi1uQyam?=
 =?us-ascii?Q?D8Z1/XQuTuhUD/NPZRj5TtzGuP5dtIp+bIsKDXyjWoaxx18GefkHOJEmB7/p?=
 =?us-ascii?Q?UQ=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b692a6b-f47f-4fa9-4dcf-08dd0582ecdd
X-MS-Exchange-CrossTenant-AuthSource: DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 14:36:43.5826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KntrVek5G0ddjx0tSsvFkxSoFYGB3e7rlIbXCMs03/CI7srGQ3hRAgxNeOU1LUZ48QU5CjxxZeLd9SSfSaAx8KjCJB9tVKiFc+EqFJKgZjo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR10MB7061
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Nov 2024 14:36:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113852

From: Rasmus Villemoes <ravi@prevas.dk>

We use veritysetup in our custom initramfs to verify the rootfs before
mounting it. We do not use udev or run systemd as PID1 in that
initramfs. This RDEPENDS on udev and lvm2, and everything that udev
ends up pulling in, thus bloats the initramfs by more than 10MiB.

Removing udev from PACKAGECONFIG is not really an option, because we
do want the udev integration in the real rootfs.

Demote it to a recommendation so that the initramfs recipe can avoid
udev and lvm2 using BAD_RECOMMENDATIONS or NO_RECOMMENDATIONS.

Signed-off-by: Rasmus Villemoes <ravi@prevas.dk>
---
 meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.5.bb b/meta-o=
e/recipes-crypto/cryptsetup/cryptsetup_2.7.5.bb
index 60bf501eb9..91ea446851 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.5.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.5.bb
@@ -53,7 +53,7 @@ PACKAGECONFIG[veritysetup] =3D "--enable-veritysetup,--di=
sable-veritysetup"
 PACKAGECONFIG[luks2-reencryption] =3D "--enable-luks2-reencryption,--disab=
le-luks2-reencryption"
 PACKAGECONFIG[integritysetup] =3D "--enable-integritysetup,--disable-integ=
ritysetup"
 PACKAGECONFIG[selinux] =3D "--enable-selinux,--disable-selinux"
-PACKAGECONFIG[udev] =3D "--enable-udev,--disable-udev,,udev lvm2"
+PACKAGECONFIG[udev] =3D "--enable-udev,--disable-udev,,,udev lvm2"
 PACKAGECONFIG[kernel_crypto] =3D "--enable-kernel_crypto,--disable-kernel_=
crypto"
 # gcrypt-pkbdf2 requries --with-crypto_backend=3Dgcrypt or the flag isn't
 # recognized.
--=20
2.47.0


