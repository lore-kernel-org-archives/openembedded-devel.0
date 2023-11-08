Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C396C4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 08:03:05 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.9074.1699430578384200503
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Nov 2023 00:02:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout08.t-online.de (Postfix) with SMTP id E1D6128ABC
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Nov 2023 09:02:55 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.33.167]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r0dWY-2SLMv30; Wed, 8 Nov 2023 09:02:54 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][RFC][PATCHv3] Adjust vala build according to changes in vala.bbclass
Date: Wed,  8 Nov 2023 09:03:22 +0100
Message-ID: <20231108080322.30661-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1699430574-4D288D65-55D68A5D/0/0 CLEAN NORMAL
X-TOI-MSGID: 55e2ef6f-465d-4229-ba9b-c561f0b33f38
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Nov 2023 08:03:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106467

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/gnome-boxes/gnome-boxes_45.0.bb             | 1 +
 meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.3.1.bb      | 3 +++
 meta-gnome/recipes-gimp/babl/babl_0.1.106.bb                  | 1 +
 meta-gnome/recipes-gnome/gedit/gedit_46.1.bb                  | 2 +-
 meta-gnome/recipes-gnome/gjs/gjs_1.78.0.bb                    | 2 +-
 .../recipes-gnome/gnome-calculator/gnome-calculator_45.0.2.bb | 1 +
 meta-gnome/recipes-gnome/gsound/gsound_1.0.3.bb               | 2 ++
 meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.0.bb    | 1 +
 meta-gnome/recipes-gnome/rest/rest_0.9.1.bb                   | 2 --
 meta-gnome/recipes-gnome/tracker/tracker-miners_3.6.2.bb      | 1 +
 .../libcloudproviders/libcloudproviders_0.3.4.bb              | 1 +
 meta-oe/recipes-gnome/gcr/gcr3_3.41.1.bb                      | 3 +++
 meta-oe/recipes-support/libosinfo/libosinfo_1.11.0.bb         | 4 +++-
 13 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/=
gnome-boxes/gnome-boxes_45.0.bb b/meta-gnome/dynamic-layers/meta-virtuali=
zation/recipes-gnome/gnome-boxes/gnome-boxes_45.0.bb
index f2aeb8878..fc1235109 100644
--- a/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gnome-b=
oxes/gnome-boxes_45.0.bb
+++ b/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gnome-b=
oxes/gnome-boxes_45.0.bb
@@ -33,6 +33,7 @@ inherit gnomebase gsettings pkgconfig mime-xdg gtk-icon=
-cache gobject-introspect
 SRC_URI[archive.sha256sum] =3D "cc63080eefa147a8472ab1a5ff087b97a27ab723=
a4ee005ed41e8c9dd7798e41"
=20
 GIR_MESON_OPTION =3D ""
+VALA_MESON_OPTION =3D ""
=20
 FILES:${PN} +=3D "${datadir}"
=20
diff --git a/meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.3.1.bb b/m=
eta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.3.1.bb
index 36eb8ca19..8737b6d7e 100644
--- a/meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.3.1.bb
+++ b/meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.3.1.bb
@@ -15,6 +15,9 @@ DEPENDS =3D " \
 GNOMEBASEBUILDCLASS =3D "meson"
 REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
 GIR_MESON_OPTION =3D ""
+VALA_MESON_OPTION =3D "with-vala"
+VALA_MESON_ENABLE_FLAG ?=3D 'enabled'
+VALA_MESON_DISABLE_FLAG ?=3D 'disabled'
=20
 PACKAGECONFIG[pulseaudio] =3D "-Dpulseaudio=3Denabled,-Dpulseaudio=3Ddis=
abled,pulseaudio"
 PACKAGECONFIG[sasl] =3D "-Dsasl=3Denabled,-Dsasl=3Ddisabled,cyrus-sasl"
diff --git a/meta-gnome/recipes-gimp/babl/babl_0.1.106.bb b/meta-gnome/re=
cipes-gimp/babl/babl_0.1.106.bb
index 5a5f4f5e7..5d656adb0 100644
--- a/meta-gnome/recipes-gimp/babl/babl_0.1.106.bb
+++ b/meta-gnome/recipes-gimp/babl/babl_0.1.106.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6a6a8e020838b2=
3406c81b19c1d46df6"
 GNOMEBASEBUILDCLASS =3D "meson"
=20
 GIR_MESON_OPTION =3D "enable-gir"
+VALA_MESON_OPTION =3D "enable-vapi"
=20
 inherit setuptools3 gnomebase gobject-introspection vala
