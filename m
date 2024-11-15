Return-Path: <benjamin.bouvier@ekinops.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BF21D6DDDE
	for <webhook@archiver.kernel.org>; Fri, 15 Nov 2024 07:22:31 +0000 (UTC)
Received: from PAUP264CU001.outbound.protection.outlook.com (PAUP264CU001.outbound.protection.outlook.com [40.107.160.133])
 by mx.groups.io with SMTP id smtpd.web10.15164.1731655346448737526
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Nov 2024 23:22:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ekinops.com header.s=selector2 header.b=fcZAZvCb;
 spf=pass (domain: ekinops.com, ip: 40.107.160.133, mailfrom: benjamin.bouvier@ekinops.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FtHQwZwROedEMPFn5UTJ1rzTN8HMKtFRSwUGw51vuoAPCHCohboQ9mhU8bvp2S6jw/zKxSvPmtv6Do1ttjtyQ01Us/Vl6vUnbuCAkOtUQBXrRK2ApY6g4D3Q44FNtMcXI3Io3bsUDY+CoC8D5Xs3RfsuRhWZgaRmCgqzMRYBGW55dAP0i3E+K/QRNK6/rLQi9KyES2CAt3tON3qn4XpsTlLVQgNGMKXee8A9KU/fv9OkC4Y8lsS06LL6oqOQWMKm9iEIxRMytKtAGN0rSIAqgKAmSQVIofxl0kGnmXXtwLG8IW8g9pjghZdLEfrj3u+bYNQyhhIqXqUJcWhORr8S8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1YpIB+wR4SelIzIGso1tOhcg/lsyYRLKaEnhSaKiw/I=;
 b=uecl/arc3ms4WBvjnR47cfTx4xoi0drHFaIAufrH17nsOckx9WLVVpvUPBnlsqDp5f8/O5lbbQjcgfAknG4L/153sqKE3Z9dZJIlJzqudbydqkpt9twxa0JS+WaSLzLawsbPZNk4q/8L3z2oi3uCAulV/MGv080nAyObNtdx1B/2cyPis5XCRjeMAI2FYjIqzZBqjeA3HeiYLjCFAnsEFHcYcwghHCLt8NeojfssnbO5zN45j2op3fUn9B5WTZm91AL9/tp0owewkERM8upLIN0nwGFZVvokG6IoyYAYNq/+FYfcRBxzxUQNf3MbX04gtBTCOPFjRHZFgeLvGsK0MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ekinops.com; dmarc=pass action=none header.from=ekinops.com;
 dkim=pass header.d=ekinops.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ekinops.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1YpIB+wR4SelIzIGso1tOhcg/lsyYRLKaEnhSaKiw/I=;
 b=fcZAZvCbFuWKMui9KikZjjusL0ramq3eVx5n1q4jDqKoXyl4lt/vu6Ko9nq+Kl+q5ad36dVNeT1xLN9EBRPynK2Sw2Jkm+UmToBimp+HyrTPjqKPO5+ghCw3ET/dKsXhsMvfVDhQXjcPeio/hChOWJUx0BbjbF5TkuhauhBVfVU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ekinops.com;
Received: from PAYP264MB4350.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:11c::11)
 by PR0P264MB3340.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:144::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.19; Fri, 15 Nov
 2024 07:22:23 +0000
Received: from PAYP264MB4350.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cea:c378:fb53:82cc]) by PAYP264MB4350.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cea:c378:fb53:82cc%5]) with mapi id 15.20.8158.017; Fri, 15 Nov 2024
 07:22:23 +0000
