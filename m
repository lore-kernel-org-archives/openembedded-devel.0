Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A70DC54E58
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 21:14:52 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.3612.1711401283835242024
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Mar 2024 14:14:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout05.t-online.de (Postfix) with SMTP id 2CD1E2DD0
	for <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 22:14:21 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.34.236]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rore8-0pBZRJ0; Mon, 25 Mar 2024 22:14:20 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] file-roller: update 43.1 -> 44.0
Date: Mon, 25 Mar 2024 22:14:42 +0100
Message-ID: <20240325211442.15463-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1711401260-5DF5F979-B679CF54/0/0 CLEAN NORMAL
X-TOI-MSGID: 259dda99-ada7-4973-95bf-a50f5af1a081
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 21:14:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109609

- file-roller was ported to gtk4
- use the git fetcher because there is not (yet?) a tarball release

Version 44
~~~~~~~~~~
Released: 2024-03-24

Bugfixes:
 * Fixes compilation when native app chooser is disabled
   (Amin Bandali) (!227)

Translations:
 * French - France (Jean-Marc Tissi=C3=A8res)
 * Hungarian (Bal=C3=A1zs =C3=9Ar)
 * Kabyle (ButterflyOfFire)
 * Slovenian (Martin Srebotnjak)

Version 44.beta
~~~~~~~~~~~~~~~
Released: 2024-03-10

Bugfixes:
 * window: Fix incompatible pointer types (David King) (!225)
 * appdata: Fix reverse DNS developer id (Maximiliano Sandoval)

Translations:
 * Catalan (Jordi Mas i Hern=C3=A0ndez)
 * Kazakh (Baurzhan Muftakhidinov)
 * Latvian (R=C5=ABdolfs Mazurs)

Version 44.alpha
~~~~~~~~~~~~~~~~
Released: 2024-02-18

Features:
 * Ported to GTK4

Bugfixes:
 * Fixed filenames when opening from google-drive. (FeRD (Frank Dana)) (!=
212)
 * Disable broken deb package support. (Bastien Nocera) (!14)
 * properties.ui: fixed typo (!215)
 * new-archive-dialog: fixed untranslatable row name (!213)
 * Retire AppMenu and remove redundant codes. (Sabri =C3=9Cnal) (!63)
 * appdata: file-roller is no longer default in GNOME (Anders Jonsson)
   (!210)
 * Redo the headerbar button tooltips to follow the GNOME HIG recommendat=
ions.
   (Jake Dane) (!189)
 * doap: Remove rdf resource (Maximiliano Sandoval R) (!35)

Translations:
 * Abkhazian (=D0=9D=D0=B0=D0=BD=D0=B1=D0=B0 =D0=9D=D0=B0=D0=B0=D0=BB=D0=B0=
)
 * Basque (Asier Sarasua Garmendia)
 * Belarusian (Yuras Shumovich)
 * Catalan (Jordi Mas i Hern=C3=A0ndez)
 * Chinese (Traditional) <http://darkbear.mercusysddns.com/ (Cheng-Chia
   Tseng)
 * Chinese - China (lumingzh)
 * Danish (Alan Mortensen)
 * Deutsch (J=C3=BCrgen Benvenuti)
 * Dutch (Nathan Follens)
 * Friulian (Fabio Tomat)
 * Galician (Fran Dieguez)
 * Georgian (Ekaterine Papava)
 * Hebrew (Yosef Or Boczko)
 * Hungarian (Bal=C3=A1zs =C3=9Ar)
 * Icelandic (Sveinn =C3=AD Felli)
 * IE (OIS)
 * Indonesian (Kukuh Syafaat)
 * Kazakh (Baurzhan Muftakhidinov)
 * Nepali (Pawan Chitrakar)
 * Persian (Danial Behzadi)
 * Polish (Piotr Dr=C4=85g)
 * Romanian (Florentina Mu=C8=99at)
 * Slovak (Du=C5=A1an Kazik)
 * Slovenian (Martin Srebotnjak)
 * Spanish - Spain (Daniel Mustieles)
 * suomi (Jiri Gr=C3=B6nroos)
 * Swedish (Anders Jonsson)
 * Turkish (Sabri =C3=9Cnal)
 * Ukrainian (Yuri Chornoivan)
 * Vietnamese (Tr=E1=BA=A7n Ng=E1=BB=8Dc Qu=C3=A2n)
 * =C4=8De=C5=A1tina (Daniel Rusek)
 * =CE=95=CE=BB=CE=BB=CE=B7=CE=BD=CE=B9=CE=BA=CE=AC (Efstathios Iosifidis=
)
 * =D0=A0=D1=83=D1=81=D1=81=D0=BA=D0=B8=D0=B9 (Ser82-png)

