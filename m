Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9989FC54736
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 09:41:10 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.132])
 by mx.groups.io with SMTP id smtpd.web11.48815.1724665267299741598
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Aug 2024 02:41:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=cZwxxA8B;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.21.132, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gb6LBC7llxCJhpSRJlG9TdbwYjjQzG+uQ9MHARAIMRccKiI2PF0WUSXjPkBVYHQJ5zTq6UEpsY1h0ArTZ1sytxxR0wsCQkdBt70CaQljXESmDUMuef6ScOHGqNBZ/6hpas4mG6tcM7ak3fKaltxtAyEoehfSvpaPN1p/VF260O/Ra4xdZyKqzpiP71B18PDxAU+5GYRijmYprfwSlRDDg+kM1ZBGFhZad9NZm0ZH7gUtNOZgIBxRYnofQiFw5ciPrrc0AV6ALahN4xpCGKoLzr3iv0mzm2csH9J4NKpCOxvFtzskUjtRhtglCnSOGkD7vn2tXdYvTGh0gAyGU8/BHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UmzxmYVACnTIDCnDQxc2z1/suyfdPlXU+MoCSQukmUI=;
 b=weUQRJNVsNz9Ss27D2r6qwDm7d3Bf/5wNSUl85mCh7tapayiPq6aa3VNohTcJR3JuiLvOrhzIFtvhs2T/zqNqLbrnksJcsGD0ArnxNQyqYM5Sseq4eE6pq110J2pMfHuLFkHYnq17rs0XcKP9HLtYg8djfk4GJmT8INwZhrtb+GOA6VrxiwXEghbeAna8NMxxo0omMp1LTrrGhWPaZnYXjLs6DSWpABmeZrEpx/Gvr15anOwUu3m2Q2s19setkvPYKQRyKgLAb1V5zrKZgj8Aw+0Sep/fvXXUTnaHxa9qldBQbWzMHOC5cWGX5q+o2HliPzFRJf5fOnY0A4tHfYy2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UmzxmYVACnTIDCnDQxc2z1/suyfdPlXU+MoCSQukmUI=;
 b=cZwxxA8B2XZ1K3ojpVCiV9JB6+2IsA5R1/q/Q58fTiH6JSM9I+2k/PVkAwZgAEXAEswjfogfwDzVdv5kULJzRAveXhcAJjYnnM23ZvJr59MALV4VKP7Tzg3KYwGGH+W1SgqT8UPjgiksMRjy/hvvWKwUkR6KTO8VVlgCf7wJ1oHeG4uKoLGU8gxd41Cq/T/ceqmD5LuPO35xco3YvJkc2Gw8KGPdCyb+iDaxf7lZxqYDvM0RGAzwCQjZ9FfbKvWLydWgy5OtIkXpsGmFSRLlIJl9/OlI0H8fa6YV9aEcKjjhpW2n03r3VaDHEQpFzQM+KJp4XBo7AkJt/I9QxtSUKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PA1PR06MB9577.eurprd06.prod.outlook.com (2603:10a6:102:44e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 26 Aug
 2024 09:41:02 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 09:41:02 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-python][PATCH 07/21] python3-lru-dict: Fix LICENSE and change SUMMARY to DESCRIPTION
