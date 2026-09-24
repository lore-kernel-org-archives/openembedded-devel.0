Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66AF5C9830E
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 08:22:32 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3048.1790238148431956502
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Sep 2026 01:22:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=vuBPpWHH;
 spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd82.aul.t-online.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout03.t-online.de (Postfix) with SMTP id 2194FDEBC
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Sep 2026 10:22:26 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.161.151]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x9eim-3pe6YS0; Thu, 24 Sep 2026 10:22:24 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCHv2] sushi: add recipe
Date: Thu, 24 Sep 2026 10:22:17 +0200
Message-ID: <20260924082217.460250-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1790238144-17FFC98F-071B406A/0/0 CLEAN NORMAL
X-TOI-MSGID: 7cea9976-7a74-4f18-82eb-c650595a7d6e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1790238146; i=f_l_k@t-online.de;
	bh=YIM/Up2875G/YzeDVcpUGe6onqZVc4rz358p9wOETE8=;
	h=From:To:Subject:Date;
	b=vuBPpWHHU8ct0n6aWhO5BqK9+XNadTQF9Gms/d3ZArbjBq8aAstrlAlD7DIyjilpU
	 y0vysuCogyqd5qUe5IPEcD+TJFXHpG2Cy2Hr0iDY2LLKGLsXSiplGiudu7L7kyYpHi
	 R5udT2s2WwLNGzwbJCGgESpvQ+VK1YV3cWB1Pdi/frBzEfIGXvRTM+OEEg9DnQOV17
	 ftJq6K8T/WwdMLDAXDuGBPiNpKlsYocrCxgeAG/bmcz8govGxZbtHrxemlLkcskcnv
	 Pz5pxy0ybUkacroqkxsxOPGHb+gaZX2SNNYNWFozS16nShjdmpUprdKK5qWLsludAh
	 PMJ0cvdfpUkSw==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Sep 2026 08:22:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130283

Quick previewer for Nautilus, started over D-Bus when a file is
selected and space is pressed. It is a gjs application, so meson is
told where gjs and env live on the target through a cross file, which
also keeps the build host paths out of the two wrapper scripts.

AI-Generated: Uses Claude Code (Claude Fable 5.1)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
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


