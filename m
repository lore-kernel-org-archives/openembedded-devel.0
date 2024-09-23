Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD086CF9C5B
	for <webhook@archiver.kernel.org>; Mon, 23 Sep 2024 08:02:11 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.31441.1727078523271069662
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Sep 2024 01:02:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout10.t-online.de (Postfix) with SMTP id 791903BA3E
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Sep 2024 10:01:41 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.224.177]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sse0p-1DkyO10; Mon, 23 Sep 2024 10:01:39 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/2] gnome-shell: add gnome-control-center dependency
Date: Mon, 23 Sep 2024 10:03:25 +0200
Message-ID: <20240923080326.123106-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1727078499-F97F845E-C23BFB26/0/0 CLEAN NORMAL
X-TOI-MSGID: 03265ee3-b5ad-495c-9615-fbb81c5b51ae
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Sep 2024 08:02:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112454

This fixes:
Run-time dependency gnome-keybindings found: NO (tried pkgconfig and cmak=
e)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/gnome-shell/gnome-shell_47.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_47.0.bb b/m=
eta-gnome/recipes-gnome/gnome-shell/gnome-shell_47.0.bb
index a567e3e4a..3829110bf 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_47.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_47.0.bb
@@ -13,6 +13,7 @@ DEPENDS =3D " \
     gjs \
     gnome-autoar \
     gnome-desktop \
+    gnome-control-center \
     polkit \
     pipewire \
     libsoup-3.0 \
--=20
2.46.0


