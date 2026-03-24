Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF54DF532F6
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 12:59:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18824.1774357191588536524
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2026 05:59:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=aqATYw0J;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7543866fef=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O3ASKt3548742
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 12:59:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=1HO6E21GDoRSBIj9oaZTMHIJZDuOSAjBLjR1GOU2izA=; b=aqATYw0J9dOv
	5ggNG6G8Qg4HNwVMALAiD1ukpSEeTL4ZoFWi2dd9ld6bDrAR6iJ+6nQvyCpSIsTL
	0Wy7/KQcFeuYRyvWvToL4EI1EzqhRls/aeMv2bx/6QZKghKZZmHxwmVayNuhb2Ut
	CzzSQ19+QiaHXHHSsGIVeSJ0JRtFS5Uc5JI0IfFtZmFZBM5wXO1ZoM/vQR9EFXDT
	AQQORhlgnfeU/fsy8o0UeMYRhmbdTgBLGD0A0IRKbYu1gMg9gO6urztkMJUSvqZ+
	BlnXhU/a+5E5UMbXrJrmQlGq4IgKCJIlZk73/1KSGSYjoaoi1SxNIhAgYKoVfLS+
	c0YZrS2eKA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011057.outbound.protection.outlook.com [40.93.194.57])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1ja6ubgy-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 12:59:50 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lTNIEpZymiFbWOFQsT3mPgFWVGWnRK4hlpbhaLC5W2Ou+wc1dw2MJgAyGVd60IzJwoCZfRin4jlpQ5lmdRtlzS2iEonEiG07tHi7gKm+y2a9FrC/2sgkpHNuG+tLxk5MdH6oUH5gc+ygKCmaCZ+ye2wdqI2RVRmMMIGP3T52tNciDm5Cn/304Y0rk5g6TJIU3k/XbUCBICWG4AXp6m6VnxjLTtNROE5NpW1uCvchdUNY8sKs3A6zYURXcttbCOW/JLasT8iY+LsH8l/XzwVO7hULf9dkf5HJypQvG20MiFymuKB2yylHkbPcplKvT+akyRDJq9QZSpuHiU2rZiK9Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1HO6E21GDoRSBIj9oaZTMHIJZDuOSAjBLjR1GOU2izA=;
 b=CO2jcGJD3juYErZT+e3zle0uMP3ShsuOvj/ytlhzAc6cxwGIPtnVBE0LuaK39g22RdMK4WIkPDpBG2S+RLmWwkQ+Im9K4gFdUzO9khiwPvbxhauRapmIcwyii38x4wKc2XVAZ6Y9M0pCcGKSOwI986g5HVgN8EyWHeIKQR2PlWFzpBQNDaHp10lDW5Xe+qRMxtJ5Flk4CLlMnOsgtVgy09ly+ezzu756+ur6yWMftwsgCvJOhym3SN4EyvjM3I/jcQvsmIz1Xo8TheijcxIaDV2rXh6m4rsw4RYmDlo8IfLgHGd2eYnE3paEo14ZdKfizdRntfKDmbZOcjO7s1gY4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by CH3PR11MB7297.namprd11.prod.outlook.com (2603:10b6:610:140::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 12:59:47 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9745.007; Tue, 24 Mar 2026
 12:59:47 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH v2 04/15] xfce4-power-manager: upgrade 4.20.0 -> 4.21.1
