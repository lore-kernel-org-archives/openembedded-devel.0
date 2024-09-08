Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8030ECE57F
	for <webhook@archiver.kernel.org>; Sun,  8 Sep 2024 17:12:27 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.98])
 by mx.groups.io with SMTP id smtpd.web10.34230.1725815545368516852
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Sep 2024 10:12:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=3LhmrKL5;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.22.98, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pCSSiE9JSE6ECKqC9T8aMNmWMSxtuEyw3bKYmSnIKyIBbnipW7vWL8PDDV3kWjsOUlgE9Oc7IMecBpBDSmHQEbocb2amOyAX9mlgk3Yum/HAEMD/O8wYraT68BG3j2zz1M1J3qA6Fc2jiQeEPZ+nhn/9t9XoSLzm/g8dtIeFMIUY1EFK/cjw1dQHdIIUigD+M2BFpxrlOxa5gnjTDh6d1Lqdj172mf0bQy2vtICrf5ZJaWiYO1BBCiA9EIHPgu8cuvybcz2KTOGoq9oTlnv4XK49UkEtSL3mpigC/Wn/6f4RvXk15sUJXVtNUzT+9kLVlbXE5SiCoJ3mv4QOnC9HDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YMujYM5RgXb0ot15hpDiwTjDUxUVZaSF1F0gmG7szu0=;
 b=Uy6LhGHiKKKzetBwFcdUzoTaFxPN8J5hlnlXtLx814D0r767AXSM7V351tnR+71m4eVUktktp+9viCG8bTFQDJIKnM75wVYVBRuBxx/H8xZ9lvdpXwXFSwlJOCiGVYWIxJp0+iVokwhTtYvPavUBay/v4KzVsC3E/sOlAzknMEZ6YjYBhkwMuj11KJnCRQFOKroYLA9PgJfC5gLIhm9CxZCUKw1JGZi6LJ88fcUVhkJn7hMpkIFHvZJfDupDHFId4hNN2E3k800F0g8lkO9dPMqyy51gmieMLfEgIs5/ZFH1gSURR0B4jvpERVjAm3xx6FMi1odMgLi/u2mKjnU+uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YMujYM5RgXb0ot15hpDiwTjDUxUVZaSF1F0gmG7szu0=;
 b=3LhmrKL5YdtsG5rMpKy3/pBn3qdIXyziY1l/BAK3AZm/oIuRzE+hG7cynQC8EzTQBdBOHLvClRIdqtazBuKqnBa4YKYV2Uv3/dJ9BnRZpWTOZKOw1Fh58YO3cPkHhzL2sJiaWhaviMgHWLLZiqstsBUvBa+DAdAn0/Y+PqHjp8AW3Tq+k46pLkVlDTh/0eDaAwWlN92gAewp/PV8vJbCTSpurq6m78mGjgP0SNJVNlXiYr3wJaQrVhynI7FjYd86NfN1bKKexjvDNNwDlTalc8pFcEgnCV26pzYWZaLYIuWrk3Gw0720ez5vPegDxqa6wOfkjA5HCALq9tykrvftew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by GVXPR06MB9098.eurprd06.prod.outlook.com (2603:10a6:150:1b1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23; Sun, 8 Sep
 2024 17:12:19 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%4]) with mapi id 15.20.7939.022; Sun, 8 Sep 2024
 17:12:19 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: akuster808@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][kirkstone][PATCH 03/13] python3-cbor2: Fix LICENSE and LIC_FILES_CHKSUM
