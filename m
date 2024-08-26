Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1EEDC5473E
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 09:41:10 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.116])
 by mx.groups.io with SMTP id smtpd.web11.48814.1724665264692466530
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Aug 2024 02:41:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=EW4vivU7;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.249.116, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OJjPc2H3n3svB9DKYknJTYvQT/lO7Uf4aPd17OWvCs4GnoVpDKQSQpKUu+tl1WGxRKwt3fXxZ+wu7y+dwURk8+YS3/RBXwK2pZJ8O6/fgAQlJ6kqnY14EyLQZACnUPbc0mFSRgTv0QB1D1nzx5CllikttyeIrY02HiK2dv38bjGACxSgStGB9PqKPKNLUo+TbzvK3PJ1Sv0QnrgrHhEdBYZksXDcNhvgW5TIatdl/q/3mVGCOtqexEgbGicM86kPStzhp9VQaONFeDRlm3tOIcCQ7jDtXwKqvASdKHX2ZebrBq8qAD1S96qGXE6gO0iLsutfSSg6SqhpSMuOHmvyvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1BIMD9FuH20aWwDLKSr6Grxa/ZzsqlS/I73OrmUx2rw=;
 b=c38hQxIkUId1QZkIKplZMHMManlN1i/I4bZFxhTiQrGqueKPaCsIsrbgOeGUGe3seex4zYImqCzPbHufc3XewkT3CaYK7Xxa4fhv6spQEjCDbgwEWxk80IqbqainLWgLAZxDM8VcxpJF7GSMydpYhBwtiqENDUmxuENnc+HdXLn9ftj6WjUuXip3DVGIZ86Td0OMFhccYlXbPOMBBQ92vDi0jduvL/nqxYXnSwQ7pAkqRPhXcgPOT7Eve3qAVibtpSuztm4qKJwLcxxstwm1ncrCiU6y93ORAV1mFtTY8f9SqIXVPs8QYRnHTILIm9z4S0QZ1VEloUaoLC27V/9yAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1BIMD9FuH20aWwDLKSr6Grxa/ZzsqlS/I73OrmUx2rw=;
 b=EW4vivU7CIQ0X07nzYhsLBPPGmYK7umPI+7WE7opMglHerNPclUY7He1VPK3Xe4+sEEMlZ7+39Fx1paF4Sl3m6yL6yoy7duYC37C3J+oNPadpNepbzEL3iTNz0BWtdKBZPAe7qHv5HNtWm3PoGDDjYea3Mp32lP08fTQN5Fuox7q8aZvPidy7XxiZ3nOhbQJo+HNj8Pn9cslk7frpSidsy4te9lp+sagwHweSyydSknefMZzMYvOkzIWMHrh/+BKZ7jCiutQs/L2PpFfDMxjgAj6RhJffFIoKer/1sqH38RUIAmLk9SJpfpcBcUPyCWCkqtI+ZEIrXl2BcygoeCcVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by GV1PR06MB8418.eurprd06.prod.outlook.com (2603:10a6:150:25::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 26 Aug
 2024 09:41:00 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 09:41:00 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-python][PATCH 04/21] python3-cbor2: Sanitize recipe content
