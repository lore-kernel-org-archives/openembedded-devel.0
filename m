Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70D6610706DD
	for <webhook@archiver.kernel.org>; Sat, 14 Mar 2026 13:18:05 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.89])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9401.1773494278376381502
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Mar 2026 06:17:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=I169USal;
 spf=pass (domain: navimatix.de, ip: 52.101.66.89, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tkBdeIsFY+mYTELfEmRlw/ZxWPBF6fjGf2/6CEV+vIuyyKfhoAKIjM1pFYuYhNB/l9Xn2YU+nszIq6DRHRVwgUM0+D0V5vNCQSEbtHe6KF4VztJbUaBruStztxzRNfaLP8ofDf2TrEsm2sbCQrVGLj06axXRSPDmTNoxpk19t213P3xRwhxsqD7OAZZ4MrhnLQTluSqF0+BHdctvbfXeKN4KCFErel05zx3xloQwZ7RkxMwrmgZQCQRFr0YdT3pRykWUf97GB2l+y9BTsmUI5LoKVl8htg4tcbvVYEX7r4BbP/38OgZfO6BMCAf8eCZvZH63BkNtBhhO89qpt51osA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qpfmRuVpaRUbOt5c5PSsaPWPYJHHWaRhGMIhoYJ0+IM=;
 b=sx73mGID39ByNunPktaSukBWnVjyuTIJwRe1hjuNoUbv/LQgNdbrhnrZzU0ZSJoz5MjHjGBLyEM3kxR5OL2qLX09G0Na5nOLiOqpVeFbXEfFw9xEKid7/TGznkbEdETlTSaOiJy8aMZD4ltxShhaXmaFTqn6GaEg+dRLF0X5K8DyKvGzNSql2nIkUhTzJnDPd1axkuGiKqQrkYwzjCdheTQSy4ts2smWeFxv/qbVv0HbyhaDNVyyeiwyHB4/XrzJD0/2HsiXhs9nCSfYo3Bhu+Oz62DQMc12y3/Xqs91TC3fOalJRqdBtWgyMDFgz3CCIOTJa9o1elzDfHdo2QHxIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qpfmRuVpaRUbOt5c5PSsaPWPYJHHWaRhGMIhoYJ0+IM=;
 b=I169USalkvyYaC7DKNNtfOrqqQQ0PuUb49E3znbGxAWJDKxmvekQl4LJ1BCS+7Adoi5VsQqRFse+JMGA9JSomB0snyr7lnz7Vbm3QqVLhULWMFvHcHAatnHUhVkOexgPqvZQktWoVg7G61lHXkOnRd+uIFRP92FAQn8Va+onWiQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by AM7PR01MB6676.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:1a9::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.19; Sat, 14 Mar
 2026 13:17:43 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.20.9700.018; Sat, 14 Mar 2026 13:17:50 +0000
Date: Sat, 14 Mar 2026 14:17:52 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-devel@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH] ncdu: New recipe for ncurses disk usage
Message-ID: <cfcab61db83adf92a38ab88e2d6fa9e7ef272d5c.1773494271.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0255.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8b::20) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|AM7PR01MB6676:EE_
X-MS-Office365-Filtering-Correlation-Id: aedd539b-85f7-49fc-90d8-08de81cc1766
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	R2EhC6NLBO/h0FaII4N8o9zDRP12hrxDVR68YzUY8E2FKoB/FAVlM36h+L6oHIfVOrbn67i5h9bAiCrAzUGaKqOt/NpZZQzmOSXyiYKuu7PmTmOdJGCpNtIsV0IbqzHITDjQI43zqvjjoBbQUcJXFMniSQp/+QTJ5cyPaK/9+WHcOqvcNWbnoLlqt/F3ji0rtpGBm7CdEpywvsLoeOy1cxreXRnkyil1o48zrQxQlRPef+MPH1YKttT3Gc1kE4mVIlol3feL/wGnNzQ/HeSWCxJrDEDuNEBt+92P+K6ER4VQ9hNRDqtPZTkJvzVwB87K3sIHRxUDqkagKdj0qtoCLm/rJ56cdKkXwgVYpw1XiYkgqhWlzH+BKqkF6BF5JNJEWvkc6TO3V2SZlUXUvzy82tDxuagGkDZxItiS4RH4HYFnZIHO4X9epN381DNOlJ0qanJE9ZBc6L76va3YnqKRFZ5WcjnwmBj8lQgFrpM5lvRG8dFTNI07sIGmV2MAiX7GCr86VRXD1cXAxCt0TSvAwTbV2aY1gBz9Sw0Q6kC3q2A14vJs+hRpBqi0zS3tHNIWY50EyptwY6z4zDBqUg0yzOg8e4WRQ0Tpqel8XZWLeqXZF02/cljvVLTGj/0SCv6R44gLwxRCGwt5aFt3cBUVWlZXdD/73UT1ZIc8DwzpYTSgyc026uggF4fs6cKKZo6D
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QY2jUkVL0Fh1M9KBL/BA21jVopeqUZyTryuYU88V8GwXlorj354pSVLKPHX4?=
 =?us-ascii?Q?ZCSmJ6wXzPB0oxPqP5OLR7YdyV1/wxGUEJFCPRo2u/QypzwbYQRPx6LKAYZ/?=
 =?us-ascii?Q?Nsd4sFJ4x/YWJ3snAS8TgDpOX+1UZ2RiPWjk17PMz3VxApHA8Lfkt2dKeffT?=
 =?us-ascii?Q?WGH6eI07/x7IdvB+RBXvjVvmoEz9zljpYegoqe5WTNKc1y1ivo6bKe2Xuh/e?=
 =?us-ascii?Q?7FDEW0SnODFdR0xe7+JDLNDE36xTObMsm2VxHHEcl+K3H7WVfPUdEvTbVEEi?=
 =?us-ascii?Q?fF7/UjHmBeaLbzupCaO0/Xbb3Dhsderi3sdFUj8aC/F/X2xSg5WS9w19wazt?=
 =?us-ascii?Q?TSozXl4WV2N/TIcuzmkKjRDX861OZUap/BIxbjmmnyIahz9jzqMTgqQtdS4q?=
 =?us-ascii?Q?TScpXvJwPvPqn+PxzIDUhpxKfgaDeemWsj148trn1RKNZYPdFMRqFjz286RX?=
 =?us-ascii?Q?xbZ6pDRi0IXDOEOGVNQfmsWloXkGt6IR/yTZpp8YnSZBagOhgqT2qzJgHc2g?=
 =?us-ascii?Q?v89ws9AN/l/8j+gjRWBC6Lukh53o8Ft0sfjkcl35eaypjWxEkfBxB8iGK688?=
 =?us-ascii?Q?1/b6JH4JsvrgeaxTIt8voXjlRyZwrihlkhUK2fc5PHBLHJ+FIBuhIL6EZUXd?=
 =?us-ascii?Q?5wCzyPYm46znaKo/i6BGPs8qFR1kKO3Xolz6zd4yIeuscWXrOGS5/UtKPBIz?=
 =?us-ascii?Q?8HlI6MXTvBAsDkNvLcNWniqEF4W8ESYSnq7GTTYRqaoEW3l0ZUFT4XT+I6Nd?=
 =?us-ascii?Q?lfYCKO7zp+gIZyQlsYydTb1f+41ozBPxyHgJts2upubaQOpIuD/oReddnhd9?=
 =?us-ascii?Q?NT/MsAzcPAc/46EitAVukYCYAhaSlzHuvbJ3CNKqs8ga2Fjo9t0AW7BC2UX/?=
 =?us-ascii?Q?eepp2QeTqffKdQDXPEE0qQpdEwSxZjv5slt1P5ay6Nrw6Dnde0damN6HOUam?=
 =?us-ascii?Q?oP5yzKvTD9NFpkJhYnrFKPfkZteMbwyX9CuOpNtpFdVAjlrZA0yCYPDwY7vQ?=
 =?us-ascii?Q?1Mr5HGDwSIkl61SZRyG/IaOxQyWReSHyLrsQY+UuVScZS9ETUXfBcOfsorH9?=
 =?us-ascii?Q?tu7KCMlaf65VSVBDJ3WnQA4sPNH5No70r7syU5oqpYLnlMlyJ8wfe094Sy7E?=
 =?us-ascii?Q?qp/+q5M+DKwiaaJSsEvwXSvrFylV8G9wTeyGJnGbf7dLbtEuV0LlUYd2/Ou+?=
 =?us-ascii?Q?Hh71eDkk+ULAWCauEj39b5UHcu7TaSvLLdo5ILvyFoLdtDgIdDuFDGRI5s6v?=
 =?us-ascii?Q?i1/oe9kQ+6ELHux5csp3QFpgnZ0dCPgjFO4M3qpojKcKlBUZ58nN9ZUGcSDz?=
 =?us-ascii?Q?InaT+p74RAPt5aRBJWBh4MgHEGrNLzTAYWxj4OrHmKD1878rSjMFAHy1Gcdm?=
 =?us-ascii?Q?zuBG6hz5Md5C6wRGtyaq0Dvftug9Bx0M1lAKkQMFfzuOxsO5lyb4MsDk5qPw?=
 =?us-ascii?Q?Dg7dwhULCoBhdotpesWHhWQLHnf0aLPDyR92Vaaml+6z3FgBf93Di1duw8GH?=
 =?us-ascii?Q?lTLjAqU/LZa4eqoHhNxydMEbBxqa9wnHOS6UhCkX5duJA/OzYRy660GhqO25?=
 =?us-ascii?Q?3SpTK7gm0tNpsmPtun5zDwu+ra6e26W3UoGoJGR92xd1s/wfgn4gQnvi5yXM?=
 =?us-ascii?Q?BBDdIQRucwCewuN1VTYsgOyiLLzSKXzfmovRkwEoUXTF65kIZiEke0Fkxh8p?=
 =?us-ascii?Q?6U98GuGwGPYWihuyIJv4Rdghk2EG3MepQ7SNRXwOHoFXV3y+54qJybKKm8d7?=
 =?us-ascii?Q?4BsC2m2nKcIxo+WHdPvhrg6NKHGDqJE=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: aedd539b-85f7-49fc-90d8-08de81cc1766
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2026 13:17:50.1372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VEQjlXqqAGPI5X9GIXJso6n1zN8UOVdaxhoFPgNLQgF/Fx9j6Z7ah7gevvT5AEArjcOsS6Ba2209Ssj5TLj+salViSj/7zBVHGGVb1qQ++I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR01MB6676
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 14 Mar 2026 13:18:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125208

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta-oe/recipes-support/ncdu/ncdu_1.22.bb | 25 +++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-oe/recipes-support/ncdu/ncdu_1.22.bb

diff --git a/meta-oe/recipes-support/ncdu/ncdu_1.22.bb b/meta-oe/recipes-su=
pport/ncdu/ncdu_1.22.bb
new file mode 100644
index 0000000000..94d210f86e
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
h=3Dmaster"
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


