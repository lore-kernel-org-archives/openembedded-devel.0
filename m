Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38AD9C433EF
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 11:29:22 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.64])
 by mx.groups.io with SMTP id smtpd.web09.5453.1648553358935878323
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Mar 2022 04:29:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=aQTx8g1a;
 spf=pass (domain: weidmueller.com, ip: 40.107.20.64,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oA1uRkE9r/rurzlK4dAYbSvvjqwpoGF1o8KQZnirTWTzhMOX1U4EU3hx81u8RrfRXcFZJ8p1La319OPrNdP8aD7Lf3VXRzoXg42eWw9wX6R2DHPr6m41W44GXzuyieQr7Z7jST9FEJqF/EtCbVVsKJVOY9c9UnX1OXhEAI8bxpgWtIP2Wr6e1KWIS/pRSjbU54HMJmA/27lerON1gTaYxTdxzHtg9W+umZyn3NOp6YMthpTOyJmcWIBUvYM3/PdNb4F7Rj7dI4Q5zcFeRjk4KElbIw+gMkXeTwNgPwHA+gM0k8e0U1UcmW0OfwWb0sFcbdV4X0semCtl5bbTkh0zpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hVUWCZWU9Q9Vu822qb/jQNIT0Vx8EiGsRiu12zs6m8s=;
 b=PBpET0FlYAAyhLehUFvTKeeuc5yS2Rcwxkgomct3D8iNEz0xTXyF1NgH3yDbzIgxyFnElOFUWHq3146M8KL4J4ONBradGYUSroWVO+yiojTvjanNbE6f++ldzrDES9cH4rFNC7+lScGEHN3V3VDvOkwr5VqFUfGM/PuyVH/RwMAxO5PY4CPUYkFAz2mthf5MNRG/hqmaL3bqpq3+3qMtJWcYc9PLJyL/yN4puBcI2BMbi6y0cJtuUuAy1FxMfTyaDWo7OesQIZHEhOkyG34wX/twqKUr5Ut8bag8LkEESYp8jr2BDR0N7ZABnDT9jaPPnVGReER3UivKJNv39kgUuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hVUWCZWU9Q9Vu822qb/jQNIT0Vx8EiGsRiu12zs6m8s=;
 b=aQTx8g1alweLGXQrdRKLdsGlsQm3FsPEKJpu00PRf1OZOlmCgKLiejBoWiudrp0hS7IRc28tEfVgA+v8OYg23Fbgd/swgvS4l7a4ZwmRno8moa5Fe5zGbfiNSY+BXCokW3Cp2wb0NIpnZYT45uzfxtjo043b7yQs8NkU20dfsGM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by HE1PR0801MB1868.eurprd08.prod.outlook.com (2603:10a6:3:49::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.22; Tue, 29 Mar
 2022 11:29:13 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::21c3:3ec0:a144:68ba]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::21c3:3ec0:a144:68ba%7]) with mapi id 15.20.5102.022; Tue, 29 Mar 2022
 11:29:13 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-devel@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH] grpc: Remove runtime dependency between grpc and
 protobuf-compiler
Date: Tue, 29 Mar 2022 13:28:46 +0200
Message-ID: 
 <20220329112846.26910-1-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS9P194CA0010.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:20b:46d::10) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0603abdb-3260-41d6-79b0-08da117759ba