From: Benjamin Bouvier <benjamin.bouvier@ekinops.com>
To: openembedded-devel@lists.openembedded.org
CC: Benjamin Bouvier <benjamin.bouvier@ekinops.com>
Subject: [meta-oe][PATCH 1/4] libfastjson: add CVE_PRODUCT
Date: Fri, 15 Nov 2024 08:21:47 +0100
Message-ID: <20241115072150.102677-2-benjamin.bouvier@ekinops.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241115072150.102677-1-benjamin.bouvier@ekinops.com>
References: <20241115072150.102677-1-benjamin.bouvier@ekinops.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0420.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:39b::28) To PAYP264MB4350.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:11c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAYP264MB4350:EE_|PR0P264MB3340:EE_
X-MS-Office365-Filtering-Correlation-Id: ea0daa4b-3904-4e68-9670-08dd05463fa0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ndMa2focANUBZaqK+J9o5w6xobsysHE4RTqT/uTfZpPbs/zHP6yR9n+ILljE?=
 =?us-ascii?Q?OQ+Hv1OKsuWX7BExdDiz0ayhCQImghOE9i/TWesHWpgi09fd7AVz249VO/ly?=
 =?us-ascii?Q?PKG5leg3Sbx32aG261yw3mDUl30CQ4LzvgGZ2uPlLPJR0OQrL7aCILUjHt1e?=
 =?us-ascii?Q?rlu5o7DMus7Vu79zD0+1vGKrYut1i+3vijoxIJYHyu1/pS6eQrKnEZTVbJJf?=
 =?us-ascii?Q?QpbE2iROe5wAjBtSqv30ElDPKa+riTSa/C68eUcZnRhS14QGSGcrlzU+1wv6?=
 =?us-ascii?Q?hylmHigSThC/iE01kONHFhP04wc2iMh2KOOXkXYXXSGOmbGVXYJooaadIEs0?=
 =?us-ascii?Q?5U5f7OsQeyJjhUdc+xoGoSPj0iXYq4wxdI2JFrWX3ssSfQXqVodeRXDE8YYs?=
 =?us-ascii?Q?b984Cp6QjlB0A5XZPrpFJT2hQQv2lwloRkpeeCmM6rJVCzcckn8wtvytt6yN?=
 =?us-ascii?Q?nSIh9XhNl7YgZDeqh03AINLvDFhE3kxqxU49JOrRDGJCa2KDxpf46rDOJD3B?=
 =?us-ascii?Q?yp/iAIVTKS2EFzEEqgDL4ShCfuuALefRruyLdTuMN3dubtsOD9JmCqBSfyIB?=
 =?us-ascii?Q?a5nYpwNPEDVUhZs7iGIY0honJy62GjKs+JbHy8aUPlAXp4G25db/B2FzY6HK?=
 =?us-ascii?Q?u9ck8doRww7i/Q2ce3BH0gMCRyeHiwht7MajAiSsakCjKQFFqNpGbzYRx/eU?=
 =?us-ascii?Q?HFXLwA/RZdIAZPe8LGdouASFThLNeBPRh85QGEyL7cCI2v9Z+Q1LFXjkHLm7?=
 =?us-ascii?Q?ml00rX8wfkkVkDLUlq+UdXRZkHulRWntsefvY+mdQVQgCafWAaSeJ43QpC19?=
 =?us-ascii?Q?LCYP5c8SDPpxBW0zVaORJ2lT+gf6V3zwxjNG+bD90fTgVVd5r22H2ydvLxJn?=
 =?us-ascii?Q?dHs7jTm3p327/3jQq2hT3JqtwCnM7O+0sy8TEcNX1KF+J8OEJAJB6E+xp3iq?=
 =?us-ascii?Q?Crr0FG/STQWs3270caPcpRmE5orRPHxf56gFdmvc7Kp/yfE1qY/eRpEAAb7j?=
 =?us-ascii?Q?8Q7Kq0iHxfbctgvoN99wc5Le4osgGyjJDem9t1PXe3iCGsaxo+fnhLaoVYc8?=
 =?us-ascii?Q?YNeepGgJNZTfoUbftrcRNwoH7ERXItPGbsE8rzLN4HGOiE3NvyocW7FfFRg8?=
 =?us-ascii?Q?/LQRzFux+MbQ+wytrhNXDg0FzRHQTiaQZnOpeNShagRmTgrIFsgGarbadkq7?=
 =?us-ascii?Q?aVe2uDGq7Ycm4Mladf5w8A+Gn/KSX86bCGqWMWVN4gBQ6tRsbPyJPdWLhiq8?=
 =?us-ascii?Q?8dNIxjYmFg97bxlzbxnyEeD/6KfiHFo8jrTZmbgpVgrSwvCRrGMKPyH3Jate?=
 =?us-ascii?Q?a7+r7APNOU8dtsymbWtxvV8ttMxbwdYiDO6YrxjLbY69q7sN7v+SRXrQ0g6z?=
 =?us-ascii?Q?JDnzttM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAYP264MB4350.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SfiAV1uKgCyLFchubXeVtccZI/7IaiELeh5yx6HFtYzt49Mt2rg1dYWt+YZl?=
 =?us-ascii?Q?dQdBTnpzU1RlTaQvgYVg8zRsEcvChSV5n381JFu4OD8mHyvGs7RUo9O4Ni/z?=
 =?us-ascii?Q?F2AHVMbV24YElfkmiByUKvw+JRAU2NzYOA0LwnfA7HwY+h3cdYaZGnNJP3bm?=
 =?us-ascii?Q?Ha/WntAwZ80KNdB4www7MY1zggEc1Ledl+QsBVd6zCL7TspHWdjD1RFLqRD1?=
 =?us-ascii?Q?9cmGXgvhb33wCtKRyTWyIe0mngY+QFSbGw35M2Is17wuTaqvEmdZNtbiExfI?=
 =?us-ascii?Q?oCBQr45xQPKMDWbHLIVlOE8Bm0wtYbNuMbvOb796H8yYtybbuWj4Ho2S00YN?=
 =?us-ascii?Q?ZBT4qw2p5Ug2A8WyQEAPvrIwIYjXg/oLVSx5D8pjomcnA8YHdkriS5TDobF+?=
 =?us-ascii?Q?HCWUOSKGNj3IwaWbRHuLrqYElsiuwy86nGwQeysvmZXhZa49FbIkl5EhOLI7?=
 =?us-ascii?Q?iNWatVXapJFTKbe9o1uGD91c3L7LAMyzi2/J9iGNZEWgx4biDrKTphzjmmu2?=
 =?us-ascii?Q?mJvn6GzSGrU4SP/qnv4a4OwRNcB8GCSnBFdNmiSokoIELioPlImTsvk1TqeH?=
 =?us-ascii?Q?amnV+oKOJGFUbHgEt4bMC3yVcKKfGGIxIaaHjFmA8GqredQ2+TERA2PuKMVd?=
 =?us-ascii?Q?2xq7Vw6WK5z2RbQBTDfQkPtsb9Ew2vnmlKASm544aY/Y7tmNHpclzAMQCRWB?=
 =?us-ascii?Q?X6LBnOId+gxj3WTS5t6wy+3hznmOKLl0j46D9egNxd6jcfplCE0m/8QuvFfO?=
 =?us-ascii?Q?PMIIqbIBcAPlIwiMVxXoNBfItnMtmsTtrcEoW96gvuVUKWL/S13c0qad0FHL?=
 =?us-ascii?Q?nTBVbio0NpL+tijkv5QoiLjBR+HUO2mh3tfuru0x0TfIij6ZkvqK3PkY/46a?=
 =?us-ascii?Q?he8Lh+Otf+6oiioceJK8lhWAYQHH+wox+kFRBDXuIDSZ5wI/+Ynbgffw01op?=
 =?us-ascii?Q?0w6kQtLfOIBGs3Uvw3mTaoZBjmzetbAWX8tKGnMuv3QkSuPqou0Ha9HmpaQy?=
 =?us-ascii?Q?mOpqoDf7zaLkXeesMX41JGVR0a0ClhsQK1264YAOHkDJwzd8snLvBSB+FFzH?=
 =?us-ascii?Q?Y0AUucoHzy1XL/TTxMYUEenJ1sb5XdUQSpael7DvxxfOAIc7KRnWS2SrpAml?=
 =?us-ascii?Q?xKyOzA/WouC453ZsI0o3D1Z9QdtBqF+kqhAPsvtrwn+31iZ0FzGC66/tegnc?=
 =?us-ascii?Q?cxoLBhNhTRAV1AYNnG0b/XmOJPkkBmf8qnaKBHWjVMOPGgX6+NwcZkYJxpoR?=
 =?us-ascii?Q?EPQceMvSWgUsCZ1WejKE6+b0jQOl3GKyT4CwWQG2gHiYVlwAvGRfBRKzsppF?=
 =?us-ascii?Q?yVcg7NQXR4jZGvt4hF0P0kGJTmUDKl2Q+mTpERVtTr1yFwO7qWFlBZgOtIv0?=
 =?us-ascii?Q?KOIEIe0J5dGww15Wm3I9s7AOZJLGj5dTdLHskB8sjVcwXmMivrxAKyWmFVW3?=
 =?us-ascii?Q?K3gvHeCuvuKePLhtlEOrMIHKOKE+S/8CMvzkzrUCD/OEtWYmHJdR37V8/qOJ?=
 =?us-ascii?Q?yRnin53CltCGMfbwNLO+G/9HaW0ImZjd8OV054amsCVPIj33D1XnQgyOZcDg?=
 =?us-ascii?Q?WeeTyqQxHeQ5J9fOZNQ2Sp8nsVt8XmoodZVuLXafo3RcPN9N6JSi/YjVSOhw?=
 =?us-ascii?Q?bQ=3D=3D?=
