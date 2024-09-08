Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97BA1ECE57C
	for <webhook@archiver.kernel.org>; Sun,  8 Sep 2024 17:12:27 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.98])
 by mx.groups.io with SMTP id smtpd.web10.34230.1725815545368516852
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Sep 2024 10:12:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=LBEiIt3A;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.22.98, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=glOFiDTYw7D/7yx8mNyS+5CxzlWxrqQ9JEqfbOHKU/APd1D68FM0WqNHABBOHifk4+JoUEnbBoUOu5vrMfZCl4X5tO7+klV4Sbvh1PNw6eGjDrBZ309IMhzRoh4dGCKR7iy0/akAGT6VK3AXEMi3rPffdHK4wrkHi81jkHq9p9cY+LXTE//Uc47XgyISB/i0Y0jdSRn3QA01WAngtLBGb742g16IjdAF35tgnp5w/rxSTGwYCXEhs8ajyeP1+uqOWLna2g0YXVUiBQ+050UqmphgNxlJTY4XlGyiLNAecc1X5/Bxoi4CfnlYssfJxTNRphHcCq4qwsFK6WkrZWwVTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dOala1SPcGT+VZYfI1bNJNy88qiRsGS0ZG+oGhsLdr8=;
 b=QHAKkHMviJK0P8pv9zkx4cULfXQbqIEf7QQlVUlrAhUnpaKflDz83CIW9JR+8Zubq4QUgHx5A35nvHDVZ79tEaQtNnDV80x7nlr/LjHQacI4dEmNeI73456PnpmmqmtCrRWujuh1N7XpvlEQJtUJ2/fySOdRxYjO780TsCGbFtepZIXBGK/Y435/l5v2+6nOTXlPozsoGGCh2k0LgotWQgT0AKmp9Nt9/WXb9vmJqvyt7QHtVdD9jRb2k1e3bIGa5pf0A3ooocAjxz1rORTuTVHhp7EQU72tnIOMjrvGg0XPo8f4kK5oGXYuzfVEHJuYi8eIVq3dX7XuFQTAISdDgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dOala1SPcGT+VZYfI1bNJNy88qiRsGS0ZG+oGhsLdr8=;
 b=LBEiIt3A/Hy0kuglLzvomo2p6Z20AwP5/+cogGdBaHkW+SmtXpFxFha5iB1dTkDpcZnlQ79aWYo7HGV/O5S+dcCdNYYlCEcO2zBoe31fgtQA4Xcx8nPmUXd2ttwyzNZLuxWwLYGN5O9CES2LeF/le76TFLV9JRiIT1mQMYc75zzB0RYUEVhNCWPDkAnVhv4zS3fX0+XhapBsV+2wlVz2p3YWPmZqY/Bg7/+SLPG43i8WqaqTRlibLx3F5QKL4UChGdg4+J8sLAHlYcwRPTpDsQQn7SqNYlUwrIbPAfSIMP5H0edMyEA4Zfvk8sLADex1xLamI3qJNqKeUkHvFDZnNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by GVXPR06MB9098.eurprd06.prod.outlook.com (2603:10a6:150:1b1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23; Sun, 8 Sep
 2024 17:12:21 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%4]) with mapi id 15.20.7939.022; Sun, 8 Sep 2024
 17:12:20 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: akuster808@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][kirkstone][PATCH 07/13] python3-pillow: Fix LICENSE and change SUMMARY to DESCRIPTION
