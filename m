Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EF28CF9C4B
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 15:08:31 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.20592.1726844889967623063
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Sep 2024 08:08:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout01.t-online.de (Postfix) with SMTP id B9225DE44
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 17:07:43 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.38.23]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1srfET-3JaG0O0; Fri, 20 Sep 2024 17:07:41 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 08/23] gnome-online-accounts: update 3.50.2 -> 3.52.0
Date: Fri, 20 Sep 2024 17:08:07 +0200
Message-ID: <20240920150822.1131707-8-f_l_k@t-online.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240920150822.1131707-1-f_l_k@t-online.de>
References: <20240920150822.1131707-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1726844861-24FF7467-4A850159/0/0 CLEAN NORMAL
X-TOI-MSGID: 11d85084-09a2-4519-a742-3476fedea3cd
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 15:08:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112410

- inherit gi_docgen to make api-documentation available
- Add PACKAGECONFIG for manpages to not fail because they are built now
  by default
- Add missing keyutils dependency

Overview of changes in 3.52.0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
* Translation updates:
  - Bulgarian (Alexander Shopov, twlvnn kraftwerk)
  - Catalan (Jordi Mas i Hernandez)
  - Czech (Daniel Rusek)
  - Danish (Ask Hjorth Larsen)
  - English (United Kingdom) (Andi Chandler)
  - French (Ir=C3=A9n=C3=A9e THIRION)
  - Galician (Fran Dieguez)
  - German (Tim Sabsch)
  - Indonesian (Andika Triwidada)
  - Lithuanian (Aurimas =C4=8Cernius)
  - Polish (Piotr Dr=C4=85g)
  - Russian (Artur S0)
  - Slovak (Du=C5=A1an Kazik)
  - Spanish (Daniel)
  - Swedish (Anders Jonsson)
  - Turkish (Sabri =C3=9Cnal)
Overview of changes in 3.51.3
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
* Accessibility fixes and event announcements
* Translation updates
Overview of changes in 3.51.2
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
* Adopt a less aggressive notification policy
* Translation updates
Overview of changes in 3.51.1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
* Enable Mail, Calendar & Contacts for Microsoft 365
* Improvements to Microsoft 365 setup dialog
* Use AdwButtonRow when applicable
* Allow overriding dependencies supporting built as a meson wrap
* Refactor web browser authentication flow as a discrete task
* Improve error reporting and notification for providers
* Document configuration files used by the daemon
* Correctly save and reset settings for TLS certificate errors
Overview of changes in 3.51.0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
* Support Mail Autoconfig XML for IMAP/SMTP services
* Support SRV lookups for DAV services
* Support Linux's KEYRING notification pipe for Kerberos
* Ability to restrict which services of a particular account type are ava=
ilable
* Add version CLI flag for goa-daemon
* Port to AdwDialog and AdwAlertDialog
* Accept GtkWidget as a top-level for account setup
* Port documentation to gi-docgen
* Documentation and manual pages are enabled by default
* Fixes for bugs found by Coverity Scan
* Fix libsoup error handling
* Translation fixes and missing strings
* Translation updates

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...ccounts_3.50.2.bb =3D> gnome-online-accounts_3.52.0.bb} | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-online-accounts/{gnome-online-acco=
unts_3.50.2.bb =3D> gnome-online-accounts_3.52.0.bb} (72%)

diff --git a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-=
accounts_3.50.2.bb b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome=
-online-accounts_3.52.0.bb
similarity index 72%
rename from meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-a=
ccounts_3.50.2.bb
rename to meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-acc=
ounts_3.52.0.bb
index adce70770..a24458d1d 100644
--- a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-account=
s_3.50.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-account=
s_3.52.0.bb
@@ -3,12 +3,12 @@ LICENSE =3D "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D34c88b124db5fb2762c1676be7dad=
d36"
=20
 GTKIC_VERSION =3D "4"
-inherit gnomebase gsettings gobject-introspection gtk-icon-cache mime-xd=
g vala features_check
+inherit gnomebase gsettings gobject-introspection gi-docgen gtk-icon-cac=
he mime-xdg vala features_check
 REQUIRED_DISTRO_FEATURES =3D "${@bb.utils.contains('PACKAGECONFIG', 'goa=
backend', 'opengl', '', d)}"
=20
-DEPENDS +=3D "gdk-pixbuf dbus glib-2.0 gcr"
+DEPENDS +=3D "gdk-pixbuf dbus glib-2.0 gcr keyutils"
=20
-SRC_URI[archive.sha256sum] =3D "df16ad975d139c6bfc4ebb2ec8bb8327297a791e=
f2bf0b977c78076af5faa98e"
+SRC_URI[archive.sha256sum] =3D "631953a9d9ea098b268a0bbe2df18cbbec678158=
9cac6b0455214609ee12bbd8"
=20
 PACKAGECONFIG ?=3D "goabackend kerberos owncloud google windows_live"
=20
@@ -18,11 +18,14 @@ PACKAGECONFIG[exchange] =3D "-Dexchange=3Dtrue, -Dexc=
hange=3Dfalse"
 PACKAGECONFIG[google] =3D "-Dgoogle=3Dtrue, -Dgoogle=3Dfalse"
 PACKAGECONFIG[owncloud] =3D "-Downcloud=3Dtrue, -Downcloud=3Dfalse"
 PACKAGECONFIG[windows_live] =3D "-Dwindows_live=3Dtrue, -Dwindows_live=3D=
false"
+PACKAGECONFIG[man] =3D "-Dman=3Dtrue, -Dman=3Dfalse,libxslt-native docbo=
ok-xsl-stylesheets-native"
=20
 FILES:${PN} +=3D " \
     ${datadir}/dbus-1 \
     ${libdir}/goa-1.0/web-extensions/*.so \
 "
=20
+GIDOCGEN_MESON_OPTION =3D 'documentation'
+
 # looked into pkg-config file: it is not a bug - they mean it
 FILES:${PN}-dev +=3D "${libdir}/goa-1.0/include"
--=20
2.46.0


