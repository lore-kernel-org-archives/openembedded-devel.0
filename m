Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14BE9E7AD6B
	for <webhook@archiver.kernel.org>; Thu, 25 Dec 2025 19:35:23 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.142857.1766691320819501155
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Dec 2025 11:35:21 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout06.t-online.de (Postfix) with SMTP id F3AA5182
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Dec 2025 20:34:45 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.239.223]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vYr6f-135MiQ0; Thu, 25 Dec 2025 20:34:42 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/2] gnome-software: update 49.1 -> 49.2
Date: Thu, 25 Dec 2025 20:34:31 +0100
Message-ID: <20251225193431.1365161-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251225193431.1365161-1-f_l_k@t-online.de>
References: <20251225193431.1365161-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1766691282-267D04AF-7C2AA569/0/0 CLEAN NORMAL
X-TOI-MSGID: f674e3ac-b2d5-4f99-9c7e-12e516845dba
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Dec 2025 19:35:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122934

- inherit pkgconfig

Version 49.2
~~~~~~~~~~~~
Released: 2025-11-20

This is a stable release with the following changes:
 * Fixed version history sometimes not showing for flatpak apps

This release also updates translations:
 * Bokm=C3=A5l, Norwegian (Brage Fuglseth)
 * Catalan (Victor Dargallo)
 * Friulian (Fabio Tomat)
 * Greek, Modern (1453-) (Efstathios Iosifidis)
 * Persian (Danial Behzadi)
 * Romanian (Antonio Marin)
 * Serbian (=D0=9C=D0=B8=D0=BB=D0=BE=D1=88 =D0=9F=D0=BE=D0=BF=D0=BE=D0=B2=
=D0=B8=D1=9B)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-software_49.1.bb =3D> gnome-software_49.2.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-software/{gnome-software_49.1.bb =3D=
> gnome-software_49.2.bb} (92%)

diff --git a/meta-gnome/recipes-gnome/gnome-software/gnome-software_49.1.=
bb b/meta-gnome/recipes-gnome/gnome-software/gnome-software_49.2.bb
similarity index 92%
rename from meta-gnome/recipes-gnome/gnome-software/gnome-software_49.1.b=
b
rename to meta-gnome/recipes-gnome/gnome-software/gnome-software_49.2.bb
index 9c441f5b2f..5c8be9bfb1 100644
--- a/meta-gnome/recipes-gnome/gnome-software/gnome-software_49.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-software/gnome-software_49.2.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fc=
e4486a80fdaf4a4263"
=20
 GTKDOC_MESON_OPTION ?=3D "gtk_doc"
=20
-inherit gnomebase gsettings itstool gnome-help gtk-icon-cache gtk-doc mi=
me mime-xdg gettext upstream-version-is-even features_check
+inherit gnomebase gsettings itstool gnome-help gtk-icon-cache gtk-doc mi=
me mime-xdg gettext upstream-version-is-even features_check pkgconfig
=20
 REQUIRED_DISTRO_FEATURES =3D "x11 polkit systemd pam"
=20
@@ -29,7 +29,7 @@ RDEPENDS:${PN} =3D "iso-codes"
 EXTRA_OEMESON +=3D "-Dtests=3Dfalse"
=20
 SRC_URI +=3D "file://0001-meson.build-dont-look-for-flatpak-http_backend=
-varia.patch"
-SRC_URI[archive.sha256sum] =3D "49dfeca77928801756d0c5386c1d20454ca07760=
0a5d1ed66ec46ee33a32c66d"
+SRC_URI[archive.sha256sum] =3D "b610b6932a8d666432bc58d6c78c4568cd63d442=
ae736db8be2c4ca01bbc946c"
=20
 PACKAGECONFIG ?=3D "flatpak"
 PACKAGECONFIG[flatpak] =3D "-Dflatpak=3Dtrue,-Dflatpak=3Dfalse,flatpak o=
stree"
--=20
2.52.0


