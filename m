Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36673CD4F4C
	for <webhook@archiver.kernel.org>; Sun,  8 Sep 2024 16:21:07 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.118])
 by mx.groups.io with SMTP id smtpd.web11.33091.1725812464353058893
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Sep 2024 09:21:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=Ar/4g520;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.103.118, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KnG5rTK33fyH8irAMwsmbdMlZSVtMW4tnmFPS/XpqmfnEmcGdcAhXyCuLv9ImcbYsq5RNJBXp1k8v6LgX0wtwxyYRtGnw5ttL20+HPM1AaensXK2yH+sHGKPdA/i5I8xwJu4hAHNrdE2AJu8OD5LJUA4i93wMdXb/ffuq8rOkgyjvcnz3PXsD6HH7ze8yKfJ6qFzcwmlFRkuhQS1ABC3MgU+FhdwDMxlprxsXdIHnNa/dGt/B7EEJacjzhcvLT0LtaumOB8w7WOaWFMMw3tKAHUdxJ1Uj6u++5x/5d8dp0APJIlKOMKghhvIqGHsrESmH0AjArq7EhTkgd4/332ebQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8MK83AYcJleWoCpKgAbAep8fxqKnP745gDENcGP8ma4=;
 b=rAGdU5P4poJ2o8KcIgj7yCX9WfDAZaj54CyjN6JrW313G+QkGoL37kMC6bQMa5Mk9eLjHdA8l6dGrgMnlOA7rEP1oDtNYE3B5oXewvrdighsYLWNYC7PUjGyST3GmTHJ720Lnb8ALKAN9qSoSUyx11c/mmilpMy4blPQ40LDsJ5JwWj8/qt3zE4Y+fiVwuASIv3mPPepxIzRcDjB9XF9jhnUb7qua+pXqI6+pqrbeIUIbVrcHZH47vDkKK4WIPzsde9bn6o1Eg1R3gJ2PaFRgoN9IBG+n7uPesBiPKJvmvDrQ+06WdTahT7ca+cqITIjSCt50UAJQOg6jqEV+ev3Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8MK83AYcJleWoCpKgAbAep8fxqKnP745gDENcGP8ma4=;
 b=Ar/4g520wI5NGQphwnsmqlljFX2JJmODj/Q2Ot44zoRs0GIyOUJped7cgNRBO3y/oVMVZuhQ+ijUTF6L3qn8Ig8uYhCPtphXwwYgKsGPjp89zizBCbo6e6xxFAumdJKRbCPToXMj3PspSo+WrVBbBGqP+1W425SsBSjIFv5mmch49RwCtcD89DrnlD2x3qb0Qgm9hsdzGVEWKNFsGcWTv0wqmCb8aS/byG0kFhijZEe9OveU1hD2hTo88uQLBzXLTEYTX58cu8K1LCycAhdcQyapQIE3j/1ePK3Nuo9C0vsHRanCssHzR4XxVYqNGOuz/s7wWv4dS2IDMYKa3VlbaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by VE1PR06MB7120.eurprd06.prod.outlook.com (2603:10a6:800:1a0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23; Sun, 8 Sep
 2024 16:20:59 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%4]) with mapi id 15.20.7939.022; Sun, 8 Sep 2024
 16:20:59 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: niko.mauno@vaisala.com,
	openembedded-devel@lists.openembedded.org
