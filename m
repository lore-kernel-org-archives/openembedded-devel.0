Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82D62D3EE8E
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 15:44:00 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40496.1769096637298043535
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Jan 2026 07:43:57 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout10.t-online.de (Postfix) with SMTP id BD76738744
	for <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 16:43:54 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.161.253]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1viwqb-1auNgR0; Thu, 22 Jan 2026 16:43:49 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 03/11] rygel: add x11 to REQUIRED_DISTRO_FEATURES
Date: Thu, 22 Jan 2026 16:43:26 +0100
Message-ID: <20260122154334.1872038-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260122154334.1872038-1-f_l_k@t-online.de>
References: <20260122154334.1872038-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1769096629-267FB925-25845158/0/0 CLEAN NORMAL
X-TOI-MSGID: f7f146cd-1573-4b90-bb0a-48b52558bed4
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 15:44:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123746

x11 is required
---
 meta-multimedia/recipes-connectivity/rygel/rygel_45.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-connectivity/rygel/rygel_45.0.bb b/m=
eta-multimedia/recipes-connectivity/rygel/rygel_45.0.bb
index 97948d896f..60a79f5fb3 100644
--- a/meta-multimedia/recipes-connectivity/rygel/rygel_45.0.bb
+++ b/meta-multimedia/recipes-connectivity/rygel/rygel_45.0.bb
@@ -18,7 +18,7 @@ RRECOMMENDS:${PN} =3D "rygel-plugin-media-export"
 inherit gnomebase features_check vala gobject-introspection gettext syst=
emd
=20
 # gobject-introspection is mandatory for libmediaart-2.0 and cannot be c=
onfigured
-REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
+REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data x11"
=20
 SRC_URI[archive.sha256sum] =3D "82667b902fc0672e64cf91eb727a70137a8fdfe7=
a3d9a4c158b0f4b1fc700882"
=20
--=20
2.52.0


