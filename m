Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AA47C77B75
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 04:36:00 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.13615.1684211755853958602
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 May 2023 21:35:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout09.t-online.de (Postfix) with SMTP id 893C06422E
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 May 2023 06:35:28 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([79.219.228.204]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pymPH-33a7Xx0; Tue, 16 May 2023 06:35:27 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH 5/7] gdm: update 44.0 -> 44.1
Date: Tue, 16 May 2023 06:34:56 +0200
Message-Id: <20230516043458.6180-5-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230516043458.6180-1-f_l_k@t-online.de>
References: <20230516043458.6180-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1684211727-59FF057F-E525F43D/0/0 CLEAN NORMAL
X-TOI-MSGID: 6bbe8a8f-4d48-409f-b9e0-7192c8f446a3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 May 2023 04:36:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102613

- remove buildpath from enum-types

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/gdm/{gdm_44.0.bb =3D> gdm_44.1.bb}       | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gdm/{gdm_44.0.bb =3D> gdm_44.1.bb} (79%)

diff --git a/meta-gnome/recipes-gnome/gdm/gdm_44.0.bb b/meta-gnome/recipe=
s-gnome/gdm/gdm_44.1.bb
similarity index 79%
rename from meta-gnome/recipes-gnome/gdm/gdm_44.0.bb
rename to meta-gnome/recipes-gnome/gdm/gdm_44.1.bb
index 09e8acc728..cd9013312d 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_44.0.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_44.1.bb
@@ -21,7 +21,7 @@ GNOMEBASEBUILDCLASS =3D "meson"
=20
 inherit gnomebase gsettings pkgconfig gobject-introspection gettext syst=
emd useradd itstool gnome-help features_check
=20
-SRC_URI[archive.sha256sum] =3D "ce20b0a221dbf8cde0064b501fd8f38f73839152=
857c4535337eb09cc52f7f6c"
+SRC_URI[archive.sha256sum] =3D "68266b3abe7d28fc469d0067aac9c5dabb0ca795=
2cc1f7c238a04951f3dc5b0d"
=20
 EXTRA_OEMESON =3D " \
     -Dplymouth=3Ddisabled \
@@ -29,6 +29,13 @@ EXTRA_OEMESON =3D " \
     -Dpam-mod-dir=3D${base_libdir}/security \
 "
=20
+do_install:prepend() {
+    sed -i -e 's|${B}/||g' ${B}/daemon/gdm-session-worker-enum-types.c
+    sed -i -e 's|${B}/||g' ${B}/daemon/gdm-session-worker-enum-types.h
+    sed -i -e 's|${B}/||g' ${B}/daemon/gdm-session-enum-types.c
+    sed -i -e 's|${B}/||g' ${B}/daemon/gdm-session-enum-types.h
+}
+
 do_install:append() {
     rm -rf ${D}/run ${D}${localstatedir}/run
 }
--=20
2.34.1