=20
diff --git a/meta-gnome/recipes-gnome/gedit/gedit_46.1.bb b/meta-gnome/re=
cipes-gnome/gedit/gedit_46.1.bb
index 01d7a072a..0014b512a 100644
--- a/meta-gnome/recipes-gnome/gedit/gedit_46.1.bb
+++ b/meta-gnome/recipes-gnome/gedit/gedit_46.1.bb
@@ -19,7 +19,7 @@ DEPENDS =3D " \
     tepl \
 "
=20
-inherit gnomebase gsettings itstool gnome-help gobject-introspection gtk=
-doc vala gettext features_check mime-xdg gtk-icon-cache python3targetcon=
fig
+inherit gnomebase gsettings itstool gnome-help gobject-introspection gtk=
-doc gettext features_check mime-xdg gtk-icon-cache python3targetconfig
=20
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.78.0.bb b/meta-gnome/reci=
pes-gnome/gjs/gjs_1.78.0.bb
index 0af9f5600..e91fa1bc6 100644
--- a/meta-gnome/recipes-gnome/gjs/gjs_1.78.0.bb
+++ b/meta-gnome/recipes-gnome/gjs/gjs_1.78.0.bb
@@ -6,7 +6,7 @@ GNOMEBASEBUILDCLASS =3D "meson"
=20
 DEPENDS =3D "mozjs-115 cairo"
=20
-inherit gnomebase gsettings gobject-introspection vala gettext features_=
check upstream-version-is-even pkgconfig
+inherit gnomebase gsettings gobject-introspection gettext features_check=
 upstream-version-is-even pkgconfig
=20
 SRC_URI[archive.sha256sum] =3D "fbaa20e0917668830800f92951688f9fc08f0129=
6affd5cdb4b35f750be27dc9"
 SRC_URI +=3D " \
diff --git a/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_4=
5.0.2.bb b/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_45.=
0.2.bb
index cde2e1d3c..3482f76a5 100644
--- a/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_45.0.2.b=
b
+++ b/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_45.0.2.b=
b
@@ -18,6 +18,7 @@ DEPENDS =3D " \
 GIR_MESON_OPTION =3D 'disable-introspection'
 GIR_MESON_ENABLE_FLAG =3D 'false'
 GIR_MESON_DISABLE_FLAG =3D 'true'
+VALA_MESON_OPTION =3D ''
=20
 GNOMEBASEBUILDCLASS =3D "meson"
 GTKIC_VERSION =3D '4'
diff --git a/meta-gnome/recipes-gnome/gsound/gsound_1.0.3.bb b/meta-gnome=
/recipes-gnome/gsound/gsound_1.0.3.bb
index bdef603f0..d01067eb1 100644
--- a/meta-gnome/recipes-gnome/gsound/gsound_1.0.3.bb
+++ b/meta-gnome/recipes-gnome/gsound/gsound_1.0.3.bb
@@ -9,6 +9,8 @@ DEPENDS =3D " \
=20
 GNOMEBASEBUILDCLASS =3D "meson"
=20
+VALA_MESON_OPTION =3D "enable_vala"
+
 inherit gnomebase gettext gobject-introspection vala
=20
 SRC_URI[archive.sha256sum] =3D "ca2d039e1ebd148647017a7f548862350bc9af01=
986d39f10cfdc8e95f07881a"
diff --git a/meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.0.bb b=
/meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.0.bb
index 81ae8317d..06353efab 100644
--- a/meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.0.bb
+++ b/meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.0.bb
@@ -15,6 +15,7 @@ SRC_URI +=3D "file://0001-Allow-building-gir-in-cross-e=
nvironments.patch"
 SRC_URI[archive.sha256sum] =3D "366e866ff2a708b894cfea9475b8e8ff54cb3e2b=
477ea72a8ade0dabee5f48a4"
=20
 GTKDOC_MESON_OPTION =3D "gtk_doc"
+VALA_MESON_OPTION =3D "enable_vala"
=20
 DEPENDS =3D " \
     geocode-glib \
diff --git a/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb b/meta-gnome/rec=
ipes-gnome/rest/rest_0.9.1.bb
index 3a81a58f6..e46cbfc69 100644
--- a/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb
+++ b/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb
@@ -17,8 +17,6 @@ DEPENDS =3D " \
=20
 inherit gnomebase gobject-introspection vala pkgconfig gi-docgen
=20
-EXTRA_OEMESON =3D "${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-Dva=
pi=3Dtrue', '-Dvapi=3Dfalse', d)}"
-
 PACKAGECONFIG ?=3D ""
 PACKAGECONFIG[examples] =3D "-Dexamples=3Dtrue,-Dexamples=3Dfalse"
 PACKAGECONFIG[tests] =3D "-Dtests=3Dtrue,-Dtests=3Dfalse"
