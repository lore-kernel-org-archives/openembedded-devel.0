Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D652C5321D
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 15:34:45 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.124])
 by mx.groups.io with SMTP id smtpd.web10.22913.1724254481068842412
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Aug 2024 08:34:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=QYXOonQd;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.21.124, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xUePQnUKNLvAQHanY99wkB40gdxeaQxURVHItvmiAt+wXV74ostLPmra4bo8QTuG+aeHp1skw6dYgRwmQ9i3vMkJGZ6AHFfsew3Ce1rjHgjn+kg4G36lZ9bj6ODB7IZZ0RIeO4sSWVIZe5vHmUZXalLtZn0xkCbcpmkXPEeg53tX+hQSHzstHTFOqKXKuT6MPhC+abl/sFxxG12t7jbB5TL8nHLBwA9pOxQx5ykqHP/FFJR/SQARDQIRwNZQThCCze0UFwZcNH3BTFJP0X48TKkoetyTtF1lOYV9FRWx+wydLXEeK4QlLeBtj/wns46SZ7RMI5Kk6pdUFCA6rYwwDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oxPkIO4cVpw9mO0gNEDzUR1izksDgbzy0aOMKXobGCY=;
 b=pf3MttrcRvSa3npdXf6SiyyeJtWqUpwdGYp3boQa7VXLmsHuNeOF3klQ4EGima76m08eJUnK2tUuSpVFxJt6AAB5cA7pk8vdx1oik4hgO3m9VlOaEcFL8D+SShpK6iVWYGFD366uoiASGpvICBEvpKAAlJayvTCT2h66CDMmB8vzQNIJCFYs6LZ6LQauyD1NtWB7ykuUhlryJsWX9BcoPWgGGHnpG4JSV4fOo2XDU3TGIVFCvXbrL05kBpvDVDRNDBEi4bmW0TJx7zQUiSa1LB50EA5fZ572rUd4rja8DBl+/berixsF71ddvQwka8FafgHNNJtfkQrO7BijJFfVVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oxPkIO4cVpw9mO0gNEDzUR1izksDgbzy0aOMKXobGCY=;
 b=QYXOonQddHRwm/yRNerjO195i6qSS91cj7vSLoF6kPvIsQ1YIeTGrX1l0Mw2fCbj0bFUxzArF8ovFELCJqmbH5DbdqEyAAJs+zSnLow/1WtW9qcnc+FpopYwzNCwl7CUB6KEOEw7QCXAjZAVr+fSE/Z4pTdyJhOe0IDoSiMgJtpsmdgc9KsKgXMGf0Q3emtAtAe+M008/cMVEPNs8Rvvns2fwAihzqywY8/I0Zs4d7HXGopjnwkpsSoRQAwqYbUOzALfGJox3GD5X59nvFTKK3E7NFuqJ4PItF6kJxPxdvVSP+9imRa4nBE0St5BK6Et9Ph2qOs1h1BIFUnduSPDsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by VI0PR06MB9635.eurprd06.prod.outlook.com (2603:10a6:800:231::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 21 Aug
 2024 15:34:36 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7897.014; Wed, 21 Aug 2024
 15:34:36 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][master][scarthgap][PATCH v2 2/5] opensc: Add 'readline' PACKAGECONFIG option
Date: Wed, 21 Aug 2024 15:34:13 +0000
Message-ID: <20240821153416.650175-2-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240821153416.650175-1-niko.mauno@vaisala.com>
References: <20240821153416.650175-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0071.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:a::6)
 To AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|VI0PR06MB9635:EE_
