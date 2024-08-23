Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A065CC531DC
	for <webhook@archiver.kernel.org>; Fri, 23 Aug 2024 05:37:10 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.135])
 by mx.groups.io with SMTP id smtpd.web11.9858.1724391427740118179
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Aug 2024 22:37:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=Jv4296O0;
 spf=pass (domain: navimatix.de, ip: 52.101.69.135, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N/eAMrpn4szjvZtWdnMhJ+3JR9UhWtd5giVWtIvT/9y2DW7dk67PXu2joVxDNDnNgNagtq1+Qk+uOGZURBu4wV/XAVigDIBhbunfss8v80m9sU49eH4Kcit5qQwDU8sUAK6tN5G/JHHe6PV8NjQ0UR6QgelSu2EzrTPxhLtueCiTA92K7p/p6DosWjarLOfETj8XK2Xqv7qpzCZgwjEyOySvjC4sKSed94VsJv+ixsrWpfCzEK2roaZ28aR02tFabWkI1jzb3e+JOrIEPxeu0UD62nVNJW3Ox+20pfcbmi5fdo3Pw3X9JAQ1ORNcqnyUHq2p7tJe8w53B9pAVU3fbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KbTk0wE+v30ZKWxvG9xBrxNO+hKFNRUrlzqAAa92Qug=;
 b=JvDa2+BGOpucEnJVwGkH1GkYqisXvG11UDgNBzJZhZ6Ee5HHim3GGxUQZ/CMxgDfjx86adRFjcrH5xGz0rIqBUGD4zWQXUxuGIBpuzn0M0zk1ApK2RkKoac0TLZ7ggoKEIoTZECRQLd1j6lDClUKL432bBlBZxqoKBaJxrET0jQoocpBK3EyT/AIYJG+5skQyYs1roX3dUj5jI+bpXnXJacWuZ3kV9x9HdRnyzvdLhQzrvlfB8hiICarkHlMeO5fOILnYHKEa+pc/X3V9VrVb3hgJlpNiufdzXjAw9nkOxdte9XAeTOoUrdutofOATRD0bxkDI0pvF3ZFDFYt8ejxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KbTk0wE+v30ZKWxvG9xBrxNO+hKFNRUrlzqAAa92Qug=;
 b=Jv4296O0KrbRO9E0cPSps2ykPnYsA3G/e10KjEKij7BJHzpqEsgyyZGaz01thSz8a1IG4mwGDyp0NkxIbDMD2yy7eepJFm8bfd6W1CGfcJG72ZhaPXRCMA1KitTT2u0J/LJavRt5AduUnye9anSUNykcGHSScBOjkdwGlIwqG+I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by DU4PR01MB11169.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:58b::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Fri, 23 Aug
 2024 05:37:04 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%4]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 05:37:03 +0000
