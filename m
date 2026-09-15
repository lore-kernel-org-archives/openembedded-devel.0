Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7585C982CA
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 07:44:29 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18101.1789458262092876245
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2026 00:44:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=oFNNkQUD;
 spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout10.t-online.de (Postfix) with SMTP id 21C3F37B5B
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 09:44:20 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.162.202]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x6Npq-00ds5v0; Tue, 15 Sep 2026 09:44:11 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 16/31] gnome-shell-extensions: upgrade 50.3 -> 51.0
Date: Tue, 15 Sep 2026 09:43:32 +0200
Message-ID: <20260915074347.6003-16-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915074347.6003-1-f_l_k@t-online.de>
References: <20260915074347.6003-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789458251-04FF69B9-DB7346D9/0/0 CLEAN NORMAL
X-TOI-MSGID: 39e0f8c1-b637-4900-afe4-aa85110e5cf8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789458260; i=f_l_k@t-online.de;
	bh=h2wYneW23mTLcPSfISNinXggZfEiHtipVZvbJoejTnA=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=oFNNkQUD7bLCwpa5RVe+E+6E8kMK4XrLB5ZTjmiOFrBrxfiIZgsC0Pe136LTTX/Re
	 k4ujIQ/SdHZyHuoOh/pK5lJua8Q2tBUiLYxhIELkfpdGEKPt6iMsOM2Xxa+hoAREyZ
	 eezK+u4xyDmLBS6ks9/tF1/h3qDlrqqU9KZ7ttPLL+RvJlyPcVJ1+y7FpV9YBbDUEj
	 NPZ1xjfsgIF4Rwfs73cNhOJV8iLlEcmiTkNWPK7XUtBkHAxszJ0UCrsnJDI7dkf4Zz
	 O7V3vFVxP5gF6guvqDL+zR6jhDguWlA+AZfzuyh2XPDvgApade94pNx0kc+KZYJ8zV
	 QB1oRvu6Z+U/Q==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 07:44:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130038

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...-shell-extensions_50.3.bb =3D> gnome-shell-extensions_51.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-shell/{gnome-shell-extensions_50.3=
.bb =3D> gnome-shell-extensions_51.0.bb} (85%)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_=
50.3.bb b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_51.=
0.bb
similarity index 85%
rename from meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_5=
0.3.bb
rename to meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_51.=
0.bb
index a7a5b06fb9..9b58d976ef 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_50.3.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_51.0.bb
@@ -6,7 +6,7 @@ inherit gnomebase gettext gsettings features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "x11 polkit systemd pam gobject-introspecti=
on-data"
=20
-SRC_URI[archive.sha256sum] =3D "68fc74306f88f697a6bcdb8243cb32a9ec0cd3f6=
e2bb92249b24b60fc57450b6"
+SRC_URI[archive.sha256sum] =3D "3c078d7b88faee3d0f68adcee1392b1bed84731b=
91a337ec894cc88aa8a8b813"
=20
 EXTRA_OEMESON +=3D " \
     -Dextension_set=3Dall \
--=20
2.55.0


