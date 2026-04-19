Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AE2CEA7190
	for <webhook@archiver.kernel.org>; Sun, 19 Apr 2026 14:32:41 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.109])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24.1776609152915234852
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Apr 2026 07:32:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=MgupBB5s;
 spf=pass (domain: navimatix.de, ip: 52.101.84.109, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hN9hS+LFuSQo/cXJMcfYw1V/1xYRyvDJZbkt8uDaVLofxDXIeuV9HGW55yxnB3wVGN/XMDmthMewWb18UlQhKROcHXKpcpqP0qjnVlsHxyAARgxHA7TxCwu7zFWBIdasyizKKg1R57hD8kr7Foh3Vb0yxcvh+9mLNkm9fBnhCSfK4fa44s22cb0PVecVlRGl50K0iGWtDA+dHC/5b1goullj7mjk1GlXwKksX6S8iDKlhInyH3ABM0M9pMTo2iwlgW9fVwvBC9sUZ6H3aHAXJ/MLOpkrQGRYnBOjK7dMUUI7ndf1QoIxMDX3UgYTpHx+s72iYg5sCWjTeJmzzPs4ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8QY2/YGDxoqvsvufVa+aG1oZJ5zngddVoc1uzag5i0o=;
 b=Z0gYs7JGszZEEoyYQo0abzh8tgo8tlJnhOedRi9+bLYnv9EmeMiIECEDSATdsslyhJ8/X/+omrtDpJ2yGHUhgF62RfPJwIDa/2tX7YmG62IeNq1y3FDqfvIPVIo8cgIFFUDzfoZ/x+8DdHQ4n9vHBuhg1p/fM3v/LcK3wmHt1HXJ46eykkQlF1KOMPcSmyBLNk6xcMqddaH7roMSSoXnJb6fp0ksU03leQY5Hpsqx6uxFMKRyldB66kGsIfxFpOLUoqNlB0BrdpWlBunuxCw1G7IHNUngyGmwXIGhjc0VCSgZf4r2ztpo4BT/I4XA5uO58AByI6MLCQPWzg2Lri+NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8QY2/YGDxoqvsvufVa+aG1oZJ5zngddVoc1uzag5i0o=;
 b=MgupBB5skxprIDy8s2o/jQjvWJv7yE58XzgWSnDxSEu2f7jWGur73u1pcAPnzBx4KC7vYEV3b+vjRNKhRzaDFmvRGScSUuwmpwLkKzvdKLkUMwle5SJXV7ipt1AfkvkFf+JtgFY84eTYhhhbu8bwO8BwxyOIPqyb+GnUun/DnzE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by AM8PR01MB7882.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:3d9::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.30; Sun, 19 Apr
 2026 14:32:28 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.20.9818.031; Sun, 19 Apr 2026 14:32:28 +0000
Date: Sun, 19 Apr 2026 16:32:27 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-devel@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH] framebuffer-vncserver: New recipe for VNC server for
 framebuffer