Date: Tue, 24 Mar 2026 20:59:16 +0800
Message-Id: <20260324125927.1070644-5-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260324125927.1070644-1-peng.zhang1.cn@windriver.com>
References: <20260324125927.1070644-1-peng.zhang1.cn@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0114.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::18) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|CH3PR11MB7297:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d028995-b33e-4a7f-3175-08de89a539b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	+ATOVPTXJckoH9Lp8nm62CZeTgswiVZhvaQs+X7Jsw62Yx+KW44riUvEHAB5xPqiIkFTXH6WA+EMl88RNUM8b8O5z4aUbMKLiyr2e8Ulz9eqvXHUWhRXIFGsLPdRfWqCP8D5Tnh3yCekqgy3w9GBG9yx7xioUQhPuwA32b3436EA3hSSAeTVGWgEd6iD+T45ve0D0r1ZcuosYmQBQxGIGlEDgCpHw3V6DPTmTZ0fk6xZbrg6x8cFtGU62B5gPbgWMcVKNytydG/MX/TLyUOrOZuo/RzEg/fIKF+wNXVCGQuNUKgINwx0iKyKnCdWqLR3Wv29dCn35fYXVdAK5UbLs0x9fZ2A1lonZE1F02WBF4f9lREaxfINudrWmiHxk5GubMW4/Ug/2zz3RKwt0xpgo8w3Rup6sdk6GZOlvtrUI6TcCupljPnZojDNsEazwJk9Ja6eMKdWFAntyPqIKoSJZjvNR4Z+Gcc4BF55DbrleTTzUHdes8CVQxOqzRHhLaUD+uXRHuVH48ob9Gao24Tzu7/MgZfHvNEJFUESTP78AuP669BDbPtobNtTqswbn3DiMSSEf5m/nCtm0DT7olmvGvMlVlImKkUvpU8DYZu3icOxWFMp2ziPRzYt1wySwu8y6VanyQCgVCGn7VAere4Abs+Tj3Znh24voig6aNvLFm3BuBLlg7UrNQUTlKm82qIMxSjf5DKO0ZnG8kktNLmWqiCB8PEcXFzuftt2u9DWrjgSOJZ4w4FIjnsMtxpuUkDy
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7MZVPPpbSek+CAEXVjphpvRllpqxreS1V4gu3+Z68j+A0EB8xEYkGfQjbea8?=
 =?us-ascii?Q?gCUshaGUin3BaktI4QGcCPlv2lvcM8r1gflAL1h5rvIgZra5Xz27avPe5eUZ?=
 =?us-ascii?Q?wH2cJh10CvVdRMu0BvifPaBtxbIGvtSQ6/F5Ba/KggfFQJaq6MoI14nfHLDp?=
 =?us-ascii?Q?yDGK167Gv0yKJMOSPqqKRBt3g7iEs7GvqNbkCRS0inFtfavyGCB/YQqeurbI?=
 =?us-ascii?Q?dGGBl7N9Xx8avsIHxyzs8SpfMLizIGggRzIsajxMI6C7a4jlY16IUIljGDo2?=
 =?us-ascii?Q?0FGkCdEMSMlT7not5bgDF3V/uyJnViZsHSkGdz7cDMO3/Y9xYJwqE/xs5KRN?=
 =?us-ascii?Q?JRYLhYKJjJiAVoz/eKU/+nhwUu338ILbv+GBopZKFG/PXJ1O6DeE6K9zYD67?=
 =?us-ascii?Q?3rMuzpuP8ybaE1vnpcv3VOw5iuYh6QFV8MxeZTS78rauxUQZpx3dXGkUmj+i?=
 =?us-ascii?Q?m/Xk6KdiAVYU3KG0a5kB+kRgYv6RatkVbZ33rrFEnkJDHwRIbBcfB2OV/pdj?=
 =?us-ascii?Q?cV0zaN7736l/c2mVQIVg/6CoRGdZRvHuvkEolobFRwbxC0PdsxwfQRclIbsY?=
 =?us-ascii?Q?/swbOteQj+A4Jc52sURfGINUtVW/F8c3OwC2tQ/nyttYsK91shQiJwOjEyGq?=
 =?us-ascii?Q?EbvNKpnyY96VVHw00WyoVTeO5owbw7ZS+vycd3N/KWIvbO9Rv8XV7FhsJ4kt?=
 =?us-ascii?Q?9swNI79c848AO1SdotRpJBkLZC4o0r2uTpZOfTQlcPzbDvfpmh2IUD6nFhYW?=
 =?us-ascii?Q?7neH1v6gVFl4BUijo1/d/fxGQm8wHWVVVKUWZhxVAEOoS9Z/ITUtWH8lbAZl?=
 =?us-ascii?Q?aHp1M+4i4uSznx53ebZWe86sku5Va+qgmDSOq0kliKk8Ly/asfqw2jP/zNBn?=
 =?us-ascii?Q?gBUfBj9Eu88fGTIP6rF/2duMA84tT/I85cj8ds+IPEim6Nk9qwo3B0nf6Y9M?=
 =?us-ascii?Q?D6OTosYnQZyW3igh3wTOZeQJFv3f6v1dA/6LCTZ30hWYQLSMywtoSc+glptV?=
 =?us-ascii?Q?2ZYVMmInFYB0hiWINg6sZjDFI9PHQ/JqSsrjF+QveQeXss8zXpfvVkqivs+X?=
 =?us-ascii?Q?ogcLGqPuS+WrtwtCjB/duk+qqHj3w2eWqUSKWW2Ob7WSEtkHDKJukoGA7Ktt?=
 =?us-ascii?Q?NPqC+vzPPymmjCesK7DvhXwPuK3R2UviovkqLwKhapsyzZhI9YSSDnBjXiZT?=
 =?us-ascii?Q?DeVVHmTi8+kjtYsqJIRMxO9nhm7yhiudjnG9StmNTXYSva8BHL94IuMNoiHI?=
 =?us-ascii?Q?iFMNksoyW6BqX5qC1+3zujFKwra9ty8gxJWrvrPDh2owPJhmCbFN0MOb59p/?=
 =?us-ascii?Q?u2m4xDWVV/7cb292PXfd8SjQmpx1SrPnzHqXwBJGtEL0783wsXRngCUCzLV7?=
 =?us-ascii?Q?99kE1vGs+Z/93IrK1aWOfrz8OFSj1rxvHHhgsbD75snGixpArrbaWd/e4HO0?=
 =?us-ascii?Q?JiCsx6vb5Rxii+LNcN/D1oDDGPDn/0RWz2zv/OMQXcXeW1HOYCHua5LnjEh0?=
 =?us-ascii?Q?/XF5PF9I2JD70oFXYm6j4sP+Z+tqZ0o/kyItpqXTC6xtMEmlaZQ0jtfRHEkP?=
 =?us-ascii?Q?09zXccC5gD7tvbdfttMSKZRvEpFA2ggH6msBqk8bM4dfpBp9wJinFwOx5t7t?=
 =?us-ascii?Q?E/yquaQRgC7bx7p/7jqwwT3qP7cRFbg3XB2lmpUG0lj/Z9xHZVV03hsssevn?=
 =?us-ascii?Q?nI6a97XepjSZMnCgk5aHqh8TPKma/QGqZmEffXjzL3lZdPz0USg6fNdrVxQd?=
 =?us-ascii?Q?oL9+wWgFJJogqOT6IyxB4dNOe1GCSOE=3D?=
