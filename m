Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2595ECE57D
	for <webhook@archiver.kernel.org>; Sun,  8 Sep 2024 17:12:27 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.123])
 by mx.groups.io with SMTP id smtpd.web11.34076.1725815542816309636
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Sep 2024 10:12:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=xaoukK6Z;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.21.123, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JEcYwHyTQ61tCreSJnjXhIMhaEgs/xzDZCiCEIZJ47gPzS3LFr/BK2tDpNM8tH/S2HF/TYlOUej1kDTlZg645zPbx6aS2JnxDgXScmVqk204Jw6i7q+oRGxIOpoBPdCNEh+xquji2iQtOZ399tnN6RPkEXeezZqLDA/Gfn3K9D0Xn0cBLUB+YadHiSzvrmOudmOS0UAKlsNON8nHUzzVLtvWExt9ZSfAlBxYmMxmbrYlWyzqN8id3iA6i6SWqcHdfGkaHMPgHKpqtBrJ0plqaO0Y9c+0G+sAnVXOxVBCUYNr8qY7SIzNGullhPcvJdwjoyM6hJkUkNEfLVcS4/MsZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VAYKdt5OqaWxYPyB5Vl/Az2/enEX/zL8HTHvmicsKcM=;
 b=MlvAbT/9wA4nqieI+nTx12C6MsGRKMtJxGX8lm/9r25luPupwR6BkUybknmasFBvDngmc2tCKkvvfuBpo2aFNycXfRXcNqtbiFj1E5+vmTzSYTUJi83iKMnT3fG7ZAmup3IGkfrpP3dm8vJXhZzGDoAd9UgOOSEVv0OP9OewlkmDS7znAXlkSIZHaF9nrk+MRyqMeLeLXElks+VH+qFfc1SRPVgG155XsJxE0bg97V8u23FXRh2rVpWHQR1a36LKbllrwp5xRMIz6CWQYLV4OcP69UNnb2F/7lRSyne1lqt/508ZTinQ2WUFBIGJfXptweHOoTDpFdHlCCBs/j6rmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VAYKdt5OqaWxYPyB5Vl/Az2/enEX/zL8HTHvmicsKcM=;
 b=xaoukK6ZQpPiiAQIy4L/BpaCajOC/LzXyisBLwMQacAYEInvu6rWjPUWgkYq+utS1zmyPtv3NHPOTe8HIYX5LcewTN16PoKUQybbajhVC7rEVi5AYipUw9HTlO6fewvy8zmCEdc82IQMn0yEJbJjdV+kW4NdzDHU27Qq6kPsbgm7XDt2YkmH9AR3i+dh13/EQ3PoX4o4WSNG8qwFc+Hxz2SwLFzPK2EQVO210i33HpXdAZBABY7Brwb2DGr+uUnGDgT19MUnQfLlFAcZibDw8B+2QSyPsZjv0OXwnmAfwjT42VOB0LXcltLjg/OEds0IF8RyMyXbELyqEtEOUo5x3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by GVXPR06MB9098.eurprd06.prod.outlook.com (2603:10a6:150:1b1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23; Sun, 8 Sep
 2024 17:12:20 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%4]) with mapi id 15.20.7939.022; Sun, 8 Sep 2024
 17:12:20 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: akuster808@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][kirkstone][PATCH 06/13] python3-parse-type: Fix LICENSE