CC: akuster808@gmail.com,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][kirkstone][PATCH] opensc: Fix LICENSE declaration
Date: Sun,  8 Sep 2024 16:20:31 +0000
Message-ID: <20240908162031.4186539-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF0000382C.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:5:0:f) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|VE1PR06MB7120:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dc95086-f335-4a2d-8837-08dcd02239c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?BP+C6XZHJxvbHzhoJ6H08X42t56lnxSbxEeOPlze4PXJJ0dD2nqHNDFqLgtD?=
 =?us-ascii?Q?tKKjSgnLxmGfpn81AX8TL2BuSz4aEpAZR4Z3vlXDdKl72FtT+w6gHDKuSskY?=
 =?us-ascii?Q?A5Or5zwwO+xpnzaP5nM9EoLXqNrdB/CTB3sjPqnFWRs93ansyfhVWfg+u3ri?=
 =?us-ascii?Q?Z/hzXtXVZOml2ljwLYT5l/oWj7xm/fZI2ab+CKc8fbU8ocAzTUeWSwAvLstS?=
 =?us-ascii?Q?xjuHlPJ0fjuwk9JvH558aIRze13nSGCsetzz+9ffPETgJ7PgJiAI9/haxVqs?=
 =?us-ascii?Q?gtCl1zbmSnks6m69rOB7Y13lWUk8sb5vkAnLPVzKbiFBIaMLZ3DpXpH3v23j?=
 =?us-ascii?Q?gg6KMYcaQFEkJAYiUavkOnkL7J/XWT3pJQUQ+2d+o8iCOgTOIAK+c2dj0R/A?=
 =?us-ascii?Q?ikrKff5ktHz9gIUa3imOpKQePC7TImqlxWf0cdwckOBw90QHKJAc80kgB23v?=
 =?us-ascii?Q?z9YZSZFbgwiz4PZPNzQp6yX1If42StC82SyZ9tOEzOp1lN1ys13PuLe+p2bI?=
 =?us-ascii?Q?/XOwDzf0ZnMSjX9iT8xqbhK/BOOgG0t+46l8CEGAV21nMLTQfjBfyI6JA5NU?=
 =?us-ascii?Q?RiM8HKNBueI1GNT+nzIR9WXdRUm8XBEhqVIUDnXNydwxiGRrIrwu+jtvGU9g?=
 =?us-ascii?Q?xJ/qTMBM/Lr0E3+DYAf3ph3xcugztuQoX4pAadgFPmXRTzoTuHmPAuvEO7tp?=
 =?us-ascii?Q?Amg2FoNSavj4lv36g8YPSyrmrtAB6EvYSWXbRZA19tLWh4osutbw3IFihEZT?=
 =?us-ascii?Q?79dHTkkiiCo2NxLXj1ZBXQW0mT+8An48FsR6zSpqpCK9IGt4Pa5UJJsNpw+N?=
 =?us-ascii?Q?Vu1Q3/JX9Cn2CjZSz84G73aE62NFr/wMbHRLj17wTVw2g5KJ6+CI2LXfxk9F?=
 =?us-ascii?Q?x6B67NvNUzdiT9QAUSSRgy5xJwH8g2hX1I2whJUoRVH41kZA+cIsgZKARUyI?=
 =?us-ascii?Q?GaxjkmuZyck2EyzVOwsNc4RH/ERKxnR3kK2/kyNlXlI/84hcRut3ecCGY8+C?=
 =?us-ascii?Q?VFff/EyOIPrHmdYsajD0wIaXTTBG32xDXEhRAO1KnZ36bmn+Ct4Rs3VnSR0o?=
 =?us-ascii?Q?e+PnHihUfLKPUvUFiue50GGy5AbtIOvHxc2tuMehhtVoles1MUnhXXctGneq?=
 =?us-ascii?Q?jGd92s/H8hwyvQLVLUis7+hkVKe+V4CHETFD32JXayldP+8nT89y1FLiJunS?=
 =?us-ascii?Q?QWGq2Rwdfrd9+ijP28FrXwS821FOAuObnDoPAK3smWJ4CunDUE2xdsyA1cCF?=
 =?us-ascii?Q?Rz4OdvP4A0Z36NuY7AGvScuwypSNDP8cuuYjiOhcZaRb/nQ/021sHdexGoEt?=
 =?us-ascii?Q?CiZXBasggoTICiK5Exv8QNpAMWOBaBlV0Up8tHQJYn0l7AN85wjYTX3Nniq5?=
 =?us-ascii?Q?FuqmsNU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?w+ZUcUaGwpBJEbN1hK4s64dXHwsasRqx+Qo8DW25sP0uA4VS/1nJTnl74Tyq?=
 =?us-ascii?Q?8Dm/lbNssSH8arbtnvOCwyj8RP8hxPokRLKmSzav3nlvRbSxFt+yeZsxpUGO?=
 =?us-ascii?Q?XMOxrvQ/TZSB1ZVggEtYWI3Yj/PVCqiBB9w08ItA77hCNRSTX7FDNTK48CX+?=
 =?us-ascii?Q?/0rB3muVVHEF2Pgplac03YlRwVL5Ltt+z/XD/1CaiubLZ1nZdt9WduK1tO6I?=
 =?us-ascii?Q?Unee5Icx70FaskFahYCnEA94z1CFFs3aXh2cEX2eQGe4/PcrzfKptpJwaUpx?=
 =?us-ascii?Q?19aADjmnRgd6xuDjZ1KW7ledZK6K0tfR371u8EfcJYk1N9U+qAfttgZFlHF5?=
 =?us-ascii?Q?xs6P7CuuIgxkskcyPYvutcOB6dm8l5uDWwpSq4/NhWnsa2unMkUWf8wcIojJ?=
 =?us-ascii?Q?NDRwv8MlJB0nLA+Ka2nKp8n/zr43GTC3MANot+p1UgF9wyy/zuVUn26Y2Qms?=
 =?us-ascii?Q?9t9ycmRlP6R1W6bw5qJM0UzqROhoNst8zlzQzFGs5ImOK/rOqlkhjMBB10DD?=
 =?us-ascii?Q?I1YJ5tGKZXJZ5HZ4fuLGWAdBjhxmuLsNZPxRYdDsa667IX5Nu5JHsgT8atuz?=
 =?us-ascii?Q?ZT29j+eYV4cOklwp8Sj6VYsHO6w/DEPxyW58gxDAZdZxJ/NyH+VuRsmi3WaZ?=
 =?us-ascii?Q?AT6YvIogKks2Q5d301Tne+MJTnSxYX6FOlbyhMLwi4hph5fTrgyRkxZ14BXX?=
 =?us-ascii?Q?JTutHiUpwwtTlRj8DRWU7TOJI+Z+VnBcXysGJdJnVdLTWzidwhCCOE3NKqdV?=
 =?us-ascii?Q?ORQ6GZxWPUuOU2KyIYKoqsTJBZYxVoB3ozrgCECKblLIKvuU3wzvwFGZiHOF?=
 =?us-ascii?Q?qibgjzrVclV5VwLIOrQ03m8jBLjKVePscwwucFTTnu/L707fBRMjD6Tln/zN?=
 =?us-ascii?Q?ZCt/aY0oMSd55lUCZaFasdQAwHG+MoLc8SZ7NXZEjGFL84YC2FGnpKmrIlWp?=
 =?us-ascii?Q?6BXIrP1x5K4qaNEIALDh7vVn0L9dnhwKiDFxcTFbPcbPtmQYr7Xtpp6hzcU0?=
 =?us-ascii?Q?viD4JVDyTAkbxvOVfI/tCZWGbahaf4AsfgIvERXPolshWnLgM7L9PaThmQzb?=
 =?us-ascii?Q?04DyL9wPfPGL5GsAQm8rYgI0IAwxyW1ClwXEA3R4O8794PmB4yCxngSrzp9A?=
 =?us-ascii?Q?9bc2plj6GZTFj0rwE7OcKvwXQXgqHty/SIPAqdLgSeJkL+X3mBYFuZ4Rv4UI?=
 =?us-ascii?Q?dY675EpFOAN0aDR/V4XJ6zBLYFdSLw67syfzVgX85/Gg2wu0yqjq+rmScKHP?=
 =?us-ascii?Q?h3gQf4EoLrjbWnCu/nS/gW3Yn90vFRgtklygxMhjWItXc56wybosurHz3cG2?=
 =?us-ascii?Q?iACQditrJJ1lxIfuBgomS5s8UeAgASL8hC4LL6yJBz5JxLbk+OCqG8Df3HlF?=
 =?us-ascii?Q?ld6iaB2Pp/G3xGTISXtRKTvwBQPHJHOeGEBoIyOVODctWEkO9cDFotup68bO?=
 =?us-ascii?Q?eKG8VV6c3Bsa3s3wb9zLjkY9TMwfRuLBkKXA4dW7U8ioUE7wF9NQZ0900dsp?=
 =?us-ascii?Q?BWq3Q+M8iDaMhTcTx1+WWdwxKsXp7HEXU7weowKRMfjj04itPxv31ZxA7NU9?=
 =?us-ascii?Q?vQOh0Q6jz1QKCRnpFC263rflB6rJKe5qqDdpv/AxM4FTG6LW+1+2kF0qCebp?=
 =?us-ascii?Q?jw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dc95086-f335-4a2d-8837-08dcd02239c5
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2024 16:20:59.7745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ImQbYlp+wjBrq56If/yc6zbGuQOXBnXN80ClH53clwnRCsBQx+GIHLkloO9qb17trNlm6hSj9aOT/Fby+BxZgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR06MB7120
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Sep 2024 16:21:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112161

According to https://github.com/OpenSC/OpenSC/wiki#license OpenSC is
licensed under LGPL-2.1 or later, which seems to be affirmed also by
the comments in the source code files, as well as the COPYING file.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/opensc/opensc_0.22.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/opensc/opensc_0.22.0.bb b/meta-oe/reci=
pes-support/opensc/opensc_0.22.0.bb
index 770c2d686..7915d8913 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
@@ -8,7 +8,7 @@ eID cards have also been confirmed to work."
=20
 HOMEPAGE =3D "http://www.opensc-project.org/opensc/"
 SECTION =3D "System Environment/Libraries"
-LICENSE =3D "LGPL-2.0-or-later"
+LICENSE =3D "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dcb8aedd3bced19bd8026d96a8b6876d=
7"
=20
 #v0.21.0
--=20
2.39.2


