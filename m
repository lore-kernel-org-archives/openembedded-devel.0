Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC2C9EB64DE
	for <webhook@archiver.kernel.org>; Sun,  8 Sep 2024 17:12:37 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.98])
 by mx.groups.io with SMTP id smtpd.web10.34230.1725815545368516852
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Sep 2024 10:12:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=BQ3wR8Oe;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.22.98, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vDfHmqAz27t8ZYphy7hfvKMRecSK2Bul+rZhResc2WE+imJ+6iqpr7Dr3dCVp5X9u2YBITSUakeoIB2ZzCf/M+izAneZFuHk2+LDtbaX3X6nL6r4vXhKgUzgu5IKbuC3Q8aNcff66T+o7id6GpMRJKZELYRsU1zyNfMvrDgnsgXM5XAaJv3bUgfc6h3B10sLU/O8PQO9g5WFzL618rWlp5PMwaWmDeqHRqCcw+/FcU4iMA+4PvfU7ET7WrUXpJA3ewsHfCiTno6CZl+pLw+7MOFCIeVQYFiVcXSec+H9aN+qbGUBLf1+y1AqLFMyBs2+E75cWzFYEl8PKQXLot+dRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4UG62WdgrDeaZCnSUOiS34WsE5VU2oYOgBJmFL1euiA=;
 b=qtZuQm+8AsZJj4NSc0aQnrvpHHeVbJqiF7HWKPsk4ebfs+wzHgeeMvXSO1debZRyWHX9bTnYTGvzD5N2giNsOroO36V+AwZwR8/aaAXITNgtTEd3IDJClL4c+N+kyvhMMURSwnWW/hOMks9m1Fgv8V8De5H/BAMSD8pEZ8fX4g3qjfViiWOmH7p+rZ8n86w3LOKUMmyIOhLfgTCmT6TSs4GzWSwxdJ6HiwqNc8E3EX7ZcPzYCfP63COaPx/AJCxEjROeWWchquxWKF1Q1XFxbEf03MEBCHBlu10SoZhDmkxNd9yKLa58VOIzjlzPLx2ThhDjUzk/2kNTF8bGpS0KBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4UG62WdgrDeaZCnSUOiS34WsE5VU2oYOgBJmFL1euiA=;
 b=BQ3wR8OekP/CWEtA9lDzIJxfVxct03hjpIEvgtasqMa5kQ7prMmwfqtg99oST0J2PU+fkYFfpgMzXmzY0qMqQaNEIpKhLqV6w7K/IdDu5/Z5NliUGmhG6ohN6zdJ8Ul1hWobj5+FE4SMfjVT46adpjJJGlKMKnvwzX+MOlIalTgHtAw3YKLEK8GGE1hB3vQzLBJD9UbGdpFUQRfAN2Xr+2wfa/7c2OY7JaA5J5grMpW4qtLbWgtkQe2+Rs+/ajVZsSM9PT3zt7cb/H1A9k+YsdZk0YuQ5dpKx59wOSbB9ggc43QnCe7n8PGCrf0ekIMgauS59Se+1N+y0Iwtkhi7bQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by GVXPR06MB9098.eurprd06.prod.outlook.com (2603:10a6:150:1b1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23; Sun, 8 Sep
 2024 17:12:23 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%4]) with mapi id 15.20.7939.022; Sun, 8 Sep 2024
 17:12:23 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: akuster808@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][kirkstone][PATCH 13/13] python3-smbus2: Fix LIC_FILES_CHKSUM
