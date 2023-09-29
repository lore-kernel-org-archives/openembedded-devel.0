Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9ABAE7734C
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 23:20:51 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.31878.1696029650385951181
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Sep 2023 16:20:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout07.t-online.de (Postfix) with SMTP id 4D5BF95DD
	for <openembedded-devel@lists.openembedded.org>; Sat, 30 Sep 2023 01:20:47 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.164.210]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qmMmm-31qbQH0; Sat, 30 Sep 2023 01:20:40 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gnome-remote-desktop: Upgrade 44.2 -> 45.0
Date: Sat, 30 Sep 2023 01:20:39 +0200
Message-ID: <20230929232039.2170583-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1696029640-2A7FBD4D-61F725A3/0/0 CLEAN NORMAL
X-TOI-MSGID: 78447574-67c4-412c-87d6-6549a3e711fd
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 23:20:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105281

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...me-remote-desktop_44.2.bb =3D> gnome-remote-desktop_45.0.bb} | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gnome=
-remote-desktop/{gnome-remote-desktop_44.2.bb =3D> gnome-remote-desktop_4=
5.0.bb} (82%)

diff --git a/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/=
gnome-remote-desktop/gnome-remote-desktop_44.2.bb b/meta-gnome/dynamic-la=
yers/meta-virtualization/recipes-gnome/gnome-remote-desktop/gnome-remote-=
desktop_45.0.bb
similarity index 82%
rename from meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/g=
nome-remote-desktop/gnome-remote-desktop_44.2.bb
rename to meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gno=
me-remote-desktop/gnome-remote-desktop_45.0.bb
index 48e4d9f32..d3089648c 100644
--- a/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gnome-r=
emote-desktop/gnome-remote-desktop_44.2.bb
+++ b/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gnome-r=
emote-desktop/gnome-remote-desktop_45.0.bb
@@ -8,11 +8,12 @@ inherit gnomebase gettext gsettings features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "opengl"
=20
-SRC_URI[archive.sha256sum] =3D "7a9ffd341b5fcb636d26675e9f6269650952163f=
ff5295327618cc2d5cc87b8e"
+SRC_URI[archive.sha256sum] =3D "cb993112d5a3ca21ec217df2d84068e4cad2a4aa=
6cab52f0e186fa1152f7a381"
=20
 DEPENDS =3D " \
     asciidoc-native \
     libdrm \
+    libei \
     libepoxy \
     cairo \
     glib-2.0 \
@@ -30,6 +31,7 @@ PACKAGECONFIG ??=3D " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
 "
=20
+PACKAGECONFIG[tests] =3D "-Dtests=3Dtrue,-Dtests=3Dfalse,pipewire-native=
 wireplumber-native dbus-native"
 PACKAGECONFIG[vnc] =3D "-Dvnc=3Dtrue,-Dvnc=3Dfalse,libvncserver"
 PACKAGECONFIG[rdp] =3D "-Drdp=3Dtrue,-Drdp=3Dfalse,freerdp fuse3 libxkbc=
ommon"
 PACKAGECONFIG[fdk_aac] =3D "-Dfdk_aac=3Dtrue,-Dfdk_aac=3Dfalse,fdk-aac"
--=20
2.42.0


