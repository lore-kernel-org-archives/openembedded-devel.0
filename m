Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 646C3C5320E
	for <webhook@archiver.kernel.org>; Tue, 20 Aug 2024 07:07:19 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.109])
 by mx.groups.io with SMTP id smtpd.web10.12914.1724137631585265277
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Aug 2024 00:07:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=RtX+qRLO;
 spf=pass (domain: navimatix.de, ip: 40.107.103.109, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h0vltWRCDbdV1jK5+7FIYmC9YrGXjhC2tl0SPL4MxFQdiVtSWnGTsHLBpTDjXKRx102z/3vxNQh7tZ8aLQfL3Q0JSnNvPh36lRKojjLfkceoU41oiV5GFm+XO9tHzZBfov9k8OQQcbSPwiKgGax4ZfSTyN5Jh/Fg7oJDTYo+3vvJd12galw1KFGxw24835zNDrNKuqswg/68hPI9J0L4l0yJvvHaTkEr9NhZs8eMYlIK/zsdNdbfRo6iuDjWUwIIZLQINgWEU0MD1545xypVPvyVLDyQQzkv8cgOhx2WTQjutPeL9THbiq800GiKq0Jw/Z/iHIsEcGewS3bUoYDzYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h/lABjzyRJo0aH8KyQIWRCcXAMPn+JoQcmmoKoFJg2k=;
 b=IMuuEjwQE+A2uOGyl/Mtf9rnJVcT7VJrHQJuLPV5pFKQqc7+JYWRKOyZr451SHgOAG8i7oTAaXGODH+px+auFCFHRCmNYfl8t8gaU0BVcw4dGGZ5y8JHj9zMXaxbNBy1wQOukycloWWYQ0U5sKK6rOZNzWhDkm2Rb0XOybXW4BvDDafV9dwbMhWxE/ajQayFv6C8P496iZJgvPC8VchMCLBRiGyHzv1SDzHFttyrONXCifPzIc3Pl1/r6ROfiM4L2ktT9ykHdP7IUm4zVaGOmS6kIevKTjcNqWSGV4Fh5V5doeXqzroEvTKgmT2HG3f4ROILodvDu+4leqP0TYdveA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h/lABjzyRJo0aH8KyQIWRCcXAMPn+JoQcmmoKoFJg2k=;
 b=RtX+qRLO3t9DkfSNeD9+XnIQ8HDl18uQzMNLOo0BI/rk5rzdlhO2+cOWtwM9ZWW4QBuRLiqeKbxx4R7rIZdt8Wj7davs/OycD/71NF8pXnQUEglX/Li78n7/qnI05FR+pPtavFSnJcFbcIlPpRG8K3HnP6zPCLlxeAttWeiKT2w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by PR3PR01MB6987.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:73::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.16; Tue, 20 Aug
 2024 07:07:07 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%4]) with mapi id 15.20.7897.014; Tue, 20 Aug 2024
 07:07:06 +0000
