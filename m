Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 876F0C4708E
	for <webhook@archiver.kernel.org>; Sat, 10 Dec 2022 05:22:10 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.9053.1670649724330471859
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Dec 2022 21:22:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout04.t-online.de (Postfix) with SMTP id 4CFDBED6
	for <openembedded-devel@lists.openembedded.org>; Sat, 10 Dec 2022 06:22:02 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.225.165]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p3sJB-1hOgEb0; Sat, 10 Dec 2022 06:21:57 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 1/6] gdm: update 42.0 -> 43.0
Date: Sat, 10 Dec 2022 06:21:32 +0100
Message-Id: <20221210052137.303984-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670649717-E67DE07E-6BF2CFD9/0/0 CLEAN NORMAL
X-TOI-MSGID: 431a808d-1a74-4f3f-9380-ac84711dfaca
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Dec 2022 05:22:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100014

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/gdm/{gdm_42.0.bb =3D> gdm_43.0.bb}   | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)
 rename meta-gnome/recipes-gnome/gdm/{gdm_42.0.bb =3D> gdm_43.0.bb} (83%)

diff --git a/meta-gnome/recipes-gnome/gdm/gdm_42.0.bb b/meta-gnome/recipe=
s-gnome/gdm/gdm_43.0.bb
similarity index 83%
rename from meta-gnome/recipes-gnome/gdm/gdm_42.0.bb
rename to meta-gnome/recipes-gnome/gdm/gdm_43.0.bb
index 00fb56b2b..1b09c20d4 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_42.0.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_43.0.bb
@@ -3,12 +3,15 @@ LICENSE=3D"GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
=20
 DEPENDS =3D " \
+    accountsservice \
+    audit \
     dconf-native \
     gtk+3 \
-    accountsservice \
+    keyutils \
     libcanberra \
-    libpam \
     libgudev \
+    libpam \
+    xserver-xorg \
 "
=20
 REQUIRED_DISTRO_FEATURES =3D "x11 systemd pam polkit gobject-introspecti=
on-data"
@@ -16,9 +19,9 @@ GIR_MESON_OPTION =3D ""
=20
 GNOMEBASEBUILDCLASS =3D "meson"
=20
-inherit gnomebase gsettings gobject-introspection gettext systemd userad=
d itstool gnome-help features_check
+inherit gnomebase gsettings pkgconfig gobject-introspection gettext syst=
emd useradd itstool gnome-help features_check
=20
-SRC_URI[archive.sha256sum] =3D "a328ac976937bec179971ff07829a1246b98ce72=
4181c128ae32a0ba47ad3855"
+SRC_URI[archive.sha256sum] =3D "94d70d6ed7df59fa7fde4fd02fed1168593a8adc=
e10fcee113c148d52b392294"
=20
 EXTRA_OEMESON =3D " \
     -Dplymouth=3Ddisabled \
@@ -55,4 +58,3 @@ FILES:${PN} +=3D " \
 "
=20
 RDEPENDS:${PN} +=3D "${PN}-base"
-
--=20
2.34.1


