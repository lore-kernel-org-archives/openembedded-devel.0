Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC28EE6FE49
	for <webhook@archiver.kernel.org>; Sun,  8 Sep 2024 17:12:37 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.98])
 by mx.groups.io with SMTP id smtpd.web10.34230.1725815545368516852
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Sep 2024 10:12:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=r4QnpD+M;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.22.98, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GuNOxO0jkPOaaSvAgcmQLQi+FEBvsr/lPk+7sz52M9A5AHIvb/EdK0vY2cVK5aKr+mN1iCvEhadDYDUhQH1jnWHfXrXrpbRpOz8s3CdGoQ86qRrH2K+nEPvDMyClGw2idSOJRY72AbeIxZtNkDuULP9/SxhHLhYtImIjvMaZbKV9+9PJz2kNBrMv5ZP5kzF9x/950GhkWQcpTHGtmpu0JnLPiYCyc4xCIDfbnfn7vFN9s7P0GStoLMSPvD9679Ps9TpzMGlOXjTcyhrDQiZlNDtSaU7PWQ55GL5xpA7KRrQ8T7AgErKTlfRZof+ZfWbLLvdEm1ZlcPZUjbODTuJ6TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2aqYSh6KigoQKEorqoQ+5ZIOdAwmkocg5Dk3BlzUPpA=;
 b=tjYxQOwOPfCOJdfzjkcV76BG4QTyq/kzfDgo/hGY1+T6N/K9DpVUSdRLnZgF4lUKYB98oudAKpdbQ69yqDzIz2FEGWZaWxLAUCdPogWH2pvdDXHbL5AOQqwRq3cdcBB4NMim8onrlA2PNgV2IG9ilvD8dBi6B0/PLnVQfxq4YuzL5bZ6V0qG4xyTyRI7y/rLZVNZt45CcghGusJIrpd2JXAXBSmoo+Tq/xyU4GlUr9n5KGTfDiuFuAvMNtV35WEKcFtrU3ht6tX6RMv3x9gVKt3Z+ynvYdocvvKpv4U3pQC7smhPDVWzqBdGUUvSSfaJI60AIsxG4h7YfpH43J6JzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2aqYSh6KigoQKEorqoQ+5ZIOdAwmkocg5Dk3BlzUPpA=;
 b=r4QnpD+MCUzMP8b//EESGrrAWgitpXL1U2BVBzO0W8/wEBrcgI6xs0fbQDoI17/TYWMkKN3p+38OkyHJkJF/o+WMRZ1ngs6mej8UEVTCiHpUxsqpZbZdZJgAQwZtlji5PdvuY7sNXIrOci1pe0CSrg5vhQQioy7RQX6dOf58jNTSZvuCTYwv0ez81w+xa2H7I5YdSg19H/7pcowq9SuBZsS61cSu2PjIjJ3+RQZB06ndEUqAcq0D+jxVCrw2x+ecmACEkhJBvMnBS+ZcnYdbBEfd/f65GSdoeW/zmS4YTzvZZ86c6oVqet17ueM5fDYXeaQadi6UP5BelCL+FWMxgw==
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
Subject: [meta-python][kirkstone][PATCH 11/13]  python3-googleapis-common-protos: Fix LIC_FILES_CHKSUM
Date: Sun,  8 Sep 2024 17:11:39 +0000
Message-ID: <20240908171141.99382-11-niko.mauno@vaisala.com>
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
X-MS-Office365-Filtering-Correlation-Id: ac269d7b-19eb-4b7d-71ec-08dcd0296708
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?MphYBNaEDgdm3Y2fSpK2TjgNilrHbyQuMOISlr9CEQ2Iu5ECdT4Lthw5R6et?=
 =?us-ascii?Q?J5SdhRBfCy7/MBg8pggfv4yJ71uHJ/T6JPbKWXUumdFTGrX20D5UXRTNZ5Eq?=
 =?us-ascii?Q?C/8yGW7mwbaeL/t78DaU+0C9HFGb+Ns5suqYMR/w4BPhqco6I3zF/s/R4iVK?=
 =?us-ascii?Q?9A6fTB0pwMN57IoV+xy1cMT2FeJomLFY7lkxr+bX9QL71U16MJK1DTrtsTkz?=
 =?us-ascii?Q?5HuNJUS4dzOsIt/oR/GOhfpufD1jWOyEgHkQeb3txpcYlo3b3rZJabsf2w+Q?=
 =?us-ascii?Q?JkbU52nwbNbBw776eCUsT57IyCzslGSG6GaRNNwWip3eI1YhBkj6aGNNuVJS?=
 =?us-ascii?Q?E9NF2uYuWWqhMpX0XiQA1bDhGfV3kS3PAPBMK8dhe2166xuLxPwD5skyqt+o?=
 =?us-ascii?Q?vzVMFG86hYyLIJyktFXC4HTw5AOJblqsQPLhYAD68ApoFSsynHkmJEIq4/JS?=
 =?us-ascii?Q?N+RPcu9XsbWoXDNu33Mnw717RAsTZasjLvfQqsC5qwrV8NjxQCppBGPOmtj9?=
 =?us-ascii?Q?JCcWVNotb3+/jWgCMYBjxqmj79/bjMbJyth89274KOAs2vQRaHGyt9ooI7Pp?=
 =?us-ascii?Q?78eutRxaJo++Qp2BmDrJplUVaZT8hLJeTNPdMVpnIjlna4Vod+wXUUEQ8jyJ?=
 =?us-ascii?Q?Y6wK5CS/tG112FfY+oXXEyTvreDR4xKFPIhnl7jpBIPaL/eeymv7wgDeHFsY?=
 =?us-ascii?Q?GZrcwuZ5CcItBEOafapVkqFFpLLWy+h4La6lHx6SYNV0rFjGbhXfp3HCk3QH?=
 =?us-ascii?Q?kpJInzezsb+NrLIqVnhvQozg8quxfJxaU0CvrI3kpBcNP91ZHKFdSh9BZhAa?=
 =?us-ascii?Q?Ikxb1A+hzdr9aAoBSeqLmH03G8oyI3nLwvh0xthw1CKnZdOPKZbbEzMmqMp8?=
 =?us-ascii?Q?np11BB9fW9YE2kpz61BPuQw6Rr+u8BpEJJP+SlJn1yAdstRFNr1eFDbUcuRA?=
 =?us-ascii?Q?wCBMOEwpGM7TdRDYHrAz4Nc8epwy93pa1Hf2dUrxcGcGQzsVOvCXyiOzHlvJ?=
 =?us-ascii?Q?Artry3aui7EY6zSaELm1X5qhkqYIxWFV5M28IEiZM6snC33jMl/AO3sE4hDi?=
 =?us-ascii?Q?vtCshlz5yam8naQ3tTzJBbtNM3xAAjQJ/PpHGHxQVLmVaf9zuLxFNs+SJVCr?=
 =?us-ascii?Q?CLRmKwES/DEXDK3PwCvYjCkdHYteJqpwwVPHGlmyaygEc7KfFmopetT+5CSp?=
 =?us-ascii?Q?VDdcNzo67BNW6iyUN6oHzaFEgY9Nzv+SgP719qzvAi/a3fPYxWcEmoSDLDpv?=
 =?us-ascii?Q?6eejGwV/1Ayu+QV40WmGEjupLDU/afQJnh5Ht8zU8EcbbNO82LY95dFQN1nh?=
 =?us-ascii?Q?4hYca+l9Oj2OBo+lgqkriBC2Cdme6PKfebiMzMaBYuYo7NOLjf71vzv6JqXG?=
 =?us-ascii?Q?skIsghDTiNgkFZZLZQL7acCGlmKRgSq15vhP832fiudC4ZeCOA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OZLVBmkKayojQxFu0+x6ytC4oAQ7HHZA7a6sB2pPVQwiAPrAP4/L6mslwWJn?=
 =?us-ascii?Q?X3lYGPCsoN2yVVrqifM1vx6ZEr8yuiQ4tOOrVwFOmzIjJxrvod39WLjECedC?=
 =?us-ascii?Q?tKRawAe8PF1eWZbub/JNMlTSb8nOtY6vgPGXba9qMlWqOXZQBGPxw3PZqxPk?=
 =?us-ascii?Q?rVebQFzki/5HUNySdg0jzg3MAqj2wWhUxWJEObBLacxJ+QJX5wKE8rYHbYxM?=
 =?us-ascii?Q?tvlGwQLawYzoNq68qquVzmOTY4Bk2MKoupgsxQ0eZdzP5Tk13oqOxmEK1kAG?=
 =?us-ascii?Q?MOYxrvll2tisXkb4QFsEomVMrvardmeMP/jDTbvVW5/L6MZUilz3T244EttR?=
 =?us-ascii?Q?evRH7lYKAxA+WAsE0G9r2vmoqTAsdvHLgAAHrWG8WSujCBT0+HIWruyApyRP?=
 =?us-ascii?Q?L71NirUXziE1rnfootp1VLLmEhwXlFM/oYPecDDcfOyqleUSExnwqe7hNZjK?=
 =?us-ascii?Q?lRHRrYvAjiEh0zvn66pFMXB7q4RBLdpLT8CuyexO16bxsfUB2ly4RWhIF0E8?=
 =?us-ascii?Q?G1dUEf2masGpWAfpCJrzAfgzfekBfNTgaYrQm9GiWads/MnGL1PTvPT91y9Y?=
 =?us-ascii?Q?wkNDW+nJ+hGxquGsygP4Yd57kbcaNZNBrPr5mX1BBHLHzPxim34GLa3KHo1q?=
 =?us-ascii?Q?fwIkMlMowu3CqIcXYjrGmAn92/nZSSwe/KS+3Nb705ixRvVe1xIVStcjHtYT?=
 =?us-ascii?Q?6dKsb0IsuTa3Ucd8+urspm4wYTbABKUOdgl6fqQZxvaJ4jueccFaVquakV0m?=
 =?us-ascii?Q?n6QFe5IDv67GrVhEf3rswJ7opLigYpz48rOoCNocwmcsEAEf91lyZLWhsjND?=
 =?us-ascii?Q?Olo7Bw/TL86rsSE90f4bWuyS2ADAwQ7fdbrMjGigtqxTHoq7QuRm9UAqGUzX?=
 =?us-ascii?Q?BanTlws1RHecGRRNtssP94elj7mUkcAOMI149Ho3saeJm1at8EsRejqlfNqC?=
 =?us-ascii?Q?msYXv8j3/iCkFKkrUdZso6f1Yrb6qB6NksPenqLUvTUK/1qQNnJclFP52LI3?=
 =?us-ascii?Q?UKgg2sdOWFgPOxRmpGEUARkt8J9bh6ACORORt1srEdmONajxavdkA00aMwdq?=
 =?us-ascii?Q?JBO9TXfJkIq99fYOlL2uPvZ08DR6S4btEAVAg6meq3R7XK4BKKFcvk8hvoPz?=
 =?us-ascii?Q?r/U6lp/aZE2dm6gnORiwMtDSt3Stk2s7tiCYKsOpAQ4D9p8W4xAUS2nY3pym?=
 =?us-ascii?Q?8EkWFGjFOB6t7/vT2npm+b4aslEQg1vLXRb7PgYYgM/nv7C3ZmAUzt88272x?=
 =?us-ascii?Q?m394ZLOkzyG9wBGH8RpH4Osc5LJL3sQfK6nB9zPtN9sCEzuv2lzfax9uWK8Z?=
 =?us-ascii?Q?opScQLUZL2eqAhCvQLTbWaha/bBZrri/pcvSXvwHbW7qU2kBTxJ1/awgXPYk?=
 =?us-ascii?Q?djPwGN1t91UlM7eBgo4iAFY1HGF4qGxw/CvSULZaPGJ3/nGtNwq1pODOVLxm?=
 =?us-ascii?Q?3bz5aAXSivlWePw2CDv/lek9ujMAbGrO4AYT3GVt69CwUrDtD49gTxSHE3Mc?=
 =?us-ascii?Q?4uZZUjxa3VffhYjKsOpvSq2mWlNv2XmS8DpsdS1IVZ1immVZwrekn3ZwUbnz?=
 =?us-ascii?Q?b2Zx+IDXVi4IG+9M5vSSZRZUNOD3WQgjm0KpeP8g6NeFJDPQ1fx50ZmCeJ0l?=
 =?us-ascii?Q?rQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac269d7b-19eb-4b7d-71ec-08dcd0296708
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2024 17:12:22.2023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tIbeFufktB2lJkfHZGLAgb4esPXNkYY1gGxm0+A0IQhMSFhGzxBM3o3CQ8qRrQHI1XT8Di+XEbLdaegHdGkl5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR06MB9098
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Sep 2024 17:12:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112172

Change the reference to the Apache-2.0 license containing LICENSE file
in the downloaded archive.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-googleapis-common-protos_1.56.0.bb           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-googleapis-common-=
protos_1.56.0.bb b/meta-python/recipes-devtools/python/python3-googleapis-c=
ommon-protos_1.56.0.bb
index 0a3547ee9..5d3640666 100644
--- a/meta-python/recipes-devtools/python/python3-googleapis-common-protos_=
1.56.0.bb
+++ b/meta-python/recipes-devtools/python/python3-googleapis-common-protos_=
1.56.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION =3D "Common protobufs used in Google APIs"
 HOMEPAGE =3D "https://github.com/googleapis/python-api-common-protos"
 AUTHOR =3D "Google LLC"
 LICENSE =3D "Apache-2.0"
-LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=3D89aea4=
e17d99a7cacdbeed46a0096b10"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd5=
7"
=20
 inherit pypi setuptools3
=20
--=20
2.39.2


