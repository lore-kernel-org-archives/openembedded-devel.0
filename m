Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC919ECE586
	for <webhook@archiver.kernel.org>; Sun,  8 Sep 2024 15:34:46 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.100])
 by mx.groups.io with SMTP id smtpd.web11.32164.1725809673142184746
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Sep 2024 08:34:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=2vCY2m/X;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.104.100, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BHj1//K2MtS7zSjCpWFvUxieEacvJ/+e2yQoJ65EgDDX+qHTicFx5XRlNWwJSJ+fA6LSPDNSQZoGzJMmcqYjBs0defK2Ip71Ve0yXgfirUJyhGPAeJ7K1lFnXr0OJdkvC+cYqzaQvsYSb7dSqdDRdQLpRM716j9U5SSSd3brf94l/cg0Hw0Zp5dGKus7wk61oMPDKHIp6roCyQ4Vmw1McWI9thbEplub5S5oB+cY/DkvlxbKBqKFyokbU8Gx9RbRw+r7qjWU001Q63wSjoyVSQ+PoOYnIM7zXx8Q8zMRxi6mAbw1Tvt4qz+ZuL6oUMPIhWf4YvC4BvgLGHh8vIdnMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g5SHtdHHeCtf1iY3mDSJ/Ax3a4mPVE7/21VoY1g7MLE=;
 b=BrzHsQ/J9j8iZIm+rbDJttoUMO75M3mKLwmFiWturk6O9FBX8HPCYiyn1POqChFLJ9y02syfbtSzbYC+ADRo3rxNcaPXypTFp2ACC61oUFJBmDFtvGczL1CBxXQ5eeGXKnWSVNuiPr19m5+6BqGWBjAuU7WflefDXCT7qQc16FJ6VTIoh8VEj2CGBR7otBwX+zdsQGqmdnzkJbUASEY2nmcWMP9krSwvLia7GjEcqhu6UC29glwhrrNAo6dFshwLJeA1Oz6SEryCR0xr7SQ7ulubZ9bXQkZDz6YshreWSRA54qhy1BdltaWWdLDOHE/Ev5BdzUZt9leB6p2sO4tD+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g5SHtdHHeCtf1iY3mDSJ/Ax3a4mPVE7/21VoY1g7MLE=;
 b=2vCY2m/XCX6qsR+Zcalrt1odtvO4TVtAJI+Pv6gG41dw7O9O4L9+JkEX6Cs6P+IUdH8abfkUJ9g9KorlP9//i9mJ0DK5gKaVSlZ7TopZb1ppz5TsTY2yIkyFWSvM7arlSQeUaCqi8pmS7+rIvMIm+FZc3QrwpCiAq67pS+OUJuy2lLHZfT9vd2dwx+qvnhquFF8MpmNShBXjyw5fXzU4IQlnjye/6HetiMqmRFQji/Rnv8dd8+FLwg3s+1p6V8QhzZzAvIIDoos2A7aHi6CaTWUmpjfMEVKZzDdGIbWFjrQek60z42hIfl3k7DMvU0bGWhUjJYZWHtMfdmcfBhNWGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by DBAPR06MB7095.eurprd06.prod.outlook.com (2603:10a6:10:1a2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.22; Sun, 8 Sep
 2024 15:34:32 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%4]) with mapi id 15.20.7939.022; Sun, 8 Sep 2024
 15:34:32 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: akuster808@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][scarthgap][PATCHv4 08/19] python3-parse-type: Fix LICENSE