Date: Sun,  8 Sep 2024 17:11:35 +0000
Message-ID: <20240908171141.99382-7-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240908171141.99382-1-niko.mauno@vaisala.com>
References: <20240908171141.99382-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF00002BA4.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:6:0:1b) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|GVXPR06MB9098:EE_
X-MS-Office365-Filtering-Correlation-Id: 94703f03-f1d2-4ecc-ee47-08dcd02965fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?7vNAme5I2CR9+OZQkum7gHMh6TcetRs53RdR+EkNQ0/f5WyqfCfpGiAcQdUE?=
 =?us-ascii?Q?1Qws5reoTjVryt5cN+6fqG+IIhe7jtsKJqnV7N0iZFKNvE007SDTQon3jaDi?=
 =?us-ascii?Q?FART7xUZ/n+Oj+po4H5Jy6s/QhN/McbzOeTrWQ7aBNIII+df4t5D1QfdN3XU?=
 =?us-ascii?Q?oDsdELMCuKZYbBwneN+iCYkxjMyq23MeGoZn87z2pDJrRLrDhrVZEReqK8zm?=
 =?us-ascii?Q?D3u7zEk1kwP5F4g7VHK447n8NEqkU35UF7+Ffy6nyoCQcDWac2uakkDPYfeh?=
 =?us-ascii?Q?g0LOgUpTMtA1vWUWX/TneQG6qq+LEBCGsd8i7UBIMfXfukawg6/vAHAgugoE?=
 =?us-ascii?Q?Rb3SQ5nW8BIUeWBzYfeo3JPv4clEqW2mmN9Zr0SqWr5Nm3NJCEcZyY/Q5Vfo?=
 =?us-ascii?Q?+opT5YasAlpNJtGdYPs4tGu4DDZKSKKqLIeY64I3fhBU5fGDlIQZNxro0LhM?=
 =?us-ascii?Q?kyr/dApWy5s5RJSvGYlwnmgGq38QnU9ZYasYHrnFw4FhvNWwfd6Z0xsekfSD?=
 =?us-ascii?Q?8OsV7GIadINzor9GkV0i+52VZxg/yU5g/PI8/a2Aj6iv3XWTbfxb7jKDqvgZ?=
 =?us-ascii?Q?ZG2GFXcKMy3vM3IN3yjLhvSbjrNvBrDQygKf6oSgJLE+o6ROyhRx8CPgY7G3?=
 =?us-ascii?Q?xY32K9cE48+jwuzEIMbMZbJ354Q6bln3SUx09ybHcpRgNBV5cHaxR8UUd5s0?=
 =?us-ascii?Q?VIodRhL/mnHOoszeo9w4nSofgF3RJAWpmENCbRBPF4zYW6I3vF9VOKfVktSB?=
 =?us-ascii?Q?fRm2VRKCeWLltmPMlreX8Gj8LAwo6J62HufhG4WWjbuq/iX4WJi6ALjP3hXx?=
 =?us-ascii?Q?BtfK+rgfT35/FVHsSm2kcq8cpvXs992Wn2/QmaYP2ld4CQtlKNoNRAT0GAAr?=
 =?us-ascii?Q?4hQwlgjfBUu0mE47ZYHMpY+hnm2iYBiBGnoO7jwvs3RXsspIdnDxqamTjrRe?=
 =?us-ascii?Q?W5XPOXdoskkKSFRBLJcyVsoZAF22FfipBx4zYN0Mu3aHWVY/aejeE6qdKBH5?=
 =?us-ascii?Q?b6tfewyOIcbQqxRO+weURvuc+KwNaUSiRARxpRC3VsNh16oFqNqaWKbs/OFa?=
 =?us-ascii?Q?kwp/e40pTW5+uQOhuAh/m4UpW5sN3PteVx+iSx+xI3SHU3psvL0R6KOKSdtr?=
 =?us-ascii?Q?D2MyOG1gPBHhuGZC10yTMakNNSURBdkLMP5p0xsW2Pp/7P4om6882QRJcHky?=
 =?us-ascii?Q?PRQB/sowa81P0d8asVeLyzqW0ju0NIQusQsPcm9zX/L6RsgOJnZhcJrCkPLE?=
 =?us-ascii?Q?CYj7DdHsPOfk6M8nsqMZ9UrJ6RGvGxe5YNpuvsT0lDwYqRWzdlU5EW0modL+?=
 =?us-ascii?Q?LrQ+xG2lklJXAZifYi9BD/89NMjn8f6/ymZaRTsBNdEL+g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?AYcA8BINtzwH+Bi+/4Z+g+f1maADjhesMPEJygF8HEjRKS2Pbq+SR08oR8VA?=
 =?us-ascii?Q?LLoqAg3YqfQpWNDx7+ov/LUQurO5xeZjhDmwH+vtzEoxuaYlnXroIyupRnel?=
 =?us-ascii?Q?Z7bjIxH7VptfC7vj+glJYji1ZCiNPU858HcjTIc7cTnCu3ZtsO+3EjAhFIqT?=
 =?us-ascii?Q?SsWLhZQt9eQGAno91Va50IHbyUr8LhJb7DSBmuiv6eofae44o1CcOMXDO56V?=
 =?us-ascii?Q?aCkz+xezDlgN3p2MT7JR4UuUjNpqToMZBM2brSjrb9vl/oC6BfFj8fVXOuWD?=
 =?us-ascii?Q?da/Osv9jGfRHAqh6Cbm8ldl49tXawVYBQJJxO2+ALO/y1grKy0il9B5oydih?=
 =?us-ascii?Q?NazzQVYVXIZGJSO/DBEt/X48srrTmhx5vEP9XD0awI38kKGsqn4xXFfrokJd?=
 =?us-ascii?Q?GbPwgxEruD/Qa4K28J4Y1fUMC2g1jcrImN4kBq8K+hiJDNhPvFBQgc6wRwOO?=
 =?us-ascii?Q?uCxOfxgLmBVHn/dQm0lOurLju1t9kgdZeOiMwRSXYQBtm0Od22NGOJVUvlqR?=
 =?us-ascii?Q?OuQNWR5NBxC+v12VAn2J0mMdD3AMM7BsDEAaI1mNozepk5HXM0ZBcS0Ig0bl?=
 =?us-ascii?Q?DjkhziBAqhVuA5I7ooY3HjL31THqjcuMX/Uk2yAwQ2UiT5GMoU7lC+cWeuCG?=
 =?us-ascii?Q?sdMzP4b8C9Mjlm5bIqFFR+tgK++YzOZ+JRuG/Ih0g/Dt7Bg0KXgmiVGfkyt6?=
 =?us-ascii?Q?uuZtmJxNW91xQG4TLuFDaziNz5ibiq1aJuH70Jp0cDmKCEGWjfGca/oFRMki?=
 =?us-ascii?Q?bQwbaH8dO8QulOE6GR+m7IhP6TS+LT8a0AltlptmvAgwKOFU+gpgbprvephA?=
 =?us-ascii?Q?VqkGEqG4vx+XSDtpmUeyITpSPK6Gv/IRYLk+Bf77mpa2D3n3Aw8FPuOY4x1/?=
 =?us-ascii?Q?oy07fatc6Dxg4Axm0aMwk22jGB/Q8J+BCEB3vsNb/oLBYqYcoOH+Benz334P?=
 =?us-ascii?Q?D8OsTzv9cYPgcLpHDYJIa9uapCa1hbwk7Aoc/QA1z5DPp9k2EpWtKnY8FUFp?=
 =?us-ascii?Q?jFy6GeovRC7AHUe+olCTfTVdPqpv2s5WDkiHDJCW5TjZSRCDD9gVIvT3NpLz?=
 =?us-ascii?Q?3aF2m6dxIDvSXsnrfrF5pK7UsJC748KepN3puX3k+xO8RMKtexlCopuc4OI/?=
 =?us-ascii?Q?JyCim3AY60siKPz/jNi3Ea8bRjI7kH0HPfcaUJSW6WBsv8B9DrHdAboPw8Vo?=
 =?us-ascii?Q?0AwlrXbdhLm/+JS3YCOzUGKUoHrYiveo6droeSrpj5COjV10XcQon+uNlFH/?=
 =?us-ascii?Q?GkLftDqtwDPlS5CLlGez77NuEb/uLgrmzbrSZ63XkzxPpsg+c5IAJohA9I/r?=
 =?us-ascii?Q?5BarC+rQL8RZ7brHFd/oW+0TSPNrDvXgmBnrkVBO8ozz9869oeBIGgAaIV52?=
 =?us-ascii?Q?8lYkWLXzmGZ4XFDjKEHRF7hWVNEVlxY+0XvoiAc7IsImClhVT6UeTEBJdD7t?=
 =?us-ascii?Q?PaLqQ8BEgbW2FxEyyRs4o0vmfI1nyu3HwRaIy0Y/fZWnHck7OJ1kVMaKTag0?=
 =?us-ascii?Q?6hrzbGVfNPAmmAwumeUL4q4wLuUazV7ar9W9w85CrHKg0e4Z8fJ3GvG/UtJ+?=
 =?us-ascii?Q?Swl0a5ZlT+zhykLYzSzuJR7psSt2Mi5AMvufZaE4HFZg7TATjlrkOWoFsmTn?=
 =?us-ascii?Q?JA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94703f03-f1d2-4ecc-ee47-08dcd02965fe
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2024 17:12:20.4797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e7YvN4XCuSFT1jzqwTMm8EbAbI+teVCjgYqoPsMtllZLqSUUzvGjDvQcLQMe9eM7/R7VCa92TJnNXzKyX6nvZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR06MB9098
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Sep 2024 17:12:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112168

According to https://pypi.org/project/pillow/ and
https://github.com/python-pillow/Pillow/blob/9.4.0/LICENSE the project
is subject to HPND license.

Also change SUMMARY to DESCRIPTION as it's value is clearly over 72
characters long.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb b/=
meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb
index e1d0b3086..e42e58be8 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb
@@ -1,8 +1,8 @@
-SUMMARY =3D "Python Imaging Library (Fork). Pillow is the friendly PIL for=
k by Alex \
+DESCRIPTION =3D "Python Imaging Library (Fork). Pillow is the friendly PIL=
 fork by Alex \
 Clark and Contributors. PIL is the Python Imaging Library by Fredrik Lundh=
 and \
 Contributors."
 HOMEPAGE =3D "https://pillow.readthedocs.io"
-LICENSE =3D "MIT"
+LICENSE =3D "HPND"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dbc416d18f294943285560364be7cbec=
1"
=20
 SRC_URI =3D "git://github.com/python-pillow/Pillow.git;branch=3Dmain;proto=
col=3Dhttps \
--=20
2.39.2


