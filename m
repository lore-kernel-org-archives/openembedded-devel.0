Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53D6CC52D7C
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 15:30:15 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.134])
 by mx.groups.io with SMTP id smtpd.web10.22796.1724254209568502688
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Aug 2024 08:30:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=blQTq5UM;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.103.134, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w3id0toUowOrjfZi2MrlaZ5WyaWX/hqgZkEj4KJVafnXQHMB0XxJDAE2mxfAr2u2A7HiUZb2PFkaKpHIPV4yKqvd52pKDGJ+MXuUeirFGcCgGJ+lpcCxhOiOc+4pW5h8qZ9qp7dOi1gAr2LnvXOOGHXz5LQjI6havbrSV6Zt5DiQHWU1NS56UiGNpLy6hx4SCIst17Rjh18CsHAyI7n49ynslu3cg9u+St6qTwiC+cjsTBT3VB08mXvyutnJO75m/KD6+wjU4jrRm+/g5dsY584J/SuPgDFqTgJPClLvT05LcUB1efvz0iMs4pAIfxYhakammC5/LsQUYSJCSG5FMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oxPkIO4cVpw9mO0gNEDzUR1izksDgbzy0aOMKXobGCY=;
 b=f7EE0ueBTWbSP8QJDh2DoL/iPDItF5r6Q1Q1iPxpdXWdpfebBa3xjr0Gw9DwWLNaekOCSX+wi0k6hoBlHBD6qaAW3LdnGMlBaQ0uravOAsy2tYsMGgUNfQ9V0Z2lqXfcHGHJfMQUiUfNYekyWrJuD8+pl0WAZZCqxB9q10I+BBIkgo0XsnmZj6dd/6YssHhGKvA52iyUcPjgjKLcU29V7+pTKSqXCNLNIzgdQJA3rrd0+F3IpTwVN7iyXX2DYk82I3XzYtN3Ui76bImoFmotfC6MZKNoWU0vXi7WZCGDw704l9UO7Wzdq9HExjK9LH4EUPN02bKwfWF5S2kt3aJ4LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oxPkIO4cVpw9mO0gNEDzUR1izksDgbzy0aOMKXobGCY=;
 b=blQTq5UM0Re2uQl+Eo0a9K8g4+vQZuhuyP5Ovv8882nnQZZqc/5Ylb1OcfDnWO/izIMIFcLyxg9tnSypIg9w9eQZuFFEhAHs1j6RnzQNpIQwXZJnrN+L4A44ZhqHrXHjakZX/sfEysi2crD03NQfkG0GxvKE7fshnmk80pLHFPIvfFIOm+dGj46My8OhGFah8GEByjRFat96EK4JBxMc33CDkMDzSRKR9aAT54YvRf57tJUCWxeoj26VV+t9FeJcEAyaMhxNgK3BMo2Pzz7IljV3plMqWtogpDXX5P1RcT2D12RttTL2Ir81kTBT+2rGcO7NZD2l5ESDbzPdAhFkXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by DB9PR06MB8140.eurprd06.prod.outlook.com (2603:10a6:10:296::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 21 Aug
 2024 15:30:09 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7897.014; Wed, 21 Aug 2024
 15:30:09 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][PATCH 2/5] opensc: Add 'readline' PACKAGECONFIG option
