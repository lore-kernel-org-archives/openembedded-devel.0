Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B24ABCF9C6B
	for <webhook@archiver.kernel.org>; Sun, 22 Sep 2024 02:39:12 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.8502.1726972745274555639
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Sep 2024 19:39:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout06.t-online.de (Postfix) with SMTP id 581DF16E07
	for <openembedded-devel@lists.openembedded.org>; Sun, 22 Sep 2024 04:39:03 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.41.228]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ssCV5-2BmrLd0; Sun, 22 Sep 2024 04:39:03 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCHv2] grilo: fix gir install
Date: Sun, 22 Sep 2024 04:40:41 +0200
Message-ID: <20240922024041.871728-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1726972743-C57F841C-45B9EAEF/0/0 CLEAN NORMAL
X-TOI-MSGID: e7092a99-436f-4633-8ef4-5a09c8087042
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 Sep 2024 02:39:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112446

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/grilo/grilo_0.3.16.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/grilo/grilo_0.3.16.bb b/meta-gnome/=
recipes-gnome/grilo/grilo_0.3.16.bb
index b6ac75dd8..f6ea21eb5 100644
--- a/meta-gnome/recipes-gnome/grilo/grilo_0.3.16.bb
+++ b/meta-gnome/recipes-gnome/grilo/grilo_0.3.16.bb
@@ -7,7 +7,6 @@ DEPENDS =3D " \
     glib-2.0 \
 "
=20
-
 inherit gnomebase gobject-introspection gtk-doc gettext vala
=20
 SRC_URI[archive.sha256sum] =3D "884580e8c5ece280df23aa63ff5234b7d48988a4=
04df7d6bfccd1e77b473bd96"
@@ -37,3 +36,5 @@ do_compile:append() {
             ${B}/src/grl-type-builtins.c
     done
 }
+
+FILES:${PN} +=3D "${libdir}/girepository-1.0"
--=20
2.46.0


