Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0183C3601B
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 08:18:41 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.95])
 by mx.groups.io with SMTP id smtpd.web11.6181.1743754713392653350
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Apr 2025 01:18:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=DfeJUXBd;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.249.95, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RB74RntFSuqWF1RervF9qSbOft8oo9nr8S6CEeek9BJ3FAJe7ozMZTWGCShrUk9cgq8Yx4/0QXKQ2pVA8vXBSPjOzQthPzx+vdYPanb/8mGolCqUGCJM/LyF4UnY2vdWGrC55IVyWvWs+xACHMBOrMpyA+pyXlZGQ4X3s2C4AzZiBcnyqT7O772LQEeUo5xyK29u0aL5vXGI5DFZAOUOqqzQ5djQhEDp/PSN39LHEvNN4kZw4XmGCloe/bItbjOlyXovqxNIM3oTg53aUTP81SYWdRZbupzdMIM5aQuqUv1GTBMj5jJEGqxejNO7KLIJ+29TaLXyaRDqxvAg8QV9Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BXDvXRgOIgu7DE0O9neAwltCfI+SSalNDESHFX/UEgE=;
 b=OLQqd4jqFwGgEv1z19YOWwC3YfWkcBK//5LL4mk9hjMmVTimUZdWOa6ve528Sb12j4AAj+jX/KYc4n+ASWFqGL3CqhiUAnrjSbd/Kx6oNx31PgbBJiWqu9sSMQAnUg59vCksrCh6sqtMed4pyEdoHTXw7DTz74waGkfouhI0sk7cGA8IUdp/EFj+Z5h7Y+iPfMa7A9YHjN4v2yLtW9pgdOgauXtuySSJO48DMLAjJbu/rydVfAIPMv3yUcMUOy3KKY6djHbu/biV5m8Al5vRRnpzu2bXeyrEb5IyiGnONZuHJxHA/mH+EKBosBoA1/xK+r7JRyiYzw4BCwyYQXLXig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BXDvXRgOIgu7DE0O9neAwltCfI+SSalNDESHFX/UEgE=;
 b=DfeJUXBdsXsHBEqiTgbxkwK0/9NFH9KK7engCWRoGnjJaCyoP2GNtBYQJS6JnBH8XGYSTfikNwKlOCkr5+MGla8DUM4G+7AtE2sZFHiHo7alWBCf/AnDRogVMt10F7nydMS+khIz1qUjaABfWDz6Pw2Y10umOq8n+6VdZsTE6ytYdXX1EbrJXzZ13s9cND0rqXYP9XBO0v9ezsDd+LI1psZ4ILtGTZbYKNq9FAJR45Lyef/OaCHGI1P/NSl7pPNMz5kk4fK0JjAbJWMXOSlqR6BSTe01hAHkHRS5TBe1RtIwlL6j29l09dMLMFpFj1e6cq3MRJQGsZzQyNKqmfACyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PAXPR06MB7614.eurprd06.prod.outlook.com (2603:10a6:102:151::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.46; Fri, 4 Apr
 2025 08:18:30 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%3]) with mapi id 15.20.8534.048; Fri, 4 Apr 2025
 08:18:29 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][PATCH v2 1/9] dbus-cxx: Amend dbus build time dependency
