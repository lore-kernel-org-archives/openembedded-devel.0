Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3191C982C5
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 07:44:28 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18073.1789458262036737877
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2026 00:44:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=OuhuEzT9;
 spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout10.t-online.de (Postfix) with SMTP id 131BF37CA5
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 09:44:20 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.162.202]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x6Npq-00ds5s0; Tue, 15 Sep 2026 09:44:10 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 13/31] gnome-session: upgrade 50.1 -> 51.0
Date: Tue, 15 Sep 2026 09:43:29 +0200
Message-ID: <20260915074347.6003-13-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915074347.6003-1-f_l_k@t-online.de>
References: <20260915074347.6003-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789458250-D9FF89B9-7F6A64EA/0/0 CLEAN NORMAL
X-TOI-MSGID: 86b378ad-6c0a-44c5-9076-4ea49377d471
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789458260; i=f_l_k@t-online.de;
	bh=IxHQgwJnZzJhcJ+pL1QbjGABIlpnSqn3r3fbsV6w24o=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=OuhuEzT98+23g/gw35oYeD04EKs0NYiNglf4z6ZCg9/DsyDIOrVGBOVXzK4UraNCH
	 Zw3Bjd6LY34yLSUDMrRd6SspAwMiL7Yj1F8oVF+yvvmdcYcfzu6o7S1Lg4RMGbDFbu
	 xfyNgdyDUZeW56npx3FnkVo6giktJKtO4E/fMVJ1thjZWKADKpmHpgm3kJ9B95mWMO
	 aXuxiWRoF4/GrCMRBOnpt+L5ktquJY5YwuQsnwjIFIW/kmtIKnNNxd+W2eicIZMr2X
	 0D23V9mwxjYDv+YRILbT/MRLZ+RFTg7rNTeGsfNq4zhlJmYEuWeO5stuiaotr2cvP3
	 J6JLjOUS0ZBww==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 07:44:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130037

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-session_50.1.bb =3D> gnome-session_51.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-session/{gnome-session_50.1.bb =3D=
> gnome-session_51.0.bb} (88%)

diff --git a/meta-gnome/recipes-gnome/gnome-session/gnome-session_50.1.bb=
 b/meta-gnome/recipes-gnome/gnome-session/gnome-session_51.0.bb
similarity index 88%
rename from meta-gnome/recipes-gnome/gnome-session/gnome-session_50.1.bb
rename to meta-gnome/recipes-gnome/gnome-session/gnome-session_51.0.bb
index af9ff91fbb..5b4070c4d3 100644
--- a/meta-gnome/recipes-gnome/gnome-session/gnome-session_50.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-session/gnome-session_51.0.bb
@@ -14,7 +14,7 @@ inherit gnomebase gettext gsettings upstream-version-is=
-even mime mime-xdg manpa
=20
 REQUIRED_DISTRO_FEATURES =3D "systemd"
=20
-SRC_URI[archive.sha256sum] =3D "6289b6afa44d3e4c999ce5761ff8b2c10ba309f5=
5f9425f2b13f98208c81f6fb"
+SRC_URI[archive.sha256sum] =3D "5195c4f60542a953ab6ebd288f3785b8e7746292=
d8c167e0c99d353438a184d1"
=20
 UPSTREAM_CHECK_URI =3D "https://gitlab.gnome.org/GNOME/gnome-session/-/t=
ags"
 UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)"
--=20
2.55.0


