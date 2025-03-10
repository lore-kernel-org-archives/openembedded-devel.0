Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DF70C282DE
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 19:32:19 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.47168.1741635130417461253
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Mar 2025 12:32:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout08.t-online.de (Postfix) with SMTP id B774A18F7
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Mar 2025 20:31:21 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.38.163]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1triqK-09uJG50; Mon, 10 Mar 2025 20:31:16 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libgusb: update 0.3.10 -> 0.4.9
Date: Mon, 10 Mar 2025 20:31:59 +0100
Message-ID: <20250310193159.1215736-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1741635077-C97F9999-CC4D9697/10/3626336762 SUSPECT URL
X-TOI-MSGID: a8c490ca-0616-4686-80cb-1662590f2148
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Mar 2025 19:32:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115837

- use gi-docgen instead of gtk_doc
- add json-glib dependency
- inherit pkgconfig
- add a runtime dependency on hwdata because we need to provide usbids

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../libgusb/{libgusb_0.3.10.bb =3D> libgusb_0.4.9.bb}   | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-support/libgusb/{libgusb_0.3.10.bb =3D> libgusb_0=
.4.9.bb} (60%)

diff --git a/meta-oe/recipes-support/libgusb/libgusb_0.3.10.bb b/meta-oe/=
recipes-support/libgusb/libgusb_0.4.9.bb
similarity index 60%
rename from meta-oe/recipes-support/libgusb/libgusb_0.3.10.bb
rename to meta-oe/recipes-support/libgusb/libgusb_0.4.9.bb
index 491b6a7a1d..cdb1c7d31c 100644
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
+EXTRA_OEMESON:append:class-native =3D "-Dtests=3Dfalse  -Dintrospection=3D=
false"
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


