Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65FD0C79FA5
	for <webhook@archiver.kernel.org>; Sun,  6 Sep 2026 09:37:31 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10845.1788687443476867238
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Sep 2026 02:37:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=XxXWfC+L;
 spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd94.aul.t-online.de (fwd94.aul.t-online.de [10.223.144.120])
	by mailout11.t-online.de (Postfix) with SMTP id 9BD8D1C455
	for <openembedded-devel@lists.openembedded.org>; Sun,  6 Sep 2026 11:37:21 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.35.20]) by fwd94.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x39JP-22AhJr0; Sun, 6 Sep 2026 11:37:19 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 12/15] nautilus: upgrade 49.5 -> 50.3
Date: Sun,  6 Sep 2026 11:37:10 +0200
Message-ID: <20260906093713.797648-12-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260906093713.797648-1-f_l_k@t-online.de>
References: <20260906093713.797648-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1788687439-E6FFA956-C7E96E91/0/0 CLEAN NORMAL
X-TOI-MSGID: 4f923f86-4fd8-4fd7-b53d-8661efed7ac9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1788687441; i=f_l_k@t-online.de;
	bh=9dUlYNoqExkAveY8pizc+SXB8/SNYZUF5YLDO9Lt4D8=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=XxXWfC+LLXAO5qMrlSMut9lEI/iD04GpGz7zLSQEq9TtPpQAI6qaOawM4VBPDOk1F
	 v5Qb1KXyy/iXa7rgZ1HkjmmeqTravVL99kGBsewS7fTcKcOVDfBfsuBes2/Akb9P4X
	 5eBxnJGko/gHfaTJwsj1kReyIiuB5f2mDLt1SMJx42saguzbIinq8j2l9S1W61bcTh
	 CbeRgayoIOT/yfeGmAdcpnWYrP/6TH8HI2dBKMO7k7iIrOzhWUgsGlCOPMvHLYmMgi
	 Cl13aw38HsWCWg0cT1IzLqkuMlXlaRjdkscQq2YBYHZhqPT8oK1FIqoOwhcm50g6nb
	 ybFyVyOggIdQA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Sep 2026 09:37:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129782

glycin and blueprint-compiler-native are new build dependencies, gexiv2
0.16 is required for the extensions. The selinux and cloudproviders meson
options became features and are exposed as PACKAGECONFIG, the packagekit
option is deprecated and dropped. blueprint-compiler needs the GLib
typelib at configure time, so export GI_TYPELIB_PATH like epiphany does.

Build tested on corei7-64.

AI-Generated: Uses Claude Code (Claude Fable 5.1)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../nautilus/{nautilus_49.5.bb =3D> nautilus_50.3.bb}  | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)
 rename meta-gnome/recipes-gnome/nautilus/{nautilus_49.5.bb =3D> nautilus=
_50.3.bb} (75%)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_49.5.bb b/meta-gn=
ome/recipes-gnome/nautilus/nautilus_50.3.bb
similarity index 75%
rename from meta-gnome/recipes-gnome/nautilus/nautilus_49.5.bb
rename to meta-gnome/recipes-gnome/nautilus/nautilus_50.3.bb
index 9597ce5136..e3a825b0a1 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_49.5.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_50.3.bb
@@ -7,13 +7,14 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd32239bcb673=
463ab874e80d47fae504"
=20
 DEPENDS =3D " \
     appstream-glib-native \
+    blueprint-compiler-native \
     desktop-file-utils-native \
     glib-2.0 \
+    glycin \
     gnome-autoar \
     gnome-desktop \
     gtk4 \
     libadwaita \
-    libcloudproviders \
     libportal \
     libxml2 \
     tinysparql \
@@ -23,7 +24,7 @@ DEPENDS =3D " \
=20
 inherit gnomebase gsettings gobject-introspection gi-docgen gettext feat=
ures_check mime-xdg gtk-icon-cache
=20
-SRC_URI[archive.sha256sum] =3D "fa5655e73ee7953aecfe71fea67bfec0c67447e1=
4e6df135aa3f80334386872c"
+SRC_URI[archive.sha256sum] =3D "63773baf0ddec7b4875fc2c22040378562ea1e68=
12fe0a2e29c9c8d5c72807f8"
=20
 REQUIRED_DISTRO_FEATURES =3D "opengl gobject-introspection-data"
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
@@ -36,9 +37,12 @@ EXTRA_OEMESON +=3D " \
     -Dtests=3Dnone \
 "
=20
-PACKAGECONFIG =3D "extensions"
+export GI_TYPELIB_PATH =3D "${STAGING_LIBDIR}/girepository-1.0/"
+
+PACKAGECONFIG =3D "cloudproviders extensions"
+PACKAGECONFIG[cloudproviders] =3D "-Dcloudproviders=3Denabled,-Dcloudpro=
viders=3Ddisabled,libcloudproviders"
 PACKAGECONFIG[extensions] =3D "-Dextensions=3Dtrue,-Dextensions=3Dfalse,=
 gexiv2 gstreamer1.0-plugins-base gdk-pixbuf"
-PACKAGECONFIG[packagekit] =3D "-Dpackagekit=3Dtrue,-Dpackagekit=3Dfalse,=
packagekit"
+PACKAGECONFIG[selinux] =3D "-Dselinux=3Denabled,-Dselinux=3Ddisabled,lib=
selinux"
=20
 do_install:prepend() {
     sed -i -e 's|${B}/||g' ${B}/src/nautilus-enum-types.c
--=20
2.55.0


