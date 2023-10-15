Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EB8BCDB492
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 15:06:28 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.48])
 by mx.groups.io with SMTP id smtpd.web11.89878.1697367950849094118
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Oct 2023 04:05:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=vJl17R52;
 spf=pass (domain: welotec.com, ip: 40.107.104.48, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ft7N+OSNM2AmL975KWrbLkr4IEBS/J15FMHVP3r+xdNU7X9UeB+XhKrZNX5N1+mAySckd3XjBD1RRm/r2UBSFDSaz/f+54qbVAB+22GTMUrfuK2fX8F8FWvNhaVAgNAqGl5GelZA+JLd6HV6d8dTQUSsRkj6qVS/Qpg031PTKnEFwU3xhLumL3Fjl3oR8Ml7yyZ3mkYyvgLyIP2FQNZ/z58GKyw5NpB6Zl3jsaCGO7WPQw+CNm1JE6b8SUmQi1ydlIoB1PFlcehK4z/2hD87Qek9j2GOUGxibVgHlKDyoWSHq5f2l7SDeMCTVm/9qfdFlDo1LPVEThqLLbvLFacl+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aMcad87igkPOQdlt5omEoFA/YQ0WOqE9pSirTeraGHY=;
 b=WhgY5vr1wYNLz5CX9eGtCAW3Akkpa/sk0p6AmOo0l45JSWK8qttZG89CgZqR6hl6jER6h2fZaYIQqffdH97uLTcqFZp6RCuee+5ai3b8K3oe0/PgTt80FgifNimD9k1krwdhaZ+GplM7dGAPPb4UXUuqpv3vVLfTrJ8RgWecZGebYh8baXLbOYtuaUQW2cBxi1/BCC/Zyk5KjsxorM1JUj14JBQi3lCI/3szJArOGgGlAU8lbLVilYbyhQNroAQUBAMt4gyiODuTAtGOF8I+UGGmu4JY9hvAwmE3AF2rAS5l47VxcuGok/Nmgu18i+XIfhL7JZkAVp/RGVZAkYJUqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aMcad87igkPOQdlt5omEoFA/YQ0WOqE9pSirTeraGHY=;
 b=vJl17R524ySSPuXa/5+sbti7RBSzbtZCxNG2FiJrVF6Z53b1BcvRi0LxyG0FKexzadf8B451MyHBlYYa3xyrranUEgRmlJQvBaAisBrLvGTmmZRbk6Hdq4wPGETGW20zLi/VRkYcyLKxrGTEr9w+70gAeGQ7Wuxi0Fl9OMjn2AADtWHfZY3Xr+QmfPjlvbDBap9xGM61eWnOb3a+D9FO9GdI1x8BxO3BmNQe2pV0FC1HY8piEWptMSAveKU/eCLQavJeqnCjJ3CXjBudKIBLuOGWlieQucHtObk/u9TeZDJet79iI/5pANXN5HM594q6aPnsy1McUpZQsHJII1XDVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AS8PR04MB7925.eurprd04.prod.outlook.com (2603:10a6:20b:2a2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Sun, 15 Oct
 2023 11:05:51 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3%6]) with mapi id 15.20.6886.034; Sun, 15 Oct 2023
 11:05:51 +0000
