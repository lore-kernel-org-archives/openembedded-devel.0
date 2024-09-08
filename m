Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D82CDECE577
	for <webhook@archiver.kernel.org>; Sun,  8 Sep 2024 17:12:37 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.123])
 by mx.groups.io with SMTP id smtpd.web11.34076.1725815542816309636
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Sep 2024 10:12:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=XpKrG775;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.21.123, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gm2oMMRpaAVdrYneITRsCHGai4EJBnAvOWsVdOXAX5WrZAw2o3K6++FV+gHPPBBgi3zUmit1rbymBa+wirF7mOg0WBmK8ejYChFDmMl84LgY3rSt9APB4rrJZijlgLZuyRMA1raii98C7M58And2Cez5ay0fkh7vyYVecHal2isNBJHTpWBp7mN1CQUB/4J5uuVxSKfiODxxzM1SiT+DS26qCNXiLI6PhrsZAbYejmFZbtBZti4JfJ8U3W7niup/9NqjrP7pQ5NJpo5m9h2yxgUvX7XZTffMziB9Mmr+Y36nIK02tr7jVeY3Io8h1LVUB0OiERcx+w7EfLyrxz8rdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bygCqRcqUgboRgX4n+18w3yhyboDLnYwjT5K/QfxSzo=;
 b=jBKurO4YsXpyoH9rKdIn1VEF9RZ4S2Sp+uBsg2S4DJUAUzbi6HxQZ6wqsawribT1KHWmS/B72UalLCV/bnb0FzzQO/df+bX27mlBQHvEg232pKKOBH5t0UfYYYhGeUciqxYzOedcDEtGkUR/NhOH+DvH+adnFwbzhNdnEgi6EtgKnB0InxBcIUlW1DfbCWYvpJ+Xi6HsC15eDGavLbAlSZfMOBrEN4S6UB2c0rn+MT6FFnwZBOlFB230BhcKgJT8PyUjH0oZ1kvDBwQ7dFmvhnqiSK5bVgvc7MvaQw7tqRxQ4aLMVHW+YW89n37vZ0FPXfFyZQB7SX4zWle62Po1kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bygCqRcqUgboRgX4n+18w3yhyboDLnYwjT5K/QfxSzo=;
 b=XpKrG775WHC4yXJbAXGrH+GGTGZuIGwO8qqdoHFv+sEJH+rRbKj1TpIQ4jUXKTqrgMrprtB3+BpPWQxX7jtZpHRi3CaMUYPMZoAVvVx9AOtP5fO/X6/eX7cRn9Lp8bdd/d/Huc124cHR071g8eizxn74RS319rTjDr3KHb7eMY8cqpM6P8DfdPlpv1idLShRtfoeZnI3dpV5vvuILr8i0ftOfdexApZ4GAYu1kBIMzdseL70RAl6gXWDWZMj3YqYbGTPDi2DxhECqyBRmBSeQUaNEcS6CUN1fmtvgiHhhv7e6fasy1suLKObfFtcepIjfkOn7vafyCX/BBdy+jhnAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by GVXPR06MB9098.eurprd06.prod.outlook.com (2603:10a6:150:1b1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23; Sun, 8 Sep
 2024 17:12:23 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%4]) with mapi id 15.20.7939.022; Sun, 8 Sep 2024
 17:12:23 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: akuster808@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][kirkstone][PATCH 12/13] python3-haversine: Fix LIC_FILES_CHKSUM
