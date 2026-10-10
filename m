Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44037CA9EC0
	for <webhook@archiver.kernel.org>; Sat, 10 Oct 2026 07:50:44 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5365.1791618633916367639
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Oct 2026 00:50:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=Q4JIvVx4;
 spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd91.aul.t-online.de (fwd91.aul.t-online.de [10.223.144.117])
	by mailout03.t-online.de (Postfix) with SMTP id DC3DDE280
	for <openembedded-devel@lists.openembedded.org>; Sat, 10 Oct 2026 09:50:31 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.229.158]) by fwd91.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xFRqg-4UT2hN0; Sat, 10 Oct 2026 09:50:30 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [blacksail][meta-gnome][PATCH 2/4] Revert "gnome-shell-extensions: upgrade 50.3 -> 51.0"
Date: Sat, 10 Oct 2026 09:50:20 +0200
Message-ID: <20261010075022.1738748-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010075022.1738748-1-f_l_k@t-online.de>
References: <20261010075022.1738748-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1791618630-DF7FC47D-AE4B6220/0/0 CLEAN NORMAL
X-TOI-MSGID: f84c2fdc-662c-4b55-961c-4f7220d4b8be
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1791618631; i=f_l_k@t-online.de;
	bh=fyZ/LLDYWCJ+UQRulO1YcFfEHYSgpn7OvtvLRK0fqYE=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Q4JIvVx4Nf+gLo5QuO8a5IIqr0Ew89wfvKcJTRQDEeqdbQS4buuuIyB5JEcpR+Vbe
	 PijXwMM3sp/J+G+xQuQGKDcB263mhThvsW5STkuBFvNZp+T7grZdrI1wagRMEzUBA9
	 8GvvQ06jICmppgjgsRvc6AmCmb90bfnJT5Gq34Ys52JxOKLUuP4yMDFcyOIp7UADzF
	 oUn/4rcvMu/q3SRSiuJIHLjdH0UpXE7VruKvL6zEI7QpVbwah3PrlBXd0Akz+0lAUP
	 ZJwa/Q7rwWPmN6DmHPyPk17/qO2aB7kDvS6Quwkzvo3i/KMf0ju5OqdXj9MUQsFzKH
	 GDogZKLaSwW1Q==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Oct 2026 07:50:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130716

This reverts commit 89448d167e9e672609801802286c432ad0b88218.

The extensions follow gnome-shell, which goes back to 50.4 on blacksail.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
---
 ...-shell-extensions_51.0.bb =3D> gnome-shell-extensions_50.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-shell/{gnome-shell-extensions_51.0=
.bb =3D> gnome-shell-extensions_50.3.bb} (85%)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_=
51.0.bb b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_50.=
3.bb
similarity index 85%
rename from meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_5=
1.0.bb
rename to meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_50.=
3.bb
index 9b58d976ef..a7a5b06fb9 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_51.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_50.3.bb
@@ -6,7 +6,7 @@ inherit gnomebase gettext gsettings features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "x11 polkit systemd pam gobject-introspecti=
on-data"
=20
-SRC_URI[archive.sha256sum] =3D "3c078d7b88faee3d0f68adcee1392b1bed84731b=
91a337ec894cc88aa8a8b813"
+SRC_URI[archive.sha256sum] =3D "68fc74306f88f697a6bcdb8243cb32a9ec0cd3f6=
e2bb92249b24b60fc57450b6"
=20
 EXTRA_OEMESON +=3D " \
     -Dextension_set=3Dall \
--=20
2.55.0