X-Exchange-RoutingPolicyChecked: 
	beO9OuijfsFhne5xmICJmxG5y6g+JunExT1iqDkXyDHGMyyJ0l7qqTf4ca3BZGguj0meckRAxOBxnsUjVKvCMOJ67boKfN6n7wwnABFydU/hElzzTen2e1vyJVq1mowJxPIx9AItx7Ky5YppvnOwg64YlEVDsvr7JGVW4fPHzYmije6c8ALZngxSdwmEJCIfJObfktSGKicisL6/xx2/i2PY9Ch3ZVmyu9TPz/AsGgiJDWTjQMXlBFTNzaFjBuMAp81lX02RPAqLOz/KgFSb0XVayhd5GePOISIHM+3J4rsqwG00C7V92hM+c+N4GJ15q6C6AGrpJXHrBUALBIvZMA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d028995-b33e-4a7f-3175-08de89a539b3
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 12:59:46.5597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 13FPYVq56Ja+ws0JWOeGMO2BwXAxh4LGWinxwq3PWQRJoXcXxmASlIXN9RLq/7hBnkSShHHSyPfKGWToKnUay6qUPO1Avgb1v56Vk5oXmCY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7297
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEwMyBTYWx0ZWRfX6Po5aVMavaZu
 6thLvVohETAiCoLa+4NUiBJ26Wr2NUChkV8Ou3K2XmtPVP9B05nnGQXYYRPLYgoyOHbsw8sV0NP
 XH72J6eBdLUUG0n1/BgJEXQarugnSiyGG2ZJt37St7/hGYl6FH2Ojg/lbcgBxLcNxRZIUD8fkNn
 oxkD942coLSRsh1DinbSO7PZ/+iE1o0K8d7+t6D28r1y2saRkIA6NQCJKWXEhdzOf3weHOO11D7
 iS9M/I+sPHvm+fslpY4bGcxs9PdY3j5vuzeQTHooyNHGA9diM+0dxSfu8x4uldkbJhZHnY68X33
 KLrKnvcTIEWlsP0rTIvn9TBRgJ9XDuQaTDCuu/O8MoZdJatcguvdyWXElXeT0Y5/sx/321rHONl
 UkoDX5Yfrk/NgPtyE0f3PeXsjmt5bI2n7qUnz7mQQR3SFrhjTQDXjW7J5iw2dqOyI6gjY/19flO
 +BENtXgYYxC4cb0KIhQ==
