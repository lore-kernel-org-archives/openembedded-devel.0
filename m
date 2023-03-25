Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E7FBC77B73
	for <webhook@archiver.kernel.org>; Sat, 25 Mar 2023 08:03:20 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.17406.1679731394360209187
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Mar 2023 01:03:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout04.t-online.de (Postfix) with SMTP id 431A61BA06
	for <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 09:03:12 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.154.174.49]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pfyrm-0RoPhS0; Sat, 25 Mar 2023 09:03:11 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 10/32] gnome-control-center: update 43.2 -> 44.0
Date: Sat, 25 Mar 2023 09:02:34 +0100
Message-Id: <20230325080256.923752-10-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325080256.923752-1-f_l_k@t-online.de>
References: <20230325080256.923752-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1679731391-85D6DC08-E5EC648E/0/0 CLEAN NORMAL
X-TOI-MSGID: b79932a7-d3f4-4e50-9698-5d480843bb49
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 08:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101725

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...ome-control-center_43.2.bb =3D> gnome-control-center_44.0.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-control-center/{gnome-control-cent=
er_43.2.bb =3D> gnome-control-center_44.0.bb} (92%)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-=
center_43.2.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-cont=
rol-center_44.0.bb
similarity index 92%
rename from meta-gnome/recipes-gnome/gnome-control-center/gnome-control-c=
enter_43.2.bb
rename to meta-gnome/recipes-gnome/gnome-control-center/gnome-control-cen=
ter_44.0.bb
index 830f3ec68..96080ca89 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
43.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
44.0.bb
@@ -37,9 +37,10 @@ inherit gtk-icon-cache pkgconfig gnomebase gsettings g=
ettext upstream-version-is
 REQUIRED_DISTRO_FEATURES +=3D "opengl polkit pulseaudio systemd x11"
=20
 SRC_URI +=3D "file://0001-Add-meson-option-to-pass-sysroot.patch"
-SRC_URI[archive.sha256sum] =3D "d7f256aba80a92c727b329fd01c8602da4b78f0f=
ddaec93fcd91096964700563"
+SRC_URI[archive.sha256sum] =3D "bdbfab4cf23d05734096db1f9f6fac7eed3fcb9d=
a32bf4b1f26ed3a04e5abc66"
=20
 PACKAGECONFIG ??=3D "ibus ${@bb.utils.filter('DISTRO_FEATURES', 'wayland=
', d)}"
+PACKAGECONFIG[cups] =3D ",,cups,cups"
 PACKAGECONFIG[ibus] =3D "-Dibus=3Dtrue, -Dibus=3Dfalse, ibus"
 PACKAGECONFIG[wayland] =3D "-Dwayland=3Dtrue, -Dwayland=3Dfalse, wayland=
"
=20
--=20
2.34.1


