Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44A36C54E6A
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 08:04:23 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.37938.1710749058622119792
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 01:04:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout03.t-online.de (Postfix) with SMTP id 689991B459
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Mar 2024 09:03:48 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.38.150]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rm7yD-1GnKt70; Mon, 18 Mar 2024 09:03:45 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/3] gnome-online-accounts: update 3.48.0 -> 3.50.0
Date: Mon, 18 Mar 2024 09:04:10 +0100
Message-ID: <20240318080412.1454-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1710749025-867FA383-0C91F340/0/0 CLEAN NORMAL
X-TOI-MSGID: 2a12ef43-21a8-4c0f-83ac-ec2217bbf8ef
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Mar 2024 08:04:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109401

- gnome-online-accounts was ported to gtk4/gcr4
- drop patches that have been included
- lastfm support was dropped
- add missing mime-xdg class
- use gtk4 for gtk-icon-cache

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../0001-Replace-filename-with-basename.patch | 104 ------------------
 ...abackend-Fix-build-with-libxml2-2.12.patch |  28 -----
 ...8.0.bb =3D> gnome-online-accounts_3.50.0.bb} |  18 ++-
 3 files changed, 7 insertions(+), 143 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-online-accounts/gnome-=
online-accounts/0001-Replace-filename-with-basename.patch
 delete mode 100644 meta-gnome/recipes-gnome/gnome-online-accounts/gnome-=
online-accounts/0001-goabackend-Fix-build-with-libxml2-2.12.patch
 rename meta-gnome/recipes-gnome/gnome-online-accounts/{gnome-online-acco=
unts_3.48.0.bb =3D> gnome-online-accounts_3.50.0.bb} (59%)

diff --git a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-=
accounts/0001-Replace-filename-with-basename.patch b/meta-gnome/recipes-g=
nome/gnome-online-accounts/gnome-online-accounts/0001-Replace-filename-wi=
th-basename.patch
deleted file mode 100644
index 9bb1d6bb5..000000000
--- a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-account=
s/0001-Replace-filename-with-basename.patch
+++ /dev/null
@@ -1,104 +0,0 @@
-From c4a2951f8a75c4151f009e42b26639e4f456d5a2 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 27 May 2023 14:41:28 -0700
-Subject: [PATCH] Replace filename with basename
-
-This avoids emitting absolute paths into generated sourcecode, it
-improves reproducibility. See [1]
-
-[1] https://developer-old.gnome.org/gobject/stable/glib-mkenums.html
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gnome-online-=
accounts/-/merge_requests/125]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/goa/goaenumtypes.c.template               | 2 +-
- src/goa/goaenumtypes.h.template               | 2 +-
- src/goabackend/goabackendenumtypes.c.template | 2 +-
- src/goabackend/goabackendenumtypes.h.template | 2 +-
- src/goaidentity/goaidentityenumtypes.c.in     | 4 ++--
- src/goaidentity/goaidentityenumtypes.h.in     | 2 +-
- 6 files changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/src/goa/goaenumtypes.c.template b/src/goa/goaenumtypes.c.te=
mplate
-index 3150fa71..c2bc4b0a 100644
---- a/src/goa/goaenumtypes.c.template
-+++ b/src/goa/goaenumtypes.c.template
-@@ -5,7 +5,7 @@
- /*** END file-header ***/
-=20
- /*** BEGIN file-production ***/
--/* enumerations from "@filename@" */
-+/* enumerations from "@basename@" */
- /*** END file-production ***/
-=20
- /*** BEGIN value-header ***/
-diff --git a/src/goa/goaenumtypes.h.template b/src/goa/goaenumtypes.h.te=
mplate
-index 040428c3..14548cb4 100644
---- a/src/goa/goaenumtypes.h.template
-+++ b/src/goa/goaenumtypes.h.template
-@@ -9,7 +9,7 @@ G_BEGIN_DECLS
-=20
- /*** BEGIN file-production ***/
-=20
--/* enumerations from "@filename@" */
-+/* enumerations from "@basename@" */
- /*** END file-production ***/
-=20
- /*** BEGIN value-header ***/
-diff --git a/src/goabackend/goabackendenumtypes.c.template b/src/goaback=
end/goabackendenumtypes.c.template
-index 6d2651da..05156bdd 100644
---- a/src/goabackend/goabackendenumtypes.c.template
-+++ b/src/goabackend/goabackendenumtypes.c.template
-@@ -5,7 +5,7 @@
- /*** END file-header ***/
-=20
- /*** BEGIN file-production ***/
--/* enumerations from "@filename@" */
-+/* enumerations from "@basename@" */
- /*** END file-production ***/
-=20
- /*** BEGIN value-header ***/
-diff --git a/src/goabackend/goabackendenumtypes.h.template b/src/goaback=
end/goabackendenumtypes.h.template
-index 7321076e..51ce84bd 100644
---- a/src/goabackend/goabackendenumtypes.h.template
-+++ b/src/goabackend/goabackendenumtypes.h.template
-@@ -9,7 +9,7 @@ G_BEGIN_DECLS
-=20
- /*** BEGIN file-production ***/
-=20
--/* enumerations from "@filename@" */
-+/* enumerations from "@basename@" */
- /*** END file-production ***/
-=20
- /*** BEGIN value-header ***/
-diff --git a/src/goaidentity/goaidentityenumtypes.c.in b/src/goaidentity=
/goaidentityenumtypes.c.in
-index c0286907..8aad7ae4 100644
---- a/src/goaidentity/goaidentityenumtypes.c.in
-+++ b/src/goaidentity/goaidentityenumtypes.c.in
-@@ -5,8 +5,8 @@
- /*** END file-header ***/
-=20
- /*** BEGIN file-production ***/
--#include "@filename@"
--/* enumerations from "@filename@" */
-+#include "@basename@"
-+/* enumerations from "@basename@" */
- /*** END file-production ***/
-=20
- /*** BEGIN value-header ***/
-diff --git a/src/goaidentity/goaidentityenumtypes.h.in b/src/goaidentity=
/goaidentityenumtypes.h.in
-index 35d4d5c5..8719282a 100644
---- a/src/goaidentity/goaidentityenumtypes.h.in
-+++ b/src/goaidentity/goaidentityenumtypes.h.in
-@@ -9,7 +9,7 @@ G_BEGIN_DECLS
-=20
- /*** BEGIN file-production ***/
-=20
--/* enumerations from "@filename@" */
-+/* enumerations from "@basename@" */
- /*** END file-production ***/
-=20
- /*** BEGIN value-header ***/
---=20
-2.40.1
-
diff --git a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-=
accounts/0001-goabackend-Fix-build-with-libxml2-2.12.patch b/meta-gnome/r=
ecipes-gnome/gnome-online-accounts/gnome-online-accounts/0001-goabackend-=
Fix-build-with-libxml2-2.12.patch
deleted file mode 100644
index 3d13779c2..000000000
--- a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-account=
s/0001-goabackend-Fix-build-with-libxml2-2.12.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From a2867ebcf184695eed00aab4e7b47c1d4a53b2b2 Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?J=3DC3=3DBCrg=3D20Billeter?=3D <j@bitron.ch>
-Date: Fri, 24 Nov 2023 16:19:47 +0100
-Subject: [PATCH] goabackend: Fix build with libxml2 2.12
-
-libxml/xmlIO.h no longer includes libxml/parser.h.
-
-Upstream-Status: Backport [https://github.com/GNOME/gnome-online-account=
s/commit/b9638e2418408be4906752297e700506766dcf20]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/goabackend/goaewsclient.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/goabackend/goaewsclient.c b/src/goabackend/goaewsclient=
.c
-index 4cb2358..01a52d1 100644
---- a/src/goabackend/goaewsclient.c
-+++ b/src/goabackend/goaewsclient.c
-@@ -27,6 +27,7 @@
- #include <glib/gi18n-lib.h>
-=20
- #include <libsoup/soup.h>
-+#include <libxml/parser.h>
- #include <libxml/xmlIO.h>
-=20
- #include "goaewsclient.h"
---=20
-2.44.0
-
diff --git a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-=
accounts_3.48.0.bb b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome=
-online-accounts_3.50.0.bb
similarity index 59%
rename from meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-a=
ccounts_3.48.0.bb
rename to meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-acc=
ounts_3.50.0.bb
index fd61d797d..0af4a5d1e 100644
--- a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-account=
s_3.48.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-account=
s_3.50.0.bb
@@ -2,25 +2,21 @@ SUMMARY =3D "GNOME Online Accounts - Single sign-on fra=
mework for GNOME"
 LICENSE =3D "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D34c88b124db5fb2762c1676be7dad=