Date: Fri,  4 Apr 2025 08:17:57 +0000
Message-ID: <20250404081805.663425-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GVYP280CA0031.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:f9::9) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PAXPR06MB7614:EE_
X-MS-Office365-Filtering-Correlation-Id: e5548988-b287-4b96-3c36-08dd7351483b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Yzm6U6wdpxpqycTEyDTBGCwtnsmDUlk99w8ku/w1VgoVffFMOTSUfmBM6Yep?=
 =?us-ascii?Q?EZ3RhdKYRxbYRMwmUsP3BZsVWl/OT6OSKF0W1oXPYmXXGeg4dmmBRfV218ZL?=
 =?us-ascii?Q?0MAUc6BJTCp9UFhy1rqWickCHNd01XS9wFx0/H4ch52eNi/t6OC9zYxJxNDg?=
 =?us-ascii?Q?YL6/rvHasHrRQ4ZW3SAoLv37F2MqtiSJPMZ4lVacp9SLxt1VD89RKxvfjKF8?=
 =?us-ascii?Q?eZkNJO9PLbI5THDKg5t5oquAi8G0IiLhWBkPRayOcb1kmWM2gcK0ZU654TOB?=
 =?us-ascii?Q?RvvmVsXPkTgrhQAfKxwUS1QGJXAkt4GEx8hXe2i5RfGSCSPGS3iNROR2UZVK?=
 =?us-ascii?Q?MbjPUaKQl5cNpG5VuBf+dQb746+IKoMpgVO+WgBMVYD0HQpOaK1wgQJggJ0t?=
 =?us-ascii?Q?zuUM+WS1IR1oBF6oIw3eBdT1p4g4L+lSniosYPRaYc0spDQ8MMgJZT3/nlsf?=
 =?us-ascii?Q?NNDffpInTSJY7pHI5WCPkP4Dxjo7P+6FKo6NK9fNDcjj1vdY3QsPgeUAJiaB?=
 =?us-ascii?Q?afRbwvTvYPfrksHxBITQNJcibpExpyVGnj5h/A4mO6NTPC7+UO+zE9o1LrCE?=
 =?us-ascii?Q?WzoSDl1Agc5zqnxeh56WuqSJ7dcqJA1EQkMqq5pEtmWuy0C1d8XtLO9LlGAI?=
 =?us-ascii?Q?pl08HibCzIOgR5WxDOCQRfl2RTqpn1PxJcjzkkujJvOWlvbaqfb8YVVUzxqz?=
 =?us-ascii?Q?UstJhAnAx47mVvQVWhLK00sc+WZHV3wjx57TV5qj5keFC3KTp+3zgz6C9Fs5?=
 =?us-ascii?Q?j+55u/DUn5Djb4nprT3n2pUWMwI6trKldjX4sAdLSlB84frLVRTGNx6LDSGu?=
 =?us-ascii?Q?QjM6lma2ae7rwIuJZdmFr3larKbFBSxu3wxudWBsiZ6BlfMgxFoW78yUUFRh?=
 =?us-ascii?Q?LbAEK2IW+8mN0DTiApypETKF36112Wme3sVTMns0+LMN4FmgwOAXaLnIaAlx?=
 =?us-ascii?Q?NkHPDqBJ6TJucbE6edOw9aRCMFOEmNJRoLMy3rjFnZwcZLGujtCKh6b8GOyA?=
 =?us-ascii?Q?O4496u0TZv1ypdafSKbUR9+KzaAToe4eU80iuBf6NNZgUldO7FUS5OXZp8qe?=
 =?us-ascii?Q?WZLqgeINRwyxxPlCAzta6JS8xZJCXxtP2Gl6MyvOsblHWQqHrIAATMCxgOpt?=
 =?us-ascii?Q?8p73t/La92uOe81KP4JDlOJyqUvZlvjAcNNFQ5YJi29WlcEECmbTYl9xn2zR?=
 =?us-ascii?Q?FNl1zUZa3W6CoUTBbbruOR6Uhbv+sbh03PXyMlapRp0+12kH1UZ3QIw4vQZf?=
 =?us-ascii?Q?aLAY08pEWg4MsTVJBNZ0IEmO5XADUpDfWlq0ATpQfoOtzr2iTjgsfyVHG0Iu?=
 =?us-ascii?Q?sg7ZkBrSTZRGcXOm2vicz6kb8BwIcMXkY4keZfhVXpKTHMSZps0BqDFYdZEv?=
 =?us-ascii?Q?aldycGJC3eVQDF1t3yrNtVb/WKjkZSdlPoDh8kggo6XyaL0gFeQC6AzwBsDy?=
 =?us-ascii?Q?LvlDhweQ0C2+0QMf/kI+acR7ORLQ5VzY?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jiCvluA6O5c6QLNhwy8WRqUU819S+4dLT2Dt2lw3eb3IVOoXjslPQJa95RLY?=
 =?us-ascii?Q?tfMBn3VYmcYnqjKF8yGY/Vg+e3GStWoqa66j0cYStkE+4qFD5qb4m0in/aIZ?=
 =?us-ascii?Q?6Fq79duhEQGVb6qHaFNTeSzS5KThYfblc5ekeU/zQJO8MEvLg0i6vnT3kxas?=
 =?us-ascii?Q?ar3Hh4ZCx0BE8j9WiHRTVX8+y34CZUUnSqlUuMtSCxsxWHboR+Di0IhTI4OI?=
 =?us-ascii?Q?VEZ/2bufdn0vTfPHLpR7/SB3O3765ylEVWblCFkSLyvEcnDd/mHIHC9TwwYo?=
 =?us-ascii?Q?+3vgwCWvW904CW/+5Mv1ixSn/fch7/VNXDkZV9PnwbrECGj7OiEKNUxqct2G?=
 =?us-ascii?Q?oJNu/1fz7QDaue8JU8g3LGvM7PROyIAhUsi9gvZQcUSAGdX4gcQgknKdzjgo?=
 =?us-ascii?Q?gZID6sVGbX8L35ZtjU+z1smKnYQS1xoq8qcihOC8mHvIWUSUsjihwsSS5pBu?=
 =?us-ascii?Q?KsmokZmcCOa71oAMNp/LMhbBKxS2HxsblEDFwMsWqPfeWzPjlA8Kd5iX4heb?=
 =?us-ascii?Q?dgbaWJ7naGA9nt5tDuUQ9Q32tGnWc2IOsuBfaw+jA41SF2MOB1X3BjOrkzMc?=
 =?us-ascii?Q?O/+WTJJc1N7lvWr+j7oueBh7YZ4zmq+96dfoonqxNluOzZsyNsNojmq55O6U?=
 =?us-ascii?Q?vbyXJ16JEGaf9RLzU/YtH84Cx+khVM7yCgMcy/QmA3cLIN8+SX8DhlJOIU56?=
 =?us-ascii?Q?xGeULx3YZabG3EEFlt0/EV3xXnEVH3SWMk3rilkr7yQrNrfiWvoB6R7psV+D?=
 =?us-ascii?Q?hD1Wm4O0GgvvM6teujLjn6UahIQJy2zmMBKLQ1RZte76bNDFMCMsEiNNjPl8?=
 =?us-ascii?Q?rVtV3SAU81fSc+mIEdXRv3ddrht2TkIuIWs2IZCmNl9FvWN0Ge5vMPhQTp6k?=
 =?us-ascii?Q?Rvon74nyw7EaNYZu1Sp0beDwi79FPjfwV3EwIZwz5WF1jzlYSxJcSh/iAC/v?=
 =?us-ascii?Q?JIbWj/faoRSn6HfRVblrFLlmIy0JXlb0qx1XmaQSOhrTSdRdah+BVqeNdXGe?=
 =?us-ascii?Q?LZK76X+4/NZSYe22FsPwToKZSNyPtmudYThrGkaHL3VoB2Lh+jtlvWnDT5MO?=
 =?us-ascii?Q?tuwsExApaNPvGsJk0m34frwP2Dvymgpt6WAICcVtaMYPguYiezuupXqzowbw?=
 =?us-ascii?Q?Y0wdQaGJT+W0mODtgadwhsGES1qcJre9PIVK2Z1akqdUWvaXb84YwasENGG9?=
 =?us-ascii?Q?7pRzZ/NnAH3PZK0IEZ4QOUZSWy9C27Q7pxzBElNwWATnJgtPD3wJEdYFF0nn?=
 =?us-ascii?Q?iuCcFO0LiAEAZu/hPqYSVw1Lw2Xc2yGYBcoW8yPOSEnvfFTU0lhnQpjwOHAa?=
 =?us-ascii?Q?VfwFpzEYsVfqgWPLluzp1D0JCdBoWL26DNN/T9IALaYg6/wuTumOszO/SPOE?=
 =?us-ascii?Q?S87w046SpkB7NP+ouq1p3xs9HjbocOFGnWYj2vSdeES5pCMImaVi4A0HG0uU?=
 =?us-ascii?Q?s6sbKxt5NegdmgZEXtLTENxn2EuZKgdftlY1d7vNZpqJ60m5JDA53kb9BENL?=
 =?us-ascii?Q?jdCh5u3pDoPT5eZusa7t3d+zkJyZtEL/PjcW4sWmjjjqj4VZ3C/3ZPHUFi5n?=
 =?us-ascii?Q?SBbH48pcq/taXVFpJQkRtstPMKK0V08Hh/0T3mr906iJsFZjOOTTae2BZ7Xp?=
 =?us-ascii?Q?CQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5548988-b287-4b96-3c36-08dd7351483b
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 08:18:29.9076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kZSwknY/LducMaB3WKk1QFxffK+zhA4M5MKyMOhJPL7UEBShPcNVM2zGhQg6QAPKNIWjfQKKADuk8yI++ldZzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB7614
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Apr 2025 08:18:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116561

