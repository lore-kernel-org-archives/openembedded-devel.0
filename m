Return-Path: <emkan@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50D8BEE49A3
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 08:50:04 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.139])
 by mx.groups.io with SMTP id smtpd.web10.9320.1692953401511744747
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Aug 2023 01:50:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=k3OZ45gE;
 spf=pass (domain: prevas.dk, ip: 40.107.247.139, mailfrom: emil.andersen@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QdG1REr8kalqWupJVqPVvxoBGlsRWtKhB8Vv/DEqykpbcXj29VnyyYCTaxoQHwk8VewSv7NulMMt/zdnr5krFyLZg+C9WLgXLAg3jOoeO4NySk7ArftnwCxZ7U1rqNvdOvcVHcnufRw1XjlFc8NATJAUFcTeW+u6E3z7PGmonkdpcPARhTJM2U2FIm6m6dYqEu4/4LDdHb3fCS+is/mT+PYoRNH0ROYfZkk1v6RDqUwi98rmXFsZCk9wEwyjo2tCw+DgjeZ/4brvrewifenuoGgIlzph5Z5mUfKcdvPN9zE3ZcA+lbzjSD/FvFARrbfURjmzL3P7mLuhZ7kfFAbQQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q5SITEPeSIAylfPfMmvfORcirvPGboma7txnWngUwkg=;
 b=C1K2MWO+rGUaiOgK4Hz31u3V0xxcWkyj8nqiVuXoPruvhRwSgRHgIhhDcaAuI8Fca+Bu+G/wneW+c46yRimKQKEDrfQqGR5gEzLshi1+bhNSci3p7we21v4aToQxsGcApuTYHQDy6Qk9lKV3MjOS4JwfQdFBJleF4/boU82AxJ6yvMUUwHtMxAH4XjgzkjGN5PCwjZCqEwVVzbZoZ/bwNRUDeDexTz8965xXSz+TH6gHLFAx87xEwuDFj0NKqw6A4NjKsiw7vFnYkK81zYuBUrPI2K+Ry35/QiDFoI0IaRhBP4sOUY43wfz5BS8zUNPL2ngglFT5Iw+3WnjdB1Z3iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q5SITEPeSIAylfPfMmvfORcirvPGboma7txnWngUwkg=;
 b=k3OZ45gEdBZ5jGpwdBjCXO5pa1ejNfTcBfatKPsX7PLjzHeXyLpw6IJyqHQLZYeAdve8QeAN5kFXamBdxFgbd2o0kPwu+uH4w7YNCct1v2vRJst/1qIhcBgqvZESWwoNLfR7uKj4poxA2Y8OvewmVxiZpq3K1uLov1MvXtm3uyA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from PA4PR10MB4576.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:10a::24)
 by DB9PR10MB8286.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4c6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Fri, 25 Aug
 2023 08:50:00 +0000
Received: from PA4PR10MB4576.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6def:6be3:e407:5126]) by PA4PR10MB4576.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6def:6be3:e407:5126%7]) with mapi id 15.20.6699.027; Fri, 25 Aug 2023
 08:50:00 +0000