From: =?UTF-8?B?UGlvdHIgxYFvYmFjeg==?= <p.lobacz@welotec.com>
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v14 06/11] package.bbclass: add support for ACLs and xattr
Date: Sun, 15 Oct 2023 13:05:21 +0200
Message-ID: <20231015110526.53738-6-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231015110526.53738-1-p.lobacz@welotec.com>
References: <20231015110526.53738-1-p.lobacz@welotec.com>
X-ClientProxiedBy: FR4P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::13) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AS8PR04MB7925:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e3b4cab-107e-442b-cede-08dbcd6eb157
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SbvvObAeuDibJ/fGGuTteIaxNGqo8RZlKop7e8Hzpx+3VhvIFZDBvndRPQ/KRNkoUeMDttfWsZ0R6+GTYMTRHEf7Fg8qFCBKzjt/+s4HKI1BRcFGUKq31pkIeCHpkSbPfkj9gp1Hx8CWBD2fVDl5l1QtFPdLu8mFwuyxdgN/AylVPYNscA1kbC8596BtDoL7M04Xt5Wk20hi8VdRkFQJfC0pcJUJVn1AqsxVH+C8XI4+yTQEnidKvFJkplQd6fBJOMY5HIOA7A28dXlRWrGuqACAggT2tTWjnF0gMw2z+TBz3ei90q3s4jfqvgDA6n+EDPmgFtQGOTwPGtrcR1LsR6yBVKN5+wLevPHn6pXxtdGpROYY/fU24N+LjaIhUxZm01C8ox/ksCZFgfwtbIKt1qNYX+UYVvBLnlUugLO6QmkUr1oye1eCM2thjBrAx+WAkRcRVKbYQOV2uF/NCwo5ujSNNwHrzVWEH8SejKyoc81xPFzDH6PXvUCut7TueXKzNUUgKuRfGzu/mRyNWFOR7k5CarUod452DHVb8QnkUu20pvjgYNHI3MV6UDsRbKYjp8tMDmTkxctXGiCc8mwpkiQMpm6QPYaS3UhcuB/V5pWg9NSbtZAONmiECcQTa8Pl
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(376002)(39830400003)(136003)(396003)(186009)(1800799009)(64100799003)(451199024)(6666004)(6506007)(6512007)(52116002)(478600001)(6486002)(83380400001)(107886003)(1076003)(2616005)(66574015)(26005)(2906002)(6916009)(66476007)(5660300002)(66946007)(41300700001)(66556008)(316002)(8936002)(4326008)(8676002)(86362001)(36756003)(38100700002)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YKYsT6/oZjIId/ru+1lz8uqhwu1LHHn55cJ2EKoJF2E+yvhWbgKjewFxW5As?=
 =?us-ascii?Q?3hF1QDualjf14cnAXKyCNhuWKIcVFP66u8KeRazVwFL3VMHdcqD7XX90YXLP?=
 =?us-ascii?Q?SovYEhsWuBmlkiFCtJZoeVa6ifqyE8x8WoL37vKHkrp857ElVy+TIC416yX9?=
 =?us-ascii?Q?sGtfmcLLMpxSH3Wlf9FdXS/XgK5JGN/mrvWvVlsKbe0D16DdRZeaiVKdkVBF?=
 =?us-ascii?Q?QXLzLQU9WzEes+QhsIZHkd8F9djoEpUjGdI9aunhx8NGgzghQ3GHQXT0W0KQ?=
 =?us-ascii?Q?L5bVmVgk/MtiXh1QHXgYIGboYNOLUwE29EQM4UYNF8AspuFtmuX9iTQ8LVac?=
 =?us-ascii?Q?WzoGyO1CVFSDhusK5/uevZ992GPuWF7lX/M+nXfcVbzuxoFSUskfR0Ac5bc8?=
 =?us-ascii?Q?ZXXr9KfQUtMiOebimxkPC70SHIWJ+bp0FlKuv6AVRM6ruJZ2pr4x8uj02xBu?=
 =?us-ascii?Q?VVVpXiaA5CvD7rtkF3vrnW6ySCgM+S+rS92bVjMa32tTrTe6l4xP1R13RSyJ?=
 =?us-ascii?Q?dg3mYYdSjANTxGIUStHuDso3p3Wxp46citk6SZisCH1bTdnZfbhIs5IXCHh+?=
 =?us-ascii?Q?1eSKf1v1M7cSrfNlejrdz9inIZ7H26L1y52sf3SALES1N2JRhlsBWRaBSQu1?=
 =?us-ascii?Q?KxUzj0RmnsuRJoiF0IExW3Hm/wc1YmVJBxfgaOSlEjnC0vXwXjBbp02yjXJA?=
 =?us-ascii?Q?X0m+SXVYnMOsk4GDnBP4wcWDI03GNqqQqody8m9AGCenIVfOespZ+kEj5nNF?=
 =?us-ascii?Q?8ezKn7ZW+KMlg9jpIDlS/rPlPOyedbqSWMGCXSjzM27fS5xSrHIiNwPIsWiI?=
 =?us-ascii?Q?FZ0VYF1nMeQd2ttvy8rmiPTQS+r5EUc1+ccgI3FjPDvKHqmLxvwc9KMk9DTW?=
 =?us-ascii?Q?f9aPWrHTf44BABdBtqYCUl6wPECPedE/2Z1qGmbtMwZXgkOLe9NUa1qOuQtG?=
 =?us-ascii?Q?evuX9/SS4GHyOes5DZqHSo5rYOHMGSDrkC/G+veM/fcPlK6gn75LqlMiphn6?=
 =?us-ascii?Q?3/vKWes9xFYi2csfofAKyJfnP+RMw3dSGBnVCjG+fZAp7Sb1RvjQek864UOG?=
 =?us-ascii?Q?yYtg5Q5mLa1ThXddCw4A/63pwpx3EopLbwIkL/QyAbdZYSdEgEnTFt8WcT3h?=
 =?us-ascii?Q?tYwlC7oRgN2wPXjmiqshSSA1H8oFsDzL+h5Uwb8KBtv6NIwbprSfA9C7AhwY?=
 =?us-ascii?Q?FMucEyjcEpldVTi2ZmQuWpMW3ndjGXAaC/1K/T5PoX33oi1RVGfbr++O/ZmY?=
 =?us-ascii?Q?V12rcVdtqhVjtLH/Vioe2XIG9Lpl0sR8Z3AUpUCxBSfft9fOeAe2m6R4xzu5?=
 =?us-ascii?Q?FFOBQc8hm48ZlvWj2AN27pJFacaNVmc13LOYrNlDYuXiECjn75IdcwjRI1Uc?=
 =?us-ascii?Q?ho7+jaPs3jwZkRkgRIT3dVw/mSfm7IIs373ML1LwGn3Re1DrxAS49ZSJWCsa?=
 =?us-ascii?Q?h1RUxAoRwr5vkz68CScNdQlda5ntOgkyvxZhCDkIzMlAXe39+oTkiV1hBdwb?=
 =?us-ascii?Q?2a+mm67cky2xY4sxf7huyHvA9hkgTLdUSTb10VGHQt8zuhNCn1jk4zwqOEaM?=
 =?us-ascii?Q?FaMrImpzIZat2LPCwNw/uz92qnnxtjg+zZ7+pavH?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e3b4cab-107e-442b-cede-08dbcd6eb157
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2023 11:05:50.9700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4JTnrwe7yCBPOJeEeQIJ8KRFfWuC/Qu6e7IDTwgi7OY7g4vpt2jBA5pYu2/8ARGmauMbzSmzzSXhYvTVWj/5+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7925
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Oct 2023 15:06:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105523