The build time dependency seems to be particular to the 'tools'
PACKAGECONFIG option, so update the recipe in this respect to
reflect the state of affairs more accurately.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb b/meta-oe/reci=
pes-core/dbus-cxx/dbus-cxx_2.5.2.bb
index 05bce6b903..3282e4dcf2 100644
--- a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb
+++ b/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb
@@ -8,10 +8,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D24594f493407a4c=
d401ce9794e0b9308"
 SRC_URI =3D "git://github.com/dbus-cxx/dbus-cxx.git;branch=3Dmaster;protoc=
ol=3Dhttps"
 SRCREV =3D "f2637e726207ecfbdaaf02744e1b36e54f929c9d"
=20
-DEPENDS =3D "\
-	dbus \
-	libsigc++-3 \
-"
+DEPENDS =3D "libsigc++-3"
=20
 RDEPENDS:${PN} =3D "\
 	dbus \
@@ -29,7 +26,7 @@ PACKAGECONFIG ??=3D ""
 PACKAGECONFIG:class-native ?=3D "tools"
 PACKAGECONFIG:class-nativesdk ?=3D "tools"
=20
-PACKAGECONFIG[tools] =3D "-DENABLE_TOOLS=3DON,-DENABLE_TOOLS=3DOFF,popt cp=
pgenerate"
+PACKAGECONFIG[tools] =3D "-DENABLE_TOOLS=3DON,-DENABLE_TOOLS=3DOFF,popt cp=
pgenerate dbus"
 PACKAGECONFIG[glib] =3D "-DENABLE_GLIB_SUPPORT=3DON,-DENABLE_GLIB_SUPPORT=
=3DOFF,glib-2.0"
 PACKAGECONFIG[uv] =3D "-DENABLE_UV_SUPPORT=3DON,-DENABLE_UV_SUPPORT=3DOFF,=
libuv"
=20
--=20
2.39.5