X-OriginatorOrg: ekinops.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea0daa4b-3904-4e68-9670-08dd05463fa0
X-MS-Exchange-CrossTenant-AuthSource: PAYP264MB4350.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 07:22:23.1952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f57b78a6-c654-4771-a72f-837275f46179
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aizF1edelxgeVdvJjAOaZE1qd4q5ZCfPqnB3yUH4OiZu/lo2dNaDZ11KKXwnCoKS89XbdXNbEp8y784ykrNh5jXnRwBenxO1znBSTzN8SAo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3340
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Nov 2024 07:22:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113847

Add exact CPE name in CVE_PRODUCT.

Signed-off-by: Benjamin Bouvier <benjamin.bouvier@ekinops.com>
---
 meta-oe/recipes-extended/rsyslog/libfastjson_1.2304.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/rsyslog/libfastjson_1.2304.0.bb b/met=
a-oe/recipes-extended/rsyslog/libfastjson_1.2304.0.bb
index f16126d93..967018ca1 100644
--- a/meta-oe/recipes-extended/rsyslog/libfastjson_1.2304.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/libfastjson_1.2304.0.bb
@@ -12,4 +12,6 @@ SRCREV =3D "3a8402c1de7c7747c95229db26d8d32fb85a7a52"
=20
 S =3D "${WORKDIR}/git"
=20
+CVE_PRODUCT =3D "rsyslog:libfastjson"
+
 inherit autotools
--=20
2.34.1