Date: Sun,  8 Sep 2024 17:11:41 +0000
Message-ID: <20240908171141.99382-13-niko.mauno@vaisala.com>
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
X-MS-Office365-Filtering-Correlation-Id: a68b32ea-eeb9-4839-cfab-08dcd0296787
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?cKFVU/xJJNp9vQ4Gk6TgBRAWE33XvefrmTEDBHV6BNdpAPzLCYWh9NFX0osn?=
 =?us-ascii?Q?GKlpPGUVybtc4+LPR9YrVck849e3EoxjXd6hOUimxUhVEXLZEltEop2vNK7b?=
 =?us-ascii?Q?0t4EyHW6bGS6A7zmrKvZ2+ztFJCryNC6Hjch4ca7pqZUqWQvwNTIMSjkOo0t?=
 =?us-ascii?Q?X+H7l3LRYTDQCirqqh4O78T/ClpqdtQnfZ3EZdTZ6fk5iP3vcyVlwgRFLgkg?=
 =?us-ascii?Q?T4oJWJbnZeChPFgPikBzAOFFcbr1WkYGdINi5QyI6rq13Wc8AkKq6oquR3tU?=
 =?us-ascii?Q?Wg4u5whLEZTl42ZPZ2gU3WgDt+MZTzdu6/ucPmzJSD0yfQDdw80MTi0iOcAo?=
 =?us-ascii?Q?k4C/r+4Y0Q+VoKWPp+GkD/RznLehluLKRSlVv496DnMhx/iPzdvdFSg+2mx6?=
 =?us-ascii?Q?f2Bw8H63XZmH+OH4A9r0dK6Py+gjY4WO0m3USy3CbFq2r1ZjC04bQe8KvIMa?=
 =?us-ascii?Q?uCYaB2x9r0nXWRZ2WcZALRtGMVfDUFzBTDTKWQpHDqP4vOqlQlcPotVBMvW2?=
 =?us-ascii?Q?CmvDmu5Z8iDtTGChV9KOhXbz1D/G000mEfUvWXki4qgnUWFnVBcOLVqmH1mH?=
 =?us-ascii?Q?PliYc5ODfR3wHKMeODxbryLLea+yhv48qD7nVDnQBK28euhBNP4XjXeP+amL?=
 =?us-ascii?Q?KOSnCS3MOi7cFsk1yxS3g7AFVfPtjJUEvJS/RT+SZvyFF1IPsARgG1QmCZ01?=
 =?us-ascii?Q?2PG9OjRaadsfcVWz7mfxGAbfON8v4aPo5mHysMtlZQMPyK/oIN40XPccukhr?=
 =?us-ascii?Q?Kf2wwTNCNJmXpVyq3LH+gXyGyYjDOslyS3WmHF2v1kfzv6ch3rtNmuFQeMp9?=
 =?us-ascii?Q?nkytqzdcDhYutgqgzZcCdP2gDKSDaXpuLeEOw7y6gR0QEwncra+iENK/ayCg?=
 =?us-ascii?Q?7DGlyGtZmQql4BCWrcIHEVR14rx7yyAxp/IYSs43bdCnah5Hv7isyPfz/iRa?=
 =?us-ascii?Q?iwAEy18BxHN213SDFuRCazZ+x49e4NPeLKplx0SYHuVoyT9p0pqMXSJYwc3w?=
 =?us-ascii?Q?2Q+Ai7kuZGAmvJc8bBZD8Km0H7zq/ePxj3NxAuwBRMpb8k69427BB2GZA9Ux?=
 =?us-ascii?Q?eCjrz0dhWyGmpcPt/S2dHLxiIwS8LaVXS160VWbckt4aY7YcCoEkaoaY1sGv?=
 =?us-ascii?Q?7gGz/5dOMsMIEDQkeCcXItTObodhMT5X+cXfeFvndTOImkV8xtsou9rWR4Pu?=
 =?us-ascii?Q?Dy21B9eXu93UsnlIRKObzqzrVQe/Vrom/q3Yzhu44o1jtMDFVL5zulum5Xl9?=
 =?us-ascii?Q?fOUzW5zfupoRQjIx8Qs7xARTrg4Rl+8/r5Vn61dZWmi9wj1Tr9GRa4rjNBBl?=
 =?us-ascii?Q?ssf6dWzMTMJllw5lWNbTeZkzKGVu7bDg9bm2aF9xPQndShIHNWY7f6C66XSU?=
 =?us-ascii?Q?RiA9ms9RCa39kPUEZ6kQnkH2n1Oj3AVX8n0Vfb0XWuR/R6h0Tg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?c/WrO+NtvcNtVR1at9Npo54cTEv6zZocnS5Wn3HKsdNrQjTi8+fAumP36YCq?=
 =?us-ascii?Q?FYyeenxPUQVNga2Ppby42+qy5WWitIZcVnL8HD3hVDgJwpk15g1RRIO4DvDp?=
 =?us-ascii?Q?XM6Z98QFGqM28qHc1OJIrxCqPZ4DiLsHdZYBI0MVwpFbs9qlre1/FjZjc7wM?=
 =?us-ascii?Q?Ez123f5zycyEYWwbd9+HKBHjtH0I4MOGHDbJC032nOJGOkCANQPxkoqxCyno?=
 =?us-ascii?Q?CZ8Vt+UXeq/wWbF3TReoKLKJSlFKeuLb/ZSb43BFOnN/6+58CSFCr/87l7R9?=
 =?us-ascii?Q?DkW4nDMQRqHZZ8LlD6OoNPD2HHLK9MzEQJbFwj9cL8l2PnHTyE5dVMyMjH4s?=
 =?us-ascii?Q?8AjXkUuuBYZaRnPu48ek5TUtOKR5cBV0QqZuvUXUYiB3B7+0mTwXFDbQYhez?=
 =?us-ascii?Q?RrZyDHYqNbtdu5+lkmf6B03OAvHdKOneO37P2A7wBcZL3QkDE0EtlHhMgh+O?=
 =?us-ascii?Q?bY+7Wfah8srTtyu6kS/ztih+fa4JSMuJJYAhq+qc8xb2GVr0rfOi/jFNatIq?=
 =?us-ascii?Q?AMOkgMHoYS8aslRMqKqe3ij2Oa/QU0ZvHz3PfnZe0N6wZhVvBRVfZzenf+oT?=
 =?us-ascii?Q?4/MiG6j7hVc683VbInk2SP0Tc9OYkrgEPLaeEZOZRewfzOT9eVjyLaW/DeOI?=
 =?us-ascii?Q?Z4kXKmZpaN8bXz4IqdKL5viNt0U13AKX4oH9csxVbPQ43rybFixZKNacc6N6?=
 =?us-ascii?Q?xxvkoMb5VprZQYYG4vzm9CkA2LNH565qiA6JcfrER8dWpA3Hr+OPVwmBg0fU?=
 =?us-ascii?Q?wL4lkx4tajRmV+1RFuczvdqXV/EUKWXXgAi74o62gYXPH8w68ApWJyepx3gl?=
 =?us-ascii?Q?H2Cn+YEOLZ7Uihe8ybA2+IfaxygNp0IYEMJxkz7R0gdjdQwCSvAkNFtl1s9L?=
 =?us-ascii?Q?DeFzVqSln7CVc5adu6o/ztCwERQMeaWhEgErsnyGhZCtLZctV6R1rsB6ELG3?=
 =?us-ascii?Q?q0SfWDxqEyUW3VShP4fyHR+ZxDECOgnTcJ5CXRjf1TIPrK1YwVBqdIX6t+2O?=
 =?us-ascii?Q?Qg/eRq+CWBg4wYVqYmmAWOdYUt9Y87OwHJO8sQAb9WjPvnhlGR6TxMLmkxug?=
 =?us-ascii?Q?TRudrDd1jUqYvnsZhm53g0VLH8LgooqmlBY+ok8s7p/EbDVyirzSWkAkbdNH?=
 =?us-ascii?Q?WHKmN84FBCurHsbgLdDcCNEsrPhjDzVsN8lF5OiDmsjpUflE/LQDSbn79vZK?=
 =?us-ascii?Q?IIfVQZber1MM0Fc1yBC8ukRxKIzrwljSXMnUbVfZGIdL2gMdGDtnquiYlWoS?=
 =?us-ascii?Q?eMK4UVoLIK39Z65VZQXoTxzWmBCGfbQ40RCC7yfHd0VlwPX1nWXHyKBxTp3w?=
 =?us-ascii?Q?Y+xmuAMIRcvBaw/kkbnsgLWcy1OjupvnLgZUmqzt0ZkaR7jbBP9am5ff9Q5W?=
 =?us-ascii?Q?G9EuM+H0OKbAP9dMeA3krqS+vrKN7EBJAVq6I8NZKdIKXdqprTfqcKRf2nM7?=
 =?us-ascii?Q?oUtwqSqmkWrcK18x87vb4nsd1YJh99ANaNaZMEX2ZmLLlBQA1rHypSao0dU6?=
 =?us-ascii?Q?ctS1925mluKVfWEusDn18jsf2ZM6m+WdGjjOZpSteCZssMY3OR3fXa6USs1K?=
 =?us-ascii?Q?4VsvqcecLKU6O6BMUchHglrXWHrfDGirmziEGckvZD28aj+IBZAgk8/EPJmu?=
 =?us-ascii?Q?Hw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a68b32ea-eeb9-4839-cfab-08dcd0296787
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2024 17:12:23.0350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vIo8NNVXdXggY65aJvAKvW6mgHbopgdLWKzlcB4G5t/GLw81FgaQvCwsqPGZFuNRk6QTe1QgySf8ej/VTNMYVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR06MB9098
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Sep 2024 17:12:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112174

Change the reference to the MIT license containing LICENSE file in the
downloaded archive.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-smbus2_0.4.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-smbus2_0.4.1.bb b/=
meta-python/recipes-devtools/python/python3-smbus2_0.4.1.bb
index a27793012..0c73e16bf 100644
--- a/meta-python/recipes-devtools/python/python3-smbus2_0.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-smbus2_0.4.1.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "Drop-in replacement for smbus-cffi/smbus-pytho=
n in pure Python"
 DESCRIPTION =3D "smbus2 is a drop-in replacement for smbus-cffi/smbus-pyth=
on in pure Python"
 HOMEPAGE =3D "https://github.com/kplindegaard/smbus2"
 LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0b=
cf8506ecda2f7b4f302"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2a3eca2de44816126b3c6f33811a9fb=
a"
=20
 inherit pypi setuptools3
=20
--=20
2.39.2


