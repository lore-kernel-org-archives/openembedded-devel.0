Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83837C53210
	for <webhook@archiver.kernel.org>; Sun,  8 Jan 2023 13:08:01 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.44274.1673183276105115359
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Jan 2023 05:07:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout03.t-online.de (Postfix) with SMTP id 632201C8C5
	for <openembedded-devel@lists.openembedded.org>; Sun,  8 Jan 2023 14:07:53 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.228.124]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pEVOx-43c1Z30; Sun, 8 Jan 2023 14:07:51 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 1/5] gnome-disk-utility: update 42.0 -> 43.0
Date: Sun,  8 Jan 2023 14:07:39 +0100
Message-Id: <20230108130743.983639-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1673183271-F3FF3ECF-1C8533DC/0/0 CLEAN NORMAL
X-TOI-MSGID: b231ba51-cc44-4eba-bc90-425a76f2345b
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 13:08:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100440

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...{gnome-disk-utility_42.0.bb =3D> gnome-disk-utility_43.0.bb} | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-disk-utility/{gnome-disk-utility_4=
2.0.bb =3D> gnome-disk-utility_43.0.bb} (87%)

diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utili=
ty_42.0.bb b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utili=
ty_43.0.bb
similarity index 87%
rename from meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utilit=
y_42.0.bb
rename to meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_=
43.0.bb
index c3789b0c1..247bf141c 100644
--- a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_42.0=
.bb
+++ b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_43.0=
.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fc=
e4486a80fdaf4a4263"
 SECTION =3D "x11/gnome"
=20
 DEPENDS =3D " \
+    desktop-file-utils-native \
     gtk+3 \
     libdvdread \
     libnotify \
@@ -12,6 +13,7 @@ DEPENDS =3D " \
     libpwquality \
     udisks2 \
     libhandy \
+    xz \
 "
=20
 GNOMEBASEBUILDCLASS =3D "meson"
@@ -28,7 +30,7 @@ PACKAGECONFIG[systemd] =3D "-Dlogind=3Dlibsystemd,-Dlog=
ind=3Dnone,systemd"
 PACKAGECONFIG[x11] =3D ",,libcanberra"
=20
 SRC_URI:append =3D " ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', =
'file://0001-gnome-disk-utility-remove-libcanberra-dependency.patch', '',=
 d)}"
-SRC_URI[archive.sha256sum] =3D "1b6564454d67426322cb3bfc5a5558653bfc7dfe=
ea2ae0825b1d08629f01090b"
+SRC_URI[archive.sha256sum] =3D "7afca9805a6b92db6933dd7efcec4af8386c01bb=
c1f871e2dae4def7e192a2c5"
=20
 EXTRA_OEMESON =3D "-Dman=3Dfalse"
=20
--=20
2.34.1


