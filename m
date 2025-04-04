Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF151C36010
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 08:18:41 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.122])
 by mx.groups.io with SMTP id smtpd.web10.6510.1743754714572896958
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Apr 2025 01:18:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=E8s1t17K;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.130.122, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eFMBXsAM+5nf6gwz7x2Yzex497bJTZ8NezIZ8lrS/WZW9QZsj/rDpfCj9pO1ezoqET0yene5ASIc9hBztMEBxPB+DWhRfX384sIiMeevnQkgE+lZrn1wyVQFXh5v47IxmrG8MCqPIgI5UDyoVzAGHYOogfw3fG4NgL7Hsc2WW4wpOtjsKoxIX1cD0LLEI4qDQ4YOuyDytMQmC2qlP/9YdWXjwvcFyIUQolfkA5tg75OMeMI4bx4aZrND96FYlyMCe8jg2asyhYHUUybqulygIj+BYacLBqHLO3FWLx0Z015o+pAO4L1CnIZg0jYbp+qVCvmTLyt80MIM978/uRxx2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fbXd7HV3uIUn9G9r0LtOzGwmf279CfNQPDrGj/2ezoc=;
 b=owRNzZLfW2AcIJJQjQm9esEO7TQwqllFJkJBqXnmkp6QNluUvBv6/nhD1RdSmzmQfVf5r9e5kukYQfiKQLNp+LTGSvldyj8+pukvpuJ7+xNRx6R/mz29DVHFUOe8uDsM+K6RqnhRI/qdiZMbXoOP1TTUZQFbdw5qwWJxGl4jd+fWJw7R4XpV4l3O5MxZ3m1SrEO3NknrXe2kPPmnEp0+F9tzbwJGGcnoE4Avb6vfz81NNktdDi9c5hXrNclLN5AMJ3hwvl6ASO/470UHtXo/LzBeNBGAA5g2ZcYoCdTbm4o5tTQfV0YanMgbZZE+0cHDHHCovJnFvPXPtqLA3jZtVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fbXd7HV3uIUn9G9r0LtOzGwmf279CfNQPDrGj/2ezoc=;
 b=E8s1t17K8Vixsu/3aKW3tjxpVIGd7DOLZBW0GmvzPgLsnVzyupkg8FOoLSfMlxw2bzE/m2kmGvhEFRduR7oUx//fjWVX9pznLrshaIWGrKBhpuR/ie2TL9ZoPSpI0uin/ctD88p+o5ww/RGwixB+gC1N9dmcfNbBmb9AdDfqfBrwPvoG8220LKX4mYRU1cHwfulvxTef6aFtwkn11srMeXjCMcHhqXcmOqlvz/3d5Cm0lYJ9/xF1aPvszPbCX4WtFwW2z8Tj1JG4KmjhdoeVLxZbSEuhiiF+U9hj7YGI5u07fzFfAOVtke2aN1wlpysSp+0m5ZAjsh0ZSjsOTu9yCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PAXPR06MB7471.eurprd06.prod.outlook.com (2603:10a6:102:151::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Fri, 4 Apr
 2025 08:18:33 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%3]) with mapi id 15.20.8534.048; Fri, 4 Apr 2025
 08:18:33 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][PATCH v2 9/9] dbus-broker: Declare runtime conflict with dbus