From: Emil Kronborg Andersen <emkan@prevas.dk>
To: openembedded-devel@lists.openembedded.org
CC: Emil Kronborg Andersen <emkan@prevas.dk>
Subject: [meta-oe][PATCH 1/3] libopus: add CVE_PRODUCT
Date: Fri, 25 Aug 2023 10:49:47 +0200
Message-ID: <20230825084949.18322-2-emkan@prevas.dk>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230825084949.18322-1-emkan@prevas.dk>
References: <20230825084949.18322-1-emkan@prevas.dk>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0078.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:8::13) To PA4PR10MB4576.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:10a::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB4576:EE_|DB9PR10MB8286:EE_
X-MS-Office365-Filtering-Correlation-Id: 75ba5e72-7a88-41e1-1241-08dba5484417
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tDXwdQECrRuw3qijIMslR02sPr0V+gnlqaqQaSAEILj/vsOcU6TX7mIr6pjBPePWXBdZHGv7VWu45Z5LRMRQt9VZdt6LNVZ3dob1v1KS/u8lqhicycmnggEyG0s09JHSefXZ+2NRYApm2aEKYSOLLc3ozXZ0SFLnrCUA99F+nD2K5pKAoz4yLa6OYfrVG8Lk8ZlW0hlY8lJJ4SaVivmd7d/VdZAztWgmVMs/P6+i4E6gmmu7tkzZF5S/Ler1mnYyd4sgEZIBEU8yTwU70XOeYCUL9VQ3l/fQ/rXw70H8HGuS9aUsfS7WagYjWMWJYUgNBabGBua5mK3yQabiOc6+DuwcSPvKYmbxhowS166tNcZ+Yv3+AcQwRE6EgL2iDxly7yraMGnegdSCuB+aQKwZ4J8RlDENKIjblTdiqeXiKo1SU6z0cuTKOM6GRj+s6gkUWFQnNogwJmvaOLffIMs1I642TFN5YcycbhTNE99XP/Liomv/tDvXiXwM6aLSrZgyp16AF2yb3noH+vNTfeyuzJEXal9oo2J5CStJA4podVGL9m2X9FuUQzE9QEr1dYwUROyaHlFozFzlm1I3iy48isLMgh5Eaigk+KC5HPxn72ikGXkzL8ceJPcsTqm1Tybz
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB4576.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(39850400004)(396003)(136003)(366004)(1800799009)(186009)(451199024)(1076003)(2616005)(5660300002)(107886003)(8976002)(4326008)(8676002)(8936002)(36756003)(4744005)(26005)(38350700002)(38100700002)(6666004)(6916009)(66556008)(66946007)(66476007)(6506007)(316002)(478600001)(6512007)(41300700001)(52116002)(2906002)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JqTgEx/h6Pm/8ZhClFS4EFVPj57jh6AjCvMCUd9lj94k/vUq5RhvSTBecg7d?=
 =?us-ascii?Q?FwKIPYXR2L10sO7IbGZFuqoVKvVz9qHT6PvIlAAwZFs0aZfQejrAikql6qth?=
 =?us-ascii?Q?rzjXS3Mq6U92AURP4uxZyWPW2k60DoqX29YY80ylzp8RZZKo7L7jgp7g5rep?=
 =?us-ascii?Q?fnXtdISB6lF0F1sQ1biTfJzEBIUyoJ6Nn2vzCw00NCueA/PB+6Jq4SQ7ZTek?=
 =?us-ascii?Q?crj9ReS0VtbxJru60v1+wnGOB7TQRBiqdkdZap30cPBhH+RTa5bJfTG4poJD?=
 =?us-ascii?Q?gxJZDMY3FNCj4WZKGAhT+N+6LjRdWYkfP55kzzCJFKJ8/hjydEvebXkP3h4E?=
 =?us-ascii?Q?U8Ctt8pXQPoRlQdzX9bFI5ySzSYRuu5Lq6BfVKur9Yny7Ai5WD7LFs3SHn2t?=
 =?us-ascii?Q?MedElR+cNXDzlWZ+zk3PflVV5j6T2ZqcyUbu+yLFDuSkdGz3+ZwyLfgft/Lf?=
 =?us-ascii?Q?mPX6tM4+Ow/5Xvbi2rIOlEGG49VDHsWRCkJsXqoPKQTN+gB7w7v5ozG0oopN?=
 =?us-ascii?Q?gID+o1yu64fFwv8FTxue1/5JhaYxkPuOwB/zCf6zsQuAuxm9s3J3UP7Tnya9?=
 =?us-ascii?Q?TvA9kPM/qoP+B92ietJcoZpZl0UpQfsVHSRorlhgHVTuPo1NhNymWTHPRSRr?=
 =?us-ascii?Q?KtJdE+cE9ING6UBij4olhu3EfIGTSR1I/RdpbbyFSS23S78O+nNGXVKSi9rv?=
 =?us-ascii?Q?9Q9AOMBnF2Kr9cbqYgp6y8D9rgSFjac51HdQehTVXezFZi9eqR2CrRqZQgJZ?=
 =?us-ascii?Q?9h8A6ujDdi2pwU8OkMEQg9ZEe7wVfHUjlpGShxfDoI4/L3/K154liyIRV62s?=
 =?us-ascii?Q?unOzEzZi+mETaoDe9ImnSDz3/UgPpaB9c/JouJ1rVXjTKgnsIyJ3zjTUTrI/?=
 =?us-ascii?Q?irLIe2nrFf9sDtM/r7wc0/UIqeb/GXGKyFgvK2E5YJCvfCPuqVWuF2/PkqXX?=
 =?us-ascii?Q?kblricsuyxffGqVNLzLnbn99IcULGvQxd6ybyb1eesZAGOngADynufNseHKX?=
 =?us-ascii?Q?ivFD1Z2917w5HDK+zZAijAsXthrIhRkK78IJskPCeivhgjc8f0EvN9Z7UUuM?=
 =?us-ascii?Q?nbNk2/4OBCRd8uuFH6OoyNI9/hq7Me08VFNqzDuvC7dabfG1TT3p7eW9WY6j?=
 =?us-ascii?Q?m3mvYujZ+dH820lufruXUxrXK7gmuEWdEY1qWjwff5ldjoaI9GDQjwAckHiI?=
 =?us-ascii?Q?bypFa3NXRVqKlSfcrOvKuOWI/BgLzsddm5FPteRb7SojrkOYqiRzsEefcQqX?=
 =?us-ascii?Q?f7yVI3bG+098nFuj9GareTpTuQ3wveeBgNObZSxIHKSqJ9Awu8/V9im+Z3IB?=
 =?us-ascii?Q?MS8MuKXktHU+WwTw8RpEpkRe0FW1N7bWf8EUy895tmBowybp47xtOvAXHvCt?=
 =?us-ascii?Q?X9elf/rIEdfKtcH53kbYU+SLpZ51HwvbdL8HVdcANKgmU+agODdB2vVf6Yus?=
 =?us-ascii?Q?cSAajLOKDKdZK8qVsj+7WHcfK9B2Pq+K/RaWGYK3bPWFTTCIJfXptuaEnriA?=
 =?us-ascii?Q?Xk5Hn/yunHGiF5cM+KS7LbG92m3EMjm779Q/7EBg9bWcB75SPiKvL/Vbu9yc?=
 =?us-ascii?Q?sRuaXT/YaD+fNMDAnJhqc63VxaGQXOy1EkRoNqisPDB0aopVkr6dvw5+GIsS?=
 =?us-ascii?Q?Xg=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 75ba5e72-7a88-41e1-1241-08dba5484417
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB4576.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 08:50:00.3254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /gwRAiP2C4Rd4w1C/LkomCTy9q6daQlXAi0BbJyGndwkgR4AieeRtwNfwraTssEnKHVevbUEdXc6wKqqRiCWkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB8286
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Aug 2023 08:50:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104604

Signed-off-by: Emil Kronborg Andersen <emkan@prevas.dk>
---
 meta-oe/recipes-multimedia/libopus/libopus_1.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-multimedia/libopus/libopus_1.4.bb b/meta-oe/re=
cipes-multimedia/libopus/libopus_1.4.bb
index 200211774..65ee2435b 100644
--- a/meta-oe/recipes-multimedia/libopus/libopus_1.4.bb
+++ b/meta-oe/recipes-multimedia/libopus/libopus_1.4.bb
@@ -52,3 +52,5 @@ python () {
 ARM_INSTRUCTION_SET:armv5 =3D "arm"
=20
 BBCLASSEXTEND =3D "native nativesdk"
+
+CVE_PRODUCT +=3D "opus-codec:opus"
--=20
2.41.0