Date: Tue, 20 Aug 2024 09:07:05 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-devel@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH] gpsd: upgrade 3.24 -> 3.25; new gpsd-snmp
Message-ID: <e488f05abd2ed28e88c8e82fb7f74dbcb441c6a5.1724137623.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE0P281CA0020.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:14::7) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|PR3PR01MB6987:EE_
X-MS-Office365-Filtering-Correlation-Id: b04de73d-11b1-431f-5cb1-08dcc0e6b390
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?iBJlE0kQSN3suvVQiZ0TEXaJ2twXRQIVajQAyuRUT9SnwRQLUIaRcm8/F+Uj?=
 =?us-ascii?Q?hG3LAGXF5muKDCgz49Vt/ayWvHWWgeUV51qkgJAP7tCkNkzYVZE5aRhZBGkA?=
 =?us-ascii?Q?6gPUREkr5cMV9ImXLbaXCe6TKB2XKvETV2BUkNuCCGcTaej5ljWgaCO1FIL1?=
 =?us-ascii?Q?B/5S6dVT15zkdklr9w6YkZ/LbpC+zdM0HCV5kQx9Ev/+M2PWNn1+8iZfV5MU?=
 =?us-ascii?Q?q2fbsyEW9vcgSG4JJ4otoD4xGjuHDgOotItWQBDERCC4cTSA26DH1khMmnSH?=
 =?us-ascii?Q?7ehCVnCcdCuc+36gFttGmzfEdfCMh+NwDZ8tbhJwLE074qkNdZvIadYUwqzz?=
 =?us-ascii?Q?NaDydmwi4pZXjREeSx2zU1KzjDnsT8FoufOE8t7qK/jw9WEzckSGReWaNhbo?=
 =?us-ascii?Q?nhYjxYXuubBjGPI5+lpfq8WBRODnzw7joNJkAq4kcF3urEyUNv2WDEoSK4Yb?=
 =?us-ascii?Q?sUWhoiIPVThlLkOI9yMIhtkqZv71o4mlEbqa4+Y8YcwWC/wAL7y8omnFJD1o?=
 =?us-ascii?Q?R6bXzbxS+fxTKx4skg/xEqlw20A4JFhWdbMee1xnPRLwP8cKsi5A5fTyoXfa?=
 =?us-ascii?Q?5dc3FGxK0F0ZS6528omhJuIFqH87Ohm/7mTQz5LFlPZgnq+sSeEKDJ0atUZZ?=
 =?us-ascii?Q?xe+5M31FiDjXt2bPTwKoW5h0yWEcpHWF3bPLnlzhsVMhmjZBWZ2Djzxx1Ieo?=
 =?us-ascii?Q?HNRBKxCjZezUVhSYg86aY88bM/m/re2+1ziYGfCN08wVFIlLjMFhQRWV7Gxs?=
 =?us-ascii?Q?GGcyZPOycrCak9DqPG3Dtsg+MCck9rrXOc3HnuSupB8aoZp4EMA02o73SipC?=
 =?us-ascii?Q?29i+Afw9esK9bBA/+5h8QgI8vq1XfnLb1+2ENgs5Hgdm5emYHRDTxnwnSc3D?=
 =?us-ascii?Q?ESANSQejum0BRlSGNhbaRozOtoSEzlfxzQ32fIIkP93Y5OCqfj+qXSH+RKpk?=
 =?us-ascii?Q?GyuWNFKjZsQTFprZFXT4EZG/SXU8lqdrP3wAPDPJOWWukcEaLHfYjO1VvWQt?=
 =?us-ascii?Q?OZPOO7URVnhQtI/x8urtilE/wuyEAtYhmToJJa6QIZSCaHCY+sWKyqO6LzUc?=
 =?us-ascii?Q?x+QOpvL09gYrIQApFNNX4rFStmo9BPYZlFWJsenJQowodu6Ml5Dwk2nrR8IX?=
 =?us-ascii?Q?XwBLJodqqtcGPL/WDjuifjOw64xoIUy6jTx5onEd7gTXuu86aEKVeCO9Qp7L?=
 =?us-ascii?Q?83l+k8m7MYw+w7S9YoknOqLNKsdgnOcgxfa/qAgMT+VgN/V69sXspu4VURKi?=
 =?us-ascii?Q?61jIiNdv3HtNavk8Ow5vPpJKQAt/gGDUSjpSTAGxVeML9IFEDS6qUF8TMWOd?=
 =?us-ascii?Q?vgvr4liGiRqvUi8ymsHRSgkzxBxi9lTiRa5jjsFjLpwysg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?aHg2H9nBHbDfeMdaga+M6YoUYnayjwQHfccAbLgzV8MfJOdVi1T+7iy3B0gd?=
 =?us-ascii?Q?s5v7kkPcJ7HW/NkrLbglv351wiUR/vWwsk63u436X3h0VpJkLNsf1X3WTt6+?=
 =?us-ascii?Q?0ZsCQ2UHrTKtKZGhc8lGtkw1Y0MJBZKeYQpOhQXXw62xkb8jNwAXxhd3GkP+?=
 =?us-ascii?Q?4r33HuIFf82+lJiVG9Ik40SAg5/Nzzv4avyhPVwJKOBkdPfjQbmXH10yncTP?=
 =?us-ascii?Q?JQu91MlJG9Smm1pMz5aoG42du40iN66JjICSM1Qdca0P9RqMytTZYaj11R3Y?=
 =?us-ascii?Q?IZahSn6wndjTaVIh8SZ73puya9AwQ4EYagHnQk/V+UdA3beeS+VgqmpbOPFH?=
 =?us-ascii?Q?DnLR+RMOAXwOUURHSHTox/sJKAFqbNiGaN/eLBGLyxk0kuPBSSxRKChZTIvE?=
 =?us-ascii?Q?N0jnA4R6I0Ko/lDJFyWqGPM5pa58N+j5sB5lDfMwZqvr0gPnzBRfwiXXONWZ?=
 =?us-ascii?Q?HA+K6iLDzhfOPJ3Wha9V8tnw2FNN6GyYQhVukUb39D2PHtSiFzsTZb8RHdOe?=
 =?us-ascii?Q?OmaE6mR/kGweLdEmev5NwZB/zKazM8nQSG6CS8mOhr8vxhLRf2rcofA3aWBv?=
 =?us-ascii?Q?J+YhyPy/FS6as90WcCT4SP0SC3WW8d/ulfNOwGzPPf5OjKfdo5tOgapTc5zi?=
 =?us-ascii?Q?0wObSghEYKF2/Aor2ISvVAYBV+T0295fjscmIiptqFWN4ixb9030g7i0XXXy?=
 =?us-ascii?Q?irEzm9qJFCJgbbWEIEoB+7ynHL7uFRKTa1t9BRb+ly+zerlnQid7ZP/5oH8c?=
 =?us-ascii?Q?VYpPeU7ftjuuRSOUqWo3LWfheYfGtqDJjCEW6kosmb+omlTUOOA+P3cIQBRc?=
 =?us-ascii?Q?H2c8DixJgqQwa5SOX0ZvznAECUyUBuyBJ5uEkGvLhHH/jRmkMExhkzD2Mb+5?=
 =?us-ascii?Q?qUgcj8tX0PLYvHiUoYgdEhvzFaZ/vJSVcIoCxN0jfDtZgMHm7zJzsx+oBVzj?=
 =?us-ascii?Q?eGSOhaYoK1CPZSnlxTFwJik+t+cpZ5Fwj9PU003fkDbte8NGoxhzLSCMQ6BG?=
 =?us-ascii?Q?1i63WC6d+LYX7AOpr1Ts9qGUg8DlUuF338nUx5b9uGk3ZK6dtbdzh0WB+HKS?=
 =?us-ascii?Q?XSbk1834Jr36kkeVtx8YoEMxI1S23cd87GhEO1ZZSEQJMAA3pJI+eD6e8kU/?=
 =?us-ascii?Q?jltKWsp+F07F33hSLPjxWNsnOHztol/JL/+zKlKbwpuM3j+x8xa1E+d3UqJw?=
 =?us-ascii?Q?FFNFDjxPLc/QNg6OVwtM8MYL0QefQyqwQH4QcPfK9LTrLRFwW9a/mwRTDU/w?=
 =?us-ascii?Q?cfxO+cNQXcscdLHi97ZN4xzCyKS74hyR87VFESNtAi1mGKyemgGaA+okjYU+?=
 =?us-ascii?Q?SPGQKm50ON1scU0E30dZbHNesrn3YPFuaUPR1YS35gfyp3NMT7qVUM6jPCHv?=
 =?us-ascii?Q?I45Z6emyVLzieET4NmvAmfJVrN3QKLJxvpRtGNGGSqN8vCfWj/e0AdUw31jJ?=
 =?us-ascii?Q?RkdDsjkYTgm0aozKmO8fa0+vj3Q8hwiZb+mUbypqU2vAIEl0knxVpp1xkfsh?=
 =?us-ascii?Q?gchJ/ZzlnNEiiWFwYZvt8hqSkS/IoLRKToK5laa/3210f1+X6/tCu8n+yjtY?=
 =?us-ascii?Q?HOBYXKfMBGPUxD9w++zqVI29xDpg0FkWdjZ40Pidw0zDJSGCvpUhuvz+Vven?=
 =?us-ascii?Q?og=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b04de73d-11b1-431f-5cb1-08dcc0e6b390
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 07:07:06.8359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zG+v1DdnMHDBGqqfhIoA1faGNe+cnh84Hqzweqz5bCf5xl4J29Y550LLin1ofyUAZe3FcoQnW5L6g5q+rSQYHtqsqFu5JhlfM/Gk0SpaEu4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR01MB6987
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Aug 2024 07:07:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111864

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

