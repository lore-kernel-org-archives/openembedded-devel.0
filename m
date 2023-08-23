Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B898C3DA6F
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 17:25:49 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.2722.1692811542642825625
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Aug 2023 10:25:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout09.t-online.de (Postfix) with SMTP id 9AD32167DE
	for <openembedded-devel@lists.openembedded.org>; Wed, 23 Aug 2023 19:25:40 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.170.236]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qYrbv-02oL0T0; Wed, 23 Aug 2023 19:25:39 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCHv2] libosinfo: add recipe
Date: Wed, 23 Aug 2023 19:25:28 +0200
Message-ID: <20230823172528.1003528-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1692811539-BEFE39BF-56B88F7C/0/0 CLEAN NORMAL
X-TOI-MSGID: 418dc17d-9972-4489-a6db-72f4f34a72c4
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Aug 2023 17:25:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104555

libosinfo
=3D=3D=3D=3D=3D=3D=3D=3D=3D

libosinfo is a GObject based library API for managing information about
operating systems, hypervisors and the (virtual) hardware devices they ca=
n
support. It includes a database containing device metadata and provides A=
PIs
to match/identify optimal devices for deploying an operating system on a
hypervisor. Via the magic of GObject Introspection, the API is available =
in all
common programming languages with demos for javascript (GJS/Seed) and pyt=
hon
(PyGObject). Vala bindings are also provided.

libosinfo is a required dependency for gnome-boxes

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...meson.build-allow-crosscompiling-gir.patch | 28 ++++++++++++++++
 .../libosinfo/libosinfo_1.10.bb               | 32 +++++++++++++++++++
 2 files changed, 60 insertions(+)
 create mode 100644 meta-oe/recipes-support/libosinfo/libosinfo/0001-meso=
n.build-allow-crosscompiling-gir.patch
 create mode 100644 meta-oe/recipes-support/libosinfo/libosinfo_1.10.bb

diff --git a/meta-oe/recipes-support/libosinfo/libosinfo/0001-meson.build=
-allow-crosscompiling-gir.patch b/meta-oe/recipes-support/libosinfo/libos=
info/0001-meson.build-allow-crosscompiling-gir.patch
new file mode 100644
index 0000000000..778a1f6e1e
--- /dev/null
+++ b/meta-oe/recipes-support/libosinfo/libosinfo/0001-meson.build-allow-=
crosscompiling-gir.patch
@@ -0,0 +1,28 @@
+From 123b5a4c5e09f4262d4545a0bc5edb01a19b6b76 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Mon, 21 Aug 2023 10:06:55 +0200
+Subject: [PATCH] meson.build: allow crosscompiling gir
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 39b739e..46f2252 100644
+--- a/meson.build
++++ b/meson.build
+@@ -29,7 +29,7 @@ libosinfo_pkgconfdir =3D join_paths(libosinfo_libdir, =
'pkgconfig')
+=20
+ # gobject introspection
+ gir =3D find_program('g-ir-scanner', required: get_option('enable-intro=
spection'))
+-enable_introspection =3D gir.found() and not meson.is_cross_build()
++enable_introspection =3D gir.found()
+=20
+ # vala
+ vapi_opt =3D get_option('enable-vala')
+--=20
+2.41.0
+
diff --git a/meta-oe/recipes-support/libosinfo/libosinfo_1.10.bb b/meta-o=
e/recipes-support/libosinfo/libosinfo_1.10.bb
new file mode 100644
index 0000000000..b02bc12816
--- /dev/null
+++ b/meta-oe/recipes-support/libosinfo/libosinfo_1.10.bb
@@ -0,0 +1,32 @@
+SUMMARY =3D "API for managing information about operating systems, hyper=
visors and the (virtual) hardware devices."
+HOMEPAGE =3D "https://libosinfo.org"
+
+LICENSE =3D "LGPL-2.1-only & GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2b0e9926530c269f5ae9556037019=
5af"
+LIC_FILES_CHKSUM =3D "file://COPYING.LIB;md5=3D4fbd65380cdd255951079008b=
364516c"
+
+SRC_URI =3D " \
+	git://gitlab.com/libosinfo/libosinfo.git;branch=3Dmain;protocol=3Dhttps=
 \
+	file://0001-meson.build-allow-crosscompiling-gir.patch \
+"
+
+SRCREV =3D "f503ff7a9e13963bcf396776bce0b209a819ba9b"
+
+S =3D "${WORKDIR}/git"
+
+inherit meson pkgconfig gtk-doc gobject-introspection vala
+
+DEPENDS =3D "glib-2.0 libsoup libxslt"
+
+GIR_MESON_OPTION =3D "enable-introspection"
+GIR_MESON_ENABLE_FLAG =3D 'enabled'
+GIR_MESON_DISABLE_FLAG =3D 'disabled'
+GTKDOC_MESON_OPTION =3D "enable-gtk-doc"
+
+EXTRA_OEMESON =3D " \
+	-Dwith-pci-ids-path=3D${datadir}/pci.ids \
+	-Dwith-usb-ids-path=3D${datadir}/usb.ids \
+	-Denable-vala=3Denabled \
+"
+
+RDEPENDS:${PN} =3D "pciutils-ids usbids"
--=20
2.41.0


