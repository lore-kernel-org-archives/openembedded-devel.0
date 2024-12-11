Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84BC2E7717D
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 18:58:55 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.2625.1733943525393791265
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Dec 2024 10:58:45 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout04.t-online.de (Postfix) with SMTP id B7564C3C
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Dec 2024 19:58:42 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.33.231]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tLRuw-1SZxpp0; Wed, 11 Dec 2024 19:58:38 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] file-roller: update 44.3 -> 44.4
Date: Wed, 11 Dec 2024 19:58:43 +0100
Message-ID: <20241211185843.32849-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1733943518-F77FDA55-6D2AC837/0/0 CLEAN NORMAL
X-TOI-MSGID: 9bca0031-e397-4456-94aa-a34a98b666e3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Dec 2024 18:58:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114283

- use tarball release

Version 44.4
~~~~~~~~~~~~
Released: 2024-11-24

Features:
 * Added bzip3 support. (!266)
 * File selector: show volumes and allow to mount unmounted volumes. (!25=
8)
 * New archive dialog: allow to use all the possible extensions a mime ty=
pe
   supports, and allow to specify a name without extension, which will be
   concatenated to the selected extension to get the full name. (!275) (!=
267)
 * File selector: save and restore the sort order. (!246)
 * Properties dialog: show an icon, make the headerbar flat.

Bugfixes:
 * Error opening rar archive in RAR4 format and password protected. (!279=
)
 * Rar: fixed file list parsing for some encrypted archives. (!277)
 * Fixed error when renaming a file inside an encrypted archive. (!276)
 * Disabled the native appchooser by default. (!217)
 * 'Show destination' sometimes opens the wrong folder. (!255)
 * 'Show destination' sometimes doesn't show anything.
 * Use the native appchooser only for a single file. (!221)
 * Show flat headerbar in empty state. (!216)
 * Fixed error messages impossible to close. (!257)
 * Fixed segfaults when opening an empty .deb file. (!253)
 * --extract-to keeps asking to create a directory. (!254)
 * Fixed wrong context menu item activation. (!268)
 * Avoid the exit timeout unless file-roller was launched with `--service=
`. (FeRD (Frank
   Dana)) (!34)
 * Error when opening the created archive after saving as 7zip multi-volu=
me.

Translations:
 * Belarusian (Yuras Shumovich)
 * Brazilian Portuguese (Juliano de Souza Camargo)
 * English - United Kingdom (Andi Chandler)
 * Hindi (Scrambled777)
 * Portuguese (Hugo Carvalho)
 * Slovak (Du=C5=A1an Kazik)
 * srpski (Marko M. Kosti=C4=87)
 * Thai (Theppitak Karoonboonyanan)
 * =D1=81=D1=80=D0=BF=D1=81=D0=BA=D0=B8 (=D0=9C=D0=B0=D1=80=D0=BA=D0=BE =D0=
=9C. =D0=9A=D0=BE=D1=81=D1=82=D0=B8=D1=9B)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{file-roller_44.3.bb =3D> file-roller_44.4.bb}            | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta-gnome/recipes-gnome/file-roller/{file-roller_44.3.bb =3D> fi=
le-roller_44.4.bb} (86%)

diff --git a/meta-gnome/recipes-gnome/file-roller/file-roller_44.3.bb b/m=
eta-gnome/recipes-gnome/file-roller/file-roller_44.4.bb
similarity index 86%
rename from meta-gnome/recipes-gnome/file-roller/file-roller_44.3.bb
rename to meta-gnome/recipes-gnome/file-roller/file-roller_44.4.bb
index a195d43f0c..8f2c6b7fe5 100644
--- a/meta-gnome/recipes-gnome/file-roller/file-roller_44.3.bb
+++ b/meta-gnome/recipes-gnome/file-roller/file-roller_44.4.bb
@@ -17,14 +17,12 @@ DEPENDS =3D " \
=20
 inherit gnomebase gsettings itstool gobject-introspection gnome-help get=
text upstream-version-is-even mime-xdg gtk-icon-cache features_check
=20
+SRC_URI[archive.sha256sum] =3D "b8c309da3aa784c719558c3466402378f4a3d6ca=
e8ed77cf6849aacd56ceb9ec"
+
 REQUIRED_DISTRO_FEATURES =3D "opengl"
=20
 EXTRA_OEMESON +=3D "-Dintrospection=3Denabled"
=20
-SRC_URI =3D "git://gitlab.gnome.org/GNOME/file-roller.git;protocol=3Dhtt=
ps;branch=3Dmaster"
-SRCREV =3D "d4f3b970bd7dd07d8f539433628eba10551aa629"
-S =3D "${WORKDIR}/git"
-
 PACKAGECONFIG ??=3D ""
=20
 PACKAGECONFIG[nautilus] =3D "-Dnautilus-actions=3Denabled,-Dnautilus-act=
ions=3Ddisabled,nautilus"
--=20
2.47.0


