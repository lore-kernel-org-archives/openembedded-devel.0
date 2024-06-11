Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66E93C27C65
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 20:50:42 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.59])
 by mx.groups.io with SMTP id smtpd.web11.1359.1718139034970653525
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jun 2024 13:50:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=QmDOUGY0;
 spf=pass (domain: prevas.dk, ip: 40.107.6.59, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jr0We0HDpMsnzQ/SbOSIxfYClzlqDw9fYIwvpo77YS9x+g4bAOmDOCONezCyKoZQBRSRJbwmZVG3/bls6ParphUOvdGS/W1utn86cIgXy1WpHC9bLlujRkb3HUIXbahutVPnt9XfhUIuHrL+h0At1HaS/F9f3AzaJ97vsm8erI7K9sf6gp9lRFiAOAJpSw/8AWbulJZTaHDAoBpqzlMp+aWDLg3cIW80To8hoZTix4X6ufCGqA41PkH2sShdeurO284JGnmacZT4RYiVCtFS0pNVAU7+vq2NV+sWY+SIzlj6blXgqM7eoF34p9R3VA+6NvlGq/J+2yinshxX+PJ6ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=521ghl+rMAyz4T/JjYA2EapmTd+M8K0DXzwCTqWoQto=;
 b=fXd5Yb7ECjnvb1QWz7VVAy81dZ+MDb9ySOnxInMXgZ5nTDREi8e8dB1g/Lco58QxqJNCW53aTA5SqEljulVdCuWwpckxroKWhifu6El2kzsafJipyd5nWTPykXSgBlnrs9tAG/KnqSfedYleS0hpd7zgDVxKrPuR6XZ6TqHEsnF3lC3GcE5DVMBq04aI9b0p5oP3TYGb8dTSNJIDX8/7czw1gao8VlDNEnRJEl+WZkmw8HEMjHyMuLwDUut8gRjDsv4sUhdPaavK3m3YPlRpGEwgqGdZALoedmPlWO9ambSNdm4c0et58P2IhPZjMkWlrULXJ+vADz06cIOTstZQ8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=521ghl+rMAyz4T/JjYA2EapmTd+M8K0DXzwCTqWoQto=;
 b=QmDOUGY05ZOA3eCHHqy4oj3jl8AX26xrFh50LXBAeaMzOqhFKuH4KCR41jFvnkL7SberpP15Stz0cChUJxM6MHIoKOA2DN+I0i2hcbZ6PrNcgwrS4wNET9d64h+UcI6jbMcFwkCwdgYhVnkVVkQHOCeFxOkWyA7I2WIzOjR2XO0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:45a::14)
 by AS8PR10MB7398.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:615::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Tue, 11 Jun
 2024 20:50:26 +0000
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9fcc:5df3:197:6691]) by DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9fcc:5df3:197:6691%3]) with mapi id 15.20.7633.036; Tue, 11 Jun 2024
 20:50:26 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: openembedded-devel@lists.openembedded.org
