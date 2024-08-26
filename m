Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98D0CC54733
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 09:41:10 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.132])
 by mx.groups.io with SMTP id smtpd.web10.49386.1724665264443298756
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Aug 2024 02:41:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=g/KyPm+A;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.104.132, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZtiDvHg8rqKUrEjDt3vWrgteRic2rQ4AN4xBqrt9XGea4+UZvqNLv0ttqS3tu8JS8e86Yky0B117vQoDZLNyfO+vdzX2w27G02uDl1SIPjt5P6M6BJeSfEaxbF5IZiEz6lkObNlKilIlXdmByznYIkaRQ3T6EuRKW5k9khpDvAhEn4/2bMrdFngDyJmk4n3Sc0vdlqsqn6VTu9bdlFKOxNnFscvcJJNxO+x8zrF8I2IVMSFY+Zp1FeJpuSY796woKqaZzmLUeH/0nwODkkK8dxNWp5qIec3DPl/VCUKisD5cDUzVOy9Af3ki1zmVc5FFQJ2jY0Jh1JRnKPUStbAQtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r/RfWOmI7fDy0FDhNkgwcEuKlRu3B/Vo7rwc+EOowkI=;
 b=oNIlx9BLiN2Fa1aPN3L+C7yimcb3PjzR+bvf2sWrEa7JBFdikCKup68gnahqVq7fqfc4t4r56Ap6ona4DUCNHzh27bfHyPF6/MwTHpZJLDDiumXmPRCcpm2u/af4vIPehkUwLtCk6eWuZmFFKHo8TcfQY68rqfEGGb3JCbt1qJJr4Llvposm3HcY4rV9XsUGLpUlHi+Qul7LwXc4lh1T7FX2VtF1brB5HLk85/50d+xjjR6OwicuJ1rLBVnKH1aPwkCN35yrw1IjjnFoLli4eIOYxz9DB5JaYv4urWzmdyPpBSaLW7QQALEN70UejTpH50Ikd4hcmS5EkCtFS9Wsbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r/RfWOmI7fDy0FDhNkgwcEuKlRu3B/Vo7rwc+EOowkI=;
 b=g/KyPm+A50pvJQ4VKvWHwg6IeOYio3EN0o+14D9FRPJFS27iKiZ/mCFgzLPKODQSnA/eIn4A7K2A4rAGTql86uJDoHdLDlq5sw27dnJxyO5mN/VvskO9S1Nh5oAUaOg3g+kWd0bFpdCClbMo15WjbzNU3x1+2/L0WU5mq4ZvKNnHXAfkygPrEcA3M5jvZAfhOcV3Iy4RdKY1ahImSJUWigFUtyZE94iYo0ZJU3t67nOvTuGbENNz6r/baQMxd2eHFSIiT15sTx9PJbtAfkDG0/1SAzcQLbCBX25DQVAkbZ1A/B+H5+X+IDHRgGqAUb+lNbrFFlSZX67dRFYXq+BTug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PA1PR06MB9577.eurprd06.prod.outlook.com (2603:10a6:102:44e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 26 Aug
 2024 09:41:03 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 09:41:03 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-python][PATCH 11/21] python3-pillow: Fix LICENSE and change SUMMARY to DESCRIPTION
