Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CDD0C54731
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 09:41:10 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.116])
 by mx.groups.io with SMTP id smtpd.web11.48814.1724665264692466530
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Aug 2024 02:41:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=zJ3xYpf5;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.249.116, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mOFV1YDF1HlR45ajti1MJ3kecnJzo9zb1jppJ06O++V4seW3mhLkU8MEWs025R1i1kGNeq+YrjOta99LrUgb2ppogK6qFCiCvEtqQdjd99n5RazekkKV9viokNTtlwwhtb0a4hTmTF4clRSNTSC0+liNkzblCcQk6J5Q2CsgffkyBnD7c9dMK5eCiuOlt19eciHfDXG4ielddix5Ngq1HLJzTss/V+2FcHClFfAvce9WLy6jGsy5+PdBL7wKC1eHxR+Z92uPLY5cMeJFktr5wN4G3Ghla/nNUMS84lw8yrZ9WeS/Cd4MpDqA0aSlXfu+4E91dlPqBgNSkXfG+gDHYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=32HkiaE2Nis11cF0fG9W8XE0GF7GT+qoMj7U1JihEr8=;
 b=WFOQZvJrBKuM1ET9AGOBzuGsUcoDGoAIujVbKIq/bvIWQB4g1n3scnfYp1Fpb8LZjd9nxy7xiZe1+U3Ol+4yQl2uOKROcT9Waj/ylG7e/uklc3kHkEZkjWmesEHxFbytbMt9tn0SDMWJZstj09rc36TxaoMnHGGrcSNlwxzEz0EURbe7HMHkG1A1lMgX/iosK9enAezL3X8ZinrlT3+hNFSNkyvz9aMBoNaA7bX3sxZSNzS1+NnSvda9YhVXmxaPDF6+01ZfNcQlvyH2H1xbMuxPlIE8YnjgtqIkxwtuZ5gex5213FdCRXMRU/arGTwM7cL6LJ6A7U+K/teKg+4pwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=32HkiaE2Nis11cF0fG9W8XE0GF7GT+qoMj7U1JihEr8=;
 b=zJ3xYpf5pmj/y7uqWgcHTIiAfeuoNdCYYAzXKy0NPYrab3pfcywQebyJqzAl9TniLWOQhh6tJYLJZyCuy9mRMMfARTOzfIiJUS+z8WjGuJfN+mlbxzp8JFQvHeW2OapJ3lLRnuI5X+9hjsngduJPaZ19AMtPJGtx5erMtzP8w0oP8xDnfkmoQad4Pwk/Ed3ihaneGk0TUUYGBA937MRKtCpC1YHtlHdZylbYNxy6B7Iu6Leyrz3tIVA9QU+Dpduhgo2hmaeNIGRbgVGpZZBpVlqkXSkYE4ranL1iUpWlfAwHWi//QXfaC7vKIjontYIf8PPquuskp6CfFfTMPgey5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by GV1PR06MB8418.eurprd06.prod.outlook.com (2603:10a6:150:25::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 26 Aug
 2024 09:41:01 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 09:41:01 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-python][PATCH 05/21] python3-crc32c: Amend LICENSE declaration
