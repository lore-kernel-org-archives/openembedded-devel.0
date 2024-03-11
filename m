Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4E26C54E58
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 09:16:59 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.58454.1710148612593643890
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Mar 2024 02:16:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout06.t-online.de (Postfix) with SMTP id 556B53E52
	for <openembedded-devel@lists.openembedded.org>; Mon, 11 Mar 2024 10:16:50 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.172.233]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rjbm4-02iq1p0; Mon, 11 Mar 2024 10:16:48 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] gtk-vnc: fix reproducibility issue
Date: Mon, 11 Mar 2024 10:17:12 +0100
Message-ID: <20240311091712.15285-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1710148608-267FB979-5B73875B/0/0 CLEAN NORMAL
X-TOI-MSGID: 6ff5f498-1a64-4288-b5db-6b7d1aa96fee
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Mar 2024 09:16:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109267

gtk-vnc  inserts lines containing ${S} into the source. Although required=
 for
compilation, it affects reproducibility for the	src package.

Fix this by simply not packaging the modified source code

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.3.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.3.1.bb b/m=
eta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.3.1.bb
index 3bfe38f08..8bd37f754 100644
--- a/meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.3.1.bb
+++ b/meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.3.1.bb
@@ -25,4 +25,6 @@ PACKAGECONFIG ??=3D "pulseaudio sasl"
=20
 inherit pkgconfig gnomebase gettext gobject-introspection vala features_=
check
=20
+PACKAGE_DEBUG_SPLIT_STYLE =3D "debug-without-src"
+
 SRC_URI[archive.sha256sum] =3D "512763ac4e0559d0158b6682ca5dd1a3bd633f08=
2f5e4349d7158e6b5f80f1ce"
--=20
2.44.0