d36"
=20
+GTKIC_VERSION =3D "4"
+inherit gnomebase gsettings gobject-introspection gtk-icon-cache mime-xd=
g vala features_check
=20
-inherit gnomebase gsettings gobject-introspection gtk-icon-cache vala fe=
atures_check
+DEPENDS +=3D "gdk-pixbuf dbus glib-2.0 gcr"
=20
-DEPENDS =3D "gdk-pixbuf dbus glib-2.0"
+SRC_URI[archive.sha256sum] =3D "b0f64f0dcfbb8885a3a759e1c9de7fb204adb3ce=
6bd32c30bcf52d5533c06d4e"
=20
-SRC_URI +=3D "file://0001-Replace-filename-with-basename.patch \
-            file://0001-goabackend-Fix-build-with-libxml2-2.12.patch"
-SRC_URI[archive.sha256sum] =3D "418bb9fcffdbd72a98205ad365137617fc1e3551=
a54de74f6a98d45d266175bf"
+PACKAGECONFIG ?=3D "goabackend kerberos owncloud google windows_live"
=20
-PACKAGECONFIG ?=3D "goabackend kerberos owncloud lastfm google windows_l=
ive"
-
-# goabackend requires webkitgtk to be built with gtk+3 and gcr3
-PACKAGECONFIG[goabackend] =3D "-Dgoabackend=3Dtrue,-Dgoabackend=3Dfalse,=
gtk+3 gtk+3-native json-glib libxml2 libsoup rest libsecret webkitgtk3"
-PACKAGECONFIG[kerberos] =3D "-Dkerberos=3Dtrue, -Dkerberos=3Dfalse,krb5 =
gcr3"
+PACKAGECONFIG[goabackend] =3D "-Dgoabackend=3Dtrue,-Dgoabackend=3Dfalse,=
gtk4 libadwaita json-glib libxml2 libsoup rest libsecret webkitgtk"
+PACKAGECONFIG[kerberos] =3D "-Dkerberos=3Dtrue, -Dkerberos=3Dfalse,krb5"
 PACKAGECONFIG[exchange] =3D "-Dexchange=3Dtrue, -Dexchange=3Dfalse"
 PACKAGECONFIG[google] =3D "-Dgoogle=3Dtrue, -Dgoogle=3Dfalse"
 PACKAGECONFIG[owncloud] =3D "-Downcloud=3Dtrue, -Downcloud=3Dfalse"
 PACKAGECONFIG[windows_live] =3D "-Dwindows_live=3Dtrue, -Dwindows_live=3D=
false"
-PACKAGECONFIG[lastfm] =3D "-Dlastfm=3Dtrue, -Dlastfm=3Dfalse"
=20
 FILES:${PN} +=3D " \
     ${datadir}/dbus-1 \
--=20
2.44.0


