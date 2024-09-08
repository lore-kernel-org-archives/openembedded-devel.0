Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3558ECE581
	for <webhook@archiver.kernel.org>; Sun,  8 Sep 2024 15:34:46 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.131])
 by mx.groups.io with SMTP id smtpd.web10.32311.1725809677520700433
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Sep 2024 08:34:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=T41iBbuT;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.21.131, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tjoWlgImw86TGBc9gf3XBJqfk7hP/LgzOyvfgjd90314O0vugbY7NeJNXqolH9338Su8tYlJVDoivWZ6CwDU4uIgtOYdfBYBkeN4aThv/qUTGKZQyfJsY3N6ASRlW5svUmLWidfvxTXs+TMNze8R1W6M1dxqQuiMTanEydpSDejhrHO9yUp01K5UyZxTLlskEE45/2mXV5rnGR5Sr71Msn/mlyYNLfUvGqGkv0kWUkh6JpXuEYECOHbpTD6QGZFEBv1qVU0SefLgvkJcnYkui/Arpa33geEw8i7aIiJvw2o4v2yLdoR7GMCY65s1MlAiGLVICK7AxoWDnCQfnDAFxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DO6YJcunCsr2sd0SkxKAjgGnY/vMSntLZKrXgGmWdFQ=;
 b=dLxMBMzGZFNyFZKcf72zmWYuRRPauI2skj5N0t2xAM7WEPfpH/TBJgDWdqgUoSHSOtwamFnDbO2MUYsHUulDiZIH2KdIjXbCUYrosohRyPF1k9V39yJdEo791SNJv7wU5VFcPGUZYMl2KXsREAMnvj0eXpHRJjYU1SQOPEXakNk68L//vUbVPRxg7TBspxxuYy/8syfFBPUODyZPY6oA4niM+AznsdmNdRlSJhC4jT1aEnyw3sO4dOyURlMMFSgl8Tb3zl1pcdEjiTd5T23d8+W5NHvZDqrRVuSAU08ngPcdXEO6KEHDs0KQJwyNXYdCOJdiBv+o7pKyMeNMChmtaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DO6YJcunCsr2sd0SkxKAjgGnY/vMSntLZKrXgGmWdFQ=;
 b=T41iBbuTpELrU2F9tpoDXpTIbZGGa5K9YUYgi99LeSw+KItDm05Xc3Yl4xURXs53f6nqtw/53+acoiq+pnO4256vjr82yblBFPsGg4cC4zRWo3TTYayDf46BQQCh1fUxaqyy0ZOQ9SDoAhp5avZGDw4wo1yK+zz4Eb9XKSUciBbOXtJRP/n4u7w1AFWjfd3oaqz/YCEZ0EfwMxgTILkRZsZ2sALPAKsGEE+7dW+4HwlBL947b3IrHTGHMgMEA2lQ4NHBtGa4MCrxiOLiPlIwrS9vAHRbfTv1KTqxeU4muHYQA2x+/wuy2ENre8yMXE+2nEx8DYvor3qCtxIg0icqow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by DBAPR06MB7095.eurprd06.prod.outlook.com (2603:10a6:10:1a2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.22; Sun, 8 Sep
 2024 15:34:34 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%4]) with mapi id 15.20.7939.022; Sun, 8 Sep 2024
 15:34:34 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: akuster808@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][scarthgap][PATCHv4 10/19] python3-platformdirs: Fix LICENSE
