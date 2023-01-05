Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 257FEC3DA7D
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 15:36:52 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.15684.1672933003069788374
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Jan 2023 07:36:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout04.t-online.de (Postfix) with SMTP id 9F5BC13C21
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Jan 2023 16:35:42 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.228.197]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pDSHK-0Q5zlp0; Thu, 5 Jan 2023 16:35:38 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH] gnome:terminal add missing inherit meson
Date: Thu,  5 Jan 2023 16:35:31 +0100
Message-Id: <20230105153531.932402-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1672932938-69DEC991-859A16F8/0/0 CLEAN NORMAL
X-TOI-MSGID: 26f2821b-cc81-496b-a7aa-8599a0753cbd
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Jan 2023 15:36:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100416

When testing Gnome recipes at runtime, I noticed that inherit meson was m=
issing
and gnome-terminal was not compiled. Fix this

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/gnome-terminal/gnome-terminal_3.46.7.bb   | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.46.=
7.bb b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.46.7.bb
index 69af11c91..d9afeec46 100644
--- a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.46.7.bb
+++ b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.46.7.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D " \
=20
 GNOMEBASEBUILDCLASS =3D "meson"
=20
-inherit gsettings gnome-help gettext itstool upstream-version-is-even
+inherit pkgconfig meson gsettings gnome-help gettext itstool upstream-ve=
rsion-is-even
=20
 DEPENDS =3D " \
     glib-2.0 \
@@ -30,8 +30,8 @@ PACKAGECONFIG[nautilus] =3D "-Dnautilus_extension=3Dtru=
e,-Dnautilus_extension=3Dfalse,
 PACKAGECONFIG[search_provider] =3D "-Dsearch_provider=3Dtrue,-Dsearch_pr=
ovider=3Dfalse,,gnome-shell"
=20
 FILES:${PN} +=3D " \
-    ${datadir}/metainfo \
-    ${datadir}/dbus-1 \
+    ${datadir} \
+    ${libdir}/nautilus/extensions-4 \
     ${systemd_user_unitdir} \
 "
=20
--=20
2.34.1