Date: Fri, 23 Aug 2024 07:37:02 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-devel@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH] bluealsa: upgrade 4.0.0+git -> 4.3.0
Message-ID: <88b75d895a22439a271d83df9e66c7dc2a1e75e6.1724391421.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0312.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:85::6) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|DU4PR01MB11169:EE_
X-MS-Office365-Filtering-Correlation-Id: d4422124-df03-44cd-04da-08dcc3359e60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OVMHrxx8ihHCniD3M/q8twQD9jGGQGCSkzs66M2fYW1Fn9Khr+zLoaCuOA4J?=
 =?us-ascii?Q?bwS/rO0aBb9kT83Iw1bar5fzWjlHeyiIcbctFFBYKG4S0NOgIbjagNlFxUq8?=
 =?us-ascii?Q?6qVT2LGojg63o5aDV89EaK0xhIRBjuSHRek901mkDihhEE29T2pNbSGcpQc1?=
 =?us-ascii?Q?D9J1811ryv2/fVViAZGE3VEl9PrmzJDpbKS+MgzvTHHkZaFPQdLnYP57Qd0n?=
 =?us-ascii?Q?mjjqg/NNiDGSs1AJjUbu+wjtMTYQQfiHlNyVIexG/2uG+9XlFQ8f/rk9uHwo?=
 =?us-ascii?Q?wqVCCN4GbZnOT/TRy9AV9O1pbjTVVLRbpeYq4f67G4Pmg/qdtfjwN55KOPS9?=
 =?us-ascii?Q?Ejd6OtEZQNJV4S+JuHTNtMHq2F33WJPMoqoAPxaz/Pv+7b7jNHFU5lX9WHLc?=
 =?us-ascii?Q?PagKTt70NuMm7itvb5mspgnwbsW1LJqNDqOrusis/xzpYL3pilxYHBkcessF?=
 =?us-ascii?Q?DlNc8mjMcdmqvWQ2sy+n2v8v1BfA7bMrL27/mVzzDixpC4+brxHjjg37RGgP?=
 =?us-ascii?Q?2ltDrYE2bArNAbKix8zYQB7BXRFhJh3bFeljgf/iRTXPi6QklElsC2Yg4luD?=
 =?us-ascii?Q?fiHc+4BDe4zN3D1IxPp6sWQkhFwaoIQ5R4ShfVVdlHUTpefOI/tsThTbSJEX?=
 =?us-ascii?Q?8Nf1hApQWiFNEtyG8eQT2xouiO4YRpikZBI5p4g7+iKP/EkjzjftDxKTE1T5?=
 =?us-ascii?Q?nAK2zoFDUbxC+A3cWrx7q1WOjgdrFGzvkNytZ4bAuYfsKGt6yZ8tWX2IJeb1?=
 =?us-ascii?Q?nAlqrGAnTs2Wr432RvZGoL6Vd8YBhLdp9BzTY8G2hKPC3Puth6w+6B6dmG+w?=
 =?us-ascii?Q?DsKKdbn2vTxYa5bhyTkDZTgkW203h5XNe5W8HmGlE2YLdSz+YLQQrLTuWatP?=
 =?us-ascii?Q?wfeDvB+GENbLX3vyJXyBE8k5nY6KLxKbG3mxq87xkmj8k2+QJa5SvSCmDqgH?=
 =?us-ascii?Q?C9RzyjODjKj5q1tVhKHMHW9YICiCmaYsgpBFgnW7UchM0aejAOvW5CT6S0Dm?=
 =?us-ascii?Q?tbLssfdIw9P3TfgXoyDlUZbewIeoOkRjnVp+9dQKhDm3M1kn2kX0vKhM1SmX?=
 =?us-ascii?Q?M+LdRI+v6mvJtiJwitmxgOgCj4mt/jHGhy4RX1VzmENgCY9U/SHqC4I8LP1J?=
 =?us-ascii?Q?Sc2WDu8B0jAoRIb7ypWNzzWSyoQxMPiWXGdtryi4pgcsZCQ1GNystXmnd1UV?=
 =?us-ascii?Q?P9Hd9zvIlRguwBac0znkU83WoReCpBwBsOZc0DGlMzRMD3Xm8bShrcYd/pOU?=
 =?us-ascii?Q?vs2XKX4rtoPo+SoT035iMQUxIvx9vr6I4cVLN2PQrTVV7taxMdt56a+WkamE?=
 =?us-ascii?Q?tBo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ztQhrmqL19r7QSWwguqa4yYJwp8GTIa/nBNARR6lBg2C0DWd7qZ0uE22Vaf8?=
 =?us-ascii?Q?hokAzzH6YkB3xqPl6Ke8DAeSDzNay6lNw0ZkEpPp8zJoAWHaLZepCyisb0we?=
 =?us-ascii?Q?0SlmJ4YrgTbFrj2AxJr8z1byI8rraCC0sYVDqOJftpfNvvZQ7Q4BWIU2ylTY?=
 =?us-ascii?Q?KQl4rpwVR9HjmBZqfMfF4UIOkAQ+YrAIbvLczHB1n5NdU2WWPju3gstGAe5l?=
 =?us-ascii?Q?w3zI8fh7Qx+p/OMziVDRB0V9L84bc5sL6VQt4vlywm1jP/DjKkRZJ0BGNuM6?=
 =?us-ascii?Q?1Yg695jAajRaP8Wd1XPw7wQ50sWoYDe30ExxIwXsUm8O1UBp7nWogCiDQ3zc?=
 =?us-ascii?Q?YN1dF0aszWjOHG34qQCjNXQr2aAI1EfpSjJyirvMn83qv5Snaje3TLyKchuU?=
 =?us-ascii?Q?xd/CtOrDHbFKTt/NoAcseXV4SiG8HdJU1XGFvFMxO7WdO67ik8BE4b+ozsDZ?=
 =?us-ascii?Q?sryq0HJtlPDGZszG9SI9bdGlD+jZCgQ3eLg2m4ABBTI3Z911q39reLAmqB7y?=
 =?us-ascii?Q?vjvlqL/0KF9lZaBU2fHM9oazluLTqB/A/WHZjWO7GiawEWrXEaorZU/KEkZm?=
 =?us-ascii?Q?vCJZdmOXqxCZZkCFhESBd20h3/gwMw9FuJ+eiIOpZ83D2u4NOuSEuCKZCExu?=
 =?us-ascii?Q?FN7NbSdHfHObC7dzv+FgsepuUGiu3xUGD1+YseMZXsMXxU9yHi3L2NDCrc63?=
 =?us-ascii?Q?gp6JDg/OwCMO7d/bS0lm7OnJurg96Oc1XRR6Jff7qtJQXLfY7INY72ZZ+QnJ?=
 =?us-ascii?Q?AzjTPC9nHNUu9sqIxBl+ERubUdjgVJHPwalhkyBJZ967P2JwNkGkAP5tnma+?=
 =?us-ascii?Q?U9uw/WkkIwftzJn8wLcmRBr2wO4GnDPd2pJmWE6ihfDA/Gm6UNMmwk9w4bJq?=
 =?us-ascii?Q?GcRia9yN0Pms0NW4EpZOzI40ELW01+OtVggln7LbodpnXG4+A2CNVSJgP1bx?=
 =?us-ascii?Q?TSHGroMvTFAmFWN2hgh+nwSFWun8LJAefcoLxI8g3oifKV35E6L2XJJqe3CU?=
 =?us-ascii?Q?QOWhdkX0xYP8v1ixFSxVXkdjbLf8WoFpqXNljn/lySeutKYvsDjaQpuFH1a7?=
 =?us-ascii?Q?ZPVZKp1q0kQag4iEjwnwh1PI0yYByXJjnY1/kd0zfbEulAy1Q2rmXSBQCS9w?=
 =?us-ascii?Q?qLNhFQctxhFEZKLpLjtlrF74zAbFV73u/5cLNHDObpjQaCl/OqcshoJJvlyo?=
 =?us-ascii?Q?798pXWtLrEH11g5wqKddCt1NJectCLXRE+RjbE5TPSPzB5fQn7l91Une8iMT?=
 =?us-ascii?Q?BuVkIKa3C9NKsPz7t/kjVRntHqNocrjlsRfWejFVZn0xV5dj5nxBh4aF5YQL?=
 =?us-ascii?Q?8oVNqsgdtcHrYbdHaZyzqxpPIa1twExA+lH97aZ9cWuG598YDCDXnrBPjpe+?=
 =?us-ascii?Q?5I/jvqc1Ci+3VMXJOfefAs8DYiclVQ2HanWlT2OQSLLWlPlMVivjnndosimB?=
 =?us-ascii?Q?WNOo5VxC5L1Wnd7GCSiwaBPf23nxxXMohKYNQ2482oBYIZxUJvjXPnzCphs2?=
 =?us-ascii?Q?Ow2/Ugz4kjt/pDsOW0mcVAGbfh5LgBnMUn4pa9gcycdvdfHGGD9ypI/R6hyq?=
 =?us-ascii?Q?kHX7tMRFLyspcm5bWhbOC1sQV2jcvWHniWHrm4JH5cYvUcXd8dR8DoKD038u?=
 =?us-ascii?Q?bA=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d4422124-df03-44cd-04da-08dcc3359e60
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 05:37:03.8923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IVTcKy9VlaY+tZDb3d/c/7Wob5+GDWJKOCkidX0uja7mRWU5X+5Ja3hSze92oB2S+mj1W0iSmq8DUDqLTFPiSCSlc59e+a7Jd7NNReQGrDM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR01MB11169
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Aug 2024 05:37:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111909

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