X-Authority-Analysis: v=2.4 cv=Q5vfIo2a c=1 sm=1 tr=0 ts=69c28ac6 cx=c_pps
 a=vEsArsaSdKs0mJrCYyxDvw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=O24Aq5uEAAAA:8
 a=t7CeM3EgAAAA:8 a=zRr0LGfZ5qhMSheOc08A:9 a=SYBONWESK5muIIdMMRMZ:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 8rASeQ8Hccow78uD5I6Ej3UKCiBwJBWO
X-Proofpoint-GUID: 8rASeQ8Hccow78uD5I6Ej3UKCiBwJBWO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603240103
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 12:59:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125563

From: Zhang Peng <peng.zhang1.cn@windriver.com>

ChangeLog:
https://gitlab.xfce.org/xfce/xfce4-power-manager/-/blob/xfce4-power-manager-4.21.1/NEWS?ref_type=tags

Add patch to fix absolute buildpath in generated enum files.

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 ...splay-full-path-in-generated-headers.patch | 36 +++++++++++++++++++
 ....20.0.bb => xfce4-power-manager_4.21.1.bb} | 13 ++++---
 2 files changed, 42 insertions(+), 7 deletions(-)
 create mode 100644 meta-xfce/recipes-xfce/xfce4-power-manager/files/0001-build-Do-not-display-full-path-in-generated-headers.patch
 rename meta-xfce/recipes-xfce/xfce4-power-manager/{xfce4-power-manager_4.20.0.bb => xfce4-power-manager_4.21.1.bb} (77%)