Date: Mon, 26 Aug 2024 09:40:11 +0000
Message-ID: <20240826094021.2744296-11-niko.mauno@vaisala.com>
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
X-MS-Office365-Filtering-Correlation-Id: 68c6beea-c456-46ad-01d0-08dcc5b3300f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?sFMx09iSRqjRWw5WGoHtMQ3Pzwu/J6UltpdZT0s35IB3xIyiERBDGneuGKcp?=
 =?us-ascii?Q?IWf3nAaOfRj1cms8OZRt1CYtmPNLte6BeeK4EAPgP0SRk7U00Pmn+Dd9Pfaz?=
 =?us-ascii?Q?dZoj5739OypWUSAql4BBWCxGI3sO5PWP/q+KGKfpomMhJqIcb22b58OqaJC8?=
 =?us-ascii?Q?4tsOgS9NekBYv6DbOIcIWjMKvs63iLAZh3zEYCrpkDHxTgrrtHv7f1jyLUOp?=
 =?us-ascii?Q?CERFkYrUHSi/ZrFnUiJ9PZZXRopu7h44x8qMdf5VHA0KW/Grg8zupnVf+fMB?=
 =?us-ascii?Q?nw842nTsLFBk9gJsSTsucpBl0umMaCh6xhQMNr19Byeq8y3NRIKkZkARZLpn?=
 =?us-ascii?Q?tC0+WDg6lnGd/beibqkkzYzRcyb+uryXG9+l6XxsE3N+p+G4xjGubgNg0nqg?=
 =?us-ascii?Q?XoAGWoTL8PUHAjlMtSvdPxyLNnz/Oiec6bfbHtcYmX64uCUhKVfXvhHgKexc?=
 =?us-ascii?Q?NZnLYcDejktEq26mIedsrh3LnWgv9V02n0sT2OKecV1fvyR3WIVehTZfatWd?=
 =?us-ascii?Q?/nDYFzdvgLpSPTABxNjMc6hJjjv+dQ7uxbSR6eesQEFBwK3B3jN8NA0oN3QL?=
 =?us-ascii?Q?3E/CFULqzM/KqSKBuMZWrdpxMoHbfCLKryVbPEaGOW7DZTmCorHMY9OQQj9F?=
 =?us-ascii?Q?uoi9K98eeLHF4g+DY/Os3sGM5tyFTuB1F6d9/fhTMio37F+nqa2rZ9W282Eb?=
 =?us-ascii?Q?dbP5TBtRf1l72auCE0+UsE0JbX4fl33O2WNyv4irq3YTSY/5V+AMfohZapYE?=
 =?us-ascii?Q?SdUh/XdVxyje69qRWxeWif8cZJnLQWugc1ykrqntvNldQLej90E0CvHXj6oN?=
 =?us-ascii?Q?CH2EHmp6+mX2/dQsmhsGWkTUHVPTnjjjeU4yH3rKnL5BkYTcXuGyKJFpAIBA?=
 =?us-ascii?Q?cTmjF2LaNdms5yq/qABeOvi6EC7VTj1ASs1ZKByHFiQYD3bkYW/gQYjQDNPz?=
 =?us-ascii?Q?mMLXfdFQ1y51RXAZP5mBEceW1UyD8PfDN/444mdakbJgR+nBDcV4FOU7YS6O?=
 =?us-ascii?Q?+YuqZwdCMSUZszSbID5S6s4czFyAF31boy/Ql2qitizOnV6v9reUGB8O2jJY?=
 =?us-ascii?Q?bLfR0uyEq630AqcEfGYn1uhLNA+FWpfgHeyDKW6p+7sR3LA7Pvydg0Wqljtb?=
 =?us-ascii?Q?DQRTWEbbsof2+ozl8SIrAc9fWJZtfqAClOGpdNoypuAoaAbgw2az48NzCx50?=
 =?us-ascii?Q?9aK8of9A29YPVvnAa3WRtXyyzzmSpmu8rupNQ2ZWWO6zMlQzlZ51fQgo4piu?=
 =?us-ascii?Q?EIYvOWE8k1Kzr/mEI4ZThTwoAOO6nLfJDnxxkGfKUh0ipF0yYzo+bBZjs1lx?=
 =?us-ascii?Q?duIu7YGPJ+TPlwMntV32a9rDwPUzP1Ei0ruRjd8WRNMA0Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zScijWGn+Zi+zGoXkbuOMnSL0jWHDkMKnxe637swd9OO8qi+y5HqfekKut3e?=
 =?us-ascii?Q?h0EE9Rq0NLnQ0kaBSq6DkxWHutWOOjia4PZmf7S8ETkzGQyf2DIOtLa1Btyk?=
 =?us-ascii?Q?LGpRNzI561SRLE6VYZwO9CXfqig73OAevvSHt0t7AVlBiH55Rmw3nAf1rwgi?=
 =?us-ascii?Q?gayaTs1Qm0XkczrQsuh8qLh3tBPg9qfiLMVyC8jrkU2F+K6cBItScii835au?=
 =?us-ascii?Q?BXMNngutc93+J6uMdSY9iC7CIKkjFFPaa9UZ5/qOhSGR7kB6RNBGIb6feri8?=
 =?us-ascii?Q?Q7SV2Em2nnvP/TiSwD9fe7g26jKBNFFqAvH+zE4midqX0hOSqrYbFYdNmeil?=
 =?us-ascii?Q?PRacgRcJghgAR8zjlbeLAQY9XeqvHXMEioPaenPTglK4r0R9e668aQewSEF/?=
 =?us-ascii?Q?KUqmposRUeShEPRY0Z7KnAKFCPuye4RhXfEFhqVPUXZLj25ZmwVrtv3Vjg2Y?=
 =?us-ascii?Q?xwsXNM8OM45tyEPuvW+ZIQ7OoArZPz/FkUk75/8SR5dDwk2ZEJcYv7lCnOFg?=
 =?us-ascii?Q?Pp4JS+g7BXzymHMirL1HgdNfuP1f5NJAGIeG4VhPA5ozlMTVIrLzBBZkQQwo?=
 =?us-ascii?Q?nB35LRLwXCxqdUTYqe0ishZS/ygCT0mcGXAOVSETxdGeKLt18offlqOlqG9e?=
 =?us-ascii?Q?xNulvlMwkJSwBHgUFtchZ0wUaaP7vx0pYiUGLKCgatHQIzWewTxiSlCIYQUZ?=
 =?us-ascii?Q?Pbihmk8HVbb5dQXrcqFaiNIK8164WFt2uH5FXC7WsJ+htqNyWuo+RuGDO6x4?=
 =?us-ascii?Q?5hcT4ocdBCnPkftWS7b73hKqYamsmPd1LmAaZdSNo6pMZcXd42b4lpYbKmFn?=
 =?us-ascii?Q?510JkJF0fbV7ByENjS8VirrsM9mLUX7y9mCtaBPmOAnpuYdZUTWBRNfl55HH?=
 =?us-ascii?Q?b0iGyOk3L9NyA6mVI8YeAwW675FyKyaXlyQ35sLsnXAHL5Gde4nG36DJOBXo?=
 =?us-ascii?Q?W8gpgbcPjNfEpHI1sfZ4C4gXfmlORsn9C7mSKDqu7NZ2DeE8mhNQRb81YhSq?=
 =?us-ascii?Q?WlsXEAV+uq7DRCK37xH/26idn7wbba0qO1sGvwg6iZneeaJ8dFnKTn7pQGw0?=
 =?us-ascii?Q?S0mqPdNEGAHUvzY8pxS9r+H/3DCHAt635oylJPONz6jWX8ewvW68gHxyUFtw?=
 =?us-ascii?Q?KhBRAfAwXSViT3ZSsGIHtX3kG4NWKAWrR/yQV2rGkbQfU6P6YCSXi0Y1dGNu?=
 =?us-ascii?Q?zVcSllVecii+Y9hhle13JujSuuvv43vLDE66xBxaUVKMqtLHA93VqQMWLoeW?=
 =?us-ascii?Q?qdnSI3fCtlO5/tuVmiGwf7YrPrxJCWH7JG8J3CBVnoQGrvgL3Z+BpyNd3h2i?=
 =?us-ascii?Q?EaP3U9lok6Pmn2/qD/SUV+TZTZE2gf4fK2RvM4k/Rn4VB7DoMAyrbIQNvkq1?=
 =?us-ascii?Q?7sXlmKKQ34nRl7AhL9a+g/scr9I1VIKEmyZqwRjfxj2ssyfzC0Rq3krpRmf7?=
 =?us-ascii?Q?1U48p20aLJRQV871rRLk4M0PaX8ELWL9hKJju4ZlUNgzKwYs/aS26cl1jdGv?=
 =?us-ascii?Q?lWcRFgadhx9ogQEHy7F9LtdtlBxsg/QGYar8m6kZ180B25CbIqvg8mgvWmWq?=
 =?us-ascii?Q?vneZD+c/iVfqC0zs5Zeq4ydbaqq24k4Eaq57H9fg73L/SJ6wIIfef98wKub6?=
 =?us-ascii?Q?Og=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68c6beea-c456-46ad-01d0-08dcc5b3300f
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 09:40:57.7274
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GP9QYreias0URdx/9lzCG98o6ufvQ7Co8TiSLnqfxNhgT/lvpEo5kQEhJ3lXA2zxgREioFWEZrAnbtct0EhTQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR06MB9577
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Aug 2024 09:41:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111951

According to https://pypi.org/project/pillow/ and
https://github.com/python-pillow/Pillow/blob/10.4.0/LICENSE the project
is subject to HPND license.

Also change SUMMARY to DESCRIPTION as it's value is clearly over 72
characters long.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-python/recipes-devtools/python/python3-pillow_10.4.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pillow_10.4.0.bb b=
/meta-python/recipes-devtools/python/python3-pillow_10.4.0.bb
index 71159ba50..2a9d9217f 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_10.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_10.4.0.bb
@@ -1,8 +1,8 @@
-SUMMARY =3D "Python Imaging Library (Fork). Pillow is the friendly PIL for=
k by Alex \
+DESCRIPTION =3D "Python Imaging Library (Fork). Pillow is the friendly PIL=
 fork by Alex \
 Clark and Contributors. PIL is the Python Imaging Library by Fredrik Lundh=
 and \
 Contributors."
 HOMEPAGE =3D "https://pillow.readthedocs.io"
-LICENSE =3D "MIT"
+LICENSE =3D "HPND"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc349a4b4b9ec2377a8fd6a7df87dbff=
e"
=20
 SRC_URI =3D "git://github.com/python-pillow/Pillow.git;branch=3Dmain;proto=
col=3Dhttps \
--=20
2.39.2


