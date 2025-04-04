Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6108C369A0
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 08:18:41 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.122])
 by mx.groups.io with SMTP id smtpd.web10.6510.1743754714572896958
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Apr 2025 01:18:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=Rri9j3+3;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.130.122, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OQBBBTK7TjbgN4uZl/aeErk2TdEMZcJK9DKfzD2LhIGjXZZrLNs/MIpUO11KKyFaCgQ8TqaM/AnIOpR1URUrwGv1iRjr3cwnOtYdt70lnDhW/LFysQYohWZ4fi7rBTAAByeG26iUaeJmIGN6hpGvwpM7bExmLNaECo7jKT5mOFjW867py+JVP3yW/IwKbkdhZlFUoMGE32xrIfIQkIbNqTb8TCIttY3ykvcgSTMfczUvG9JgYd0TiNXWavr28i9hcxEOKyHmOHcJuD1EiBVIHWXovlKeMS6mychVsAFl0StUlMoa01j8GeiiLZezA14zT6ZycBDuGD+yXUWmcUDqlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zlbcn1mmY+8QUTFjqpdCMI3tDRXvrJHThvVuJJWR4e4=;
 b=K+6hgWcjlOzjhvc1Fph6afbuegkZOLsFBTT81ut3oEWOQH/QY1KNDu/VvJXVh6v19iUj6Eh7WwPJ+aJ271PFqB3bZr7oX+b7yiNE12swVgcIOXqVrhr7sgXtl+upukei4qWw7ljlOwOILx+us7Oq29YxY6t+yfTB2tbAHzUTNe9ovTriWprJJAFBmCiEzyuT/KVRnr44yJDkW/kj8jfNxkZfW3QvbO+d3v4O4C+3RNyojvWgjIQDjrMwOcQARjk1WLrtnUuT5jNc2nBc7bTo27hz/MsIasEuVvzE0ma6Sm3CpVSKo4Nx4y8Vg9s9glUfAV9uf3ZQrtLGbyYGd1gZKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zlbcn1mmY+8QUTFjqpdCMI3tDRXvrJHThvVuJJWR4e4=;
 b=Rri9j3+3ZM50aC5fXCQ8sYSjR8+BiJy9Cfm9FWWLbIX7hD5mIWf6vUEOH93I/g2GjVP4IYjpJMx4/tF2xbRehnQ82ojhZ5Sy/WnoncpxckZuFjQTSGAGnj8ADZbUzTrMF57HZhM16MhAgF54ErKBj0MPr0Q+EnogPWYEB/8zylUZbHxy9wGRs07uhKbO3IL0CkC2x/gJTNVOLgfucIFQv2mk90RMneRG+p7Ntm6yI+uJiIA4Lj8E2nUxnCQ6qDjlNY/cE11tu4lcxR6EdHvAtiRr/O23hokDPfV6eQfUD6bZj86Q8MpyjMKSIFuoaRCAfVeVHki2hRbYe2Oi2u+JqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PAXPR06MB7471.eurprd06.prod.outlook.com (2603:10a6:102:151::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Fri, 4 Apr
 2025 08:18:31 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%3]) with mapi id 15.20.8534.048; Fri, 4 Apr 2025
 08:18:31 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][PATCH v2 4/9] iwd: Support using alternative runtime D-Bus
