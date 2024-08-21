Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 357C4C5321D
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 15:30:25 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.138])
 by mx.groups.io with SMTP id smtpd.web10.22803.1724254222279832045
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Aug 2024 08:30:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=Xo7S+vu8;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.103.138, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DeT3JRlzOoETE5vzUoL+nyp0vXoXTjY5sv7qM526wAm+eglMSIDIaxwIJAoP85GWrPnrcA/H+gX9ytTsVre8J+YdXLlsPU3L9yBLT3+6Rhh3NmN29371ek/FysruMIfwVlCBGgFTASPFr4a+rPWcWlYltjZVw2/uirnwXrPp7MqKgBdyi50S4SXpUCsYh09PVfLYQVbQnzchrCE+MbzH1U/gBA4WfaLcP7j7meefo06bx3/FkVN7+dJL3lquyolMgoihs9XS9Hevz3aV368/1Azjg4flFCyhPe47Vulydoo/KJ3G00pozK/VaYEaN8KVjvZvSLDWrCRHgO+tQiN2Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RBjWsW4E2+XlOoFuayCu03LtrE01jYVAQwkUMskDBqU=;
 b=vtApkRYle+afTRQhlLU3tvhkymt2lxCI9sjityKAexgbUbThhG1TY4ZC30UB5X4F1n8x3r6gR0vyJKsOgYwhARFR3LSHcKXXv2Xg6HxGqLSVUTVk24V0llE2b64Bci78LLdhfBhRwithwmD01pijcoou4ZcNgcuKLkMgsZPzSDGQ++3P2VdOdaQOuwJsoPL85ujxob4v7nmJSzTurv5vWt9NrS8SOA3qRLMJ/KUOAd+kBbHUypnEl8yVF5GUXQ3Geyn5relV7nnXdWppa6TFB5+V6+zgKmUqrQ0SbrMpfIIqsH5wgpv0bt9i4P5KNGXFIacVMfqVRH0YRHK30J14Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RBjWsW4E2+XlOoFuayCu03LtrE01jYVAQwkUMskDBqU=;
 b=Xo7S+vu8uMKVSqmy40hQvUOoqZRq8QSUxDKXlWz3jV/Liu4R9aedLkRbopor5TjjBzuIdw3qMv6/5AMMxQubifpsSxRIF46e8qyTyNFFi6eIlc5n5yWKpq7NEqf0wv6CXsEbHbi8/fXEfj8k7+RMp+teUGWlbqUh+OBaz7e6ITOKQnIxY6W8M8Art5ps6pqpnopFvFZiyhqmkHEqn2aSS8Vg07/XG7kxWDX8AJgvodBRO30ZwG8RqjvxtVwMokjJj73mUoNji+BfXEHiWnt+t9VRa2/6yncyth3qpHNika5i3eenvP9ZwceWJSbWMzvBD92KpVJr6WWAFFN9M8Mt+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by DB9PR06MB8140.eurprd06.prod.outlook.com (2603:10a6:10:296::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 21 Aug
 2024 15:30:20 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7897.014; Wed, 21 Aug 2024
 15:30:19 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][PATCH 4/5] opensc: Fix LICENSE declaration