diff --git a/meta-xfce/recipes-xfce/xfce4-power-manager/files/0001-build-Do-not-display-full-path-in-generated-headers.patch b/meta-xfce/recipes-xfce/xfce4-power-manager/files/0001-build-Do-not-display-full-path-in-generated-headers.patch
new file mode 100644
index 0000000000..0d3457e404
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfce4-power-manager/files/0001-build-Do-not-display-full-path-in-generated-headers.patch
@@ -0,0 +1,36 @@
+From 3f69abae74f4c0ad41c8fa2886148db834ddb9f1 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ga=C3=ABl=20Bonithon?= <gael@xfce.org>
+Date: Mon, 16 Mar 2026 16:46:52 +0100
+Subject: [PATCH] build: Do not display full path in generated headers
+
+Upstream-Status: Backport [https://gitlab.xfce.org/xfce/xfce4-power-manager/-/commit/3f69abae74f4c0ad41c8fa2886148db834ddb9f1]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ common/meson.build | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/common/meson.build b/common/meson.build
+index 7f71309f..cdae226f 100644
+--- a/common/meson.build
++++ b/common/meson.build
+@@ -37,7 +37,7 @@ common_sources += gnome.mkenums(
+   install_header: false,
+   sources: 'xfpm-enum-glib.h',
+   fhead: '#ifndef _XFPM_ENUM_TYPES_H\n#define _XFPM_ENUM_TYPES_H\n#include <glib-object.h>\nG_BEGIN_DECLS\n',
+-  fprod: '/* enumerations from "@filename@" */\n',
++  fprod: '/* enumerations from "@basename@" */\n',
+   vhead: 'GType @enum_name@_get_type (void);\n#define XFPM_TYPE_@ENUMSHORT@ (@enum_name@_get_type())\n',
+   ftail: 'G_END_DECLS\n\n#endif /* _XFPM_ENUM_TYPES_H__ */',
+ )
+@@ -46,7 +46,7 @@ common_sources += gnome.mkenums(
+   install_header: false,
+   sources: 'xfpm-enum-glib.h',
+   fhead: '#include "xfpm-enum-types.h"\n#include "xfpm-enum-glib.h"\n\n',
+-  fprod: '\n/* enumerations from "@filename@" */\n',
++  fprod: '\n/* enumerations from "@basename@" */\n',
+   vhead: 'GType\n@enum_name@_get_type (void)\n{\n\tstatic GType type = 0;\n\tif (type == 0) {\n\tstatic const G@Type@Value values[] = {',
+   vprod: '\t{ @VALUENAME@, "@VALUENAME@", "@valuenick@" },',
+   vtail: '\t{ 0, NULL, NULL }\n\t};\n\ttype = g_@type@_register_static ("@EnumName@", values);\n  }\n\treturn type;\n}\n',
+--
+2.34.1
diff --git a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.20.0.bb b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.21.1.bb
similarity index 77%
rename from meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.20.0.bb
rename to meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.21.1.bb
index c6eed849be..65b8f84e27 100644
--- a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.20.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.21.1.bb
@@ -11,18 +11,17 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 DEPENDS += "libnotify libxrandr virtual/libx11 libxext xfce4-panel upower libxscrnsaver"
 
-SRC_URI[sha256sum] = "971391cef63352833bdd92df28957392e17e1f2b3d486c0f57294fd204d6ed29"
+XFCE_COMPRESS_TYPE = "xz"
+XFCEBASEBUILDCLASS = "meson"
 
-EXTRA_OECONF = " \
-    GDBUS_CODEGEN=${STAGING_BINDIR_NATIVE}/gdbus-codegen \
-    --enable-panel-plugins \
-"
+SRC_URI += "file://0001-build-Do-not-display-full-path-in-generated-headers.patch"
+SRC_URI[sha256sum] = "bb89be7b1be431b29e765e2c632e98fb20a688e495e4ef18495bd70c1524767a"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'polkit', d)} \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)} \
                    "
-PACKAGECONFIG[polkit] = "--enable-polkit, --disable-polkit, polkit"
-PACKAGECONFIG[wayland] = "--enable-wayland, --disable-wayland, wayland-native"
+PACKAGECONFIG[polkit] = "-Dpolkit=enabled,-Dpolkit=disabled,polkit"
+PACKAGECONFIG[wayland] = "-Dwayland=enabled,-Dwayland=disabled,wayland-native"
 
 PACKAGES += "xfce4-powermanager-plugin"
 
-- 
2.34.1


