Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 365F5C36013
	for <webhook@archiver.kernel.org>; Sun, 30 Mar 2025 10:28:23 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.89])
 by mx.groups.io with SMTP id smtpd.web11.27933.1743330476550525245
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Mar 2025 03:27:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=foxJjq4y;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 52.101.67.89, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ffDMvOuPtbL4Fdy+x22Tyqli/HLPcxWFQI4ZeIQ/k0XFmmiy41xUufgJOns5JINUpyN+FcNkWqZxcjouk+HpKvqDPkeEDgNzgQbyjeUWfLbU6YdGoQC9nyZGk46nP6PCkgMcO7O0k9E3f+f+6kipdQ2/jFR7lkzN11lp0nAJxQErYm8HStc8iLLMQ7iujUyvJ5s+PXCUN+GgpGkubcbTVx1mUsG6wjHkgIobuY4rCbaxjCTY10VS6jckoQtCHNnH5iSiBm8YQP3dO9DX1uEPkQsAqFV/K0rQ0c+BmreBkxn66F2lx/X4SfG5lryleDrDPCYfsPQmObz+YHmUc3R0Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZDon5z6H1lJ33u6MHbk9Yz7+VBiB2eZErrQxQcIakwU=;
 b=qw/BpQTN+pIxoW7INhLSAo/tWEShYa8tfuSGYcX+edLFHi2RrfHq3TEIAM2SA6GuoFjwMuxrZrcpbhFLvvDy1ieqA/b3IDoL7NQskawT8zyrr6k9VTzgrVJMNbmZtlyBKHXQQ7rTXZKf80JZzYDHqmCEOVav+jJXutEWlUtBmRiCyNJylQQp54tU1nRitF2Z1rNx0tartULHvyNXdru1ilIwIEqN+CuFPqIcHN4cKdi+rr9CZTkqlp+bvh90H2OohvHfNWgNK7jwJFS25pGLiRTwob3eXPw8rn52xLXXe4xwCRnk48iUVy+x8N66a9Q8I0WL3I4OryBbJJ4a5xeBdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZDon5z6H1lJ33u6MHbk9Yz7+VBiB2eZErrQxQcIakwU=;
 b=foxJjq4y4vBIPPnCLNQG5mu6tflUcdk94vjoymhXUth1RR0gOVwmBjdm9UyIMHKZsIyBJ0TkXxDucFaRIGK5wdsee37OQPKLxerMap7twYy0fCpIlbANO5lW0OodYsFAIC+GHIKkYB1H2YRNRXOOI6b1+P2Oj0XYp7o7XPfq2C58ukhVM44sHmUi26MvDJGKNhnwE4NdelowJphJ/6mvzhBJcOXL7imnqgyyk6LcaLY6vSq1r2Yu2feuJupINR++p7RoYPCsc5+N8xx1R1trcMBusR/fJTasn+6gjZX92DDLeyZUFtl3mmFPLluwjmZUqPcBtzNXrsLnCWrGSKsFQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PR3PR06MB7100.eurprd06.prod.outlook.com (2603:10a6:102:8f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Sun, 30 Mar
 2025 10:27:53 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%3]) with mapi id 15.20.8534.048; Sun, 30 Mar 2025
 10:27:52 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][PATCH 1/2] luajit: Remove dangling patch file