CC: Armin Kuster <akuster808@gmail.com>,
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: [PATCH] dfu-util: allow building nativesdk variant
Date: Tue, 11 Jun 2024 22:50:21 +0200
Message-ID: <20240611205021.302294-1-rasmus.villemoes@prevas.dk>
X-Mailer: git-send-email 2.45.1.1.gfd858efe53
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0061.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:8::21) To DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:45a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR10MB7100:EE_|AS8PR10MB7398:EE_
X-MS-Office365-Filtering-Correlation-Id: 5742456b-91ed-4dff-35e8-08dc8a581eaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230032|52116006|376006|366008|1800799016|38350700006;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?mcOktSFTuvA0l3SsvT8w2VmsMCmOjzO66fBw3Mg+kNc1FdgLFiJp2SoGRpFf?=
 =?us-ascii?Q?VEEyOrZkJzRawtlm1yArG4CE+w9xGGeqljRXPEhy3URB8/gbwd5kNCi7SfBv?=
 =?us-ascii?Q?qS03qEmcRFezqSMLLQ3lse/74orJ3RfaZ9wto0TX1WcqL30VEjsS2w/dPb1C?=
 =?us-ascii?Q?S90wa09UUQO4uSSBk8XUXUmyMRGuEYROIsqW4MFIQZFGHl+zq5XMabHD1TuN?=
 =?us-ascii?Q?5WYUmVJLtjRuQ8twAJzC0C56tTuJ145UzCdL6T6FH3l4wro16UW4EoPOSe+F?=
 =?us-ascii?Q?dO7m7VoZyM/g7xiMb+E4AaKjqkHFUNz6YQT60wKS+whR+d1Ds1EVpmDm9NXO?=
 =?us-ascii?Q?OXjLmUEkLdEANLNGTIw0kYr/k9h9MJ1T0WZ06QxIs1+bU+/OX2vO6bFJLVn4?=
 =?us-ascii?Q?C+4go7Vk4gt+hv7X2GXkgJVUPQbdQ8vF/ll2af45q7WBsiCcCzewKVxrbQJ0?=
 =?us-ascii?Q?dWPAWzoA5TOySA1jM4NzGQF1RiL4jkW2+rGSRb5SdOY2TJws1N9S0fEu9Q4t?=
 =?us-ascii?Q?5IwriXPIwW8qW8kmnlc1Wlf3WUMMLyUTOBZVRVO8mATQGLthL2pU01yMQAkM?=
 =?us-ascii?Q?fB/yTeQH4xIE+o/2/bJT+/wW2uiZqfRE3hC8MfpknE+6tgl88IDNJApTIEki?=
 =?us-ascii?Q?UFMvZLUUtAuq6GQCG/s51y86TnIgzXU6tvHgurVNtdgNBXBbUrc4oJ4/ggE1?=
 =?us-ascii?Q?ePFHHXm66QQRzwhqYj2zxc0WngbTm3GvOmead7jjtiyCIM3cNFJCqhmCJmYX?=
 =?us-ascii?Q?wBUQ4xv/mzrFjGo0WY3ozJ7305ILbl9LN3rtDWdh1YyChgYtVHxOExVeUz5n?=
 =?us-ascii?Q?biJQ8Uiy5C+PUQ+ZggcDhsian2FR2XhWQoKAhPlwWWmndpNoza/a4HlMwUnE?=
 =?us-ascii?Q?NzsPV+zuPx4OFZYx72HCEwvHreYLNIDGV9dWy/SuL3ZJDpJkcavk++12Ziz5?=
 =?us-ascii?Q?7pOl69g7276uTnV5VUvMPGnhGsg78DwupvlLF/k0Rc3Uay3ZubSTd2oMMPqv?=
 =?us-ascii?Q?Lw7E0rAVNB6TajamNQTDzsYLzHJlMa+q8Wew2yzD/zTqSUE6Fc1zZsmoLXLV?=
 =?us-ascii?Q?QoXib2em4F72vWiGq3PQhJWsOgRV7UVDmctv3uPSntjgc2KJfL79Yl6jfp1i?=
 =?us-ascii?Q?FAwh/DlQBC0wx8pB6WFBB9Djxn1XvwVoKKO3hqtrjchTJNVAXwtzbGuXVjjm?=
 =?us-ascii?Q?NG4hlctU06zTlNSN3Zdsq5a/LZneHWjp5CC1ayl+GP5YvV3/2uZhTEopHYct?=
 =?us-ascii?Q?HpjDagMaXsrPJ8g563DGxdQevAAQ39skmF8Y732UnEmRPRViE/MicUaRFRuK?=
 =?us-ascii?Q?dCCjJp/cVadUborNXR7NoJ+7TY0r4XsD2fFT5Jb9K/P2eEeeKagggrk5HK/a?=
 =?us-ascii?Q?QzfWhtA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230032)(52116006)(376006)(366008)(1800799016)(38350700006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2e5ujZOxjbZ0K9b3DZ8NS+I0w+nOwHW9O0nXkBa/b2OuwGeDegZlF3g3deBs?=
 =?us-ascii?Q?VnXkWH3rD5YE7RybzQGp2+WjtVYlyuve4te3QitnCDswYeZ95iMm/WlBQmAe?=
 =?us-ascii?Q?atxhowMGsdHCVFXJvWwaHd6oign7VSttss9tmYWNe54Lpw2LecZJ4bPLyh94?=
 =?us-ascii?Q?2kvp+af0ddP9z2ZvkuagV1mPO0oMm5/HnQho1IdGuE52V8S46xGJXrS3uyI/?=
 =?us-ascii?Q?ZmHzQ7Qz/0dNEHs5vF08Bg4S4QQ07Vs0QDofTRjWkRlyejjVSa9ghHP6K0fH?=
 =?us-ascii?Q?a7w2Kl7ilcxozTMvqlQeeUWA2JKdQ2N320qFQ6F/IUhNtaDx8uDUnkYC+HxM?=
 =?us-ascii?Q?WBpSyw/rO0Xm0XhpL6eII6koPTBgyHq9/TN0d6BJiNvTmfEER+ebZXMBQPfH?=
 =?us-ascii?Q?b+bT1gHTv4anOIzvwaVPE6epIBqlIR3AnYmHgluVII9J7/tspFxwX82odSM3?=
 =?us-ascii?Q?9w7LwvnEHf70FcfMpxtMS7idcGfJbJrzKFwciOwud4QQnxolnqDpCuq1Bz6f?=
 =?us-ascii?Q?KIKtHdrIT7luYkHSyzpOQIk5YZNSXhwY96W15pHuB24vkeh300/2JjrPxOOz?=
 =?us-ascii?Q?mT+uPOHTOxE7WiwFtUmGTKwB4C18XJZ5T0B4l/IoL5LVILQI3mRhFlMpYrlp?=
 =?us-ascii?Q?r1At/K2AG2CQCU9rRcu6JyWHgjbgOesYMT3RLBHGth3HNtFRa9fCCrchBT38?=
 =?us-ascii?Q?5n8pieSh+7j9WlftL2uG7tmrFNIBP8yysvZi6jBAzkIA77RAg01y7sjVlKhL?=
 =?us-ascii?Q?OpBDm3YLp4yDkkjlA1HT5eGLbHpVhNQEzghQxvwsPKzQi+wPyHdhPNiaOOua?=
 =?us-ascii?Q?oVFgfcppHYIpLhEjc+tvBqbC3XDLqJfiUf6eNMptBi0qq0zdtu78LLI23NiL?=
 =?us-ascii?Q?5zZmbySE8rEdTdJHae2gZZMBQit7U4GHKx2wd18fMD/fqJ6Js4B0EQA3jzEn?=
 =?us-ascii?Q?ALD4DaMlomWm8xB+bbqXTxSmqCFuWBqpBwsNKcW62FlvTNj/1SHxMB2sRMep?=
 =?us-ascii?Q?Jx5CsmD3cMbsOcU7W9I/riK/XvgcHMqeYKyigLIsbMJ+G2rMwjV8ctkLy6ud?=
 =?us-ascii?Q?1fo3IJB15T7DdwBbL+erp6jKRW/8Oj87unLyApasEU7lpqi7EHxmXPdfJr1A?=
 =?us-ascii?Q?rTdw6YJ7SWqXAgCo6p2uaf7mzKE0d7RyidGzvrfhIZQ1AERPmNAwwrTFd5un?=
 =?us-ascii?Q?gLZZKfaUkRfsRPPVutVNkBBpKGyoiWXGBtmGeovtAu+F+hcln2GgLKJzvqmC?=
 =?us-ascii?Q?3qijZ/fKU5NzPqdH9uOAcmwpu6RKIIKPmkVbSH+w4owkhf2fvOzBegj9m96z?=
 =?us-ascii?Q?Dcbw5Jp2E9ecePywv179AsunEA47o+cdClp7u06GB+O27LTLej7+EX8dpCEU?=
 =?us-ascii?Q?v+JsX/6O4ZNl5Di1N6NUGdw6FMvdMyd2p6KcKz5URpAONYM9xWwzrE0djm2S?=
 =?us-ascii?Q?toqj5NOLLBegX7Obx1VR0K+e+DwX+C3+5jd48pO8sojM2KNq2y48q6WnSAuU?=
 =?us-ascii?Q?4M3YFLalxUW+VRaKxNfjJxKzPwDtyXyTArRAZTk7rpPcs3Rsc5Y8K3FktLpm?=
 =?us-ascii?Q?/insFzjxd3VVEG/S7AVI8BP/IELj5Ul9pqRKRuFlE2bmDdqGjOTOwPwTH1Cr?=
 =?us-ascii?Q?+A=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 5742456b-91ed-4dff-35e8-08dc8a581eaa
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2024 20:50:26.0442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5WY6Z7WxNOF6MBGQl+fRQzNPh8W09HwQ4egAkAubXU7d1jpb5saUBiWgMjnCe5ub3SyW5VW7iTpW+TfGUDnThCvnSHPJd9JjsIWuOP1PHSM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7398
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Jun 2024 20:50:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110834

It can be quite useful to include dfu-util along with any other tools
needed for bootstrapping in the SDK.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
 meta-oe/recipes-support/dfu-util/dfu-util_0.11.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/dfu-util/dfu-util_0.11.bb b/meta-oe/re=
cipes-support/dfu-util/dfu-util_0.11.bb
index 17547ca83..23913e31f 100644
--- a/meta-oe/recipes-support/dfu-util/dfu-util_0.11.bb
+++ b/meta-oe/recipes-support/dfu-util/dfu-util_0.11.bb
@@ -9,3 +9,5 @@ SRC_URI =3D "http://dfu-util.sourceforge.net/releases/${BP}=
.tar.gz"
 SRC_URI[sha256sum] =3D "b4b53ba21a82ef7e3d4c47df2952adf5fa494f499b6b0b57c5=
8c5d04ae8ff19e"
=20
 inherit autotools pkgconfig
+
+BBCLASSEXTEND =3D "nativesdk"
--=20
2.45.1.1.gfd858efe53


