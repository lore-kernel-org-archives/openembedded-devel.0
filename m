Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DDC3C54732
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 09:41:21 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.132])
 by mx.groups.io with SMTP id smtpd.web11.48815.1724665267299741598
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Aug 2024 02:41:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=NRbmlOCN;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.21.132, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vuiBVFVnPFNfOmrhNEu0SmmGk1gTlGGArr9UOofKr4/VDjO/w1scJHwWAmlEzX5xcpNRP6CMEPSyrH06oTaCmFOquaDsNKtQS2k3JOMgjvJtFqRc/Sp0zm+eLJUMFfutGVHohj9tzWkJ59bulP0j2TKL7dCTbXQC/J0WMLLYAaZbVah34vYGYSe5/G+GSx+Y8pv16L2mhYldguJMDcHeErtUZUpQnjCnSY+hhnMX0bLCQNOVUT518rX0in3MaBxAbSB8kJU7ogxg55MvBzB8H8Jjhnd5cXHPoDinJxpQJovav+WvVCMvr528h8LV6iTEOxCxRQx2Ngg2sD6SUscA9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UHwIniZG5Eu0arRGltpL7hqk0Mneg/f8rx83x/JL+qg=;
 b=saXU9+sPDBn7Ql6oC7c+Fnkq1tvWyow4NzHrfsd6U1xAvwwYMuXvXzl6y1zfo3jQBVyTGk7+QOOeaP26+5LYwJNjvDi3+OH8iiuiwn8cYZTY+9GxyR8esYe56W3ZJSPI0KooWN0YpY/00Ow1aUC87BPnTkfleIpW2Vbpp6UWmzCKJMjJ1qS+cpjefo3pW6IocqvOuxcDMFh016Ijn9G1hqpnKPk+CeraerbbgKqmFFuRbTL5TCWB2ydlct+VmFOGtFCuUWy8Hmn431v5CvnAA7ZJoIQ85UmHZbiElK58L0BHsdB064ZI0YRtHYq9k295FblKujrGfLpmTU+qyrrJ2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UHwIniZG5Eu0arRGltpL7hqk0Mneg/f8rx83x/JL+qg=;
 b=NRbmlOCN4dHHo1NKmZxjft6ZhXRaZwwymEGeU4j4XhR+avU2LIFu6c0E1ASPs1hiKwgx5w/x9s5XZUw0Mhr9pjB2Tk7C1F2gru4imCVyCS6T/WSLYPwOjw7QW3Za2nQUxCzC+Bbau8EM8/zLmWDsiT6kJUpOJEUoCb7lELb70Gp1/wrlEBe93oU8J/VM5Yo+EIrJN49QwrslH/xr5XAsnHzyaykuMQDlEUE5CBvx/bo6h3Wm8CIqAqJsq54Neqbv1NY5OU9Q3mGO8YRb68RdOQJ+tsMSDi2cu0qWI1eIOU6Wixe2MdLr3P0REernhyfxv8xpLrqbGfMjweKsjb8FYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PA1PR06MB9577.eurprd06.prod.outlook.com (2603:10a6:102:44e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 26 Aug
 2024 09:41:03 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 09:41:03 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-python][PATCH 13/21] python3-colorama: Fix LICENSE
