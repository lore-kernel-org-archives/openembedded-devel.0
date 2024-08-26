Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBF70C5473D
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 09:41:10 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.132])
 by mx.groups.io with SMTP id smtpd.web10.49386.1724665264443298756
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Aug 2024 02:41:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=Kn3sN4Qz;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.104.132, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xvJHcmW19bKFVhQphWMpatA0EYhWBA9ff2NiYg4NLMUc1WFRq2fEv38VsLtbqFHVowvZlM2M8I4E8XjV4914vb97bnXLvYYdfzNVH34HRyarvw6FxBi1CwPGV6nbP7t7Kqidycp+12C1gO3p1S6cFOFtUjhzzd6s3/boGSPgShjB9y8w8HBD8/xradjE5R3OZ/cO/oijwzk+r8Xq21RG9tg/oE4ELjP3xQBAAiKNMTBv+OF3zxxImAOxTZSMfPiZUzYrcGtQpMNhRsc+0m9OVn8tIbMeb+RqEQIOSqiN+Daf7gomD+x6KHtWh3DGZKZFfV7vi6uHFVIv8DB2kbJCyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KKkgm9IaoTJfbjzS8WcNPZvjV58huUHzUWgFsX7K5VA=;
 b=VnusPCuvJbcrohtb6gkovp/F7n1hziSjywfZ2nfQoJ+b7C5Rp+0zvLfZFzpVrNNEZedU4irAYDzb/sifDJCudMSK/qRw03k25FTRtm6Gz0MlMg6XI71rCWA8Q1xnqguv4xXyC8g9N7RboYRGzpaYFz6mnxWu2CdBc2AvkCG1W6d8ZUUdHd3C05B3z+mfUagFKYRs7bIMiF0cngrM+vhsWLS85d6FLgcoLMwlfS2KjmcS3qAbggVzf6j6uOgJHkisSQrO7FTtdbwbkkZxoppNmUMeRZLSpfai5uXHba3hoAU9Bf86p379lc15o0hfby/KRQnm652RFdJTDkpQ9wGfKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KKkgm9IaoTJfbjzS8WcNPZvjV58huUHzUWgFsX7K5VA=;
 b=Kn3sN4Qznej830VU6gzjM95XPR5HdJtGf2OAjoq9EczFmv6bsFLYqa1B1UivPfDLJhC4YqxiIa1Oa4SNiIzlna+PvX+2Gwq3g8fxwI3819d9ht6AdgMOtbZloTjnuw5E/8VwXgMkgij5/rUAiexhGGixw7A8sblOO/BgSu6TpufPCX6GBmJM4kdOx62q2ZJBnUWuGGbskKKSPgyF5WYUqLFP34PIVMJbLjuTHStd2ev7XZFpaOEZhI76CduKRpn23vSSLzzLHCeqFDx1fyugKBV1I8jkxdlx9qRGlNiuNahjvDu+PCtm2n9cmCuzHBGbrTl0dx0Y9xcwi4VPNBAjug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PA1PR06MB9577.eurprd06.prod.outlook.com (2603:10a6:102:44e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 26 Aug
 2024 09:41:02 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 09:41:02 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-python][PATCH 09/21] python3-parse-type: Fix LICENSE
