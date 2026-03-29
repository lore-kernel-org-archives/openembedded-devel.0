Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60734F3D613
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 16:37:38 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32715.1774802251309170907
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Mar 2026 09:37:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=gpSUVlTU;
 spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout10.t-online.de (Postfix) with SMTP id C103637AD4
	for <openembedded-devel@lists.openembedded.org>; Sun, 29 Mar 2026 18:37:28 +0200 (CEST)
Received: from fedora.fritz.box ([79.219.236.193]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1w6t8f-4PNMYL0; Sun, 29 Mar 2026 18:37:25 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/2] gnome-software: update 49.2 -> 50.0
Date: Sun, 29 Mar 2026 18:37:16 +0200
Message-ID: <20260329163717.150915-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1774802245-86FFA829-DC120F7C/0/0 CLEAN NORMAL
X-TOI-MSGID: 91b318b8-6ab2-49b3-ae67-7e3ac9289423
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1774802248; i=f_l_k@t-online.de;
	bh=qUPwxBF9TI48d2xQ7Zd70wd+h6RNnlFgGgos21in2dM=;
	h=From:To:Subject:Date;
	b=gpSUVlTUVYmbmwpSqJIJsmUyIdcBVhYO0tTgwxAdLRkDTEdPeu32t/Be9dlufodzO
	 q39n7N3rpjXlg7sQ52uLgfv+RlRSAv9f+76xyhpXFEyNQSQKgn7Nah4MIIi++J0Gnt
	 DtFBseYt6KJVWEBSwoD3ZkMr0H8pMWExdbuVO+IPqV3S5DAjXIHEt+W4Rw7/RqBOvZ
	 Rc+1cd6ZP/fuGUhW50uI4BD8WdZCB5+Zw5/LnmKlthnBnk11YFKl415ANxyTZNtgno
	 yL7x5bgSHwmYT54bPdksiPdu5g5FqOev09n/y9hqSHu1xjFQex5/xjopXKWerbp20U
	 sbewh2b4mV0WA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 29 Mar 2026 16:37:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125804

Version 50.0
~~~~~~~~~~~~
Released: 2026-03-13
This is a stable release with updated translations:
 * Danish (Alan Mortensen)
 * English (United Kingdom) (Bruce Cowan)
 * Japanese (=E5=B0=8F=E5=B1=B1=E7=94=B0 =E7=B4=94 - Oyamada Jun)
 * Occitan (post 1500) (Quentin PAG=C3=88S)
 * Polish (Victoria)
 * Portuguese (Hugo Carvalho)
Version 50~rc
~~~~~~~~~~~~~
Released: 2026-02-27
This is an unstable release with the following changes:
 * Remember window size between app restarts
 * Updates page could be sometimes hidden after resume from suspend
 * Allow remove also Flatpak remotes from system installation
 * Correct check for add-ons when app's ID changed
 * Improve socket permissions checks for Flatpak apps
This release also updates translations:
 * Basque (Asier Saratsua Garmendia)
 * Catalan (Jordi Mas, Victor Dargallo)
 * Chinese (China) (luming zh)
 * Czech (Daniel Rusek)
 * Finnish (Jiri Gr=C3=B6nroos)
 * French (Lucien Ouoba, Guillaume Bernard)
 * Galician (Fran Di=C3=A9guez)
 * German (Christian Kirbach)
 * Greek, Modern (1453-) (Efstathios Iosifidis)
 * Hungarian (Bal=C3=A1zs =C3=9Ar)
 * Interlingua (International Auxiliary Language Association) (Emilio Sep=
=C3=BAlveda)
 * Italian (Davide Ferracin)
 * Japanese (Makoto Sakaguchi)
 * Kazakh (Baurzhan Muftakhidinov)
 * Korean (Seong-ho Cho)
 * Spanish (Daniel Mustieles)
 * Swedish (Anders Jonsson)
 * Turkish (Sabri =C3=9Cnal)
Version 50~beta
~~~~~~~~~~~~~~~
Released: 2026-01-30
This is an unstable release with the following changes:
 * Show install and uninstall progress of an add-on
 * Use lower thread priority when running in background
 * Fix possible crash on session permission change
 * Fix possible crash after XbSilo rebuild
This release also updates translations:
 * Bulgarian (twlvnn kraftwerk)
 * Georgian (Ekaterine Papava)
 * Hebrew (Yaron Shahrabani)
 * Indonesian (Andika Triwidada)
 * Kazakh (Baurzhan Muftakhidinov)
 * Lithuanian (Aurimas Aurimas =C4=8Cernius)
 * Portuguese (Brazil) (Juliano de Souza Camargo)
 * Romanian (Antonio Marin)
 * Russian (Artur S0)
 * Slovenian (Martin)
 * Uighur (Abduqadir Abliz)
 * Ukrainian (Yuri Chornoivan)
Version 50~alpha
~~~~~~~~~~~~~~~~
Released: 2026-01-15

This is an unstable release with the following changes:
 * Improve display of long repository names
 * Clarify warning about removing data when uninstalling an app
 * Fix minor UI issues when scrolling using gestures on a touchpad
 * Don=E2=80=99t show firmware warning on Installed Updates page
 * Several fixes to update history on rpm-ostree systems
 * Improve notifying the user about newly installed trivial flatpak app u=
pdates
 * Improve display of keyboard shortcuts
 * Split rpm-ostree changelogs by app
 * Display error toasts in the repositories dialog when something goes wr=
