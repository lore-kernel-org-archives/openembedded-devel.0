Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C1DAECE57C
	for <webhook@archiver.kernel.org>; Sun,  8 Sep 2024 15:34:36 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.100])
 by mx.groups.io with SMTP id smtpd.web11.32164.1725809673142184746
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Sep 2024 08:34:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=yqIX1MqO;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.104.100, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mhR3QrFTXja5o4mGXXUFU7v7Ocj2mNPdUtI8JEvkr6hJXi/yuGDPdsbOyvvEwMy1cFn9X76VbHsqw4/u/2Xy1sYP6/Vos5srrY0EWVYec2NjXYe6B5tJFaCq5zaHdMiWOiVCEyxMpAs4QRz1uTKvYeGAnFIzoJnrV20vPUJzSlb4qWzRpyvf3c/JOXlK+jSajttJP8bHB2mX9n7cDVA5rOugWYSy+6sOjgt7RGKwrbpCjoxXWJDRdcm03hSUHOkSZdWB9Z5i65qwQk/tc+wOJvEybx7rg5j83c0Sk0E94LTqMB3DDfHqvC//lBL5F5DMddNjgZ6F5QY9CHszZYDxDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lc0lyHOpbHeNdpbbW8V1qkoHjBkxruIYu2FeZmfi7dU=;
 b=N0UVQtBF7H9sEEJ4sgVkfSJVZ8gUuM6aSCmQWX3wPoMiIpbCRfgWHBeOUeAV3N78589S8CtqHCG0U/FEEwGBLa2v2QHuBsFT7cEdVhUhsZHQgSo5ef13b3eg3CsfDk7+iTCmGxqGFDZ4VS6so2OFhORwYtNfBZWuwo2Rr6VS3TruePW4ZTCJsEcWXzsqB6CvKyeZkMnYr0FkjLRfuWk8AoXHQQjKC4RT20BOvs7Cd7ncPP10Mw9jtUWxf/RbX1tboCsRkPNWuOzyuRvIMbhucFzNu6X6qOrWkRPudawc1cVW0QdsbXQHKwWD70HbaEQlrEZJECqmHIH9Cuc8Yk6WBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lc0lyHOpbHeNdpbbW8V1qkoHjBkxruIYu2FeZmfi7dU=;
 b=yqIX1MqOGoesl7sDkaGl0JyiMUGfm6D0XmaaoHPXQBO+coBSaOEeNC7HlM+78ptY6JpWhVfQGvELguoktxMzWZ6e7US+awbCreWvF44Mo/x+9aOuL16TCx7vUqJcXb7v6MPSboIxBiBM8XDYyQwBlDesioYU+xxsXJJYnZbrkAgGzAXtEc1Iu1SSgz7wirchklsZq+6cfPaeICNKN1fKBRGqytYv+jYvb/GXPFyGyBTTFF8iidgRT0iqpI8wv3/IPmoiAvGzKkF8U0L+etq5vNx0o0Wc8Ms7ym2UslsjiVcv+Z2y4zgso+lzETqO9YkgyAolevpz+whYILPEsS7Uwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by DBAPR06MB7095.eurprd06.prod.outlook.com (2603:10a6:10:1a2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.22; Sun, 8 Sep
 2024 15:34:30 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%4]) with mapi id 15.20.7939.022; Sun, 8 Sep 2024
 15:34:30 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: akuster808@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][scarthgap][PATCHv4 02/19] python3-ansi2html: Fix HOMEPAGE and LICENSE
Date: Sun,  8 Sep 2024 15:33:51 +0000
Message-ID: <20240908153408.4114753-2-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240908153408.4114753-1-niko.mauno@vaisala.com>
References: <20240908153408.4114753-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0011.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:b::7)
 To AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|DBAPR06MB7095:EE_
