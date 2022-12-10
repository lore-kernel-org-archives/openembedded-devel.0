Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 853F3C10F1D
	for <webhook@archiver.kernel.org>; Sat, 10 Dec 2022 05:22:10 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.9042.1670649724489127512
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Dec 2022 21:22:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout04.t-online.de (Postfix) with SMTP id 59014ED8
	for <openembedded-devel@lists.openembedded.org>; Sat, 10 Dec 2022 06:22:02 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.225.165]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p3sJB-1hOgEe0; Sat, 10 Dec 2022 06:21:57 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 4/6] geoclue: update to latest commit to allow to build with libsoup-3.0
Date: Sat, 10 Dec 2022 06:21:35 +0100
Message-Id: <20221210052137.303984-4-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221210052137.303984-1-f_l_k@t-online.de>
References: <20221210052137.303984-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670649717-E67DE07E-7F5AE657/0/0 CLEAN NORMAL
X-TOI-MSGID: c000227a-84f6-4c70-a929-f293d276b9a3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Dec 2022 05:22:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100015

Hereby gnome-session will be buildable without libsoup2

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../geoclue/{geoclue_2.5.7.bb =3D> geoclue_2.6.0.bb}           | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-navigation/geoclue/{geoclue_2.5.7.bb =3D> geoclue=
_2.6.0.bb} (91%)

diff --git a/meta-oe/recipes-navigation/geoclue/geoclue_2.5.7.bb b/meta-o=
e/recipes-navigation/geoclue/geoclue_2.6.0.bb
similarity index 91%
rename from meta-oe/recipes-navigation/geoclue/geoclue_2.5.7.bb
rename to meta-oe/recipes-navigation/geoclue/geoclue_2.6.0.bb
index 3abb62944..68149edff 100644
--- a/meta-oe/recipes-navigation/geoclue/geoclue_2.5.7.bb
+++ b/meta-oe/recipes-navigation/geoclue/geoclue_2.6.0.bb
@@ -8,11 +8,11 @@ SECTION =3D "console/network"
=20
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbdfdd4986a0853eb84eeba85f9d0c=
4d6"
=20
-DEPENDS =3D "glib-2.0 dbus json-glib libsoup-2.4 intltool-native"
+DEPENDS =3D "glib-2.0 dbus json-glib libsoup-3.0 intltool-native"
=20
 inherit meson pkgconfig gtk-doc gobject-introspection vala
=20
-SRCREV =3D "3bb60dd600a8b247fd6049e7e5b1c73c2c5fc0e8"
+SRCREV =3D "becfa5837cfafa064219a5ab2c2a4eaf35b24c0b"
 SRC_URI =3D "git://gitlab.freedesktop.org/geoclue/geoclue.git;protocol=3D=
https;nobranch=3D1"
=20
 S =3D "${WORKDIR}/git"
@@ -36,6 +36,7 @@ EXTRA_OEMESON +=3D " \
=20
 FILES:${PN} +=3D " \
     ${datadir}/dbus-1/system-services \
+    ${datadir}/polkit-1 \
     ${libdir} \
     ${systemd_unitdir} \
     ${prefix}/libexec \
--=20
2.34.1


