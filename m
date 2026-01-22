Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B62DCD3EE95
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 15:44:00 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40494.1769096637236874231
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Jan 2026 07:43:57 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout10.t-online.de (Postfix) with SMTP id C19863883A
	for <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 16:43:54 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.161.253]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1viwqc-1auNgV0; Thu, 22 Jan 2026 16:43:50 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 07/11] gnome-control-center: remove x11 from REQUIRED_DISTRO_FEATURES
Date: Thu, 22 Jan 2026 16:43:30 +0100
Message-ID: <20260122154334.1872038-7-f_l_k@t-online.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260122154334.1872038-1-f_l_k@t-online.de>
References: <20260122154334.1872038-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1769096630-FFFFC925-C1660303/0/0 CLEAN NORMAL
X-TOI-MSGID: 425e7e31-abd0-4c29-b0c2-3e9a9ac8ac35
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 15:44:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123742

---
 .../gnome-control-center/gnome-control-center_49.2.2.bb         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-=
center_49.2.2.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-co=
ntrol-center_49.2.2.bb
index 9bb0228d50..38b2c53c82 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
49.2.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
49.2.2.bb
@@ -37,7 +37,7 @@ DEPENDS =3D " \
=20
 inherit gtk-icon-cache pkgconfig gnomebase gsettings gettext gi-docgen u=
pstream-version-is-even bash-completion features_check
=20
-REQUIRED_DISTRO_FEATURES +=3D "opengl polkit pulseaudio systemd x11"
+REQUIRED_DISTRO_FEATURES +=3D "opengl polkit pulseaudio systemd"
=20
 SRC_URI =3D "https://download.gnome.org/sources/gnome-control-center/${@=
oe.utils.trim_version('${PV}', 1)}/gnome-control-center-${PV}.tar.xz"
 SRC_URI[sha256sum] =3D "c23ae220d6c1237d285925de7801e0e36338b9cc1a8bb51c=
2e37e715e6b503ad"
--=20
2.52.0