X-MS-Office365-Filtering-Correlation-Id: 7acb24d1-aed0-4c33-1beb-08dcc1f6c315
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?oEnvf5lBj24zEmQQ10kDvxebFx/vDnXZ4aZvqAJsp1RD9EguTTT9UM4bt8g9?=
 =?us-ascii?Q?NH/YQvNyPUdrBtpaNA+L21+ZzE2PMbjF/hFtid+38p3l/E/HIowWTP3nskIU?=
 =?us-ascii?Q?IS+3Da8nNq3LIr3vERhVU9kS/3Ads5vy/oyxNhE/DzkbiLvquwPSsA1WnYcc?=
 =?us-ascii?Q?om19BQFIPC1NHpV+W/fOs3au61p4eRMtmJwFBf1vOCJb+2R6v/hRZxtceifw?=
 =?us-ascii?Q?W7xDcIMuF7gsAyXyOLMC356A9JBjw/KuJtklNzZ4UvmL/aJjcbT/jY/I72Tx?=
 =?us-ascii?Q?lydLrLp7DlkQjXR46b/O5eh66AxOuHHMgP/fe6D1aWtm0n3Sf05xo+IMzEdi?=
 =?us-ascii?Q?TSS6GSptxEwdStOMw66QeUVKS0bfUvKlVGBSjBbMeoVhg3Wj/1GDHaKn85Rp?=
 =?us-ascii?Q?ngVIL8v5858lyEzklYoV8QRP/q3oSpakkHfaJcODFLtANUEuFbh/zad+7OaN?=
 =?us-ascii?Q?qeajScuezFdZv9qZKHOZzM56iYTW5J/TKgcy3UTzME5Yvbl1rYwH+SrDE6aP?=
 =?us-ascii?Q?auuAa1eKCK9uNvNKQJmQt5qARrKgJn+xlkS4a48Yp0iLL5IN08g+J98fHNLC?=
 =?us-ascii?Q?P2NKvz7PaWavwbxpIRJBNXoDmrfESfGhDkXJJJV+AgCL1KEMBiqoRXsluEaD?=
 =?us-ascii?Q?zU0K6tSm0mbhERDBQuHSOT8/ov1x4VqXkaWB73qcTjkgZ2Ks1X0Za+gyfB/o?=
 =?us-ascii?Q?4kKaVH94s1ufUU1TqOMRuMCT+ab2RIoXrxQleXV8sRTz6Bg6N97Ls2aT+355?=
 =?us-ascii?Q?FvfZS9rrOpK1HypLxaGkt+Yd6RYhZuogWmiN/3ocQRgX6dU27SGzlU3D75rE?=
 =?us-ascii?Q?4BZHrIIyPoj/dNDjjzcu+C6CyLTIVv+0p3jCbpV+VQKCKFGWtob4jiE/yyCN?=
 =?us-ascii?Q?z6UU8sV/Iujs6sAc1JUyo5o8ZcHT/TZU7/yNlzH53nJbAjtNeH/k1zbOF0Yd?=
 =?us-ascii?Q?b60Kdbdyi5UYoCjfotNYxpmtKg7FGRwpk7br/IFwrB98oY7rlnr39BEcmdfA?=
 =?us-ascii?Q?xL56/FvIoJrllPAUhBchV+B6aQb+ebw4odKZOz9hWN0LFoGrMdoqTmZWowEa?=
 =?us-ascii?Q?ceyBB0HzP0wCqky09UHMuWRfErut29keV3xgTvlOM8swD2H7Cws9/ZIeY7xz?=
 =?us-ascii?Q?lZAri0mqOYY/p2wRj3Z3wPcySmcGGYKM5rB3XY4lL0p4RYu31RyXdZy389CW?=
 =?us-ascii?Q?NJfAMeJijoedB+iR0e+EzRMfouyxE41rH3Rzmue6zAivsL6DrF7jZv7TjEw8?=
 =?us-ascii?Q?x4HvZAH3ytPWzdSDrv6LwNjDcOgnSEEnhCfhm8yNj44xOoUHQxj9TFIeH9fE?=
 =?us-ascii?Q?1lFdANrgaJzUdVh0Vb+Z3QcuDrJecT+hzRAVgKdQQ4KeYs1ytBUd8GFt8kke?=
 =?us-ascii?Q?oCSyyZV5bcSkKitVqUW6Ep//W/KdDU0ddvBxg4g/YPr7JiRniA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9zmF5m0YdaAYs3SVZnnbjJFDLypyHARvBSZ4J9TgeRk1EIY5/d+ORO50vQvL?=
 =?us-ascii?Q?lmkv6/0HUpq1Iqlcxr5J1VD0jzkgN5rqHZIouYlDriDxEk2B5SI5qZ5jvzQO?=
 =?us-ascii?Q?dxaw/YhmNi9J3RjabNHDuV7LghnGEe9X9dOhrsw2ulpsdHJ7pRRhAoU75Hvu?=
 =?us-ascii?Q?qmFWMsgxtvGB+L/DvqwzRRQleqYk0oR3zFUafZItMeLMQqyCcOqDeP65s3Pf?=
 =?us-ascii?Q?igfUqCbpHBHDgisyPD79CzvjqARnLeG66lyYg+cw0JYlPxoIzELlfVW3oRyO?=
 =?us-ascii?Q?jYsb+hUd1FsD3E4gOHlXOJvl8W/1Kqjk3l1um1YCgaTZIwtiZwF6GzR7Urmg?=
 =?us-ascii?Q?1Z9uxtbqk6EkiN6wPB2BbYVCdanBBveS6pLDMATX7e1I1F4sZyWjG4ewVup7?=
 =?us-ascii?Q?D/e+xyM/P+46JJQYDwubdkr64eQr1xzyDktBxU2lcpyxD5igUSE33Rtavjg+?=
 =?us-ascii?Q?iJuLP3shYSMkDqI3E+xd2HGwoaCc83r3y0jWOSfkl7FhTTMqV7ZYROYuevtx?=
 =?us-ascii?Q?2aov3Wcf94VEt3fhbAoXn4sMDqd+iRfertFHkYiO5wFy7jRC9ZkIWaNvaIym?=
 =?us-ascii?Q?n/w2tIVkP4HBslKPZYCbUXJZrwY3Hwzeftpxt77FvW36N927hhXHP9cY1i1B?=
 =?us-ascii?Q?5jPtUzw8iGLnCXT3NJY/U1HjsxpMVG3Ac2dhm7GVXpwBxf3/yfZ+46dZJkhe?=
 =?us-ascii?Q?pnG0/+MykDnFNdedWxhBpTuwBzYm1I+den6T6OBfU9hhg0OmhUj5/IarceGD?=
 =?us-ascii?Q?xaarNDhIpGbhjJXCs5o5RB/3mnFqIhrgDwvHRJjI609LatT4yABrHBWvU1/x?=
 =?us-ascii?Q?V1ufHYFgTR2+BjUVxiy9qJI25GfMZLNBZz/pznIkSfUdClon58lNhFZ62CKZ?=
 =?us-ascii?Q?c+hY79UHYXaAPB+WgYjpRnylczCF+LZcQ+reciwlnc8m2j92CrJydqnHHroa?=
 =?us-ascii?Q?apT00K4nPwfpNcm1HYFHMPf2FW0otbvBYp450wNncR9ph4Zs+PA7K654iu/o?=
 =?us-ascii?Q?jMGrfOIkRbFawM6LrMTp0Qdssrbr73YjdUepfc7rL+l63T4MnHJuuuOUH9Ye?=
 =?us-ascii?Q?g2VRe3aHoIkPf9n+94SbL6MPR3puDOdxMTzgUvT2bwP1KtNoWLVmnsh4H7ge?=
 =?us-ascii?Q?KAJHId7SXT4WraZgacfxQ5J9ukAcxf8MJaigCFCOcwQFS4ZRUWtbzAffZ/qy?=
 =?us-ascii?Q?2waslUSDq8zkQd7upyi2AKc+/xjJ/9QrqOY+i/4KOuZ4tdwg7fK1g3faz+1K?=
 =?us-ascii?Q?YNmpIQZUy17aN+97fad7RCjEMMKvENNfbsLT8jXh0+xEWJvK4QHkIs1VaAAx?=
 =?us-ascii?Q?2YKT2TOWn/q7fegW7lzia9U8VGWneQB4TRNx9IUgi5jggPPLmLKKIXFQT5B1?=
 =?us-ascii?Q?UQvL5EGBPpjHMCE//hW1kPRNKd7r08oJb0YPOkQVpbr48gAFhjmN2GuSphiA?=
 =?us-ascii?Q?rGNTGRpPffjVjeymPM+S2J34LiYKf2NFm/g9TP4BaocephQhmNcuawWOhSz3?=
 =?us-ascii?Q?H1MRJZhBqnePcW7VWEc/avu54lWvwZ166pamDq+bq8zy5RBuWkTJRzuNccbp?=
 =?us-ascii?Q?4kli8qJycMldvBq60TBUYrjjcIgJMZa70Itd2MoXoDBSdA85FlB1t2C8KxMs?=
 =?us-ascii?Q?iQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7acb24d1-aed0-4c33-1beb-08dcc1f6c315
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 15:34:36.0470
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ETzrPRqGosvbu1UqFRNDV25lcUz/ggQvw9y+LhL2TW9V/8J5va4bb1iR/opej2HPM5SDx7uj92/iZ62g+mY4eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR06MB9635
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Aug 2024 15:34:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111891

This helps us to also get rid of associated RDEPENDS declaration which
implicitly pulled readline to rootfs, even configure resolved readline
as not enabled.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-oe/recipes-support/opensc/opensc_0.25.1.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/opensc/opensc_0.25.1.bb b/meta-oe/reci=
pes-support/opensc/opensc_0.25.1.bb
index 145bbfe25..17dc62e19 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.25.1.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.25.1.bb
@@ -31,8 +31,7 @@ PACKAGECONFIG ??=3D "pcsc"
=20
 PACKAGECONFIG[openct] =3D "--enable-openct,--disable-openct,openct"
 PACKAGECONFIG[pcsc] =3D "--enable-pcsc,--disable-pcsc,pcsc-lite,pcsc-lite =
pcsc-lite-lib"
-
-RDEPENDS:${PN} =3D "readline"
+PACKAGECONFIG[readline] =3D "--enable-readline,--disable-readline,readline=
"
=20
 FILES:${PN} +=3D "\
     ${libdir}/opensc-pkcs11.so \
--=20
2.39.2


