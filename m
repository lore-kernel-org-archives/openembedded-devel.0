Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95A3CECE57D
	for <webhook@archiver.kernel.org>; Sun,  8 Sep 2024 15:34:46 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.121])
 by mx.groups.io with SMTP id smtpd.web10.32313.1725809679183516956
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Sep 2024 08:34:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=2kpHIeDx;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.22.121, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c5362msKcwuO0WfYa74SRQ91Zch6j7TKu8IC4b+BOrDttOOG8slU0atYYLMeZ74tga5tuoe0woSVfrmMwOHctmixZYSigg3y5ePpmNbICRhZ3vVC1c1jkxeiGXr+kOzw77qMHfVG5x8VT+zr6RHI98Stk5DJ3uBScBpYr+aNMn2JFUf70nF1DsaEOshmbqonaXKY+yU4ha+DCbJlPa7uz3LNWZqL8JSV811QFzhkNq1OL2+6vLRQps+QbGLd6Asf5QNMfQl21gfwvM46LPMg/CZ2UwoxrJikn0NC2al7uZIE76xxVVJ0sT7DBAhR8iLQ+ihkbSeW+5iwiJaWLVGQew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JFibZCy6dfGsmgHA5xYUNrE2mdxY8hacHql4vF3GPTo=;
 b=nSFGFmVWpgDg78mrb8J7NKP5Flp1T3P+rHkUh+21Z2EMu2PxQaIBSz7i+Lo3vLXvlrkzYWOYPcNaT9B5c57rmnTS3MCmdf0pJGv7ypL8q/bdqy6ku7L/vWlJ6DrDcz1urYC7LbdToaBo5Nsz2KUiGb9HAKTTSLRP/vfLyd5C5u8Y7e0s3z8gif2Wj/Z0lKGMaB4sX4El5O+f7B6oOg1Za8EH6Z1e9AlRQ7FNtadpaHe1q9vyBc7J8tsbfLHbb5m/2h3npL6BA36G2LvrJjn3ai9qAyCKmEk0VoW6VssWpsRQoHR5qPEepqKt254luTTsRIEc920/4Sle3941hY+/LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JFibZCy6dfGsmgHA5xYUNrE2mdxY8hacHql4vF3GPTo=;
 b=2kpHIeDx7iOTiS06Y5DaA6PEv2Z8IgiQ3SR9fgC9AQWH9SHp4Xv6JprYtwuVVKm91rWik3ptc859E+5knRX2S2PUwXZ7H1ovrXsZ8lwoDFddPE5+inXh0NxeVPcHUwg3fO6TvzBg2bQoaNJRRggqhviSn38+p8e9MHH4105BO6PXssp+jL8NcNtMBWBazMLDeVgrq/9rbZz4ASjd0BHOoRphdvexI2019iaAT86VDr0tri98Sj1SiEQVPxlOXn/wXZET8RNJHHIqK11DL8zal8/RKhuqRoYRO3Sxy06cgyRlQWA4tMnES+S+WsgP8Na1/UVgSJzHO1yuFP6JMb5YqQ==
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
Subject: [meta-python][scarthgap][PATCHv4 15/19]  python3-googleapis-common-protos: Fix LIC_FILES_CHKSUM
Date: Sun,  8 Sep 2024 15:34:04 +0000
Message-ID: <20240908153408.4114753-15-niko.mauno@vaisala.com>
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
X-MS-Office365-Filtering-Correlation-Id: fa565788-1910-46f8-6c18-08dcd01bbe84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Y6ZCKOaxhDKqmPbXlrCiiGc3GOu0vxWGP/Mdnp71higQXgJcwcK/A9lvbkqM?=
 =?us-ascii?Q?4EjMmO8jgAAbYUqoYHzO+y8Tw1pK87X7DKoaDKdXzEf7zAvQrMuf6rMp6W9l?=
 =?us-ascii?Q?FXVdKwiN04z1emSugmsAQVAK1r/hxZjY6Uq8JvEx8cV74TkiEg0dtjSx9q5h?=
 =?us-ascii?Q?3wPRXPTwm/qCDPCmtPJtLNveKAjCm03KiNvaXfHCw8bQ4utzi+C5rhkN9LJe?=
 =?us-ascii?Q?cvlLMkeMMWhjdRzydhN6gHWPbdE+i4uLdZgGkFOcUyWiBzlnDCEWiLJQ4lA9?=
 =?us-ascii?Q?dtn35q1CBAJTGD0Sbdpr4N1tBn5zj1DNhDrJgKylUarAYhSC5MnQI+9+0vyF?=
 =?us-ascii?Q?z8P7z5/cRa7VmFMWBpkFTAt8p0yUDbHvFLU2vaP01ePVZtqgoqSFXcjZtBvW?=
 =?us-ascii?Q?Ts7QHIp5Jfk4Lgjl6LOSCYDacNCa+frwwzyrhi9UtP6Q9H7kfmubSC9gDWsC?=
 =?us-ascii?Q?wwAd26Pule6UJ8ArzCXFc3iRQhkiicAC83sVAS9KcHjMHvst+g3OTfToCylp?=
 =?us-ascii?Q?pZyW30LP0VHHiw+X/JIbN1DIVFKDSXdhz3LlsqjnXNt7FvxvhqUQVDbdtBJk?=
 =?us-ascii?Q?i0Ay92fpbhAa4yd6GWW4iTt6wEf2M4uUN5yhssMAo3mtozbyr9lyq4C5mViP?=
 =?us-ascii?Q?gQvb6ZsPhmfFgFuJ+prqQKWNAjDJhR31cFuZpu5QO8aAzxifxtMP/XbpC3tW?=
 =?us-ascii?Q?ZLdVhIB1OV/bQm8D2JCBMEReDZLFlER3SNE4CEC1sAoRxEBURSyEVfC0kuR2?=
 =?us-ascii?Q?Bm5GzeBhEzCv6gwcu4rMIQr3pR8fYFh0eFmWSeOpgiZ0lbFci8ra5V7z/6on?=
 =?us-ascii?Q?61PnSLDBqgJQys+YkaJZCgUPY/gAniPoa7tLBoNVr9kMnPbex8ISDNHTklKy?=
 =?us-ascii?Q?aUpIqnonSvI1cM9/tX5JMB7HNeEdQgx5y0WeYxUyF3Qzxj31awjpEKpxgcB7?=
 =?us-ascii?Q?4ifF4z60Dwm0KbEYvbg40Lwkqin9H73RN2AIEOXWi4O48NutATRq4ENuQoUn?=
 =?us-ascii?Q?dvLqpYIq5xhNGpj+ZudkcSBWygv6QqOVb8W3ChtkO7xFL28r1KlMK/zkc/ml?=
 =?us-ascii?Q?nDKQ28s+DezaMHYSRQ+9B7lf7R/TCa95/HlJrio3A5d2aumXvPyxJOKLY04a?=
 =?us-ascii?Q?UnFl/wOW/p9AacKNSMqX0XESjdnHqvZUwuifID6O5Jl3zuUv7oNmyEb01Rsq?=
 =?us-ascii?Q?hxpNCKdBQDmMuxUlI3nAOeURVC9gqyb6TKPxO1isf/h4zXwrLxXc90ki5j8+?=
 =?us-ascii?Q?1JFhm7tc/1yxmh8VrJdh83239mgM82SemAN7l2w/ZjRA9qIgE9g4lB28GrrY?=
 =?us-ascii?Q?22np8ryChxwbU+zEoUOA51qx22j+rDgacqtTlwJDBUHDS2buGqEUbByj16eZ?=
 =?us-ascii?Q?2tOrT2LIDCFahmRH/oqFNM6Z41nmAa3Yn2VALO6OyPu6hAYb/w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DaQST9mlr8iaJsx1uDvizlbebTkG0aAs316lSQi6mjF+2/4sWsLZ9nIXWSbz?=
 =?us-ascii?Q?b9nShTmRijm7+fwiGErPXDgimgGIEYb1oDa+GG63f+vQbXtGHkqGTcnUogwS?=
 =?us-ascii?Q?FwI7OGOjY0UQmYy/Xx4hvekGjhQdANq41F23lHDA17BkIsSesq9rgNvCGskV?=
 =?us-ascii?Q?swMgrWtWAedtcPyp0nTZ46xJWiqR9EdozMVgoIDoU7O4BLh4pF1lRRAT93D5?=
 =?us-ascii?Q?fUEGji0vPNatdKyZxgawLYMX9005jeVcO2whwSagzPYFwO9p1OI5dnQW1Lj+?=
 =?us-ascii?Q?3tcAk1K5TKDh55sBrAgvw/Mo57E8eH3Cn9qGpJLKSwPnURFHX0/x6sdn+GpN?=
 =?us-ascii?Q?4e78sB5BdHdxBeJBe66GsoskE0J3Yv9k5FvltcZEH7B1wlq7HGd7t8PpGfLG?=
 =?us-ascii?Q?W68/X1U7T/XEeMrSNaN/dzYzL7AOLf108RPjCxk4QJQ+dlb+oAfhlKSXV0Rw?=
 =?us-ascii?Q?KRqSdxFKUGFHvO42EsPFRNeSCDajVmTOcCSTgZyyNMRgPW8DJVtzezPbSEdS?=
 =?us-ascii?Q?ZskaJp2jFYZ7z9fZPiZ7HsmnFqY/xmYUsmokuGYBjLYrx3QbN790yaM2q5Us?=
 =?us-ascii?Q?NVSSYZLNHy/nmAfqe9lFY0SHg44ykrd50tJCKSGNhYykVryXFtWFkCC700Ym?=
 =?us-ascii?Q?XA3vMSMDN81u9xpdJpJ1slNnO7mAFZoegJbHqYOHgMpyNf6hFhA1xv9gcviw?=
 =?us-ascii?Q?Qdc/QRZUvrXirRbFD4I8JbG75RvRcglnDZgQ2LqauruGxA8myL4u/mHutf+V?=
 =?us-ascii?Q?kTi1OVoOb+nFmk8nUKOL78ky966ay7UoCBCpLTqt3OsS8rIanuBFb0kSPk+f?=
 =?us-ascii?Q?WcZtM1TKdEkJEgjqHDqpx++brjxwrawXNTTwh/jOpaeqLnPwULQOBpzHhNey?=
 =?us-ascii?Q?tZqNFGEy+HgVkXDZfvzLKQQuW7DfzzY4ESiyFK2Q/8nKNbalL3FkZanBBgWG?=
 =?us-ascii?Q?cbH+LzsA/lS0fsnTXgTKOKUYly+8BU+sjMMFlFcJQQXC9DM+touuZT27XNIf?=
 =?us-ascii?Q?3G0eI0xn3Sejp7bTaoMCiwT1R+Y2V76movAhr715wmlaSYoSMpAiWEnZb1H1?=
 =?us-ascii?Q?HmRVzwEPx9UCaAofqVAWE3wDuvNEu3208v0EhLPE5lO2fNtyq42Sl6jMrkLI?=
 =?us-ascii?Q?h15LHTHLGgk2zOje6A+DaJRyez6cH1FXgiZimcHqs3v73HYD1Z943GnV+k5k?=
 =?us-ascii?Q?0XxbRCUtSOVikBpUh8Vi6pXMj7v/SwBglvtvVwAKFC0j3v+Hl2AQkDjn+B2t?=
 =?us-ascii?Q?z6/62iSSHz2rlBc3yvKUHYkvIguxHfVp3bZB1xJ31ICC2F24cQqet6yBnMtc?=
 =?us-ascii?Q?bVtwOYOOC2AAiZLUh7TVjAjE1q9LSkvHlGel3OwgTJxZRPKs5sIibRI9uR0p?=
 =?us-ascii?Q?W4igQTesTv7fa7RSm1X9qe5L1wd9xUQFXzeZAnXXmahRaFPxtYoKBKt1D5zQ?=
 =?us-ascii?Q?vDsMXA6p5t5PPXDMLbXZYwDymopqhw9VcMIf8EAsD6iyFH5t8ZdNWN/Qjcnw?=
 =?us-ascii?Q?hMuVVDwny12b5R+4OyTjoA+rO2WnC3p36jjLLhPGPBRHPu4ucl4w6lgQ8y98?=
 =?us-ascii?Q?8w69KT7xhJ2akS+Hacs+IKMBrnvHroXoe2AWv7vbkkHIJa+8GRfHOFF9szYy?=
 =?us-ascii?Q?Ew=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa565788-1910-46f8-6c18-08dcd01bbe84
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2024 15:34:36.0288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VSmTc14lGPEuxLRMK2X2EYGC+Wd7WL8RCjAz+H0ZeVjoy2VT0IvjYqGa4nALjqeFgvkDo740oNemV+6ConikmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB7472
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Sep 2024 15:34:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112155

Change the reference to the Apache-2.0 license containing LICENSE file
in the downloaded archive.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-googleapis-common-protos_1.63.0.bb           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-googleapis-common-=
protos_1.63.0.bb b/meta-python/recipes-devtools/python/python3-googleapis-c=
ommon-protos_1.63.0.bb
index aee233726..3c5529449 100644
--- a/meta-python/recipes-devtools/python/python3-googleapis-common-protos_=
1.63.0.bb
+++ b/meta-python/recipes-devtools/python/python3-googleapis-common-protos_=
1.63.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION =3D "Common protobufs used in Google APIs"
 HOMEPAGE =3D "https://github.com/googleapis/python-api-common-protos"
 LICENSE =3D "Apache-2.0"
-LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=3D89aea4=
e17d99a7cacdbeed46a0096b10"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd5=
7"
=20
 inherit pypi setuptools3
=20
--=20
2.39.2


