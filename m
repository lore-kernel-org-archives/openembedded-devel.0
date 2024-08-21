Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B52AC52D6F
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 15:34:35 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.100])
 by mx.groups.io with SMTP id smtpd.web10.22909.1724254474332998291
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Aug 2024 08:34:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=zxNS043O;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.247.100, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sh5H59oaoA/QhWqf6ELbKOCKXaQKE2NrWyQznJ1izFEHd4NhDyx7Uo8EQqTI4cl33LoYfWNkBIiveRhpdS6Xzh54mh9moSQeMNKdbVHx97oWlkDDGL7fC280t9BnAAzP/F0ze+Eue4AzqfNazG89O31Q7gjBcd0Jsfn+qE5j8wMVpjz7eaOPoylYam+f/6ZbscLnKEHUHHLUdNYyN0ydgIcYDKQ6Y3ieW7xlOTXFVgWP7pA33cwL2Bfn1qLbB4wi7ZgXaGgM9svDbQefzs2tLi/X5+oiMibHGLrjgK82TJ5Bol7ODKOSLuCnZDIigIEBaYQBB3R+hFPJ3QsTbyeK0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HydupSUbtlK1lWquejMp6NLvZim1i2MdL6E9aR/Ck7Y=;
 b=mLzBNXRGBu+D+y+s1tFVLSQBMC9uR4Km7g6I5qlKX3RFVzcu3tGIkU8ejacyvWXccwhUnR8aLK/s++dH8jtrq/KF3WACkYW7Aw7Jn8IOIl3AGS9XPrxUqx80bA2WsuP4XgIdGAz4aluccvsQ8IGUh5vIEece+Kol/hIh+Kii4GtkvehKiEieEHiiJum3yUPOXc/Pj4U6ilH95DjZChrFXKp3DCHR6/WEpEWZzcL1GgjnFJN1Xt9gbqQVwfpXB8WZWUiObxRiKG/6Ys6+sLxRX2ykkxKNrn+cK60E6yjNxyt73vAKViCLu35krdlcAl8Ovjgl4odpDKHQoURm3AAzYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HydupSUbtlK1lWquejMp6NLvZim1i2MdL6E9aR/Ck7Y=;
 b=zxNS043OzhlBlvcyZvWrxAnWJiKsmxBPC4tJSJ2i6ANl8oEMjv90AqUpRI2dAqi8+sO+5BaN/p4uTsQzMsTlsg3/UOlcVM+sENWcOI3DQyoWAJ30mVhs5rTYuQTlq1DSW2I0qhP0tt3I2g1RZ/rvQFOYtx7Y57xUmC1NoSPHAwQ37g6jt215CMaMrX+3qHh70pNmpREloc2A5KqM1WmiC39QtM8453uZaQugG9NSleUsHjsGfvHeSjiJYKrTrEEMNkqd3kWYTA00xQHtk/FSX0yXIna5VpBDcvYbr9PXkqlGCxz1kiDSKDxU/rnNGjOEMEjflrZfdZar7NgQM9hasw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PAXPR06MB7662.eurprd06.prod.outlook.com (2603:10a6:102:159::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Wed, 21 Aug
 2024 15:34:31 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7897.014; Wed, 21 Aug 2024
 15:34:31 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][master][scarthgap][PATCH v2 1/5] opensc: Amend FILES:${PN} declaration
Date: Wed, 21 Aug 2024 15:34:12 +0000
Message-ID: <20240821153416.650175-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0071.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:a::6)
 To AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PAXPR06MB7662:EE_