diff --git a/meta-gnome/recipes-gnome/tracker/tracker-miners_3.6.2.bb b/m=
eta-gnome/recipes-gnome/tracker/tracker-miners_3.6.2.bb
index a0a41d7f8..426082bd5 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker-miners_3.6.2.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker-miners_3.6.2.bb
@@ -25,6 +25,7 @@ SRC_URI[archive.sha256sum] =3D "0ad722f3d532c21d757cf48=
8f942960679ea8f457925efa976
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
 GIR_MESON_OPTION =3D ""
+VALA_MESON_OPTION =3D ""
=20
 PACKAGECONFIG ??=3D " \
     ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", "ffmpeg=
", "", d)} \
diff --git a/meta-gnome/recipes-support/libcloudproviders/libcloudprovide=
rs_0.3.4.bb b/meta-gnome/recipes-support/libcloudproviders/libcloudprovid=
ers_0.3.4.bb
index 36089238f..21fe4d119 100644
--- a/meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.3.=
4.bb
+++ b/meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.3.=
4.bb
@@ -3,6 +3,7 @@ LICENSE=3D"LGPL-3.0-or-later"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De6a600fd5e1d9cbde2d983680233a=
d02"
=20
 GNOMEBASEBUILDCLASS =3D "meson"
+VALA_MESON_OPTION ?=3D 'vapigen'
=20
 DEPENDS =3D "glib-2.0"
=20
diff --git a/meta-oe/recipes-gnome/gcr/gcr3_3.41.1.bb b/meta-oe/recipes-g=
nome/gcr/gcr3_3.41.1.bb
index ba5660a5e..a5bb868bb 100644
--- a/meta-oe/recipes-gnome/gcr/gcr3_3.41.1.bb
+++ b/meta-oe/recipes-gnome/gcr/gcr3_3.41.1.bb
@@ -17,6 +17,8 @@ CFLAGS +=3D "-D_GNU_SOURCE"
=20
 GNOMEBASEBUILDCLASS =3D "meson"
 GTKDOC_MESON_OPTION =3D "gtk_doc"
+VALA_MESON_OPTION ?=3D ''
+
 inherit gnomebase gtk-icon-cache gi-docgen features_check upstream-versi=
on-is-even vala gobject-introspection gettext mime mime-xdg
 UPSTREAM_CHECK_REGEX =3D "[^\d\.](?P<pver>3.(?!9\d+)\d+(\.\d+)+)\.tar"
=20
@@ -39,6 +41,7 @@ PACKAGECONFIG[systemd] =3D "-Dsystemd=3Denabled,-Dsyste=
md=3Ddisabled,systemd"
 FILES:${PN} +=3D " \
     ${datadir}/dbus-1 \
     ${datadir}/gcr-3 \
+    ${datadir}/vala \
     ${systemd_user_unitdir}/gcr-ssh-agent.socket \
     ${systemd_user_unitdir}/gcr-ssh-agent.service \
 "
diff --git a/meta-oe/recipes-support/libosinfo/libosinfo_1.11.0.bb b/meta=
-oe/recipes-support/libosinfo/libosinfo_1.11.0.bb
index 16e0cf8f7..ca6f9ba3f 100644
--- a/meta-oe/recipes-support/libosinfo/libosinfo_1.11.0.bb
+++ b/meta-oe/recipes-support/libosinfo/libosinfo_1.11.0.bb
@@ -18,6 +18,9 @@ inherit meson pkgconfig gtk-doc gobject-introspection v=
ala
=20
 DEPENDS =3D "glib-2.0 libsoup libxslt"
=20
+VALA_MESON_OPTION =3D 'enable-vala'
+VALA_MESON_ENABLE_FLAG =3D 'enabled'
+VALA_MESON_DISABLE_FLAG =3D 'disabled'
 GIR_MESON_OPTION =3D "enable-introspection"
 GIR_MESON_ENABLE_FLAG =3D 'enabled'
 GIR_MESON_DISABLE_FLAG =3D 'disabled'
@@ -26,7 +29,6 @@ GTKDOC_MESON_OPTION =3D "enable-gtk-doc"
 EXTRA_OEMESON +=3D " \
 	-Dwith-pci-ids-path=3D${datadir}/pci.ids \
 	-Dwith-usb-ids-path=3D${datadir}/usb.ids \
-	${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-Denable-vala=3Denable=
d', '-Denable-vala=3Ddisabled', d)} \
 "
=20
 RDEPENDS:${PN} =3D "pciutils-ids usbids"
--=20
2.42.0


