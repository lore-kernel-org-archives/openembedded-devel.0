Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98AEAECE577
	for <webhook@archiver.kernel.org>; Sun,  8 Sep 2024 17:12:27 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.123])
 by mx.groups.io with SMTP id smtpd.web11.34076.1725815542816309636
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Sep 2024 10:12:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=cKsB8dft;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.21.123, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aFNd1gKgT7Pr26/ViyCEOsz9VZDm44t8Hqoj3tUuCM59eAApTaqxz2zF2QhfD7TyLAFrZAcaZ44SqL37tSfm200lJQyryDUXK/UMLuWZEMEEBBtRfDX2xdBmOZoHKtYoQW1YSCh3UCFwZ0k4JE5fP79b8oHDP9mWZ3Iy18s7e+WouYiNfKRH/+OWbBR6dyIBL3Q+/PVW9unPavKsuXnBASCMW8v6gJt8v/+sBzLXKIYNM0m4zAYUHXOMsAU87Q8NlM+a61NuFDH7PTpGpI8O5W7FFfRc7xpFcwUJebcP5sDY/zOibqqhYaREaufKgbKO1Hmk4PzYRUSX/62Wm7Ci8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VXeUel4lXwcOm5Fbv1tVWnRk0o7pkzSt+RalI87boI0=;
 b=q3z4iwJP9+HE2ihmJS+7skB630DUn0Nt9cGlUY2ihNqhPqEs5XZ0gIp5LaVmIGJiJJ9Gy6Rdgup7md3m8CH+UX8kwD4co5z8jBInEkiPmJc+p+na7QFCHR0DtnADKJt+D+J+H40Twc3S104/z0fuzEVwsSVUvbMhaVLI1QbXP9pjXSmAqOCgx1sPYyDCOAiGq4bOEkYs8AJ8102Wrc75p3h2PVnrNQ5pO6hz/Fk6IpUFLEc4EtH234MAqt2NaRqV3zPkS2v12RUoHplHnwf7xP9snz7QQl0K+KPhIjFFTCC6MH/7AoY7rJX0M0CmXQUjjZn6/YWZe4NcYQDI8mTEyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VXeUel4lXwcOm5Fbv1tVWnRk0o7pkzSt+RalI87boI0=;
 b=cKsB8dftj7ai6nuQIU8/50BMbBNdMr0H1TPHMxrVpsoOuLAfZNR1hPqUJw63tDSOSgTXNy+O9fvBjqisGAbvmDpUc1KB8Jphv7Kzv/3liDaOK9KGZ99Sn6OSTOC0wUXITA2n9mWHoMOkO76I/CP2J5TTYWbJx6wwZaKXg9eDjjceDqAGs07M2Za/g+n57Mx6W8RpfwAHNE6jmoH8BUGCxfZzuvPFDpF7wCH2NLM2iq1dy6cDHYyN7KXzYb+/YLNJoehWOMgxeeYOEfkoq/JVsmFyOKogyCcIxLEnFeKkWcd/EMOctV1Wn8I/Qniu254RBcBtmsTl4uMxezPjYVeK8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by GVXPR06MB9098.eurprd06.prod.outlook.com (2603:10a6:150:1b1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23; Sun, 8 Sep
 2024 17:12:19 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%4]) with mapi id 15.20.7939.022; Sun, 8 Sep 2024
 17:12:18 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: akuster808@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][kirkstone][PATCH 02/13] python3-xlsxwriter: Fix LICENSE