X-MS-Office365-Filtering-Correlation-Id: 5df3307d-f236-4c7b-e8af-08dcc1f6c01d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0n/Ybq0HTITiuIhqEcx65ZVI0j03bQvCuDSfg+TMrkZ2wzndpf5XKolzRy8p?=
 =?us-ascii?Q?2/UodLVvXxHBQhNMnNAkYubFFdcIgmtccbSX3RXuFM1h5RWqJxlfv7LDcvi1?=
 =?us-ascii?Q?JCSxDNHLk/T1+kHeMrHOAjhX/m7usOoQ3U9MerIbhR8LPELU8W2VlRt4pD42?=
 =?us-ascii?Q?SLQZIHQCa9Urfp5TWRZYpr9SUuzCsfPmDn7q/L1V3/wJJKrWCeZ2Cg3OXZ4L?=
 =?us-ascii?Q?iRssXu3EFaTAqRNz4ekdGUHp/pjbeMjpr3XiUiSG+N+CW7fo/oqSKBcvsMuR?=
 =?us-ascii?Q?AGRXtqYYnYIjC2iiW+9qMHQIV6+fIMoHXie3hwcwXxfnr/4BJKHPadWdoNvm?=
 =?us-ascii?Q?gwFq9xDvB+C3yyDmUw4R1yf6MhVAFkWFAWWY7R77reKipHoTaGcKfkHSFY/6?=
 =?us-ascii?Q?fyHkxtL1JzS5oo4D10SC6T0DcYzQgRPKk26LRimDPtSdmkieDd8ZrbWB7oUH?=
 =?us-ascii?Q?rbQHQmh3tnn7EHjLdF7rCikEI/FoUwwoAff/bp99jtinz4bzdF4+PWR2zI8P?=
 =?us-ascii?Q?9EFfsYcM4jI62R7IsRRDIh1AS/+2rptxfOUnWSxJYpYJ/BAQ2KbeG0hO/v5y?=
 =?us-ascii?Q?CcOtQXpKvmi13nvFh6Q/wTc/1GEAzm4Rl5qXmvrMkIPEbMyGAwGWTIURPaEB?=
 =?us-ascii?Q?6WhMtXx/7SpBfhq3crxTqaJtKi1rhmvU5Fi9Am/enDeQM9wy60kU2wOVBTi1?=
 =?us-ascii?Q?/cUJy9RERvX8ViDHftBS7w8k4lVpzKorS+keftcToTkHJ69p37g7iqWzMEaY?=
 =?us-ascii?Q?VeGPuTjA19hK0cJzdL/akvuUcgcoL9Ab91/0Frt9ta8HGmTnNAF9hUw9sP2I?=
 =?us-ascii?Q?M3YkCSH+fGYObhtQEBOwgcbUTl/xcBdKIoGfaQ/tllykFxgH0ak3VUhXQrJJ?=
 =?us-ascii?Q?GtAFLJuFGmBEYGcojVwpmhV5/CJa4Mj7VCGzKn+NLEt6vFdY+fwr+JcKjv64?=
 =?us-ascii?Q?tAktg1X9c63Gh1yvyppW1l7uSUkj5rP1tlu2tOdwiNf8jv3A3DXFl3TLd/dx?=
 =?us-ascii?Q?9bfDh43MGx7I5KnBvK7uDqwnNU2MNnpjhgu3QeCzYcQWkhmBbxGXWVA8/0kj?=
 =?us-ascii?Q?uQG1uV2AahFc80CmBFx7s82rF5H9EssocrWz2xpkpSGXF9NEoDwcJapF6T0m?=
 =?us-ascii?Q?BT8JvuU15yy7frUGVAMW3DGc67SfwELeK35pXhO5kddry5tnbaAdvv3fB0YJ?=
 =?us-ascii?Q?rbdgDfUONyCSmvda7LeCGO9XujBU3Kus5Xp0gh1ytmwLuvWnFIZ66gdqVu81?=
 =?us-ascii?Q?rLnU5MTI4d6nAsgsNBtX12nizc9oZouQnwboJ4tV8Ear5nbcLeqT2AVTBSY0?=
 =?us-ascii?Q?14u2NN1Phl+dOi8GHitZokeIMgd4GsaWV8A7pdWw6dFzBXBdBlTN5xsvf0fg?=
 =?us-ascii?Q?097ISsaL5fjtDk7kwAaNPXYlMGnFP3UBjKkXm+gJkcodSE+Azw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mUJVeQsczWKGndcLG+N3OfjyrT07QCBrJVFHMN93Fw3aVUXmbKyXj9Fv5cQO?=
 =?us-ascii?Q?r6701G2Z3WK4mGqNt4xQKjwJzlkwkjSXg/QCxxQCzEENDAP8Jy0q9/yYaIKP?=
 =?us-ascii?Q?vHl9S3q2LFmL1ysZ5U1nhUMR8QImppPV1sNn4JiebXnS5XqT3E/FIBTIyXSY?=
 =?us-ascii?Q?q0oZI4gJ4hBcJQVey2yfLY1NK/a9hpGNn3lpy9e0gTbpZixLQpGR9IWZkhRI?=
 =?us-ascii?Q?qeT2pJfhSvCQKVQHM2uehe8Jk0i+SVlH/B0AH67YMAFbwt3GPFIECIuHyhNV?=
 =?us-ascii?Q?o/1po9esGHbBV/qn9XQgvdpQZmpXcF9j+KdkQ2AUVBeKdFNtiEcQ0gq1jkWh?=
 =?us-ascii?Q?7PpeE5QbNAzIFC4hZkJC6mSMEGjWeGhebPCC907lKUvrJjpipb5NHScWcfvW?=
 =?us-ascii?Q?FA4CwoiXfpvar4aOB1F5aTReeWmh17v+qTJA7fpaq1Vwc7j3tTVuggZktSQM?=
 =?us-ascii?Q?XLsE9Xp/fjcqR0/p+s68mLapgGljUVoDrq30Y7u3E4EXwJ+lvrBIHP0a6dpx?=
 =?us-ascii?Q?Q9eqUyglUrWnU/coT10gMP8tuD2bK6s6ZmpTuaKdxJruL62tcH5W3rvva9gE?=
 =?us-ascii?Q?0GpE6QjdpX9ucM5R9oMQ4nG+CzKkVuU1BgT5iAePuOmH1cEwdJ42uXCg2SBZ?=
 =?us-ascii?Q?u+9yhfPD9eCwdt5m6uIzLoST9sdDlNZmHK22VzYiIsVrs3C2eCPsmTsXFIi6?=
 =?us-ascii?Q?m7M+40FTxhXpD20PaGrBJL3m5fCjm8dpkbqA3PD9zk7N02xnlTJe+9fKTr0i?=
 =?us-ascii?Q?wsLPFtzhHdO0dSo5wwqekJvGA4r/95W4N0s4ofvjX3xpfOwfdt616pwtIJuL?=
 =?us-ascii?Q?ygvf0R63K1nKzk+3disAuEDaQj2k0Bv+V8Bhn2GTYJOcWDb6CPLFRIQUl80C?=
 =?us-ascii?Q?S4pEIMVeyzVv/yRmpCdGGJqA6NSFStDRHTzYvZ1qfkIiX573LrFQivFl/oBV?=
 =?us-ascii?Q?EU+baDptgy01Avb6XwIRB4pY9NmoNqKcX4LWti6QFFmcknjm47xi/fwyU7cn?=
 =?us-ascii?Q?nIK41pe3bnoiOf42slR6OAPvH+qgk1o2cLpM0XjhtlgQFhKmcfywabPyjzQg?=
 =?us-ascii?Q?isRjc3qT9PSkRCXCHaljJYOnrZDPieYbbEnWUqrILNOq+qTJwR/cDLmZZx+1?=
 =?us-ascii?Q?nJ1LHXmdCMTbHTpunAEi+Tq4flc+O11kEg5N+JpBNM41h/VdckhY7piA0Bnf?=
 =?us-ascii?Q?xcavGzK/uTAkPy7agH5caYbdz7l0kEbxrf29suPnGRv/D46eZU3xzPo7qh9E?=
 =?us-ascii?Q?V7Jby5QrMTCH+m8f5RCOv1xoogopiBkaxuhj1On2H1SobL/+ywdL6NL0+HCf?=
 =?us-ascii?Q?gBHWrXENSRuNMPGuiWyBovS+8kSrZmsvQ1G/7M5yKcsoO1oOviIfcTwI3KXW?=
 =?us-ascii?Q?1t6QD1Maw2vF3fEnFDLRZlRTZpibGSDHWskNlqJOcMYs4uXPRUNAESH7Yslb?=
 =?us-ascii?Q?K3GVhwY/2R7bcQ6kCrry9uQsudIb/fHuBLdPB7Tswz2GZKhs8VCicG9kHgNa?=
 =?us-ascii?Q?OU5eTG6kuJWTzfb0h12JIameZQiZgC4vaRBTWlrJP8ttGcXR/Fzd41lUJNfK?=
 =?us-ascii?Q?G/jm5wEKPwxYSpfYa+PQ8Xncvf9BEHZC4vhjR9Ip9jCsiD4r4KzrUveLVDFh?=
 =?us-ascii?Q?WQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5df3307d-f236-4c7b-e8af-08dcc1f6c01d
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 15:34:31.0918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LwUY/fu1tLZaQ+SKA7HLyxaYW2gG28zz7wIl4XvBQ7QjwuCb0PdKOa2MlFL9QrV/I5VwLfXyzMqIj8s8ZsVkEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB7662
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Aug 2024 15:34:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111890

Commit da68f807bd718fb848acc792fd9326df719e0880 added the symlink .so
path to FILES:${PN}-dev to fix QA error, complement the operation by
removing identical line from FILES:${PN}

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-oe/recipes-support/opensc/opensc_0.25.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/opensc/opensc_0.25.1.bb b/meta-oe/reci=
pes-support/opensc/opensc_0.25.1.bb
index 19fb78092..145bbfe25 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.25.1.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.25.1.bb
@@ -36,7 +36,6 @@ RDEPENDS:${PN} =3D "readline"
=20
 FILES:${PN} +=3D "\
     ${libdir}/opensc-pkcs11.so \
-    ${libdir}/onepin-opensc-pkcs11.so \
     ${libdir}/pkcs11-spy.so \
 "
 FILES:${PN}-dev +=3D "\
--=20
2.39.2


