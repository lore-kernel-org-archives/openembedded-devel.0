Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDD07ECE585
	for <webhook@archiver.kernel.org>; Sun,  8 Sep 2024 15:34:46 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.131])
 by mx.groups.io with SMTP id smtpd.web10.32311.1725809677520700433
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Sep 2024 08:34:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=COCXGVRu;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.21.131, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n/CEcz0wasCm+LgGj4EEXBZ0naa70oKLDbhuIT/qW69khmJUGGwsFIVCYopacPsh+RmlpusIQOkqQ352S63nJ80mRZxfljZ9CjZigcQffcWGN9mAB0kBCOIKvm/FP7u7D/+lTli3Zgpw/RnpqHFnPQG157jhNOvkXegUluOwBk/iS8JgbITomUk8OHSMdmhBDwOUU195skBys1mNMeZfEAHcNuWUPWeBZQ3peVcjJcs888vjHWUYy09hCK85QySuOSaGquKU/Nxq9ZT+1qgwD/vpcRWRYSLqndtAXr1qfyQdBMupjmgZsK/rFW9o4tRA6B9S7NIaCTk3VUmQ5K3uoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8KByd/5OocCem6NrJKwZ7ySbNMKeP/QLmc866C6PsbY=;
 b=uae7R+BJCG1LMoSCjGh9fZk0IVqONUHC+WS4FOO9EgWGvawb01SJKoFhY8Qt2avUepYvr1p675eVJui7uqnxc5c9f0nzhELvrtjjBAql2c0UuLBPVg7IV5CXvwMxqgVeRcGUr7YgjkKvOjhv345wyd5zqqWi7NVzQOIo8KDigyDgYjaxMRiAKb2xstXIWvC221lM0pPbHVamyL2NxnSEWJ/WwVrlCACd2fDlIvT6PzJe2SePd4uZ2b3U6Bi6FkVtOBkcGyUsRhzBBshlkjwEDwMePV0k/xUskNcJlxaH2tBuwGLYycftYcKwANctCvq6tOI3El3RzpDZYkqXnGU4YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8KByd/5OocCem6NrJKwZ7ySbNMKeP/QLmc866C6PsbY=;
 b=COCXGVRumMThYWuxekJtmBLZ6/S7bwBuaHSVJR7NCPPZ5JoN/kz0NreaG2ylD313XEzRfyKZWkb99SKn9fKCBgZURqJboIo/0IwakLEGHWZhebta8uUAablTOriyATWNqRDN/H3KB6jmLsQ+gJrtViJRqv2pBDqw6VHj4wss49YgMCOh9ykGW0ssI7IR9UF8u2J7EUz3fDX4wygWL3MSNpzrnQDeoIdgi53JAMFhr/GwiamLdOVtz3PKn36xvjNMa75aulw0CR1eTrhGRYATA6AO+RqyFLwOJ9s5M9RWoWeJKntgiJf2qNSWAqN+a/JCHw4DYLWhfdJkt/Er2HwdHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by DBAPR06MB7095.eurprd06.prod.outlook.com (2603:10a6:10:1a2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.22; Sun, 8 Sep
 2024 15:34:30 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%4]) with mapi id 15.20.7939.022; Sun, 8 Sep 2024
 15:34:30 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: akuster808@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][scarthgap][PATCHv4 04/19] python3-crc32c: Amend LICENSE declaration