Date: Sun,  8 Sep 2024 17:11:31 +0000
Message-ID: <20240908171141.99382-3-niko.mauno@vaisala.com>
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
X-MS-Office365-Filtering-Correlation-Id: 181819ab-3283-43fc-61ce-08dcd0296502
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?eEfLOZsb0GxgAatZObSKcVGJ0gmPSSfwAWvk2VbbEz7ePiEeYPdowZ/NcAmU?=
 =?us-ascii?Q?Qf2S8D+LmP46HB0JqN1CXa33ohwQbGq5S+nVlte+00TXA2y/Jp/mR+LlWcv/?=
 =?us-ascii?Q?/5gC1ZuY9l9bYHYkTDfnAg1wzGpGyRzw+NDu/ik7a9nCwCcOSJS2P5nk0By/?=
 =?us-ascii?Q?OY3wr4n5HFzEs0cDdNKcg40rWErdI7M20439xScMtSYwMMeyKJN3jhfXN2Ru?=
 =?us-ascii?Q?3gnHonn0hd9e3eUXEKaSFZNw+F/5tiblE2gUdcdq3aJcTzWb6K21LNeoIFuE?=
 =?us-ascii?Q?BoQh7yESjVmMVv+uv+p7xotnwdWDzxN9w5a0MirwKJCAHo66UuVQXqESirj4?=
 =?us-ascii?Q?g/zuD3rdAXsvrshKHwcVJU3DKnosAsDlfkFRxhzlVyS4KWd/V8fD42/ULMNX?=
 =?us-ascii?Q?l6kkEjjHxXP3Rkr8YXAOEgDMs+dXla9QH7OJsWpgSV1nf7aQWeJMhud2Fo0f?=
 =?us-ascii?Q?RAZMZI1ML/WsJB2xeo9bnL1zgCRwOj30I98hUpmhTaStafLCoe3RRq9ttw8j?=
 =?us-ascii?Q?tdYkXQiYSR+c+v1IkEI+3wNuzT4sIvCiYkn+yIgMx+IIHmXYt8biiinj9cBB?=
 =?us-ascii?Q?TUOHcov/4vKVmwjGGDJstCQ2dmDUIhsUsDtuIYv42jWlMZvyaYI3+RNqVcFr?=
 =?us-ascii?Q?f9ewpjXTGAP5zBlcXuFx8BJEjBIKl1KTeqq1E6Gh6448gZYQDz9HCoSKL2L+?=
 =?us-ascii?Q?f/A/SS+7IkCnU2HFmgzPzaHLTaRwVUoofnn5+hb1wCVq+zLIkszjt1wAJCeH?=
 =?us-ascii?Q?7Qr6X9CatXjtT1Q3LimvoeNakILp+cId55nOn6b0wjHdIZ+aZHpIBXcmI9sz?=
 =?us-ascii?Q?cDbst5Fn2GepvpdqTmSdOQ4ug4JVAtZ5tEkQzqHWeCPvmRjbRFQXs6E9uKUy?=
 =?us-ascii?Q?yXCvHyKl5kH1gCHqwbN0nbL5D/4qYLycF0MnzwdP8qMMWCSi4N+YMCzNfi8z?=
 =?us-ascii?Q?a4FLNog4wzAcwWM+f3DrE2+dFtZ/hfog1t7hSpXXEuCbkcMNwGdWMHiRa3dM?=
 =?us-ascii?Q?TWQKu7t+nKJQLjslUrcCVQ1j/W9DQ+iXX7rmQXdVyhhWWjHQtp1MEUAD9zi+?=
 =?us-ascii?Q?XCTemxKziPm1fp7v4Fk3h0wbmpxEa/5X/01L74x2K38PYfFFans1fnT2DH6k?=
 =?us-ascii?Q?JEyCUz3iYJ/HQdfEv8KUHV2DmS5IrLfUK/+/28aaoNodTwaE6mMEg6VkiNmO?=
 =?us-ascii?Q?YbGp74OoOSC0Y+LqIxs9n4vObv2XCxZhiLflZIMIgFVC9FQFw1K9sxHpYXtZ?=
 =?us-ascii?Q?8nJ7bETnDkWBubEvgA2ttJ0IY8d2T0RP048MGjZyC8FHp9o3ek2KE7VLV/MU?=
 =?us-ascii?Q?CmWCEPPLpFIAauk5/7d3LsdxwFZQG65Xq5eLevxLjR1cByHV78WB2hpwCdgl?=
 =?us-ascii?Q?8m2s25k=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TJA2aCn0afPRsZdZkuewP6fek0KEurFwALeYESp5f2kMkfub0s4/MDXBMZGm?=
 =?us-ascii?Q?XgvD6pomJwvFHMIwRH6awM6h1hMLuyj6viuTL3LfUbLIo/Zm1fQIq544U0lq?=
 =?us-ascii?Q?7KS/vWHuV/d0o7PiuR5htsyO59cl36DYGJGRjVk6NQUMyoZLVFqo/V/xdyjT?=
 =?us-ascii?Q?8WokBdqYxrU8/fBIK3Sxo0947+qHtXPD+wya32VrDji2qT0H/M+sGxpbJ2kn?=
 =?us-ascii?Q?2+UqTOdgteSAOpzOFRtMVnhEnbF4zqyKIW3ZW2loNB2bKPZs5bA6rVrrRf6P?=
 =?us-ascii?Q?6MJrwcZWK34lvNzP8H4DIncG9nvVnY7icd3CVF1K+MOlf9jUhR3trF5LTmNa?=
 =?us-ascii?Q?IyOmOGfPk2aMvgRdznZMv2F6qpSfEbXBfbHi71YORFIyobROpISk5Icmxtrp?=
 =?us-ascii?Q?9zk9K9TSQ93Dlms2XmS3zMKIteG2dukfoeHzYdaY7Mjp3IeiahP1INVf60p9?=
 =?us-ascii?Q?ZfncaB9vU2ma5ISeSlU0FHBL4eFsV9TmQFXRQOlklfkNzzsVaq4gGIxfPw13?=
 =?us-ascii?Q?gSRQIoavUPVoROjp6dKnOQh4jcTHtim0zDROcUu4ow+GAqpwgieDW0MMCeNN?=
 =?us-ascii?Q?WYLhBA5R38SN4pGc0VtwXCiaUgtqW4QlRQwBfFtM+MkOuFlIW6prY19H5RDB?=
 =?us-ascii?Q?7eXuYJrWjvWXAW40jv5FVzsZdd9YSBmN5dp1tVr94kxvzWzrZBA97xJuwzkg?=
 =?us-ascii?Q?G5vvwGZHsGXK4FuthH6kDgDnbMbB9NSUs/ukykMRC4gkfaegHICXgkWkx3R2?=
 =?us-ascii?Q?OS/KmfPHjACqrenXuF2E8oqOKkX/eueajT6dgHb5vwIs/iwsoBsHlILGXT3/?=
 =?us-ascii?Q?21A6urd4Dcl8kOP0ryPGyB0fzyuogcrYJG7dTmVDbCzmU4hy+qORSVSuKXO0?=
 =?us-ascii?Q?/52XLiN3gt/pUP6vwgrZuUAGrmmkQuRDmqZ0JhUEMOAYajnJjLXOmJZdoCBC?=
 =?us-ascii?Q?O6+7iVcdYx3hiVFPYl6bGTAf30Zw+REBugqPYhf2fdCJxZN6DnI8P2tvgB71?=
 =?us-ascii?Q?YCacyp4MoeTSTgtpixEIgQvwfoshVqwbKXvtxKuigi3gazxByVrsrNtGVX9m?=
 =?us-ascii?Q?othTQ5Sdh2zSK3gbIGsTwaU3b+BC7IsOyMOlFFN8QhFeQMtUEpJ6i72fd4ZC?=
 =?us-ascii?Q?NQXHkD0UnQkzYo88SE6aV7jghi4rUOK/XB2+/EvvvvkLIzFd1x3OpGPXyk6Z?=
 =?us-ascii?Q?aTbG755NyGFfsi+493ewpTsX6BKkHggY/gMifivuJVNhBmHX7DsH7c+xzVvX?=
 =?us-ascii?Q?D4juSlMVNgCw0s4hLgcIe0yAaTjWuyZ5kzAQB3NmKkFMtjEtDM9Ow62UsGu5?=
 =?us-ascii?Q?5G3t6dxK6OKYLSHODE7BGLq9sXeYccMh/YgGiUm7ikhjOGRLRprObJXJeCVv?=
 =?us-ascii?Q?kodsyp0n5K+f0OKZPpUBkvbaBag2NLCwp5SV5j6Vtj+IXWPFKW52q0tJCqtv?=
 =?us-ascii?Q?643ikZu/gh9cF/VOJw6/bwxEYI8SJQwFZAcXER3tCNsrLFM3OiwpyQ51p38q?=
 =?us-ascii?Q?fYtTEdeLCLg/4Htud9ii+tEXqXTEQRyXMYn2QUjoqOkT320IaLWpSQhip6oo?=
 =?us-ascii?Q?FYjs1xdfHnqUmhKmYe3LR/7g9pAgDRqWWNMtWgI1rZKX3RfNKhg+xZLfM79j?=
 =?us-ascii?Q?Mg=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 181819ab-3283-43fc-61ce-08dcd0296502
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2024 17:12:18.8029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BedS6D8n6H/sspvE7VEGAKyj+m5fwM6cmlcFdPzrIpdk3zOIyI8l0LYpdo8sL98Ijf+e1FrGqc1t3zGBpqdJMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR06MB9098
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Sep 2024 17:12:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112166

Both project pypi page: https://pypi.org/project/cbor2/ as well as
https://github.com/agronholm/cbor2/blob/5.4.2/LICENSE.txt state that it
is subject to MIT rather than Apache-2.0 license. Also update
LIC_FILES_CHKSUM value to reference the LICENSE.txt file from the
downloaded archive.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-cbor2_5.4.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-cbor2_5.4.2.bb b/m=
eta-python/recipes-devtools/python/python3-cbor2_5.4.2.bb
index cafc32ad1..0d0ab6af3 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2_5.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cbor2_5.4.2.bb
@@ -1,8 +1,8 @@
 DESCRIPTION =3D "An implementation of RFC 7049 - Concise Binary Object Rep=
resentation (CBOR)."
 DEPENDS +=3D"${PYTHON_PN}-setuptools-scm-native"
=20
-LICENSE =3D "Apache-2.0"
-LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=3D89aea4=
e17d99a7cacdbeed46a0096b10"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Da79e64179819c7ce293372c059f=
1dbd8"
=20
 SRC_URI[sha256sum] =3D "e283e70b55a049ff364cc5e648fde587e4d9b0e87e4b2664c6=
9e639135e6b3b8"
=20
--=20
2.39.2


