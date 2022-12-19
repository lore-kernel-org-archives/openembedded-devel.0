Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B39FC4708E
	for <webhook@archiver.kernel.org>; Mon, 19 Dec 2022 13:12:16 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.21091.1671455525909673188
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Dec 2022 05:12:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout09.t-online.de (Postfix) with SMTP id BA2FE3A93
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Dec 2022 14:11:22 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.36.130]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p7FvO-2FOhA00; Mon, 19 Dec 2022 14:11:22 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 08/10] grilo: update 0.3.14 -> 0.3.15
Date: Mon, 19 Dec 2022 14:10:39 +0100
Message-Id: <20221219131041.452949-8-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221219131041.452949-1-f_l_k@t-online.de>
References: <20221219131041.452949-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1671455482-69DEC991-10ED5F32/0/0 CLEAN NORMAL
X-TOI-MSGID: 2102f8d9-202a-4024-811e-3128a0674568
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Dec 2022 13:12:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100102

build with libsoup3

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/grilo/{grilo_0.3.14.bb =3D> grilo_0.3.15.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/grilo/{grilo_0.3.14.bb =3D> grilo_0.3.15=
.bb} (87%)

diff --git a/meta-gnome/recipes-gnome/grilo/grilo_0.3.14.bb b/meta-gnome/=
recipes-gnome/grilo/grilo_0.3.15.bb
similarity index 87%
rename from meta-gnome/recipes-gnome/grilo/grilo_0.3.14.bb
rename to meta-gnome/recipes-gnome/grilo/grilo_0.3.15.bb
index 7ceb26d7a..d51a27f01 100644
--- a/meta-gnome/recipes-gnome/grilo/grilo_0.3.14.bb
+++ b/meta-gnome/recipes-gnome/grilo/grilo_0.3.15.bb
@@ -11,7 +11,7 @@ GNOMEBASEBUILDCLASS =3D "meson"
=20
 inherit gnomebase gobject-introspection gtk-doc gettext vala
=20
-SRC_URI[archive.sha256sum] =3D "0369d0b00bb0f59ba5f7aea8cfc665f38df14a5b=
4182d28c7c1e2cd15b518743"
+SRC_URI[archive.sha256sum] =3D "f352acf73665669934270636fede66b52da6801f=
e20f638c4048ab2678577b2d"
=20
 GIR_MESON_OPTION =3D "enable-introspection"
 GTKDOC_MESON_OPTION =3D "enable-gtk-doc"
@@ -20,7 +20,7 @@ GTKDOC_MESON_OPTION =3D "enable-gtk-doc"
 # | bindings/vala/meson.build:15:0: ERROR: Unknown variable "grlnet_gir"=
.
 PACKAGECONFIG ??=3D "net"
=20
-PACKAGECONFIG[net] =3D "-Denable-grl-net=3Dtrue, -Denable-grl-net=3Dfals=
e, libsoup-2.4"
+PACKAGECONFIG[net] =3D "-Denable-grl-net=3Dtrue, -Denable-grl-net=3Dfals=
e, libsoup-3.0"
 PACKAGECONFIG[test-ui] =3D "-Denable-test-ui=3Dtrue, -Denable-test-ui=3D=
false, gtk+3 liboauth"
=20
 # Once we have a recipe for 'totem-plparser' this can turn into a PACKAG=
ECONFIG
--=20
2.34.1


