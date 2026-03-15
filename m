Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 422F8D58B0F
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 07:48:25 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.112])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25016.1773560897172634369
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Mar 2026 00:48:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=mLk2PF4o;
 spf=pass (domain: navimatix.de, ip: 52.101.69.112, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OaO1jlx9Kf7Hs+o6VACkq5c7j0TQTlf0XjSJnCRcWTap7Z5O/rBXkQjEe61mvzMZo+rTt+ONQbAa81M0HBp318Ito87KbjfjIy2LiebBresqqWqZMwaiBoFKI+ccdrgcfosXTMi/ZTGId8vq4oOkTcmgieLjpXjsgZQTQxCo5pDZvozQMQJa0ZzP0Gs+gScXzEGlR8jco1N2efhZLjVCNmyhqxTGpOZfSRjl0WOumZvjH0Q4w4rK/0txyFf24Qn1mNtrE/Y8QnfKQ+6/5vYwbmfuwGEHqbfdqFuVrp31WJfpcBTQZn1q2dCaOU7DA13XWSmYVfUlbHy1kfjeNFOhzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nMF0qT+bcDyq5kGxnO2i56VDL9vF3OLUk/GZqh7KTPM=;
 b=l2hT+TYKQTrDnoDPjl4s0Hy7gVrtKgYJkMu/PISoWv4qEduGMn4qujIFjRX5rxDZR1J2H1+IJ57Nj06cAM4tI6xEdPcSBJET+mXNQnCsrQjiqKFa4e7AneOKsW5O/ndjvRVPj8vFnEGXb7eVF2DOvpXWs6LMNgrzRq7pBrfH6JVxFWdCNQr5gUBDdkPyhirSiu7JC8MJTSk7bDAQDFlLWuMvg4oStMHD1r0cgFhFwWkVa4Y0Re5RLfxswMtowJv/vZeIXzh7+zhT3tZnwzdgNpPJqRSO5Vt08BpDERHEuyQ7kzC3zCru7imWGPrToXPpci061+dxpWyjuEPD6lcTuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nMF0qT+bcDyq5kGxnO2i56VDL9vF3OLUk/GZqh7KTPM=;
 b=mLk2PF4oCsoEY5aG3k2C4yAT2hTqfnUoBlEla1BJ5LNLdvtGwQ5VOXb2pzroKJkXQElPBp9JWOzJssQA+puMKT9Q3YuZq+i2o842eO0T48HjJaQG9teBcI+aqm0D5paVIdu3yyEV8hng01P8x19h+hAHgkzrsNYBi2h+Sn7uv4Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by AM8PR01MB7761.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:236::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.19; Sun, 15 Mar
 2026 07:47:56 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.20.9700.018; Sun, 15 Mar 2026 07:48:05 +0000
Date: Sun, 15 Mar 2026 08:48:11 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-devel@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH v2] ncdu: New recipe for ncurses disk usage
Message-ID: <dcd2ca2774db611a05497dcb7f5879d45c7bef8a.1773560854.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
References: <189CB7A6BFC4DA99.2629287@lists.openembedded.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <189CB7A6BFC4DA99.2629287@lists.openembedded.org>
X-ClientProxiedBy: BE1P281CA0280.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:84::20) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|AM8PR01MB7761:EE_
X-MS-Office365-Filtering-Correlation-Id: bd1eb4fe-932f-4b55-5691-08de826730fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	nZSgBP4NQ54QsqiWbkORpkur4jbt5AO/bC1Hv+xzxfuFZO7PV83v75p/mKBA9hYYl/NvMf7a9gfvc5MoLEKRk7x8YnTQPF7i7XklIKJKZh+OLbjuZCbB7HS9flga7Tj7TdN6lq4b68iOtqKD1lS26ZZhiYHhygZyurNQmoj89G9F2dsSUlaq4MUNRVVz7MvJnE76UZ6oS7teRwHGh8CWPP620qBZ404kBzn8aXNptEFnBNGv5aySEnah3g55QD0j3A3wlLpGv40TYlVTUSZWNEdAVuJYiwphpS3NT3C7s2Gsdt+p879uCAzuQ5etXLwsh2lKwvLCN5XQd15vjOiFcTKwXasbuqq/Acj55sc4tuBKQhlVOnmEtrUNqLEfLfgXpRf+h2w2wyP/ENv0KbvXHsuj8TLNRKsFIcBoAX38/0Wk9oxxAIKk2QjvL53J/a0P2p6ROk2+ruUFh0ZiHrvQfJenwX2wGWUCwelnVCsGee1KerBbC61bYX3vFNOv/OaQu+9K3jkxSoBWXyMefX6qqWxvpwUDZTUofd5213VBidMA0IHJifiGCaT79GBh0gpK3gLHDkPfyEjsjDIaBUj3EnZh7B6f/JuG8u0zL+x1UH+JmUOvbVTLK+3N05t3ugbJ1MIuvwT9jz87qOttcpNI4+as5Um9d5UuzmpAHMEzysvvarRGZC1yiyyf9mYI94ci
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?f8rJrFnrrz2gs9nrmO3CBr9kVVdet93Qv0KSxwQRMlN7fsL/IwJ4KBT9Ijmk?=
 =?us-ascii?Q?4ZDqfbRhPZ62ieBsIi/6WwWhpifGFk4DeIoaw05W81KDAs8WoINQOt0Y7PjR?=
 =?us-ascii?Q?yyhUb0PU1urVa3MvOLUCiVwopTwZbTYYZ1RSPTAJxWYiISG0ptvL4T18eli6?=
 =?us-ascii?Q?vY3kpvgUo/mfQp8attjzTPVCoHfVbyUjIWEgoLvfG4BKevO+LxCHAZoPFlL7?=
 =?us-ascii?Q?tNPFdJy3Bm/Ku55Gtxr5P/0PR8iPSNO+9/gwuk4whD20zw/uD1+xPnWqvblY?=
 =?us-ascii?Q?06oOROF0iEFZIWNeGEMOiS/RNFLgNKSwsy9lgVYuuQ9Fbpoy9YQNUi6owDee?=
 =?us-ascii?Q?dlTz43NmTUo1PH7OzWhEJli2E1+EMXmAFYk8Rh7B7xp+SclNnB42vcFO4R1M?=
 =?us-ascii?Q?S8Kz6rZp9KweHefEjj9C3NuDSdIoWbPXRvDlo+iXyiYqxlCVm7LQk/mZEHkr?=
 =?us-ascii?Q?IhNShayfoZ+/3soj5Rd+TiBFgxBKW5z3vQaSIsCwxFeeO++FyAb9qfUoP2A7?=
 =?us-ascii?Q?hP59z2nTJnwYi80rGXNwtzY18NKsRJFWwYwni3vegT5k3zBIxJUE87ELelYN?=
 =?us-ascii?Q?a9mAMmNn/3YsVeN9jGLXy+tF+v6ogIqt0APaTE57KDNBDxlxb3ALMYY7A79t?=
 =?us-ascii?Q?RRZEihFUTpme/1W/tYRHBqu/fyFlcF820Xu3vfvdmUA9y4JT7wviI49U4Fpr?=
 =?us-ascii?Q?O4PIvgu+XFN95FhdGfhd9c+vERIWfQS41Y0uDIVGYE/ZR2xdLjvfNdP38htZ?=
 =?us-ascii?Q?7rBaaFtVT9RKZll5bqmqsvK8DBY8PtlKlb7vK1Rn5K26dDtCUSYJu03y28Vh?=
 =?us-ascii?Q?lmjQRYQaSCIM4Wz0g548oeobv9lYbOtcGu+KfplgOuow4aWUUT6iVEFJiItn?=
 =?us-ascii?Q?WuLmemXz0D4SRxvDMEG+mLUJE04WwC1KMuC/My2TOLJN0eR8j58tJolFPCNQ?=
 =?us-ascii?Q?hpznO4deHySWN3X3EyzErWg2Hx5t0dicD36LVvTYcQloPZs/ikm+4n0mpP+j?=
 =?us-ascii?Q?93pBhf5zKDyMhYDqEp5Stz9Qu3D1jPg/mpwdBcyObjb8tx8NC6wiKDxvAoQj?=
 =?us-ascii?Q?9mEWnBMSmW9frGYE5ThsdOkL1mOncTvSvpT08+s/6A2f9lvO/dwUH/JIz++r?=
 =?us-ascii?Q?SFx1/UGrDcxmdt7ikohxQoS4hlKsRAh6aVC6tgOt/85mQi5R8RoV6FHKQVph?=
 =?us-ascii?Q?IdxEeWVFyXrKk/JrN8DjtgEdq+kBn7qjmNr7V8Jf2FrNLHBclV9F0aYjLmMi?=
 =?us-ascii?Q?Dh87L+8x4UVa7MsvbzJhz1FZDat1RqPg1FLRdCAdLQbVPPX7RsqVSS8dfLyj?=
 =?us-ascii?Q?c0v12O0MRqRieDgMUioBPGP/aHXM+EsuQkzLPJTVsxniZVM8LeZY6N+Qkr5u?=
 =?us-ascii?Q?pT19TYuvY+BzS8CbWIC/O+ieqOiV1g+Wo5nEy9TIwK9IEuooQ/iArXgf4LWH?=
 =?us-ascii?Q?5D8VNzgJiAI0qfj7VukiqOafdVM0GQLti0QOO5APBhwdjz4dMuGKXsZ78+yi?=
 =?us-ascii?Q?IbmTzhShPnLcX3CvaQW5kJy9DY2SS4g8kKHmJxw8Y6cEO4GuU4p62peOAX3G?=
 =?us-ascii?Q?io9iYOvD4tWkMYM0dEUflwLnLLApknugCHTNG/JpFkal3F6o4AoY6+YteeiE?=
 =?us-ascii?Q?XIsDs6ozK+fcGsx8+8H1lVK6Sq5j/LHtsg87sbVOAdW1USXGALzxCSvUzSCJ?=
 =?us-ascii?Q?E2x2O2/o1VmYhF+XcuhtQo7U0cUSV4nQKua98voItyyv0Sao9f8tBEp3mR6+?=
 =?us-ascii?Q?yzziOktaTEfFhU/PdsSReKtei6r2r6A=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: bd1eb4fe-932f-4b55-5691-08de826730fd
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2026 07:48:05.2288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4TIxWVYkOIeleIqSedM/oRDka+UwPT/imQ7Px2g1pnmyMEAqzTPHZ5Ww/XBLPFwQp0YPRUSVVzHy4rYUulqd92bQqfPyT2NHDWQ+v3clLcs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR01MB7761
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 07:48:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125217

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
Changes since v1:                                                          =
                                                                           =
        =20
                                                                           =
                                                                           =
        =20
  * added tag=3Dv${PV} to SRC_URI                                          =
                                                                           =
           =20

 meta-oe/recipes-support/ncdu/ncdu_1.22.bb | 25 +++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-oe/recipes-support/ncdu/ncdu_1.22.bb