Date: Fri,  4 Apr 2025 08:18:00 +0000
Message-ID: <20250404081805.663425-4-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250404081805.663425-1-niko.mauno@vaisala.com>
References: <20250404081805.663425-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GVYP280CA0031.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:f9::9) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PAXPR06MB7471:EE_
X-MS-Office365-Filtering-Correlation-Id: 23cd9e8c-f71a-4050-01db-08dd7351490c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9oiFVWDjwaYcFNfNegSjKZ9ArNyN20pSigi+mbXRTrJzgQS3oUZc55Rvn8FX?=
 =?us-ascii?Q?cpF7820zcCPREn7oBQzaCtxkkfN3XGU/Bp54NLY7/oiBVesE0naiDffIyqYg?=
 =?us-ascii?Q?iIlgcaskGTQzLX96PkIvZ3z17bA8LACcI7HKjPh3InJBYPPUkm6VOfZWAKX6?=
 =?us-ascii?Q?xm1pAJ0iBxJqm/yl4zgZkeiWLOydQqa1PJkUyYAVjNv20IBvqfAxMuc/85Lj?=
 =?us-ascii?Q?vBZPu/JiDSAiKAkQInXLxbujr7Kthlj41VZE+sW1g4NqQSmFnQKxMyFDJdQu?=
 =?us-ascii?Q?eFhtJJyzkiRwr7wgjDxsvk3Rmj91d/woGvtLMd8KhQsUlZxMSmdk0dOhA0XH?=
 =?us-ascii?Q?X12MZ5wcfiDAVx79tynCvHZTNgEhdV6Y1zESDKcbL6iKvK6ysLqkt/E7aUSC?=
 =?us-ascii?Q?E7P9+O5/ef+MM4dTLcIQkzkv3SukR6dBFTOukDG5LgTgeNJ6jUJzfMQ7+4Se?=
 =?us-ascii?Q?mx9z596uS4uo7kEpOyE9TKDC0lR5hVvUcqrtTeH8cEFSKtAynIx4dzK5b24r?=
 =?us-ascii?Q?ZoMTvjKT8ZmbS5qaZFKrp9wPaxI8WfA2vTKZSrOMd8aJ3Rttzo6djWd0Sg3y?=
 =?us-ascii?Q?Awu1e+6lREMkcWGJGcO5NkjY0KVbbV1UYnc6pjNRrvd/E4nDKCASosF+xEP9?=
 =?us-ascii?Q?126WQqsTay7JjeYkGzZcvhViokhPhg607DH0C5Dv1OPBjaenSz9LJvauApWB?=
 =?us-ascii?Q?S1ZGvkgomonaSltmhmx/T+rLRMhYckEhffG5ZkZH5POgdETpebLsenr7gz68?=
 =?us-ascii?Q?dxSx/XF6hw8N03NGu2KUygF90KUPK8TxohMAg2OVTfBgBOLmTwMqqeYswPcE?=
 =?us-ascii?Q?f92dZL7o8jISj6VobiztexTyjMkf8YDGTMMlSPFL/UWi0Nonj8twPyxmpseB?=
 =?us-ascii?Q?8FdUp03Mh48CjEB+0GxFRZ0A0SuPpfCzYHawDng+VCmWfjnuqrXpYcjzc9vy?=
 =?us-ascii?Q?1oeXarK7QwqTyX+o5tGo/U2h575JYNFpKcqrRwEP+P26Xld5lqr6rPvoXDrT?=
 =?us-ascii?Q?U85ZE4pgqUEGETnIjCc7+i9B668JN8Pi7LWKUKHbrDWd47yxyEI7wEeaEQwO?=
 =?us-ascii?Q?0ONiTftfVHR6ix6XP2siJ/Pguee//QptNon07TF6SkKfHFAi/Q1acMEcFBv2?=
 =?us-ascii?Q?CwLI6nXnqqGoUVtFqKzOYNxSkBhKa9PasQZbsw9oQ7a0X6K8O6ENlBCvCyiu?=
 =?us-ascii?Q?AYLDpDaxhCxEKqX+asmgio4v2a9oU0Eis11bBjLhKNFvM0Nhm9djtMDvq2eX?=
 =?us-ascii?Q?bLKirclO7EIqtUTtd9BFMM73WfSdDXcR9O7Iyxq2EBETVo/QOdb2gSfADPBg?=
 =?us-ascii?Q?7kLm0DGXwp9gW4F1+ypAuIEmlC4SUEN3oo3rcppuSRbradiuTVv/ekRsTtyc?=
 =?us-ascii?Q?hGG/H1btQlm/og3q5n6LDdLBKLO5yxWPcfMpNx5sQm1IVBY02oSajNnYbTXc?=
 =?us-ascii?Q?rW963nAGS7xc8IEWrl3Kpr9v/oWTyWwuRroJgpfeM7SsRnllZkGBQw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?eW2mq4g0ZCWbzn5LOPZhbS5//uT4znlOZPCH164gsDGPxF4FYgk4dVPKMoql?=
 =?us-ascii?Q?ErnifdkXsEI8wBvu2c8V0QyJnsrXbR7R8Q1/8Q0SffCR9mvgJ4VLSkTP9LgF?=
 =?us-ascii?Q?uhxHD8Xw/MRx8CaYdIZvmazT3FvnYTKDAP8msBsHaOaZsw3xJT4yjJh0b4+6?=
 =?us-ascii?Q?rsqG4+AyI0eFTL5hxUdmvir3lzXDZFaRiPwaK+WW2VK8EvHewl4FaR4Z0MZ7?=
 =?us-ascii?Q?ChphrDI+ee8dwHHrXFJBDeS/hRoMQRFaucoU46MF+jgE4q5ZYUBRgGxZePrk?=
 =?us-ascii?Q?dYhQZRkHuKr1uMITjwzhYATj5SoVMpFch8JXFskmvtgI8cmZc9rotVSkKX8F?=
 =?us-ascii?Q?8amMf8RhtiYfBavlrTfLLQ0PIvb52/SQ3dJO9EAdLWTUrDbJKzbFyEKZ3LQ5?=
 =?us-ascii?Q?Z0h9AVThuGnVNIhDBI2/1LB0yu0c9WTOf68nTd7/CQtKf5Jqw19yw52jFiem?=
 =?us-ascii?Q?n3Z8Jayi3G2Z8lFZTXZJXzMLlvgYbiolq/rwJWqLyQMpTr0ebkhoOr+FGkG0?=
 =?us-ascii?Q?U+vrnnYIBM9roCz0KJxhSznbs8UH0sx56IDgv0Kwjru2ezVjWJfU7Y6JmGXu?=
 =?us-ascii?Q?JenQFZLZib88oSDGPblvl7OlwFmvaQuaFjAEVwShdEXI81bfX025OcPRtuZC?=
 =?us-ascii?Q?x25mBFXfS4w3egDgaqyF251fQfbR0apyep3zz4k13FLDWHEhlx6c691Brzjk?=
 =?us-ascii?Q?j2QG+sdP3yzsK/iAn9pTYRCc7/jTn38lmn2koC/JLMinHk5y9fcRU4dnT/uM?=
 =?us-ascii?Q?8W8BLbU99IbGcz6SfBQ5bQaDWjMeVf8PfZboLErI6s6APslNF4Yke2061Qct?=
 =?us-ascii?Q?S/QYNOxmnA0nWFGrqbhEabcO4Qz91FGfy1u8G9MOLLWHB8HT7COGiCnqwJAF?=
 =?us-ascii?Q?YNgrbTMOlVXODQ5Vrl/bHYku8w5ukei6Z0lV81oMCckgWYbmYSZqem5c0iGG?=
 =?us-ascii?Q?WG16AGNdrpGYE5Np2hpw7crc4FmXelVRUFN3joF2/6VKT3sCcbFDT5wOahyP?=
 =?us-ascii?Q?JJRalmE+9v5L9bMMemOHSSW4oKgsalbhAxTFpP4RPJu2ui5MzHNqcuY05RYd?=
 =?us-ascii?Q?1LsisqQBj/cW9tB/QjvjjDRYPjDvThVMz/oj6V3TawrhD1ogQnK9kkpsqp4p?=
 =?us-ascii?Q?5jnLj3JlTIDibnj1BoISYU4UyzmCvx0pf5BCOd2pgQT+I0F+FUrKA9boNF2O?=
 =?us-ascii?Q?ZySXtYeET3Bu12fs7yAtmuSV6BAWwPmb2gIaQMShV+UB6vGkDznFa785kv5O?=
 =?us-ascii?Q?kWT8U91AI/ptIpcF4VxByMG3vsJp2KyKDC5avbGgysEuQasyyzjXz6QFpcCV?=
 =?us-ascii?Q?OEp4UIa3ZIiI8sWwcVzCDYXzX9G4PrzwDxgfDK8nYCGFd9OcVyMcYJgSn6cs?=
 =?us-ascii?Q?6nndzRAkUv/3H60SVz4BOtLPR4uaKD/M47i383ngWHzE2YYqDP67YVdHG88A?=
 =?us-ascii?Q?BBI8P3+QfLMdlx681P6ILIqBBP23jJTal5W4Oz4Ta54WSn0y7gUHgwXtczXY?=
 =?us-ascii?Q?yb655MzKMeT45/NrmI2KmXJwfXKnoY6UVp42muqn6/nY+aMwBFLIpo0rJ+lE?=
 =?us-ascii?Q?TpfZ0H9VjTsiSHB/M9oW1F10LpvXqUFvdZY+gO7prwb+Vse3OduLQbDnd/ZE?=
 =?us-ascii?Q?xg=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23cd9e8c-f71a-4050-01db-08dd7351490c
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 08:18:31.3052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bkoxqIz92vUUxLRX6IwAPmT5MwVxYhYcRsfWCGMFxVky3PuwgSI/2qAVPxuN8J9XBAU8/3qwDsjbalLxwoZvGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB7471
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Apr 2025 08:18:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116562

In order to facilitate using e.g. dbus-broker as runtime D-Bus
implementation, change the Freedesktop.org specific D-Bus runtime
dependency declaration to honor oe-core's new VIRTUAL-RUNTIME_dbus
variable.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-oe/recipes-connectivity/iwd/iwd_3.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_3.3.bb b/meta-oe/recipes-=
connectivity/iwd/iwd_3.3.bb
index 9d5b3658ae..52502ebec3 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_3.3.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_3.3.bb
@@ -53,7 +53,7 @@ FILES:${PN} +=3D " \
     ${systemd_unitdir}/network \
 "
=20
-RDEPENDS:${PN} =3D "dbus"
+RDEPENDS:${PN} =3D "${VIRTUAL-RUNTIME_dbus}"
=20
 RRECOMMENDS:${PN} =3D "\
     kernel-module-pkcs7-message \
--=20
2.39.5


