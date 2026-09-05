Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8BFEC624D3
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 13:49:58 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8512.1788616195706380727
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Sep 2026 06:49:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=IieuDB4B;
 spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout08.t-online.de (Postfix) with SMTP id 7C179E3CC;
	Sat,  5 Sep 2026 15:49:53 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.161.1]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x2qmF-1bajDM0; Sat, 5 Sep 2026 15:49:51 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Claude Opus 5 <noreply@anthropic.com>
Subject: [meta-gnome][PATCH 1/2] gnome-online-accounts: drop obsolete webkitgtk dependency
Date: Sat,  5 Sep 2026 15:49:38 +0200
Message-ID: <20260905134939.47864-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1788616191-11FF89E3-FB270B13/0/0 CLEAN NORMAL
X-TOI-MSGID: 266ea15f-496a-40ba-b421-a3c5045e2150
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1788616193; i=f_l_k@t-online.de;
	bh=C6fLou3DGaAMvBFJmxMTqC/BBTHbdyI8l89TTlCCLQI=;
	h=From:To:Cc:Subject:Date;
	b=IieuDB4BiHc1njCpuisDhyj7gXaY0dS4TB1vrNLmyGYFW6tUSEexO6fobs/UROYI8
	 niCqJxV3tLHnOG0bCr36RBlMKjpg3pfe4JcvcRbwbjmBRdSyr/RQyTImOr1YyyVjvz
	 JjSZy6u4i1o0x5RfSTd1oKdKA3j7ypjuM2zLy40YL+hHmcH4tKFO8RWaTtYE3gGNw/
	 LATGWycXJx34T/spXmD8U+KYwBSn/PJEat5BuEWbU9D9U/V6eYv8Ek5dP1KFKhpOV/
	 eL5iFluG/j3wKB6UfyOdVmQPGZ77I2k/m3Gh53mjOdBn79HcWI4epcmEkuhiymFVWp
	 3auYSCqeidviQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Sep 2026 13:49:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129777

Upstream removed the embedded webview along with the WebKit dependency in
3.49.0 ("Remove the webview and WebKit dependency"). The 3.58.1 sources d=
o
not reference webkit outside of NEWS anymore, so goabackend no longer nee=
ds
webkitgtk to build. OAuth2 logins are handed to the default browser via
g_app_info_launch_default_for_uri_async() instead.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Co-Authored-By: Claude Opus 5 <noreply@anthropic.com>
Claude-Session: https://claude.ai/code/session_01HiauLCu6cken5wf44PijzQ
---
 .../gnome-online-accounts/gnome-online-accounts_3.58.1.bb       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-=
accounts_3.58.1.bb b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome=
-online-accounts_3.58.1.bb
index 6b80df7781..e4cdbe3cd5 100644
--- a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-account=
s_3.58.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-account=
s_3.58.1.bb
@@ -12,7 +12,7 @@ SRC_URI[archive.sha256sum] =3D "9ec1900cc51409c2067c07c=
828c10be06fe3bf68d2999bb72d
=20
 PACKAGECONFIG ?=3D "goabackend kerberos owncloud google"
=20
-PACKAGECONFIG[goabackend] =3D "-Dgoabackend=3Dtrue,-Dgoabackend=3Dfalse,=
gtk4 libadwaita json-glib libxml2 libsoup rest libsecret webkitgtk"
+PACKAGECONFIG[goabackend] =3D "-Dgoabackend=3Dtrue,-Dgoabackend=3Dfalse,=
gtk4 libadwaita json-glib libxml2 libsoup rest libsecret"
 PACKAGECONFIG[kerberos] =3D "-Dkerberos=3Dtrue, -Dkerberos=3Dfalse,krb5"
 PACKAGECONFIG[exchange] =3D "-Dexchange=3Dtrue, -Dexchange=3Dfalse"
 PACKAGECONFIG[google] =3D "-Dgoogle=3Dtrue, -Dgoogle=3Dfalse"
--=20
2.55.0