Message-ID: <63d0406940654464c14f7d9cba2f2542f2ad7682.1776609146.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0154.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:67::15) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|AM8PR01MB7882:EE_
X-MS-Office365-Filtering-Correlation-Id: 487c408b-4fe8-451b-13fe-08de9e207bac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	4JxHxC0WU7QGrFR0WlSJeW5ne0jJfGrgI6t3Y8QdlCDezQDi1rxj0k/nX50TUT2RE/7R8YeQboI2mU5uUnKLWnngy8oRQO/V+nwyeOxs7OASHDAoF5GCry4oaNAC+ik/XeYFKGlI3UIw+ZOCW4e7nmU1zaHVoqfDxf5WDUqDmRrBv1hEJXcj9kimrvnyg5lgfYy4flYeoaf0Ib+9SmZdr9HCCq8PR3fdwmtoN/3gYoczMFYioC2tgvqZxwfcqdCuWFJygEXYbbFI/SAOfqMqtzE+CsOoKb+wDr5KEllTbbdLeQ2WdPezjBX9VRVeQYzStLUXyEpiLh/AnbkvdU0lZlL++U5A1hiXOJdZanng3Tr2xjTAwS2cmV0KiAGA/ZhyBAPFrejGhG2HsHt6DUuMSsIh6bldsOdqeZBWVnePd01IFgtpG8W2RlE27OjDZpzIyl/crJAwxYTUGXiy5GR9K9eJRhkJCVW319YdY119Sfe6S/VUX17EwoGpkk+5RaZYDNfUfsiAB5gQ3kDeAdqBSNNvDTTjTTDnS4F9PGurBdaOckNm0DUfJUorjERNfRgfGyQR6QK+p/VpgV1elWYAsvn0RXQEEIYNjHV6uTpI+boquCL0hYdSImo4nynwLiB/T/63kgvlD1CH8IjUIG5EDGNbKGzIOw7TvNP5rj9+9lM5J0R8XMjqs//C3nUxJWKCqLbwdSH0oJ2nMJ/7yRK3S7ooBmwxalH2LwVGkDBlFJQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NwxxgKZ+EpU0UmcC11AEOat73bXu0JZuuVryVWScSQeQSarLgZUihOo4Ep9T?=
 =?us-ascii?Q?RrW2M8GaqPmJragjzQmqDgowP51B87YyVRa3wzO8zc3L/KDH1HWQ7bMO7hAY?=
 =?us-ascii?Q?W2kc3PMvx83ICQlfhmtwdPzU6Ys1azTtyfaUB1rQdTcCQt8OktHp4IKaUnNb?=
 =?us-ascii?Q?lnu9rRMKVcaszX+EJUwTWXACE4cfR6htb+KkirHqsx6yPMt95DkVl7M7aswL?=
 =?us-ascii?Q?2iPr3P0wAas4x1l4q4IC46fGMHYdw6lIzkwnGUOG4dO+mKGymgBGWk2CTbYa?=
 =?us-ascii?Q?CfqYK+d+/n3yc4Em7tpOHRkym6zvmsBibODPofulAw9av7zj2XnU95lyeKe5?=
 =?us-ascii?Q?Q4QK/ioarAT+4AURoJElWy9fF2RxXqoidrUZeuYHfIOY0xbeUDl0CJVD1jKb?=
 =?us-ascii?Q?OOfX4WJ3S4PdKLjE7I7UhBFdd/AjpTx5OKjo8UcqqCuRp0fq7BvnQldkhAZp?=
 =?us-ascii?Q?/ydOIpD1T04MBg8reNiiKoyTpnCGhSWy6WWUH5GSfWOAd6FkySclsgLf7kQJ?=
 =?us-ascii?Q?i/9J4zCl88ZamEFduO4fmWcwr598D3HYPSs6dF7mWcC4jcVsGm61gmVtN8pv?=
 =?us-ascii?Q?Rs0lySyBEIA7uDJ9q5xbYsvCsNLX1LAQbjCAuz/LBHnIM8uq3itTJ/w7j7L4?=
 =?us-ascii?Q?G6koLJ8q4o1eW/XeZPljLx4jkqR8GU9hCh/WW8NOpDapyCVlEr4J4MhAgwIW?=
 =?us-ascii?Q?MDtm7nQ7U9YH6mEv7jDqCJ4Pj56815FR7Bz/6UzgOgs6wh9nZOg56/DSxe4l?=
 =?us-ascii?Q?EC0liKGjGWvuHw6BY4fHTscE4wvuKMvcWHYUIkgZth25ZEHwqP+nP0JXr2QL?=
 =?us-ascii?Q?eYzb58kP4NaDAMhvmuGwhfW9N9aZuSjk0tHkxdZk1HaGWWHP30sfpFRehr/8?=
 =?us-ascii?Q?DCrB9EW1hJSShRmKjf/queRngSAzOolj0zbxGhq9b92CKvMWzL4pi8lk64E1?=
 =?us-ascii?Q?8yZ+8+VZLsH3eNl/vjsAw+pFB/Wkn3K+fB6fi3KZ670blIfboXviu1D3zS/z?=
 =?us-ascii?Q?uRqrxR487dw2WJpZppzD+8p8SMAyQeOQwUFxHOke71ASCgHOWdFr8yD07a0Q?=
 =?us-ascii?Q?HeCf5b816Rzux5TWjkhi48J1YCLNLw3GlxDiQxVx2Xej5m9VYCP+4UNChyG8?=
 =?us-ascii?Q?b90+YeITIrmUBWbCXbMXBKKweg7QYWJdAYw83E91itdmqhOGOetNiRQ4hj7I?=
 =?us-ascii?Q?BUKwK+hRlINMqWG56aGgXgUmWPb20bqOIk6hPgh2J7JrzaiodsCAhMZfI0KI?=
 =?us-ascii?Q?Iay6Pj40MqioTZWlhajqUYXCPONScbxsLIwYGCp3aph0pYEekDAoGW28+bZg?=
 =?us-ascii?Q?X9bRGYNQw4+KSCFh0XxZmGbR9/Nwjb77Z4+9Qr5sU/1c11NSkVPszIrD/Afl?=
 =?us-ascii?Q?3h5zmfwC1/9WYn4Pvbzj2iXHON2e5g60DsXENh6Z6vN5b0k5BR4A/whdHt9d?=
 =?us-ascii?Q?iU4voKMIKSIJBLRliOLrWmMyN7ToKAO9s9NLIdQs4OLKcCALWZc3BUVhTaNc?=
 =?us-ascii?Q?6QvrPoxoN+8Edk5DDQ00Tu8bShpEVrpOBINSVXLlL2nNmAvQBqLL5FhaXOZ0?=
 =?us-ascii?Q?M7vFr84Hbz7ujQfRkLU24ErG8fNXZLivWKdwjAD+vCXEpHkyMqfpbxi6wXTz?=
 =?us-ascii?Q?N492GZbUFulFZCyR9DSInpNdTb8gQQQLfWvSdohKb9kyTv0SKLDXM7Ye2TMg?=
 =?us-ascii?Q?JGiMLwIf7/fPUZzdW3XNzIANYoy4v3RdOyCqv7dlpDt33X+pVtGHeXVzcReI?=
 =?us-ascii?Q?X6aHwsbv+UcpYMcoy0dWRZN7WUzdYNo=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 487c408b-4fe8-451b-13fe-08de9e207bac
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2026 14:32:28.5763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z4/QyIUeksvkd4gFky2xrUvzf84xy2q47VpCNGw0ikb6u/Joa9HLqO5cl5L6jGjjNBMhlH6HluIm+W/1G1vA3jsI7ivk4Uic9hH4FCPKkL8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR01MB7882
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 19 Apr 2026 14:32:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126459

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 .../framebuffer-vncserver_git.bb              | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/framebuffer-vncserver/framebuf=
fer-vncserver_git.bb

