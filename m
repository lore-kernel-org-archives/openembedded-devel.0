Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB759C54740
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 09:41:10 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.127])
 by mx.groups.io with SMTP id smtpd.web11.48817.1724665270076341150
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Aug 2024 02:41:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=VizxwxaP;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.22.127, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FyZltA2jR8s2B8Prg7YAkpZ7FJfWIQ4EGiUQjkWb+G4jq4Gl8rkKFtgHqDeM5Cpy/ymdgOP2njsSzBrVLhQpNOieNFoKaakPeNPgm72nr8DJtd5oJ4xaZ6Ph2HQYSVVD8OSWxFxkJM8/TEC5Cvwi94bMIduacaQ6v4R89Itabk81FzCWfLaVqHKGHdM7fl6rpvXCM7RJRc9d58dFuHz/R1wDgOpCPh20dvZJQHyAB7SNj96vSSNx2MzH53jFDzJwW8ORBqSDFVVNVGAEBkGgPcgakrpVWsQOIcdKS+OBljBERJOzxTL0ZzRX72/Nv90y/H1M1KNNOOge6lDPAAYdFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3s4AzwWhOOBRZABt0x5xUGjjS3UXsbEJ7uf8ppDYMcY=;
 b=UTVsToLvxDupn6NMRwNZ1cD1by7XsywgcCMiF+OJ9JolzK5E0DrlYvD/2sELiRlVYm62VaHC78bbQoJsv2ir82Pb8qDw5wBeaJ+wYrr4OV7iM/8z6BBhiulVBWj2fSrjR327/4LwVeEThyfbv6dku3jE35jB6s0sVo8Da/2xfCW7tc3TuywAODKOUMhQpg1gOhUFyCY+GspuWtvEPY/2CRvbObIdSGoJu4zZjgMzwCyjGiBoIKGMHVPG8MU9ZVsavH21p1GDoho19hYLXntlLkKehT7f0xn8Kklgp3Tzrs1PPWNgFcHsbHjpiHcVpfYZh6gv2EDdtWvAQ8JuoMpSEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3s4AzwWhOOBRZABt0x5xUGjjS3UXsbEJ7uf8ppDYMcY=;
 b=VizxwxaPIC9JCMM5IK5wRxIJVdswQ0A+R+2fW8UKR1OXLp7PVWwZ1M72baR/uuYdo/GUgmHpl6bv2w9N7JG0WmWIQkC5WcwPtJEDx7yk2yq23XLxixRJyYsTTDKZjyze9wvvUlt2/O7uVFCaYSpEA1f9EEMm5LO6DJ1ns8vy/zonXwd0iSwpjy69aj2xyiORF9RNltjI55DtusJvjSWtZuqKbfZwKeu1m0Gt/U64J9+NjjN71zGXRI3bqk+WC1EofnTvzoxjgzOXGGOtW7jgnsRTtFkozj3+SmLoOV4b7GG8P1xa1oTa1mj/+O65q8vDfrNB94pUQgz1NFY49Wur1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PA1PR06MB9577.eurprd06.prod.outlook.com (2603:10a6:102:44e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 26 Aug
 2024 09:41:05 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 09:41:05 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-python][PATCH 14/21] python3-fann2: Fix LICENSE