Date: Sun,  8 Sep 2024 17:11:40 +0000
Message-ID: <20240908171141.99382-12-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240908171141.99382-1-niko.mauno@vaisala.com>
References: <20240908171141.99382-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF00002BA4.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:6:0:1b) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|GVXPR06MB9098:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f2d7d4d-3902-424f-fa7f-08dcd0296747
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?hZxn6xIYOCLW8/ZGtDimFUdx2QuwiWQsPqv3KzX2WJ3zw5TFrGhkTgjpSm7x?=
 =?us-ascii?Q?PoM7S0fY9bs7KuyTTv+U/59You4VRTZk+hvctJQt++pdXSfpifZ3RPekj5+K?=
 =?us-ascii?Q?h69HA3G+e7ON+DjmZucI8DvlcowOUYVDz2PBysUUyuk3XgAD/bGhtEABDZ6c?=
 =?us-ascii?Q?S6ob9y50E8hXjtCFBg2XDjpLzI4zrpCnEuNo+8A5mjlxMsrfddY3EgYSInuR?=
 =?us-ascii?Q?NoUu3KBz6xn3zdIt26Xobg4srPsRX5Qm5ZQlbUOFlzI1cfTv5QYfYVVjy1J+?=
 =?us-ascii?Q?V0MJDGS/rEkrCd1hpC8l/hdcEB+RLYYB83CghXi8lDK/O8OmKwB60VrRMcoz?=
 =?us-ascii?Q?7aLSfS8mDM8Aswqesv5x42mF2AtYFkiSQTVEo+dSzA6OGWSD5T9K03MFsZSg?=
 =?us-ascii?Q?ZvhJwnfhPnOkCz7y7dlUNMI5XERpfU/X8nqtb9g6RCUgG+WpJzWP0KB85rWh?=
 =?us-ascii?Q?AXi/1lXCH5vHodUAaCO8CJGG0nQCi7pP9+cXZGZlFl6FNCssEXl8RFt/SebT?=
 =?us-ascii?Q?ohU/1bejsFx3pbplAko+LgoAjimi79/jzfMXPOCISYuFNWYRqmDWvHxjmKEq?=
 =?us-ascii?Q?8BUsndif0+vXOMI/0v5SKMzeaZyT1555pYh1EKNP4Ba8oNHVvqyCE/x1k2EJ?=
 =?us-ascii?Q?1h3eCE6QWY5jV8h7nRlM7onLSTFe4ub/mumuTCMa+Nfc7Nq39stqWF4SZPD4?=
 =?us-ascii?Q?E2iuyGmA260sNtO/Lf0tigaQFSrHDAmTN9wYs5czDr2Bk906R2g7Jl6eKVJX?=
 =?us-ascii?Q?bA6eXvHP3hOJYuWEbJzLkAlC5jQMWV9jKR7f9L/y+jpaoFnoNaw4aev3axsF?=
 =?us-ascii?Q?u2FBnS/sFx4pZcC2BzfLIGZpV0wjJ0uaW56RLmGmEbqo8zOQEFTvbFk+gPAe?=
 =?us-ascii?Q?zY7NUtewSx5XhWYpxNp5dxOM+MHn2p4nk01KWHsWGNWfQ190LhPLum5psVFT?=
 =?us-ascii?Q?9xGMr32bIU2aB7gNU2RGhlMCM6/3x7W993af/xq5jO94K/T9QAlWg1jmnuP2?=
 =?us-ascii?Q?MfHUhIDolvrcymT2piBzQJf8QYttLxm6j6uodDMFAMHLv8NboOh5du5MNPQT?=
 =?us-ascii?Q?LHyZPUjSb2WMNQf8OMua2qQhDQ4jPzBCUURgGddToTJl1BzenXlDY1tXG574?=
 =?us-ascii?Q?/QHSgBOjqP0eCpmxcVOf+SOgyd0at6p/WpiO0X1MLV2RMTFA7739rD2umCYS?=
 =?us-ascii?Q?NwRiOl/A0PzI3YY/SeFyBobQypTLQT4TYPk9rydJzYEnXQh1QPgfhIepy59Q?=
 =?us-ascii?Q?l/LercVsaaK7+x53Wo/P8LRbzfY1vsNfWJLCXB253rmCH1Wm1uFug5n0GnZ+?=
 =?us-ascii?Q?tv1TkNNCZmyZmaDTHu/H/LtOdDtalZlMtyJvTBEXN1r48aRgGplVLw7HHotN?=
 =?us-ascii?Q?vvFvZvRdIH0Cv1C5IDPVptGoiKj6T4pVkYmuWgrruEcfkJsGnw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NUsKd8nWl5Ekdt8NuAifEXV3reqkQrAuGOVNmdgvleeyr5mg1uhEie4Iw2jt?=
 =?us-ascii?Q?UoSS7iS3tUtXgn83IFtpA+RoS9yoHJ1LQW+ZTMMcZLV/8mH9P53po/aMBfJ7?=
 =?us-ascii?Q?SiJqG+ie5j0KqsvEJakRBIdMDDf8N7HivMIA7opUeYyQQsj7QBGes9AGNzp9?=
 =?us-ascii?Q?wUXay4vmSVubAft0ODasbd+pF+kK3tHdjKJveXIzM4OgTzZMkLcCOtsk3Tnw?=
 =?us-ascii?Q?1ITGNGwwWXiZVZ/jDNqsSwcNX2HJbomCrSX4AO5nsIj5LK4yp0NgebgEslDk?=
 =?us-ascii?Q?e5LFKIwrGoDBLNQdUJAloVLfSc8hvJKkUwHeE9BEpVAy/9XN6/corJJXGWIc?=
 =?us-ascii?Q?JS7GYfKqbc9os7wHwLWKRBvltqd/FK1L9cZWMwko/eLZtnbcj/be6wGujKOZ?=
 =?us-ascii?Q?EUdOHN8Sg5++gCy4lJ6+EsGfoRYzz0jPC0fiuSUyR9kl2+txMFjS5vxYp4cF?=
 =?us-ascii?Q?XzZ5nmNjgUwKXxVBPerdW7vr7B/cGsAWr0vhWhJlNlrFqaiRtHrF3N3y0y8J?=
 =?us-ascii?Q?48hzxWuoeQTzu0eE1MYkqSjbLA6jVLz9I2HCs2aQ3YEL9NL9Wu+LvigQh91l?=
 =?us-ascii?Q?UvzLmKgzFFyrrU60jhGgIvZalg33vOrX/EymnoHvNJrJMytx6VhVPniTOHDj?=
 =?us-ascii?Q?ivH4awLNkR0z+xVF3/GCtxj+80prD1kDBv7qgTl1pIJAiDoEbOKOzWY1/dsO?=
 =?us-ascii?Q?ykc4wkttbB5wKb9TnctrsLJRC/y9XNiKmeAoa77i72bPOh3DxLePY7R6fCuo?=
 =?us-ascii?Q?l8Y2/di9qF33AjHmG9cd4cJfQj0scD5Z1IxhnAQBzq1teoQB1uFQR8vZLKcx?=
 =?us-ascii?Q?w62bEJ/ZuMMaR9DE3Ae2sP8uDoIrPM5Agk1vNRD87/40+/yvpqw/fBbgB3QY?=
 =?us-ascii?Q?D/qFeFQFA1uuoHGmPciqFeQ7LPLRD/T8bgA2MY0Tm0ckZvKSuB97mobjI6qi?=
 =?us-ascii?Q?7aK+HH9Yo2fzrh4HT7Niwo+tnCcJvzlMxGGHsoiwy791maV0JqdZDWNkI8VQ?=
 =?us-ascii?Q?qGxhoSCgkYSTyidQXkCZZatzkW9Y7J88LgbbH8/VEXYmMdDDrCQihHMzRl18?=
 =?us-ascii?Q?uJ3mDY8CV38bRQjcIiTOZ6ySgdPq9azl5kISLmhxjSZ0uxlnomeQs0GsEXMe?=
 =?us-ascii?Q?rHh0wrCloT3g9kfah7ZCxewoG9vFYx3EHIJLY8nPZ5pxpMQFOFOQZ5g2ZBFO?=
 =?us-ascii?Q?4VzVTKeC6S9WQWVfR9fftr+5mOJIKes9tPLSwj8dwfnZr326+Z/L+Ddx5ihO?=
 =?us-ascii?Q?q6HDvYCAdddEcemTGhRdF0rdId6IlA6n+7A4AA4pAF3I05Mye/5JpwreLzI/?=
 =?us-ascii?Q?i0PHv6vP3hfYVHU55zggk+m0WpkOj/9E5OBsghNZlBut55398giOwBFOIJBW?=
 =?us-ascii?Q?dJmVQr2vcHMdD0nlQtY5W2yQcS3GX2ohod7BbzBHPmRc6QboQXnmp/xkKXH/?=
 =?us-ascii?Q?Gmi/2Is6JNed2XeghiNfqUvinKNzP+1y0XwhMteI7kQXIh2jbwiLQS1P0Il2?=
 =?us-ascii?Q?NZHDlOEIZM7SdgKUpEWKSEY+xTttoz8ErqTvxzI66tSTIEQRi/YR06xcmDH1?=
 =?us-ascii?Q?vB0q3bcOVJhjhGzWzCZiUuvADxUxFUD6jZXQvIKttUpw0sPCTRXfkhivbACh?=
 =?us-ascii?Q?PQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f2d7d4d-3902-424f-fa7f-08dcd0296747
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2024 17:12:22.6135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZbqfzmFC5KgBmeu3pgvlbwpsaVxdQ85BjP4DcR3h2aocxLEef+7Q/7LVoOO4GZ1+vBLm3cpWkhdxmgUKcYZeQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR06MB9098
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Sep 2024 17:12:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112173

Change the reference to the MIT license containing LICENSE file in the
downloaded archive.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-haversine_2.5.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-haversine_2.5.1.bb=
 b/meta-python/recipes-devtools/python/python3-haversine_2.5.1.bb
index 1ed67d326..452f8774a 100644
--- a/meta-python/recipes-devtools/python/python3-haversine_2.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-haversine_2.5.1.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "Calculate the distance between 2 points on Earth"
 LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0b=
cf8506ecda2f7b4f302"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D20a52d2c688975e989fcbee3e6c8d1a=
1"
=20
 SRC_URI[sha256sum] =3D "357e41dfddc4a0f2b1c941d92a590cac840f7ce4b3da14b45b=
68d968b3ad7cc7"
=20
--=20
2.39.2