Date: Mon, 26 Aug 2024 09:40:07 +0000
Message-ID: <20240826094021.2744296-7-niko.mauno@vaisala.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7739233b-13a5-4d19-847b-08dcc5b32f22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?EiEHv+8kcAxt8DOc/jKU5jcBoK1mPS3ijlN+5YL+2fWIDr8xhc2RgceDK5LC?=
 =?us-ascii?Q?c56n2pBHssB3S+nu8zcMvWbUlraltew6yH304HbgVKvIJ/uBa4spHhTiwAZ9?=
 =?us-ascii?Q?G4/qg3T2DKJw9UXtj0URI28Bmw+4nkLG4UZdUApUNoq4AhCaFYQxVSV6EfOc?=
 =?us-ascii?Q?y2Fu1drHTtM2OR/RB8N9BSb0jraYkbmZkxA37SrrQBMoc8B6x4IZ+dNtR2Ey?=
 =?us-ascii?Q?c6Wf5QknLIfWSjabuVhtLCYPbvf6qKpox33wGrUGnzPKWQqLHNsMtgAQRiQa?=
 =?us-ascii?Q?k3etNfCEkDOnu0Q1d5crjRPcKO17Ms1Igh8Wfo1LGyrbkwJ6wNJuU6KJNNJp?=
 =?us-ascii?Q?Uc2ESQi0ZlsmJQ4wakWacdJUeBZPaEGMl3NB2VWTQFfwSLD3RALm198pzG6A?=
 =?us-ascii?Q?ge/HGxC5i6kZXgcIM1jUKx8J2qvB1rrNxLxpwrw0rPe4S+rzyCAoWgQ1ASyz?=
 =?us-ascii?Q?8iOCSyy9+EcmCV1UU5L2SE6JgASM0G90cxSQH/xS6UfwvsRNPGEH02DL/rj7?=
 =?us-ascii?Q?rS+Xjv2N9l6R37w1zFYgSARjMD4oEsThhVjfJTBh/wxlW0zf2mwl2Xi4QOaS?=
 =?us-ascii?Q?XuvE5u17vmxnWNkVLp/dMagoQqhQ5r44h25wtI7jVQSif9m4y54ezAZS2RLs?=
 =?us-ascii?Q?y43RVXoFPeBy2Mk+m1FsGB3r9+oLBMJ6S/ocU/WOB3CeKGJHkeBnu/lI0jA1?=
 =?us-ascii?Q?aCkRyFC9V8Mf8FppkjqQ/3dwPw69ByuVYEjzQyZjvXNmyRPX/HgA3Euk/Lsh?=
 =?us-ascii?Q?B1DbqHLZQpER7j5ybU6/fjdWqDrtsLvylaW/gzOIkNDpSRnHBrQnFQPf5VZS?=
 =?us-ascii?Q?ZbyK2wWn0irHyytVrSymV/5L9rWz2w69qGas/9J9F6uNRu/RF/P2ZllNMj0o?=
 =?us-ascii?Q?1EJ8yHnQveM2CsccNsZxwHscCTXe5HjDf96ifSJ6t+IdqqGWwLIqQK7Q/hLq?=
 =?us-ascii?Q?zbBWEg2GjJZBi7PCbtqwk1byqow3iISzyoEDx83FF6RkNgzk5Lx2AT5MQE86?=
 =?us-ascii?Q?eB4ecPHn3+GD7+QapjNYfwmWwIpTMEu66NIPw3AsaK6PEAAIf8se0ML01W6h?=
 =?us-ascii?Q?XThsc8JoaKHURDdqbl+bNYxPGuevTJvzd6PoWyMfneg67veNkT+xnxBCMRwx?=
 =?us-ascii?Q?fGCHPSLbctzx3l1rdIio7KRMy81BBBnESf3jmMOPDR8gY3YTAgkE4XKmzGir?=
 =?us-ascii?Q?kLxaBwUjCoUmheqxyXXWfiTz8MX0YvuRACsi4Bpb/ddWZcSWfZts/WVXSm91?=
 =?us-ascii?Q?tO9Hb/6e1SrSoonuqCt/Qe/LK8FXB15VpwWaS3INHA3Xnswy8btXdFRThk8x?=
 =?us-ascii?Q?LQJ5ZAwCQG2FEpreaIgrBn7hrlt5VH0wfNbdBtM7hNWcKguQpHnE/xg2TtiG?=
 =?us-ascii?Q?pu+9GDo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xUj9Aj1UexPC/lX/E2R/0E0h0pjEAyiybhvNy0uOluIezonRYU5di78AoK+r?=
 =?us-ascii?Q?DBK+TY5TlTIrX97eWsCGzjrm4zq0sIw4NaH42ExZOXAvO55l/d1ffpmw/6Uk?=
 =?us-ascii?Q?Gf6H+4y65y+01XerVAJA26T8hbexRFKx/IgXL7cTTktrlrm9tMj6AkqGQOdG?=
 =?us-ascii?Q?C7WvzYP0/rj0tHZklWQjMvs7L9R3KovgygW6OoA4bbP0dPllw6C/zfDKI/Rw?=
 =?us-ascii?Q?y4ErlvgQsk7WyjPjZfgn7G0lvrZ6DlsYrJ6Y6ssVI9y0DQaV/KOh3dQhHqa2?=
 =?us-ascii?Q?PK+M94T3dWICpkfYPUMTvC1gli78RdhoO5agq4ZkVYe36jKyMuO3PX/8Zy1P?=
 =?us-ascii?Q?dDLhpdPjDwRV7hAnzF+EnIFw+QR7ylc9UB/zw9Nm7g8dCaF7nUPrsA4PmKE2?=
 =?us-ascii?Q?YgDPZ0fksmGDc+/ef/SORcqZzRILsSMxMgxZrArATETwItRxnkQtYpobm3NS?=
 =?us-ascii?Q?/JSVOYV6L9a6ajkl+GxXuH+j+4Cp+tSLtbGw30Y5R1xbZczu9EkuNbKWClnv?=
 =?us-ascii?Q?QMjE5YDtK/TDWy5HJvcdKTFtY7stmn/cdTitcXm+imQiFwZHf36BrHOnGMgY?=
 =?us-ascii?Q?fFSzsqyOUD0YWqlM9Jledn+NKdVD0fHzwvyi624Hv0QspJV0Ejl9AEk0odkn?=
 =?us-ascii?Q?d/HMnxBYoLAQhgGzL7KQ2axVZL1V03m750K0KtMEcJ1RWsIL308jj9KY7Imb?=
 =?us-ascii?Q?ZHDTuDAzLWQ2VXGPug2V3kJnKQY/PyodKXKh2Xm+n4xN7VPPZF88ySFWQg24?=
 =?us-ascii?Q?RAmzD1hiKYGHRyMAhg4qraYzYay1w1VDh5DFoBvwHEM1gISUUIT6hI8A2R3H?=
 =?us-ascii?Q?ayYkJmJ+z7CAq+ZL+SxvsOpCVTSHqUywjCldGxIkASt/bLw86upzrG8i+oTL?=
 =?us-ascii?Q?3/YV0qYeOdR5snkfxmrxDXhfH5aIM75489ChlmBLKN/osbxdwQrHQt8kj+23?=
 =?us-ascii?Q?5DYpXeiDJMYja4e68C9iACB9JfDSDl7f/QLW5RIOAW7Kx7XpUmyOA6z74fIS?=
 =?us-ascii?Q?twJDC9+VBI7wZRhzGqmQDw8aVmQyQ/kxPTPcvdOG7+YIDiXC1R2g6bbiuR8w?=
 =?us-ascii?Q?VOj+a9Z2xWZRGvNkZhT9rmgkB4183RWF190KOH7r2voKubAGJwCvbLQe5NFS?=
 =?us-ascii?Q?07JfkMi8oxmKEHV4T0PgWUwLrVUnYbanvRkSwqIV8GMQFyCwneEde8/prykz?=
 =?us-ascii?Q?d5BZ+tpf5TekTmCvTqEpaY7e54E4l3jN77G43mARw/o1H+I0YYl5KN1quqMp?=
 =?us-ascii?Q?pukDX4DbTIZDi4Lu9i6x3+sP/gu5NKfv4JLcj1wkrhfJOIZRzVQndJ7Z4WYD?=
 =?us-ascii?Q?mpZmbXxgmsCvYHFABlOCDxZ4HjjRpzpkyk1lcDfK5ofOK6GQ7LNV1UR3F46M?=
 =?us-ascii?Q?fFxcv1QU57ow5fNBTxZ3Mv6WOVzzD0pXqx+VvC10+Ssz0H9t9KtGOqOIJq/W?=
 =?us-ascii?Q?bJup61UVQqJpUWyRajhcXjLh5ualUZJlzUTQNnfKnq28Z/AzkAU8D2EE1JY1?=
 =?us-ascii?Q?Lyy/1dmh+8DC8yYJd2lYu7pumb8aRefh29jYX4FfBxWztygqEYSUCGH1AXgh?=
 =?us-ascii?Q?ZeaUTKlfQ0vacfG24aBBM406RoheUB76lxmMOZGdPCjoShdXxmDnc63NQaw7?=
 =?us-ascii?Q?Mw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7739233b-13a5-4d19-847b-08dcc5b32f22
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 09:40:56.1749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OboiwyQKnfA+6hnKufMBFOABbh4YTT9fej1YvllqHGefreSjehV6IOlOeUh7+ouTls0fMOU9WfjXYhOejZhN5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR06MB9577
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Aug 2024 09:41:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111950

