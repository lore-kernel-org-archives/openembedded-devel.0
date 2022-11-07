Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B221C43217
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 19:05:22 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.1932.1667847912554987973
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Nov 2022 11:05:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout12.t-online.de (Postfix) with SMTP id C574F1587C
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 20:05:10 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.226.160]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1os7Qk-28ACOI0; Mon, 7 Nov 2022 20:05:10 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 2/5] gnome-online-accounts: update 3.44.0 -> 3.46.0
Date: Mon,  7 Nov 2022 20:04:51 +0100
Message-Id: <20221107190454.39581-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221107190454.39581-1-f_l_k@t-online.de>
References: <20221107190454.39581-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1667847910-62A0A2DC-87088AF2/0/0 CLEAN NORMAL
X-TOI-MSGID: f2e63a9c-e64d-4963-804f-174bde0dbc15
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Nov 2022 19:05:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99477

---
 .../gnome-online-accounts_3.44.0.bb           | 34 -------------------
 .../gnome-online-accounts_3.46.0.bb           | 31 +++++++++++++++++
 2 files changed, 31 insertions(+), 34 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-online-accounts/gnome-=
online-accounts_3.44.0.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome-online-accounts/gnome-=
online-accounts_3.46.0.bb

diff --git a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-=
accounts_3.44.0.bb b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome=
-online-accounts_3.44.0.bb
deleted file mode 100644
index 451670e64..000000000
--- a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-account=
s_3.44.0.bb
+++ /dev/null
@@ -1,34 +0,0 @@
-SUMMARY =3D "GNOME Online Accounts - Single sign-on framework for GNOME"
-LICENSE =3D "LGPL-2.0-or-later"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D34c88b124db5fb2762c1676be7dad=
d36"
-
-GNOMEBASEBUILDCLASS =3D "autotools"
-
-inherit gnomebase gsettings gobject-introspection gsettings gtk-doc vala=
 gettext features_check
-
-ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
-
-DEPENDS =3D "glib-2.0"
-
-SRC_URI +=3D "file://0001-Update-to-rest-1.0.patch"
-SRC_URI[archive.sha256sum] =3D "381d5d4106f435b6f87786aa049be784774e1599=
6adcc02789807afc87ea7342"
-
-# backend is required for gnome-control-center
-PACKAGECONFIG =3D "backend other"
-
-PACKAGECONFIG[backend] =3D "--enable-backend,--disable-backend,gtk+3 web=
kitgtk libsoup-2.4 json-glib libsecret rest libxml2"
-PACKAGECONFIG[krb5] =3D "--enable-kerberos, --disable-kerberos , krb5 gc=
r"
-
-# no extra dependencies!
-PACKAGECONFIG[other] =3D " \
-    --enable-facebook  --enable-foursquare  --enable-exchange  --enable-=
flickr  --enable-google  --enable-imap-smtp  --enable-owncloud  --enable-=
windows-live,\
-    --disable-facebook --disable-foursquare --disable-exchange --disable=
-flickr --disable-google --disable-imap-smtp --disable-owncloud --disable=
-windows-live, \
-"
-
-FILES:${PN} +=3D " \
-    ${datadir}/dbus-1 \
-    ${libdir}/goa-1.0/web-extensions/*.so \
-"
-
-# looked into pkg-config file: it is not a bug - they mean it
-FILES:${PN}-dev +=3D "${libdir}/goa-1.0/include"
diff --git a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-=
accounts_3.46.0.bb b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome=
-online-accounts_3.46.0.bb
new file mode 100644
index 000000000..0603a2d89
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-account=
s_3.46.0.bb
@@ -0,0 +1,31 @@
+SUMMARY =3D "GNOME Online Accounts - Single sign-on framework for GNOME"
+LICENSE =3D "LGPL-2.0-or-later"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D34c88b124db5fb2762c1676be7dad=
d36"
+
+GNOMEBASEBUILDCLASS =3D "meson"
+
+inherit gnomebase gsettings gobject-introspection gtk-icon-cache vala fe=
atures_check
+
+DEPENDS =3D "gtk+3 gtk+3-native gdk-pixbuf dbus json-glib libxml2 webkit=
gtk glib-2.0 rest libsecret"
+
+SRC_URI[archive.sha256sum] =3D "5e7859ce4858a6b99d3995ed70527d66e297bb90=
bbf75ec8780fe9da22c1fcaa"
+
+PACKAGECONFIG_SOUP ?=3D "soup3"
+PACKAGECONFIG ?=3D "kerberos owncloud lastfm google windows_live ${PACKA=
GECONFIG_SOUP}"
+
+PACKAGECONFIG[kerberos] =3D "-Dkerberos=3Dtrue, -Dkerberos=3Dfalse,krb5 =
gcr"
+PACKAGECONFIG[exchange] =3D "-Dexchange=3Dtrue, -Dexchange=3Dfalse"
+PACKAGECONFIG[google] =3D "-Dgoogle=3Dtrue, -Dgoogle=3Dfalse"
+PACKAGECONFIG[owncloud] =3D "-Downcloud=3Dtrue, -Downcloud=3Dfalse"
+PACKAGECONFIG[windows_live] =3D "-Dwindows_live=3Dtrue, -Dwindows_live=3D=
false"
+PACKAGECONFIG[lastfm] =3D "-Dlastfm=3Dtrue, -Dlastfm=3Dfalse"
+PACKAGECONFIG[soup2] =3D ",,libsoup-2.4,,,soup3"
+PACKAGECONFIG[soup3] =3D ",,libsoup-3.0,,,soup2"
+
+FILES:${PN} +=3D " \
+    ${datadir}/dbus-1 \
+    ${libdir}/goa-1.0/web-extensions/*.so \
+"
+
+# looked into pkg-config file: it is not a bug - they mean it
+FILES:${PN}-dev +=3D "${libdir}/goa-1.0/include"
--=20
2.34.1


