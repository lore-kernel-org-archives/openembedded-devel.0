Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DA29C369C9
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 16:39:39 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.13561.1744907969752743089
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Apr 2025 09:39:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout11.t-online.de (Postfix) with SMTP id B4EAD1612
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Apr 2025 18:39:27 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.169.76]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1u5SGt-0tTTjX0; Thu, 17 Apr 2025 18:39:27 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 3/4] gnome-remote-desktop: fix path for nologin
Date: Thu, 17 Apr 2025 18:39:11 +0200
Message-ID: <20250417163912.1060162-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417163912.1060162-1-f_l_k@t-online.de>
References: <20250417163912.1060162-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1744907967-C97F992D-58921A93/0/0 CLEAN NORMAL
X-TOI-MSGID: 0371250f-4561-4b34-9a4e-3b4cbaa8ce7f
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Apr 2025 16:39:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116938

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gnome-remote-desktop/gnome-remote-desktop_48.0.bb            | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-=
remote-desktop/gnome-remote-desktop_48.0.bb b/meta-gnome/dynamic-layers/m=
eta-security/recipes-gnome/gnome-remote-desktop/gnome-remote-desktop_48.0=
.bb
index bfb603514b..a80b101a6e 100644
--- a/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-=
desktop/gnome-remote-desktop_48.0.bb
+++ b/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-=
desktop/gnome-remote-desktop_48.0.bb
@@ -47,6 +47,7 @@ USERADD_PARAM:${PN} =3D " \
 	--no-create-home \
 	--user-group \
 	--home-dir ${localstatedir}/lib/gnome-remote-desktop \
+	--shell /sbin/nologin \
 	gnome-remote-desktop \
 "
=20
--=20
2.49.0