Date: Sun, 30 Mar 2025 10:27:29 +0000
Message-ID: <20250330102730.405005-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF00006627.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::3cd) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PR3PR06MB7100:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cfab69e-6a42-4734-eac7-08dd6f758715
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?i08WWmFL6AMLd+qIS0PiGOMllJKTdzvN3X2zm6JEDj2GNUS8TvMhtnsJhg0S?=
 =?us-ascii?Q?FLa6mA7/FAu+MIJE4Fj4YRLeuvj5wLbwbVqrYrGbot5NQsS006DvB6Tf1U8n?=
 =?us-ascii?Q?g94EcDUM1kebttk8yybncUQ6vouQ8dnsh0SYJg1khvc4mf/JbVeOZPRyJi0G?=
 =?us-ascii?Q?dm2Fg+FXSzSiR4Ng/ZmrBxo6HHpFB5P+b4BHDcZqHRbpFZQopmCO6sG/Yy9z?=
 =?us-ascii?Q?NUvmQg6JSTYiOJRvzPOq/rqLb3Q3CXM3IyVsyG1bm4shp7pVFT30vi51luGY?=
 =?us-ascii?Q?9ZUkxSOJfJdonJgaTWC/Zvbi07qZ7SVY6B887h65YPEm6SEdNoO77fDMkxzZ?=
 =?us-ascii?Q?QaNdTuoR16KHPznRnZidSd7TcSCx/UD3LINEsWROiJbiPRW9BKPWMaj37cxm?=
 =?us-ascii?Q?CkmZ0lXBbSxbPM8DOTy+ncLMfQVfVM6xIy1355sCIIfyLC5+kSaEtBd2EHP4?=
 =?us-ascii?Q?cwd4EjzuGGP3aUfl9x/5nkoT2yl+ijA14KDV7FnoQKJ9Lqfs0QsJ/4izpqNi?=
 =?us-ascii?Q?OtT06Z9E6Au+bp/2m6UFTSHFMIwLHnsLi1nw943+jxIFG4knFKc1nTnbi8Bx?=
 =?us-ascii?Q?UxgrNb3GZQ1lhgwW8ssy/vpQ4nXq07NxfKSC2JuTK1G+kIH9SyBFT3ZKHxcv?=
 =?us-ascii?Q?vkWE52x/6b0+Wk+IQIB7XBiH7q4uImO1wfRt1XLQ/veVBkMnX1mNEoLdGKVb?=
 =?us-ascii?Q?SxOX9LH90TDYG5F7r+j6da+XQ5EvCiZgn/gqcSOdSlMbHJON9mUoIGkgwJzM?=
 =?us-ascii?Q?biOuZ7zzbGpYeeljNxPy+Pwq2kS5vvyeNJpILKf+Zt5vWytiLgSTUI5CdQ8b?=
 =?us-ascii?Q?Uc/CbK7p43BbDYK+i8sDXLgSoagJiN/7COXyJmzOIioQUUb9GNXfhcLJpboW?=
 =?us-ascii?Q?f1Z8lOR+Yf8P66TJds5d3uN/ov637XFIBJZe8Lmm4KMfMtB5HFOCTwHzQX4b?=
 =?us-ascii?Q?o/qXb+NfIBGv/X9wB7UH++VEoRsC1adrIJH4jVoR7YP9J1nAKdtPo6sOsirC?=
 =?us-ascii?Q?uIuHh4U45sB0kI3rYAA0SEudJVeIIGb9Ve6CXbpt4lnpI6o325auUmXjDCI9?=
 =?us-ascii?Q?NwWBbItecKk6OAanq3nJzp6eAmM1+/uHw6O3vb2lKCLtfmwMIrlhs1WmSnzb?=
 =?us-ascii?Q?lfoDAK1s2LYUTz80NZoLzCy7s/nlSa00KQvMnoJBrh2pU5C3Ooi3Zz0074xU?=
 =?us-ascii?Q?wfJjywOsd/XulgWZWor81DSeYh/Ffj0Ksr4V7Kz2hocOEQkKj2D5blbuEZij?=
 =?us-ascii?Q?pq4B1MhrAFvDqWDT+Q/LqtjsAuU1bsN45gyeW2h1aF/3gh+ZLbXw3Gnu1jL3?=
 =?us-ascii?Q?UPwCkXtCEWOLtkq04TkUHH41tDeXeESaKsZP1eUItBDwr8bEvDCIViGtmvzx?=
 =?us-ascii?Q?MdnySgzQl3+5JAAC2mxpZUwB7rWa99LUZ14aOeo8ltYHfasl4w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TuXD/IVJCY6j9qn6uuZ49qqDyw8VHpYuwC3hB4K459sxpKRGsPZ5tPaPmbzj?=
 =?us-ascii?Q?aNSC9IITbu0scDT7PUVmmqV26paC9skqsqFAGmAgiRghp2MCvRcsJHamD6Ey?=
 =?us-ascii?Q?BVyKuH/7XTKiEhDE5Se7xI26uZbgC+sTHZ3o6wV8HHLZrcdJSv7SXsv5VL67?=
 =?us-ascii?Q?Ng8XHbcmsNy0mUJobL6xnscF4gzkVM1qAdDB0N7xQ390QNHP4mM1yTMWQXLl?=
 =?us-ascii?Q?4154k8Z71IIYXzqGqbCYIiIF3GnqFIjVKsvJFk2jEzmuWzBDvWqFqhij+DoK?=
 =?us-ascii?Q?vPUfIkZjn8O/EW4LzNfxjZzmsvErT8F1Aoz1MA+s1J4n5Ny3tDPwkAmYKIJJ?=
 =?us-ascii?Q?346fC/yk0Al90Mm9XRfZEuzpWPWgB1UpsKPteKUjYlAPmorWQgGsES/+32/f?=
 =?us-ascii?Q?N8x5apG/WQCosltSzhHf1vJOVVMCoH3CTNUyT0idGCPN0gpncCWTTWgbX3X8?=
 =?us-ascii?Q?41jyQ86kUDRg+RYCa/h8P/5jrUWocN9DyBwJnxKR4io++wWGhLJvOXZos8Ws?=
 =?us-ascii?Q?hEB4PK9m9frb7QUBz8J2b1W1dPC9H6NVkobm4v0tsMWUBqt3L432aWiojTH1?=
 =?us-ascii?Q?npQEgejDWxEg9Ee1f3ekm6fJRzlNCqn956upBdOxJ0P7ny64LEGfEHZhyjV8?=
 =?us-ascii?Q?tzhJy6/zcH3FRYrLnC6fRZZxV6OWQqtmZ0N26DA79VBEwqbXLDQwbD2k2fpa?=
 =?us-ascii?Q?eXTF7zVf0bJoxYgvqg9QRJDtX7pWZh6QJDIie04/P72DpVY5bfExcXtT2LGt?=
 =?us-ascii?Q?fhH7sg3glGkI3Qy1eCqcHMnnXpUwaf7AdcwzpIsVQ3dqvwXcwiCbSa/ehI4D?=
 =?us-ascii?Q?M2qspZDuvKlFDpKPLvIJoiDXw5sh9h1dIrjtbIE6o5U2V2JgaghTpRlaRwbD?=
 =?us-ascii?Q?OKLBu/uFqOWdTvXjt5cVYiM/DAwTGpHa41r9JhsNbPBoruhCWavzuh80PGdT?=
 =?us-ascii?Q?5/78MAw+frCIq+36uWT5/ISE98vN/d57QOpF3MpSNAvN0hFSfx0b0LGEdnEp?=
 =?us-ascii?Q?QCEizIOHK9ocf7RTZp92kPqkUtYwA17vDSEIdMy7o3cdbonDNHR+NFPL34IK?=
 =?us-ascii?Q?iTrhpRVO3m2Y2sFoMjOcYD6qi7FNh1riAHIcYl/RFPUPvDcBu3AvUo3Cz3W3?=
 =?us-ascii?Q?r7xkHn7oT07d5WFGryQnJm0JQbvUA6bKL+S76ka2GNtVq3IQjPtLALrLAKpQ?=
 =?us-ascii?Q?/zrdfGqPzT1ATjIC4BSl1xZkbnt7ePuo77YgDCeDXZpCfL/6mWc3pYHCvLf/?=
 =?us-ascii?Q?0lyu4z4rdQXpX9EVhKOgtazW0GwuOraTqMY75eYbdG3c6/jfA9y7Mx0yc0AA?=
 =?us-ascii?Q?8wldddzRbRozx4FbDJlQclliRWi0chnFN6Wii9P6S3mH9qwH+b6BDQtSPxqz?=
 =?us-ascii?Q?n29mieOAIFQMXWfHZNOqzU6T6afGcmKI9WHWstq/ZrrB55Xmd3TQ4rFJhbH/?=
 =?us-ascii?Q?ZVq8zZbcn7TSdA3udA/52F+1wyfZvSoDqB++YMjwpyt25+7hO2+HE8FAToK2?=
 =?us-ascii?Q?fngQkPjk5++DxraDrsu9lb6xARyNHcnZLAYYCuDkqk1XrYIO8zJpdaHRAec2?=
 =?us-ascii?Q?75cfPP8hyDKtlgoKjLRz4orgsZbBRBZS8LTRZzAPrfDcjz9gM7Fj1FByWv0R?=
 =?us-ascii?Q?xg=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cfab69e-6a42-4734-eac7-08dd6f758715
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2025 10:27:52.6160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yC+h+9OrSdqrblIM4iEkkzHrBczWyKOtX/RnYb10g18wduWQjALj1ek7/DgjOjfAQ5ju3ED/k62W+fa8TX2EPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR06MB7100
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Mar 2025 10:28:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116386

