Return-Path: <tom.hochstein@nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B5B3C678DB
	for <webhook@archiver.kernel.org>; Sun,  5 Mar 2023 15:43:58 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.65])
 by mx.groups.io with SMTP id smtpd.web10.11088.1678031035772693053
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Mar 2023 07:43:56 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@nxp.com header.s=selector2 header.b=hGbxZXBa;
 spf=pass (domain: nxp.com, ip: 40.107.6.65, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WdM3mFV4JbV/3g0zWer0YY6UcJBVkbWE6++zYzJ41FYA5yqp6v3aYkay/zPw8v7wfuOOqDEZ+BsiSMaXQkwCTeCOB2n/fVkYBnR4kHI9U7m3Uv7xYgRlbujEILquwkdlp7/zzUsGntuUZysPpQmYIcbUWiHI8QEE1fXLdL33xbUZjppI5pTFyTuFHVrXaCSMW1U0FESWvv8LNoAzBoT245RWtAnu22M97ccDeYAv95p9lnfnkN7X/UNQyyd0jCR3ccmbPnaukHnHcnhsho+A6ITOoaNnGFBfdv9ac5MaHuOQqG0PTX54PPnt7m5FrIpjWCCrLqj5w/Dbl3QLbeUZHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=346J0z3YZkXJrzjevY5SGJkWuiarmPfOQaPSTHJN7KU=;
 b=BdIfAAIj36Wvy4Jdw5CLYpjMHZDmwRLOPOwyLM2P7Z5PsztbrGeWjMdqpBkc0e5YLSNhE0Zpjxr2rDEC74HMdV5vqsrkGAOHvBPNRp/PHhKhT4CIwelE38L9FCaELzHmkcJwEAFS73PTiy7FYfUGTvFl9RiYJHnFvmhECeQQbaxk3e+WA56S6vVuSJx95ETbcLrsnyjnaFEViH9TRuvGvS/8VZdlqUAB+SnRc95Rf/2Kx/YmjtYjD63UW/uEmz9n+95cLVn22ZH8AKrBon7do6isCpdj8Er99zt7FoJuhjhGbqOtwsX8n7eQOkshRcHCd24/XfnF6XC94qd/dxNj+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=346J0z3YZkXJrzjevY5SGJkWuiarmPfOQaPSTHJN7KU=;
 b=hGbxZXBauvsv6HAdb6f6SpA6lkdlpHRUG6xyxTquF1RXnbgnO035TiI5G7w/sZ8T1eGMF3vLWroCx6IdfxjZLlJxc+/Z1OZ5rPdivUMPllhLcL5TSxX+Zq8bYmi2uwLBFy6vND/uCbpRhGeOLPGD+v+JiuPh9bR2nrgvrLLwrYg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB3PR0402MB3852.eurprd04.prod.outlook.com (2603:10a6:8:f::15)
 by AS8PR04MB8071.eurprd04.prod.outlook.com (2603:10a6:20b:3f9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.27; Sun, 5 Mar
 2023 15:43:52 +0000
Received: from DB3PR0402MB3852.eurprd04.prod.outlook.com
 ([fe80::1667:141d:675c:ea2e]) by DB3PR0402MB3852.eurprd04.prod.outlook.com
 ([fe80::1667:141d:675c:ea2e%4]) with mapi id 15.20.6156.027; Sun, 5 Mar 2023
 15:43:52 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: openembedded-devel@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@nxp.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][langdale][PATCH] nlohmann-json: Allow empty main package for SDK
Date: Sun,  5 Mar 2023 09:43:26 -0600
Message-ID: <20230305154326.2516244-1-tom.hochstein@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0033.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::46) To DB3PR0402MB3852.eurprd04.prod.outlook.com
 (2603:10a6:8:f::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3852:EE_|AS8PR04MB8071:EE_
X-MS-Office365-Filtering-Correlation-Id: 840bc2d2-79cc-411d-28b7-08db1d906b45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dWHZlvLOMD4uBXz+mBLQvdQM5WNUD2tuKQ8I3VCS4Cla1It15BDX+AuwkO1QIbPLsMr1f8mZkeGl+k4RsRtlzz1O2/6+w4/JGf9O/LkOchojVy79LGEu4IgZo13385WQ2PEOfpb6OBudawM0k9DvfFZNuIL6AH3ID+35PC1IGT3HAvmurs47cqCMUvPl34Y0lcsTdbRgWtLBsP1XJFQydqkd1lC0PZPqkb3GSAmxiY4dNies4Lz6jx9CPbPNKBfEWJmEKiVaEwjDZkmsXefrMQI/rq+FOV0k/vCWUkYLGgXfVuZ7XJYCh7aFyt7bkqocPOP2SrilvGnLCslN0CvEFwBfPCcPxfd6bgqZewpWfVTMZfvDb9YROaQXUVfqbxWlLgUN5tCSVtkNvyiXhRWXErRXtIKrch5HCfyxCDAzdPWgp1/vZOxeOKxeDp0VdbQtWJ+kUaAlEk10PkVewuIJOcFxBnfbYWFh3x7uMbV2QcZufAOXURQKd4z53DLVS8dEbaT918w8H7nRTb4RqfDyqS3KImKPJwjROi/KRDEMSUTkYdIxRCCyZvOWK/aRztHjLiVpkvqTLMsgQAYYnK8NwyUiSbdbO+b7NncshPziaqA111rZTgZn/EF5I+OSOPi7oEHKGHBdq6yXAPEMyAsLAxFwirFOY3f+lsJxGHjla31YWTdUuVbjjJGxfLHJ461T6NIIsPCmsWrJaUNcpyAqhg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0402MB3852.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(366004)(39860400002)(346002)(136003)(396003)(451199018)(1076003)(6506007)(6486002)(6666004)(36756003)(83380400001)(86362001)(38100700002)(38350700002)(6512007)(186003)(26005)(2616005)(41300700001)(66556008)(66946007)(66476007)(6916009)(8676002)(4326008)(2906002)(8936002)(44832011)(5660300002)(478600001)(52116002)(316002)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?A6a9DjrN2QlKd7hUsbsZufQwsxy1z4cCfhQedUxWnBvewU3B10t0gEVHU7nU?=
 =?us-ascii?Q?vsLKXjSJC6u9dgbw/gVglyiGLmXCrwfU7uWJVky77DfBt3SCj7tqR88BHLgf?=
 =?us-ascii?Q?bxQwaeTjnkS/93VK7h4BMunFjxhFV9rZFFpBcPIq+O6rSilupZ6fusX4Hqhk?=
 =?us-ascii?Q?utTd+2zuWBeIPy0pkXghAeTT/5nMGK431KFt4BbfirBmCphFMtKumfVCBxGw?=
 =?us-ascii?Q?9LkHOsbihyixSHHqLKrNseBLoT/D9/2vmBCz+7usMaXdxISta3wL4LweDa6r?=
 =?us-ascii?Q?SqvTk+mlmsRLAWIHdEL4fV3X88Jhx1GjyV9RsDVPVm/YSu1ZfvwFcimEkkfp?=
 =?us-ascii?Q?GtQFTSQVsu0VpsmLNccNxiAXV6HZyaanoScDTgJthZ9wfb6jukF+p9R7je8q?=
 =?us-ascii?Q?eC/ZFB1FNBcv3Z8H8lbdxlciVRnqWWnRki0aeNH7Ibxb8BtwBWYQdI4K522G?=
 =?us-ascii?Q?4NdjMvcmIQ+IZjMjEweDtiG8LkrgVf31oUiinFPnkGPb1YAVXAvxqeqdnsRY?=
 =?us-ascii?Q?IPJXiEymq0G4OAiQ7eg4mguzGK9tc2TsZWkm8JnAXfc3UAbdumltucW34fXt?=
 =?us-ascii?Q?URIux6IeuTmB1j8d0gwd5W9cn+r4F7wz04yKCgSR85/iCMv1REGPSVHcdIeY?=
 =?us-ascii?Q?n9pi32DK6koLmus2ZnyrhP9GA76+B8sLM86qv4jtE6W+5mD7Q/p6qRcJrWAM?=
 =?us-ascii?Q?vSc1Qbfb57jnNw/Ki7Khrcx/FReoSNcsae1APDR7Rj7ZUJp61wGQjokI4yIP?=
 =?us-ascii?Q?J5L4CWMXAJud4ydRkmUQFvnpHxXLQQCjYKKy2mo5jhK+6CyuscXDaQMc82UA?=
 =?us-ascii?Q?aOLuREiqEj8vLcE4aqvvjoYHadKVcQLB4CDFZvZ38yj+NT0XHptIBuF6CF8j?=
 =?us-ascii?Q?z1VRBEJMjghHu6sEULMkOsgt1Eb39nj9yYRYQUSzmfGRVNrvNWrDFgtetSaD?=
 =?us-ascii?Q?uDoO9TeR8X3su+CqL/HYrFfJSSyqbiXkO9097qR8fD9LCLeehWMJNJBxnlw9?=
 =?us-ascii?Q?25KFsj6HqR7TRIgTV5kWHzQtrfR1lz+exrmWRf+hCg5QGrv7KmTL/3uc7sEY?=
 =?us-ascii?Q?g/R2VXbS0ps4bwHdhSL384wUKB91UIFomeSzsGbS8DryGpyt8WfiDrxiZAm0?=
 =?us-ascii?Q?qy3hTr4rN58FiE7N4k5aR39HWuMNEEFihWegAIDZdAiLCp1XHTI3w0sAjVF1?=
 =?us-ascii?Q?EsI/Y9I6UP0xmJ+arO2UPR+pfWD2UrOMZcnTEDJi3Ty0V7qhdxVpRa/jFypG?=
 =?us-ascii?Q?9V5aSKTGllC5pPKBhKU3ApyVtMhWxTrxcq/XJkUlvPEe7LeGNSyYbeeKNgjz?=
 =?us-ascii?Q?Tne93R5f/hclktVZ6XWpDqhc7u4H797nuQ9/610513hOB5EIbyH6FkmFMaBI?=
 =?us-ascii?Q?MDpCHZgH3nwf+ouXs0A74PLHoPwZIObYgUscil4XUgpN92j10dih9TfAK4nH?=
 =?us-ascii?Q?BbMrkSXoqo9MqvdJRiqkHmO0REJHyBw8qa4pzm0PyKOGpJ/ANkvD2aj4QVrJ?=
 =?us-ascii?Q?NsHt4P4Iv7ckCrh5CpLlNfiGLNovPYKhZLZWBZa1suLAw4xRPz+R+GGrRsMc?=
 =?us-ascii?Q?h3KhvL5ZCE2AZLcVQa9aitk8Nlkrz6aCAFKnhpSk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 840bc2d2-79cc-411d-28b7-08db1d906b45
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0402MB3852.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2023 15:43:52.1184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m2qrSrymzWPqXxZOuY4vzsrqeZ2YByHyP29QlTBXnMgiOG6mfjMSk8AT4xd5pk/RZ0Ay1VJ3FEUqRpnZbfeSuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8071
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Mar 2023 15:43:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101385

The header-only package cannot be included in the SDK without marking
the main package with ALLOW_EMPTY.

Fixes rootfs problem:
```
The following packages have unmet dependencies:
 imx-gpu-sdk : Depends: nlohmann-json but it is not installable
E: Unable to correct problems, you have held broken packages.
```

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f9c9e7a448b9d9f7d54bbf09970223db467eedb2)
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


