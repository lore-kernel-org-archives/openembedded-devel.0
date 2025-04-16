Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E00B1C369BD
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 13:44:24 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.19918.1744811063225397639
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Apr 2025 06:44:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout05.t-online.de (Postfix) with SMTP id 2532B1F24
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 15:44:20 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.236.131]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1u533q-0pWT9l0; Wed, 16 Apr 2025 15:44:18 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] gnome-remote-dsktop: add requested user
Date: Wed, 16 Apr 2025 15:44:09 +0200
Message-ID: <20250416134410.712154-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1744811058-28FF6AE4-3A26E09A/0/0 CLEAN NORMAL
X-TOI-MSGID: a224dc04-6c03-4473-94b1-2308a4576b3c
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 13:44:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116908

This fixes:
WARNING: gnome-image-1.0-r0 do_rootfs: User gnome-remote-desktop has neve=
r been defined

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gnome-remote-desktop_48.0.bb                 | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-=
remote-desktop/gnome-remote-desktop_48.0.bb b/meta-gnome/dynamic-layers/m=
eta-security/recipes-gnome/gnome-remote-desktop/gnome-remote-desktop_48.0=
.bb
index 5f8a06c5c3..bfb603514b 100644
--- a/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-=
desktop/gnome-remote-desktop_48.0.bb
+++ b/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-=
desktop/gnome-remote-desktop_48.0.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fc=
e4486a80fdaf4a4263"
=20
 GNOMEBASEBUILDCLASS =3D "meson"
=20
-inherit gnomebase gettext gsettings features_check
+inherit gnomebase gettext gsettings features_check useradd
=20
 REQUIRED_DISTRO_FEATURES =3D "opengl polkit"
=20
@@ -36,5 +36,19 @@ PACKAGECONFIG[vnc] =3D "-Dvnc=3Dtrue,-Dvnc=3Dfalse,lib=
vncserver"
 PACKAGECONFIG[rdp] =3D "-Drdp=3Dtrue,-Drdp=3Dfalse,freerdp3 fuse3 libxkb=
common shaderc-native"
 PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue,-Dsystemd=3Dfalse,systemd"
=20
+do_install:append() {
+	install -d ${D}${sysconfdir}/tmpfiles.d
+	echo "d ${localstatedir}/lib/gnome-remote-desktop 700 gnome-remote-desk=
top gnome-remote-desktop - -" > ${D}${sysconfdir}/tmpfiles.d/gnome-remote=
-desktop.conf
+}
+
+USERADD_PACKAGES =3D "${PN}"
+USERADD_PARAM:${PN} =3D " \
+	--system \
+	--no-create-home \
+	--user-group \
+	--home-dir ${localstatedir}/lib/gnome-remote-desktop \
+	gnome-remote-desktop \
+"
+
 PACKAGE_DEBUG_SPLIT_STYLE =3D "debug-without-src"
 FILES:${PN} +=3D "${systemd_user_unitdir} ${systemd_system_unitdir} ${da=
tadir} ${libdir}/sysusers.d ${libdir}/tmpfiles.d"
--=20
2.49.0


