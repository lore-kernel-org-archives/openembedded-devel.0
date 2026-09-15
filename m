Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26376C982D1
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 07:44:41 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18082.1789458273897578276
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2026 00:44:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=LDrUUVY7;
 spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout01.t-online.de (Postfix) with SMTP id 18E7D1C423
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 09:44:20 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.162.202]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x6Npq-00ds5t0; Tue, 15 Sep 2026 09:44:10 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 14/31] gnome-settings-daemon: upgrade 50.1 -> 51.0
Date: Tue, 15 Sep 2026 09:43:30 +0200
Message-ID: <20260915074347.6003-14-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915074347.6003-1-f_l_k@t-online.de>
References: <20260915074347.6003-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789458250-157F99B9-6C4BB118/0/0 CLEAN NORMAL
X-TOI-MSGID: c440b33e-4ae8-435f-b82a-5ac1aab2b19d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789458260; i=f_l_k@t-online.de;
	bh=2ghk8lM8k7F3OzDmYyElz2sw48kGVOBGcGalMByt1d0=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=LDrUUVY7FkM6/IkvF2rl4VOTvtHcldIoqTktHerT2TdLUaF5M+x4z5yM/muMDobe0
	 fjdozOhTEf99V4tciiQ67BZUCJS32jNEjGPjzjT6TT9crQt6oelLngpG4PjUk/YvcR
	 5SsqamCfIYMc0rDKdYeZMjI0aoMsHA6E9Lt+Nf/RdeyrhIlslsmlOhcZPsbatA2SwY
	 5sHAHALDFN2ecAOH1RNUvQzSsg+q54UbAFGNhcNGIVwkjq9orXBLkvMXJJBZMaBydG
	 41rYS1CK3GFpmAzMQ+5iolPfX8KqUJTSL8n5QQOtW/rCK1um2D1aV9n8zIDm6jerXX
	 84U6k+nq/x12A==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 07:44:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130058

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...me-settings-daemon_50.1.bb =3D> gnome-settings-daemon_51.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-settings-daemon/{gnome-settings-da=
emon_50.1.bb =3D> gnome-settings-daemon_51.0.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-setting=
s-daemon_50.1.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-s=
ettings-daemon_51.0.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings=
-daemon_50.1.bb
rename to meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-d=
aemon_51.0.bb
index a0f8b81824..b0d54f6e21 100644
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemo=
n_50.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemo=
n_51.0.bb
@@ -25,7 +25,7 @@ DEPENDS =3D " \
 REQUIRED_DISTRO_FEATURES =3D "alsa polkit pulseaudio systemd gobject-int=
rospection-data"
 GIR_MESON_OPTION =3D ""
=20
-SRC_URI[archive.sha256sum] =3D "dd2c9730914f0ececa0229dd8a8c2940a57ddeb0=
802434558d4b164d79cfe05c"
+SRC_URI[archive.sha256sum] =3D "7c6249118ddfffc4bb34d6b3edaa86b3ea02a1ad=
2b7711d79480749906767665"
=20
 UPSTREAM_CHECK_URI =3D "https://gitlab.gnome.org/GNOME/gnome-settings-da=
emon/-/tags"
 UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)"
--=20
2.55.0