Date: Wed, 21 Aug 2024 15:29:45 +0000
Message-ID: <20240821152946.650107-4-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240821152946.650107-1-niko.mauno@vaisala.com>
References: <20240821152946.650107-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GVX0EPF00011B55.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:8:0:19) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|DB9PR06MB8140:EE_
X-MS-Office365-Filtering-Correlation-Id: cf4596e9-0cae-4ced-041a-08dcc1f62a6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?YZMLcLD6m93sQ0vVPkNyLn/fZjGe7g2mNhvBWLVl1hlDyA65lUfTEIQCqEDJ?=
 =?us-ascii?Q?AykcDOFc20GbAiIWfGx+li3KSFKNLMPcyoYHwFrKwyuUN6fOqb0MxoXEt8Yb?=
 =?us-ascii?Q?tnFG0dyQSKfUuRNsmnt7dZ+rR3Zf7JC05nNuixOheAeIO3vl2EWO3Zbr9HE2?=
 =?us-ascii?Q?tWz51iGs6oEPnj9VPlayiOXd5MPvik+wuoBQXLaXG+ZGp4/VUuHWpKf2bFRs?=
 =?us-ascii?Q?5sKDJluaBuQ0sXaP+JiZEaiz9mEdt29V5NSOcr/SL6SsSCyYu2X2x5WYZ8GA?=
 =?us-ascii?Q?5eMcrJIfH5x/p5i8bz/cROWSJ2R9v4x5MAnGEOS2DgzroN6n18kYz83dG66S?=
 =?us-ascii?Q?GDb1O7tb5ot0Cz+H38K9ralvmTYdo/aHxvqRRuwewkq4uU7w1yhQCsx/gQwQ?=
 =?us-ascii?Q?J2NiVSTOpzGyXvKPbIYNZ2HS7jEiUY+iGWv/tAKoisA0zgwGtzfYEO6JW6K6?=
 =?us-ascii?Q?jQNFgvo57eowiZAjv4kWo5lzzA1ZoDKg1hKxi5YtFrf424pqlGnlz/Tk0cdx?=
 =?us-ascii?Q?6Ho+zrQxLoEUq4WW+QC3quw66JIVE3zMnV3JAUvN/NQkVJ2CQDTOpNUGychU?=
 =?us-ascii?Q?lL16Qh51kSdVSGn0S9i2nwSLQ/caFmXcGWf5ZJAgwLwEfWMvYmIH8RWHf8sf?=
 =?us-ascii?Q?JnZnYRlGdflBSgIrfKOUD274tdttkk8HdhDaqSYrb2Lt236F+vef7WmW+Cqi?=
 =?us-ascii?Q?hq9cfytP/FDNYDcLmfH7sEoexqbTiX2Ph6vrG48vcxu8QNalX+vsTJtb/xBZ?=
 =?us-ascii?Q?DU8wzD/FHu9RhIJ0qWiozKdPoSDDMB5ifEitVKEoOTxwDOMrSEbblnEylLhU?=
 =?us-ascii?Q?2wfsG3m34WAPOPyhjHHIibJnnn14aSpiSa1IISy2uudMmz/sjxA+0P0wY17l?=
 =?us-ascii?Q?UhsIi4hvppMZeVr9Yy40r3AO4y9vowEDf/MZKCU/nN5FtggiJDYyGlCpTYsa?=
 =?us-ascii?Q?uMPPMQQTRIAsG2BUvIkH3UskpKiXL+dgFJQZQq+SmPdT621dhUFdTVpdDrFM?=
 =?us-ascii?Q?uqXD32CmvF/HSpR69zFJfnPAIHrhJ+WV95VHDA4afWgYxud8duWfad6Kxh8N?=
 =?us-ascii?Q?ap8RpkqQ0uh3oXIHmjr+ezspvujm6R+tFXlGa2bVMxCaXZxGDCF91u+Co4J0?=
 =?us-ascii?Q?FuhnyUQUgMwsrRicuhpYkPIbIxYtXX7lcc6Iv/Ks0/PZl8CwXu93hDUQA8mr?=
 =?us-ascii?Q?SJpFJwshkwbtkr5CNa6qbFGKt0odviOxnMvVGVW7XGFIiz34EWtQQJJU1V5m?=
 =?us-ascii?Q?IXdgQR0iGS7tY9zE4GzyqENJMNwPEYexB38xw6gpO/GmvvoKtaiPss9Df/Zf?=
 =?us-ascii?Q?8P64DNofj1RKThrifHeUXyaVS+oVPKbarf2qvbInzeyNr5iXAbpxdQnkXAzF?=
 =?us-ascii?Q?VhQNC5Y=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?L6UiLkCWki/w/0n/s8/CDgMD/0YCxOCoSuP0mrbHWLdlgc/WG3i4VVMGs7sF?=
 =?us-ascii?Q?boKyeL2Y91hYFmm3hZ3LpK7qMAUciF7e5ejTr0+kLLGXNQWUWSUjzjUNeumV?=
 =?us-ascii?Q?I3NRh7KmNAIhu5NdVA9JdtJpoecN95wEn5GCF2FjZMr/MTRbW3L7l895phZT?=
 =?us-ascii?Q?3WTZVkbVIVWaHWj4V7/6cu7h3pGgnK+JYbT1ZagnzkxMAzzUtCl/7GNr88eP?=
 =?us-ascii?Q?VZ548z/E0mxX6WZD8cgyMfX5GVCc44AVLvzdBo/huieiwZ6D9cyvyAqtpmKb?=
 =?us-ascii?Q?MyZRmg1wHLdiEApUIswWxBgZXNNKr16jr8PWCgcJjGWNZ44j6eIjO75dW6xN?=
 =?us-ascii?Q?RvmRY0AQVd/xD/sBVk4ry5kmD3GsxjLWFq4Y0WktXgXNuZABaXAXN4qGBAv2?=
 =?us-ascii?Q?RIXTZdlP1PC/soX/L24ExkSiJtNhdgm5QftGXbibfV/3VElha/LOYuDVsYPt?=
 =?us-ascii?Q?7TLC4luMWSD7lkbhAVDpsJhrXz/DwTK7lEabtjdYTCCk/iZ77bNcD2a9CdKX?=
 =?us-ascii?Q?cs3HkhsIJ1o1hUQaXp2boDG03VEiEHHeO2t0xrKCguh+9XGTeX1mqYD3zjEq?=
 =?us-ascii?Q?vlfJwzEqUEMAE+NKpZ7+442dJSeXDMBjpBCUG8aWcmV4LaV+XJS3ylbZoptB?=
 =?us-ascii?Q?pe4XxDlcSKXKRMc9edQ/hbemQilEIh9XMrthUYvX6rLGkeND8OobkrAJ6XX7?=
 =?us-ascii?Q?ShMDqW8rUmdvRwJ1lw1aYnSeqDrdk3qfJ0Z4EooRT/dSDwcAxSYEuB/ZuSBg?=
 =?us-ascii?Q?Jh2xf1Bt3bchwGXhkaLBCcQlLjWskhqr8k+mSMcwk2sWlGXMPtdsDOp5Y8ut?=
 =?us-ascii?Q?qmGGAvRzK/7SNu5V18k0RcvRKli+v5pCWVRBaA5cKXrVr/K+cxOxoa134t1m?=
 =?us-ascii?Q?4p49nDSP35L01FsTR1WL9GjaFF7XNmW1V2XGTqSC6lv2T+10B15FBpOUrm72?=
 =?us-ascii?Q?NPRpnQlwhu7xekdv8FxwCFoeTdy3h/75pqaJ7Oe7w7rk5ElQb1M2+3G6WS9U?=
 =?us-ascii?Q?uPLP1VzTO8RrQMfKAcZjzEiQp2AW4IdUIJMKBNz2WGnIxsM6GykbJnBs7qyB?=
 =?us-ascii?Q?IxjaQN1TDj2rVeUbhC6RJJ7YYFQuFlw/R+JtWmVUoUcJ80HQmRm7uXDmbIt8?=
 =?us-ascii?Q?vaaFjKzRFHDDCt61GofAV62aRkMB0QW+A7rRogGq1S8HecijwNY+v6YkLoyq?=
 =?us-ascii?Q?1x0XWwuq8tOs9tBtbjkfONJ5kyYr962fLQpObHf8wl629BfP3k0kVAmU06fV?=
 =?us-ascii?Q?j4qYDiJ2Pu8zkL4Ar7nYF0sOymR/exMkAp/pmndEVB19WYrRZlW5sqjyqB4r?=
 =?us-ascii?Q?SFn06Q0hXu0dsVLGMxUksxKlffyB10kpLGkw30WcjfEGbod6Sn+PiK8pno1E?=
 =?us-ascii?Q?2CaD4dVsqtsLivuxd/ny9KbGSfxouvdEhpsdTJRhEWwLyWyT1v61WAopqpQ+?=
 =?us-ascii?Q?64HzfYZkMequO1EBCENWHmfQa6enQPR2+iNuRtFD/lJgtDwRx5XT1/qioxHF?=
 =?us-ascii?Q?Y+c0Kcu/3x/vhvSmxUoQ/KanV/TmjcBFVqN6BkOWCEw4SU51egJS/zHZJHp5?=
 =?us-ascii?Q?oA0GdT9kYlk/a98M41rPjhxQV1c1xx7deVCc5Wi8w6qREVYMBTq8yfwbJ0Fh?=
 =?us-ascii?Q?zw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf4596e9-0cae-4ced-041a-08dcc1f62a6e
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 15:30:19.9122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a1A+NiEJ5BlH6HyBgVxe0Z/3vw5bm5rLrXxqFvTpSZ1VSxuuD9s88XgJ39E03r9jQ3u8RBgD85gUBlr9Ko9v0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB8140
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Aug 2024 15:30:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111888

According to https://github.com/OpenSC/OpenSC/wiki#license OpenSC is
licensed under LGPL-2.1 or later, which seems to be affirmed also by
the comments in the source code files, as well as the COPYING file.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-oe/recipes-support/opensc/opensc_0.25.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/opensc/opensc_0.25.1.bb b/meta-oe/reci=
pes-support/opensc/opensc_0.25.1.bb
index 40a8dc320..1a31cdbda 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.25.1.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.25.1.bb
@@ -8,7 +8,7 @@ eID cards have also been confirmed to work."
=20
 HOMEPAGE =3D "https://github.com/OpenSC/OpenSC/wiki"
 SECTION =3D "System Environment/Libraries"
-LICENSE =3D "LGPL-2.0-or-later"
+LICENSE =3D "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dcb8aedd3bced19bd8026d96a8b6876d=
7"
=20
 #v0.21.0
--=20
2.39.2


