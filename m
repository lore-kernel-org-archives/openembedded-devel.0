Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C74F7E7719A
	for <webhook@archiver.kernel.org>; Sat, 11 Jan 2025 16:37:17 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.127])
 by mx.groups.io with SMTP id smtpd.web10.18751.1736613433108478790
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Jan 2025 08:37:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=sy5a+c3d;
 spf=pass (domain: navimatix.de, ip: 40.107.22.127, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VbADq3d3wnH80svg6DiiT4/5YLPDZRAWlPcVS1uHWBu6M/8QiCgIhZs94FsovvYEGz2BZPsGxA536LkEtC+hx48r4g5ym5VcjFP3WhUA2L6hN/i0izbqVC/Yp6l6BBZCWN4eHNij7td7KexEbaEywnLE+dC57QGtQ2KsXumB2baXxtKnPug8I21o7lTPgr7AVl/3aRY6xJ/bE+rDCN9edGugbfVb0a1SeLH4Au2bTIwMKLzsQn0ujs7uhHlxwMF9Ue0NjzJdLeLTG4cPD6ihLbzNGbh++J2813ZnTn+SIC3O3CgM2EhssXRzJdKlQm8jeDMLvPMO0nsV0+sAtc9OYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=skOYKMsd6N/2Swv5ohY09ApPeemKd62leC2bAKA3gnk=;
 b=L2ey/PNUpSdexTA79sUyirvfXC5itQQ4yef+UwnnbldixIv+3jC1P0a2G0fkmhrSqtWyT6UELjrCp5F/ijl5NVvT3sD1AKaYuULdCuogHXPFidwCOzx+sxB7u0CpDGL99PsWQzqIRrAWzAgEoNrzJYxsqXvlqPoV4er5IggOhbvtqqO8iTUGzZUuHFvpLbLkYSDJ3TqEae8aT90fta5PBndVJCEEWZ5F9FK4b6Sl0YTYKoXAle1V5SQ5cj/SDr/uqqiE5r6yPj7mUWhIyRx7QLREUOlnNVYMI0c7tP2o2YJWaz6YfV+GNU6RB8A78kJyeMPtXwZejocGyqBwxXTBXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=skOYKMsd6N/2Swv5ohY09ApPeemKd62leC2bAKA3gnk=;
 b=sy5a+c3dm5MMNf3QphYH9t0PPLNtNroXc175K0n7cc2ZXeTE1MhZemT+vu6qG/4NrzWRXis71tSOlbL3PdSVIu3vd4lw4xQnd/Zj2vn2zcUuw9/PmU+y72oXLyuFP+CjzMuueU4Lj2OQIcv4l9TMDmEKEuxBwSJg5xTvHKfNs28=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by VI1PR01MB6367.eurprd01.prod.exchangelabs.com
 (2603:10a6:800:154::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.14; Sat, 11 Jan
 2025 16:37:08 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%3]) with mapi id 15.20.8335.014; Sat, 11 Jan 2025
 16:37:08 +0000
Date: Sat, 11 Jan 2025 17:37:05 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-devel@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [meta-oe][PATCH] spectre-meltdown-checker: New recipe to check
 hardware vulnerability
