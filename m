Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 977DFC3DA4A
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 10:31:19 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.103])
 by mx.groups.io with SMTP id smtpd.web11.4913.1743589870249213268
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Apr 2025 03:31:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=P+ys2HZB;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.159.103, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U46D8jCKaKmCm6N7mmLNg/clao07HGYIJfEpZ9B6sZvrl2Q/tljDpBlwOUeUnY1P6rhbPKaqSEt5RK2ppw+FpN0Fw6cWuShxaVhqlgUIf/8IFciGruGX96QK+RM4+F0qhvtWrdzZUnOHbjLv8IjdkAbT8ZOL2RkNbNHRH0j67lR/iL4B1izds47qgBxl/vMr7s7upEX3Jd1ZRExFA4OqFariMiPNMmYG2BuDeDV8gclvPkUV2k7BpYaJLWx2umNQMGmfnGy2FzoJh/XWaQcYuatRsmHQpQ+bGxkhqn52s/L+vNPqrHgIXBCx9rbQJ0kvYctgdwHR+wTKonU7aZ5mWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BXDvXRgOIgu7DE0O9neAwltCfI+SSalNDESHFX/UEgE=;
 b=Y80XrCg61HJCPu8+SVqHP9hAWLR0U7SUQwQlpodLnWooe5dKSrxBR3WoyWdhZ2+XLVHhW/kWOWAX5kkWLfH9j93Kxo7Z+V9UjmleD042G7FQfGZnxb4ACqvK3Yrn/YBa2X0lMlIE7wLjDRi5NFQWBdvdGVKTV7O+8Fx0+etS9k4mKVbWYiV6Sgnlk3+Tl+SANfw0JCVBL1KU10kKufFbctJw0KxaRzNHEWbt4pe4aK4XhDDSPl7348L125/n2nObpvoNEcDAJxC5S/W0RXt4vuMN/v1Iqr9bGDLS4jGRMyR0lxv9jzII9Hzxkn2Fiqp6LcZWcCLvDU0xPhnoMqqz9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BXDvXRgOIgu7DE0O9neAwltCfI+SSalNDESHFX/UEgE=;
 b=P+ys2HZB3Wzn8rFwsZDd19gE7AIK0XkTyx72VK9mYZIUSGrpkwe5oT8BAmbP8cuaW90qeOEBsjdOPI5lRdmRKnravUgnpn87NsuK3ccVJ09Be8w8Pb/Y+WgUjHlN22Ta9e42gPHf1qiMWQsIL2nJHzQZsLOFEDsSsT5DulQ6UNSSitVDDW3NgStEHrRvl1dz3fMQ7plVlW2n8ca9ShNT9gVu25+coGfDyDpngdRRDQ5voND/nD+ePzYAixNs80b33JEafEM3QR6zhmxjnjh/NVqb2amw+Ma2fKe4lBt5y5h6bcx/PB+XaW8pZZCWUBfJdClksCZWg5T2xdBFQtdxxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from DB9PR06MB8439.eurprd06.prod.outlook.com (2603:10a6:10:371::13)
 by PA2PR06MB9397.eurprd06.prod.outlook.com (2603:10a6:102:402::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 2 Apr
 2025 10:31:06 +0000
Received: from DB9PR06MB8439.eurprd06.prod.outlook.com
 ([fe80::1af3:29c4:e7f6:2522]) by DB9PR06MB8439.eurprd06.prod.outlook.com
 ([fe80::1af3:29c4:e7f6:2522%3]) with mapi id 15.20.8534.043; Wed, 2 Apr 2025
 10:31:06 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][PATCH 1/3] dbus-cxx: Amend dbus build time dependency