Help translations:
 * Chinese (China) (Boyuan Yang)
 * Galician <Proxecto Trasno (Fran Dieguez)
 * Polish (Piotr Dr=C4=85g)
 * Swedish (Anders Jonsson)
 * Turkish (Sabri =C3=9Cnal)
 * Ukrainian (Yuri Chornoivan)
 * =D1=80=D1=83=D1=81=D1=81=D0=BA=D0=B8=D0=B9 (Ser82-png)

Version 43.0
----------------
Released: 2022-09-17

New features and user visible changes:

- Add read-only support for Apple=E2=80=99s `dmg` image format through 7-=
zip (!85)

Bugs fixed:

- Prevent libarchive backend from writing endless padding when extracting=
 RAR archives (!87)

Other changes:

- Various source code clean-ups (!86)

Translation updates:

- Abkhazian (Nart Tlisha)
- Basque (Asier Sarasua Garmendia)
- Brazilian Portuguese (Enrico Nicoletto)
- Bulgarian (Alexander Shopov)
- Catalan (Jordi Mas)
- Chinese (China) (Luming Zh)
- Czech (Marek =C4=8Cernock=C3=BD)
- Danish (Alan Mortensen)
- Finnish (Jiri Gr=C3=B6nroos)
- French (Ir=C3=A9n=C3=A9e THIRION)
- Galician (Fran Dieguez)
- German (J=C3=BCrgen Benvenuti)
- Hungarian (Bal=C3=A1zs =C3=9Ar)
- Indonesian (Kukuh Syafaat)
- Korean (Seong-ho Cho)
- Latvian (R=C5=ABdolfs Mazurs)
- Lithuanian (Aurimas =C4=8Cernius)
- Occitan (Quentin PAG=C3=88S)
- Persian (Danial Behzadi)
- Polish (Piotr Dr=C4=85g)
- Portuguese (Hugo Carvalho)
- Russian (Aleksandr Melman)
- Serbian (=D0=9C=D0=B0=D1=80=D0=BA=D0=BE =D0=9A=D0=BE=D1=81=D1=82=D0=B8=D1=
=9B)
- Slovenian (Matej Urban=C4=8Di=C4=8D)
- Spanish (Daniel Mustieles)
- Turkish (Sabri =C3=9Cnal)
- Ukrainian (Yuri Chornoivan)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{file-roller_43.1.bb =3D> file-roller_44.0.bb}           | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/file-roller/{file-roller_43.1.bb =3D> fi=
le-roller_44.0.bb} (84%)

diff --git a/meta-gnome/recipes-gnome/file-roller/file-roller_43.1.bb b/m=
eta-gnome/recipes-gnome/file-roller/file-roller_44.0.bb
similarity index 84%
rename from meta-gnome/recipes-gnome/file-roller/file-roller_43.1.bb
rename to meta-gnome/recipes-gnome/file-roller/file-roller_44.0.bb
index 0b9dd741f..3daa1b570 100644
--- a/meta-gnome/recipes-gnome/file-roller/file-roller_43.1.bb
+++ b/meta-gnome/recipes-gnome/file-roller/file-roller_44.0.bb
@@ -8,7 +8,8 @@ DEPENDS =3D " \
     glib-2.0-native \
     glib-2.0 \
     json-glib \
-    gtk+3 \
+    gtk4 \
+    libadwaita \
     libarchive \
     libhandy \
     libportal \
@@ -20,7 +21,9 @@ REQUIRED_DISTRO_FEATURES =3D "opengl"
=20
 EXTRA_OEMESON +=3D "-Dintrospection=3Denabled"
=20
-SRC_URI[archive.sha256sum] =3D "84994023997293beb345d9793db8f5f0bbb41faa=
155c6ffb48328f203957ad08"
+SRC_URI =3D "git://gitlab.gnome.org/GNOME/file-roller.git;protocol=3Dhtt=
ps;branch=3Dmaster"
+SRCREV =3D "f1c7714cf4c8989b9f3fa4c611887c29cf6df343"
+S =3D "${WORKDIR}/git"
=20
 PACKAGECONFIG ??=3D ""
=20
--=20
2.44.0


