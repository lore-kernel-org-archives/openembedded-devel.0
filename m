Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFC19C98314
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 07:52:10 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2741.1790236321335602136
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Sep 2026 00:52:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=fhE7eq/G;
 spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout11.t-online.de (Postfix) with SMTP id DA7B91C20C
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Sep 2026 09:51:58 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.161.151]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x9eFH-0GBPSi0; Thu, 24 Sep 2026 09:51:55 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] sushi: add recipe
Date: Thu, 24 Sep 2026 09:51:47 +0200
Message-ID: <20260924075147.337582-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1790236315-A8FF6837-82357E41/0/0 CLEAN NORMAL
X-TOI-MSGID: 832e1aa6-595b-454e-b01e-222fa1561182
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1790236318; i=f_l_k@t-online.de;
	bh=xjDYZJO/MIAjhTpetnP3yhwzK04Nh+4DbwDqP12Cq/8=;
	h=From:To:Subject:Date;
	b=fhE7eq/GOSDqhAgcSu8gFPKAgePb1fAYagKlNI+cgGZ1Sl8onp85euoV1+ty5e+yf
	 LJzyF528TnH6mIlcskVecZjrin1vb+UzL3/HfsSL85hRfFS+0SOdiL3h7vZvs6V6je
	 km9B5/u70ccCKEmdodqbRHTS/gRO5Z7YWX7JAUMrJqCDAHVbTso1tTFNM359FPqE+n
	 W42exjk/oIMCXa1fqmj45g6DyVohH3k6FINeQpTGvIVyO81Uef8/s56t8ebo/Duh+O
	 JkZ1x0p2USHw6R2ttLz4nSIQAmRfK6eQxtfuVEJF0rqeWmbbm6WaJLsjJ6/MJu4LNi
	 aGho+TaH2jC/A==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Sep 2026 07:52:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130281

Quick previewer for Nautilus, started over D-Bus when a file is
selected and space is pressed. It is a gjs application, so meson is
told where gjs and env live on the target through a cross file, which
also keeps the build host paths out of the two wrapper scripts.

AI-Generated: Uses Claude Code (Claude Fable 5.1)
---
 meta-gnome/recipes-gnome/sushi/sushi_51.1.bb | 55 ++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/sushi/sushi_51.1.bb

diff --git a/meta-gnome/recipes-gnome/sushi/sushi_51.1.bb b/meta-gnome/re=
cipes-gnome/sushi/sushi_51.1.bb
new file mode 100644
index 0000000000..8af34b2f26
--- /dev/null
+++ b/meta-gnome/recipes-gnome/sushi/sushi_51.1.bb
@@ -0,0 +1,55 @@
+SUMMARY =3D "Quick previewer for Nautilus"
+HOMEPAGE =3D "https://gitlab.gnome.org/GNOME/sushi"
+SECTION =3D "x11/gnome"
+
+LICENSE =3D "GPL-2.0-or-later"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8a935b4d9a4fa8aa5978b50a432f8=
33e"
+
+DEPENDS =3D " \
+    blueprint-compiler-native \
+    freetype \
+    fribidi \
+    gjs \
+    glib-2.0 \
+    glycin \
+    gstreamer1.0 \
+    gstreamer1.0-plugins-base \
+    gtk4 \
+    gtksourceview5 \
+    harfbuzz \
+    libadwaita \
+    papers \
+    webkitgtk \
+"
+
+inherit gnomebase gobject-introspection gettext features_check
+
+GIR_MESON_OPTION =3D ""
+
+REQUIRED_DISTRO_FEATURES =3D "opengl gobject-introspection-data"
+
+SRC_URI[archive.sha256sum] =3D "d326ec69fc004be3a5fc048f7ecf2c8eb828b7d8=
b682f1e7a2ba01a5e72993e1"
+
+export GI_TYPELIB_PATH =3D "${STAGING_LIBDIR}/girepository-1.0/"
+
+PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11'=
, d)}"
+PACKAGECONFIG[wayland] =3D "-Dwayland=3Denabled,-Dwayland=3Ddisabled"
+PACKAGECONFIG[x11] =3D "-DX11=3Denabled,-DX11=3Ddisabled,virtual/libx11"
+
+EXTRA_OEMESON +=3D "--cross-file=3D${WORKDIR}/meson-${PN}.cross"
+
+do_write_config:append() {
+    cat >${WORKDIR}/meson-${PN}.cross <<EOF
+[binaries]
+env =3D '${base_bindir}/env'
+gjs =3D '${bindir}/gjs'
+EOF
+}
+
+FILES:${PN} +=3D " \
+    ${datadir}/dbus-1 \
+    ${datadir}/metainfo \
+    ${libdir}/sushi \
+"
+
+RDEPENDS:${PN} +=3D "gjs glycin-gtk4 gtksourceview5 libadwaita webkitgtk=
"
--=20
2.55.0


