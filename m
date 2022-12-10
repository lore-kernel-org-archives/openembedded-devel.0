Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAD2BC4332F
	for <webhook@archiver.kernel.org>; Sat, 10 Dec 2022 06:29:50 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.9834.1670653782148754490
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Dec 2022 22:29:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout11.t-online.de (Postfix) with SMTP id 7AE81224
	for <openembedded-devel@lists.openembedded.org>; Sat, 10 Dec 2022 07:29:39 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.225.165]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p3tMV-2qSAmP0; Sat, 10 Dec 2022 07:29:27 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCHv3] geoclue: update to latest commit to allow to build with libsoup-3.0
Date: Sat, 10 Dec 2022 07:29:16 +0100
Message-Id: <20221210062916.52677-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670653767-E18B5E65-3D2EF28E/0/0 CLEAN NORMAL
X-TOI-MSGID: 2ac131ca-a0f9-49e3-830d-602354f2616b
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Dec 2022 06:29:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100019

Hereby gnome-session will be buildable without libsoup2

- fix polkit-1 directory permissions

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{geoclue_2.5.7.bb =3D> geoclue_2.6.0.bb}       | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-navigation/geoclue/{geoclue_2.5.7.bb =3D> geoclue=
_2.6.0.bb} (72%)

diff --git a/meta-oe/recipes-navigation/geoclue/geoclue_2.5.7.bb b/meta-o=
e/recipes-navigation/geoclue/geoclue_2.6.0.bb
similarity index 72%
rename from meta-oe/recipes-navigation/geoclue/geoclue_2.5.7.bb
rename to meta-oe/recipes-navigation/geoclue/geoclue_2.6.0.bb
index 3abb62944..61b37cd9e 100644
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
-inherit meson pkgconfig gtk-doc gobject-introspection vala
+inherit meson pkgconfig gtk-doc gobject-introspection vala useradd
=20
-SRCREV =3D "3bb60dd600a8b247fd6049e7e5b1c73c2c5fc0e8"
+SRCREV =3D "becfa5837cfafa064219a5ab2c2a4eaf35b24c0b"
 SRC_URI =3D "git://gitlab.freedesktop.org/geoclue/geoclue.git;protocol=3D=
https;nobranch=3D1"
=20
 S =3D "${WORKDIR}/git"
@@ -34,8 +34,18 @@ EXTRA_OEMESON +=3D " \
     -Ddemo-agent=3Dfalse \
 "
=20
+USERADD_PACKAGES =3D "${PN}"
+USERADD_PARAM:${PN} =3D "--system --no-create-home --user-group --home-d=
ir ${sysconfdir}/polkit-1 --shell /bin/nologin polkitd"
+
+do_install:append() {
+	#Fix up permissions on polkit rules.d to work with rpm4 constraints
+	chmod 700 ${D}/${datadir}/polkit-1/rules.d
+	chown polkitd:root ${D}/${datadir}/polkit-1/rules.d
+}
+
 FILES:${PN} +=3D " \
     ${datadir}/dbus-1/system-services \
+    ${datadir}/polkit-1/rules.d \
     ${libdir} \
     ${systemd_unitdir} \
     ${prefix}/libexec \
--=20
2.34.1