X-MS-Office365-Filtering-Correlation-Id: 145f2cae-d1d7-4d9d-e08e-08dcd01bbae1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9fjN6y4P8lD9Tmtf5V7uA/+bcMu4OVEYJMquX4MIllP5Z/TFO4005i1UxTRG?=
 =?us-ascii?Q?8Q7IodQippQBYDSR/HAHWeZbo72ZOlEEriaX98DLE0xcL15QWb8jX0DaUf0q?=
 =?us-ascii?Q?6jMeREOQWG2i+TBsvB0aE1NLgtdh8hHFf18Cb6iuugbTy90oF3ZxHVQeM9ky?=
 =?us-ascii?Q?DGAAbjh+k8HRi16IsnAT2msn9IRS1YUZmWLm4ZA6qtSScjCOuX5wUL1xvzNa?=
 =?us-ascii?Q?EKJprG3oXERrMN91k5KZQGimtVaBwjNgATqWOMfZqzI+FCicFFCeRfIdqoOP?=
 =?us-ascii?Q?leM0PPa2jtl87F5k0gZB7+A7Q+WX4YoBWBFr/HctqaYFjIM360ePbebELRYX?=
 =?us-ascii?Q?gJ58guzDWcoYJqGoGDITMxcRz3edJxAjJBdMbrXWr/CU78P6oCpGQ/xi/vTf?=
 =?us-ascii?Q?xRH1ibV0YInn7NxGTr/vKkqacx9bJRxBKRQ8pgjJhEz34rVzaoaSa9NUP4RQ?=
 =?us-ascii?Q?FoJd5+ahCOBAGw1fvuKUZ1I63MgUbj5sRky3Zip8BZDoNQvPJqhh/J76dTLN?=
 =?us-ascii?Q?zt3VF9/uInTeIxjmu6gBFxENXZKKmUmTMRvxXWfaqYEMw/+xnzBzTxA0PQGl?=
 =?us-ascii?Q?jml5m9ZxQK5SUKs9MdnPEUI9sVnciJU9IcHSgii7Pe0HUgv86brPz6dvVFzV?=
 =?us-ascii?Q?b7X9UkJ4TSodjetWROXdeZTOoQSzTC6PnkULS3SWnIFfc0pdgTt1CzR0GLr9?=
 =?us-ascii?Q?/ph8cRHaqPv0NYjtdQeeqeXzmAM6gVfCL5y2ZYK1UL1IaVr9CEiMv/SgudWm?=
 =?us-ascii?Q?PZ0M79NuFunDd8e9O7epPH/+WJPOh0TGCBrkneBigmuF+sogwjbs4wnap1Pw?=
 =?us-ascii?Q?RlplE43I9d0fM4NAQ5OhSaVVCYlw58/ciqBihAr4/aqvBVlt5txksP79t/Hl?=
 =?us-ascii?Q?YKdvcxBVH8PoPWVV5+g5R6T1Q/kV2J/3e/BKnkRnFFdpk5juMQcuN0VCt/aU?=
 =?us-ascii?Q?iByb5c/ya0WcA39YL30FvvPHZtC7ZRUYqp5ljQos77HqMlMP4esRPKKlKAue?=
 =?us-ascii?Q?Rf83qcOj9CvXiuaVgLC6+S0AA/VAVji6wvUFft2Tp2jq2p02kaWtzjI2QMcN?=
 =?us-ascii?Q?cWiMu9wHmmBliwlPWtW/ZNN8Xi2NaQWlVTHry5Y27fXdWnURfclQsP68CkV2?=
 =?us-ascii?Q?j1v3Py5B4TArOXKiNp4dpc5eTGTvHjwnNmxsBNJ5SxtRzKspbaKEpmPS5SHh?=
 =?us-ascii?Q?TirqoVZK/WNx/Yb6Z8OGgzZnbr4TZxE5NxK2E2I00eRC0Ss4vALTrBkpGPP6?=
 =?us-ascii?Q?wpuWKCVG/+DtDIk8MY/ZDs8xuwN+tmuh4fpTFf8vjr9q+KfLtOBHHz2lmNEX?=
 =?us-ascii?Q?1WwsNoTwnf+bHf0F3kaF6ILZxORZ7La3/AUNrsbO/3cMy9K/4WFRbseGwQfs?=
 =?us-ascii?Q?07K4Yx0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0sTvFk32dPgJRdgBzpBM/yn0ae5UzrErvnwWFtQpAQJb2uBXWd/zA3E2ajfP?=
 =?us-ascii?Q?JPSRvvQ6fRND6ma+r0zLqFpMjy7H1xSMDB82WKnDkUknVef3HMmLrBDSPphC?=
 =?us-ascii?Q?WYAbxo3ykY2meAHIOQOzWg3nCPVVsIjQgWRc0KKT2Vj1KRS0+WY210Rz+wDz?=
 =?us-ascii?Q?wvETwJ8k29CH/17cQBIfdBNP8xGVzPIIakS2y4Mwy4Cg1wRUco/9ksjKjuiD?=
 =?us-ascii?Q?mY7u3k/AQipkj9jc+AVkHwRV0qJqznKE1S0R7gck+g6JBtPzc7t6rZg4uzhb?=
 =?us-ascii?Q?++RT6RV3QmjmnBJx8zf9eyHs0Bc9N33kLcd0YyrjNW4/5xEvB3iODD+N1zk8?=
 =?us-ascii?Q?NWjTTc5FvygnTwrJqKy16hED46mhtAZYDlNK5gVtQn4vX94G4YBYut+i1QuG?=
 =?us-ascii?Q?PUNsZMSmwdzDL/yQbs09UXER65jtFz3/DuaB9NfmgwtFbqooshP7oTXqmbTR?=
 =?us-ascii?Q?by9nanvLwYoxQyRalSZYGd51yPTuVo20Fu5jEw07MKodXE8X04sMxpqA97Va?=
 =?us-ascii?Q?96URoXwawR29BKgVCIzuy5uVn/Y/TeZr9/Tbmp86oyN8e/yMMIZO9vBDaSU8?=
 =?us-ascii?Q?/XZzRi3wMeKYmFdgBRUoVPM6xHNFv/y/6wBf2BlpPmmva13yOJM7DSI59BUj?=
 =?us-ascii?Q?j3uK7aZ7U29PpDTQX923obveP7sj1DYs9AVnxMJghhagWZzjWLlz+PaaDcZH?=
 =?us-ascii?Q?jQPd2KWpHpCMpv+nU2hObIsXEV3N8CbckWfPSipRZQ67nnoeviJIkAFNfuth?=
 =?us-ascii?Q?xsGL4+DuFBXfPZouB1VdWczOgL/YvadfgvT9B45LazfgG4EglSLvmVRu0A6l?=
 =?us-ascii?Q?deZGmr0tLuBGMhujHme5AUi2we5n0NzmLKsJDwBRQo7e9UDSVhd7apFR/lDx?=
 =?us-ascii?Q?1ghezeCZUxB0P1/C607CKr/8Mo6T8ruhE3JGgZIHLoK433mnrqKIs/8kOgmU?=
 =?us-ascii?Q?EYFClO2VfayEWbf1hqUKnay13zoII3PK0GotdYY/GRpMjAgoOgqguHeDE6gB?=
 =?us-ascii?Q?UYdAjpH4iFx+mfLfm9w/H+LPdba+gQXpw7R/2wovncbSuYoWdYAMuYi8Ened?=
 =?us-ascii?Q?d+7EnnII6p746CUxZdgC5eDUkMIlJbRemC5IUd9UPJt4zKG5zvaDVHujrAVK?=
 =?us-ascii?Q?ktwGYdo1WhhEQL9NDjL2qY6cXshZJGcX03hzooOdRx31apeqblHpf0ap31Nh?=
 =?us-ascii?Q?BVdH5FHxurphIT1VS35QMHnfqYp5/US4R1f5tnem3EJeIGxYbb9PnHzFa+JZ?=
 =?us-ascii?Q?MDpVFmcIpB3Hr0J+hqYrM6O0S/I67qkZPn7dOVUtbcO94ffbPjiEAEs0vSdk?=
 =?us-ascii?Q?SvJQh8TumjbNZRn6attLZ4pDC5UayKvJyk8fBiRQiS7QJ0cVqAmQs4Ta3FeV?=
 =?us-ascii?Q?QMpJ+mIjZf3wEDiXH2JsmBLh02LDD21A87OUXv3NyZZ2JrUT5HaA5HrdSgOZ?=
 =?us-ascii?Q?tO858B+KSC+7mzrw59JdUuGRn7+uRbAqwA3dOSf4P8g9bIWiHSMxk67u+vO1?=
 =?us-ascii?Q?why7PPb1qMhQxz6cx6bpnk0w63X7OtCKv0Mrgz7u9PuOl0JSfNwg1tNVe/b9?=
 =?us-ascii?Q?nktlpC/lWgT65hqiCsiw/KjNeWrmXCz9/7Ft5nT0ywgOzTgW4zViXd760M3i?=
 =?us-ascii?Q?sA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 145f2cae-d1d7-4d9d-e08e-08dcd01bbae1
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2024 15:34:29.9429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZsfOFD138Sn23BalWCaZZwBaM29i7BlKA29TKZeR6+sqOIrUbrRPGeqVwADMWcLLg8X9hvHqbvcdN7IinAGUGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR06MB7095
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Sep 2024 15:34:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112142