Date: Fri,  4 Apr 2025 08:18:05 +0000
Message-ID: <20250404081805.663425-9-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250404081805.663425-1-niko.mauno@vaisala.com>
References: <20250404081805.663425-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GVYP280CA0031.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:f9::9) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PAXPR06MB7471:EE_
X-MS-Office365-Filtering-Correlation-Id: c4537cb6-aa1b-41f5-facc-08dd73514a65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?fh6YyA8vGEVRtVV6Ne1x2Ps/Uu7S1rozVIAkCPXSKrx6nlDcw3X0qdqe1tCE?=
 =?us-ascii?Q?bnYtClrPa57kUXpNBX20x6rMJLu2BI5qJwUtzKVBuH62L0/N4ZGJ9qB9cPbx?=
 =?us-ascii?Q?lSCBK8FUe9xkN+AIEp0QeCFoLS9wjHk7P/qKNk0uEYNKMM/moYlVMJL4MwDU?=
 =?us-ascii?Q?sYF36oiDLbBpEFxNlY0zxSymO4RPw1/De3X/9VHmcO3AbV8tRGOAK5o80vrR?=
 =?us-ascii?Q?2p+WJmZ2lQjpx6JykTywlzl6jb3m+TNZZalfHIPuBVYkxJ2cys4OHCTwfLKJ?=
 =?us-ascii?Q?pMy6WIwzUxvdd5X2Uo1Q0kRORTM/ITB6rX7ik6V6LMJkw6aOJ3yMiYAq/lpN?=
 =?us-ascii?Q?khdBTLVY/ncz/vSt/0Hvy6MSsqamvQtrhOfJGw/7tADm+yRg7A9oVA2kexV9?=
 =?us-ascii?Q?EP+Oe/6VudRSr9cO8ry9gCwKZmGN8ls0qCe8jl/nsB+COkC0XzZHGOjO5PiJ?=
 =?us-ascii?Q?WOec2S76drPh5XDQ6ThbUhg6LigmcS0kyPncvr1ydgSbWwGvYaPLiuKWvquX?=
 =?us-ascii?Q?v0gI94XVGL/g6cYzgymWsOU9GA8YEAJw8KtaOTcDiq3TeQHwxhcGJX/hT2nW?=
 =?us-ascii?Q?IwxdYAwPsF+bZO25EMgVCupSo/H0enjmlNFtk+fJ5yXW2iWMKGRcAAeP+CC2?=
 =?us-ascii?Q?NOzjxEqVKco9/9Q3+SWP+EQtLqO1ISnIOTAqHUU3HOgQic4wMNJIXtbLEMbh?=
 =?us-ascii?Q?+G/TnsXyqYu/is5gm8anuHzOg5VAiCJyl8hM7zklRKCOob5FxfKL0H42Fq6C?=
 =?us-ascii?Q?OVbHjm7nkixktZUB2irl02vKCRrSRt75phjPDA1uHnXxKJNw0RmFFbDAKsQV?=
 =?us-ascii?Q?/FDvUd5bVM66GqBx9QIrk+298XyTs8bKUqdt7sfG8T5MBHE7qfXb4SUGOIOr?=
 =?us-ascii?Q?bpAqAmoErKS3fvT2WR+120CFwdl7rH+1OvXlYCrGBDulwsax39Sly/iE8X4q?=
 =?us-ascii?Q?LK9JASSb7G/nGwjnHWfM7vJIyIPr9c/dtinv1uTqA6kDB1oScr4p3EHjF2Cp?=
 =?us-ascii?Q?DwJgBsHuvUYuC8m4xhd24+00frrPLlUpHzPWBhMvl1zo57s0pGw973FaRTy8?=
 =?us-ascii?Q?uqODbjEuwa+g4iy4CdYq8VkyOlbBaW0T+xvvxU53xtb5OZkTw1Lq6gEWqydT?=
 =?us-ascii?Q?1P4kX5NcnUHVWb6CNudgqwIcIZQ5Qdr5UTVM93hirHwYI+QMMJKFeMaF10Th?=
 =?us-ascii?Q?3fTXKK5WZ/hAev4ecfkRslWMAd/1y2/xXjRQ4FL/x8US5gzFGaergk5IyZKE?=
 =?us-ascii?Q?kGl3GEXWN1vKUjhQt0Xd+ZJKSyn2HETtk79MZSCs/ZY8mNY2cimkElTlaI64?=
 =?us-ascii?Q?XhgfU4hMC/qW60PSwTNFULErkRuS2bP4NMipWPdEvdXoKTDWboeNoWA//1Oa?=
 =?us-ascii?Q?kRWeq/QNaivcGeQEtlbLlgxJJCcN2y8wafUlvXO+ydEyOCMbnRat2uc6eyWC?=
 =?us-ascii?Q?jWHrjXRzqK0fuMCHRijk31OhKd9YnYaMPxalme9N5cbA71XcmluJlA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mxRKa5m3WzKUDE8ZxscM3WeqZPLPk2jkEFD+gfhFDvxV+hpJBX9QOWZoK5B2?=
 =?us-ascii?Q?Rr32DC9lXuSi8YVC7IGAq4z2mtPEYcn/mshAf3K0YRlPwR/vnEJaX4HlFMm3?=
 =?us-ascii?Q?n2eEOJsHYVJlmmXkESI7IM9n6NsvH2tU5M8ARfHNov5GXaUPLjESPCvyGXpQ?=
 =?us-ascii?Q?y21mAVc5uafjGYhnNXDirnV//pGBSajS7Pi2DzyhfnEK6Hfr3MYNvHz24g/k?=
 =?us-ascii?Q?xmqG/KVrMs+Ns5Xu2MfLStaKXl4j7P+w+e17v1PwQY/2DAc5bBPJUV05g7FK?=
 =?us-ascii?Q?Ou2iqJH0pP2tbm573gdObugVhKf4qVRGPk9hhYxxx0BFnToNNe2TV/iR/oAv?=
 =?us-ascii?Q?voPHuM5AqLC4gxPQAg8kE05heHZwUNE9l8/BNdsA3C2pFSMI4gDJXsOI/Shu?=
 =?us-ascii?Q?SEOqbhY5wdkru5uHtMcbdEiG+rN0qLmCOOinyvU1Xw89jKXwmK9GMCMXDxh9?=
 =?us-ascii?Q?2maunSUoqVsVjcLC6aCPVP1QHjpaxleb+U/LdReJGv7WDyz6SGP6TCzvDEbK?=
 =?us-ascii?Q?qrS+pS/Sjt6AZcnHcVftylUUxDKYT5zrsrFDesn/3Owxa9GahPGvcgajQURh?=
 =?us-ascii?Q?a4Ib4iE07H7BQIt0gSUDFFWn41Pu0NNscyRdYvQ/2O+h+Z79Isf8loIU0Y5D?=
 =?us-ascii?Q?SvMt4s6BwewDg0GUT/2GgNwT6UN36wbu1syoCBOGV+VeFJjVBEbAWMheWH9w?=
 =?us-ascii?Q?SCyVYqdWXreiJWpYCmCTMUTMrLmKHHnnNX6h9VgfFZgOjdQtmJmgPCNPfBX3?=
 =?us-ascii?Q?+BqhU/a/1bgXKO378sORBE/Avri8j6Z5pBOcnBLmp8bDi7zLXnvfVQvS/2Nj?=
 =?us-ascii?Q?LC311dCogwula5YA+nj0+qk8y3xegFSiYkVRj2Rlw2S1QxDYBriBlVmtQu9j?=
 =?us-ascii?Q?Dx5HU7HqyixBkgXpIPK7Y1606qTTSO9p+2KFo8I5vlbPfJ8yFw0xQZ14LBdL?=
 =?us-ascii?Q?+3EvV3mSfuKljsae1Pi1UvYm1jhYHgUtf1sQe+dQyyt0vnJtLQOK37NYZfaG?=
 =?us-ascii?Q?7eqHsAhi1onvfLddLyqXCfXaQ8t5HDo5nxYa2plkQvz9Rzp+DYvb2/VvnXBq?=
 =?us-ascii?Q?kAwNVrK6IonvVZnO6TrqYt4JBDdMyecTHvCehyl/8dCWB9ZRqkmyUK1iSxYy?=
 =?us-ascii?Q?ecMQMwD/OyOOyfW6cARqvMJoIz0yb0GenqHU3670pP8E4VoZeI17jbV7nLZy?=
 =?us-ascii?Q?5k+C84E1z2azuJo1vtvfboy4f+MdOyEEq22EZL211zXM0ba9TCdcyVM9APFn?=
 =?us-ascii?Q?re2alHf/bqLByUVeKmP8G3U9O1If3IduTIdqg7SUlcMSzKKNoHSiTmog3/rD?=
 =?us-ascii?Q?Bk2j0rK3rSJiCd6nfq+qQkuDoPrkOoDLemYSYzP+vxEX03WqjHY7wWlf+Tqr?=
 =?us-ascii?Q?arVCTbqTAzyu/Cej8iA38o5uoQAJrNsd0o3eG2RFTne1Gb+U0Pf6hGJ9qUSU?=
 =?us-ascii?Q?vz7pg89We/TUoi4bTzMaPhpSo+ylx6eghCkLdw+SmwE0dZo5Kn4nl9te/hK3?=
 =?us-ascii?Q?uyZqaBn4n8Kwzyb5K5/Oj9GSnCWPNusOxuDgHg0GOm5lGg0v9yyXfZ6NIUvN?=
 =?us-ascii?Q?w2z5oqYM8mJ1YgVvRfYNqR4tJrQvy2Eto439CbkTNjZgQxc+DIg/qYxI4ODu?=
 =?us-ascii?Q?BQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4537cb6-aa1b-41f5-facc-08dd73514a65
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 08:18:33.5651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PVfVu4N+j3FcbkD723HWWmBMSOURjzH0CDsy96T9DxSt8ATuX3kIXnkBWwDi3dxyfPQJSpVtYX8LYfBLfCEdew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB7471
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Apr 2025 08:18:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116569

The user should now be able to choose the preferred runtime D-Bus
implementation with VIRTUAL-RUNTIME_dbus variable. In order to avoid
situation where both Freedesktop.org's dbus and dbus-broker are pulled
into the same root filesystem, add conflict declaration which will help
to detect the problem already during the Yocto build.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-oe/recipes-core/dbus/dbus-broker_36.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-core/dbus/dbus-broker_36.bb b/meta-oe/recipes-=
core/dbus/dbus-broker_36.bb
index 5b4915f968..8c8f2d2469 100644
--- a/meta-oe/recipes-core/dbus/dbus-broker_36.bb
+++ b/meta-oe/recipes-core/dbus/dbus-broker_36.bb
@@ -30,6 +30,7 @@ do_install:append() {
     ln -s ${systemd_user_unitdir}/dbus-broker.service ${D}${sysconfdir}/sy=
stemd/user/dbus.service
 }
=20
+RCONFLICTS:${PN} =3D "dbus"
 RDEPENDS:${PN} +=3D "dbus-common"
=20
 FILES:${PN} +=3D "${nonarch_libdir}/systemd/catalog"
--=20
2.39.5