Date: Mon, 26 Aug 2024 09:40:05 +0000
Message-ID: <20240826094021.2744296-5-niko.mauno@vaisala.com>
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
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|GV1PR06MB8418:EE_
X-MS-Office365-Filtering-Correlation-Id: 80de9a8f-e6a8-4d5e-a312-08dcc5b32ea6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?fCSnctK3weIIbF4LJGLmLhV4+wrqv6GobwEs7Vw4nTWGgsReB3LDj49yIjpB?=
 =?us-ascii?Q?m3vBEKhpNBM9po0pfLQ9AybOfcbIu5YTgz4iuThtwvJA6Ria028lNU5Qi5tU?=
 =?us-ascii?Q?cno4l8A83iNPS1isrXvraDAbZKEApBRandxWWiguWEDqpz9+PvWKV8oqA+az?=
 =?us-ascii?Q?yeKdXMhFj8rOlNz4n+GBkWV9d1sRMMyFJbyf6hmUC4PuhDxkc22OQFAgEhN/?=
 =?us-ascii?Q?eAvvvRpdmKd3ox844dXEvfsxQ2rXB5X5E7sgq6ZrXS8CDdubBZ5SB3oMKwaR?=
 =?us-ascii?Q?AJXGWq1RdVNatTpnyTHxSO7E+jNL9Lp1kVVZU5kBRAM67I9Za4zyLinJX5WE?=
 =?us-ascii?Q?mF6n/8iClmjvs5auRDiIdlwIPIvsOWaeaLQWlWc5ct00t5Rt36f/cJ2o8VAD?=
 =?us-ascii?Q?RvgNC3jH+go/4YtH1BUwOev2+anrb+jkyL2PLqhvD3Rs8cZyXR0pAW5eUd1P?=
 =?us-ascii?Q?XTgVI9rudE6hBPQdK4tSztBduqKPYlERya3HSkMzwvu15JyoCS67bz6xHzst?=
 =?us-ascii?Q?KGVwXyDNytvelTwqNl1krYxgScF3uz5MRa3fjk5q/VvCeTThBNk7U4SgYXL+?=
 =?us-ascii?Q?/1jDsDX+X+dak1k1dQDti+D3qhkK94emJ8KpueXxHjhjUCC2lCsuZPulnkNJ?=
 =?us-ascii?Q?rC6/MSKHHaa+LYQtR8mWLvohD/Dvx5XMiLKlpryRogKeaDvshucF70PEeO5k?=
 =?us-ascii?Q?RBc2XCWjYdL84uF2DKLosXLedp+4Sy/ER4+kUdRPSeIHoiSLSCpIoj1xjeE8?=
 =?us-ascii?Q?G3mE4h7rD88GVT3YaLuEPYHIpBJSgr4RDdWyzk9YyBtdrnZwBPWFcmSef+Qe?=
 =?us-ascii?Q?DVMk8zcmhHJ+w/WynrkVOkyt+Wad64zx6TCo2Zq08YQthztjyg37vn4E5jSH?=
 =?us-ascii?Q?/IMrWEMJy6I4uSIH5Q8+t/q+Q+QgHIgTMNSph68xwCndGbYSTOs2Y1HH4nEN?=
 =?us-ascii?Q?8R1IuD3tLwOJpDMd2oQPUss4NJX5RVAphxGBf7ZcGV6UJkz3Ax6mnqyKWdPP?=
 =?us-ascii?Q?J26t/jm/fThPm2jo3ny208UqwJZ2VmsGLDkc17Bh+j9+RK1j8TX2PqTbo18C?=
 =?us-ascii?Q?MELDaAyzign281SUA2YgZZcGtIBkcOD4ijLWPs6CNLoiU6HtfrGArfP4Naqa?=
 =?us-ascii?Q?zt9Pfa1x/oYiyDnyU7xlNtU77i9+ax7ctDu7VTHn8mV4aqxS1oo0JwPBbROY?=
 =?us-ascii?Q?J7OKa2TfzY7fwqvxwvI/y1GtqQs+3Rxoso54Cd5XMLa7yRhW2sHM0pHj6x5b?=
 =?us-ascii?Q?gEJWL58b49gqzFDvCoT8YCV5oFFIscujl2YjTw8T8l1BB9Y5/vl29I8uXofT?=
 =?us-ascii?Q?KjnWq1OY4NFXGSngf5g5VKUym+RvQuSOxZ8/yIcA9mbn6Ml+5dUGf6NJ9aIW?=
 =?us-ascii?Q?oT1IMMY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tgu0xzFyUI+EbLxZnVZpgkg5fy52C98elyRUeRAkg69wWXFf1UpiByZStC7i?=
 =?us-ascii?Q?uWcTlOz/hXf0CHtnqa2TpFBU5J9eHdH/Fu53iPugzagRi5pn13nWuEVugsRr?=
 =?us-ascii?Q?aqiu5ZeNzDf2QXoDMot5aTJ2a+8DM8oCVlPxmkXHcz7FJ5076ztqhrgynjdc?=
 =?us-ascii?Q?9uwhBNWjp84LbrteUH7jUWBxRP2GQipm7qVDFToprM/VN8eNQh5HKo9QUegq?=
 =?us-ascii?Q?6Xftleobn4gZyKDSpPo3LID6FdvOdDAZ/jCX7kQgGNGvCPoiTx6GB1Rx8LfY?=
 =?us-ascii?Q?JW939ujzuKPkAwPQj83sN9mcMlxilTusZ5gcyuX4n4p2Q5ap+Q53SmeeTTTj?=
 =?us-ascii?Q?Hk1m7Ul5W9Mtq7Iy0i5fbglvzKugcc/iwzziceHfcv42TwTOPTJ6EV3PM+iI?=
 =?us-ascii?Q?EDIjpzpXkjdKPKX8OBNFWM4A2K6xQHCjIOasWkk1xBiRzc1YcP8gh97pSBqL?=
 =?us-ascii?Q?4o1bDGOHHrN1qLyggQzdjicPl5qXeWD4ZLlnXxSfACfmXmHZMy4d2yXbiCqM?=
 =?us-ascii?Q?SpMbYGJckQN4VVf2m0mL+o5kEjfCBAzI885P6kcBgayTxW5hRBmUata4hU++?=
 =?us-ascii?Q?t+4IzPrCp+Bci6myAqeQHRtr+FXfZgOIVAaulbG2fHN7Vw1Nt9hb+ecPX1TS?=
 =?us-ascii?Q?Qo44Kp+mgVcblIfrUuRgqnRhfYSZ6w5mdZzbNavVd8cJ5nQ0Aja1uzNcXkvx?=
 =?us-ascii?Q?9ChFmo68MCbX/nd/kAPIbpWhfvP7WKtKBBgecDWGfQYXXoo8ABVsxqpct6CP?=
 =?us-ascii?Q?A4s3ndwbzP2EWqIxq0EzNn7PDJkXJ25MSFv3tAPInfajlf8evGaLQaF9C1oc?=
 =?us-ascii?Q?P7iSI7w6jhgCD1pgBe9u8zulVG++F/g/XIghGBuqJbOqPzPi8EUEQOYqHB2e?=
 =?us-ascii?Q?RGWBOwYWqq9bQQYVY5fVhjK1AB8R6Exl5hqY/zKf72A9cXPyXPSPPi23QOvr?=
 =?us-ascii?Q?dx4Uu6+S/oaavl9S+agYEgEwlKI6kjUT2ITfcdhGOichd8FHL9x/crBn3OKd?=
 =?us-ascii?Q?1JshiXOTa1h4TfflImwM0eLQp12KxS89LnIHvE2nRuc5IW58q0t0r/375q6t?=
 =?us-ascii?Q?SWn/4inADcmvZjcgkcjAyIrPXwJ2X8YLf3+t3kh8zoU8SUQMVzYAWjjZT96M?=
 =?us-ascii?Q?r87rIyyDLEPMZoF7NcEaTzUvaTKiTapywDVmwO48IkulNA/3dK0Lr1L9Stla?=
 =?us-ascii?Q?bmzzKEmNoO8NiwOYzccPQKtgBU6yxWojdOrCS0AsFC+tQ5W7NcZoRcVdfac6?=
 =?us-ascii?Q?rqD0XVIOcNEjfKuEoild/QI/VF/1au5EM5qitAlnQDQmVh2jPDUtuQTFXytq?=
 =?us-ascii?Q?7vOlq0EuF6nqwB+xqVg2OM2a8lQC1r14olhQmwab2+HLjAl+8hxXBCZV69V2?=
 =?us-ascii?Q?wyGEQIs3RIrCUCnRCN47ZJluFhfxL7mGXS524YPOsOqwEXGhCtnpuH9M57jv?=
 =?us-ascii?Q?rke5P8+nEnZ2G2HFKYGcafIKC7VphfCkW+MHPQl/aB/l7H0IsFIuJOEM2/9a?=
 =?us-ascii?Q?+toOxpe+kVQ/UnVPcgrl2bNdN+8p9ay472BF8uk5da98I2qOAOaaN4pj4Cvo?=
 =?us-ascii?Q?MDx6uobGj5u5WongjB2c9zqcWV07F3/02Z+644rdsWJfcSxPvz0QzHbGx4RU?=
 =?us-ascii?Q?XQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80de9a8f-e6a8-4d5e-a312-08dcc5b32ea6
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 09:40:55.3643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fXchve/eIeab4ZoP+8UBZKbDNdh3rNTyiG9xhFqB3usnunJ9TBLjp6MBpOhAF4mnz/YzELkmf7cXKqchVLrjOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR06MB8418
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Aug 2024 09:41:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111942