Not referenced since commit 1a05731de484f1f97eecaeb56296f72e76ba2b32
("luajit: upgrade 2.1beta -> 2.1").

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 .../luajit/luajit/clang.patch                 | 19 -------------------
 1 file changed, 19 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/luajit/luajit/clang.patch

diff --git a/meta-oe/recipes-devtools/luajit/luajit/clang.patch b/meta-oe/r=
ecipes-devtools/luajit/luajit/clang.patch
deleted file mode 100644
index 807cc4417f..0000000000
--- a/meta-oe/recipes-devtools/luajit/luajit/clang.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-clang pretends to be gcc 4.2.0 which is a big lie when it comes
-to features, its same as latest gcc
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-
-Index: LuaJIT-2.0.5/src/lj_arch.h
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- LuaJIT-2.0.5.orig/src/lj_arch.h
-+++ LuaJIT-2.0.5/src/lj_arch.h
-@@ -436,7 +436,7 @@
- #endif
- #endif
- #elif !LJ_TARGET_PS3
--#if (__GNUC__ < 4) || ((__GNUC__ =3D=3D 4) && __GNUC_MINOR__ < 3)
-+#if (__GNUC__ < 4) || ((__GNUC__ =3D=3D 4) && __GNUC_MINOR__ < 3) && !def=
ined(__clang__)
- #error "Need at least GCC 4.3 or newer"
- #endif
- #endif
--=20
2.39.5