Date: Mon, 26 Aug 2024 09:40:13 +0000
Message-ID: <20240826094021.2744296-13-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240826094021.2744296-1-niko.mauno@vaisala.com>
References: <20240826094021.2744296-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF00003668.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::384) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PA1PR06MB9577:EE_
X-MS-Office365-Filtering-Correlation-Id: 50eef390-1016-4637-60d0-08dcc5b33087
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?W16LPoZnwiFE5nn1ke0k+o/Me11TcDbo5ZQnkexZYp5uV0Ct0CHcMi8nhbp1?=
 =?us-ascii?Q?tJfkXdoiBkfa3yJ54jX6UZ107MEEujQUqNteKWUlkWbtozhuw28ww16mul6F?=
 =?us-ascii?Q?e01akUUdKpdqCANUJKsItO/gArOPLTjMD9yt90MhCv8RLSa/035e1jMywv66?=
 =?us-ascii?Q?1Sa5zEUJaWEGjVd95TZS0+iMfQAL4qZiBco52zeoGHLTm1LJTEbYf6xS/8qr?=
 =?us-ascii?Q?uOU2HcLGrGIm84GSUS4AuVmmvd+oNeE6QdUk45CdWr97ZAjEOod3+AGfMc/n?=
 =?us-ascii?Q?N8hidVVJN9umdIC1Fq1kWdiQRGSDFL/pEFsGJ7vuBQSLgEGmG4j1onvpVdGO?=
 =?us-ascii?Q?XDPGeVXtylFBxsAId2aboQaKZ/wL2IWVjChOPBUI4rUlqWzMPDWz8ysg6nOS?=
 =?us-ascii?Q?PvjIGc28tmVg9LhN/caZgKcN8H2AH4T7E0DFqgYoiPgi/0pNaMoE4hlc6hAs?=
 =?us-ascii?Q?Nw8wTwHPY6NWD9vKhKWv7CyKzomGeNvZ4s6b8MZwj3TDzb68ffaN4y0uv6id?=
 =?us-ascii?Q?pEpCGaR0mkkI7xuLSdjMAXz8isaLmfdJSRuqK5+Yl4NaAnNpELRHJenqRMm3?=
 =?us-ascii?Q?ZkFkJI6fNbO8V7wBc4XjNf7lfddA+pestwqLth0uWCl/Ww2+Tbwo5iwbeEU3?=
 =?us-ascii?Q?Ps+Rp9zZ4l/y/gD1h+9nFqJ/1n3GkbTid1L3SaAjSoH34DENqPuJoyJASvTq?=
 =?us-ascii?Q?KOcNXeEYEoqCFIXPrSqiBjfGJld2yP8P3Z+j+jeE9lJE4bLehAEIl0gVV+a2?=
 =?us-ascii?Q?a8iKvONTu8nOIosvd05TpSzdhAnI2DmYWIXp67sSPrMdMYPtzyN13ov4oTlk?=
 =?us-ascii?Q?8YBlq6tmr7jAzMrQ10gHJzSsIbEK822kQC6JDP/394hsLxQt3UF7zlUq0xRe?=
 =?us-ascii?Q?Jf38TKnM72T9jYsVa0wcSulmiNyZ+6XmSDL8XJp9qm83HsHBpv2e0jaSVxTf?=
 =?us-ascii?Q?4uD0uMxvH8S/OEyVxHxTrcXvYt8H6/EaC5N5qmtcACHlR/Yg7T9N94dlUKti?=
 =?us-ascii?Q?ptJQ/3ythWzilyaNxILKqXDE99bXYU512T+QjcqMNGKS/wsFDmMoSdDbrWZB?=
 =?us-ascii?Q?5/ZM2vXBP2BObs3DFzMRiMrQ2146p4kSqAQ+GNNfwlohtXGC23X0FMhYm7ng?=
 =?us-ascii?Q?GSpo/uQE15j1akfllgHh5hUHk1QBfPZJWBNuUGtCy8dGi6mKGoVvFg6fs7P5?=
 =?us-ascii?Q?R9gr5QnL3VK4kodett26fFoZwUjonQlQg8UN3/N9SSm6Uli/eEPAyg7tlZB3?=
 =?us-ascii?Q?k8zpzlmMBpLXN1OsXfbt5V3C4Nl/1B7ralKY3ArVobXsKtt1sIEIBW2iY2uF?=
 =?us-ascii?Q?ilMfgW/hEctbyvcbNW1jt4mT93j2lyAdBqvkU3VZaJGiXvFn+g+Si7HLO3Nm?=
 =?us-ascii?Q?c1s0Cn0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nghvl76DGAKJOLl0pYifmbpYqz8lmALeSbCdAtdEdZnOhg6x8ZdsIX8RnJ4z?=
 =?us-ascii?Q?94AIx9vkNaje6R01XoP+s9A7s6IzVmaTM3qpTGR7PKH6skGhYNnv7ve1Eb+N?=
 =?us-ascii?Q?49TMCyC55xEaM3eG4tnOmCmaPGH2RUD5iLD/WAf3x8wiiM0Bo2AmKQXeRjfq?=
 =?us-ascii?Q?v3QTcGbY99165d1fYaeFeeq2Ti7E8d/T2oLD1iQFRp5VpbUrZU+dIbxi18HA?=
 =?us-ascii?Q?X03teQi/9z9U1oq2eA/KJ5tu1kr3Cz51EXN/rfDTvwmDZ5JqH8cDq/QmLQfZ?=
 =?us-ascii?Q?JtVa4y631O+Q4kmUPQZqRrSuTPIR0CMrXYzXIw2UoXOv/EP/27TqTULxRxaj?=
 =?us-ascii?Q?H7HjRtNRN/k4W+TvMfS7R6x9SJxQH5+SXJeK3Zl1ZGEVcvC8JH2hG13NLQzv?=
 =?us-ascii?Q?BudlT2e53PeAYEiUCw7f21fymTvolt0Fbb+OD5Z4+asTp9fEMk5ptHJaT0J+?=
 =?us-ascii?Q?7THEemhoG/1iKfgsAaeJ9CvFiCTw1/XtewPHPxh2619le1ZeddmoIAjjt70q?=
 =?us-ascii?Q?hdBsH2Z2/obWbtUgoLW4SP7nMfDdOhqzNb/SvJ4ROZatXYpgEmt+AHGu1SWq?=
 =?us-ascii?Q?76AaJkgWcz+/UURoqzL1Cay4grZbzElj4ldOS/CWmnW4a82NViREGr7v6vbj?=
 =?us-ascii?Q?FDIBfBdgpqjrct2WPLSnhjL8dQ1mITK288RzrrS1GTjvPnDWl99dDZUC37T9?=
 =?us-ascii?Q?mXsWCZnE4Jcwwh9U2/VZdxbDtpe91PrqcB99nRm3wJTAzkyaX+2M5xQS35QQ?=
 =?us-ascii?Q?8X0rdNfC6HOQwtARUN2WZy5MS6TFxpcoVDgHRwKdd18UY92nSVODVxzAzK1J?=
 =?us-ascii?Q?4SUy8kBM0+nStSe7eQg/ZRrxKVSCEqAbISEBhEwH70SpwfRTRq6JTfly24V1?=
 =?us-ascii?Q?y42fQp6bF8npuMnmRxhE43hPoxTzdn4T30vW0l09W0ULVCKQnOWfQeD+LGi4?=
 =?us-ascii?Q?3cx4hF9HvLlnVnykqjHiT3gG37j6whVC3PtSQc4yAlSkV9CuNoGUfqlXS/H1?=
 =?us-ascii?Q?nrDNr8cTypxFhJE4UXXlxDvydoxDsj1xGkCv2P+7G6LiVaprLyJ+hqWkV5Hw?=
 =?us-ascii?Q?ZopKY7TprD5mRV3I3m70Z5adm9Pu3lQvC55nk3RCCupmhDmEEu/u+EHWS+Hx?=
 =?us-ascii?Q?z99eyhwVbZxIAIaY8BfQzLh2qP6p89Qjx2FKnRKG83N/NpHXsPyQn/cBPwqa?=
 =?us-ascii?Q?n3vSZdermlJKLHdrvKV3cb+lLPzR2+u4/tr/Gdu0Q/A0Fhx90RoYnEg5/EqY?=
 =?us-ascii?Q?7+szdLpuTGXxZa5jAIZslblGmU1ipK65/+7M5aSoMjFQqU9ZWZJk2ZTUPFVt?=
 =?us-ascii?Q?RJfVfJErNH8o7Lp8v1NyICyfJGCKdiujWKEOxm++dwSJeORyAVX4jPmkecee?=
 =?us-ascii?Q?vGBn9Z8aGS6LMl+vDu5qdq/ibX0EW48OqQoLfmZE3tl7yAYskjvRcH6ZIOCo?=
 =?us-ascii?Q?W/9XSdiG+Povf3jLsE+S48lMabR7i6MK0Q0Z/hmOrVGyq72dAZpuk1WNY06X?=
 =?us-ascii?Q?bF6EEDNO65PYTIf1WSASut5Y3Q5P4qXoNc4bYHHFXjRDFZjUD74FL7uXMkSM?=
 =?us-ascii?Q?R3K2/w4dafN7YcNDM3Yj2kmcp3TGCFx84Kai38IwzXzwqCxBp2gFJCRt5Qjt?=
 =?us-ascii?Q?bQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50eef390-1016-4637-60d0-08dcc5b33087
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 09:40:58.5000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O2qUGzIQXx0DKUEm9McBAJNsLFiDjAApkgHmjFcFsFduJPiGh6MNpgfDnHcno9+iV1A/eiCOLH7j3v5z/vFbEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR06MB9577
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Aug 2024 09:41:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111959

https://github.com/tartley/colorama?tab=3Dreadme-ov-file#license and
https://github.com/tartley/colorama/blob/0.4.6/LICENSE.txt declare
that this project is subject to BSD-3-Clause license.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-python/recipes-devtools/python/python3-colorama_0.4.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-colorama_0.4.6.bb =
b/meta-python/recipes-devtools/python/python3-colorama_0.4.6.bb
index 0f364c424..387124403 100644
--- a/meta-python/recipes-devtools/python/python3-colorama_0.4.6.bb
+++ b/meta-python/recipes-devtools/python/python3-colorama_0.4.6.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "Cross-platform colored terminal text."
 HOMEPAGE =3D "https://github.com/tartley/colorama"
-LICENSE =3D "BSD-2-Clause"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Db4936429a56a652b84c5c01280d=
caa26"
=20
 inherit pypi python_setuptools_build_meta
--=20
2.39.2