Date: Mon, 26 Aug 2024 09:40:14 +0000
Message-ID: <20240826094021.2744296-14-niko.mauno@vaisala.com>
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
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PA1PR06MB9577:EE_
X-MS-Office365-Filtering-Correlation-Id: 0447f919-acd5-4aa5-a8a0-08dcc5b330c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ebImIIpAW0KP2yQFSsihQEw9S3v893rsEcpAln6V701yPT0mQPTWTtYCPE/6?=
 =?us-ascii?Q?uN9ufilp+4rCkqqBP0gx5JhAKkPtAmDkXT9rmKTcHHml/wNZndf3hywdYWR4?=
 =?us-ascii?Q?9UG4Mxg9quhp08puUOVbr7TE4YPPkNQKRLoVm2uCkd3QKGCxAhRFQSdhKlBI?=
 =?us-ascii?Q?EBTCWylEna9kC7MSfZt1ksuTWkdVrOWK/eIetbevI/CPbtQbH+w6vl54fDh+?=
 =?us-ascii?Q?ISyHrYeD/Hg2dJTY7BTNIcwa4wMNpNkTBEUvW+8GslR3B1S6N+bYHSRn+kLi?=
 =?us-ascii?Q?LIWnidKTIFUwy4ZT2CZs4VL3vceY4w58206wvnJ333S3eaJNWWws/eVIB6+N?=
 =?us-ascii?Q?A7IdYWf1ueE0PfB0CCp0Nc8mA6MlmtaN4B6vTGJ46D9gNu9Yzkdy7k7gvl3Y?=
 =?us-ascii?Q?bes8If16SH3qIzGs76ypuaRbOqF1a8PuEvIhuI7v0U4buQfjBIWtYrLUFluV?=
 =?us-ascii?Q?uiZTMQuIapZ9Yr5hk6hAkN8ucZWe6hF99319xOQMuq+PyqKKAOG9n3TcaJnu?=
 =?us-ascii?Q?tlhtdwfkE2vipRRXHhFixu3vIzn1deLLfdy25ZJkFj1jVawn4yMrdcp1Xhe4?=
 =?us-ascii?Q?WYV1cCzSxRg1o13eQcjGUHVvBO2yiJ2krjhgVBnzctzSzOgYIGF4ybH/O8Jx?=
 =?us-ascii?Q?xQrjLUcB8Mh2MtRkyeVmUHFUFvLGU94/CjRs6/zTIiWD4EQWJ3LIMorXq8iU?=
 =?us-ascii?Q?SXQE7che21kcuRNwEWleXHk2BXCDIHJsCZxK5PvCTz7OWMcAarLZvIvhz9wk?=
 =?us-ascii?Q?hyzbrKacn0rn8KK5sKoreFORmOweP6Tf9SN9B83Jc+z/4FmeNl+ORKvxDCPS?=
 =?us-ascii?Q?LB9sU4pC3N9lDMBVk1quY57+rci1r3S2VxZSzVTobwCTllpY5A4zDINIUZPn?=
 =?us-ascii?Q?V7XzRRhU3hXa+E5ILlVQT2qgztLP82bLIREw3YSu3pF5ylDzGWpjLtiz0QKN?=
 =?us-ascii?Q?eSBOzJIHjM1fQc64CiR6E7JKA+uHJztwAXE/5OJLtowaPaFQKIRQbXqcOwIk?=
 =?us-ascii?Q?lH1KYPfFBefW5Zh62hr79PYuUzgLF/LxZIc5AQm8MAh+bTg34Nt3kb/ASOvw?=
 =?us-ascii?Q?RZTLopjXFYNVniV3RvA0/qAhljVexn+dAppaP0WGH6fScoqFG3baWRS6ef7d?=
 =?us-ascii?Q?YlYqHypMwCTwIjux2SIIMZcGWYdp4qaRJPglYsMcdXDWnS88Dqk0KJzFjRS+?=
 =?us-ascii?Q?sQkyw9lsiwr4Bdd2zBAM4etR8ZgKvewbUlxA5O1owtanedCyxB0dQWdt5etr?=
 =?us-ascii?Q?1SM0sy+eC4Qczq4ijQCrV21bhVhNO1uUANDfC02Bmfzr4oGE2obMxIdgtfuA?=
 =?us-ascii?Q?PTI13lVwW93UA11P2DX8YaGDKA57P0Y5dPLtLfkZRxowxmYqhl2DyJPtou8o?=
 =?us-ascii?Q?ZNzNWmk=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Ytqlq9DS0FrhCkqfypqYaGIiw2GEFXY8V2ltkklvx7pvUtFO3C6OS5/Zpl4R?=
 =?us-ascii?Q?fBicxPhzGBfEzXo7HhepxCKZknkA8hml0OHw5JJ4EsAt6sVgV5sFHz7kzKMt?=
 =?us-ascii?Q?vp9kw9V9j5MAJNgcZ0B6Gtx7wO1pQpSnCG5rEQ//j6ivRLRYU/t9EzUKjl+7?=
 =?us-ascii?Q?deF3c0JnUjXlx9VeeIcctDq/j250rjP5IHqqKL5mlB3Or0VfR1jNnjAv84vc?=
 =?us-ascii?Q?qqQzAGCjh4s5idM9rPQEynE+itMnUJkbjxsTPUnFXcaF23INufdW/heD3cWr?=
 =?us-ascii?Q?2Altg8emY9uzzzyPpRXjQM9rUpomFLVyw6H53AsSZa9A+B6p0pWVgfDctJEq?=
 =?us-ascii?Q?wCxlFyIDspTDbSXxkwsrBowapYIsulkfpNZ6z7iGD1sjoPqVnbsdX76coz1X?=
 =?us-ascii?Q?xuJ2OSAoCGENCFv3uk7QMwknjopPLsEPlIv9IGdb6td6D/oTQoV01pR4cMn/?=
 =?us-ascii?Q?YkNw9EPMdQpv7IIkHLfzv3lQI58KPNwGWAXfZnw2Wai9fkGAyIh7ffZ2CIg6?=
 =?us-ascii?Q?sbs7Wo4YS+hZZaJ/xXj0+O/gxzBFXUL6/P9fz8sj5FRHYpAqeBAEC38ENT0l?=
 =?us-ascii?Q?75th+V8+XNqUB3LSJAiCR5Bm26DsPYaNMhD36vpxYQMcqgZT0ZGvaP9SaeYB?=
 =?us-ascii?Q?8HMEo1nY/umtIZkCDdj8luCdlYuryPhvcmtVT4Rhvz3LgBZ0WRKI3f0sGaGA?=
 =?us-ascii?Q?qNgWTZVfWJ3zGHUzPBszNPNssHN72tjQjVKAca0LTBGhhPRKNu/6ZM4oQ6IE?=
 =?us-ascii?Q?76GkdvtgSd6CIh7T79LQcMcQUW+H10yaJ2Uoyn+Gq77BqN27nAvjnlFJgBQr?=
 =?us-ascii?Q?fz7TUPEQEZQ41+P3ira57semfwImS9WsWpRpgeHa+afn+HMZZA3lxJS5CB4u?=
 =?us-ascii?Q?FvspQpE6S5QMsYj2v4olnsZFdzeFZcByL9Xtu/B4pAkSiEyoyrE094UqitCS?=
 =?us-ascii?Q?nRtCMOYzFgb3Nb9bgZwJUEsPAQD5cSal2Krs6icl07n1AHjVo9a3E45zRlSn?=
 =?us-ascii?Q?aL4bKaGD87/RfcCCKT6oddjNd80HMfYIMza0D6EZIau+d0FcJ5lUJyuFjeqP?=
 =?us-ascii?Q?h0+pwIEG5bQXzxsYnfKdgtI1ePPH5flPqfZ5o9BOiNgG+AnkZptMCXZn50RV?=
 =?us-ascii?Q?Kyty74CIeiGTGotm3Gx6wT1w0pXuxmvQyYQwSM2euUrAfkqUHchlYIlwVPFV?=
 =?us-ascii?Q?2p6/nHS+YAy+oQMirYM8h0ucZZcfC8eDLnqp0zY/Rz9wvryNxp8vWBvCWSex?=
 =?us-ascii?Q?yE43xT5TLmvIYz8QAySbYbCtgLiNNzkLNQE1vqSUQt03YuQt7cXh3xTYAH8n?=
 =?us-ascii?Q?wwv6EXl2VQfo/vaRtGzWlgK9MMSs77bvIq2U2nvWZhDYWGwb+hE6GTTE84EJ?=
 =?us-ascii?Q?o2VOVosA37XvUZCXKFXMh0U8xMezX9OxhptCgNMBKyk3T3HfgwO+ThyCNM3O?=
 =?us-ascii?Q?ufEhBQrVVPRVXFaIJOmHdXqZ1Tg7Dxt4ydFIxHLr4X/5/BAYnX0qKTdu2t16?=
 =?us-ascii?Q?ypL3x0VPBFT+NqtBgn0JNBP8J4cwaX1RFtBOwKTgDp0omXce7Sak6y/vX4b7?=
 =?us-ascii?Q?8gE759IabbTanheQOWBoFsOM6WGimA1HDl5Zhlp/HIplrjVHwHW3g8RNoxVb?=
 =?us-ascii?Q?Nw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0447f919-acd5-4aa5-a8a0-08dcc5b330c1
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 09:40:58.8926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EOhNymFJ9Tqy3X7te6drcqoiEJjR1ZNQ+bvusmBGgipKGvyhEGyK+ZWnUrPnXGVg/CT8R4zE0eJMCcP6eUde8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR06MB9577
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Aug 2024 09:41:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111956

According to
https://github.com/FutureLinkCorporation/fann2/tree/1.1.2?tab=3Dreadme-ov-f=
ile#license
and https://github.com/FutureLinkCorporation/fann2/blob/1.1.2/LICENSE
this project is subject to LGPL-2.1-only license.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-python/recipes-devtools/python/python3-fann2_1.1.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-fann2_1.1.2.bb b/m=
eta-python/recipes-devtools/python/python3-fann2_1.1.2.bb
index 2fbc27713..2099d791d 100644
--- a/meta-python/recipes-devtools/python/python3-fann2_1.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-fann2_1.1.2.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "Python bindings for Fast Artificial Neural Networks 2.2.0 (FA=
NN >=3D 2.2.0)"
 SECTION =3D "devel/python"
-LICENSE =3D "LGPL-2.0-only"
+LICENSE =3D "LGPL-2.1-only"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc73b943dc75f6f65e007c56ac6515c8=
f"
=20
 SRC_URI[md5sum] =3D "0b85b418018746d63ed66b55465697a9"
--=20
2.39.2


