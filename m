Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B5B7C4332F
	for <webhook@archiver.kernel.org>; Fri, 10 Nov 2023 11:46:34 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.25594.1699616792217590834
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Nov 2023 03:46:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout12.t-online.de (Postfix) with SMTP id B34471C1B2
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Nov 2023 12:45:32 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.32.113]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r1Px6-21NTYx0; Fri, 10 Nov 2023 12:45:32 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 3/4] gupnp-idg: Upgrade 1.2.0 -> 1.6.0
Date: Fri, 10 Nov 2023 12:45:45 +0100
Message-ID: <20231110114546.306710-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231110114546.306710-1-f_l_k@t-online.de>
References: <20231110114546.306710-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1699616732-489CB820-80EEB229/0/0 CLEAN NORMAL
X-TOI-MSGID: 758727a1-02a3-4193-9e92-f7f1e57c2a2a
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Nov 2023 11:46:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106542

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gupnp/{gupnp-igd_1.2.0.bb =3D> gupnp-igd_1.6.0.bb}     | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)
 rename meta-multimedia/recipes-connectivity/gupnp/{gupnp-igd_1.2.0.bb =3D=
> gupnp-igd_1.6.0.bb} (56%)

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_1.2.0.b=
b b/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_1.6.0.bb
similarity index 56%
rename from meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_1.2.0.bb
rename to meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_1.6.0.bb
index 49cd8d831..d8dbc262c 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_1.2.0.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_1.6.0.bb
@@ -3,11 +3,10 @@ LICENSE =3D "LGPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da6f89e2100d9b6cdffcea4f398e37=
343 \
                     file://libgupnp-igd/gupnp-simple-igd.c;beginline=3D1=
;endline=3D21;md5=3Daa292c0d9390463a6e1055dc5fc68e80"
=20
-DEPENDS =3D "glib-2.0 gssdp gupnp sqlite3"
+DEPENDS =3D "glib-2.0 gssdp gupnp"
=20
-SRC_URI =3D "http://download.gnome.org/sources/${BPN}/1.2/${BPN}-${PV}.t=
ar.xz"
-SRC_URI[sha256sum] =3D "4b5120098aa13edd27818ba9ee4d7fe961bf540bf50d056f=
f703c61545e02be1"
+inherit gnomebase pkgconfig gtk-doc gobject-introspection
=20
-GTKDOC_MESON_OPTION =3D "gtk_doc"
+SRC_URI[archive.sha256sum] =3D "4099978339ab22126d4968f2a332b6d094fc44c7=
8797860781f1fc2f11771b74"
=20
-inherit meson pkgconfig gtk-doc gobject-introspection
+GTKDOC_MESON_OPTION =3D "gtk_doc"
--=20
2.42.0