diff --git a/meta-oe/recipes-graphics/framebuffer-vncserver/framebuffer-vnc=
server_git.bb b/meta-oe/recipes-graphics/framebuffer-vncserver/framebuffer-=
vncserver_git.bb
new file mode 100644
index 0000000000..09d54f3ff4
--- /dev/null
+++ b/meta-oe/recipes-graphics/framebuffer-vncserver/framebuffer-vncserver_=
git.bb
@@ -0,0 +1,25 @@
+SUMMARY =3D "VNC server for Linux framebuffer devices"
+DESCRIPTION =3D "\
+    The goal is to access remote embedded Linux systems without X. Impleme=
nted \
+    features: remote display, touchscreen, keyboard, rotation. Not impleme=
nted: \
+    file transfer, ... \
+"
+HOMEPAGE =3D "https://github.com/ponty/framebuffer-vncserver"
+BUGTRACKER =3D "https://github.com/ponty/framebuffer-vncserver/issues"
+SECTION =3D "graphics"
+
+LICENSE =3D "GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8264535c0c4e9c6c335635c4026a802=
2"
+
+SRC_URI =3D "git://github.com/ponty/framebuffer-vncserver.git;protocol=3Dh=
ttps;branch=3Dmaster"
+SRCREV =3D "1963e57bebfde420baeecbb2c6848a2382488413"
+
+DEPENDS =3D "libvncserver"
+
+inherit cmake systemd
+
+do_install:append() {
+    install -m 644 -D -t ${D}${systemd_system_unitdir} ${S}/fbvnc.service
+}
+
+SYSTEMD_SERVICE:${PN} =3D "fbvnc.service"
--=20
2.53.0