Date: Sun,  8 Sep 2024 15:33:53 +0000
Message-ID: <20240908153408.4114753-4-niko.mauno@vaisala.com>
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
X-MS-Office365-Filtering-Correlation-Id: a50e6e8f-c2fb-4ff5-186f-08dcd01bbb6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?b+PCVqWOdc1G0JntB/cceb3lnhFNoWCsJtC+oWP/s4OTghUqFkjoo/IXljXM?=
 =?us-ascii?Q?sm+oyptDkSx2+lpLmb9mBG9I1UpKnKJ64cJjptWVCa7Nest69bl9K5uoGv91?=
 =?us-ascii?Q?wR8FqOgHgejGNX3fm/v/bRj12/AwUQAzVJ/D2KTISsvSsbGlIEHFS/2YRUEm?=
 =?us-ascii?Q?mzTOxqVxZRDqpzE0Kk9pkQAOXLsDR57cvb4+Lh1hJnjkFWNpU/tN+L+VSN3z?=
 =?us-ascii?Q?FNKhmJ0oSkCHsSIiCjkDG2CM/HF0t7bVd6oNs79CPJCg0heG2xWmucd87D3w?=
 =?us-ascii?Q?g2zul0FjeItyF/80EyUWce12SrQtWol9s8p2kmfBHJj3JGsJpEzPD+el2fUt?=
 =?us-ascii?Q?FbqniyDM79/9J+PxmiedjlUj7cghkjzxLZ/y8VAppGoDI5CyGFa4hhAQbvD+?=
 =?us-ascii?Q?UNJD0wOAyC3bZKUNBsTht79THlEi/iB2Sb3C0bNyVc/gzeyh2ya07aLOx1mw?=
 =?us-ascii?Q?bcQESFD2fUb756MuUARE7IrkElj7v60G2fzQVdIh8y8F8faHdwcah4l7os6e?=
 =?us-ascii?Q?LAwleU+/nJJvTFRSJELfy02Ievo4ERbX04mVCgoz77FsdW2YFgGp4LeUy50a?=
 =?us-ascii?Q?Yg+DocBHHzk8AOcNuas7xRH8VaQJ9bBUHBujQK6zjuwQsaBGk+R6NcIvqLQl?=
 =?us-ascii?Q?qk9i8rqqAdI1T3uu2ggPOvha+kVEbXclju3VIfniCLx7XjeqbatOpccUhgdy?=
 =?us-ascii?Q?Ns8H3KDEghFTC69fQ8y4I4nzgpQ9oG+9aQiC3HTZrc5mG8X8BsM2/l0OFR9k?=
 =?us-ascii?Q?jKs5GryHRLxxObNBB6AVdRDuWR/a2e5A4YZf50WXwbMDWeCi0RgaOuRRw0dP?=
 =?us-ascii?Q?w/3wnkz6s2+cuu1ABm0zrn4uosbrcXQQdQYl3eDZjA2+gWYmcs+Ibkve8fFN?=
 =?us-ascii?Q?QnpTgVx6fNDWbGbzKK7oyk+OV9h6RFGra+V1lCNhLFsSfenGYn3rnPnfzMB9?=
 =?us-ascii?Q?6Gwp9G3jnMwui/P5EDNn7RgXftJ7JX9/MLhZSJLzXvVCD7d8PeES2vEp5PxV?=
 =?us-ascii?Q?hzdAO3hLAIBr1S7WxXePqOSH0EoV+cDqqKrdoboyglXD5QFGviiLj+7lrDgO?=
 =?us-ascii?Q?agIBKOKbioK0E21uAbIY2BkkvrCcQJgTAQ+7FEVhfGtwI0w09Nhv9nMoUN79?=
 =?us-ascii?Q?e8nRAcNrJUE8j5oYcOkCPE7/aqau1UBga5fPTgMSwXYkBRCKpX+z0wbJXMbO?=
 =?us-ascii?Q?rar8t6nrL9OofqtCm+CA7Xw2mE8GZ6zzzpN38x4lZK527ycOuRB7078SvB5L?=
 =?us-ascii?Q?y6KmKhkgBV2ceQLPBYJdjjJklEpaQjayvU0KOn26u22qdnSnUEdITNKSL1h+?=
 =?us-ascii?Q?8Z5gip1oOo87aMhS9Ew4a2L3caNyVfTrnAdAmxqqbP+rzet81Q82NUAl2zo1?=
 =?us-ascii?Q?V0G5mMg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?W67JwknvdyaNnnb6wNyElaLuixUaR4hK8iVk3PrCbtjTU1KA2I6HgsCGFMQd?=
 =?us-ascii?Q?bA7a/V3YzAdk8ZnQQW1O53NlfIp6/TzNiPhTNKbssRgue31dCJLMqess2bsT?=
 =?us-ascii?Q?ul9nvrcyJDAj7LMG2fIAj9RMhpqqIRsieuPVUSP8kmtSINX9eIVK0MuBfT9Y?=
 =?us-ascii?Q?GBXO80KFzeaxtOlhhINhhbREVSCmwOnG8bpHh/Y98HL7kkkKdTduuofLrkh9?=
 =?us-ascii?Q?i1Svg1H5BZuRxqbT8H6My+frDb+/h15Gdh25+xja9o5KakU/ooDVqXCxaxlZ?=
 =?us-ascii?Q?Ij/dl9EahD3ZbC/thRdOgT2Zpz6XaVBHGPVaLwJGs0gymo2JjdICjHBH8gBh?=
 =?us-ascii?Q?/9FFCTNeQjhjFwjt/PWUcBF+O0aTRGO9QoAssBTTamfQlxMqovDZ/RLmqUEX?=
 =?us-ascii?Q?dAlWksRaLuN0JHBdaZhpYZzalejD0J37CGg3LsxnNbdnT28P+UdIoKd8xI9s?=
 =?us-ascii?Q?iLeYH5vwleOCVWkjPs5nOfS8AGCGcuV5rDWKKNSTYoOEHI2b341kinkSXw0D?=
 =?us-ascii?Q?3U0M2HMTI2F5uLIOKcWMDlvWKmw4k5Og+R711zIVFD1Am3vLEI1ENV/22/ie?=
 =?us-ascii?Q?41PQZuJHc/1ZacZ8y2kAQt1JzwD5q0OY0UqjEls629c1VxEku49z96+9m0lo?=
 =?us-ascii?Q?2zHUCdRCx0HOVnqGW8tJsxDKbo5l0vjEGC4DaR5BDfDkil9L7jIrGD9y6DBw?=
 =?us-ascii?Q?/HgBTFu3S0R6njMrVCttvu1gnUgs5razuCsVsFsdWPbWp1ufTv41gpfFGDW/?=
 =?us-ascii?Q?G7d2W/lkC8FKBZAUS1HgXcDa0bh4fHUGSY/i19ehc+oTN4zTOJKY2qJGoiRg?=
 =?us-ascii?Q?+X7GSn8DgDPd+bAd9pBfCg+ojfap7WGt+jK8uSDMtVoK/Y62Z+97T7EysQOC?=
 =?us-ascii?Q?qPFvWLMrDkbBZSqKc/2Xv2w8c2GzyF0fmC067EfgoxeQ27iRd/nWhd423sXI?=
 =?us-ascii?Q?LJDl6T16E+kWXe+yTg4Gh/56NdmIr1ouh/4EVwklhsOQKzuYQryvCXfVjvHm?=
 =?us-ascii?Q?uLVmGRa4y/uAHZGgLWSekxl/QzFIKhnP1djcaUuWouU2eO0xInXdTJI4ANof?=
 =?us-ascii?Q?13sVrDB37gcKIv8UXbUYjnMLgcl/EtYY1PQGKpZlp0dsVt9BF7IArNNYBTt3?=
 =?us-ascii?Q?gQMYjcvJ9OOh9lsh4k6Oly+xuxCay0GzHIX3WwrlJ6goMevvMIHd/tkbL1Uw?=
 =?us-ascii?Q?wQfgl7pJ/irNOE4q6w92EFiDlQu5v0eKHr/rQFBNLTFeVctPnFKyBHjCv1ta?=
 =?us-ascii?Q?Lmh1OiCJfVx9O5dym2BWK34qr6Dw4dwBU8QosIjnNrG7wTzeZC63skxZLYKJ?=
 =?us-ascii?Q?F6ScR6QZm9yGVQpk9DOzU3UaU2Uyn3lfkgbqbCsNPs8PGG5ZAuQ0rvEL2ctI?=
 =?us-ascii?Q?gCI0sEWnDLA2qvHFFHpeFFYWZ9m/J9JSiWMMlxvkjlnghPS4LHxtiQtzRGl1?=
 =?us-ascii?Q?gRUZfuA8pn7CflSUtyHFNfPxkeW6MEItWkpx20tyj+dzLkoMJg5z6XUW1NFq?=
 =?us-ascii?Q?Q2GeSebQMDLWSzGhtT3fLe7HGiXIRVluS3sWt7hk1uEJSiIWUc9ogwDReOnI?=
 =?us-ascii?Q?r/yVvtfhyaPQBxjJtX6ALh6nxDHP7MKR+irayezLwHmWmOs1jhhX8VqzyHey?=
 =?us-ascii?Q?qQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a50e6e8f-c2fb-4ff5-186f-08dcd01bbb6c
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2024 15:34:30.8485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jL4LTaFRmXBU1lNFHzgDsHiVJhN5o1jERf9W+w8E1e68519sFlV5vR5eTXI6Pt6o1X0ejBQrbig3mArPrB966g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR06MB7095
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Sep 2024 15:34:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112148

According to https://github.com/ICRAR/crc32c/blob/v2.3/LICENSE and
https://github.com/ICRAR/crc32c?tab=3Dreadme-ov-file#license change
'LGPL-2.0-or-later' in LICENSE value to 'LGPL-2.1-or-later'.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
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