According to https://pypi.org/project/lru-dict/ and
https://github.com/amitdev/lru-dict/blob/v1.3.0/LICENSE the project is
licensed under MIT.

Also change SUMMARY to DESCRIPTION as it's value is clearly over 72
characters long.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-python/recipes-devtools/python/python3-lru-dict_1.3.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-lru-dict_1.3.0.bb =
b/meta-python/recipes-devtools/python/python3-lru-dict_1.3.0.bb
index 64d50c308..236daca49 100644
--- a/meta-python/recipes-devtools/python/python3-lru-dict_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-lru-dict_1.3.0.bb
@@ -1,7 +1,7 @@
-SUMMARY =3D "A fixed size dict like container which evicts Least Recently =
Used (LRU) items once size limit is exceeded."
+DESCRIPTION =3D "A fixed size dict like container which evicts Least Recen=
tly Used (LRU) items once size limit is exceeded."
 HOMEPAGE =3D "https://github.com/amitdev/lru-dict"
 SECTION =3D "devel/python"
-LICENSE =3D "BSD-3-Clause"
+LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D9d10a486ee04034fdef5162fd791f15=
3"
=20
 SRC_URI[sha256sum] =3D "54fd1966d6bd1fcde781596cb86068214edeebff1db13a2cea=
11079e3fd07b6b"
--=20
2.39.2