According to https://github.com/ICRAR/crc32c/blob/v2.3/LICENSE and
https://github.com/ICRAR/crc32c?tab=3Dreadme-ov-file#license change
'LGPL-2.0-or-later' in LICENSE value to 'LGPL-2.1-or-later'.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-python/recipes-devtools/python/python3-crc32c_2.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-crc32c_2.3.bb b/me=
ta-python/recipes-devtools/python/python3-crc32c_2.3.bb
index da756ea07..125a7ad87 100644
--- a/meta-python/recipes-devtools/python/python3-crc32c_2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-crc32c_2.3.bb
@@ -1,7 +1,7 @@
 SUMMARY =3D "A python package implementing the crc32c algorithmin hardware=
 and software"
 HOMEPAGE =3D "https://github.com/ICRAR/crc32c"
=20
-LICENSE =3D "BSD-2-Clause & BSD-3-Clause & CRC32C-ADLER & LGPL-2.0-or-late=
r"
+LICENSE =3D "BSD-2-Clause & BSD-3-Clause & CRC32C-ADLER & LGPL-2.1-or-late=
r"
 LIC_FILES_CHKSUM =3D " \
     file://LICENSE;md5=3D4fbd65380cdd255951079008b364516c \
     file://LICENSE.google-crc32c;md5=3De9ed01b5e5ac9eae23fc2bb33701220c \
--=20
2.39.2