Date: Sun,  8 Sep 2024 17:11:34 +0000
Message-ID: <20240908171141.99382-6-niko.mauno@vaisala.com>
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
X-MS-Office365-Filtering-Correlation-Id: f7e07e93-495d-4553-e32b-08dcd02965c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2KzKhF2ali5+jY6AVUVIaJ5K/R5XLoBjd4zTD8Ep4IMjVyT2nlZZ+kcr+rw+?=
 =?us-ascii?Q?qbOST7smkFjXoO/MinUvwDRP4aA8GAPjqFmOZGTNDs3YLvP5zGhZSAMn0Vl4?=
 =?us-ascii?Q?kJI9IWu8wKQwpVMiyqPusyzJ4Emb9yIrz7n2S1HDDUb00KQhxDmNiQ2oGDDd?=
 =?us-ascii?Q?dg91+bX3ASgw/wkR0LFsp5uCRygcmPKWBbjkgs0O0Xiexc/7TZhn+zFrKaYq?=
 =?us-ascii?Q?I/5XoQHfZdn26KJQ6l23JzV7xVn0de4YzlSiWn9E0fJ9ioZ1v6/j88OOBEjg?=
 =?us-ascii?Q?gHl7vbyMDQ0wsdEejMvjlV53HB0aL7uN0PHeIBus/Y0h73jQoyVCbyev6NmK?=
 =?us-ascii?Q?5E1g7GLnC9MRWbvJxZFewx/t3Bcn8LOi29C1okGi34FoWo65gKc2qrVwvkRI?=
 =?us-ascii?Q?9eQ6v3U0PyELNRWQ6nipwQ4eIknxoBhLHnXe+VIsDoXOuv/TMCAvuN32YwJx?=
 =?us-ascii?Q?U4Hi+CP9BWygAV0k9BRaK0Ert2rRGOLgRpG6BmSSbROpT5OHDYs1wWudfQ7A?=
 =?us-ascii?Q?JhaqycEPHM4xdTCi9WFi1je7WObPCZYVEKcdwmSRrnxUCNU2CjaxQ71hExOf?=
 =?us-ascii?Q?PcmK4X7UU5PtGOol7Lt5qlOEeF6UQgcxYN4/fabwjWLNOEdm+UmfUZ/wXBui?=
 =?us-ascii?Q?l4AmqEOpCi5k6Ps8pcQ15vPdtxdwMxHuWrlHBIU9ayYqeA43RWKO3ecc+TlU?=
 =?us-ascii?Q?RQmmJqX97JVyGcbkUeomSIKapvSICKvQINuAWkBqFEh1PhTvWX03uvne7qU6?=
 =?us-ascii?Q?mXYR1CAMIR+qwszfyXeo1abqYV0Si64n+SH17czp2ZBEafLT8ADYpWKXmwbt?=
 =?us-ascii?Q?rpqwlITSLrvxopuNS4vBQH8A3KXuwEw1CWfk+Hnp7gwHnudzoIRN/LQfmcc5?=
 =?us-ascii?Q?E+4QvUUfX4CCATuLCdwtpHx443SaSbjFt5O5SM1kxTreGaAYm57wqSleIGdD?=
 =?us-ascii?Q?ncqwzX2Qge41xym9zPG+03Xs8MwOh/93uGXs4yEIIMkv3FTDMoNcjwbisEUZ?=
 =?us-ascii?Q?U9uqPLI7N8/6RQBruFu3FQq+SRLZCslwdxv4WRNopkDY2zY/NQmnwvLOdbOo?=
 =?us-ascii?Q?/HfBPujt3MLQLhTL7XXPZNYTJoX3Pz5eiunbG78Gm457zbBLPBAhBkS2ZTsa?=
 =?us-ascii?Q?Ci60xDkm9fCIqdm12Wo0Tfqp3nW7q1UpL+LfDqv+cbH09QjhRMzmn63M1hq4?=
 =?us-ascii?Q?IO1QsKQJxPJYzSbe08etMfFRYe1nFck6PpG9o8ioDrzENbkPVaMg62N79+po?=
 =?us-ascii?Q?OwbtU408brflMnFmI5fzcNzG+l9I9jbJCnpPZATtVa+EZUFhOUby9REucF3b?=
 =?us-ascii?Q?lQRpvQ2RVl6LB+06ygHidhpoY8f09TiB6wCu0LR47EYoxAGq21WCB11MEtWC?=
 =?us-ascii?Q?ctNfoPxcstTxklPT4ca48YNyqqqUIGvxmPkp7/52CYaFx3w8Gw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?idAfixVfq+cJUDP1rwB/9zCxVT5+kRfexZq/qWsZQmjgyN0szA9CoFhyMZC4?=
 =?us-ascii?Q?ndgO1vJgjb/OsCt+tj9GROtGGs3acZfdEPWwuU5np3hNDgzGdZkpEqIM0MDC?=
 =?us-ascii?Q?VMP87egjhhmvSoXRPr8ODbrtNIv5YhZTPZsFq6RwwRY6DTXPSn/TzB2PLc+w?=
 =?us-ascii?Q?AOjtn6m5qOLRAnWt327DqbxxPuB2+xt8aYoOLcaYfUrZjINZts14rfazBaEv?=
 =?us-ascii?Q?YbXP0m5ELqxRPMpmnmXslkbIg21yteTqKcvR1eiOuM/1goK7NapDbVNvTwYu?=
 =?us-ascii?Q?FVLt+N3SZpLbGhewT2aTVGdeRD5TfiGdPFrVZC0yyNmxVSbMZ00wyAMYkbxR?=
 =?us-ascii?Q?vHasX2BC9oGBVoA6KKaFvBer9GF7KVvs/FKy0rSKfq+/AFRygsPWcif8zqFG?=
 =?us-ascii?Q?psh17VTQUefjeSpw35wuqqmkQh/EUxEUTM4yyvawJgbSY7RLolkmND7q1c3h?=
 =?us-ascii?Q?Vv9ealj+hccsX4FVRW7fP/HwO8BQZTWPO/wZZqR5hRo+VjEASfcPaiYcZEYN?=
 =?us-ascii?Q?ve+kXsrnyPEV7RkH0ZEnon8cJpk1o811YxrRb/uMZNZp1fRqdSjJDuF3hURH?=
 =?us-ascii?Q?tPH8O9anZd5PUXfxZ2o9iRUOqWhZY9oLmCKoQpzL2X8O5AiDsZMg/GaKhOfo?=
 =?us-ascii?Q?nEL/ZPkk457pKmtT1740ypxGnL7QQZlbP5ApKoX2xKO/2QunNTLzDRhTJMnX?=
 =?us-ascii?Q?r2UnkDEoy1PZef+UmR5z3V27qHQ/rhfPw8VOMBBOAqkud7y/ME0EOTXhtZ+O?=
 =?us-ascii?Q?M8qsBM8hhNRY1Rw57RjgI9v723vv825/39fwASp/TCezYEJMur4O1v4Q1DqZ?=
 =?us-ascii?Q?oF2AVL0LzS9UyRSAbhAOaLCFoBYKoItJioy9O4NPwlHVI38E5ZUSdegcHoHQ?=
 =?us-ascii?Q?sUENyGwX0/oY1+MSMr0Yxerm/Irraxx6syjcG/P4cplAgb6UEANaNBIqLKvO?=
 =?us-ascii?Q?kjUuTZMBReuJccM8vuKm+u19o1YlUXs3Q1pW5C1KP4HWPtgzpbFUrLbNDgwm?=
 =?us-ascii?Q?wmMYKUWJ677sgwwjppbpuQoqq0U8gaqv+QZUDrvuk3AfsKKBeLxXmUXkqmfj?=
 =?us-ascii?Q?taS+P9JgBIMk4uMiTlMJkx+GjLtfSNrxZJUa/AjKoSj9kJy+HTszhpHao2j4?=
 =?us-ascii?Q?s9jjsf/ivu27WysWzU0Z6VbCIJtgKZDN3FaZRO0939X2sSPtToCb4g2pUc64?=
 =?us-ascii?Q?Kpxe6P2IlbxP86hxJOSLeKFbTVlGzAFDsBKmyRDyBzr0Ct3LCgseCtXjPqXE?=
 =?us-ascii?Q?03fV65jMg4zBuJUQOQEYi/V4dSlOdRmq+z5JlE+LdkkUESu+aF474LCXEkwO?=
 =?us-ascii?Q?kmBL2lpiTbzKU7PkVN3xYvS0YBvtUItWVSUHBjThhru47pKk7jzffhf/0cJK?=
 =?us-ascii?Q?fJEHHUOHF5KiCuoGtwhi6f9qn9CtHqdovsMmypDnuADG/Jw22fSdG5Ui+FJj?=
 =?us-ascii?Q?kEmpapvfi1npgyo7wBY2J197hJYeSC8Gy+G7tDhVMHx/rQjY/cYONOzBTvuo?=
 =?us-ascii?Q?qOwYS0s5yRLbIuhloqDEGQZsuxIGqei37xEDDIIkfTyIsdqv2oyafmkJryiV?=
 =?us-ascii?Q?QlMguJR44T/Y2MuOnEnB2lr6R20rIxmj6QPD0SIYXsmejR+IPvqBVcNNA+cL?=
 =?us-ascii?Q?3w=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7e07e93-495d-4553-e32b-08dcd02965c3
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2024 17:12:20.0479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nW9ZAPM2TNL9NjLMHIHz0ojUGhlMbGdiGvMAjbVV14GCiqreM4z8eXVLBxv/jv1VmM755nNbEkYGm9HNrnH2kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR06MB9098
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Sep 2024 17:12:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112167

According to https://pypi.org/project/parse-type/ and
https://github.com/jenisys/parse_type/blob/v0.5.2/LICENSE the
project is subject to MIT license.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-parse-type_0.5.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-parse-type_0.5.2.b=
b b/meta-python/recipes-devtools/python/python3-parse-type_0.5.2.bb
index 7eebbfb50..3a59af1bb 100644
--- a/meta-python/recipes-devtools/python/python3-parse-type_0.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-parse-type_0.5.2.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "Simplifies building parse types based on the parse module"
 HOMEPAGE =3D "https://github.com/jenisys/parse_type"
-LICENSE =3D "BSD-3-Clause"
+LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D16374dbaeaca1890153edb3f4137122=
2"
=20
 SRC_URI[md5sum] =3D "b954062f14ab723a91fe1e2be15e859d"
--=20
2.39.2


