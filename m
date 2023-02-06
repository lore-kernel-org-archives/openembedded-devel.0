Return-Path: <tom.hochstein@nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5C2EC05027
	for <webhook@archiver.kernel.org>; Mon,  6 Feb 2023 21:48:26 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.41])
 by mx.groups.io with SMTP id smtpd.web11.67745.1675720098910757720
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Feb 2023 13:48:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@nxp.com header.s=selector2 header.b=fC5VY2s7;
 spf=pass (domain: nxp.com, ip: 40.107.105.41, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ckU3w7HOdp64znz4F3FRdhp164f2Ttbbase+cC0CGuep8z15v6PO/Jldrbs7QpuHWQ5mgYF6NbBsuv6qiZuvi9ZtO1hjbH1dEOHxdBfW0bYZh9+1irggd+6tvirDAEYX9fRp5DHgF5Rfm3EhQfVRQrrrwstJjz92tUH6kHjDhTkpmLs1dENYfGcbKRIlc96Z4eMuCXbvFHcMgniXR/TOtKf8J+mdMB6/yUjfON43OFIW7CPdTKhCCvjrovjnF7DVQ2Qg5YfLdKmlKuNiLavHT/BAt6zLNlVeO5XtwRWtkIc+5ecg+nrykzxmxN2cjyzHJm5uC3b59+3yzz7CEo5v+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fpMT1LuDPPW4yLJ6eMYnZru7uBwnI/Z2FmxYvUHK6KI=;
 b=VTWvk9346PaZuRj+x/P8XQUs1B9gDVDlrJhxbY/8GtsBhRnp1VWxyWxFfguutzWk8uAD+FHa4k15ntCH6pQgzcoc2c0KUekMPSqvTIRhoaXiM1SuNDuTgjlbmb/Jsz6HhQh5GkL1GoTCONYdLuuiWLcjLeFMM6VmvtZ7wDTwut266He1fJLeWHRyFLz8UfFPmQQA70IfJVMH5ypZq/50UKrHEFeWcr253COnd8sh0XkpFGT6Ty+7s7bAHJ/x6P0B1u2aPeFS4TY76RWCAq0ICZDB4RieLywRxlYXZwyFY/RKnA0KONP3rzKWGiy0OSV1RmKseRjtRKEGuDkZMhkWVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fpMT1LuDPPW4yLJ6eMYnZru7uBwnI/Z2FmxYvUHK6KI=;
 b=fC5VY2s7w5Dz433ocCYMIFTIgrUeH/3Hos7mj/Awui3ofpjWo9M7NxanXRdoykRzHlceypV2jscb+rBjH5HI6rvL67cTkrbvBkvU+VKcsTw7M78VyidjPPPRwP8FJtCSg5uuPNVSYjjvSlb2A5Sqtel3yVNTjd+DHfxjQEKLRjA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB3PR0402MB3852.eurprd04.prod.outlook.com (2603:10a6:8:f::15)
 by PAXPR04MB9154.eurprd04.prod.outlook.com (2603:10a6:102:22d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.24; Mon, 6 Feb
 2023 21:48:14 +0000
Received: from DB3PR0402MB3852.eurprd04.prod.outlook.com
 ([fe80::1667:141d:675c:ea2e]) by DB3PR0402MB3852.eurprd04.prod.outlook.com
 ([fe80::1667:141d:675c:ea2e%4]) with mapi id 15.20.6064.031; Mon, 6 Feb 2023
 21:48:14 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: openembedded-devel@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@nxp.com>
Subject: [meta-oe][PATCH] nlohmann-json: Allow empty main package for SDK
Date: Mon,  6 Feb 2023 15:47:57 -0600
Message-ID: <20230206214757.2101210-1-tom.hochstein@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0040.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::15) To DB3PR0402MB3852.eurprd04.prod.outlook.com
 (2603:10a6:8:f::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3852:EE_|PAXPR04MB9154:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c294a9f-4902-4589-e877-08db088bd95d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XFrXGwpI7paERkFvWif+rQ3p2+SA6k2nOFDz5k+7us11xUqFinx3fXG2PP0Zd2yhyZm36KBEBJooh2b17TN1TTZdb7gCDTi8u9kfN51i1PHL3YjITx2ms/kPCw0gF/+Z/5PAbLUOqgDdTmpLtmsAnLCEXoR6gRSRE0yb18EEfvJ9Hhr9mFD3Y1qFEnAO1umop2C7EutVkwN5nlDoH7SnuvE0hpMWRDT5AlYwvqNuvLW/9f/0wmbvRa+f5LT2d37pg+FTe7fh/Q70gWlTHeRibtopYWKnoxRXhYAWDWynCZ+eGvdCxAe+3mnC+UKZ2vHHQG8dtwRb19YIFmAr0v17+j8PlIiDGTgLg/3M54nkRixlUl71o83xo1eyn4pHbpRgyVPp8oxprNyJGvfr3skui4BIFL0fVODa5+27i1sNy61qJyMFT9xyjE/fcZT41bDj5/cgs13Xe8KNekzgEkP1gyj6Ayzn4eWGYXmwkiIS71jqPd8JpCAbAc3zusjzM5AVvhTUmNm41/wnSUxV9CaRHnj/lyd5uIhkv6DrS1X6Qv96d+f+P3bHnHaKCZ3iPx8O3o628s/zl/FJXCpVqC3GxQtJvAhjOmCPEvVmGR3APZSoYN1OhRbgpzU/L4fdG2ei5WHyAHAdIA1kXxtKXKjhA53813bFvFHlSD/D82tivxx5ZAi01+DojCi1evtDZ+4WfgBb47v0gZHwN4NpxUiNlQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0402MB3852.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(366004)(376002)(396003)(39860400002)(451199018)(186003)(6506007)(1076003)(26005)(66556008)(86362001)(8676002)(4326008)(38350700002)(66946007)(66476007)(38100700002)(6916009)(41300700001)(83380400001)(6666004)(6512007)(8936002)(478600001)(2616005)(5660300002)(2906002)(6486002)(52116002)(44832011)(316002)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fzNY38fIlMbpKZZhGdamCJi+ihC0vCYCYhE8id8kjU6wIqFTwrbdVPqyKzZC?=
 =?us-ascii?Q?5VYR3qoGhD0s4UHMYiPPbPDxWHPioz68GFsMvohYK0+p52PN8PB4ik/2Af/7?=
 =?us-ascii?Q?jfT4nTUSzz2TuaNxsWX4DD7+lGgZ/MgHIASSkZV8c3qC93OdLa8KJeB3IawD?=
 =?us-ascii?Q?aq58xLCmXyHBaFQNA0+Z+jhnU8j3/228o4l7ACzrVOejbzpyfHdMRbDrAdr/?=
 =?us-ascii?Q?eJhn9eTQ707CeU0Vhy4Jak9iJhF1O0t9mW8sNknrrEKKgcOuv836eBRd1NpX?=
 =?us-ascii?Q?Mi37BRo0fIDzTA3WAw4RYqSDf4Esvqkh5yGD2/eJUGnXLOejEBhIsmGc2mRK?=
 =?us-ascii?Q?Horh2fFX3oQShqeCOBq4cUJEBwEUG2NmMbx29XhGHqO4PaGLKtUAWrnwRO75?=
 =?us-ascii?Q?RG7LcCDy/PVuxItFw1RarkfjqzYIDPsda1dyMK+17zIX50Sxv9eG8HYdJ1sZ?=
 =?us-ascii?Q?VwZmHM+Bm6q6K1hisFDZFggMo1MtlrvxOF5lu28xDhl68bM+jzqkdz1NonGg?=
 =?us-ascii?Q?enlPuRqW3cfHtWHa/0AvveFEa42a0t/TId9SpPjn6c/M5lXa9cZrzsWdlPsI?=
 =?us-ascii?Q?5TqDhIJC1LoEcvk22Fq5p22AQn9/GXZ7qG/fKHA8K3PpWheznzqXGLjNEGKN?=
 =?us-ascii?Q?2YXP6H/9O/604Tx3vIgGcvrj9ILTsnRan8XYLcZtmN+5ylL809d7stljElHY?=
 =?us-ascii?Q?vgCZ2RgbJ9N7GDtN2xOkgbfW4xMp53bB3be4j4CG6xtwSULFB45f2FKx7GXU?=
 =?us-ascii?Q?zr3YfFXq6Ow959pVKGLSTe4vXTLJLKDuVYBiEcqAB7G/Bigmx4prm8HOQOQo?=
 =?us-ascii?Q?PoYUiq6zjUj046xGwQl14dZgL2ru/9DpQBY0Occ0FuxHPIY1n2aTCIIOBECi?=
 =?us-ascii?Q?ZZizIc/Mjx4zXFioxOUmSUc4DOEljhdRpIFnuSDDw+1jPSRwWjl1cBtJ3bgY?=
 =?us-ascii?Q?mMjHcknucT4J58s3wubNbtEhZXK3qvSu7HcjIJtF28lG7fbsnZ/IpNB7sz9d?=
 =?us-ascii?Q?fb+T8R3skUvMF/PcwQ0is6xzNcDE3F4ipDTLJziIXWaE19bmG9XDRsHsy3iP?=
 =?us-ascii?Q?KSUc6v+8FOEyWv18ITSGj15tvcEoWGKh+Qm7KQqxP3M3ZPnkTHV798PTs47N?=
 =?us-ascii?Q?cLb/5cw4WkQUYWPCTkyYPe6Nmppp7gC0KRZSsTZ5fXAOvWWGuT116r3CQ8wV?=
 =?us-ascii?Q?GBLrZqVlmKE7Iybu6glZzLFHWeBwa27fyPDOB9Ofmvi52udpzl9hAVTIFCp4?=
 =?us-ascii?Q?Vd0gQCwUBAUoZoBvHmj8W7VPk/a6e6Tq/wbFHosOk7mnhfMU/Ii0UOpDSd4c?=
 =?us-ascii?Q?7sEljCPCXWbIsYWs1q/NV8faASIWU5+Q0r3qox/vl2uiH0Hyus2t5PXas6ue?=
 =?us-ascii?Q?K53NNoYiC+LMu+j0bL4H7Nq7+eeO0whQiBD6Es7r2YROSeS28xIeyb3Ob7ej?=
 =?us-ascii?Q?3WvSXR4vkh/xk7yf99FCrnOdPz8A2Y6ST1w/qV6BOXPCrCGxEu0o8FeRskPu?=
 =?us-ascii?Q?VrbIpWBEh2o38JPcXefNqMMJPDSw1JK9UPsDt5n0QGfCT3rvCWmIqbZS0KDD?=
 =?us-ascii?Q?o5skTux0MW6J35VaAmYruTFgK/MvIfFoaSiyjSIy?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c294a9f-4902-4589-e877-08db088bd95d
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0402MB3852.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 21:48:14.7874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XpR6NMHFyKdnlloREXjLvEAsdIDjSLLTeGYkVkxwJD9oyWk9HfiNblMg4O9nDwvWO/UMxDNpP1i+ZBAOD489cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9154
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Feb 2023 21:48:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100947

The header-only package cannot be included in the SDK without marking
the main package with ALLOW_EMPTY.

Fixes rootfs problem:
```
The following packages have unmet dependencies:
 imx-gpu-sdk : Depends: nlohmann-json but it is not installable
E: Unable to correct problems, you have held broken packages.
```

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.2.bb=
 b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.2.bb
index 502262820..6cf27755e 100644
--- a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.2.bb
+++ b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.2.bb
@@ -18,7 +18,7 @@ inherit cmake
 EXTRA_OECMAKE +=3D "-DJSON_BuildTests=3DOFF"
=20
 # nlohmann-json is a header only C++ library, so the main package will be =
empty.
-
+ALLOW_EMPTY:${PN} =3D "1"
 RDEPENDS:${PN}-dev =3D ""
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