Message-ID: <e26acb8229abc26b88bcaa76a54829e9be2b2ee5.1736613424.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.45.2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0107.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7b::15) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|VI1PR01MB6367:EE_
X-MS-Office365-Filtering-Correlation-Id: dedc0ed7-07f9-4075-daef-08dd325e30d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8YKPYlrmVA5h0eCjHhQvqKcSSodr1Ntfk4Y1B1UODp4JXZqKtNLxnZvJfKk1?=
 =?us-ascii?Q?OoAaLodGhl/hnwD5nA74mXO+dNzS6pInTd9Ciy//DBCkmYy4KxVDXKxWZ9TU?=
 =?us-ascii?Q?I7Ex9HVG5WRMI9pTnl+Wuj3nLhTrkyiOBcwu6yYuK5CVBhbvR/OMspr6mO/E?=
 =?us-ascii?Q?2nZnUjkgY6rXoF3xAbWaJ78FId0MkxyXOEDXX0BA7Ar38N0br8oUP2mn7zjP?=
 =?us-ascii?Q?xwJ0v7GvfZW5TAJZuYXI+N46hstzLW8X89ZTL6DQJIVIoLiNsTrs2XTA6qOL?=
 =?us-ascii?Q?J5LnI0gfnoM7q6YD6TZaDGqKls4OfXxiljfUM01d4pP5O5WGV/07jRmWCJdH?=
 =?us-ascii?Q?mw1DJfRr2tCUXdMRtRi3Jh1eO7syNILaoe8nNmc+Z0n2onb6jlV80/ggaeTn?=
 =?us-ascii?Q?g/HgfLCJE/ZPmyZAY6J3xUjEKjvjZXbzj5YwzX/7rw/5EV6D2S+GAoKF5ELR?=
 =?us-ascii?Q?lBcDyTUu2YBIZUNVlQUTbkIEkl3Vc54mexayTu4wjnu8TCsbkKVhE05X4LDu?=
 =?us-ascii?Q?wfJ/1yZOkYBm3BPB6t51QNIS78ATXaIAqhBgjsMNUv5oBDvUCKZM2fN7p43A?=
 =?us-ascii?Q?9FxHJyHbW6tQhg9yyKE1dPLOUmr71YYclLWI2pBFb952vXJKTdCtrOEryvox?=
 =?us-ascii?Q?OgW+eFQ9a8PXq08fCpfow7pGXMnRW0Gqrxjed2ljTJXV5aU+6nOaySKUPjKF?=
 =?us-ascii?Q?lCp29xKRM0H8S/mGal2Y4eZz1WOXZpdtUpmh+xa4wyufcJWviXAUNL7uWkAm?=
 =?us-ascii?Q?mNOVS0YO48EQyPD6IPeknBhUeqmX+52/mVrGBjXr27pqjtb6o3A5dmXuItYv?=
 =?us-ascii?Q?6VdTXjdBwIfpmxjNyH57w/1nZdrnVdeT0u3zjXA/PRDDAXL4pasjejM2WjWb?=
 =?us-ascii?Q?FQYCRY6ceGbLxLYf+cjZypNKuibGIqDeg0WM+W5ovFAo+W2OLT3b8gbh1vuh?=
 =?us-ascii?Q?oxV2IoXm8ligh6zoIhNJs7Vrz68qA4qScSrO3fFJl9Pewy8xUNgRjB7lPLvh?=
 =?us-ascii?Q?yaGKjcqrjqs0Z7Jw5kLasV1LPTAgFmPymqrNlBd9rgET28kKtObA2f6jXYU1?=
 =?us-ascii?Q?isHNEZk8KHREx3OL6hAPlGaq+WqWI5uhKdA6qPOUSosVZjWon+mzCPk9NlxC?=
 =?us-ascii?Q?CqtipKwyYtw+n+0lfS2NOlWI7C1hkCuZCOyzVT1xEOuHGStBdOv2NMx/PPRp?=
 =?us-ascii?Q?KIGy2dONB+K1voAh2thJfUfzKMB4M7Nv1/CdnhINgcPcW8tlXcArDhe0ufiC?=
 =?us-ascii?Q?T0cKHEzn3MJ69HNVD9j+T61wktpmufjHrWarmOwfnY4iEa3UxB8Trn3Gi0ka?=
 =?us-ascii?Q?AE2VMM3jV/GUUxBA4CunIVau?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?W0O+yi/LBr8zSTZknvX0SHoHTwwJo9zdf5XHKnvWoyyG4KAt4kGLk2vvGwOx?=
 =?us-ascii?Q?XheF3Xaa6BcaZ0HQp7Ruk0DjWTz6bJG3jNGSxW1llkHuNlNDKUFTyJ1PR1Dv?=
 =?us-ascii?Q?iqVa/10xjiUlWbWCs2njQ4UCQoRW86ITYl+gvoFV45bJXd3E3w5KbRyo4hwX?=
 =?us-ascii?Q?IBi0e2GNnVZS+o/kgNqShi32jY8sOQpMIyXpHMSwA3K2YmQ4vqLfBbQXNbhg?=
 =?us-ascii?Q?AIbgFyonY8CRniZDB413eXDCVFz45eGV1NbZelTeFpaOuC2QgbMUFB+qFMIW?=
 =?us-ascii?Q?7MlQ59XPuapcT+2hSQQx/y1nFI2WkUctFWhBLGO4V7uZpZAu5kuhFA0SMVJR?=
 =?us-ascii?Q?jLBAQEdcUUNO1j6h1PNvc25CTsbx4FhcD0LhSqjqU+qkEcgOoFe1nv1w+SLG?=
 =?us-ascii?Q?zz5XE/gam0D4EeqyhRKPqSLJ8P4MasTWEZJWZbXf3TzmuP0TRwWELRNssqAj?=
 =?us-ascii?Q?DEKxwNNnXh+9Si4va0D3Fb63r5VJAhkjZSk0kdO8PlNaK6jhjQ+cn6eHWeoz?=
 =?us-ascii?Q?CLiAKmiNkNGoXb0zFFWES6BjFl5StejTWc0Ofz+ommW6OZlGl72tJuD6uYQW?=
 =?us-ascii?Q?kF6xYJzMuAzwXyCl7KQZpG7zorSnapA2kIUjMU38Swb64bip7U+wNmRux3+a?=
 =?us-ascii?Q?6+9GBpwvA/ZXH4kV5WFVn2UFHr+xjti+c/mvANk1cndXZmO7FhVFdUbb5/UB?=
 =?us-ascii?Q?KkaI3DBNW4xLxbP/9Rn688U6mR2FfzLtJEh5jLMK+nqr7RhZyxavp/9VaL79?=
 =?us-ascii?Q?bVpw1cxPdrrBmr4mxrSgUW+EwmnZwVvK+bSFirsfz+Vavr4b+qoORO3c8PgQ?=
 =?us-ascii?Q?fr+Vx71JlKl8u2hNLeKt1PT/tVi3fsurWBKps0x4Jve0t2rQE52JwzxE1RsF?=
 =?us-ascii?Q?BqWw0fjRGdvx55RrBECSK1nJ56qd0v8k+VoxwSUcDOEfYZ6dQ7SLN4/XbgoT?=
 =?us-ascii?Q?V3RebSGo+ZhTNRRJRdnsGKS9QTRjJdLwKFGepgYh/nJnZmFwGXEgXNEvEizK?=
 =?us-ascii?Q?kQweQ+W1c01u1bfIWjNL7oz4/cZydU/KgDTWoJwI5uAKSkOUrdnoKsc0df+8?=
 =?us-ascii?Q?O5HgmItopM1Ykh/FspR/6FHTlmmj0OHaCYVInb8SPbNWNaDfKr1EBtLErt8c?=
 =?us-ascii?Q?5QaU8xNIxLJ7tBnUZAXjk86qEcwXtvg8GnQJq270g9TF0iSTQYy6spX+ekzF?=
 =?us-ascii?Q?+WHYCiE1WnXN3ofjcHZT3/ARSMAvHiOfDnRx4SkjraxPGsHO71hoePKIXL6h?=
 =?us-ascii?Q?yF89DuLFyG+vDKpmLliG7FrDiHakPokbUkCJY2LE0sorKbx6cXzSb2LIh1td?=
 =?us-ascii?Q?Ha8IZoS+CSF55K8kRIBuK6dLzLKpJM77LwzihMoYSPMh8t2QhAAqdVG8Tp3w?=
 =?us-ascii?Q?crRWIIa8ppP6NusimA7kk41CqpM4KVHsoXbUtBF6/7/1oOdZbgyJ09u5VNSU?=
 =?us-ascii?Q?dSmTzUVqaPYlQXsL5LVhSYuX3BkrbO6DZ7zNByIuHikV0skLQGz4HFS1H4vf?=
 =?us-ascii?Q?M/+P14JdMf/tL9X0Whg4xBCQ/3icLzgvhte2TCIIbxjJoxpRAxjreRy1jP7N?=
 =?us-ascii?Q?uOxHumy2DaCgBRLczt4hWa39uuvSN0gKoRv1Wb027aikrof2VlJ1Mm/GUixK?=
 =?us-ascii?Q?dw=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: dedc0ed7-07f9-4075-daef-08dd325e30d1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2025 16:37:08.4940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v38RJdMmXsoDpeilZ/YsCK0ruKCHzRQDo78JkEK4osZDzwhk9Sg1YfZHB42WOPDoQX03IOShBUVcOZIwHrWVZo53koW2aGtmDySX82SRwNA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR01MB6367
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Jan 2025 16:37:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114816

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 .../spectre-meltdown-checker_0.46.bb          | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 meta-oe/recipes-security/spectre-meltdown-checker/spect=
re-meltdown-checker_0.46.bb

