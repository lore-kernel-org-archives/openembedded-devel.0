Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31F5EC282DE
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 07:19:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.9203.1741850363195672968
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Mar 2025 00:19:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=51675baf6d=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52D6Kivv011090
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Mar 2025 00:19:22 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45b0j4smp1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Mar 2025 00:19:22 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 13 Mar 2025 00:19:21 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 13 Mar 2025 00:19:21 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH] xfce4-session: 4.18.4 -> 4.20.0
Date: Thu, 13 Mar 2025 15:19:16 +0800
Message-ID: <20250313071916.728683-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=Cc0I5Krl c=1 sm=1 tr=0 ts=67d286fa cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=t7CeM3EgAAAA:8 a=mK_AVkanAAAA:8 a=yT6AIaavo3-pobuCxvsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=3gWm3jAn84ENXaBijsEo:22
X-Proofpoint-ORIG-GUID: GFtweiqi9ynRCrAImhjmmTWpxQzOjkl1
X-Proofpoint-GUID: GFtweiqi9ynRCrAImhjmmTWpxQzOjkl1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_03,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0 mlxscore=0
 mlxlogscore=997 adultscore=1 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2502280000 definitions=main-2503130056
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 52D6Kivv011090
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Mar 2025 07:19:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115952

From: Kai Kang <kai.kang@windriver.com>

Upgrade xfce4-session from 4.18.4 to 4.20.0:

* rebase 0001-configure.in-hard-code-path-to-iceauth.patch
* add dependency libxfce4windowing

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...nfigure.in-hard-code-path-to-iceauth.patch | 37 ++++++++++---------
 ...sion_4.18.4.bb =3D> xfce4-session_4.20.0.bb} |  7 +++-
 2 files changed, 25 insertions(+), 19 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-session/{xfce4-session_4.18.4.bb =3D=
> xfce4-session_4.20.0.bb} (78%)

diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session/0001-conf=
igure.in-hard-code-path-to-iceauth.patch b/meta-xfce/recipes-xfce/xfce4-s=
ession/xfce4-session/0001-configure.in-hard-code-path-to-iceauth.patch
index d619cde6ca..0e20143f10 100644
--- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session/0001-configure.i=
n-hard-code-path-to-iceauth.patch
+++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session/0001-configure.i=
n-hard-code-path-to-iceauth.patch
@@ -12,29 +12,32 @@ not at run-time.
 Upstream-Status: Inappropriate [config]
=20
 Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
+
+Rebase for xfce4-session 4.20.0.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
- configure.ac |    8 +-------
- 1 files changed, 1 insertions(+), 7 deletions(-)
+ configure.ac | 8 +-------
+ 1 file changed, 1 insertion(+), 7 deletions(-)
=20
 diff --git a/configure.ac b/configure.ac
-index 3cf3510..505e744 100644
+index 81b362f..ccde685 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -111,13 +111,7 @@ XDT_FEATURE_DEBUG([xfsm_debug_default])
- dnl Check for linker optimizations
- XDT_FEATURE_LINKER_OPTS()
+@@ -136,13 +136,7 @@ if test x"$ENABLE_X11" =3D x"yes"; then
+   AC_CHECK_FUNCS([_IceTransNoListen])
+   LIBS=3D"$ac_LIBS"
 =20
--dnl Check for iceauth
--AC_PATH_PROG([ICEAUTH], [iceauth])
--if test x"$ICEAUTH" !=3D x""; then
--  AC_DEFINE_UNQUOTED([ICEAUTH_CMD], ["$ICEAUTH"], [path to iceauth])
--else
--  AC_MSG_ERROR([iceauth missing, please check your X11 installation])
--fi
-+AC_DEFINE_UNQUOTED([ICEAUTH_CMD], ["$bindir/iceauth"], [path to iceauth=
])
+-  dnl Check for iceauth
+-  AC_PATH_PROG([ICEAUTH], [iceauth])
+-  if test x"$ICEAUTH" !=3D x""; then
+-    AC_DEFINE_UNQUOTED([ICEAUTH_CMD], ["$ICEAUTH"], [path to iceauth])
+-  else
+-    AC_MSG_ERROR([iceauth missing, please check your X11 installation])
+-  fi
++  AC_DEFINE_UNQUOTED([ICEAUTH_CMD], ["$bindir/iceauth"], [path to iceau=
th])
 =20
- dnl Find a location for the session desktop file
- AC_MSG_CHECKING([what xsession-prefix to use])
+   dnl Find a location for the session desktop file
+   AC_MSG_CHECKING([what xsession-prefix to use])
 --=20
 1.7.4.4
-
diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.18.4.bb=
 b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.20.0.bb
similarity index 78%
rename from meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.18.4.bb
rename to meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.20.0.bb
index 7015820785..6ed03efeb9 100644
--- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.18.4.bb
+++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.20.0.bb
@@ -3,18 +3,20 @@ SECTION =3D "x11"
 LICENSE =3D "GPL-2.0-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
=20
-DEPENDS =3D "libwnck3 libsm libxfce4ui virtual/libx11"
+DEPENDS =3D "libwnck3 libsm libxfce4ui libxfce4windowing virtual/libx11"
=20
 inherit xfce update-alternatives features_check
=20
 SRC_URI +=3D "file://0001-configure.in-hard-code-path-to-iceauth.patch"
-SRC_URI[sha256sum] =3D "9a9c5074c7338b881a5259d3b643619bf84901360c03478e=
1a697938ece06516"
+SRC_URI[sha256sum] =3D "5229233fe6ee692361cc28724886c5b08e0216d89f09c42d=
273191d38fd64f85"
=20
 REQUIRED_DISTRO_FEATURES =3D "x11"
=20
 PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'polkit', d)}=
"
 PACKAGECONFIG[polkit] =3D "--enable-polkit, --disable-polkit, polkit"
=20
+EXTRA_OECONF =3D "GDBUS_CODEGEN=3D${STAGING_BINDIR_NATIVE}/gdbus-codegen=
"
+
 ALTERNATIVE:${PN} =3D "x-session-manager"
 ALTERNATIVE_TARGET[x-session-manager] =3D "${bindir}/xfce4-session"
 ALTERNATIVE_PRIORITY_${PN} =3D "150"
@@ -22,6 +24,7 @@ ALTERNATIVE_PRIORITY_${PN} =3D "150"
 FILES:${PN} +=3D " \
     ${libdir}/xfce4/*/*/*.so \
     ${libdir}/xfce4/session/*-*-* \
+    ${datadir}/wayland-sessions \
     ${datadir}/xsessions \
     ${datadir}/themes/Default/balou/* \
     ${datadir}/polkit-1 \
--=20
2.34.1


