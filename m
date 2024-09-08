Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99D37ECE57F
	for <webhook@archiver.kernel.org>; Sun,  8 Sep 2024 15:34:46 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.131])
 by mx.groups.io with SMTP id smtpd.web10.32311.1725809677520700433
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Sep 2024 08:34:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=MAHyidFZ;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.21.131, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MJLg47hkl7V1FlSw7gvBTqSqPHKFOwO2WYTF6J0UJbO9T2GbE7H0+RuEBakT++w/GU5OpTR+aGSa9jvyItEx7wSOdo2jdE/ROHyYi/MBi/P9XHLX5Obq9YnxQAm3tvhFFmUvVqPMOx8D3J/SnayoUrpOBQliGf7PRFNSm8z9MkG09qpYiO1P+kJPHPiSM27IVRH7qKaAu19G7O1AdVoIXc7FnxN2nTIInVFGxV8Udrb4PvmEvHDWvt8KqKhrZdp1l7HckIMRv3HbysATntpjjoNr5DcWcW2nRg1625V1CT2Cq9fg/Z6g4ppuCbDnihgYybzk6Mt0GohdUC6r54CYAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xfg3rkZfleaPqN5SCnhHL64NVKcoiCt/+/h984Q9keI=;
 b=fhpXH7U8WFfXOPmwkWLPnMqlEtu8M67HKOHPUJgK2UCRe0y1I60VieamL4k4NigMKCLKMjnoWrZE3ZUVdphLIzQ7D7iu8WYmCO9fy8XlnoAjLa/bCwzLCEMchlBEC1vVXp+AWa0gCttBvcBaBLyhHm2kPvTgakA9r5pDR1RdqE5GMhxrT4BDmYwDwDL3+UTCoD9Ru4bLoOIr0dDsusYmmxxatDlnpopAAtX57mAnrOrD3g7WApnWyhwS/JbxZCGPkV+jKRiATZ/cqeAhZgn1TtUgF+cnhH9SQfTtnKP2exN18oQOZGdKz4T8brpghdg0OM1Oj3ZHr09TSkhQUY8upw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xfg3rkZfleaPqN5SCnhHL64NVKcoiCt/+/h984Q9keI=;
 b=MAHyidFZ+XKlpLwOAPDXhmM0Qxv8SE5J/84vGwj2qTDKsnRnbT0hJlddkI9TkrC3P4jcZ7HIWiIPSxoKfleqcghCwhRnMCsHly7sOOp9JHMWafGFmXgX8obSrYnlNHACyTGTdTlYA2Q8jp/EgtlRc+2NrjtvyyV+z1MJdbnt8S9AzGL9F+NM402PJwyDfI0fq9e9Y23B8Vz4W3/uu1fBYg2jxob+NboJkfJmNwqcGA+/WeDSrOHxm8G0T3bD2psnq2tJS7vUblXKyvt8nTIivyB0tr2FAkpgybYESP1aBymBVMLJWmjftah3gSGSM279qhMTIsTtfCFP4eD7tJE3zw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by DBAPR06MB7095.eurprd06.prod.outlook.com (2603:10a6:10:1a2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.22; Sun, 8 Sep
 2024 15:34:35 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%4]) with mapi id 15.20.7939.022; Sun, 8 Sep 2024
 15:34:35 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: akuster808@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][scarthgap][PATCHv4 13/19] python3-nmap: Fix LICENSE and LIC_FILES_CHKSUM
