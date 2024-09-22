Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B6A3CF9C5B
	for <webhook@archiver.kernel.org>; Sun, 22 Sep 2024 01:21:02 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.7627.1726968054391762218
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Sep 2024 18:20:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout04.t-online.de (Postfix) with SMTP id 5E19720E6D
	for <openembedded-devel@lists.openembedded.org>; Sun, 22 Sep 2024 03:20:52 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.41.228]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ssBHM-0WIQ8v0; Sun, 22 Sep 2024 03:20:49 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/2] grilo: fix gir build
Date: Sun, 22 Sep 2024 03:22:33 +0200
Message-ID: <20240922012234.201830-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1726968049-9D7F848D-626CD524/0/0 CLEAN NORMAL
X-TOI-MSGID: 5e70ae73-31fc-43a2-9c96-5d26b11ec2fb
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 Sep 2024 01:21:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112441

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/grilo/grilo_0.3.16.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/grilo/grilo_0.3.16.bb b/meta-gnome/=
recipes-gnome/grilo/grilo_0.3.16.bb
index b6ac75dd8..1ed9a036c 100644
--- a/meta-gnome/recipes-gnome/grilo/grilo_0.3.16.bb
+++ b/meta-gnome/recipes-gnome/grilo/grilo_0.3.16.bb
@@ -7,8 +7,7 @@ DEPENDS =3D " \
     glib-2.0 \
 "
=20
-
-inherit gnomebase gobject-introspection gtk-doc gettext vala
+inherit gnomebase gobject-introspection-data gtk-doc gettext vala
=20
 SRC_URI[archive.sha256sum] =3D "884580e8c5ece280df23aa63ff5234b7d48988a4=
04df7d6bfccd1e77b473bd96"
=20
@@ -37,3 +36,5 @@ do_compile:append() {
             ${B}/src/grl-type-builtins.c
     done
 }
+
+FILES:${PN} +=3D "${libdir}/girepository-1.0"
--=20
2.46.0