diff --git a/meta-oe/recipes-security/spectre-meltdown-checker/spectre-melt=
down-checker_0.46.bb b/meta-oe/recipes-security/spectre-meltdown-checker/sp=
ectre-meltdown-checker_0.46.bb
new file mode 100644
index 0000000000..c2996415ad
--- /dev/null
+++ b/meta-oe/recipes-security/spectre-meltdown-checker/spectre-meltdown-ch=
ecker_0.46.bb
@@ -0,0 +1,36 @@
+SUMMARY =3D "Hardware vulnerability and mitigation checker"
+DESCRIPTION =3D "\
+    Reptar, Downfall, Zenbleed, ZombieLoad, RIDL, Fallout, Foreshadow, Spe=
ctre, \
+    Meltdown vulnerability/mitigation checker for Linux & BSD \
+"
+HOMEPAGE =3D "https://github.com/speed47/spectre-meltdown-checker"
+BUGTRACKER =3D "https://github.com/speed47/spectre-meltdown-checker/issues=
"
+LICENSE =3D "GPL-3.0-only"
+LIC_FILES_CHKSUM =3D "file://spectre-meltdown-checker.sh;beginline=3D2;end=
line=3D2;md5=3D3ae5399e70af7be9b93f72568069e2f4"
+
+SRC_URI =3D "git://github.com/speed47/spectre-meltdown-checker;protocol=3D=
https;branch=3Dmaster"
+SRCREV =3D "b8f8c81d519435c0871b13f02b5c4a72c5bffd5e"
+
+S =3D "${UNPACKDIR}/git"
+
+# binutils: readelf,objdump might be used for deeper analysis
+# coreutils: dd with iflag=3Dskip_bytes oflag=3Dseek_bytes in some cases
+# kernel-dev: /boot/config is used
+# perl: sometimes used when other tools (dd, rdmsr/wdmsr) are missing
+RRECOMMENDS:${PN} =3D "\
+    binutils \
+    coreutils \
+    kernel-dev \
+    msr-tools \
+    perl \
+"
+
+INHIBIT_DEFAULT_DEPS =3D "1"
+
+inherit allarch
+
+do_compile[noexec] =3D "1"
+
+do_install() {
+    install -m 755 -D ${S}/${PN}.sh ${D}${bindir}/${PN}
+}
--=20
2.45.2


