Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F314C25B6F
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 06:32:44 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.1320.1698388356650286663
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Oct 2023 23:32:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout12.t-online.de (Postfix) with SMTP id C33341E228
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Oct 2023 08:32:34 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.175.233]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qwGOX-0aU0JN0; Fri, 27 Oct 2023 08:32:33 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gnome-shell: Add missing dependency on pipewire
Date: Fri, 27 Oct 2023 08:32:46 +0200
Message-ID: <20231027063246.184094-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1698388353-116DAD75-D8A0AFC6/0/0 CLEAN NORMAL
X-TOI-MSGID: d0b146eb-9413-4fbf-a699-156dd3a5fcc3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Oct 2023 06:32:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105769

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/gnome-shell/gnome-shell_45.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_45.0.bb b/m=
eta-gnome/recipes-gnome/gnome-shell/gnome-shell_45.0.bb
index 66c05a1ff..d920c6d65 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_45.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_45.0.bb
@@ -14,6 +14,7 @@ DEPENDS =3D " \
     gjs \
     gnome-autoar \
     polkit \
+    pipewire \
     libcroco \
     libsoup-3.0 \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', '', 'startup-noti=
fication', d)} \
--=20
2.42.0