Date: Mon, 26 Aug 2024 09:40:04 +0000
Message-ID: <20240826094021.2744296-4-niko.mauno@vaisala.com>
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
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|GV1PR06MB8418:EE_
X-MS-Office365-Filtering-Correlation-Id: fe364624-d838-4211-796f-08dcc5b32e71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?VR9wA5MUatzb70ENAyZA6Dt10NZCgNtDZ22dLFMxXiYdH7DRcCsNx4fMPcGS?=
 =?us-ascii?Q?uNsM7hVuyK3PLkKFxHROeSk/Pj2fSYSv6Mugj9Z9HillkdE3YAXrm75ph7tI?=
 =?us-ascii?Q?4EK/NZY2+FV6P9AfCaeROvLZA/nDLoX9/FaitanN0kyydWqe3I9TwvoVJFba?=
 =?us-ascii?Q?8/Gi3EBPGk/dIkeyp5Lp4osDKNWGPwqcl08tSMFwPUJh86IrAdCN86U6qI2w?=
 =?us-ascii?Q?Ndjzu0qIbBGP19zkmUKvahPZCJyPSFdQyr7LFhbjme+drALiObNb851SpYNG?=
 =?us-ascii?Q?OCRBPKO/HZO8+bfM25pt1kKyQAf7YZLEpnbU/xMmuonz9d6BN7w8DiCHsj1+?=
 =?us-ascii?Q?q1aDIb1TKV2sGIGT0avPdX3iNemOVFfsUUaAcpq44K0eHxW3Toxnj5KDOoqM?=
 =?us-ascii?Q?vMEp0Fp8H2k6Se76xERsuiVJ6xH12ZeRHQvRgwN9uhnt0bjJ7acFt3iqh+zK?=
 =?us-ascii?Q?WS8+r9rxMbyYgwRbtTpQ2/3ArLGfmwx6TuB7SWdl9mDjnjlSXMeIACa0R/I7?=
 =?us-ascii?Q?oZXEzFbYeRfZg71XYhNTkvkq8VDW5rmHhuXw7KvsJ+XDFn7VyohtAVqIdY+m?=
 =?us-ascii?Q?4pRUAQr9qMo+gGjMtauuWeKZwtNwlGvNmI6upll5jFQSukbmxBuv1bgWM3nw?=
 =?us-ascii?Q?S8TPaPOuez1nT/rbdcR2xzs1roaN+EQoJKrzZmq7qWkd0O1nloznydUWLrxU?=
 =?us-ascii?Q?3qciDAKSFwvYM54IAyLpDppK3/OTNfU6bo/UeHSIMdQEqz6VYkDUtxAx8COU?=
 =?us-ascii?Q?k0K7v74SA4YfAK5vTSzAOxF0Y+CWAMX152DBTfKEVIqPFEzT5a9PLaSc2em7?=
 =?us-ascii?Q?B+m9MyGtpuKXLsZTO9DvjMlST9qhXHovPzaeUxyclJBxrQF3HKjRZk2MQch8?=
 =?us-ascii?Q?Ew0CwdWgJBaAThLcghtlm5gKOr2Gz5xWScHe5qfYjZOqrjP4EGgk66SN22wu?=
 =?us-ascii?Q?MexAm3gxWy9l6aNeHSxYQDH0Ypc4c7EUT2DNoOptRRojvi5BnXpDX+lUkvt/?=
 =?us-ascii?Q?RNJfCZauuGrLhLydS/KPUfDooLUoh+yE2lMNB6CFSewMgd/3myzBb0SvD+WI?=
 =?us-ascii?Q?0oPQAyRJyvxjMkRBKonng895J9dUIUHWTs8TZ4QLmIOpaMi7DTlDndrSe3Am?=
 =?us-ascii?Q?sYY9kdXV/Hhl/i18w2MOjZHCJ2xKndZJB0gy6WCk6hIK3Vf6mJOz6fsdF8bT?=
 =?us-ascii?Q?h5YsoIFOmv20HYAmB7Q+6PkyyYVOWtjXVd8RiPLkonBTohK6ACllBLKvOkFX?=
 =?us-ascii?Q?1gR6Lj0DteUD1AM8HuLFiX7tpfUYEcNhr55uNXktPFTRSxe1tEaAPQxUSnPS?=
 =?us-ascii?Q?EdttHDmVzPtqo2uFMrrFEBSGF2hYaam54EHzXXD8CO3LM7MmKqJDsronDU7z?=
 =?us-ascii?Q?ITvYcnt30yMFV8IF65IHWbv2v5Jdj7th4PQTBJqs2wAvmBX/dQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fL6KIYMm6gjgyvL0m5njeaYwO3m1uoSQ952DaDWK2qQgQ+ZVvA/OKGfgPLeo?=
 =?us-ascii?Q?jtQqG/Lle29xlQ6la9c8bIliUfvBgShdO+2GtPd1XeOewiDwVlu2OBX0vEJK?=
 =?us-ascii?Q?lI8C1W1vzdQVMdUc36tQ4ZkTfPAj61Z8GleWWT58HZjThwe5X7wkiNDZvBWF?=
 =?us-ascii?Q?0Hiv3OMJjIGE7QPNLDiwfXE4vQq1Be8De5QSLtDMdVuhvCm2y9Sl1lfwEw3I?=
 =?us-ascii?Q?lE2UjDdYPeP/GqjeJfc3KkZkrX9lLJ/vxxgyvULwdQRC+6tJF2DAAxhRmzSv?=
 =?us-ascii?Q?nwRqEGWB47fcDheq4zicAAc10moa7ubvmzBi6Ua4eHg3snW6+I/knpHuhOHq?=
 =?us-ascii?Q?S2eJ6TkMap6lrAFxgk7M/xDKHLYSQhNfg1PHbbvk0g+zMub9O1CWeer8n6MM?=
 =?us-ascii?Q?DI1eCZzvoinB7ffKSvM4ID4fxJ8QOqkJVRcJRhqF50xZnrrovCC9o2I5d8l0?=
 =?us-ascii?Q?/Y2xj7//Ml0vl/8EwALV/3yu64/WHhHrdxZu0A+JUHReixK4fPOgZoFUivoo?=
 =?us-ascii?Q?HRulUyBo30A/OXdXCAhREhXtMpvfVNKF55YrFRpCxhih27yJhLp5C5e0EgxD?=
 =?us-ascii?Q?+FtyJWfsEt0nvkz2o5gP4eVJa/HlSkQ9F/15VXs25vm8H/V/YU7pkqHGT7sT?=
 =?us-ascii?Q?DWj9DL/CEk9cdGTwuwp0/46/kJ5tB1TLhQk+IgkhXtihoIL+j9xULCPjW2wW?=
 =?us-ascii?Q?J7FgOiyu1LP6WmoETab81yZgyXtv2WDe0fRZsI/upwCZmrzp7xDkb69ZtdkI?=
 =?us-ascii?Q?AKMZN4FOK1L/5VQr7VgPom1/OfJ0Y20LDJZvLCZdB0NpkWXl5G4h1z88XiLN?=
 =?us-ascii?Q?ZV71JXKZX5AtAuJzG8TztdIuF8NwIYkrRTU1b5v3/iD5lWiRv2whFwwz5tsM?=
 =?us-ascii?Q?PFdjy2li9x6r2xNW0hqLjyxJbNrVQo3PvhM6oAZnnfEpzEBYk5qZd7NXdxwN?=
 =?us-ascii?Q?lT5sXy6alcZ7GhqT1qQaa2DSgm4ndbWOxXkf8NX8xSdZoCt4PSJdOQCgu90s?=
 =?us-ascii?Q?GzbqDBPsG1mzmF1xP0m7qmPHUCkYWmFONgltobBl4dlvp/e+YoHMrC1YDe5t?=
 =?us-ascii?Q?AjzyOjaHxgjBF0YM+6Vo1Ahz6QeRDPK0M3RVFY/rHYsLJeHbCgUnAwn8S2vv?=
 =?us-ascii?Q?525cIIodjpUCWR9ErhYxks1ZKa1mCaur+tp796PVyO8XL8OgG++PGJAeiapK?=
 =?us-ascii?Q?kYQQxE5oaJzjs+aQCixVCz5y0ivS2HnQ7sXTaPB2rWxyIFVx9JupQLiOaQ7U?=
 =?us-ascii?Q?vBCEWtteujur9reC6e/jmbZYNS08spktJU+qWxfTLB2T/faFUL1gpnr8FmSx?=
 =?us-ascii?Q?u1IsvGwZ8NAioPoj6DpCbhy71fkFd4YYWWX++pWFlJ8TYTJ9O9qjsjIwedcG?=
 =?us-ascii?Q?u4nSeh385WYR2FXBDb/rgJv/4xjBA4m8xpOXJqNkdAUmyE/nCHh7c28y8z9R?=
 =?us-ascii?Q?zIQnPOW0j7zabJCd8rKHlZOCT1WzqM694o+HffTXavbcNM6V2UgxqrbtPdjU?=
 =?us-ascii?Q?JwXcsFsVCEQ1oxtqAlZoicAiIIj0yzC+WApnzY5OiqxJESfMrAgOK1y6f/a8?=
 =?us-ascii?Q?C0iAstPfVL/3c0871Vc7lR+W5c1s6pPw5cN8cNICdbvE/GVHLNSHJPTnWBgV?=
 =?us-ascii?Q?0A=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe364624-d838-4211-796f-08dcc5b32e71
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 09:40:54.9569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZKKbBSMIM1u4q3U6ctRjbO8P8mLN0oDBMfv5jdDqEY/HkGZLRQB9aR4cPJojv4/6sWruljJdkp+5i4uBMF9EGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR06MB8418
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Aug 2024 09:41:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111945

