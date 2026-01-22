Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 743E6D3EE89
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 15:44:00 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40179.1769096637279644316
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Jan 2026 07:43:57 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout02.t-online.de (Postfix) with SMTP id C00EEF2DA
	for <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 16:43:54 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.161.253]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1viwqc-1auNgU0; Thu, 22 Jan 2026 16:43:50 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 06/11] gnome-bluetooth: remove x11 from REQUIRED_DISTRO_FEATURES
Date: Thu, 22 Jan 2026 16:43:29 +0100
Message-ID: <20260122154334.1872038-6-f_l_k@t-online.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260122154334.1872038-1-f_l_k@t-online.de>
References: <20260122154334.1872038-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1769096630-657F1925-9A7628D4/0/0 CLEAN NORMAL
X-TOI-MSGID: bb2218ec-6169-423b-ad97-3c1fc8924f24
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 15:44:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123744

---
 .../recipes-gnome/gnome-bluetooth/gnome-bluetooth_47.1.bb     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_47.=
1.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_47.1.bb
index e363db309d..791e5752e8 100644
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_47.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_47.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D " \
     file://COPYING.LIB;md5=3Da6f89e2100d9b6cdffcea4f398e37343 \
 "
=20
-SECTION =3D "x11/gnome"
+SECTION =3D "gnome"
=20
 DEPENDS =3D " \
     udev \
@@ -23,7 +23,7 @@ GTKIC_VERSION =3D "4"
=20
 inherit features_check gnomebase gtk-icon-cache gtk-doc gobject-introspe=
ction
=20
-REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
+REQUIRED_DISTRO_FEATURES =3D "opengl"
=20
 SRC_URI[archive.sha256sum] =3D "03e3e7403a15108ffc1496210a1da5c2961b2834=
a5c07eccc7a3f493195daba3"
=20
--=20
2.52.0