Date: Wed, 21 Aug 2024 15:29:43 +0000
Message-ID: <20240821152946.650107-2-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240821152946.650107-1-niko.mauno@vaisala.com>
References: <20240821152946.650107-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GVX0EPF00011B55.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:8:0:19) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|DB9PR06MB8140:EE_
X-MS-Office365-Filtering-Correlation-Id: 4da8b790-3ae9-4acd-e10f-08dcc1f62421
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?AMveKCz7GsNKCZrLXZArQTNzNLeKQHdRnk4zLZR7GecE7nz+bx8j0kwjwwi9?=
 =?us-ascii?Q?Wvx7LNJ0NUmgArjrEjmSa8IHWShMVKKf3Db9AillOgTZonObjlJGrN4UP6ZL?=
 =?us-ascii?Q?/z/jNSXW9In7eHvkLdRYNe1YCzlUw/ff9E1jXt7gRm7i0+9mAuB/h8m3z0rM?=
 =?us-ascii?Q?s7nZ7mF+rJlwL6W7bre4g/HSqdSCTqR/aNQO95oZPqXfkKriIMtaMeARIVO5?=
 =?us-ascii?Q?yzvece+9lpM9QQMWLPLvJqba2VY4+snDtHRrHlXW3zD+UoAcMGXZCEFh/xIE?=
 =?us-ascii?Q?E6LUAofctv4BnG4KWxmJEc9/LOCTIc2nMqMYsF9OZSrj0FGhLsmx5Hfog1ac?=
 =?us-ascii?Q?zwuSvEaGLwXkrhYet5T4155nEimxE26oDV39NVlfn25AE9v6ykjSGsiuJc8/?=
 =?us-ascii?Q?5wwxD6JKGydxS24nY6NRS7F03E4cg5fy49VUf9GHZTVJ+F4yD2hbn49iLLIx?=
 =?us-ascii?Q?SZ/4MqXbRp0zNMz3d+XiEpCCuv82rizEqjVOxAqsO6ihZD46gatts7KV3hva?=
 =?us-ascii?Q?B2hy/iBdo1ha368Lys1oy3cZo7HSR7xTaky/bJC5/hxxkhTCnsNOoHIJe0Nz?=
 =?us-ascii?Q?V44Gp190235RKdZCaFa+rrRVj271zzARcg6LToeytzwYcxOhfx3XE41yetuS?=
 =?us-ascii?Q?zMxy93NRq7XY4rEohbgOGPo+pGVx3pQhQgN1iIAAsg/L6FC0521GEJuLxEiW?=
 =?us-ascii?Q?1KbOxt+JDkEzqqjLJ4IoZ/OdGqsc7OFU67/uVnKLIshL0etD3cv1mmdFYQc6?=
 =?us-ascii?Q?VEXfXGHuqIOyldSZRfaauRNDMMviMaH796/yQjSB/mhwzh0+KQF5tjw8mHtw?=
 =?us-ascii?Q?APfUNcew2tLD1hjdFmfiPg/CWDD0osZ/MBENEygmOXcEc80DKyKvDOH9WJWE?=
 =?us-ascii?Q?Kn8Rey28WGvYLIjVH3/lsOLORcle5VD3quZcN7c2J/hUrvIfOPxwLC9jmHbK?=
 =?us-ascii?Q?2cm9mypzBL8Ps9LgaU7ctwWB+R4spRfvYxMVuxADKszUWZMs86/dqFlFi4rd?=
 =?us-ascii?Q?PvjyNCGuia/oVfgXFvrSCAi6XVwjjzvRprw9XJ8f7oekNBM5DdQQH6l3WqTU?=
 =?us-ascii?Q?OSUiLRcAl7If4AmulLVNb3xCjA9wZL1MZafVO/x2gt8/N+tMCJuqRGYDGlcz?=
 =?us-ascii?Q?wk9ASdmjGmImbMl3yyroHJh5PV+0oZCWWfbrDhhh9jFfwaq9efdwjbh9oz6u?=
 =?us-ascii?Q?5v0ne7+WXKDHAvwqDSERwTJRHjmPNH2ny4dpn96dyyVYyJZ//USBbMJxdZ+n?=
 =?us-ascii?Q?Lv0LPdDI57lZPYlGi2UhOInK8ahHNleb1LfCziXVY6HHlGRH3HQANHtl1kjU?=
 =?us-ascii?Q?naGvnLCfLQilTMG2xQFBZ40XIPSdpOiYc6ahol3WCxPsGrvzbqZE7l4avERh?=
 =?us-ascii?Q?oHSZTEG30QDxkvHTme4jedxvtXiTo7Qhpcm90LDu8ZCLZNM30A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mcqJQBsZ1I/uLwSArFIOG+qbYtE7pQlPv6V299u6yItKRJp8TxXfOnMt95cu?=
 =?us-ascii?Q?da1w6etgUVshI2n15UIUOopT69a5jGBcO52lwKQX4NUN+sbfbC7x5zliqMce?=
 =?us-ascii?Q?T6wLt0GFhftbapEhAABFHhgf+D+2IPnfoGHaxbEjnTMo4+ZlwCgGunD5LVKd?=
 =?us-ascii?Q?k4g2OPZDTNj0TE+I1/EZCwizsnkckNbTeGIZob0mS0uqT7mZ92sYl6wNblbM?=
 =?us-ascii?Q?+U63zFwiv2TkRriojYkdo615J5q3rrkshIgz9gvV3Y9Tna4SIXXs7YWjRBGE?=
 =?us-ascii?Q?hyOqgxdY81LbhA6enTyYC3PdoV+RDWebntJofIv4EI8KeBZl2pvGeT6rXYRs?=
 =?us-ascii?Q?8n/86Mi9brEJ99F+IcEVH7Aawjnx9UPJ5Z/rXrj4Q6X7EhSrrVV9WwAhCVb4?=
 =?us-ascii?Q?DoVZjCcQyAcsymKDgSP2jsVuLri8JvO7FGJ5XaFcbGozALkJcZXazaWnbfxZ?=
 =?us-ascii?Q?iz9OqjHrEjLnjIqVa+NXa3S3cR95yMKfBBrQssY9DUNc3vhu7iFNKPe3uYBF?=
 =?us-ascii?Q?+bvEI6sbHwLa9ke6cMRXYK4ZS4i83u1cxOsr8IiV4IYKbxPaCnMKTmIr5ydH?=
 =?us-ascii?Q?GcjdssT5Gpg3pKI9nLl/BJOWZwy3DMKVX7wGmqWeEsP+VPVFqUOhPlGqXmda?=
 =?us-ascii?Q?5FXyjpktKc1eHCREMZgz+UTzIMQjbBI3GzfAIwUEG7NOO2w1R34dOU6NVu0f?=
 =?us-ascii?Q?KqQ9/bo73Sc7bhY97++oKIpJk+ZoUv8FVbzbX92zs0HkjVcB/AhaP/Ibpf5Q?=
 =?us-ascii?Q?np9plr+FHwDv/Z4G8p8D9DkSTcu9WEMJJSza8WiEzVeIMAXIhj3w0DA1OJOw?=
 =?us-ascii?Q?TAWMDa8lmUK5j02jWG99Altqx2RbpMcH/LXP0tHC6my22GJN4AMx3XNUQd0E?=
 =?us-ascii?Q?h4PYW/AQcoj+iFWqxe+mm2Jqw23sp2sJV6NTwiqObXz4+FzNfjK27u2d8GDf?=
 =?us-ascii?Q?dh5nHRE/vGbfcDodmlBqK+CQA9NriElfLz6frfahygHu4qMTQ6elKr6UDOTh?=
 =?us-ascii?Q?CkeN3S+DGbLTccFfcJz0sAMV8lgsB7zxhrhKCs1Hvtj0GTEqPDNxH9eOb314?=
 =?us-ascii?Q?bzzNLO6xwxYrRAsaNoeUmRttlhPuyN19auVIGdkbymB+tZQ7IWB/5Pfyrxbu?=
 =?us-ascii?Q?y3J5mcM5oeME/gIXqtDS5gk5+5cWGkt9IQ4AiEpUqZ93n4X1JdEXFlLwMwDG?=
 =?us-ascii?Q?JaBhp110ZExV9hKMD9s887EyNHLAM0HHsTneI1NoM3uH3JLt/IjErWJrPxk2?=
 =?us-ascii?Q?a9VaRSyiGvNPIyL+vRsUorUgbSrjfz9wuhATtivRyXH8O7k2hSSQk4geNWAA?=
 =?us-ascii?Q?IX/FgxcjucNAplnEUo5kC6WNtpwA7QmWNRc/UV43kuknVMFh1/ilN7o0R363?=
 =?us-ascii?Q?ZU0tqx/UFb5IYeT2dUbgPTryEj7UbBLSnIGwvM17yPqWZxbiwLfMc5vO5Q9H?=
 =?us-ascii?Q?3nM7M1LP+TnRZsCuyuX+h+mSr7Ai5zKnRL6sEvF+SlD5+cpHUFJPXQsbffM3?=
 =?us-ascii?Q?yAyMHTMUiTTBhSTvlAEhZnjtJ220Ffq3DOHRXl82t8m3kSMz8di7xUEsylaX?=
 =?us-ascii?Q?cr9k/C367Oba3CBTNsw+4UuhZFnsjxqnd/xVv5HMtX6D3RjXLwyiyckDygx9?=
 =?us-ascii?Q?AA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4da8b790-3ae9-4acd-e10f-08dcc1f62421
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 15:30:09.3390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kyTTMzd0MNhtdV5gNogMPK0r1fqxZhKyYtnv/zGgSPsSNcVzs0mcoi46er/Z9wSXJwuuXD0R/MFJOWA9CYa07Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB8140
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Aug 2024 15:30:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111886

This helps us to also get rid of associated RDEPENDS declaration which
implicitly pulled readline to rootfs, even configure resolved readline
as not enabled.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-oe/recipes-support/opensc/opensc_0.25.1.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/opensc/opensc_0.25.1.bb b/meta-oe/reci=
pes-support/opensc/opensc_0.25.1.bb
index 145bbfe25..17dc62e19 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.25.1.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.25.1.bb
@@ -31,8 +31,7 @@ PACKAGECONFIG ??=3D "pcsc"
=20
 PACKAGECONFIG[openct] =3D "--enable-openct,--disable-openct,openct"
 PACKAGECONFIG[pcsc] =3D "--enable-pcsc,--disable-pcsc,pcsc-lite,pcsc-lite =
pcsc-lite-lib"
-
-RDEPENDS:${PN} =3D "readline"
+PACKAGECONFIG[readline] =3D "--enable-readline,--disable-readline,readline=
"
=20
 FILES:${PN} +=3D "\
     ${libdir}/opensc-pkcs11.so \
--=20
2.39.2


