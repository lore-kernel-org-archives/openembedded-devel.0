Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35407C32771
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 11:45:00 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web08.2151.1660909489677314411
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Aug 2022 04:44:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83,
 mailfrom: f_l_k@t-online.de)
Received: from fwd70.dcpf.telekom.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout07.t-online.de (Postfix) with SMTP id 0391B6958
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Aug 2022 13:44:48 +0200 (CEST)
Received: from flk-MS-7C91.. ([84.163.43.141]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oP0Qh-0Aw6bZ0; Fri, 19 Aug 2022 13:44:47 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-multimedia][PATCH] wireplumber: update to v0.4.11
Date: Fri, 19 Aug 2022 13:44:37 +0200
Message-Id: <20220819114437.4806-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1660909487-0144B853-8168ACF6/0/0 CLEAN NORMAL
X-TOI-MSGID: 7dcd4812-cba1-4c57-979c-da64e559f961
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Aug 2022 11:45:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98328

- install systemd-user-service
- install modules to get the binary running

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{wireplumber_0.4.9.bb =3D> wireplumber_0.4.11.bb}       | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-multimedia/recipes-multimedia/wireplumber/{wireplumber_0.4.9=
.bb =3D> wireplumber_0.4.11.bb} (95%)

diff --git a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0=
.4.9.bb b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.=
11.bb
similarity index 95%
rename from meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.=
4.9.bb
rename to meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.=
11.bb
index 0a2ca3b6f..e093734ed 100644
--- a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.9.bb
+++ b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.11.b=
b
@@ -11,7 +11,7 @@ DEPENDS =3D "glib-2.0 glib-2.0-native lua pipewire \
     ${@bb.utils.contains("DISTRO_FEATURES", "gobject-introspection-data"=
, "python3-native python3-lxml-native doxygen-native", "", d)} \
 "
=20
-SRCREV =3D "8b97b40c4467951fbd4181afb47e4175361365a6"
+SRCREV =3D "80b3559963f0ad40a7bfa6c23b0098275c0b5ebe"
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/wireplumber.git;branc=
h=3Dmaster;protocol=3Dhttps \
            file://90-OE-disable-session-dbus-dependent-features.lua \
            "
@@ -36,7 +36,7 @@ EXTRA_OEMESON +=3D " \
 "
=20
 PACKAGECONFIG ??=3D "\
-    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd systemd-=
system-service', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd systemd-=
system-service systemd-user-service', '', d)} \
 "
=20
 PACKAGECONFIG[systemd] =3D "-Dsystemd=3Denabled,-Dsystemd=3Ddisabled,sys=
temd"
@@ -130,7 +130,9 @@ CONFFILES:${PN} +=3D " \
 # Add pipewire to RRECOMMENDS, since WirePlumber expects a PipeWire daem=
on to
 # be present. While in theory any application that uses libpipewire can =
configure
 # itself to become a daemon, in practice, the PipeWire daemon is used.
-RRECOMMENDS:${PN} +=3D "${PN}-scripts pipewire"
+RRECOMMENDS:${PN} +=3D "pipewire ${PN}-scripts ${PN}-modules-meta"
+
+FILES:${PN} +=3D "${systemd_user_unitdir}"
=20
 FILES:libwireplumber =3D " \
     ${libdir}/libwireplumber-*.so.* \
--=20
2.34.1


