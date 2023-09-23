Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 511E5CE7A89
	for <webhook@archiver.kernel.org>; Sat, 23 Sep 2023 15:32:01 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.22954.1695483114799105418
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Sep 2023 08:31:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout06.t-online.de (Postfix) with SMTP id AF7EA1E761
	for <openembedded-devel@lists.openembedded.org>; Sat, 23 Sep 2023 17:31:52 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.34.192]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qk4bo-2W5jFJ0; Sat, 23 Sep 2023 17:31:52 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] Nautilus: Upgrade 44.2.1 -> 45.0
Date: Sat, 23 Sep 2023 17:31:45 +0200
Message-ID: <20230923153145.923818-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1695483112-7EFAE178-63351F1B/0/0 CLEAN NORMAL
X-TOI-MSGID: 91919a46-a62d-4693-b67e-e1709dc7d2c0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Sep 2023 15:32:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105097

- remove the patch to fix reproducibility. It was partly committed
  upstream but theres still one include with buildpath left in
  src/nautilus-enum-types.c and @basename@ instead of @filename@
  doesn't work here -> use sed to remove

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../0001-Replace-filename-with-basename.patch | 46 -------------------
 .../{nautilus_44.2.1.bb =3D> nautilus_45.0.bb}  | 10 ++--
 2 files changed, 5 insertions(+), 51 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/nautilus/nautilus/0001-Repla=
ce-filename-with-basename.patch
 rename meta-gnome/recipes-gnome/nautilus/{nautilus_44.2.1.bb =3D> nautil=
us_45.0.bb} (85%)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus/0001-Replace-file=
name-with-basename.patch b/meta-gnome/recipes-gnome/nautilus/nautilus/000=
1-Replace-filename-with-basename.patch
deleted file mode 100644
index dbf42a9ab..000000000
--- a/meta-gnome/recipes-gnome/nautilus/nautilus/0001-Replace-filename-wi=
th-basename.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 4ec1f99f170033138036d6547dce9b7dcf541338 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 24 May 2023 07:56:33 -0700
-Subject: [PATCH] Replace filename with basename
-
-This avoids emitting absolute paths into generated sourcecode, it
-improves reproducibility. See [1]
-
-[1] https://developer-old.gnome.org/gobject/stable/glib-mkenums.html
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/nautilus/-/me=
rge_requests/1211]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/nautilus-enum-types.c.template | 2 +-
- src/nautilus-enum-types.h.template | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/nautilus-enum-types.c.template b/src/nautilus-enum-type=
s.c.template
-index 9d8ac83..a757949 100644
---- a/src/nautilus-enum-types.c.template
-+++ b/src/nautilus-enum-types.c.template
-@@ -4,7 +4,7 @@
- /*** END file-header ***/
-=20
- /*** BEGIN file-production ***/
--/* Enumerations from "@filename@" */
-+/* Enumerations from "@basename@" */
- #include "@filename@"
-=20
- /*** END file-production ***/
-diff --git a/src/nautilus-enum-types.h.template b/src/nautilus-enum-type=
s.h.template
-index 399bbca..7eb6c54 100644
---- a/src/nautilus-enum-types.h.template
-+++ b/src/nautilus-enum-types.h.template
-@@ -8,7 +8,7 @@ G_BEGIN_DECLS
- /*** END file-header ***/
-=20
- /*** BEGIN file-production ***/
--/* Enumerations from "@filename@" */
-+/* Enumerations from "@basename@" */
-=20
- /*** END file-production ***/
-=20
---=20
-2.40.1
-
diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_44.2.1.bb b/meta-=
gnome/recipes-gnome/nautilus/nautilus_45.0.bb
similarity index 85%
rename from meta-gnome/recipes-gnome/nautilus/nautilus_44.2.1.bb
rename to meta-gnome/recipes-gnome/nautilus/nautilus_45.0.bb
index f181822b1..a083d1799 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_44.2.1.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_45.0.bb
@@ -23,11 +23,7 @@ DEPENDS =3D " \
=20
 inherit gnomebase gsettings gobject-introspection gi-docgen gettext feat=
ures_check mime-xdg gtk-icon-cache
=20
-def gnome_verdir(v):
-    return oe.utils.trim_version(v, 1)
-
-SRC_URI +=3D "file://0001-Replace-filename-with-basename.patch"
-SRC_URI[archive.sha256sum] =3D "d9c62f024727f7a76fc6a5da788a2b0247df01a7=
1c2a601143c62aac0ff41e4c"
+SRC_URI[archive.sha256sum] =3D "b311c465ce2ca7bc648f61b865187b4451388dec=
9358a169f3277e741718ab5d"
=20
 REQUIRED_DISTRO_FEATURES =3D "x11 opengl gobject-introspection-data"
=20
@@ -43,6 +39,10 @@ PACKAGECONFIG =3D "extensions"
 PACKAGECONFIG[extensions] =3D "-Dextensions=3Dtrue,-Dextensions=3Dfalse,=
 gexiv2 gstreamer1.0-plugins-base gdk-pixbuf"
 PACKAGECONFIG[packagekit] =3D "-Dpackagekit=3Dtrue,-Dpackagekit=3Dfalse,=
packagekit"
=20
+do_install:prepend() {
+    sed -i -e 's|${B}/||g' ${B}/src/nautilus-enum-types.c
+}
+
 FILES:${PN} +=3D " \
     ${datadir}/dbus-1 \
     ${datadir}/metainfo \
--=20
2.42.0