This new version installs /usr/share/snmp/mibs/gpsd/GPSD-MIB which is
packaged in a new package gpsd-snmp.
---
 .../recipes-navigation/gpsd/{gpsd_3.24.bb =3D> gpsd_3.25.bb} | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-navigation/gpsd/{gpsd_3.24.bb =3D> gpsd_3.25.bb} (9=
6%)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.24.bb b/meta-oe/recipes=
-navigation/gpsd/gpsd_3.25.bb
similarity index 96%
rename from meta-oe/recipes-navigation/gpsd/gpsd_3.24.bb
rename to meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb
index ddea8ad2e..3d817172e 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.24.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb
@@ -8,7 +8,7 @@ PROVIDES =3D "virtual/gpsd"
 SRC_URI =3D "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://gpsd.init \
            "
-SRC_URI[sha256sum] =3D "00ee13f615655284874a661be13553abe66128e6deb5cd648a=
f9bc0cb345fe5c"
+SRC_URI[sha256sum] =3D "b368b6a305e3f7a6382d23a0cbfc1d78923060b6b7f54cf798=
7a73c7b4a9afc2"
=20
 inherit scons update-rc.d python3-dir python3native systemd update-alterna=
tives pkgconfig
=20
@@ -79,7 +79,7 @@ do_install:append() {
     fi
 }
=20
-PACKAGES =3D+ "libgps python3-pygps gpsd-udev gpsd-conf gpsd-gpsctl gps-ut=
ils gps-utils-python"
+PACKAGES =3D+ "libgps python3-pygps gpsd-udev gpsd-conf gpsd-gpsctl gpsd-s=
nmp gps-utils gps-utils-python"
=20
 RPROVIDES:${PN}-dbg +=3D "python-pygps-dbg"
=20
@@ -104,6 +104,9 @@ CONFFILES:gpsd-conf =3D "${sysconfdir}/default/gpsd.def=
ault"
 SUMMARY:gpsd-gpsctl =3D "Tool for tweaking GPS modes"
 FILES:gpsd-gpsctl =3D "${bindir}/gpsctl"
=20
+SUMMARY:gpsd-snmp =3D "MIB for using SNMP with gpsd"
+FILES:gpsd-snmp =3D "${datadir}/snmp"
+
 SUMMARY:gps-utils =3D "Utils used for simulating, monitoring,... a GPS"
 FILES:gps-utils =3D "\
     ${bindir}/cgps         \
--=20
2.34.1