Date: Sun,  8 Sep 2024 15:33:57 +0000
Message-ID: <20240908153408.4114753-8-niko.mauno@vaisala.com>
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
X-MS-Office365-Filtering-Correlation-Id: a020e5d3-0740-4784-53d0-08dcd01bbc8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?vsg8XeKujW9GgkXpmY/94VnMbFtUQqPjKoEOvCE3diNY3PHPsWA3r5W9tcr2?=
 =?us-ascii?Q?TIUjj+THUlC9JOOEtH9ubP8uemKlRzMDpUB/nVRKEPGo/6VYdkUn4l/TBXWU?=
 =?us-ascii?Q?DXLdRQRfW3E1BhFJwG9JMZBfRsIdJ7XtpHY/+rlGVOKkpamIoKR0PiKiN2xT?=
 =?us-ascii?Q?nXHnqTvRn/D+8fTRwxwKZPdQAnbT8sCN9QJSxn8w1ANJ5/UO/HcM1A6MDIBl?=
 =?us-ascii?Q?iTjBQloeVyIpq6qreAOsdgqmfnW2AH9Mq9uySUL/BhJPZp2W6yhkoIlC6eap?=
 =?us-ascii?Q?LtnzEM7yOzJapLP6q9/hZQ+OoHdj36FYsSNY0Dc5BLbfdtZkt4XPwUVI7nIx?=
 =?us-ascii?Q?22AgSbeUo4vnwJ9PxtVIIVt5rKMSfe8Jc+wcJ7Frqv60ljF3/6Ta9PDsCzaZ?=
 =?us-ascii?Q?Q6Yfg3fp+dKyoOulOUOQjwxl9x10ODQOCTKR6oSFNq7MqtGvdF7HR1QbU3oV?=
 =?us-ascii?Q?EugzCbf5y9g08KRsDf2TGmWqHpO4/clvgrOKVagidjEBv4ItuF+PTCZ/5HJm?=
 =?us-ascii?Q?3EVPNJnI+MRWnBNk6VfbPN49HDfZXChYia77gXX1pgZawZ8XOYrYR/dG8sgd?=
 =?us-ascii?Q?ensqYWwy2WmfTmvM+sT2cWYLfFHhD0CLwvpZgLoBOuuqYBqqg0rp5NoKAMLn?=
 =?us-ascii?Q?Wxw8gIKRGalfElgaBg79n6iRe2Clxze4TS2wkAXhBgDoBYVCV/2SKy9YFVMn?=
 =?us-ascii?Q?V/+p64YLdhSBk3jTGs35QLFsmYM2v5MrKRUjv4tKMcPWU4qMDVfDo9XcNLzY?=
 =?us-ascii?Q?3AdaCLlMqJ8kwu8PLzA4OPM7vMXBOvg4X//zMmFBN8w9i9ClSYt/L/Wv71O6?=
 =?us-ascii?Q?T8BMeMIm6nUrcM7EWpuZApB5803GogwqBaSmXCBzEgmMTMpQk4zkFvpcuRIP?=
 =?us-ascii?Q?n5RE7H2w803iORrSd32MKqFusKAgKxiTD6wLXUVBqIXfh0i5bfyV6ErwPV1G?=
 =?us-ascii?Q?U2NlD3EPBDaSlZQ+YXcfktAQJHJ2C4xhF7jF+32U1jCIoSvr6JZ5WxbmdKwj?=
 =?us-ascii?Q?3cx4kJ/JLyzmhnFEAyHgLdS2eub5haLLPpCF02sP9es9xbseo9ontWC6kSVw?=
 =?us-ascii?Q?XMjExWGoFCv4x0ZdOM6+1TAFFbQcn6VTh34RBqpcSOzaKipzaeJOljCWnfrh?=
 =?us-ascii?Q?O7cIODa7YpSWwkdMdIJ8QfPHKEALaLY2Sln76bV3Ky5ZuTf5FgZugaVZkIbx?=
 =?us-ascii?Q?Ft+klJUor5kIinpznDRbPhmyi02IDEEmalk0mVXo0mx4jqIAhGyjzmIVGr7w?=
 =?us-ascii?Q?PLAj6tiUxTfh1YXY54l9V5i7rzYc8fWiWQ2ce+n7cKeOAKsIgqcuKoD/xhu0?=
 =?us-ascii?Q?aP2oq4MpVS0rLlLkb+BG4qrS0vgauQczxPzGNQwmI0JJsin7F8qRnhISYcQl?=
 =?us-ascii?Q?V4BQZV4qLph+JLIyW9d5Vtqt4vfHQtQ6G3LL2XyYRfhEm7xWpw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?X2kahq9iaK2UeCDoZb1w38RhuDCJ7LxKR2mIo7dakw/L1Ccwpd4A3ac/sCIq?=
 =?us-ascii?Q?9fVk98ZRJnuVNSQyfrXqFsOVzFST/NZ3HN9FyL0CLlxW39IbTQkHTWN2Rx3A?=
 =?us-ascii?Q?WVU8aOS7nbb5Ww3SppftBwW4G9CHbD76bOemLVb3kDDR6XuyrJwDqlAWYVPq?=
 =?us-ascii?Q?3wgJgFJlMM72QgJYVhANIFMQmzzQ9cMRa3apiIejqtTqXzMMf7T4NMCHGyx3?=
 =?us-ascii?Q?ddBN6E3XW2rbsCssT+lBFjQcFThpMKI0ZM5CTVzCXGZA+FvRpu+qDZsXbLy3?=
 =?us-ascii?Q?UB/isqLlQfmso1rj1TnnHl/mN5L0aodC4CZtZNOWPgN4jzWNjUloOfCiPGir?=
 =?us-ascii?Q?FdbJpO6cu+pCPlC0WJ1+XcdTkaGnudFsaWPdxa22B/Q158216p3l7My0nI/j?=
 =?us-ascii?Q?5dNYVgmxm19XkcvC/NsaRyya8BdT5oG4agtXu0rSD9pFowe8SRHVafT6Kl3z?=
 =?us-ascii?Q?TJ/ZtvkuuDTqAP73zTDViWyGyshKMe0Uth+A/z2bdYU/vc1CGNglUhZkMTUY?=
 =?us-ascii?Q?gVnyCyeNDZaG97xsP2elZw5n35qrt8a01Kd+/eMwCyQgVoJDtbkiNPe0gaGD?=
 =?us-ascii?Q?3dTk5ccVB5pKqgE3vo7svwBiPhYdJnNsoWiAesvaqjjPiFoGf+ficE+TFPwy?=
 =?us-ascii?Q?gL+DLnXoFC3dY+uciFcQCsKSUIpuTMHyQqgThV9ONT3mRzQyCIYRhZHqPECW?=
 =?us-ascii?Q?PiowvGAFjjEAcSRn1Q5+lFWoaS8EuTsysgS7Ff1YbwVywOHilUH/eSE4+4ET?=
 =?us-ascii?Q?FIFJBs9XTulJhdV7NfnxGK0p2OsvfhEJNwXscurwjeG4aRqjNG6FE/6wp4ws?=
 =?us-ascii?Q?50vtT40cWaIXC3HX/pVeqTJGPKQQDByN25BfR+QFAMq71LZcsymJxzxPZ7G/?=
 =?us-ascii?Q?Md2HH/E58aYGgTl4dWnOFjZyPAWm2Bk0QdJ7K42RXDce9qAQHqNBrOZWvz03?=
 =?us-ascii?Q?C+VoXY8b/rreO75TLruXzXqVkKUorZeo2r5dtmkTalpzG93xjIe9SnNENhS/?=
 =?us-ascii?Q?qIZnlTk5rxh9IPJfmNrxFcFZFh7CUy97ei1x1vQB9irhjercALkA678J7BiS?=
 =?us-ascii?Q?OdjOuaughcpNeVsgc8Jmrnl3//Eznz1FefGo7jde0ThJRiGwFA9HJCx3t02I?=
 =?us-ascii?Q?MbwFjjcdGQXTLl79j2+KK+TU2tuepKqY7FHuz1S8VcCOVaP/Z76tdC9aegj0?=
 =?us-ascii?Q?cLzCDK/csrd+6rg0lUjJ9G/H5Wu7QVJc/1Om23N9I+ndEgxcn40TI4dUf4FO?=
 =?us-ascii?Q?FGXNqrRWIlWJkNZAII9EDcoUhykmiLtsUpsFKprtWevAmwUUnPv9+F4EmfYi?=
 =?us-ascii?Q?8sOr6jLw4RCDQXtVqWwAqj5TYSo+4KT53Sq/B16FgaeTeCLPaxNcBqwOUreP?=
 =?us-ascii?Q?7K+MJxjZt+BW3lv7gMvtYYqEQBQkmAX0bHGLh/CDue1Hjnt+JYE6C4EZwogf?=
 =?us-ascii?Q?W3FPUiiczru6rNsbTx7rRCVsR1NVAD8IN0/DD0hxuQVvTob3QUS06yI4ZZ80?=
 =?us-ascii?Q?m09qrm/ubxwQrT9uCnnBL+6v/myvmkusBp+0hucUCPVBu70KcvG0B+COEr+M?=
 =?us-ascii?Q?OYfwOKoVia+Aoir9NLUBhWDqK324q08lASgZC4qpXW4xlccpXF65+kcmgp1y?=
 =?us-ascii?Q?Uw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a020e5d3-0740-4784-53d0-08dcd01bbc8d
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2024 15:34:32.7345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xqW8nV/ExK40zPLc2qhAOMV7hIaE+KA15l9vh5Oamhs5f25jHqkrpNpaSYnEnNF73DKiNYE3o9Rn8vD59p2RKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR06MB7095
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Sep 2024 15:34:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112147

According to https://pypi.org/project/parse-type/ and
https://github.com/jenisys/parse_type/blob/v0.6.2/LICENSE the
project is subject to MIT license.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-parse-type_0.6.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-parse-type_0.6.2.b=
b b/meta-python/recipes-devtools/python/python3-parse-type_0.6.2.bb
index a7d8cd86c..57dfc5a50 100644
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