Date: Wed,  2 Apr 2025 10:30:45 +0000
Message-ID: <20250402103047.3142275-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GVZP280CA0045.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:26f::16) To DB9PR06MB8439.eurprd06.prod.outlook.com
 (2603:10a6:10:371::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR06MB8439:EE_|PA2PR06MB9397:EE_
X-MS-Office365-Filtering-Correlation-Id: af209398-ddd8-4065-eedb-08dd71d17992
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?RWjnGjUD6E4taSdJy73Yv3hg2+luTiEvH6PzrRvUVWLmBv7Sc3qiJbX//ksp?=
 =?us-ascii?Q?quL3KEd9kVIAls7NMGTUs9RuBjGuX2Kipw9kSu/6+G6kiFeqyHdtlYx5/c3P?=
 =?us-ascii?Q?Mz7hxkmRyDpl6zNCgadpTdmIfItDAV1w3xPn2j2qvNepl2B2EwbJxm/CyEnX?=
 =?us-ascii?Q?/UgRutPldrfsg7K7VJSuCifUJY5EVhtstp8hGJ9HMaI6Y7DkeHnmBP93uUo7?=
 =?us-ascii?Q?P1V1Dw66zkty1RpM6UV2fdxWXD3M0ID6wYZwsM+AQlqHKgjT3rSn5gjpGguW?=
 =?us-ascii?Q?H9rsA2qmgnH+a6fzQw7NqukWruT6ucUbq4jTXYObqctSoEyzLqhhsdoEPXzE?=
 =?us-ascii?Q?e/rbUb8mS5UCQPhHlPw61GuzIJ8aqcfSDnyWhLvkzi/z5D8SKKf4hF7E81bs?=
 =?us-ascii?Q?yOalhU/YUCB6jFB373jaUN6XrbWjfrXM/VrjXWBe98yExVPeeqnBeQ0fndIy?=
 =?us-ascii?Q?+S+7bnpP7r4HYn3OeK//YGKJNml5gJqm/IYF4oLNEl5iZYkSKybBx56pgqWP?=
 =?us-ascii?Q?AvXOFdJTb2aaWUyBlpPJpkJfSI4k12We4/hk1n2gUeoUZoOYYrb3B+2gmqyD?=
 =?us-ascii?Q?2tOdbtEXaTBeoLKvGnSB6q05yN+EYmY5YKNQq/duq4xp7TU9KpSsgDGgNrZV?=
 =?us-ascii?Q?TRvg8MzCt0Ig1rbqwMrCEYKAhwDnY0HfTqR7M/KYGhUdttAHW0Qv3k8IpHR1?=
 =?us-ascii?Q?ac8ML+bgaPfFxCUiT6LH3QAS1nNh1bO3PDR1WWDEA2uMARA0iqm5Nr+KU8ry?=
 =?us-ascii?Q?h8P5Cot+0esXYEXMult5+SHeRev3X9RzOjOh4VXI56PKHkat0iwjgqNnBQ/6?=
 =?us-ascii?Q?opbwkUM0U2KJhoBvxBxRhw+DX2ghI5K00+Ksfgtq/V22AVwrU03KysYg7LAH?=
 =?us-ascii?Q?+0QydEn3Czzc/sOSsUrswlvUPmFYWLIVVuSqT0Ui96Q5zILj2VDdpa5fDS8s?=
 =?us-ascii?Q?X4nT4laZPMAVnFq0REMIyfC/XTH2XUFHQIZr37KgSb+8GwoRx0NVYKxkf27s?=
 =?us-ascii?Q?eYbSj2bkkO4+YEkAa/yk3ns2rX7wF2th7sYUiog5ty/loRK7KmCJoMH1EWKi?=
 =?us-ascii?Q?N05t/r62brk/ySdyiqFWOa5M1Vlnfm84eQOS/eOxU5Q89fSqV0uR68bQSYfL?=
 =?us-ascii?Q?tp1gBt0wmTkUwftElUImMcZfHFsJ873be0s8p6WKl8sQHPKtBbnZfeF+jYvu?=
 =?us-ascii?Q?7cDoHiZ1fK86MlhCXfv4vrvgHb5nLv9Vq+jTMAitmgHLgxasJ4n6WzNKK65E?=
 =?us-ascii?Q?Xmux183FKrg8UAfvFkofKvwwrzQ/7U40+IZ4K/m6lKgrbknZMsVfuyXmTg0Z?=
 =?us-ascii?Q?KwgyhfI2ysbhNyO8i8Ra7V7b6T05KHiSiE4Dr9F6Js5aOxrhXZsFj78xFEU8?=
 =?us-ascii?Q?zpWsJBZAd7gM3k/kBMjA/742rnYoT++IctnLBXESCyzqNut4U70TYwNZiRE8?=
 =?us-ascii?Q?PKh3SrdGkD7snCqoZI2gReli8FwhlNWrLaV8gDwBmZwA8x1tsAh5Kg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR06MB8439.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bp3axrnY8sbq9YvLHukOnx9TEJYj50I5jh2OKv/1+KPEGWM+CVurzVHZFaR6?=
 =?us-ascii?Q?9S/8siWhOBkABxYpIjdZ5iM8p/hOVkNOcsPsms+UIEaP/tdHvaUwINCttnvO?=
 =?us-ascii?Q?DScEqh2tD1+wcFvadf4ouKAWxm06//VdIVkB19Vy0KTugm0Ty5vq6gAT99fg?=
 =?us-ascii?Q?xYFaayWZKxjN8hqnRhU8foXaC+Qz83OJwqw0ANpBDLiwW22+naTKsZwWxcaO?=
 =?us-ascii?Q?WK9VwUN1RD9ezWi+A6pGz0i67nUDK4WmEE94w9J7umodhdQhZ8fC8pRC9rhj?=
 =?us-ascii?Q?kRhD5+HCooTlEW/1j2RpjNJNDn3JC8MpPA7WWMIsMubkxF+mTOAr3wt9uUD8?=
 =?us-ascii?Q?hQRzHjwPY6JNafXCUzjbUCpsZvmHbRa3nwgkHENLLEqNA91fXUAizI2JHh0Y?=
 =?us-ascii?Q?6/Cb0WfxRmyOoYexeL+5FQWqz8NxjQATYGXedoEWQq3nyVqiWPoTWLe4jvco?=
 =?us-ascii?Q?EjG8noCXqALXI1Oec7GHtn57Tlda7et6RCNEtHv0gjQJGMiim0Tr0PIc7SuL?=
 =?us-ascii?Q?8NOPvgtAhMd5Z9YvFCTVzk5ptore723IJt3AOd7/gfPzIvIwg6OGUGQDTmkB?=
 =?us-ascii?Q?94vny1PKZYopBYHWHRH5Pe8gYktAVggFJpyb20sDB6ds288DugLBPJogqgYk?=
 =?us-ascii?Q?GMBqcY6q+7jDZKKkK0sUzGzV5GJzOvvwT9tUjmQdHrucWyHlBVKXH5VALPIo?=
 =?us-ascii?Q?qovTQ0FQlFU/akvftTdUmhQCWKPSs/akWhLFwShip+yV5wmMxxdw9fv0xz+N?=
 =?us-ascii?Q?4HgxL0kBFnqHnpkQFsNHcx71Gh2iUq78iVclfZg131L4ZXOUCMHF6amDAgaT?=
 =?us-ascii?Q?7gNejwZWl10ohS9cZj2gYoPg3bAQ2Imbs5N7QSwbjNGLlzIicTiXm1vVUNi2?=
 =?us-ascii?Q?BwfQEeFpsWwIjwwBqFpUzmKtUeoHbE2fIdWbv+7TVPqd7hE/XmiKmffsa5i9?=
 =?us-ascii?Q?yIKbeoeyYG1R1bRq3O7xb51nKlr72kqyKMSrZJHg9t4dUHlkOcKD4SFJNpN0?=
 =?us-ascii?Q?K+CMy5c1m8Hk1L9Ul4wrueMqYH7Cb1UEapAz0s3DXX2GWYE2XNUTQDos88ro?=
 =?us-ascii?Q?fTH9ii8LPQg+hD7Aij387rl/luOa09PSng+0g2/e7v3g1i3n5IpeZT5/lx4s?=
 =?us-ascii?Q?O3++PzaWe7bgEskEB+meA1i6jqQ9oWKHUOV96hZTY9J0ySkNGLy792Syew2i?=
 =?us-ascii?Q?b7fxJsBqA+KrM8mGdoVJ/k6OYHwp1innXqwjzSdumd8b+5uLYOz4TZBOeyoJ?=
 =?us-ascii?Q?7RsSzJf2u1kxFvuIQk649EwuSz8l/WnRkntYP/7UbjAR19XLvg30OUPzxdEh?=
 =?us-ascii?Q?N26qgLwQd6vUS/VqF2TjMnKzPCOsdwExbbmVDkqBjaP55/JT19FOmFYvGYQy?=
 =?us-ascii?Q?+G0UuBWxGWZTaoywi/ss3DRlWae8/abvCjqB2As0oCe+TRVDindNCXsDwbDa?=
 =?us-ascii?Q?6asLcZHdaoISIy1G60pWW0akW+1IyK1j1BrEI480I6KdUgLcevDcNkGKW3j9?=
 =?us-ascii?Q?LYMggPpN8N+9Qd97mRkPCrVhObJw43xzyN+m7r1DSp2Xx13jioxaFmYGsIAb?=
 =?us-ascii?Q?hYc4MLjW/91y1MRTV9/2p/mr0exP1a/CMsYSdGZQMNKKHNGA9lZP7ZH7FZsg?=
 =?us-ascii?Q?mA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af209398-ddd8-4065-eedb-08dd71d17992
X-MS-Exchange-CrossTenant-AuthSource: DB9PR06MB8439.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 10:31:05.9563
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s8rjNVadrQPVmwLKWE2nP5z59ue/B7+AghdwsMvkGzBXFFA48XVT2/BeNqSeRNm8fUemCEwoomXomxfh0BntJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR06MB9397
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Apr 2025 10:31:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116518

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


