Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74577D3EE8A
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 15:44:00 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40498.1769096637741844546
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Jan 2026 07:43:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout02.t-online.de (Postfix) with SMTP id BE1E7F258
	for <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 16:43:54 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.161.253]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1viwqb-1auNgT0; Thu, 22 Jan 2026 16:43:49 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 05/11] libnma:
Date: Thu, 22 Jan 2026 16:43:28 +0100
Message-ID: <20260122154334.1872038-5-f_l_k@t-online.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260122154334.1872038-1-f_l_k@t-online.de>
References: <20260122154334.1872038-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1769096630-6B7FD925-9022076E/0/0 CLEAN NORMAL
X-TOI-MSGID: dabf46ca-8a15-426b-89b0-18ff86d41193
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 15:44:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123748

---
 meta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb b/me=
ta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb
index 9a4dad35d1..502dfb5ce2 100644
--- a/meta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb
+++ b/meta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb
@@ -6,7 +6,7 @@ DEPENDS =3D "glib-2.0 gtk+3 gtk4 networkmanager"
=20
 inherit gnomebase gobject-introspection gtk-doc gettext vala features_ch=
eck
=20
-REQUIRED_DISTRO_FEATURES =3D "${@bb.utils.contains('PACKAGECONFIG','gcr'=
,'x11','',d)} opengl"
+REQUIRED_DISTRO_FEATURES =3D "opengl"
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
 SRC_URI[archive.sha256sum] =3D "53a6fb2b190ad37c5986caed3e98bede7c3c6023=
99ee4f93c8fc054303d76dab"
--=20
2.52.0