The change in the license file was the update of the year in the copyright
line.

glib-2.0-native and python3-packaging-native (with python3native) is
required to have gdbus-codegen at build time.

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 .../{bluealsa_git.bb =3D> bluealsa_4.3.0.bb}    | 36 ++++++++++++-------
 1 file changed, 24 insertions(+), 12 deletions(-)
 rename meta-multimedia/recipes-multimedia/bluealsa/{bluealsa_git.bb =3D> b=
luealsa_4.3.0.bb} (67%)

diff --git a/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_git.bb b/=
meta-multimedia/recipes-multimedia/bluealsa/bluealsa_4.3.0.bb
similarity index 67%
rename from meta-multimedia/recipes-multimedia/bluealsa/bluealsa_git.bb
rename to meta-multimedia/recipes-multimedia/bluealsa/bluealsa_4.3.0.bb
index 5007c88ff..ba43b4378 100644
--- a/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_git.bb
+++ b/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_4.3.0.bb
@@ -1,22 +1,30 @@
 SUMMARY =3D "Bluetooth Audio ALSA Backend"
+DESCRIPTION =3D "\
+    BlueALSA is a replacement for BlueZ >=3D 5, with which one can achieve=
 the \
+    same Bluetooth audio profile support as with PulseAudio, but with fewe=
r \
+    dependencies and at a lower level in the software stack. It is designe=
d \
+    specifically for use on small, low-powered, dedicated audio or audio/v=
isual \
+    systems where the high-level audio management features of PulseAudio o=
r \
+    PipeWire are not required. \
+"
 HOMEPAGE =3D "https://github.com/Arkq/bluez-alsa"
