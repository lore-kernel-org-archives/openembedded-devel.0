Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B81B2C4332F
	for <webhook@archiver.kernel.org>; Fri, 10 Nov 2023 11:46:14 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.25587.1699616773992509482
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Nov 2023 03:46:14 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout08.t-online.de (Postfix) with SMTP id CEFB11DE02
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Nov 2023 12:46:11 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.32.113]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r1Pxd-40NHrV0; Fri, 10 Nov 2023 12:46:05 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 1/5] gssdp: Upgrade 1.4.0.1 -> 1.6.3
Date: Fri, 10 Nov 2023 12:46:23 +0100
Message-ID: <20231110114627.306728-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1699616765-44FF6979-A7FB8A7C/0/0 CLEAN NORMAL
X-TOI-MSGID: 56b12d36-5930-48df-8135-8f3843331cc4
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Nov 2023 11:46:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106539

- switch to soup-3.0

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gupnp/{gssdp_1.4.0.1.bb =3D> gssdp_1.6.3.bb}        | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)
 rename meta-multimedia/recipes-connectivity/gupnp/{gssdp_1.4.0.1.bb =3D>=
 gssdp_1.6.3.bb} (77%)

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.4.0.1.bb =
b/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.6.3.bb
similarity index 77%
rename from meta-multimedia/recipes-connectivity/gupnp/gssdp_1.4.0.1.bb
rename to meta-multimedia/recipes-connectivity/gupnp/gssdp_1.6.3.bb
index be1f865de..f2e27622c 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.4.0.1.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.6.3.bb
@@ -6,22 +6,23 @@ BUGTRACKER =3D "https://gitlab.gnome.org/GNOME/gssdp/-/=
issues"
 LICENSE =3D "LGPL-2.1-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
=20
-SRC_URI =3D "${GNOME_MIRROR}/${BPN}/1.4/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] =3D "8676849d57fb822b8728856dbadebf3867f89ee47a0ec47a=
20045d011f431582"
+SRC_URI[archive.sha256sum] =3D "2fedb5afdb22cf14d5498a39a773ca89788a250f=
cf70118783df821e1f3f3446"
=20
 GTKDOC_MESON_OPTION =3D 'gtk_doc'
=20
 DEPENDS =3D " \
     glib-2.0 \
-    libsoup-2.4 \
+    libsoup-3.0 \
 "
=20
-inherit meson pkgconfig gobject-introspection vala gi-docgen features_ch=
eck
+inherit gnomebase pkgconfig gobject-introspection vala gi-docgen feature=
s_check
+
+# manpages require pandoc-native
+EXTRA_OEMESON +=3D "-Dmanpages=3Dfalse"
=20
 SNIFFER =3D "${@bb.utils.contains("BBFILE_COLLECTIONS", "gnome-layer", "=
sniffer", "", d)}"
=20
 PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', "=
${SNIFFER}", "", d)}"
-
 PACKAGECONFIG[sniffer] =3D "-Dsniffer=3Dtrue,-Dsniffer=3Dfalse,gtk4,"
=20
 REQUIRED_DISTRO_FEATURES =3D "${@bb.utils.contains('PACKAGECONFIG', 'sni=
ffer', 'opengl', '', d)}"
--=20
2.42.0


