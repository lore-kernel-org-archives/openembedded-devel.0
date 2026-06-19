Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A378BCDB466
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 12:27:20 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.113])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41198.1781872027734323208
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Jun 2026 05:27:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=J/FiPnvK;
 spf=pass (domain: navimatix.de, ip: 52.101.66.113, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t7IUKRpwagP2+GJoNLR+G+26tm+NO+zRigIMpPWXDvAOdmGYKl+E/6XT1QRaZNRHu4T2EVD7AtWb6tLtFEsOeK6PwMv2dr4Oqvf6oQk5TOKCTtaTObL9GtQSiI38lBsB0Pu4GynIQSfLpzR4OK8fkKreLWZJQywSsTooiCr4OZR2CFVFHM65Vry/Uvs6sG7rZDufTbmEuwpaxi3JxoFBhy866+51UzF3pT28jq/1v0PApaSdU45sBvcIZDoGe2UbIaqyYJ5evxTcHIyAWB8NDHLCmXjBenvtMPjkODJNS1l0QtU1anyUnMQ91whHsPy7HiRqDguFNhydbE/9o1yyzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H57/N5IAOxYTCQdP8k7KSfbHmlvIWv/cOp6RqMNoOEM=;
 b=cM+jXJTz89qAhk85jBpClyJbtKwDrFSSLOtV1+Vo6Y97wh2mpAUs2E56ZtQ8444pQKFAn54JTMg4Y8AVaJvffIt7Sy6ejvyLNhOWvAPYKJREuukYF0Bt3Us0Ga5Gi6x/2U/+ApVixIH2rkm9kRW2z69cWo2NSVhxfMDh197LTCm/iwA8Krkhs+UXByx09Iid0zeWXOT0yqIOSiGmdZsFWK6fp+bsDUt6ZKHgB12r+J3fazRydLSE1eSNCoz56vTf/jSvYybGVSq0o05L8iVLPF/HULKEmtvlKyrVIRZDzE6tiIk2kPjHIR3KXXHUO+uGaOYMdlavoE5LaSMMVS9MIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H57/N5IAOxYTCQdP8k7KSfbHmlvIWv/cOp6RqMNoOEM=;
 b=J/FiPnvK/PVU3ZDr6L/q43ZnL1pKQpnHGmp6x4to0F1E06Aq3Gv2bAbLUTxjKMyVv4MH2AytWMvnKwQv72DiKdoKL+dEzwwH6VrYDjkYIqGcgkt8CoXYOdjzgaW5Pi+lMtntCdImLdzgNdheXcaq/I+DL6+AXlp9YTy0NnhmmlI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by AS8PR01MB7192.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:25d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 12:27:03 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.21.0139.009; Fri, 19 Jun 2026 12:27:03 +0000
Date: Fri, 19 Jun 2026 14:27:01 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-devel@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH] octave: upgrade 7.2.0 -> 11.3.0 + rework + pcre -> pcre2
Message-ID: <2e11d3a01b91643c580397d35fea87d270d66771.1781872021.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE0P281CA0017.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:a::27) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|AS8PR01MB7192:EE_
X-MS-Office365-Filtering-Correlation-Id: 29cf31ad-e04a-4dd9-cb6d-08decdfe1185
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|56012099006|6133799003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	1Q0LgZL9bNeMeyTzTrupyruddATTfAVyJrSqI6JdqlT+oYO2JrZoOAQL44GDAm5AiJbikoKUTy4n+QfnJHo0f3+EXIcdAYmoDz7Bbnbe7sve7fzaEDxJ9fMl8ikVOOIc99rCZIF30Tu0+dPBToOip81EwvPn+6FWfrLAml1Xo008DFKdRfY3YhnhAVOYmyKqpMe9Jid+QRSkPI71LJHB53wkqjVYARxyBjX48ee1Yr1/Cqq4ssZsrdnqUqBYXbrjQBem0/EhvUyAghSUbiot3GiOu/F3ud4LEa/n6VAlnFHbjLzp51/9ekh5HR8BUtQqz4d05xF4fPvbT0749ZHZMtnREw0UPLaD0CqocnsBTkcoqmzqsArAIBoHi1t4lLvL4pxBBji0MlkmCw/gp72vbuSowlxD6/L0NQkUeQdLQF3kGOT4ECwxPgfJEvY09fy+sGffqwnS6GhJJUZGmvZvycMgopl/tk7o0aNFaUv0i2NqsfB1vS10zZn6SYOjAbab+ixXibTqhWWun6gOoN5lPI7KNsO2MoQqQX6WVyF+a1bJlTdsC4c/sqphmsgI/ijGuKo6mPtED7b6UKSZI2RRzCqvOsZkRA+Drpl6a84nRcw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(56012099006)(6133799003)(18002099003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GCKE1e6jnmaHdeRx6kTbcns/x3RqorQnmkPcsAJNGkGB9wkQSM52+4TPVZOf?=
 =?us-ascii?Q?nRESwfxyb9KT/GvGn+q254KBfl80loXCNGyb726CiJoU1I9p0g63LIfGd8fF?=
 =?us-ascii?Q?22XPWIWWknYdsTKxKpb1CLCxKVMBWBpd3QEX/nJ+rjxViO+roXTLMtt/1GsP?=
 =?us-ascii?Q?DL+0dGVut2xGvcRX/0TBeTUpPw5ws6nsUTuP9iJxb2y8e/X832Eloc+o29hf?=
 =?us-ascii?Q?O5vBQD6jTpsn7fZQzdHo+CXIt/1DQNOW6AAlm6dNOavlTi/mVSaCKAPnTKry?=
 =?us-ascii?Q?uhZJRCNwh53RXeccmQMwxSyhasSczPgrqgU+X9bINxVFurrrZP3Zgv+SkQ+S?=
 =?us-ascii?Q?Qc+fMn7k+VesAFI/UNFBg3NaBUzP6q5DimgEsuTkG4FXdo6DWg2E5E0p7duz?=
 =?us-ascii?Q?OEunHybtJ8YTNG2irH64UXbfm7n0bD462WnOZhPz0X+VrNNYZj6u9nWUrx2k?=
 =?us-ascii?Q?ZJbZ4MEwK6S7vcZlydgTNPkZWjBCM7IKGMKVdEXs06B6rkBh74IcIca9n0mZ?=
 =?us-ascii?Q?rKBT7PMsrw0dJpSXwNbS98kxOr6xk9GYYgvcMXfkztO1cFsDIDZewUUgWDol?=
 =?us-ascii?Q?+54r1xqRFPgujSU4NDVmozdOzLNJ7Cvl8C4LozTgmVDFuBFwP+BVHcsN+FpZ?=
 =?us-ascii?Q?INBC1tgz2UXiCXA4AR7CWdFh+nw5dmuNEq61yQG0Zkm0RbDjXKJXm0H+tPao?=
 =?us-ascii?Q?2GklWmNBlj8DfJWWeHNjUh/YTQ4WBsNsYrtEZXKK2r+aGO6+pfBiNlqK9YVO?=
 =?us-ascii?Q?T3dVqF6DX6OJrlnkhe0Il3HwN7AqV4NWgQk1D6DlGb2cOUgln1IHCRU1lGNH?=
 =?us-ascii?Q?QE6FCtjszhJ1ZSJ+4Wa+vYDxHF1LmhcMPsjXeSrvTe1ykX+M2+p0YXOkyu61?=
 =?us-ascii?Q?4jbFHOFXjjp7v0LjcFQ22ZrXhv/a0JhTyTEqQ0NqR4VD+yvUPzKaoiVIH+gK?=
 =?us-ascii?Q?zGVs6bw4NbLwFexs+I/cC5LXsTip64jYeb/6dTd2Aaw9y0A+mQngSMgsppMQ?=
 =?us-ascii?Q?1Xiq1/dS7Ko55/MiKcN/cKJxayMBn1ZM0QP//89bcHwpVr/8/dvQRVkmytQd?=
 =?us-ascii?Q?a1hhfqPZu0yyQQP5na/T06LK7/dmJU77PpqQVktqvG/rT6rQ97xBnMNFBP26?=
 =?us-ascii?Q?ch4G2vwrt0kmsuz1aVED5AUBl0qORpcN3+suy0BjU/zJivhk4isCAacH4TMX?=
 =?us-ascii?Q?LYRQZ+koKjyGI6Um8DcOfC252AZdVkCyHFEdx0LfLI9sz0Rc/seCNAi4GCJf?=
 =?us-ascii?Q?3i53OtzVDc3HkJMItYR0AX9IaQDfSEb+11KjEWh58zobSW7S+iOZZTJYcnab?=
 =?us-ascii?Q?dMAls0m4awxTXJ+We8yk2VvnnCaMqP0Cm+Isi8gXm+tP+rZjPD5xZyCPaLOA?=
 =?us-ascii?Q?dZE4Ug0IDmflAhS0vJYrntm2fk0SuJmiez8I2RY4h6VcrU6f4SoqyhdkWTjp?=
 =?us-ascii?Q?GggZrCHo1S7O3hMbxM3iks98SNKxeDiAVd13G1MwquR0Ovz1sin+7Vhd9CmA?=
 =?us-ascii?Q?0Hyv9YTuYAIFXcLzU84re1kKD8kTQQ0cAQLS3ivBpUsOqm1Yh3JDa7odum2s?=
 =?us-ascii?Q?rCZTEH4tDSRT5mBSde9ha8LhVjMNJ0+bt7tQbKiH96Lbbth2Kr96a4wZZPV8?=
 =?us-ascii?Q?kyldO8PTFm2NLNn+9OQmhpEMNXczDVw0tRWKKMhHUF+LwDucYk6KuMqsVzVT?=
 =?us-ascii?Q?IqfW8UUOqK7W9ZjRLf2Rz2nCTGiOrpTzBnnRaFgbc8TR0V0hhWGFuKhEXRU5?=
 =?us-ascii?Q?nt86nlDfLBZpyJcJ5En+ik5VPmggxV0=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 29cf31ad-e04a-4dd9-cb6d-08decdfe1185
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 12:27:03.4504
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zAfSyUysnVEe7JFVPYd6hGP/6oUJEEIynTePY5Px0LV2doCv+lsu+0gDXpbtx+We/jEr7BBcBaLRK4rXlEWqyrJaUKlvRwDrTwOBU0mzq2E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR01MB7192
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Jun 2026 12:27:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127681

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

This new version works with pcre2. The other dependencies only got sorted.
Now, Octave provides xz compressed tarballs, which are much smaller.

Unfortunately, Octave generates source code files during the build with
multiple variables from the build environment which are end up in the
binaries.

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 .../files/fix-blas-library-integer-size.patch | 18 ------
 .../{octave_7.2.0.bb =3D> octave_11.3.0.bb}     | 55 ++++++++++++-------
 2 files changed, 34 insertions(+), 39 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/octave/files/fix-blas-library-=
integer-size.patch
 rename meta-oe/recipes-devtools/octave/{octave_7.2.0.bb =3D> octave_11.3.0=
.bb} (39%)

diff --git a/meta-oe/recipes-devtools/octave/files/fix-blas-library-integer=
-size.patch b/meta-oe/recipes-devtools/octave/files/fix-blas-library-intege=
r-size.patch
deleted file mode 100644
index 4189d4083a..0000000000
--- a/meta-oe/recipes-devtools/octave/files/fix-blas-library-integer-size.p=
atch
+++ /dev/null
@@ -1,18 +0,0 @@
-Upstream-Status: Pending
-
-diff -Naur octave-4.4.1.orig/configure.ac octave-4.4.1/configure.ac
---- octave-4.4.1.orig/configure.ac	2019-02-23 10:46:24.287240571 +0000
-+++ octave-4.4.1/configure.ac	2019-02-23 10:46:42.255249333 +0000
-@@ -762,6 +762,12 @@
-   AC_MSG_ERROR([BLAS and LAPACK libraries are required])
- fi
-=20
-+if ac_fn_f77_try_run "$LINENO"; then :
-+  ax_blas_integer_size=3D8
-+else
-+  ax_blas_integer_size=3D4
-+fi
-+
- case $ax_blas_integer_size in
-   4)
-     HAVE_64_BIT_BLAS=3Dno
diff --git a/meta-oe/recipes-devtools/octave/octave_7.2.0.bb b/meta-oe/reci=
pes-devtools/octave/octave_11.3.0.bb
similarity index 39%
rename from meta-oe/recipes-devtools/octave/octave_7.2.0.bb
rename to meta-oe/recipes-devtools/octave/octave_11.3.0.bb
index eb96a624f6..9f796e1f0f 100644
--- a/meta-oe/recipes-devtools/octave/octave_7.2.0.bb
+++ b/meta-oe/recipes-devtools/octave/octave_11.3.0.bb
@@ -1,5 +1,11 @@
 SUMMARY =3D "High-level language, primarily intended for numerical computa=
