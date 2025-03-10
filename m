Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62EB7C282DE
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 19:53:49 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.47704.1741636424749929475
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Mar 2025 12:53:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout09.t-online.de (Postfix) with SMTP id DFDCF540
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Mar 2025 20:53:42 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.38.163]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1trjC1-4TYffl0; Mon, 10 Mar 2025 20:53:41 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCHv2] libgusb: update 0.3.10 -> 0.4.9
Date: Mon, 10 Mar 2025 20:54:22 +0100
Message-ID: <20250310195422.1563828-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1741636421-E8FF697D-3AE914F2/10/3626336762 SUSPECT URL
X-TOI-MSGID: 83668cda-32bc-4401-b90c-0307833a5d36
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Mar 2025 19:53:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115838

- use gi-docgen instead of gtk_doc
- add json-glib dependency
- inherit pkgconfig
- add a runtime dependency on hwdata because we need to provide usbids
- dont use append for EXTRA_OEMESON

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../libgusb/{libgusb_0.3.10.bb =3D> libgusb_0.4.9.bb}   | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-support/libgusb/{libgusb_0.3.10.bb =3D> libgusb_0=
.4.9.bb} (59%)

diff --git a/meta-oe/recipes-support/libgusb/libgusb_0.3.10.bb b/meta-oe/=
recipes-support/libgusb/libgusb_0.4.9.bb
similarity index 59%
rename from meta-oe/recipes-support/libgusb/libgusb_0.3.10.bb
rename to meta-oe/recipes-support/libgusb/libgusb_0.4.9.bb
index 491b6a7a1d..7f6bec3ea7 100644
--- a/meta-oe/recipes-support/libgusb/libgusb_0.3.10.bb
+++ b/meta-oe/recipes-support/libgusb/libgusb_0.4.9.bb
@@ -2,17 +2,20 @@ SUMMARY =3D "GUsb is a GObject wrapper for libusb1"
 LICENSE =3D "LGPL-2.1-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2d5025d4aa3495befef8f17206a5b=
0a1"
=20
-DEPENDS =3D "glib-2.0 libusb"
+DEPENDS =3D "glib-2.0 libusb json-glib"
+RDEPENDS:${PN} =3D "hwdata"
=20
-inherit meson gobject-introspection gtk-doc gettext vala
+inherit meson gobject-introspection gi-docgen gettext vala pkgconfig
=20
 PACKAGECONFIG:class-target ??=3D "${@bb.utils.contains('GI_DATA_ENABLED'=
, 'True', 'vapi', '', d)}"
 PACKAGECONFIG[vapi] =3D "-Dvapi=3Dtrue,-Dvapi=3Dfalse"
=20
-EXTRA_OEMESON:append:class-native =3D " -Dtests=3Dfalse -Dintrospection=3D=
false"
+EXTRA_OEMESON:class-native +=3D "-Dtests=3Dfalse  -Dintrospection=3Dfals=
e"
+
+GIDOCGEN_MESON_OPTION =3D 'docs'
=20
 SRC_URI =3D "git://github.com/hughsie/libgusb.git;branch=3Dmain;protocol=
=3Dhttps"
-SRCREV =3D "332d5b987ffecb824426e88518e05547faf2b520"
+SRCREV =3D "ed31c8134d80d006bd45450e84180be2a7c0742e"
 S =3D "${WORKDIR}/git"
=20
 BBCLASSEXTEND =3D "native"
--=20
2.48.1