X-MS-TrafficTypeDiagnostic: HE1PR0801MB1868:EE_
X-Microsoft-Antispam-PRVS: 
	<HE1PR0801MB186882B6DC552B376EAC4DC6D71E9@HE1PR0801MB1868.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6GuqX33YhWRur2sMfDmWJicIz7LORKnxXT+cZVDDDYDhlH7zPYHkovl45ucDDSrB2n7mZUp1IJeh7+d9534Sb2TsdiKZgNJKW0bFZzKeNWmFnffirCVSTD7UBnSKqTvEAsqyuwG67tBfNnUPjr5t9IOWeuec0hSB5v59B/u98TQIk7D9nFWuJvs6xczWphvaY4faqyHTpFXZPxqc561WIcguyG4PjOrDArldGR0zrhCH8ioCZFw065/+m+gxdE/iL2JQcqGkLoS65St3bpptSsksdnbtA2Gq/xXzWBWx7zxSihfPDoI+DvK+o4eeZtdzWlhBVif+pOQq1B0nQsOyw3Nl9JLUcT3/+H5zCsNuXkMxjKj4nMK25MOeWZzMtVSfVQZycdSA0bzDeHme/iJ8JoXIw7cjnFL+xNINqSfEOJKwBdo9NLRVQh0mRbMcHObByfmGRHzLfN59YdsPzFizC4wJ0ZSBQLw14gm2HIghWcrdH3HKf6RDNFX2TaF/1vZdtHWIsMxGBLSS1mzJfKBpwflMkyepQHv0u0qYaL1W2yvL9C7l7NyOrBHkyz31TLarXbn67ZVQCYFHcrwyf7wEf65buf7b4m+XYQ0CgFYzqNqydvYj9Q7G7+HXQpZ33wKDJZb9UZFCYPMBUhOVLy5n5q/kHUaw+48/LBhiobksxgEEkn9IxjZD1Zipfu1JQ/ppeZJjjFSXm5pjVZ6auzrNew==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(8676002)(4326008)(52116002)(86362001)(36756003)(66476007)(66556008)(66946007)(2906002)(6506007)(38350700002)(38100700002)(5660300002)(1076003)(8936002)(4744005)(6666004)(508600001)(316002)(6486002)(6512007)(2616005)(107886003)(186003)(26005)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VpQLaDKOgyB1iatSP7Jyck4hMFHjf7GuNGIq0VkktEhV2enrGmNWYizUkwbx?=
 =?us-ascii?Q?yhxmM/RfRGE+6fmQw9RqUbnGujUanWrs5LlnIktU7DOFrpitKpMGVe43F/i5?=
 =?us-ascii?Q?wqxZRc1Lkh+H7IDmlzuYDn0J0nQnMeTtYboaZ9vlREdSDSEz2GxIjqYKOdh7?=
 =?us-ascii?Q?ao/Tk9cnJkfnVnTeNTl5x5UhaXXahY99UyaSZt0dnsohte7GmAeornvXT1bc?=
 =?us-ascii?Q?kdvOMK0P2jj9AGnfrji1sDNwBAIgJh2YmyAtx1fzX/hxfxUDabhuKpVUPc/9?=
 =?us-ascii?Q?YNjADSTeyCN1ZSr65IHZG9/sAEo5sJIKm2xoGOstKvQQyjtithqCvM9RIVW6?=
 =?us-ascii?Q?o0SFlo8UtA3R7aeumtWJD0/nxbR1DSWTwr5SyRGVtTcZDt49UcAIhZccmngu?=
 =?us-ascii?Q?ckYYUHnj2IyYKxwyY7SdKNbGb+NemC3gDEvSAsYKWHMQktztPpg+DuqHvy6X?=
 =?us-ascii?Q?DCyO1ZgaiOGedJ7l82/7ymhAr9Y8Q05adq7IOg5FkszSxbuR2gHTkgR4iHiM?=
 =?us-ascii?Q?EVUCgWxvmH9bXgy9Wa+drL6sejogFpDIalJKIlCEhVI5V2QbeD17pYk67hji?=
 =?us-ascii?Q?h9Jfe2JITYNK+E0gKdiaIONhio0p2Pb6DJqgQrtk98o66FfuF+LJYL1U5Mvp?=
 =?us-ascii?Q?CWHdf0WnH81JIZ/XIrEjD1eVVg3gzKqQF3ikGrl3Vn22wZBD7j4mgCMojAi6?=
 =?us-ascii?Q?tQ/cbZZivTtBCuVauax/b+zvqYYIMtr4cFY3u3siwADK9Na4GlYbtBxDt5l1?=
 =?us-ascii?Q?jqqxjU6aIKYmpD0kOTdcLjPI8OT5WgG5PTMvLhFpH2EjDiIyOf4HTM2h3uAH?=
 =?us-ascii?Q?4Sj4p0n9mbVS/QuX6rk3SsqATSkW5+vNmyUBI9PX0clNuautK4Ug5rCZTMrf?=
 =?us-ascii?Q?ybfc6u+AUdazknjxyUcen2Ax7jpUDKMs4BSzRgmxTzBXpaz/cp0x83sCxqP0?=
 =?us-ascii?Q?cKkLmFe8aKMw55Hy4gj3IrLPQWJXX+Gv/jzqC61rU0yHIZaX1dj+o5hXBSrO?=
 =?us-ascii?Q?1olkXueuAMyXoPzYWKCSQhgGOwnEdAdBP1d9jWrvVf0O2/G6Wyj09N/rCESe?=
 =?us-ascii?Q?d2Ebzwl2aJR9Axlm8IUkr4vQ+L7Hhc8qCaGFj+6yRtSbDQ8EF9vo0xWhNCjU?=
 =?us-ascii?Q?KdZ1ygVHsdAt7fFQCo8ESgpoiaKPmUNN5Y529k/FYM++FCoeEg/EwaAGrR/X?=
 =?us-ascii?Q?PbAQCp2+dhQY6RooTGi60bfgB3akg+eKP+dbKmGDBFpzP/MqunTVW+0LoW70?=
 =?us-ascii?Q?S8PpSjqImV0dQwoukYFeI/BuY0N+UA8oliHZRXumG4hRX0Eas7sjrpjzUEEY?=
 =?us-ascii?Q?+X7PBRGzV8iaKYF+LPOJtHTtmASqhTLJeyMtLA0ONR2ST2P8Olv3x0KBCzvV?=
 =?us-ascii?Q?q33mSz5N3W4idrw2z4DDhq2bg2cclA/0gSOvg8JoTuNFMPm0dyMqM2Qg8K2z?=
 =?us-ascii?Q?BcJeQQRYStq0CMuWTOp/PxSFwZgTCLH4FwPfdzfk4ngwaAZQapnCa0GTBoyN?=
 =?us-ascii?Q?88l4iqB4dQ6U1rdydpzkbqz+HIF9E1Ok3aHhHRl4IJuZvEFgQUy1UElV7pxr?=
 =?us-ascii?Q?EyppehuWWfmc++YA2RMS/2699LaBcGcZz/0zycWjgyEYTKtntfFFGhKy9vBF?=
 =?us-ascii?Q?Zmbj7bTBXdinnOk206S/WK6Mj7+IOy/HOv5o2GwbBn4x6+pgrnMmEYvvnc2K?=
 =?us-ascii?Q?TlWbmzD7rkYjiLB1nMdjI3vYyLkbiMRnvEn5oKjZa9QSMWnuxHXFE5OiyO0I?=
 =?us-ascii?Q?5MU7ajHw8lW9TYe9Z9fVuj9USmFs6tE=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0603abdb-3260-41d6-79b0-08da117759ba
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 11:29:13.5519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 HylQQugY8v/YZxUmyY2jSm0JzczxWtZ203Vnqk8toPVLcm1maF5bQwiiSUhBYfVg+fIN53BVVoqWD8Ex1BNMFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1868
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Mar 2022 11:29:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96254

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Remove the runtime dependency between grpc and protobuf-compiler package
by moving the grpc_plugin_support library to grpc-compiler package.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>

---

 meta-oe/recipes-devtools/grpc/grpc_1.45.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.45.0.bb b/meta-oe/recipes=
-devtools/grpc/grpc_1.45.0.bb
index d6b50ee7d..d25a01cf3 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.45.0.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.45.0.bb
@@ -82,4 +82,7 @@ BBCLASSEXTEND =3D "native nativesdk"
=20
 SYSROOT_DIRS_IGNORE:append:class-target =3D " ${baselib}/cmake/grpc"
=20
-FILES:${PN}-compiler +=3D "${bindir}"
+FILES:${PN}-compiler +=3D " \
+    ${bindir} \
+    ${libdir}/libgrpc_plugin_support${SOLIBS} \
+    "
--=20
2.30.2


