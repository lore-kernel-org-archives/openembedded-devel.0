Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF914E7718A
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 10:52:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.126722.1734605563858561760
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Dec 2024 02:52:43 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=208387d3b6=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJ6wNW4018323;
	Thu, 19 Dec 2024 02:52:42 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43hadq5dmw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 19 Dec 2024 02:52:42 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 19 Dec 2024 02:52:30 -0800
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 19 Dec 2024 02:52:29 -0800
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH 1/6] xfce4-settings: 4.18.3 -> 4.20.0
Date: Thu, 19 Dec 2024 18:52:20 +0800
Message-ID: <20241219105225.555464-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: _qzUSANLJcG7AA70O6WzhzAXqhaJq2Pu
X-Authority-Analysis: v=2.4 cv=INT4ChvG c=1 sm=1 tr=0 ts=6763fafa cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=O24Aq5uEAAAA:8 a=t7CeM3EgAAAA:8 a=mK_AVkanAAAA:8 a=QrMM1SAqB70grzr5tGgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=SYBONWESK5muIIdMMRMZ:22 a=FdTzh2GWekK77mhwV6Dw:22 a=3gWm3jAn84ENXaBijsEo:22
X-Proofpoint-GUID: _qzUSANLJcG7AA70O6WzhzAXqhaJq2Pu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-19_04,2024-12-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 mlxscore=0
 spamscore=0 phishscore=0 mlxlogscore=928 adultscore=0 suspectscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412190088
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4BJ6wNW4018323
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Dec 2024 10:52:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114388

From: Kai Kang <kai.kang@windriver.com>

Upgrade xfce4-settings from 4.18.3 to 4.20.0:

* remove patch which has been applied in upstream already
  https://gitlab.xfce.org/xfce/xfce4-settings/-/commit/d1a04d4
* set GDBUS_CODEGEN in EXTRA_OECONF
* add PACKAGECONFIG wayland

The change log is at:

https://gitlab.xfce.org/xfce/xfce4-settings/-/blob/master/NEWS

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...001-xsettings.xml-Set-default-themes.patch | 41 -------------------
 ...ngs_4.18.3.bb =3D> xfce4-settings_4.20.0.bb} | 11 +++--
 2 files changed, 8 insertions(+), 44 deletions(-)
 delete mode 100644 meta-xfce/recipes-xfce/xfce4-settings/files/0001-xset=
tings.xml-Set-default-themes.patch
 rename meta-xfce/recipes-xfce/xfce4-settings/{xfce4-settings_4.18.3.bb =3D=
> xfce4-settings_4.20.0.bb} (73%)

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/files/0001-xsettings.x=
ml-Set-default-themes.patch b/meta-xfce/recipes-xfce/xfce4-settings/files=
/0001-xsettings.xml-Set-default-themes.patch
deleted file mode 100644
index 3a4c00913..000000000
--- a/meta-xfce/recipes-xfce/xfce4-settings/files/0001-xsettings.xml-Set-=
default-themes.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 2218ba8a21e9f5715b652c6416c2ddb552686b14 Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
-Date: Sun, 20 May 2012 15:22:09 +0200
-Subject: [PATCH] xsettings.xml: Set default themes
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
-
-Theme Xfce doesn't work as expected. For example, no layout in start
-menu and applications' menu bar. And GtkColorButton is blank in config
-tab page from xfce4-terminal -> Edit -> Preference -> Colors.
-
-So use Adwaita as default theme instead.
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
- xfsettingsd/xsettings.xml | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/xfsettingsd/xsettings.xml b/xfsettingsd/xsettings.xml
-index d8fe2ac..0f5246b 100644
---- a/xfsettingsd/xsettings.xml
-+++ b/xfsettingsd/xsettings.xml
-@@ -6,8 +6,8 @@
-=20
- <channel name=3D"xsettings" version=3D"1.0">
-   <property name=3D"Net" type=3D"empty">
--    <property name=3D"ThemeName" type=3D"empty"/>
--    <property name=3D"IconThemeName" type=3D"empty"/>
-+    <property name=3D"ThemeName" type=3D"string" value=3D"Adwaita"/>
-+    <property name=3D"IconThemeName" type=3D"string" value=3D"Adwaita"/=
>
-     <property name=3D"DoubleClickTime" type=3D"int" value=3D"400"/>
-     <property name=3D"DoubleClickDistance" type=3D"int" value=3D"5"/>
-     <property name=3D"DndDragThreshold" type=3D"int" value=3D"8"/>
---=20
-2.1.0
-
diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.18.3.=
bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.20.0.bb
similarity index 73%
rename from meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.18.3.b=
b
rename to meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.20.0.bb
index f9620d85d..76ce27cc9 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.18.3.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.20.0.bb
@@ -8,21 +8,26 @@ inherit xfce features_check mime-xdg
=20
 REQUIRED_DISTRO_FEATURES =3D "x11"
=20
-SRC_URI +=3D "file://0001-xsettings.xml-Set-default-themes.patch"
-SRC_URI[sha256sum] =3D "2db9e99be503280739a08779503bdf11db8b9db9851c3a98=
1deb449002f3f1a1"
+SRC_URI[sha256sum] =3D "23548da3429a296501fbfdbc98a861ee241b9fdd47e8d5de=
1781f57c6bbce5a9"
=20
 CFLAGS +=3D " -Wno-deprecated-declarations -Wno-implicit-function-declar=
ation"
-EXTRA_OECONF +=3D "--enable-maintainer-mode --disable-debug"
+EXTRA_OECONF +=3D " \
+    GDBUS_CODEGEN=3D${STAGING_BINDIR_NATIVE}/gdbus-codegen \
+    --enable-maintainer-mode --disable-debug \
+"
=20
 PACKAGECONFIG ??=3D " \
     notify \
     ${@bb.utils.contains('DISTRO_FEATURES','alsa','sound-setter', bb.uti=
ls.contains('DISTRO_FEATURES','pulseaudio','sound-setter','',d),d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)} \
 "
 PACKAGECONFIG[notify] =3D "--enable-libnotify,--disable-libnotify,libnot=
ify"
 PACKAGECONFIG[sound-setter] =3D "--enable-sound-settings, --disable-soun=
d-settings, libcanberra, libcanberra-gtk2 sound-theme-freedesktop"
+PACKAGECONFIG[wayland] =3D "--enable-wayland, --disable-wayland, wayland=
-native"
=20
 FILES:${PN} +=3D " \
     ${libdir}/xfce4 \
+    ${libdir}/gtk-3.0/modules/libxfsettingsd-gtk-settings-sync.so \
     ${datadir}/xfce4 \
 "
=20
--=20
2.34.1