Date: Sun,  8 Sep 2024 15:34:02 +0000
Message-ID: <20240908153408.4114753-13-niko.mauno@vaisala.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6557d097-bb27-4c3a-9282-08dcd01bbdf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Eks821QACyiOlTs3kRNtQDY8v9Z0aswrOR0KzTO6lWfQYJbFACq9Dmuyuc2b?=
 =?us-ascii?Q?irzFtZvKlaP+w/vuvNQnJN1xGtYfqByuXfVz2i0iBVUZl8CJYG9YR39tJLuo?=
 =?us-ascii?Q?Xy70Zb6ryCnT1LDMlxIbtdyBkKjgfY5GaJJrqGeCryh4zOK7Fp+eTpc06qJ9?=
 =?us-ascii?Q?5x4/nQQCDlV75BQ18rZ2c6cg7ZXlZFAhHrBPiRi0Hq9Mt67asTC2KI15DEgD?=
 =?us-ascii?Q?s6z+bSJFZyAPa/XJpTE7V3s3OM15u/GD79v0tqmxQ3DOrXjYra9u3r98d7Y6?=
 =?us-ascii?Q?wCF2PydVTggFLYQ+wsZVfxl7d5Fq3EL/vRuuvr9+XDh8nnr5fyuJH0+Uc80e?=
 =?us-ascii?Q?pr2iKDR7fwK84QtX3TYQyZW8DKqkZyQPeAXJdIU/lsBsq3x89w8fhBh1orMi?=
 =?us-ascii?Q?d5CZBu0qkJpqeL6zS8oeAgGV+bQuRBukb1EZ1TBKB7/5eru/e8NCIzuzVYN6?=
 =?us-ascii?Q?c0v8B7mvS+wNhipuku3UJDbTvAG0/wDVTJB/wgl/yqi1xjbd+Ycqnfi66f/M?=
 =?us-ascii?Q?z8QTsZpPZWB4ircTQz4wv8d3vM8yZPlUobc+Ns3GWSD5WfzQSXiIH1331t6i?=
 =?us-ascii?Q?5cgQHr8dDQfJgrGkKj88AUn14m9Tc9MwD1Q8fmYtHRZuff9k8uEgTwd8Mt2d?=
 =?us-ascii?Q?0nkq1nVMIw1pv0LCpUJwBS03/fRNwjzydN/6/GsPjfVQUvF0oxcrEgvFuB/V?=
 =?us-ascii?Q?Z/G5STBIiA3lqqEJkoNpqZS7Cu9AFkj0vDaMVR99ylOUcFn1RSKeknibtmz+?=
 =?us-ascii?Q?2HcBh72himns3/bEd38WRMAOJ6dgxkVw55pfbLRSb39KXAogJUwV+W+/aPHr?=
 =?us-ascii?Q?HBJQZQyRbYpV9XbU/t8SHIqgTatLssA0m7I0ul+BtRGgSyLF1D0htYjocLjc?=
 =?us-ascii?Q?JieQaWAghfE3ayjzfBRe1Vb2dXZmcw3qC2RxJYO0Qe7Hf4yBuVzmrMcrwksm?=
 =?us-ascii?Q?QbGLZQwdqfiIHJP0z/WFZfusEd5txkh3kGSo/okOiTf6gImVBNjJTwG2sa+l?=
 =?us-ascii?Q?+lQtZmXeQVSRoDr/8v/V74tTJUY6JvcuRqIfWnq+jdAfubn5Iql4rXJ0ZRw9?=
 =?us-ascii?Q?+zPmg3uciKFMjXlmPyCysuCil3XXi10v5zjR46EbzRVin/WNChSvpRAQFyKb?=
 =?us-ascii?Q?joAjFMnPYecLnn8tOv5C2xOnTuaxlKHfDx4RIcgQirKuYtAAnmlEafbvQzWn?=
 =?us-ascii?Q?LQc95MjcEhCQic9USAL29avQULEOGEO2OgcQewcuvcQYJjbu7rf9Z3ZVfYvm?=
 =?us-ascii?Q?UJJc27Jh9NpwGLHQDR3U4tXDXpLgEBRHEhFfBbZfoxqyjfkQwML6ekfcqUyZ?=
 =?us-ascii?Q?2gHFZ5KPmfdgmKz3IJNCQOY+xzHT0pAuSBtstAnM16HMqIYXtaYvKcIpWIP1?=
 =?us-ascii?Q?iTqZ5GA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bSlSJ2Ke1/uHobo1Hc1/syVtn8cGbnNuHrFaJEgx4dkuxWxm05BosGFR0SnQ?=
 =?us-ascii?Q?kXzLT5/WNny8QwjCQ4n57NugltZo2HuVaeYRcYajbxMBp26GrWz60JEdsqiB?=
 =?us-ascii?Q?wvbqbX432ModsJnJqDNzu/zI1TMKNbSH4cLnHDWRFaMHEpQehz6Q4nnZuE7c?=
 =?us-ascii?Q?rBPrid49mSuKQdly4MTRTLin9VrGCZYs0bnW6Ww+wPTYJWW4frBvbiLOVnFv?=
 =?us-ascii?Q?mtZdUiHc4gaSdTO2FFf7db9l+hF+Di07YPiev/xSyJSCByWXpgSNHSwfJiTF?=
 =?us-ascii?Q?KyEfJMNqY56VwpqJajUTupZPqEH97rFPSxix7HAxGtaTgtcejCeUdy0Y6rWp?=
 =?us-ascii?Q?HxRbbHOXq4mFKLRQV437T/O07fDgzzeosHjotktu2MbsCELzlzgBGnQGKvDL?=
 =?us-ascii?Q?DMsoapSp6pmE73sJDNslcXT85rmoa7QUMHCtxcVJL9dkM23ajJ1YRil6jBP/?=
 =?us-ascii?Q?5W9IB9uk4mCsIlLsx056PI5hz4VgNBvr8oMRahLtI2SKdbAFOoCGVWu5cefV?=
 =?us-ascii?Q?38yV8IWn5GJRa7LliFW3N43atSmei0MJZef2pGuRY8lJCPtAXlhwM1p/ad58?=
 =?us-ascii?Q?/3A/bNlMvR3MpNnVxnlwZfoz3fGuVYfIIXbdPOB6Vjt8J8bPQ+9j08HbbPtH?=
 =?us-ascii?Q?BnKuLKpmjyWSOMI107oJjqhMlM+/T48dL0/PWxP9XocbVYCDTPWRrPWpGVrY?=
 =?us-ascii?Q?a/cdkAG6g5sRTDg3xnJQgkhXYUcxYrcQ44/bwUtEQ5Bbhy8dJtUoovvKoCeo?=
 =?us-ascii?Q?ggFicmnw2pLvzM9AhuyAbB13MeURa6ZAbcSsJmUsgS+lJx+D0ElsSVjuVgEk?=
 =?us-ascii?Q?K7Dr+HpGdBcEKoXEHFBasfDE/ljz8d0QmOAVxiPS2Zq43K3f0USi2O1QD/p2?=
 =?us-ascii?Q?pSlzvRUG9VRKQ2v1+nA0+/zSEM2lb26awk0X/54aydYRd2vNNzOa2z3OoqO3?=
 =?us-ascii?Q?Qb8KxOMY0lfI9NIrlTadH7SJaA9vkkoDk/IR4CGcktoN6Ltke8wTqPVvvxau?=
 =?us-ascii?Q?igefGeGrgdx2QDihypenuMd9HceMBQp/O/WG7rlz6ywz6PBEISCYE2l3AOVI?=
 =?us-ascii?Q?4OzeZI9HOn2SnzPY9E4yrGX1YZtsFKPu4+LtzsvVY3YGxFHaUhGmnTnXhick?=
 =?us-ascii?Q?0+nT21BOAR0JvpwRgwfUL9VIkE5e/z7WeVRMx32dSUO83UQOIUxEg6XAgVMP?=
 =?us-ascii?Q?6W8kekNGFBZYN2pQ0g6uK3U8G/PmuoRPVhxBv8g+EaOB7pcZTwmrsfErWpAT?=
 =?us-ascii?Q?454P94eMHnnt8HKuiMynmB7JqCoW6DvPdS/urfklh+rNeG1OJ+07T9pxZh+v?=
 =?us-ascii?Q?VyGhc00b9VTglgc+lwJD2ij5Q+1OakXK6AkUC3PhtgGWFfRnkuxbz2hSOCKO?=
 =?us-ascii?Q?RfqLshC1et1XokXMJTIbzUyG2A9hX/MFny/uZlM5x+hUkD++pLTgmsqV82e5?=
 =?us-ascii?Q?nVMK1nG1u2iogG+nuYRIFo8on8JoglgFNk3TuoZQt+DbcW0qvkr1PV462x93?=
 =?us-ascii?Q?l40PmgHO73+/seRltobVSZ+d1Uo5vkXD6PApb08jKlJS5A2QEAa1ssFuwGAx?=
 =?us-ascii?Q?1CbcNdz/avZkXO1YdTuU57BkDLYzEfwGPmDqMA03E9egSoN//YpoZicbmH9E?=
 =?us-ascii?Q?HA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6557d097-bb27-4c3a-9282-08dcd01bbdf2
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2024 15:34:35.0609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NpyX6T22wmnLX3hA9ZBeXKMZO7Tm76jWcN/rbNfYuUQAktA8pB3/ncuvsbYnLw/q6ioblkjl/5l92OKlAji5CQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR06MB7095
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Sep 2024 15:34:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112154

In the source code repository the LICENSE file is GPL-3.0-only:
https://github.com/nmmapper/python3-nmap/blob/1.5.2/LICENSE
https://github.com/nmmapper/python3-nmap/blob/1.7.0/LICENSE

Also change the LIC_FILES_CHKSUM reference to the GPLv3.0 license
containing LICENSE file in the downloaded archive.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-nmap_1.6.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-nmap_1.6.0.bb b/me=
ta-python/recipes-devtools/python/python3-nmap_1.6.0.bb
index 5fe9ab4e3..2293e3ddf 100644
--- a/meta-python/recipes-devtools/python/python3-nmap_1.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-nmap_1.6.0.bb
@@ -1,8 +1,8 @@
 DESCRIPTION =3D "python-nmap is a python library which helps in using nmap=
 port scanner"
 HOMEPAGE =3D "https://www.nmmapper.com/"
 SECTION =3D "devel/python"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0b=
cf8506ecda2f7b4f302"
+LICENSE =3D "GPL-3.0-only"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1ebbd3e34237af26da5dc08a4e44046=
4"
=20
 DEPENDS +=3D "python3-wheel-native"
=20
--=20
2.39.2