Date: Mon, 26 Aug 2024 09:40:09 +0000
Message-ID: <20240826094021.2744296-9-niko.mauno@vaisala.com>
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
X-MS-Office365-Filtering-Correlation-Id: b59ab4b0-0347-463a-a35a-08dcc5b32f99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?cPlcB46+Oln6IcJDWQLm8PU/Ixb9pTP8SNZ+u1gH8iHEiemPuyMOpFKdlY0S?=
 =?us-ascii?Q?kBTGFJ88eRUAAMsbywptG/e3Ox1ps0BIJqqnC3671lgvw0J855vT/20eC8LH?=
 =?us-ascii?Q?lx1IxMqK5w90WBwm1RS0fwzAXH9AqewCGol42hjo7Zzl7wHrXDYJc29pLm4g?=
 =?us-ascii?Q?k7U937PHwPxHej98yea+ShnAMFQ+Bq+A9vXp7SNPwApemHKX2/4A+vAFrrbV?=
 =?us-ascii?Q?h3s6GD8PvOt3k6xjiRB4x3d+Kr0BbWf3gZ+j0TMIqsD3kR0hoNZU7KcZoqYl?=
 =?us-ascii?Q?4/rpHa1IeaYNd7AcZk+036ZjYc8dzYLGCvcXUtHhQbPqh+10gOOtHZW13AbP?=
 =?us-ascii?Q?jNOLLiJqQTD33eZqeYDdnnkFIRrzpmpDQ0zq0c1DvJF6ErAeZRDDGnOIUBAF?=
 =?us-ascii?Q?8akTpWt7zXayhC4M58Aqpj7QQ6Px4Mvlw8Hxc+fpUfo+t1hcnRQfGQMW1oNq?=
 =?us-ascii?Q?EFqpTFYf/FMXnG67odujiNxyzcFyQEzp223ockr5a2WXno30IZBprV9UNhrn?=
 =?us-ascii?Q?C0zl5/YBo7WABtV/20i7Og/mwDzAKVG4123P1x9PQKXQiTc9yChSgT6VH84w?=
 =?us-ascii?Q?8ByWml1FHz8rLZWxsIGSFz1N3z7g/W+LcuWkbsMk6D5Iy8sQP5Up/smoFva3?=
 =?us-ascii?Q?3dbIW9ScTkH6+8docSBzTgRsqpzG0Frgfz2XXA8vaOU3CbEm1L72gve/I8hs?=
 =?us-ascii?Q?qCCtXKfNrawhtGXbEvgabKnEJgMy1qnSFqERB1Li0nnfu2Go/4fAfmnoL22H?=
 =?us-ascii?Q?V3TrEKLE8qCsj+O9LytwjxSimnIZBhQqcZwouETmYF+zwimfE/7yKkc52nMx?=
 =?us-ascii?Q?abYo9mG0Y3g5p0Cuoc+yMBsA0MhTwqVI4zjJ7teXTKwwcV/zCbVpzlQbE1Er?=
 =?us-ascii?Q?xB2St8kZgKPOTS9amNVr61y4UyHi8zbeRSpQh04i1ofrgodCFckrfC8zzPZu?=
 =?us-ascii?Q?L5Xhdz3RxB0vzigJXPVqJffS9uvsX9p/HFw8JweUDBw0KzH+lcS+oQv+4YPh?=
 =?us-ascii?Q?u4VN44/hPC3p3cxLbmIIDt7wHMOHQkFPLz+qNnRWtWu7BuiEleNsVASIGE9h?=
 =?us-ascii?Q?WyDb4cZJduQ3I1P974WfUnsUbg2g+LKvQlrmI5a3oGDBI/1bIepBeYkgYt6M?=
 =?us-ascii?Q?yTtpvuvRU3D8+Ao5xB6eFW32ZU6Ql1NyN283ImH3+lZVooMWIuIRKbn7wtyl?=
 =?us-ascii?Q?ZQJ4qDz4BfGRkbf7HkBH7FxiyTnv48y3Zq/W6Y7V0RNc2/gB2hdECgSjWaUo?=
 =?us-ascii?Q?CsDKBXeJENJNoB6eg5YQQKjDyzg0848oS2KLTpoQdmC7draUYN5FfIL6FcpQ?=
 =?us-ascii?Q?FVr32zgQaGG8mErtTZ0C5Mmhk0rLK0DOoNcMmB9As4H34BWPfq3FdEmkHCUm?=
 =?us-ascii?Q?dyMvLp0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oG9cwz2/MJDme2pVo8xgCS/3q9Y9XwB6IFb5CcZjGRgSPFKFUlHbdHM5sWYL?=
 =?us-ascii?Q?GstIpon2zb/9dRSEFbubGD+qPpWYW/2R1dcXZv6rkNNJZ6nkDHKX2psqvVYL?=
 =?us-ascii?Q?ANJeaY7qVBu+T+thJ6mGM9ZsFz0RhNVX4JvA+Lhn7TGgXGIho9kdpOHEo9dd?=
 =?us-ascii?Q?iERZfgNaBeic3Ypc5QWMSIpMxBRpQetSKSyr1cA0oI3lGZ18jdDHk+pHKJKJ?=
 =?us-ascii?Q?6XSCOdQRCYa+t7P/mTzbe4s3xuK//3m2WFDkY0RJiPMJy5sqTyUsgFGehWLj?=
 =?us-ascii?Q?XJ894l70oojYvgnUHhcuPmt3LSSZbh/prvq6T6RU/CGZFwVOLjkJ63UHnE1y?=
 =?us-ascii?Q?j0PFLf+yRdLhgKqdgzdencYTXpvOrHbKzt1/7peenWedHjTM1vSwUPOEebOC?=
 =?us-ascii?Q?LAUrHYvdgLybBT/jrUSTt40uERRA/SEkQGsNNMSx6LXV4s6Pke4I4X8Xyvz9?=
 =?us-ascii?Q?wN4PkTSsAPWp6ZtPRdsJdAsT7xZ1LDbKirPNgLZuqpM+1zzmXNH/3QFG30Hf?=
 =?us-ascii?Q?jgcODwpZj4xpmoNJ8FG/c0NFBURbaxY32UE17UyNxSrrvZghpdwd7fAcgZL1?=
 =?us-ascii?Q?7AGRXeOkDErZeREPGV0kjbx6eVGgkIklBtOg2Q6fTPK+tBnJv+kCy53Htbo1?=
 =?us-ascii?Q?YDmAnA/QFuu4csHysbQcfGG0ThGhjZ1371c8hvBasW+tJt8a9K/Fn3hlnNVz?=
 =?us-ascii?Q?WEDpaLMOmDHVVqRhSUI0D92CbG4xYVXV1ImaWklWV9MpK3Qvv6fs7DFUDrJd?=
 =?us-ascii?Q?ySBg7e8ZC7Mfv3efG4z1f2IzdjbCOdqMrGBy//lL2/9Fh7iRNMO9Nuh+LC+P?=
 =?us-ascii?Q?EdGZTUSvorThu+GCsQGmrP+I9MhYSHWb0drs9H+/iNd5v4VTEsO/ShBfl1Qa?=
 =?us-ascii?Q?Hq4vU33J3pBTVwgUIIFHSTqE32xfqn/gyQBaB2tpwlkDnsdt7Mxg7nwhWpXu?=
 =?us-ascii?Q?QPo6MqQkWFev4GJV5rrK/mJTzc/SDGfpCRanRRyY/95YbHK+SvCXgxw+pZVb?=
 =?us-ascii?Q?l3pY8cug2s1fbbeGw4xKIIAn+lr39xT19Ftm1BvqoHgRHxDuHub9p783AFrU?=
 =?us-ascii?Q?NPGsE0WvUX8/tCHfg4GHYfWLqE7TkdJXj6/4POqg44IdfIF2LVAS8LWGd4dO?=
 =?us-ascii?Q?9SUgRh8JoaJ3Su5eSGv05B42ryCExy88iPjnU3vdMhQaDFjHuE0e19qCxUWa?=
 =?us-ascii?Q?qoslUGOgCigLBRAiEyHQhpWDbTZTjUFT1H+ys0vSfpc2qflbcvIIyaPl3GdC?=
 =?us-ascii?Q?GEYdUzQLP0K233QgNFNjUTOii1Sg9CqHUzZUbLwNqU/HVsYldv6YsPkBj4D0?=
 =?us-ascii?Q?+/j5QLsjZtDkuxc+rPZXvsryoAlgxNcYt7sOCvsfisTGVsxOrxLHsFn1sGva?=
 =?us-ascii?Q?v5HLnaqvcsuXmRKFD/oiSmllwILkdajXUk50i7BnXKjab7F8Su6uEf9vg9HX?=
 =?us-ascii?Q?ZuYqtMjT95ebyOccNTEmW4DgUPyl3gnsLdzpjXTfNCOrCHz6TffHmc/htc6I?=
 =?us-ascii?Q?fE4ijx0fjSPqIydXafFqTDVh2U2v+ALWh4gDaqMhjz+1fcFmgFj6jZv3Vpvb?=
 =?us-ascii?Q?hZ9v3mV9oEVV63oy4+GZXiQx1kRf2RIoRrW8NNb05SYajRPCk/bpQWm1imFW?=
 =?us-ascii?Q?tw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b59ab4b0-0347-463a-a35a-08dcc5b32f99
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 09:40:56.9807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XQSMaUv3Wg3wzn501WmXhLH6j5o47W3gswSeJzEDi0TTIA6otoU+xj1ES8ABs6f74VVWwaLkzolQJq34RlaKAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR06MB9577
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Aug 2024 09:41:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111944

According to https://pypi.org/project/parse-type/ and
https://github.com/jenisys/parse_type/blob/v0.6.2/LICENSE the
project is subject to MIT license.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-python/recipes-devtools/python/python3-parse-type_0.6.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-parse-type_0.6.2.b=
b b/meta-python/recipes-devtools/python/python3-parse-type_0.6.2.bb
index 7e7ff8926..b5d9b2057 100644
--- a/meta-python/recipes-devtools/python/python3-parse-type_0.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-parse-type_0.6.2.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "Simplifies building parse types based on the parse module"
 HOMEPAGE =3D "https://github.com/jenisys/parse_type"
-LICENSE =3D "BSD-3-Clause"
+LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2e469278ace89c246d52505acc39c3d=
a"
=20
 SRC_URI[sha256sum] =3D "79b1f2497060d0928bc46016793f1fca1057c4aacdf15ef876=
aa48d75a73a355"
--=20
2.39.2


