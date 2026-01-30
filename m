Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53365D49C7A
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 08:35:58 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6385.1769762157137069092
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Jan 2026 00:35:57 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout06.t-online.de (Postfix) with SMTP id D8954B23
	for <openembedded-devel@lists.openembedded.org>; Fri, 30 Jan 2026 09:35:54 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.165.56]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vljyo-0O5hfF0; Fri, 30 Jan 2026 09:35:50 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] gtkmm4: remove x11 from REQUIRED_DISTRO_FEATURES
Date: Fri, 30 Jan 2026 09:35:42 +0100
Message-ID: <20260130083543.272427-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1769762150-FF7FDAF5-50E02ED7/0/0 CLEAN NORMAL
X-TOI-MSGID: c773aec5-828b-4504-aec4-5bb93499f4b0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Jan 2026 08:35:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124007

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-gnome/gtk+/gtkmm4_4.20.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-gnome/gtk+/gtkmm4_4.20.0.bb b/meta-oe/recipe=
s-gnome/gtk+/gtkmm4_4.20.0.bb
index 0e08bed8a1..0bef860c1c 100644
--- a/meta-oe/recipes-gnome/gtk+/gtkmm4_4.20.0.bb
+++ b/meta-oe/recipes-gnome/gtk+/gtkmm4_4.20.0.bb
@@ -14,7 +14,7 @@ GNOMEBN =3D "gtkmm"
=20
 inherit gnomebase features_check
=20
-REQUIRED_DISTRO_FEATURES =3D "opengl x11"
+REQUIRED_DISTRO_FEATURES =3D "opengl"
=20
 SRC_URI[archive.sha256sum] =3D "daad9bf9b70f90975f91781fc7a656c923a91374=
261f576c883cd3aebd59c833"
=20
--=20
2.52.0


