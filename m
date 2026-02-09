Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABE37E7E0B7
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:50:47 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.102])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44240.1770630639634337810
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:50:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=BrEAh8pK;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 52.101.65.102, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hohvQhcev+O0Ukn+ga0Gtx91N9HilG9wUbe6xUVmQ1PNnUV1txqkuXCSfk7LPe5OJKROENZBXG6dSDo2Uakt2N0berGS/1H6m9zQ97gwu0ypDixJgW7EUxyXvtUp4norZofWYVFpR52dFyMb5PKin0FiNHvszqWtPKSPFSbZNgAoUJa15YPcxVkMMzNqRfSHWBmrfEmMjerCVBNoRpqAAXtMmHeOvYHD9Bpv1F8j1Kr1wDSf2z9wsgtCLwN4oIa/JDkb7CfFs8sXHWajeDM9Yeqv3PQXJ+LHHtPI+7h1pxLEsiErIveWCofeyVcnlURAiGbRvNNbf27TNPJ44CQ04Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7pZSrYjBY3qP/nsJFUVVX0VQB1HjwVcnvg+mFMPTdj0=;
 b=N6krJpNxnCFDJa8JgSocirRwApojVdWnlGWa+y1/DP/5gGs90cZqe3rbn62RHpLUExyEPJc9HpZmq2Sr8kik1qt8GHr7+mdFx6qHY8f8ib3Z9lAaiYkfDmzQNxMQXGXxX0ONkjxCQ7qqlLFJA89X5CX/dxyGIz/yIpszZ1QqhY/LwLRQbMZgDXWyIQhs5+GU8ep2+q0/VIBioQxznrQ1Y/75BQ+qlQfSFcijn0HPasiPwWgt7++DUM051iYTZnHPQU9AcBTCt/c7OqVYn8DsAi0vj2z528OtjwSYOm2Y3UsMcGlYHaj7xb9rj1TE5Q0o2/1keCLCIm+m+ayk64nUXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7pZSrYjBY3qP/nsJFUVVX0VQB1HjwVcnvg+mFMPTdj0=;
 b=BrEAh8pKYe2Tl+j/xbhQlRQXVipUz3CMmPccj/85/sDJWLxfY6xeMCBhWJdjUj0CDSV/Q6ycUGkJR35W4kUNoefAz/8QU05RHG07vNPMzIs9Mvwgi+VXRZPTLiQbg0BoGYpnarHVDb/fSNTsvRuAytIkulpGFayfCmdKaiK8zPBvrMJxI74FWwVdSVXFlz3j4FliDQCQ/9iVcJ9xqhfJ3+ScfN0TqrMdx9ohlZdfXKmVtw7cd84s/Wh6ihOnZmL9rTq4xw0HBufcJ1xjoEbOIajzEKaQARZs2Vz3WThdOA/QKtpFyEjmZsZpiFI6kJDzWCGf8pNhZLnhLyyP1H2yvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by AM9PR06MB7169.eurprd06.prod.outlook.com (2603:10a6:20b:2c2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 09:50:35 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::fb61:408a:ba4e:990f]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::fb61:408a:ba4e:990f%6]) with mapi id 15.20.9587.010; Mon, 9 Feb 2026
 09:50:35 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: tero.kinnunen@vaisala.com,
	anuj.mittal@oss.qualcomm.com,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][whinlatter][PATCH] python3-watchdog: Remove obsolete dependencies