+BUGTRACKER =3D "https://github.com/arkq/bluez-alsa/issues"
 SECTION =3D "libs"
=20
 LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8449a4f133a93f6254b496d4fb476e8=
3"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D143bc4e73f39cc5e89d6e096ac0315b=
a"
+
+DEPENDS +=3D "alsa-lib bluez5 dbus glib-2.0-native python3-packaging-nativ=
e sbc"
=20
 SRC_URI =3D "git://github.com/Arkq/bluez-alsa.git;protocol=3Dhttps;branch=
=3Dmaster"
=20
-SRCREV =3D "dd05a1baa261b94da9ba977b5e3392c8b4dc7a5e"
-PV =3D "4.0.0+git"
+SRCREV =3D "959573c2cccef5cf074f5b2fa7941abbd699c5f4"
=20
-S  =3D "${WORKDIR}/git"
-
-DEPENDS +=3D "alsa-lib bluez5 dbus glib-2.0 sbc"
+S =3D "${WORKDIR}/git"
=20
 PACKAGECONFIG ??=3D "aplay cli hcitop ${@bb.utils.filter('DISTRO_FEATURES'=
, 'systemd', d)}"
-PACKAGECONFIG[a2dpconf]  =3D "--enable-a2dpconf,--disable-a2dpconf"
-PACKAGECONFIG[aac]  =3D "--enable-aac,--disable-aac,fdk-aac"
+PACKAGECONFIG[a2dpconf] =3D "--enable-a2dpconf,--disable-a2dpconf"
+PACKAGECONFIG[aac] =3D "--enable-aac,--disable-aac,fdk-aac"
 PACKAGECONFIG[aplay] =3D "--enable-aplay,--disable-aplay"
 PACKAGECONFIG[cli] =3D "--enable-cli,--disable-cli"
 PACKAGECONFIG[coverage] =3D "--with-coverage,--without-coverage,lcov-nativ=
e"
@@ -25,8 +33,10 @@ PACKAGECONFIG[debug-time] =3D "--enable-debug-time,--dis=
able-debug-time"
 PACKAGECONFIG[faststream] =3D "--enable-faststream,--disable-faststream"
 PACKAGECONFIG[hcitop] =3D "--enable-hcitop,--disable-hcitop,libbsd ncurses=
"
 PACKAGECONFIG[libunwind] =3D "--with-libunwind,--without-libunwind,libunwi=
nd"
+PACKAGECONFIG[midi] =3D "--enable-midi,--disable-midi"
 PACKAGECONFIG[mp3lame] =3D "--enable-mp3lame,--disable-mp3lame,lame"
 PACKAGECONFIG[mpg123] =3D "--enable-mpg123,--disable-mpg123,mpg123,mpg123"
+PACKAGECONFIG[msbc] =3D "--enable-msbc,--disable-msbc,spandsp"
 PACKAGECONFIG[ofono] =3D "--enable-ofono,--disable-ofono,ofono"
 PACKAGECONFIG[payloadcheck] =3D "--enable-payloadcheck,--disable-payloadch=
eck"
 PACKAGECONFIG[rfcomm] =3D "--enable-rfcomm,--disable-rfcomm"
@@ -35,9 +45,10 @@ PACKAGECONFIG[systemd] =3D "--enable-systemd --with-syst=
emdsystemunitdir=3D${systemd
 PACKAGECONFIG[test] =3D "--enable-test,--disable-test,libcheck libsndfile1=
"
 PACKAGECONFIG[upower] =3D "--enable-upower,--disable-upower,,upower"
=20
-inherit autotools pkgconfig systemd
+inherit autotools pkgconfig python3native systemd
=20
-EXTRA_OECONF =3D " \
+# These proprietary codecs are not available in Yocto
+EXTRA_OECONF =3D "\
     --disable-aptx \
     --disable-lc3plus \
     --disable-ldac \
@@ -45,11 +56,12 @@ EXTRA_OECONF =3D " \
 "
=20
 PACKAGE_BEFORE_PN =3D "${PN}-aplay"
-RRECOMMENDS:${PN} =3D "${PN}-aplay"
=20
-FILES:${PN}-aplay =3D "${bindir}/bluealsa-aplay"
+FILES:${PN}-aplay +=3D "${bindir}/bluealsa-aplay"
 FILES:${PN} +=3D "${libdir}/alsa-lib/*"
=20
+RRECOMMENDS:${PN} =3D "${PN}-aplay"
+
 SYSTEMD_PACKAGES +=3D "${PN}-aplay"
 SYSTEMD_SERVICE:${PN} =3D "bluealsa.service"
 SYSTEMD_SERVICE:${PN}-aplay =3D "bluealsa-aplay.service"
--=20
2.34.1