Extend `tar` command, with additional parameters, depending
on choosen package class and target distro features, in order
to support ACLs and xattr.

Currently only `package_ipk` supports fully ACLs and xattr.

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 meta/classes-global/package.bbclass | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/pack=
age.bbclass
index 580884cd83..22af6552d7 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -353,8 +353,13 @@ python perform_packagecopy () {
=20
     # Start by package population by taking a copy of the installed
     # files to operate on
-    # Preserve sparse files and hard links
-    cmd =3D 'tar --exclude=3D./sysroot-only -cf - -C %s -p -S . | tar -xf =
- -C %s' % (dest, dvar)
+    # Preserve sparse files, hard links, ACLs and extended attributes
+    # TODO: for the moment only ipk packages are supporting ACLs and exten=
ded attributes
+    # we need to add support for other package systems as well, but that d=
oesn't bother
+    # tar from creating archives with acl and/or xattr support
+    acl =3D bb.utils.contains('DISTRO_FEATURES', 'acl', '--acls', '', d)
+    xattr =3D bb.utils.contains('DISTRO_FEATURES', 'xattr', '--xattrs', ''=
, d)
+    cmd =3D f'tar --format=3Dposix {acl} {xattr} --numeric-owner --exclude=
=3D./sysroot-only -cf - -C {dest} -p -S . | tar --format=3Dposix {acl} {xat=
tr} -xf - -C {dvar}'
     subprocess.check_output(cmd, shell=3DTrue, stderr=3Dsubprocess.STDOUT)
=20
     # replace RPATHs for the nativesdk binaries, to make them relocatable
--=20
2.42.0