Date: Mon,  9 Feb 2026 09:50:10 +0000
Message-ID: <20260209095010.3007629-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.47.3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GVYP280CA0042.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:f9::23) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|AM9PR06MB7169:EE_
X-MS-Office365-Filtering-Correlation-Id: 31f8c2c4-fcf0-4a6a-e921-08de67c0ac52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/IV300QSJl3s8AtXtQ+HA21sFpKBZy0VXRMAhpQu5WVQnQ5AzXEuiUSRLtlI?=
 =?us-ascii?Q?mxAwbNspWYpYNrKJ7xWdfE7czcRM8bX6xXxUMxxz5rxNXssfpcBM5mzSC2D4?=
 =?us-ascii?Q?cnOXoksp18w6IdWUMFWYX+bfSCHUE7kuNTm3O8nLMEzQlnP1uylKszgxX63Y?=
 =?us-ascii?Q?2MVF4ksST9CubtaPGd4bBWPwpFOpcW/WzJz/Ra5UEpthCs1YFor36/47KDGz?=
 =?us-ascii?Q?836JMshJ/jWkBUnuX3lPMbUMNcsqYtWdKnfpyB15V7fKMjZu5COvghfJi4GX?=
 =?us-ascii?Q?5a+Q/nXCuSvzLjj3cy3fuvwPC3YMlwzjJ1ETa8Iud9wyFEM6N0CXv5DRF+u/?=
 =?us-ascii?Q?3P38ObNFw3wynIMiyDBADpP/IOczsyAVa+Xca1jl0bn7Zobsso3+G5ibg0ur?=
 =?us-ascii?Q?Ofei/alXHhC9MfpXQFv3ed92GCrD1bt1YqQTEeaKue3hIBRQOaholNlLhxDs?=
 =?us-ascii?Q?VD37EHIl7lpiSDOO7YT2dPfwOUj3qnVppUPPryQr7puZb5QyniIL0sB8RUja?=
 =?us-ascii?Q?5Rn6u6ngWNTtOWv0tM8uALzKiirdaD0etcdVgMMg63hyLpPhJMiH2p3J6W2Q?=
 =?us-ascii?Q?6UIjtCahbsQqOpnLV9ZaLz2Y+vTBcsqv8TuAser1nEiTMJHdjyrJE3Atrbg4?=
 =?us-ascii?Q?1f8x8MmoXRvfTIoUZEjJDxpQridEDM1984aVxSJP/TtEbAP8Cey8y5dUCJ9y?=
 =?us-ascii?Q?wsJ+O47WEEhZ0rAhlmHjLQFy4hRvb4X4YhUKPYzYpQA51tCvsP2pCPm599sI?=
 =?us-ascii?Q?FkLHgqFbZQpTySHkSTXeh6eI9dXBeClcjmnhZQIjuppf1pNAn+6plVqdW49e?=
 =?us-ascii?Q?wXpjku0NRny0F/QFnW9nTo+LX4izpAzAVnA8Dg83jmQSo17eKRV3r3o/cXvN?=
 =?us-ascii?Q?G7Erbp1OafSufvaRUbxIamk72nMIBJhnEVpmQna4FsoHvh5PYga8YkcAB3vU?=
 =?us-ascii?Q?wtPAGT9Q7qTqBW+94Q1ynFVdePrIWB40lo3t39k2A2lQERPcBdW0AFyHAbqV?=
 =?us-ascii?Q?KputhzSTHIYzvj6x44tWuVxVUTcvczdnvP5Yi5efNdSaeozVJ+mrXRMc8Ocf?=
 =?us-ascii?Q?DV7cMt0+u+BFA/KMKZ4shTk+ja1GfZ+MOKxQK/lEMtHYTuHt0wsWvramclu4?=
 =?us-ascii?Q?j0z/ZeT0K+nhMgSRN1FHx7nUQeFudTPBLSlWSu3tJMhVsxNDZf+5swruAARY?=
 =?us-ascii?Q?/z7B/7GEY29pKTjU8TJvk0O20+EgzVgf5HISx5eljpjE50ev+DdPRXfaC6Rj?=
 =?us-ascii?Q?0GICF9vLrkfGiOyBJL1XpXTPFnBjr2cOvkkuS8VaHl68vnbQT9Qb3Nj0L15T?=
 =?us-ascii?Q?SgF5uT+bwFxNiNPYrL4FdzfHQ9sQRDBPbkKl1wVN6X+7XTZqba0zxTzK7j2o?=
 =?us-ascii?Q?iHxQg3fSvb9Od3EMIJfyHJv7cjdhaRZxQu37IUiC3NJ4fepwIsVI2g8+pqMx?=
 =?us-ascii?Q?PqpyZd1lH0xq7c1ew1oHUytpllLSN2AKaoPBsc2AlgOwEkL97Y5d0CO1HceQ?=
 =?us-ascii?Q?35M9ogzGbamI3JcPYfXlLKKbvHsMjYpJuPVd1GwxaHLqk+ldaL9pLNALcBKl?=
 =?us-ascii?Q?86JmVJLvxc7WSuBvyGUui3rIvQJMew9oAui30q2AztAGzLjDkwO4zZPaNmir?=
 =?us-ascii?Q?g2l0sCQmPEUJdSmeyoynIc4=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yAqUA6q5f2dBp/Gfi7ROodolxhTC9un0vBJhPZPN7aJ1WBhbyXG1yJ5wBDds?=
 =?us-ascii?Q?dOOQtztW22frE6uYtAYqEU8xu1Oynw3cFPzcr3inxVjG3+J2mBhSr+OAX5YB?=
 =?us-ascii?Q?6TilqIxUUmEVvfp9/7P3UaRHv8CkU2lVu4hnw5hfQd9GXDmyXptr/4gxYzDs?=
 =?us-ascii?Q?j4eYGetVVPK8Z18rUc0XADEEqJtpXee9W3bHbXB5mXNefubsv84GGlKFl25/?=
 =?us-ascii?Q?SsGGebS595cR3xiVhBkHEurtXQ3JwL/iy2gVeUi3IRsUeuk0bLkyPCl8feIK?=
 =?us-ascii?Q?HU+0Fi60G81TeoQ2GIdOUxNpqN6IyO95mfGWsgVMpyLJC6O3rHbnKoogruak?=
 =?us-ascii?Q?Jk6uzGgVA22jy4768ELZcyt33rXVGDg1YPvPlzWyegkyViUD6n7LEqJn81Nb?=
 =?us-ascii?Q?K7nEil1KpLSWjD5TN0goZqISY5V19GJsLGu81ZFOvJWuLffKRCqC8w/Sbccc?=
 =?us-ascii?Q?meyMjhnnHDRRhrIZZTOoIn1IH2lx3yFviaR+znN1KlUYD/YUWFrH4Y4X6Eki?=
 =?us-ascii?Q?OFPpsuv//f/FUhbFhDzllTm9OR8Ln+H9kWiN76938nOQSDYfCvTad4YLmOGa?=
 =?us-ascii?Q?e74WwIAxqX0aP2PQSKLJl2T6Lz+XdFIWxExGi1TY40DloQ6UqB+sl5tY/3n0?=
 =?us-ascii?Q?xjm9vznB12YympQa1LJXubvMK96zHnS/Mh9oRn8R2tjWSih5OAhfUbM/YmXw?=
 =?us-ascii?Q?V9ccvZpXYL3jKTW/Vf2XIC+2odrVb8dUFsiRd3Ug98f4JuWzigY9Xo9MoNnB?=
 =?us-ascii?Q?gF70AGEdEsfbWQZvL5djN6XE67NzTbQNwSIIamx8D5mXQD6nOz/BzKRHZX7z?=
 =?us-ascii?Q?cpK2B51aeGgxI7Z6zAEymbiHNzKKgzvIVpUFshexJkra72CFmv8rXphuJUzi?=
 =?us-ascii?Q?J6XQMJSIoylXQup5H7i+IfhM8b6me8fBRKGLxaYlDfHo01mYjpxgyAuav/uN?=
 =?us-ascii?Q?Onj6bY6owDcWhC52ZdVJjSlzrbuQcxHiftTxgoVb8Ipz5sgLSs0jl0lVuDUE?=
 =?us-ascii?Q?3OZwmKCC6JavbsTltw6+hwjIIjaevFT3mkzSapSOZJ3dkAYKogB4WZyGP0yH?=
 =?us-ascii?Q?xmqE3ScUP6vC6vpzsHf7y86c1ThBUeJmVDSp8DtaqLLwI+yH7AxVg5DTaPrL?=
 =?us-ascii?Q?M7tCo3afGVBqbYntYhQI5XvqzZW5Xf6YGhhA4d5uHvMhiBEBjoBa8vV7y29Y?=
 =?us-ascii?Q?bKnZQG0F0k1twk17j6ZQRDDEp7muB45E1Z7eNTcPNyQSVVq3gM+2v+28TILH?=
 =?us-ascii?Q?8zL5qK4CrZTDdGIC5S+8xrqZutlxL2epkM8wmhH8ipqMuRz0o1LRkegI3z9D?=
 =?us-ascii?Q?Q2t4+7372Ohqv7SESTkqlJudL2BDjqvud7H7q3rV9ArMLnf4k4qPixKAiHgY?=
 =?us-ascii?Q?EJr84B1gu1ip1SXE3roHeDKai+iSuEhWRQS89yU+yUMmCgKiPHbB6snAiGjt?=
 =?us-ascii?Q?mpkymRQ9AnQgsoXDkx5cJiRZKrAfnzJ7qAyocldjzy4BTKKcLIjfFfVdmfTq?=
 =?us-ascii?Q?AW396nqWEUyRZPopbqu+HlU5TfjyBnRZg/G46MRwp7a09u+9LrNDCjDmL5KH?=
 =?us-ascii?Q?mWXpXXHB0aWeYTdxogtYlB9FyKAwA7fmSwqARI+cHnhhgJI1gQCCkl1LjKmf?=
 =?us-ascii?Q?ly+rY1/oOiQQsvNqcCuM7mX2j4GhjbJB+zqOZlDzEgSjdRxvvnzDoUUXRXS9?=
 =?us-ascii?Q?E8t232bEtnmMEO713Qi0/dX++hT4+GUS/VJyLw5K3S7ckZgnZdZ90gOqBWzG?=
 =?us-ascii?Q?hSx9MVbkxA6t1HkMBp4Nu3MNcKS88cc=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31f8c2c4-fcf0-4a6a-e921-08de67c0ac52
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 09:50:35.6950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SyTOgneA2DHl229NPnJ9x4GvPKVE73C+GoP57KNqqbEhJ7ccQReFJGaRVoEp2qyFq9HZyAb3iAagAnhyj6vZEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR06MB7169
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Feb 2026 09:50:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124294

