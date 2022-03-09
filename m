Return-Path: <tom.hochstein@nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3C09C4167D
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 16:42:57 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.64])
 by mx.groups.io with SMTP id smtpd.web09.99.1646844167910035514
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Mar 2022 08:42:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@nxp.com
 header.s=selector2 header.b=TnB8gyCV;
 spf=pass (domain: nxp.com, ip: 40.107.20.64, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ILHEqc7pO0TK92t1d+g3/XgUc5Cq9/cFT6SbNCv71LSKBfDnr/P0p+tgJOmmcO7javQsV8bgKkxhRuXzkk2vCtQ2Mfh+pF29UYc6uZuNH7d/fScTdMHhu9WO3hW6jEHhrmSQm+cMxKJ3U6shhp69xO11dvLTxk+Uyf8MxoPrgoSWvl8aZ04r8oXDjWFXDqvfld6cRFUJiZW1iQk8T0LsKFYzfkRd6lIZHR7P1Wv10y4mGajfagZk8TFB7Hw4Ym1nuixxnALILXjAJaPNgM9e5q6SD9xGz9rDjcPAkqwzSCUknUduOGnSECEC/TSnRtqGZXmW0tpGQUUInKfIlp+htQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JLt4QgXDd5VVY81ZMO14ga9fAqmh/cZA3bMnEC+h9+M=;
 b=PrTuNSfIaxj90QFStC8XQCfDIEu1ZPgZrIJTIne/cGsSyBOa59nII4CQId0kHTzCKXybdLQLudda0xKog2NBZT9D29jKpmt4B4fn8S8XMmus2SQMIlu2j0Z/PeCTK965FnoJPB3C04qtq+iVBq89NHZMyxceHT0M0xSLGA4o681dA8Vx+7zDqj7S6bNqQhM3Esn1rkWQUKCEU57k2AqCIqmgmAr4cWkJRJD2T8+INOfGdeTTpl2T+Tdozv2S9OJAOdU43sC0ZfVRKNP9+bg5oq1TpvxB9FX9OmEW+5jieti8AFfF3Pk5OySjS+NqqH+E0XOMgtIhOmyVslUidNHziw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JLt4QgXDd5VVY81ZMO14ga9fAqmh/cZA3bMnEC+h9+M=;
 b=TnB8gyCVdRmkPj2RmgP6827zl1g7l872XiGnfoG9R8dJsmssffY9F7oWDNcdbyCdm9rQOf8M5JgFq341Xt/dB+69hmE89Qum9LLtcvGRfzJIpcLe0OuRsaJlat6qRcANuEKl7RtJQ8QzGIMvg00tERiz/kfXnrDVK4jL2/DVph0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GV1PR04MB9053.eurprd04.prod.outlook.com (2603:10a6:150:1c::8)
 by AS8PR04MB8342.eurprd04.prod.outlook.com (2603:10a6:20b:3fe::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Wed, 9 Mar
 2022 16:42:45 +0000
Received: from GV1PR04MB9053.eurprd04.prod.outlook.com
 ([fe80::61fc:ae5f:4961:246c]) by GV1PR04MB9053.eurprd04.prod.outlook.com
 ([fe80::61fc:ae5f:4961:246c%4]) with mapi id 15.20.5038.027; Wed, 9 Mar 2022
 16:42:45 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: openembedded-devel@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@nxp.com>
Subject: [meta-python][PATCH] Revert "python3-pybind11: Override pip install
 variables"
Date: Wed,  9 Mar 2022 10:42:31 -0600
Message-ID: <20220309164231.3543420-1-tom.hochstein@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0265.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::30) To GV1PR04MB9053.eurprd04.prod.outlook.com
 (2603:10a6:150:1c::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 624b93cf-9988-48c0-f169-08da01ebd681
X-MS-TrafficTypeDiagnostic: AS8PR04MB8342:EE_
X-Microsoft-Antispam-PRVS: 
	<AS8PR04MB8342261C82D831FB8F5001E5E20A9@AS8PR04MB8342.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qpKzkx/6y6AE77fcueMoOdSIOhkn7WgBJlydmMECXKOIJU3Jv4NoTOVtOO825uKYyG1f7isrMEIpRT2m/v+WtMwnRNsw1wKHL2QYzHK4/R5zb4EvlkQEDPofNL8paoIqqGKFVifMdN1ShSDVG4exjHiOxterwAEzJU2gHGApOwQ3U81r8szXWt1Vb+/r3aGSHy3CDcZbuKhcIBMds11L0Ga4ewX3humZ2baErcT0IZsnJ9SdLfJ25MgY8x06gK4LbolG5ZCXqhJwWGThtEAfV+T05ZcW2cjYLNvg/RGIBuaFqeso+QsrmPTWgVSvohJPxLZwdzWKs9QM6q4pXzNcLifAu1SABFcjNkLpCY+UQI1wtzPZ1gXYnAhPPmzQKNIJw/wi8f75f3414ocg22ijAGy1WG+AJwXzzQIh/OkC6HGXG7095rGL7SjU3U5pIZ4EOXyyKSsgEsgPhLAVQ+9JzFzG8OH1nh7ddD3FnqkE/HsMBeS8jPTFcldYeykYLHSVmqClDEkBT9O0oG+PDdQvioXSAAZoC32VCJZlil/aARjXSON2YV2L9Fak5Jr2n9h/JgkQm1MIbKXzM35QZamez//X7CUAgk3P1HebOb1555Zz5cokbhqg/3g7rvVrUtN3b4c449iB7dTSrv9M53WEkfh8iOOjB7bW8bHMWwsWDS7l9HnCpGi+sBiAI4VO+Yb4vBAgBU8KA2ta/8TBqRq6cQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB9053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6666004)(5660300002)(26005)(498600001)(2906002)(1076003)(4744005)(2616005)(86362001)(6486002)(83380400001)(38350700002)(38100700002)(44832011)(52116002)(6506007)(6512007)(186003)(66946007)(8676002)(8936002)(4326008)(66476007)(36756003)(6916009)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zDiJJwDGhGlGmAl/YnVR12dsTZx5hRu7+LGn8oD9xXCzs7gVY/EOGOQPeP2u?=
 =?us-ascii?Q?tpJHHC/xbQVW5mYZVreK+1ux8qJtFEsU8gU8G+GIK8U+1fPLMADzb0med0Wi?=
 =?us-ascii?Q?O74jOXgm3HyBICrv0H/J8YJb4/9v/JZF19N1sgYaDJ9PWTgSE2M7BtG8D/au?=
 =?us-ascii?Q?LCd9mGw2fYNAvaM5xoyN+E/3FH4O3vIdMgzasrBgWgQnmmifWK4BV95aCHHk?=
 =?us-ascii?Q?hPgqvVUKeOfhjoxFNsLxSa6r33KZA6Q+Fy50c0Q4/1yUHwN4uJberIoU5sK2?=
 =?us-ascii?Q?V0OJ4JErbKQ3a+DzR82yGeltYFHSzhdK328ndHYTomfCTQjgS5NWkVbr4IQU?=
 =?us-ascii?Q?VpL1HLkg6me7heLm0G38Q4xrWBUPZ2yLR7bylemMmvMEz4bMwiiiZN+47Nox?=
 =?us-ascii?Q?nP+laqVwFeM5+vblZS/vTiEKf6G6diPA+vYb8vt2MGge1aXN1mrETnxomSsB?=
 =?us-ascii?Q?SM5/Us7hlHwNxgdYb20ZXgUxF0HHUj6IxbAtlTrAERP7gRdZb5ZSshdedMbM?=
 =?us-ascii?Q?uimBU9TARgvdB977+/IhHz7U6VB+Q7Jcm4xLXHhmTt5IPuxyTSp/9xqf8yo2?=
 =?us-ascii?Q?eaSChuLv4ncVnSHg0A7DlZkFfmELbYdizUvb2VFX38wu9XTTkrisahvvmTMf?=
 =?us-ascii?Q?DH0jl5mtA+0jAyA5xpi4IZ36tODR99cEd9Flzzrgk1sUEvGtg80jTsl3krvA?=
 =?us-ascii?Q?/T59NPFz9YNLb+qWZm1QhZLQ4edRLZ9kkmzXwZ1f47hhHphm9CQfSufszJzm?=
 =?us-ascii?Q?liW2yx8yMrazoklC8L4++5x74dgsiPPlMi/1Ofm7iGoieKx/zD3m36LxlWAL?=
 =?us-ascii?Q?nQr7m3m5hUHfgOo8U8DBNGnI2++ldOgHbFspUzaqUBC5cHsrFnrRs8srn9KE?=
 =?us-ascii?Q?yvDICzTacV2wcg6trnqqejmRIqUfFk/JISXcJdC+hctAVXcb8j339pP3w+2N?=
 =?us-ascii?Q?aBzQykuBFpgvbHjwuCWfx7UG3D3T9jSHfPUvXa4N8270IPA22gnBp0SeL2jX?=
 =?us-ascii?Q?TU0wVECX3Rtwqr32LQ4rCstv2eH0ph7CdaKBBDdZbjQ5Z6kK8pL6W68sBDAT?=
 =?us-ascii?Q?gonjyMy8Z6s6NVpTFb7zunYm8HFyl9UtIqNDKYf7xP4QChzwmO3XRz4GGwUz?=
 =?us-ascii?Q?KwOkdNxw2FnqF8jCtqOo7oh/K3pzSbEOLQ+EPA4RlVU0D+d/NCUWet1VcaGA?=
 =?us-ascii?Q?ZDUdF+qH0wJNpvO2vQAg/qZd5XQTQQsQTki/Thr70BDnx+0O8ZlvL/9YVZYY?=
 =?us-ascii?Q?7s2aaqXr25zDubR0gNBHgaf0R8e0RJPzrmw/7odNitOcIw1GafmsuRSqwA5z?=
 =?us-ascii?Q?Gxfi9Sx5o/IiOX+Ox1RW15og6u13EnDxFZ261DXjcFYsTv+gqWgeuun3HQTz?=
 =?us-ascii?Q?LPU1RdMBv1vN2/0kDCsOHJEi1nhokEejwVmLkIQmziAeD619SOeJfF1vhMZ0?=
 =?us-ascii?Q?BHa+xfN93U2gKg3biMzNNbAWToG5EKTdUqyGaThFb9gVERC5m+LNzRxS51ay?=
 =?us-ascii?Q?KBR4bSrLy0Kx+SL1KSGmj3pyx9RT0mlso8MKL4TfVI2TRr3Wt72wdhhEV8Kn?=
 =?us-ascii?Q?E2DN3xWPM0XtlbajzF2/SfrDWpyVNYgpJdtCm2YFuN+KkZiZGtYH2x7t9K10?=
 =?us-ascii?Q?4ebyCgIjsoDuCL0UuBmfOzs=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 624b93cf-9988-48c0-f169-08da01ebd681
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 16:42:45.7565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 CgRMa5EQZ4q4FQWtqdheD3Pt6kZpqRkFZa4rVi/5+uzKfEfiD13Ha9LNaNIzAj238DkhUajfqhuPLrnfcwU5LQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8342
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Mar 2022 16:42:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95907

The default values are now correct, so no need to override.

This reverts commit 2f4a34cb1e3c46a1da110ac49d6cc5bac3d392e9.
---
 meta-python/recipes-devtools/python/python3-pybind11_2.8.1.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pybind11_2.8.1.bb =
b/meta-python/recipes-devtools/python/python3-pybind11_2.8.1.bb
index 4d94e2033..dfacb41f1 100644
--- a/meta-python/recipes-devtools/python/python3-pybind11_2.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pybind11_2.8.1.bb
@@ -19,9 +19,6 @@ EXTRA_OECMAKE =3D  "-DPYBIND11_TEST=3DOFF"
=20
 inherit cmake setuptools3 python3native
=20
-PIP_INSTALL_DIST_PATH =3D "${S}/dist"
-PIP_INSTALL_PACKAGE =3D "pybind11"
-
 do_configure() {
 	cmake_do_configure
 }
--=20
2.25.1