Date: Sun,  8 Sep 2024 15:33:59 +0000
Message-ID: <20240908153408.4114753-10-niko.mauno@vaisala.com>
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
X-MS-Office365-Filtering-Correlation-Id: 23b99942-dd84-4e92-e9a2-08dcd01bbd22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?UXTJ7yxapHO1BcOnH/sKJDejOUp6MgyRltucI33hIcF7ePCDhTdVQ1xHqLws?=
 =?us-ascii?Q?SPwxsumlQiw7wBspOwlK/dEQDoq3gXs9ZeP6wjbsOW2EwpSZ5tJ1ZaAwVdhG?=
 =?us-ascii?Q?TN7vWJEYQm25HAHjFfgLzvCyd3kiiRlhscfqvrdt+zds4T8ejJQio8dgqaOC?=
 =?us-ascii?Q?DEt+1dunkzBesqpWEQ/ORSJs2+bjS11SxM9nenoRCXMnN54g8cx1vqzy0e6E?=
 =?us-ascii?Q?THpwml2CPtUyIUDATLz0GUpEopzT5McnP9oMbBctCAAO+474BDcJzIkXj4KW?=
 =?us-ascii?Q?/5FQPvbHGN8cH1MV60BgxU3yAXQPtCJd3CB4pcR4ZzMEhclpVu4QqAYgWvS6?=
 =?us-ascii?Q?gmMKdcsG4jmhtC+jDQDXDqScn0KZg2O144nawB0BGJTrimF8NtQwzVvDojEg?=
 =?us-ascii?Q?pi6JhnRF1vWgjeIc00xK5wf/I/v+0TXki1GFNq6H1WCVzk/HauwUxFaH98O2?=
 =?us-ascii?Q?ErLAVJLpQbtx03kG4Tt/bhZIBv8pciUiMx3YEYZQOanGE5CBntfAU7vksQED?=
 =?us-ascii?Q?3FZEAZS4xwuz4BpuMY21xfebIJOcS/If5cZfzdoidYu8qtrYE+PTe5eL7ego?=
 =?us-ascii?Q?vih2VhoNpLkMVEsfiXznxNLABGrl5GTEbc+0htMJ53loRDmu+00lW/NoC6jH?=
 =?us-ascii?Q?6zb0OhRYshostDumj0T9RAXgWId0JMEHh2MPmIKrhfaQyBlfGQL6oJ8qKTOt?=
 =?us-ascii?Q?CRx/o2gcISVGEbAGWeXFSunk+HStHPDreqiHiPVA+0Vie68DtCupQmeA5Nf+?=
 =?us-ascii?Q?To+S5RbdZPeUOovVpO3x4zTDJX/t9b1JOP3JO6iw6E5r1AY383s7rZckGdfz?=
 =?us-ascii?Q?/66hE+nz+8muIDzhRQNk75SSot8A9G8cYq04nV1tDk6mywkCZNsObckDRwMM?=
 =?us-ascii?Q?Bff385qwGTbAO4o5yyNMZHQzwnIrxrDM8C6ySkubZOBg3iVjHFFHd657CZ/W?=
 =?us-ascii?Q?+f4HFvsVfLzI8lXtgNoe2P31HqYXu3k2Sro469hsDVr/NZOIsksof34kDvLI?=
 =?us-ascii?Q?DI7zei1vjGPs2r6iMS+RpiWX8Ah2m33ac28qI6U1J95o9OB/rwizk92TU6hT?=
 =?us-ascii?Q?D8JJtBmDqP5PDI1HhlkBPHem7ApcRiBXJgu5DyhY3LyP49bBfOhYhUIUW7mW?=
 =?us-ascii?Q?ZjWa1E47YvgjbeUP5y/6h1kPx4BxfgXYMxlxFS0BG+MCzmTh6x/I/NX7Oyqb?=
 =?us-ascii?Q?JSmS/giddnkj9HVlXUySKs5yH+MWTNtzUud0fOCStAXyn6MFweRdxhzBOFVF?=
 =?us-ascii?Q?SVuyZyn70/D3K7fYlE4vUzunyBx3euJH8p2dklGC7Z54XPPlRBdb1vWzavhW?=
 =?us-ascii?Q?qv187SJ6fG6XwXYEIZ82kzlbwslEfBY2sthyAW0ZhK/mQB8tnAWuTqp9XlY/?=
 =?us-ascii?Q?7D3tnEY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+b6/m/bzsgysBMb/jyiJK6NrCuQBVmBfmE6GONqNKZVMn3rnOf+siOBYvCn+?=
 =?us-ascii?Q?w1EHXC+v1sYxVf+FNXTdau/RWMlevHVxboo3E9wSr3NtKZfY9XKp5ERTlSGc?=
 =?us-ascii?Q?01QojuazNJM7Z+GNkkwvpBaZmYZhMHyqJpom5lsK1sZe8MrVVVHB6/bMtHyl?=
 =?us-ascii?Q?QFzHtYmUEPyFR27UC3P3oYTM/qRgBhs1XSQEQPNq5GBEHcue2tnPmRK0/bl0?=
 =?us-ascii?Q?opUFxFDnJzXSVqvBlnkiZPDCdq5v88Yv6CkQ7rCPnulY3dBji3+WnMcMfjs1?=
 =?us-ascii?Q?7FnZDcsLWAWAwjLc2+DbOHgv2+vBPvB+0uqoHjC99CQpzIAhHJ6j0IkaRiSX?=
 =?us-ascii?Q?L8+Bra7dG+8rEpb4ayngMwdkRxg5AZQd78pRvrLJv01RSHeaxT5ftSKJED7z?=
 =?us-ascii?Q?tA3jyjDq/7qBs3bCx5nqiKkWjHEfPmHNHFHc6b3PtnLlIQtnvjPv2hRVgVtF?=
 =?us-ascii?Q?+A6MS4823BIfdEiDhYAtHJ2dOWIQdjaN/2GgNbyfxYj1JW4zJDjWxsQgyrD9?=
 =?us-ascii?Q?9JnGTG2wf3UIbYHWfSW9s9eNZHojP6xjxrOPwoMiJTsWJwcKqfpve4OdMzte?=
 =?us-ascii?Q?IulMHSJzxpJonnmaetahOuxhuAJTKMIJ8csSvv8JpjlLXUDxeEhwQf/a8qKW?=
 =?us-ascii?Q?F6z7lScEPCjitoe8q+L8kj8TR0xvyIaHGrdYOu0sWAoo071C/ikHxXXVYbn4?=
 =?us-ascii?Q?gmilWURN9F4Ryqq60NpTsJaBx6OgX6YHK9JrXfN4UFDkDW0Ptga6bOcV6Aiv?=
 =?us-ascii?Q?YI1JPxPCSyVS2C2t4crzj+vu5dYuyEGfd+q1Zc8Oo0F3dkFiR3lv2y2p/Lc9?=
 =?us-ascii?Q?SCleAgo6sVZtjLVLBMNJ2rfUDdtquJw3dgiwmSouiqLg+JAe2EL7eP8kCLnx?=
 =?us-ascii?Q?rFz+IQK1bk4EfoWN6lGfNY1aEL7EPtldSW7h6xis+9iyek3W0a9Wos7lGIiC?=
 =?us-ascii?Q?3XnVfLbAAcymOyTrKcONruEcL3MUHY2ALCpkUSiw0w8UISjwyH3Ght3xR/N5?=
 =?us-ascii?Q?tg56Ltt4KpgS7gQFwrmnKuOkrVUB6aQtjKPA+QD8HL2g/4tdfJU7uRWBNo4Q?=
 =?us-ascii?Q?oQB/4a+356SEH1Z4IKrnEiU7biUyEN3ahcmfkCEDqZ4ZwvBbb24AA+cSTS0F?=
 =?us-ascii?Q?XlbqHZR86PQTMvrImohp6Uv1vjaYNdXVygMHGGwciceitlgZEu7PXEpxhJfi?=
 =?us-ascii?Q?tXR3fsJBF6bdcI4728MP8N7jPFGeGOPBFMGY3PW140f6mKhVTsoA8T5p83FQ?=
 =?us-ascii?Q?cNEd8qPNGfp/OsyQMEotzP9moEu2SPObbXuBbw9SD8NEG87DZ7Ob6hyNaBz3?=
 =?us-ascii?Q?VJhqAWGoTAY8uZUD33slprhe3Ik74Uq30yYj6Mw6VKDcdJ3GKlB80jMwMLnC?=
 =?us-ascii?Q?pSr151kKf5FIq5HkvD1HgjcMFIUBkHn3Vi2UDdBjPOT8CqBb1dOgW0ldQn3y?=
 =?us-ascii?Q?MJBPp9LFHVizC0gHMW6XLKNAiyJFPPY2+u+2F8v1ryxojEdNfW8RpHZ9sLea?=
 =?us-ascii?Q?KKpNRzImm0wQ9LQSyc+VpR9gZg7OjmFpUbB6XD6GbvRBV6ntBDp3g9xFAD1Y?=
 =?us-ascii?Q?32/XtNL+4ZWYqFfFiBq9zT90L4ANH6wcwHEshkm/+4fZt9VYj0/hBOi0P9zs?=
 =?us-ascii?Q?9g=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23b99942-dd84-4e92-e9a2-08dcd01bbd22
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2024 15:34:33.7192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fg/TVR2bVTRYss0EnYhV5u5JVv3U9QycfY2dZ/E5SJ4qGwRYixRHu4NKcmAVHzCxP5ZTnezXdbA73Wa4hdrr/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR06MB7095
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Sep 2024 15:34:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112151

According to https://pypi.org/project/platformdirs/ and
https://github.com/platformdirs/platformdirs/blob/4.2.0/LICENSE
the project is subject to MIT license.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-platformdirs_4.2.0.bb       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-platformdirs_4.2.0=
.bb b/meta-python/recipes-devtools/python/python3-platformdirs_4.2.0.bb
index 19c95b374..c69c390b8 100644
--- a/meta-python/recipes-devtools/python/python3-platformdirs_4.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-platformdirs_4.2.0.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "A small Python module for determining appropriate platform-sp=
ecific dirs"
 HOMEPAGE =3D "https://github.com/platformdirs/platformdirs"
-LICENSE =3D "BSD-3-Clause"
+LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dea4f5a41454746a9ed111e3d8723d17=
a"
=20
 SRC_URI +=3D " \
--=20
2.39.2


