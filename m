Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C900CD98ED
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 18:37:31 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26289.1781807841248761784
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jun 2026 11:37:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=aLpNSkex;
 spf=pass (domain: navimatix.de, ip: 52.101.72.141, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JrjffvmoyHmtklGDnRrZKXpCkWhn52iWxCsUWUJdFSiJe7ZC3Ks17t3Q2MctAL3kuUeOWsgeKczXTJ9+XUi0wNYwOq4AJ2DDBgFF7xmScb0ECDkPD81R4sPeGmpr1gMxv6u3V7V2WDPY1uzVKt+Qff4/2B+lgng7VUgT79uVoIur5Km+XT1qytl1uEO+nazVjPoS1wzkds6X8C4D9b/xtkVN/VSTsDXe6jZQZo2lZaNLq0aD3mjsO9VMSN7qVoLK1kvf6QvEhQloRlsxQDQmTGkELsYi7gUC3RRDejIyb5ZMRa6XtQK5dCVtOGNb2la7RKuqx70AMy3k/9leEATmbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jl4HouPaiEybkTfJNTTM3Qhr/7Y2xdhfyFY5Vnzrrss=;
 b=IPc1XDWJZ1cxr/is1fRcYnHzuxLK/OUmGYwn//4WCsEIIGHd13KC6LmkmPgWHqZEbx1uTJN6mDm4UPHSXUkBw7b92Sz1fscp/tukowec0jlZOTX8BAxdhtw6SxLi2KcuZvg/PKZiync9/elIHNptWvXX89mxg2Zn/ZQ4ydvfjTFx7k/7tWOmxVokG6/cGSdbgpGjpbLAYRPPFhwtgTXwc/ZJZCdeTZ7V+7lwPs4xP4x9wDLnuU+bwpZC18cL+aJtckJkTAIUJF7AvDpsISj2bh6iUCWsgQ38Q/W/clhD79m6+G0YX+h5hkJ/9fnE8Mmh/oUn6BfaiEmXubZuIX+6oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jl4HouPaiEybkTfJNTTM3Qhr/7Y2xdhfyFY5Vnzrrss=;
 b=aLpNSkexN0GYODVWm2Y6Dw4GrzoUg4oZvC6Y7aNUqChLDZiX/FOaqtSabiHKemhqWqhP+C5Wmzjn0n/8atuNcgk1NqoJjPN6XgV2Zrk1LoparCUWWPYL+O+TgZ/jYQILSIOpoOn4BzR7IeLCOAh2Pyi3WZZXWnnfE3ebOGzLBGs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by DB9PR01MB7338.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:212::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 18:37:14 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.21.0139.009; Thu, 18 Jun 2026 18:37:14 +0000
Date: Thu, 18 Jun 2026 20:37:12 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-devel@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH] atftp: Rework recipe and use libpcre2
Message-ID: <cfb743394e19ccc8ab722c8fcdef37b076ab3932.1781807832.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0242.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8b::9) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|DB9PR01MB7338:EE_
X-MS-Office365-Filtering-Correlation-Id: b270fbe1-7ea2-4d23-da36-08decd689dae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|3023799007|56012099006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	Xwm8+AJpm4OpFy4PhvdfTUbCEWzdKXI4ZmDIyruBSApN1cso8RsjWlG5KqP6+LSvy5BJqN4LwvkTd5sT55Hhyd1S1YSbkPu+xiumqIFDwtnogUnAgVoYsYjvjejnbldk+jL+4AxMjWAMWuhoqcg3Cv+cm316yLFKG/G12MxqtpkiFupkuPDHc/dqDaut0U/q+SqBTSPgQeQG0fsYADISwjGiYKY9yOvBWIzFXAVErO5wsU1itgOHY2YjgkNdMd3VFfLkAMHkQVkejSZCXiXKCL0LYsDZUQTh4lk9vV++VTkkdK1TRbw+T04iigWP3Bbxf57SyefehE+YVN+0DPnHWiccvqCNRsU3ZCuxCMP+Am1xcg6zFiGqwaQVb9A+QKSLWoxK3qrb5fqlLkja/VCofkCDKW8kB+2VmVQQ+2Y7DWuppg/8p01+7ea9Xl1SnM7QC4tCaMdK94KaBBB5+OXftXBfeRWcGd+RsPx++KhlkCdsnkbN7G5/PtNOvyuH1LFCwQ+0bzJMQMWe9WmTCBoGX0P2UvmSz2HRG1MYq6aHetVCBTYVS7ZUIuf0DuaF7dRFWZwMQlovbVQb95ydVYLGgz41E0ffZTyE+HKqk9u0OL24sQrgTA2UeK5lUBQfvqbVr0W7fR1DKuzrg8nk8kdrqw2nwyLA471w0HOGcvfdJ1+StNA+TeXKNZa75BA8u6LZUDkAN5KJeB1EsktEyicDow==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(3023799007)(56012099006)(6133799003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZoW5CfmRryAseiygFRWdZu+mUcrF3Z+XOZEuFnAeYrHt+/l82q2Cb5i7unCo?=
 =?us-ascii?Q?ojrs1nM4NHjdr7UwHRCEywLR8X0GDeGV2z5kwWmbh7k9bobokYpW/H0KVbfj?=
 =?us-ascii?Q?p238sd3jq/LO25xpbCBtTA+y6R5idrwidmwmC4dQnHWth4Er7ZIeaQqxdmx9?=
 =?us-ascii?Q?frKj+wQ52aLkIxXojtpyOmqTYG7I0hNzux6RIjClVeNYXxUsEeY6bX41+0OH?=
 =?us-ascii?Q?tLz9wOl9XpC5/n9j8w7EmHTW/KMxdHNmMTy2+EZPSEh2vuJObNPwhwmsnFXJ?=
 =?us-ascii?Q?U3O0hqV9JdDcuMD7gNoMzDsbcjKeeXwssZj8uXBLbgHH68ATvyPWui4JnHzl?=
 =?us-ascii?Q?M5KqZOr/zsishOosR3v8v4qHrAI+TSzvzXbP29K/kZQZtpuzI8nmpsio8nxf?=
 =?us-ascii?Q?KsGzLq0nrpv6RUyjG7sx9bfr9yyaoEfgxExZjffiIad9eEC2gUKolHv2NpWr?=
 =?us-ascii?Q?bWrhk7/jX1AnEZ+QeHnEeQmZSrK51s20IeAxNM0NMcDAkdpidJ0tq+NeIUpQ?=
 =?us-ascii?Q?qSv3Glk5DzCEEnLrJ64yhAXgOyPO+VU4pp17Rtism3hnlgyiV06lx66mN1DC?=
 =?us-ascii?Q?iRE+iHtJNe228BCHFnsAb604MY14q5cmSyJUhQ4eFRfxE4FBJvIPoMmKoSps?=
 =?us-ascii?Q?/7u2lqfz+s+UKHYtjm8do0KSdFrzFBGYCbsRvjUNVmP9HPXMC6hlYomrbcyz?=
 =?us-ascii?Q?m0UHZHEUmfG8OJrJ4+fwDr7jK6Ywot6imiOv8gUQOO4q35p/86Cg49pEj0YA?=
 =?us-ascii?Q?frw40wFb/b5CEkY4jxqj+CQMKknb5klnT7xwbW+fMDCRsenYtIm4+Lrnlzqr?=
 =?us-ascii?Q?ez2267RdCzDLl2KpYLEDJlhUkeO0RVEkn/MX3XQKfmnoBkc3Z8DI8RZ9EoCJ?=
 =?us-ascii?Q?r4waMUUhNuxDCMoRxIA/hyovgyOW5jMksSILIp5hdgM2ORJqePVQyvzu2yc0?=
 =?us-ascii?Q?mesE/c1YEa5F4SP0QW6S4H9P3m7Xt7Jazz59r0DfESMk2++5CP0KMi5Jq7FB?=
 =?us-ascii?Q?c+rWTYxmzi+y5IMADEqt8jUI9r1obaZWjTeJK6Zgg1QcFZd5MXbq1H/3DAZH?=
 =?us-ascii?Q?cry+Q0dSd0yCgVft/te1udQPZaOWXzoY5JbSlY9Ry85+J5FRsM9keZYPl88V?=
 =?us-ascii?Q?ZS3NIoMJSKfj8SoLfDGoGtvhg5bVkuAASgQdB9r3y4kw5mtCNRHFAJhO25XG?=
 =?us-ascii?Q?sZujmAbPVSOow7uZdnsm2uKO80b82elgGfnwIUG6Ab3MaB+skfWQJhYIXJcv?=
 =?us-ascii?Q?rVVPyrwDOZ62Q/soM+6+sEOs8EZUqnGgalbqr8UCCh26VZDqgv5WQ2Rg9aQU?=
 =?us-ascii?Q?dkgK+9nyk+1i0cpjKvOunzPKXzaBYMVNAI7+eVTgR3CuSttoxZweJl4j7NLl?=
 =?us-ascii?Q?x2fqMac4X17VFNUaUs8dyvoR3idh0dw+W79zzOhOEzA4b7C8xtGUfAUuPOd2?=
 =?us-ascii?Q?ilwyO5/Q2Otp+yEKV8XwuJNs8sSfBvUiGlO3G3mTZo9VAanYX0KjekdH13j8?=
 =?us-ascii?Q?pTPI/MSTC63daF/ymSFTl+i+n/bno/s0eFhg+4LzSFjh6o7pLu0hKyXUJRYV?=
 =?us-ascii?Q?X23zugylpHep8WLst+UgftFWYMK9uQT4sfZ25WxIRQwcmkjidcQJJw883fgE?=
 =?us-ascii?Q?E5Ku4H+qqcuuBEmEIX8eYaFiHQswz8yosn4J1O9eVJ6HJBaxCEiojXi6uejo?=
 =?us-ascii?Q?WdUMZSYxkpHAztMHctrGVuKJ+2sh52E9dnPaYINWOLEaGaIDZ0RDioBOyxuq?=
 =?us-ascii?Q?ulqxBeyEu21ApyNNscyLMpUWLSZ1Wzo=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b270fbe1-7ea2-4d23-da36-08decd689dae
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 18:37:14.0482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OaN9i12Ku+sqos9YUWinsQcbMoMYuLgRfVAO5zRajkvEnl2+gj8vmLj6P7fuEMu57oslzxYWC5ex6hQX2RW7ZDtg4beABFSvJgVFXvs2WYU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR01MB7338
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Jun 2026 18:37:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127666

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

The Debian package page is not the appropriate homepage. And we can add the
bug tracker URL and a description. Configure has some more options we can
expose as PACKAGECONFIG. In INSTALL file in the source repository states
that libpcre2 (instead of libpcre) should be used. And std=3Dgnu89 is no
longer needed.

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 .../recipes-daemons/atftp/atftp_0.8.1.bb      | 24 ++++++++++++-------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/meta-networking/recipes-daemons/atftp/atftp_0.8.1.bb b/meta-ne=
tworking/recipes-daemons/atftp/atftp_0.8.1.bb
index ecd55684f5..be40302a3b 100644
--- a/meta-networking/recipes-daemons/atftp/atftp_0.8.1.bb
+++ b/meta-networking/recipes-daemons/atftp/atftp_0.8.1.bb
@@ -1,6 +1,13 @@
 SUMMARY =3D "Advanced TFTP server and client"
+DESCRIPTION =3D "\
+    atftp is a client/server implementation of the TFTP protocol that \
+    implements RFCs 1350, 2090, 2347, 2348, 2349 and 7440. The server is \
+    multi-threaded and the client presents a friendly interface using \
+    libreadline. \
+"
+HOMEPAGE =3D "https://sourceforge.net/projects/atftp/"
+BUGTRACKER =3D "https://sourceforge.net/p/atftp/bugs/"
 SECTION =3D "net"
-HOMEPAGE =3D "http://packages.debian.org/atftp"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D570a9b3749dd0463a1778803b12a6dc=
e"
=20
@@ -11,25 +18,23 @@ SRC_URI =3D "git://git.code.sf.net/p/atftp/code;branch=
=3Dmaster;protocol=3Dhttps \
            file://atftpd.service \
 "
=20
-
 inherit autotools update-rc.d systemd
=20
 PACKAGECONFIG ??=3D ""
-PACKAGECONFIG[pcre] =3D "--enable-libpcre,--disable-libpcre,libpcre"
+PACKAGECONFIG[mtftp] =3D "--enable-mtftp,--disable-mtftp"
+PACKAGECONFIG[pcre] =3D "--enable-libpcre,--disable-libpcre,libpcre2"
 PACKAGECONFIG[readline] =3D "--enable-libreadline,--disable-libreadline,re=
adline"
+PACKAGECONFIG[wrap] =3D "--enable-libwrap,--disable-libwrap,libwrap"
=20
 INITSCRIPT_PACKAGES =3D "${PN}d"
 INITSCRIPT_NAME:${PN}d =3D "atftpd"
 INITSCRIPT_PARAMS:${PN}d =3D "defaults 80"
=20
-
-EXTRA_OEMAKE =3D "CFLAGS=3D'${CFLAGS} -std=3Dgnu89'"
-
 do_install:append() {
     install -d ${D}${sysconfdir}/init.d
     install -m 0755 ${UNPACKDIR}/atftpd.init ${D}${sysconfdir}/init.d/atft=
pd
=20
-    install -d ${D}/srv/tftp
+    install -d ${D}${servicedir}/tftp
=20
     rm ${D}${sbindir}/in.tftpd
=20
@@ -41,9 +46,10 @@ PACKAGES =3D+ "${PN}d"
=20
 FILES:${PN} =3D "${bindir}/*"
=20
-FILES:${PN}d =3D "${sbindir}/* \
+FILES:${PN}d =3D "\
+    ${sbindir}/* \
     ${sysconfdir} \
-    /srv/tftp \
+    ${servicedir}/tftp \
     ${systemd_unitdir}/system/atftpd.service \
 "
=20
--=20
2.53.0


