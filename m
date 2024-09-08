Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B0F5E6FE49
	for <webhook@archiver.kernel.org>; Sun,  8 Sep 2024 15:34:46 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.121])
 by mx.groups.io with SMTP id smtpd.web10.32313.1725809679183516956
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Sep 2024 08:34:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=kOmOgJ/8;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.22.121, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VxzpMhGRUlXwucy4KUrHH588ZxkqTdKU1dKCVfcCV7hhr7Gw9WPZ2mc6rH9nPcpBPDwgLvIATM27tznIQAsiH5Yu8kyIIVU8KPoeSFkiX8VtT2VZdpJ9DJLGuuaoYLU0yS1xUG4HlrjP1M6Q4XzB6lFC47WHVdAkXwDUODWO0EF/fw1yA6qoIBleUpRjTtdBASusJV+UmAOOyfi41TWW4CfBPwH/EoOnHe1TyI8pnMeES1NFAYRf1ye1/pjUsd0+m1ejUs/VzM6mtsp0ZR1ygJXhKcUGMl/Tj7id98wb3qPFJUWivtKaS+rWezD7G0kz5uihzrOYTaI1+IJfMJFwGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NL5g840o8Kt+vU7UMdxu6SY0Yj7Rppq3m8nwSvU/o04=;
 b=ZnF7piqCC17Oaco8CkieO1fnuZDq5zes5qFGVywB7Q+BlH0gK8XVU6sqzJM4jdRH6UEI8AMbja7dA4svkR63O9arwo8G6wd9ieBVd/edGSqXUm/kcI5w8FZC3YPlw3uALToadDrRPHH6WxRH2hUYGSsVkVpaSIOYWsBYFzil2s+BD/vpUpGLRyNhdVBUrF7nHphU7c2xqJrA+UAyoT3ETEmRr/j1/GckyRVzhpqEeflU+ywS8vq5qtoi5tylmu8sI10slo88SMlymyA3i2Z0I+nlMDFBhgWtLEtKOgBhiYLtY5uGozfBg6TcqRzAYn3YW9VRGi/czHCh77MJuboDSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NL5g840o8Kt+vU7UMdxu6SY0Yj7Rppq3m8nwSvU/o04=;
 b=kOmOgJ/8m5TvuMs+QPe6hwiAhQk2A8TI0QwYt1g+fjoIVHHfimpA8s9a6zMbUnNOrd5zIOibfMYJjpYMn86BRtBFE94MjMhxb7k7VMLk5Y8ylTgYKfomfM0wqUQA+yDFPikctEL/2ykFugOGV47Ue8lQuuIVZx3Xn+4ckvTkRXxqIFJUEYMTuxMM/pzQ7o4WxIYWNR9khuhGkhV6bZcmre6bATyw0OiT2c3zNR65doWtXwX6MEOoQJxVRXBw6RUhVdnicGCMahlKOziOKPug/EnKB1dOmJ/467xg7i9PriTVb7bjiXQambinfKXKKIE8f0aW6xTgd7xSN/HTGww1Nw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PAXPR06MB7472.eurprd06.prod.outlook.com (2603:10a6:102:154::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.22; Sun, 8 Sep
 2024 15:34:36 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%4]) with mapi id 15.20.7939.022; Sun, 8 Sep 2024
 15:34:36 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: akuster808@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][scarthgap][PATCHv4 16/19] python3-haversine: Fix LIC_FILES_CHKSUM
Date: Sun,  8 Sep 2024 15:34:05 +0000
Message-ID: <20240908153408.4114753-16-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240908153408.4114753-1-niko.mauno@vaisala.com>
References: <20240908153408.4114753-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0011.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:b::7)
 To AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PAXPR06MB7472:EE_
