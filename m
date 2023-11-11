Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3B9BC4167B
	for <webhook@archiver.kernel.org>; Sat, 11 Nov 2023 20:12:26 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.3091.1699733540148973640
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Nov 2023 12:12:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout09.t-online.de (Postfix) with SMTP id 80BFE6588E
	for <openembedded-devel@lists.openembedded.org>; Sat, 11 Nov 2023 21:12:18 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.34.215]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r1uL2-1i7E9q0; Sat, 11 Nov 2023 21:12:16 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/2] vte9: Fix build with api-documentation enabled
Date: Sat, 11 Nov 2023 21:12:24 +0100
Message-ID: <20231111201224.879226-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231111201224.879226-1-f_l_k@t-online.de>
References: <20231111201224.879226-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1699733536-3BFFC95D-CC703F16/0/0 CLEAN NORMAL
X-TOI-MSGID: d04bb95d-3e25-4ce5-905d-75f679bb0a1a
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Nov 2023 20:12:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106571

This fixes:
| Program gi-docgen found: NO
|
| ../vte-0.74.1/doc/reference/meson.build:18:11: ERROR: Program 'gi-docge=
n' not
found or not executable

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-gnome/vte9/vte9_0.74.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-gnome/vte9/vte9_0.74.1.bb b/meta-oe/recipes-=
gnome/vte9/vte9_0.74.1.bb
index 30319ddd6..098c84ba5 100644
--- a/meta-oe/recipes-gnome/vte9/vte9_0.74.1.bb
+++ b/meta-oe/recipes-gnome/vte9/vte9_0.74.1.bb
@@ -11,10 +11,10 @@ S =3D "${WORKDIR}/vte-${PV}"
=20
 SRC_URI[archive.sha256sum] =3D "2328c3f1c998350a18e0e513348e9fc581d57ea4=
e7b89aedf11e0e3c65042b4f"
=20
-inherit gnomebase gtk-doc gobject-introspection features_check systemd u=
pstream-version-is-even vala
+inherit gnomebase gi-docgen gobject-introspection features_check systemd=
 upstream-version-is-even vala
 ANY_OF_DISTRO_FEATURES =3D "${GTK2DISTROFEATURES}"
 GIR_MESON_OPTION =3D "gir"
-GTKDOC_MESON_OPTION =3D "docs"
+GIDOCGEN_MESON_OPTION =3D "docs"
=20
 PACKAGECONFIG ?=3D "gnutls"
 PACKAGECONFIG[gnutls] =3D "-Dgnutls=3Dtrue,-Dgnutls=3Dfalse,gnutls"
--=20
2.42.0


