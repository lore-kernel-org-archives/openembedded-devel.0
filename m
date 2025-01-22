Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91B1DC02182
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 19:23:46 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.2544.1737573816968700669
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jan 2025 11:23:37 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout12.t-online.de (Postfix) with SMTP id 6941B621
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jan 2025 20:23:02 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.37.54]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tagJZ-3Hgq7V0; Wed, 22 Jan 2025 20:23:01 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/2] gnome-shell: update 47.2 -> 47.3
Date: Wed, 22 Jan 2025 20:23:08 +0100
Message-ID: <20250122192309.935004-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1737573781-367FB9C7-358F2CA9/0/0 CLEAN NORMAL
X-TOI-MSGID: 52a4050c-8e56-4087-bec1-a399c39fe90f
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jan 2025 19:23:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115021

47.3
=3D=3D=3D=3D
* Fix Escape handling in run dialog [Florian; !3585]
* Fix custom text-scaling-factor getting reset [Matthijs; !3574]
* Tweak ibus candidate popover appearance [AuralRay; !3584]
* Misc. bug fixes and cleanups [Florian, Bilal, Michel, Bart=C5=82omiej, =
Alberto,
  AsciiWolf, Jakub; !3563, !3547, !3573, !3525, !3572, !3580, !3578, !357=
6,
  !3579, !3589, !3587, !3593]

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...-shell-extensions_47.2.bb =3D> gnome-shell-extensions_47.3.bb} | 2 +-
 .../gnome-shell/{gnome-shell_47.2.bb =3D> gnome-shell_47.3.bb}    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-shell/{gnome-shell-extensions_47.2=
.bb =3D> gnome-shell-extensions_47.3.bb} (84%)
 rename meta-gnome/recipes-gnome/gnome-shell/{gnome-shell_47.2.bb =3D> gn=
ome-shell_47.3.bb} (95%)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_=
47.2.bb b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_47.=
3.bb
similarity index 84%
rename from meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_4=
7.2.bb
rename to meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_47.=
3.bb
index 6567704c47..151e57e887 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_47.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_47.3.bb
@@ -6,7 +6,7 @@ inherit gnomebase gettext gsettings features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "x11 polkit systemd pam gobject-introspecti=
on-data"
=20
-SRC_URI[archive.sha256sum] =3D "dd774a0291584917abde88bbc4eccf9244178e3c=
269ce0618d0495177c12652d"
+SRC_URI[archive.sha256sum] =3D "1a9142a4e85d7a2b7dc5bad37e34df9eebb38e84=
96f4938be2d7b2b35883d139"
=20
 EXTRA_OEMESON +=3D " \
     -Dextension_set=3Dall \
diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_47.2.bb b/m=
eta-gnome/recipes-gnome/gnome-shell/gnome-shell_47.3.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/gnome-shell/gnome-shell_47.2.bb
rename to meta-gnome/recipes-gnome/gnome-shell/gnome-shell_47.3.bb
index 417f0a1816..b3fba01eee 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_47.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_47.3.bb
@@ -33,7 +33,7 @@ GIR_MESON_OPTION =3D ""
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES +=3D "gobject-introspection-data"
=20
-SRC_URI[archive.sha256sum] =3D "4184d01a1ab82cb421d1ca2e2bcce0292ceb46c4=
c749e61b0bde4b75004d2e00"
+SRC_URI[archive.sha256sum] =3D "783deb9a086511e4a53db10574bfbba695576f69=
8078218ca6c80cb1efec293e"
=20
 PACKAGECONFIG ??=3D "bluetooth nm ${@bb.utils.filter('DISTRO_FEATURES', =
'systemd', d)}"
 PACKAGECONFIG[bluetooth] =3D ",,gnome-bluetooth"
--=20
2.47.1