Date: Sun,  8 Sep 2024 17:11:30 +0000
Message-ID: <20240908171141.99382-2-niko.mauno@vaisala.com>
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
X-MS-Office365-Filtering-Correlation-Id: d5ec0b9a-472e-4671-b502-08dcd02964c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?KCR50zzu6/5vpL72kaQrhCgFdulZT5COQ3ascviPQX5ztKBWRltN7oXuP/ab?=
 =?us-ascii?Q?PMxJ3jj9gUbcIylf4ZLlXb4tdlz8h725H5Ve1r7wiRAx6InNMYUOOlZ156Wu?=
 =?us-ascii?Q?pZbjZvlxjJbBFKgk0F8GZOU7eJgDvo3GKx3PYVpP7RK4CtBZeOdFbb0pNzOp?=
 =?us-ascii?Q?TzD1pmMh77kZuTNsGeiraWVAx/VZ50D44dI0NORdZRaUFsjN8efmRWgV6GCH?=
 =?us-ascii?Q?J4AUSl/U6jX1ObIro8eBOrfxVRFdLPJAb0RAUDmLX6wbwwtzcMYz44sDYiL2?=
 =?us-ascii?Q?CdaHP5h9bWblL4fBzIQAs76QlUYGMChe0noRO/8FYqZl/hTE1HW04NePzu6g?=
 =?us-ascii?Q?DeZT0Gedg6stClvlrsETdHOfCSIMk/MSKH2QifRc+HSQ2bo6Qw0slpeCqfZM?=
 =?us-ascii?Q?MkntoCFpvM9hyRurQsJ3ocesH4DMg6mX3sv6Ak6OjpI0rctFDdFDkiTZUJDn?=
 =?us-ascii?Q?CgA4TPGP/lpWK+KRgdTyj/1wQYGnjiYFykoCm/A1Izl98/yyiijA09lj3jFM?=
 =?us-ascii?Q?bX5J3k7WD70i4iNkQ169iVfxgY3gTjequy5+NQVrCFoQiAuKNTiuX/OiGv/q?=
 =?us-ascii?Q?7Qghhm3dFC3mVLywvuPHrJKfNk7MFEM3pn8eEMWil/G6VKpIkS4hvYg8NOM/?=
 =?us-ascii?Q?MacX75zSbbGc7MP59sWElwbPrSDHHz8GByH2mCcQWquNwMWjLOt7D3M/1sCA?=
 =?us-ascii?Q?2H9X1pC4llhO9BUcfEOe9Y9mFjdNC01FRMEIA2yUA8gsCmkFNQG8CMLe5qxJ?=
 =?us-ascii?Q?IVk25edNOzER1MGhoBr30eSljlRcEZCgOdM38xH+dt5adXYk3sfZfYmBKQu6?=
 =?us-ascii?Q?w+ZzIWPQvFAj+iZeYlt4dyzfczIBSrNQu8LRCM1tFavje7zfYn45Kqef4B2g?=
 =?us-ascii?Q?VHPdRAK89Y+TY2UoNbat46YhHOLhZhZyiPXXKAx15uPlZIjrEIyBegAzGZb0?=
 =?us-ascii?Q?K+WGEfflf/zXzfNNORZKTkscL6tJxQsz8KAKH+q8ni5tZecOH8A3KxEEZmsu?=
 =?us-ascii?Q?pJ72Fn5Xz/TTzAAgEvuZZWm+e8zMLXr4Au3qwXswhxRhz/6SKXz4ElsAfJJX?=
 =?us-ascii?Q?WJj+jEIzbuIokUfMaS3aRclskYgN/VQI2v5zx+vkKNdIER/aYCtT+0ipzX5v?=
 =?us-ascii?Q?Bxbrdw6aTKkvWj7JScBb9n+qzv4ii9WILm9YcYCUMS5MDyDIzBsguDeaT6Q7?=
 =?us-ascii?Q?NbHjbcFQe+KDCwpixdBWKpleVSA4kZ8w7XgkMGH0vc0DhNgsGACyPqmG2Hks?=
 =?us-ascii?Q?9hLav2GAF5CYswDhG+j/sg7cPQFFn+E4mxG1a2Vjw/Vv5TqX8NRoqjO2RYBQ?=
 =?us-ascii?Q?rWwPZKBWCWKObIOyeu9Nr4ixuBlC564m7iu4WeFJJHjdmw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BtGQ1oLu8xqP+b8asFTmaPt9l37I5gR3wtEwvrFSZhEY0KSzZv/6y08gAOt3?=
 =?us-ascii?Q?7GxFprUQ5j+qpCjTOkG19bm2sp/sHEpNT/SHP0RNwAur6TCPVc+ZNMbhpRQ2?=
 =?us-ascii?Q?0vJxuFOyB38xhYk0Z7DL6Bet77thGpGc+C8x6xMc3NRiYZF5zAAcGYnPWmOS?=
 =?us-ascii?Q?E37BcswvyvYgnLsKthyklLjtEGNEOISy65TIdSh7a3rJT4ybjfixi6347jKS?=
 =?us-ascii?Q?IsDaL9gYv9MFytYq13K42Tb78Lbv6E2XL6KHh4lqAJ27/LUxTv3pFK1db/Ud?=
 =?us-ascii?Q?oTxldPdehWqEVRcTuj9fd5JCZkl7//jyvfQRrdtTzat0hmqXuYChLBu0pw75?=
 =?us-ascii?Q?fN4zzTWBH2j+1jE/HRW2+zFL0SBtdd+ngvDR/RDSoCOFaMgIgbPHsIu8mHOE?=
 =?us-ascii?Q?pPS6KgRGSxkEcz+cOvuYbaWqlE6eqjmBGO1vDpYH8dk3x3OVvTonUBqY1jK9?=
 =?us-ascii?Q?4mvN+c4bCQmpOJhDnvKVvgku+rmKulKOh4RwxScNiVGNj1jW4SQb4AC3FGuq?=
 =?us-ascii?Q?dy9r3BHIC9EEahxU0QlZ5uxDsK94dR6hAIQIofq5/kq8E/gW7IfQPMPPmyBs?=
 =?us-ascii?Q?H96CLMDiV9AoIRQAsTq2NSs0d38K7rNKQxw4rv8lY4yHqQblfQ7v6+Oma91O?=
 =?us-ascii?Q?Yp+891oNjpw2DhSQSa9OWj3bqeQy9yyGu7PEtxrQ5d+Utx3e7yity+/ktcvV?=
 =?us-ascii?Q?sqCM3osmsyxIxEI/SfGDuYkjfwc3T2z/Qg3AqN4IZjpv5njOQyW2LLXk0Vd7?=
 =?us-ascii?Q?NbGL/vJhctAi/dszmStOFdRjtAU4+FJGiRzXZoSbFLgjJHF0IjkYBtND9cUv?=
 =?us-ascii?Q?bNFdHRUa0Zf4BHD3+Nr01rH7/RYs2CrW1Vi1nV+xPwv6UJts2XVjqGtdc+ZT?=
 =?us-ascii?Q?Y39pLYt4cNlE23buGvncLGNy74dcIOZ6NeYx2TA7FjxPgNZqSJ0mOpoYgdmk?=
 =?us-ascii?Q?de/IlI5nRcYOfen9mP/z4HWRiiIdOZ9Pxz3ChiKNOpNAu1C0kDrPRRg9VOvS?=
 =?us-ascii?Q?OSSioP6ieC0uIB06dc1o7Ep0lIUk/bu8YxYYtR+sn0gx9tvSo9npos393+Lb?=
 =?us-ascii?Q?2s2pAV19MyUH2XWjqW+snhKy23Qa6Dky3hEWNBh2csDDtbjulnclrrND/FlA?=
 =?us-ascii?Q?FQ+EHKfgyZF3EUruXFuWG2a6vWoTXxUul3/Ocp6kmjReUZnyWftuvrqO6S0W?=
 =?us-ascii?Q?EHSfz2CPGJfLHhKwTRG6y8Kc8mYq/BBmXEdNZK+/KRcsw2ouLQDipJ0zkgka?=
 =?us-ascii?Q?HrwRntz7koeX38LTP10hBsbdhfN1fZOUd3eA2viBCvL5jtu6O492xECo147L?=
 =?us-ascii?Q?yZ6eiMgq8UdI6wNcYsRzLPzuF5wDYJ07a+VLqtb+nq0gejitX9v+05H9jgD3?=
 =?us-ascii?Q?yvHBHBZ21zNSkCurSiMrxA91p/IA76LSdoIDW6gg+pLPSbwegoN/C59iH2e9?=
 =?us-ascii?Q?dvA4i01eOuWDJSLkPoS9uHrnEywra8QvqZyKjdiYyrtUrUW2/bQOkshBS7eV?=
 =?us-ascii?Q?hoAFkPQ+apbAvx3Azxza4i9L/uhCogKfrULtuAvSdeidYgWeO1HLw3BzFpcR?=
 =?us-ascii?Q?sp6qngechsKWghj93Fnq9zpo1hTF8CcQ/k4Lvk0+iD/AwNYlE0oorztOGs2B?=
 =?us-ascii?Q?eg=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5ec0b9a-472e-4671-b502-08dcd02964c1
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2024 17:12:18.3978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: th7/08/LAD5L1vDbPJY+ymUuaLjPEuGPEXSiOHNYFI/hHe+TLEV8E/yFxpu/TR03MUEkGxkilqpb+oDum8p/oQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR06MB9098
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Sep 2024 17:12:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112163

According to homepage https://xlsxwriter.readthedocs.io/license.html
and pypi page https://pypi.org/project/XlsxWriter/ as well as
https://github.com/jmcnamara/XlsxWriter/blob/RELEASE_3.0.3/LICENSE.txt
the module is licensed under BSD-2-Clause.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-xlsxwriter_3.0.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-xlsxwriter_3.0.3.b=
b b/meta-python/recipes-devtools/python/python3-xlsxwriter_3.0.3.bb
index 0f8dd35e0..edc46ef51 100644
--- a/meta-python/recipes-devtools/python/python3-xlsxwriter_3.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-xlsxwriter_3.0.3.bb
@@ -1,7 +1,7 @@
 SUMMARY =3D "Python 2 and 3 compatibility library"
 HOMEPAGE =3D "https://xlsxwriter.readthedocs.io"
 SECTION =3D "devel/python"
-LICENSE =3D "MIT"
+LICENSE =3D "BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D2b9a26d1a52d2c66df334bbdad2=
3896a"
=20
 inherit pypi setuptools3
--=20
2.39.2