tions"
-HOMEPAGE =3D "http://www.gnu.org/software/octave/"
+DESCRIPTION =3D "\
+    GNU Octave is a scientific programming language with powerful \
+    mathematics-oriented syntax with built-in 2D/3D plotting and visualiza=
tion \
+    tools, which is drop-in compatible with many Matlab scripts. \
+"
+HOMEPAGE =3D "https://octave.org/"
+BUGTRACKER =3D "https://bugs.octave.org/"
 SECTION =3D "math"
=20
 LICENSE =3D "GPL-3.0-only"
@@ -8,45 +14,52 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1ebbd3e34237a=
f26da5dc08a4e440464"
 # To build, add 'FORTRAN:forcevariable =3D ",fortran"' to your local.conf =
(or use
 # meta-mortsgna as distro :)
=20
-DEPENDS =3D " \
-    gperf-native \
-    libglu \
-    lapack \
-    fftw \
+DEPENDS =3D "\
     curl \
-    freetype \
-    fontconfig \
-    texinfo \
-    pcre \
-    readline \
+    fftw \
     fltk \
+    fontconfig \
+    freetype \
+    gperf-native \
     hdf5 \
+    lapack \
+    libglu \
     libsndfile1 \
+    pcre2 \
+    readline \
+    texinfo \
 "
=20
 inherit autotools pkgconfig texinfo gettext gtk-icon-cache mime-xdg featur=
es_check
=20
+# File /usr/lib/octave/11.3.0/liboctinterp.so.15.0.1 in package octave con=
tains reference to TMPDIR [buildpaths]
+#  contains the whole compiler invokation
+# File /usr/lib/octave/11.3.0/.debug/liboctave.so.13.0.2 in package octave=
-dbg contains reference to TMPDIR [buildpaths]
+#  contains all fortran compiler options
+# File /usr/src/debug/octave/11.3.0/libinterp/build-env.cc in package octa=
ve-src contains reference to TMPDIR [buildpaths]
+#  contains multiple variables from the build environment
+# File /usr/src/debug/octave/11.3.0/src/mkoctfile.cc in package octave-src=
 contains reference to TMPDIR [buildpaths]
+#  contains the variables CC CFLAGS CXX and CXXFLAGS from the build enviro=
nment
+INSANE_SKIP +=3D "buildpaths"
+
 REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
=20
-SRC_URI =3D " \
-    ${GNU_MIRROR}/octave/${BPN}-${PV}.tar.gz \
-    file://fix-blas-library-integer-size.patch \
-"
-SRC_URI[sha256sum] =3D "b12cb652587d31c5c382b39ed73463c22a5259ecb2fa6b323a=
27da409222dacc"
+SRC_URI =3D "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
+SRC_URI[sha256sum] =3D "2b80f3149b2de6d1f4f2fcb4fe6515a17eb363b52111bf57b9=
0f37bf6f5e12e1"
=20
 # Note: Qt5Help is required for gui -> qttools(-native) must be build with
 # clang in PACKAGECONFIG
-PACKAGECONFIG[gui] =3D "--with-qt=3Dyes,--with-qt=3Dno,qttools-native qtto=
ols qtbase"
+PACKAGECONFIG[gui] =3D "--with-qt,--without-qt,qttools-native qttools qtba=
se"
=20
-EXTRA_OECONF =3D " \
+EXTRA_OECONF =3D "\
     --disable-java \
     --disable-docs \
 "
=20
 do_compile:prepend() {
-	for folder in "liboctave/operators liboctave/numeric liboctave/array libo=
ctave/util"; do
-		mkdir -p ${B}/${folder}
-	done
+    for folder in "liboctave/operators liboctave/numeric liboctave/array l=
iboctave/util"; do
+        mkdir -p ${B}/${folder}
+    done
 }
=20
 FILES:${PN} +=3D "${datadir}/metainfo"
--=20
2.53.0