diff --git a/meta-oe/recipes-support/ncdu/ncdu_1.22.bb b/meta-oe/recipes-su=
pport/ncdu/ncdu_1.22.bb
new file mode 100644
index 0000000000..578ae4a5ed
--- /dev/null
+++ b/meta-oe/recipes-support/ncdu/ncdu_1.22.bb
@@ -0,0 +1,25 @@
+SUMMARY =3D "NCurses Disk Usage"
+DESCRIPTION =3D "\
+    ncdu is a curses-based version of the well-known 'du', and provides a =
\
+    fast way to see what directories are using your disk space. \
+"
+HOMEPAGE =3D "https://dev.yorhel.nl/ncdu"
+BUGTRACKER =3D "https://code.blicky.net/yorhel/ncdu/issues"
+SECTION =3D "console/utils"
+
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfd36a36514d73885d04105f000da981=
3"
+
+DEPENDS +=3D "ncurses"
+
+SRC_URI +=3D "git://code.blicky.net/yorhel/ncdu.git;protocol=3Dhttps;branc=
h=3Dmaster;tag=3Dv${PV}"
+SRCREV =3D "7a1437389691c4adf1999afce63850c808602f08"
+
+inherit autotools pkgconfig
+
+PACKAGECONFIG ?=3D "largefile ncursesw year2038"
+
+PACKAGECONFIG[largefile] =3D "--enable-largefile,--disable-largefile"
+PACKAGECONFIG[ncurses] =3D "--with-ncurses,--without-ncurses"
+PACKAGECONFIG[ncursesw] =3D "--with-ncursesw,--without-ncursesw"
+PACKAGECONFIG[year2038] =3D "--enable-year2038,--disable-year2038"
--=20
2.53.0