Update HOMEPAGE to the url which old homepage address redirects to, and
change LICENSE value to match what is stated in the README file:
https://github.com/pycontribs/ansi2html?tab=3Dreadme-ov-file#license
as well as source code comment:
https://github.com/pycontribs/ansi2html/blob/v1.9.1/src/ansi2html/converter=
.py#L9-L12
also LICENSE file is 'LESSER' variant:
https://github.com/pycontribs/ansi2html/blob/v1.9.1/LICENSE#L1

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-ansi2html_1.9.1.bb        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-ansi2html_1.9.1.bb=
 b/meta-python/recipes-devtools/python/python3-ansi2html_1.9.1.bb
index 6af898917..abe27c4d6 100644
--- a/meta-python/recipes-devtools/python/python3-ansi2html_1.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-ansi2html_1.9.1.bb
@@ -1,7 +1,7 @@
 DESCRPTION =3D "ansi2html - Convert text with ANSI color codes to HTML or =
to LaTeX"
-HOMEPAGE =3D "https://github.com/ralphbean/ansi2html"
+HOMEPAGE =3D "https://github.com/pycontribs/ansi2html"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3000208d539ec061b899bce1d9ce940=
4"
-LICENSE =3D "GPL-3.0-only"
+LICENSE =3D "LGPL-3.0-or-later"
=20
 PYPI_PACKAGE =3D "ansi2html"
=20
--=20
2.39.2


