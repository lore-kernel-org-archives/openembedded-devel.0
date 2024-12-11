Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FEC6E77183
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 08:07:13 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.5749.1733904424119284352
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Dec 2024 00:07:04 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout04.t-online.de (Postfix) with SMTP id BF6D2A79
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Dec 2024 09:07:01 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.33.231]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tLHkL-0OXTbV0; Wed, 11 Dec 2024 09:07:01 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/4] gnome-control-center: update 47.1.1 -> 47.2
Date: Wed, 11 Dec 2024 09:06:57 +0100
Message-ID: <20241211080700.104771-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1733904421-84FF686F-D7C04A7F/0/0 CLEAN NORMAL
X-TOI-MSGID: f17b71f3-8868-40f8-8076-30ecf1ebb10e
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Dec 2024 08:07:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114272

- use tarball release again

    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
    Version 47.2
    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

    - Various translation updates

    Accessibility
    - Remove "screen" labels that take too much space

    Appearance
    - Fix accidental reset of accent colors config

    Apps
    - Fix some memory leaks

    Color
    - Ensure profiles are connected before operating on them

    Mobile Networks
    - Fix alignment of status pages

    Mouse
    - Fix illustration assets requiring gstreamer-plugins-bad
    - Update illustration assets

    Printers
    - Remove wrong tooltip in the "Add Printer" button

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...-control-center_47.1.1.bb =3D> gnome-control-center_47.2.bb} | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-control-center/{gnome-control-cent=
er_47.1.1.bb =3D> gnome-control-center_47.2.bb} (91%)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-=
center_47.1.1.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-co=
ntrol-center_47.2.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/gnome-control-center/gnome-control-c=
enter_47.1.1.bb
rename to meta-gnome/recipes-gnome/gnome-control-center/gnome-control-cen=
ter_47.2.bb
index dce7711b8..a2decc13e 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
47.1.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
47.2.bb
@@ -37,11 +37,9 @@ DEPENDS =3D " \
 inherit gtk-icon-cache pkgconfig gnomebase gsettings gettext gi-docgen u=
pstream-version-is-even bash-completion features_check
=20
 REQUIRED_DISTRO_FEATURES +=3D "opengl polkit pulseaudio systemd x11"
-SRC_URI =3D "gitsm://gitlab.gnome.org/GNOME/gnome-control-center.git;pro=
tocol=3Dhttps;nobranch=3D1"
=20
-S =3D "${WORKDIR}/git"
 SRC_URI +=3D "file://0001-Add-meson-option-to-pass-sysroot.patch"
-SRCREV =3D "7985fc671ad43f5925b9012e6c51231ad73a628d"
+SRC_URI[archive.sha256sum] =3D "434a322dc3743858b89d8165d89f89dc05968b6b=
7be3400944ced4271250d3e9"
=20
 PACKAGECONFIG ??=3D "ibus ${@bb.utils.filter('DISTRO_FEATURES', 'wayland=
', d)}"
 PACKAGECONFIG[cups] =3D ",,cups,cups system-config-printer cups-pk-helpe=
r"
--=20
2.47.0