X-MS-Office365-Filtering-Correlation-Id: 57dfe78d-ec6a-4b07-75cc-08dcd01bbec9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?JQZq/7y+A6OrSgFM+nFLtsU7DZAKqj1gki+0P0pCLrgg/0t2iG9lthXi6rZE?=
 =?us-ascii?Q?U2jjtTg7lXCnwci30MPsPrwg7KknvNSc+xoBfA3evjNNBi1xPZpcf2sC5b4A?=
 =?us-ascii?Q?JFGYYrHSpvI82LTu/kkoay7VbMaCAt6R7VO3hKOn7VX9N7QXQPTpnnBgq4AF?=
 =?us-ascii?Q?p+3wc/zD4ayZ8rsDJIayvsFMu4LkxWFXf2Cu506eOXezGN8tXfqjDTP3JN4j?=
 =?us-ascii?Q?PKOZAUunPtGlBBgPHfkwPUdjHs1pRSU1hzx3zQtw0viYpV2Zu0tSTO0dYv4G?=
 =?us-ascii?Q?y80nJid2PrWMFNyEojcxvaZNWNi9txdQ3uNaaiM66BmHTj3eKn5nlzT/X766?=
 =?us-ascii?Q?pua6k2OE+5FONv//pl1YEVYMIZ+DyjBRmgbsYWRKa70+Tb6kNCP5ANTgWmrj?=
 =?us-ascii?Q?Xif6pX6vQ6fL4KxLGCy8UGVSNiwTeena+DSe8XpdwOsn8aABHDSLeBk14XTH?=
 =?us-ascii?Q?6DcwsOnEoHCC4iSYy2qtHlgHjcjZThtlW+4Lneozz0klGv0hSsb2rz8R+OSN?=
 =?us-ascii?Q?ho3VxwUlC4XaTXhkC7minCP2TrxkX+jsBL32oqGmF8bN6ofcioiMFKhw8w46?=
 =?us-ascii?Q?Tv2X6GHwgG74cIfj1zeX+nDyFgeKVKU0KfRIewK5d9MTLMlVUBF2SymIzBhU?=
 =?us-ascii?Q?IyI82P3iIV0m8ohEaOpO2t+TEahLCRgmW9ULzbaBOw25ncNAdkOWX0vWmxPl?=
 =?us-ascii?Q?wUVXvk19jYtZVvRTadNRDh1rU9qQ11aECXRhyonVqgX9Hvc82calQ0YhhOC4?=
 =?us-ascii?Q?2sn4efYputQzTSqAatWXGkQqZBpJTPJ37wqiZZevK1jb7f3b5eCuxQZWRtXO?=
 =?us-ascii?Q?lNs7UJOV1id5uzILGFUhv3muL29RrV3pYPdrHGFwaqYNJUReBonz67/YVzPp?=
 =?us-ascii?Q?Fafzl0gRz9iaZlw+rt1mFDAS33nWME+nBCnHJAd2wYnsSYA695moMv3s5gAo?=
 =?us-ascii?Q?98tbg7k7cCZife2DtFn3GGwiyOuxboRuwOrQgwVLGPej9sZN0/jO417wr9f1?=
 =?us-ascii?Q?rLMJexaqOcSjSj1c1RKdJ/JtlP7tnzzDNWDpErH5djXnWFpS87K5vs9HkhPt?=
 =?us-ascii?Q?2O8deRsVNQ4J01HzJh+uj+pSOUIADiq54U2N75KDyp66qaXvQIMeAuYc9RRH?=
 =?us-ascii?Q?gQKFhQP5Vwm8EMy3zgEZHnBX/5Za6scrUl7xYadM0xJ1q0IhQorkpADeDMDN?=
 =?us-ascii?Q?t/I+lIvdbipm/WD5gL23zw7MSRqkeucDI0cGZjo4KfiLbGfXDVsdq0VMtSDm?=
 =?us-ascii?Q?EHuP5yMj7pwevruWZ2Sf1OD0CARCoNouYidNtSrCnAJaL8heQQDG7PHOYBsU?=
 =?us-ascii?Q?XDqGHzsGRpUGbb6nTh4aZbfx+PpT4gtCJDrZKhP2LP9daUUflf91PU2pyraM?=
 =?us-ascii?Q?/LsfKYJZ2hb3CBR0/1BMjWgucXX9Ep5X8PTofYifF/wutwdB3Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nIAYE+ijHOHo2TbxNEX9w4RH1T2UR4Rx8/r5xM/swE05CSjpr6YVGBgeR8Zb?=
 =?us-ascii?Q?qQ+1cwGGc5D53k9omWCcCh2qY7egPWe/gNCrx787Q3q46NinIIBIxZQMwvMP?=
 =?us-ascii?Q?emdsHwiNhBmPjZukiUAdWXZBDr8ppcG2xfdJb8j9vlzIhTmBYC6J34KZIiy/?=
 =?us-ascii?Q?rXxVoFSGsoA4wBFOwkWCGM3S6iOEXsWO7o6KmqLyheyE1apBBomyCw6NE/NC?=
 =?us-ascii?Q?eIQrNc2JbOHALJyUWCBgj9sYtVtPekIuOq7cy58psw6AOhogRPdDWG5bJEBY?=
 =?us-ascii?Q?+kt6R8k12i5Yh5zzQgM1NQ7s3koDEA9CyT66RW7Mh7DZ3ACQOR+diR7Ry7Cl?=
 =?us-ascii?Q?T0ZDLRNvjmhOJriTKlKwyU+f93B5SuBf0Jyz6NSulDP8C1+uKA25lK5vrQxf?=
 =?us-ascii?Q?iEF4482xTe8Aw9kJaDhILHC779RtPbN+LCUngFkyAe24SCv1Rlw47K0FPxFn?=
 =?us-ascii?Q?JShNj//ajwG9GAQrHZUMqfwK8QyeHitY0SqB3BdUjiYHKV3MMzXSXuaGj7KB?=
 =?us-ascii?Q?wJrBvWrFQdpH3mIOzFTzR3p8jIAsQvT5aMsH3GDE6787KHR8TPjcZmGMLHVg?=
 =?us-ascii?Q?TLa41aVhyCRSH1LyTcGyXMWfUc+EurSAZDAm5Btlo23ms2d/4jPq2x0qTVqe?=
 =?us-ascii?Q?2hGXPW8uc50d+7BpwcdKmTxajv8uBtZYCDr+eDYeZrlxOY1d3KKZqLq9xxJR?=
 =?us-ascii?Q?pHOTKIwWpKK6h6ltX0vP+mlgmbr6TV+mbnOxtOBSwcv6ZC9TUEqJkhhQxKoJ?=
 =?us-ascii?Q?TvnfHjbuguKp1af6+9bGTAQv6nXZcCnOOqkJcSzoTUIThPMcNGMdGTED5Oib?=
 =?us-ascii?Q?GclGoIvdhW6SBc8d08e7a3MBxxiQLgybv7KuC0AVfBbLQPfSv7KGlWMxqTEf?=
 =?us-ascii?Q?irThWT1eoPpCXg2o+LxJOec3TSrDK4iVifyRNruGNa8a+xNpLa9TnE6tUOZU?=
 =?us-ascii?Q?0xBVKyfBHUG/Ax/ICDiAoJTo3rDmXZBVGV/aXmZterodikOqqXxZhJaW1GdN?=
 =?us-ascii?Q?+RghDDgUW8CDsAAAJDtKDObDIQV4OH08okdTMP/AdfATWQ2gzCboBU+oK09H?=
 =?us-ascii?Q?VekzR06HVE9nZu9TozD0kNcQunr0F1HaLtQOhWsAb9S2dBcP+qW2bDNiu50x?=
 =?us-ascii?Q?llo4apfPFxhoBPuOTvGGlXeBZVz4TOWzQTPdUz62Iouko8fpNXz9HKiIIo+7?=
 =?us-ascii?Q?D9ZgLe6i9XOj24SpHNQyuGLrLvjtV3UWWDZl8hNZOrf9t1GDFQ5qBVapYmKM?=
 =?us-ascii?Q?cvuyc9jIU2Oi4NdHWQTO9NXYDAhEr9kBvgOi+deCSXpu+AVh7VSmFKb3itdF?=
 =?us-ascii?Q?8VLPrY6hCqOaRt4gVuj/5WrTEDhtf+hQq8PhLNiRzDeIoQLDFL/FJC6LL60Y?=
 =?us-ascii?Q?KvvI5cqmoR4IMOcuPgR5QCYvHyMW0DRgguTfhqEH/P9uQDLo4Ocpp+edfNhI?=
 =?us-ascii?Q?mUzSnFuFvsiBIzMHEIUX5CR1VjeKUpFhd9FleoelQeVKkjyJuCXjwwHpkQ7g?=
 =?us-ascii?Q?82iA7u38hsS4Lrtnpvo7xjulBpTINtzj2XKr1FOW0dGLSJx2x3SQoWa/wJq4?=
 =?us-ascii?Q?Xl1/7GosYRgT5aDId+lwnU0hsfC4fCBJX2ri5bcz4XoNTj/zBoDmSbX0lT1B?=
 =?us-ascii?Q?Fg=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57dfe78d-ec6a-4b07-75cc-08dcd01bbec9
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2024 15:34:36.4792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qZUTxmmSnK29pUBbcFnxLqUFD0c5DoVUwtDhDXrlUxPa5MjB2ZfPap2MJKh/KYnXyi2jBkhzRGvZp9W9UsB7sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB7472
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Sep 2024 15:34:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112156

Change the reference to the MIT license containing LICENSE file in the
downloaded archive.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-haversine_2.8.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-haversine_2.8.1.bb=
 b/meta-python/recipes-devtools/python/python3-haversine_2.8.1.bb
index e45ae7986..5fd5ddd71 100644
--- a/meta-python/recipes-devtools/python/python3-haversine_2.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-haversine_2.8.1.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "Calculate the distance between 2 points on Earth"
 LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0b=
cf8506ecda2f7b4f302"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D20a52d2c688975e989fcbee3e6c8d1a=
1"
=20
 SRC_URI[sha256sum] =3D "ab750caa0c8f2168bd7b00a429757a83a8393be1aa30f91c2b=
ecf6b523189e2a"
=20
--=20
2.39.2