From: Tero Kinnunen <tero.kinnunen@vaisala.com>

Python watchdog has removed all dependencies except optional `pyyaml`
dependency for `watchmedo` utility, like follows [1]:

* pathtools dependency was removed in 1.0.0
* python-argh dependency removed in 2.1.6
* requests was never a dependency
* pyyaml only needed for extras (`watchmedo`) and may not be strictly neces=
sary

[1] https://github.com/gorakhargosh/watchdog/blob/master/changelog.rst

Signed-off-by: Tero Kinnunen <tero.kinnunen@vaisala.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-watchdog_6.0.0.bb    | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-watchdog_6.0.0.bb =
b/meta-python/recipes-devtools/python/python3-watchdog_6.0.0.bb
index 4f56e81049..40abfbfa38 100644
--- a/meta-python/recipes-devtools/python/python3-watchdog_6.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-watchdog_6.0.0.bb
@@ -1,5 +1,4 @@
 SUMMARY =3D "Filesystem events monitoring"
-DEPENDS =3D "python3-argh"
=20
 LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd5=
7"
@@ -8,11 +7,7 @@ SRC_URI[sha256sum] =3D "9ddf7c82fda3ae8e24decda1338ede66e1=
c99883db93711d8fb941eaa2
=20
 inherit pypi setuptools3
=20
-RDEPENDS:${PN} =3D " \
-    python3-argh \
-    python3-pathtools3 \
-    python3-pyyaml \
-    python3-requests \
-"
+PACKAGECONFIG ??=3D "watchmedo"
+PACKAGECONFIG[watchmedo] =3D ",,,python3-pyyaml"
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.47.3


