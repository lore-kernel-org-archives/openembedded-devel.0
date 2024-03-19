Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22CB2C54E68
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 06:41:58 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.8924.1710830514016516177
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 23:41:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout05.t-online.de (Postfix) with SMTP id 69B58D1F2
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 07:41:51 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.227.144]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rmTAS-1pzs4A0; Tue, 19 Mar 2024 07:41:48 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/3] gnome-remote-desktop: update 45.1 -> 46.0
Date: Tue, 19 Mar 2024 07:42:12 +0100
Message-ID: <20240319064213.4961-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240319064213.4961-1-f_l_k@t-online.de>
References: <20240319064213.4961-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1710830508-56FA6986-7E7C69C3/0/0 CLEAN NORMAL
X-TOI-MSGID: 12492e1b-9168-47cb-9bde-86b38cd763a3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 06:41:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109470

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...-desktop_45.1.bb =3D> gnome-remote-desktop_46.0.bb} | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)
 rename meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remot=
e-desktop/{gnome-remote-desktop_45.1.bb =3D> gnome-remote-desktop_46.0.bb=
} (67%)

diff --git a/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-=
remote-desktop/gnome-remote-desktop_45.1.bb b/meta-gnome/dynamic-layers/m=
eta-security/recipes-gnome/gnome-remote-desktop/gnome-remote-desktop_46.0=
.bb
similarity index 67%
rename from meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-r=
emote-desktop/gnome-remote-desktop_45.1.bb
rename to meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-rem=
ote-desktop/gnome-remote-desktop_46.0.bb
index 9e887056e..b9ee0e60d 100644
--- a/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-=
desktop/gnome-remote-desktop_45.1.bb
+++ b/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-=
desktop/gnome-remote-desktop_46.0.bb
@@ -8,7 +8,7 @@ inherit gnomebase gettext gsettings features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "opengl"
=20
-SRC_URI[archive.sha256sum] =3D "dcd9c18ac2306695631fcf00a88645c38e370eba=
05c69df39f540204d4eafd8d"
+SRC_URI[archive.sha256sum] =3D "e75ce17c12a6d39254dc309c31514e5ef15763f1=
36612d641c5f6f4445e00ac4"
=20
 DEPENDS =3D " \
     asciidoc-native \
@@ -18,23 +18,23 @@ DEPENDS =3D " \
     cairo \
     glib-2.0 \
     pipewire \
+    polkit \
     libnotify \
+    libopus \
     libsecret \
     nv-codec-headers \
     tpm2-tss \
 "
=20
 PACKAGECONFIG ??=3D " \
-    vnc \
     rdp \
-    ${@bb.utils.contains('LICENSE_FLAGS_ACCEPTED', 'commercial', 'fdk_aa=
c', '', d)} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
 "
=20
 PACKAGECONFIG[tests] =3D "-Dtests=3Dtrue,-Dtests=3Dfalse,pipewire-native=
 wireplumber-native dbus-native"
 PACKAGECONFIG[vnc] =3D "-Dvnc=3Dtrue,-Dvnc=3Dfalse,libvncserver"
-PACKAGECONFIG[rdp] =3D "-Drdp=3Dtrue,-Drdp=3Dfalse,freerdp fuse3 libxkbc=
ommon"
-PACKAGECONFIG[fdk_aac] =3D "-Dfdk_aac=3Dtrue,-Dfdk_aac=3Dfalse,fdk-aac"
+PACKAGECONFIG[rdp] =3D "-Drdp=3Dtrue,-Drdp=3Dfalse,freerdp3 fuse3 libxkb=
common"
 PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue,-Dsystemd=3Dfalse,systemd"
=20
-FILES:${PN} +=3D "${systemd_user_unitdir}"
+PACKAGE_DEBUG_SPLIT_STYLE =3D "debug-without-src"
+FILES:${PN} +=3D "${systemd_user_unitdir} ${systemd_system_unitdir} ${da=
tadir} ${libdir}/sysusers.d ${libdir}/tmpfiles.d"
--=20
2.44.0