ong
This release also updates translations:
 * Catalan (Victor Dargallo)
 * Indonesian (Andika Triwidada)
 * Japanese (Makoto Sakaguchi)
 * Kazakh (Baurzhan Muftakhidinov)
 * Portuguese (Hugo Carvalho)
 * Portuguese (Brazil) (Juliano de Souza Camargo)
 * Russian (Artur S0)
 * Slovenian (Martin)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...-look-for-flatpak-http_backend-varia.patch | 56 -------------------
 ...oftware_49.2.bb =3D> gnome-software_50.0.bb} |  3 +-
 2 files changed, 1 insertion(+), 58 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-software/gnome-softwar=
e/0001-meson.build-dont-look-for-flatpak-http_backend-varia.patch
 rename meta-gnome/recipes-gnome/gnome-software/{gnome-software_49.2.bb =3D=
> gnome-software_50.0.bb} (88%)

diff --git a/meta-gnome/recipes-gnome/gnome-software/gnome-software/0001-=
meson.build-dont-look-for-flatpak-http_backend-varia.patch b/meta-gnome/r=
ecipes-gnome/gnome-software/gnome-software/0001-meson.build-dont-look-for=
-flatpak-http_backend-varia.patch
deleted file mode 100644
index 2296b7acd2..0000000000
--- a/meta-gnome/recipes-gnome/gnome-software/gnome-software/0001-meson.b=
uild-dont-look-for-flatpak-http_backend-varia.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 4588a3d34f574619c6f3a4290d53e2ac063ab56a Mon Sep 17 00:00:00 2001
-From: Markus Volk <f_l_k@t-online.de>
-Date: Thu, 25 Dec 2025 20:04:49 +0100
-Subject: [PATCH] meson.build: dont look for flatpak http_backend variabl=
e
-
-flatpak 1.17.1 release dropped libsoup2 support:
-[https://github.com/flatpak/flatpak/blob/c324778b0720cb2d01c217fdc70358e=
232c38b4d/NEWS#L20]
-
-* Drop libsoup2 support in favor of libcurl. The `http_backend` build op=
tion has
-  been dropped as well. (#6395)
-
-gnome-software still searches for the http_backend variable and fails:
- ../sources/gnome-software-49.1/meson.build:218:32: ERROR: Could not get=
 pkg-config variable and no default provided for <PkgConfigDependency fla=
tpak: True ['>=3D 1.14.1']>
-
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
-
-Upstream-Status: Inappropriate
----
- meson.build | 20 +-------------------
- 1 file changed, 1 insertion(+), 19 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 3704e2abc..7e0496a22 100644
---- a/meson.build
-+++ b/meson.build
-@@ -212,26 +212,8 @@ if get_option('fwupd')
- endif
-=20
- if get_option('flatpak')
--  flatpak =3D dependency('flatpak', version : '>=3D 1.14.1')
-+  flatpak =3D dependency('flatpak', version : '>=3D 1.17.1')
-   ostree =3D dependency('ostree-1')
--
--  flatpak_httpbackend =3D flatpak.get_variable('httpbackend')
--  if flatpak_httpbackend =3D=3D 'soup'
--    flatpak_soupapiversion =3D flatpak.get_variable('soupapiversion', d=
efault_value: '2')
--    if flatpak_soupapiversion.version_compare('< 3')
--      error('''Flatpak library has been built with 'libsoup2' http back=
end, which conflicts with 'libsoup3' used by gnome-software.
--
--You can either:
--
--1. Build gnome-software without flatpak support (with -Dflatpak=3Dfalse=
) or
--2. Rebuild flatpak library with http backend other than 'libsoup2'.''')
--    else
--      flatpak_summary =3D '@0@ (@1@)'.format(flatpak_httpbackend, flatp=
ak_soupapiversion)
--    endif
--  else
--    flatpak_summary =3D flatpak_httpbackend
--  endif
--  summary('Flatpak http backend', '@0@'.format(flatpak_summary), sectio=
n : 'Misc')
- endif
-=20
- if get_option('malcontent')
---=20
-2.52.0
-
diff --git a/meta-gnome/recipes-gnome/gnome-software/gnome-software_49.2.=
bb b/meta-gnome/recipes-gnome/gnome-software/gnome-software_50.0.bb
similarity index 88%
rename from meta-gnome/recipes-gnome/gnome-software/gnome-software_49.2.b=
b
rename to meta-gnome/recipes-gnome/gnome-software/gnome-software_50.0.bb
index 5c8be9bfb1..0cbf238181 100644
--- a/meta-gnome/recipes-gnome/gnome-software/gnome-software_49.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-software/gnome-software_50.0.bb
@@ -28,8 +28,7 @@ RDEPENDS:${PN} =3D "iso-codes"
=20
 EXTRA_OEMESON +=3D "-Dtests=3Dfalse"
=20
-SRC_URI +=3D "file://0001-meson.build-dont-look-for-flatpak-http_backend=
-varia.patch"
-SRC_URI[archive.sha256sum] =3D "b610b6932a8d666432bc58d6c78c4568cd63d442=
ae736db8be2c4ca01bbc946c"
+SRC_URI[archive.sha256sum] =3D "3515e2015f235b6abb7a342806008acb1f184c29=
d9c4ced3581f8ed4c1f1c241"
=20
 PACKAGECONFIG ?=3D "flatpak"
 PACKAGECONFIG[flatpak] =3D "-Dflatpak=3Dtrue,-Dflatpak=3Dfalse,flatpak o=
stree"
--=20
2.53.0