Apply suggestions to recipe content ordering and indentation style from
oe-stylize.py and also remove the duplicate DEPENDS line for
python3-setuptools-scm-native.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 .../python/python3-cbor2_5.6.4.bb             | 21 +++++++------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-cbor2_5.6.4.bb b/m=
eta-python/recipes-devtools/python/python3-cbor2_5.6.4.bb
index f0c2964f3..37c3ab647 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2_5.6.4.bb
+++ b/meta-python/recipes-devtools/python/python3-cbor2_5.6.4.bb
@@ -1,31 +1,26 @@
 DESCRIPTION =3D "An implementation of RFC 7049 - Concise Binary Object Rep=
resentation (CBOR)."
-DEPENDS +=3D"python3-setuptools-scm-native"
-
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Da79e64179819c7ce293372c059f=
1dbd8"
-
-SRC_URI[sha256sum] =3D "1c533c50dde86bef1c6950602054a0ffa3c376e8b0e20c7b8f=
5b108793f6983e"
-
-inherit pypi python_setuptools_build_meta ptest
-
 DEPENDS +=3D "python3-setuptools-scm-native"
=20
+SRC_URI[sha256sum] =3D "1c533c50dde86bef1c6950602054a0ffa3c376e8b0e20c7b8f=
5b108793f6983e"
 SRC_URI +=3D " \
         file://run-ptest \
 "
=20
+inherit pypi python_setuptools_build_meta ptest
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
+
 RDEPENDS:${PN}-ptest +=3D " \
     python3-hypothesis \
     python3-pytest \
     python3-unittest-automake-output \
     python3-unixadmin \
 "
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-
 RDEPENDS:${PN} +=3D " \
     python3-datetime \
 "
--=20
2.39.2


