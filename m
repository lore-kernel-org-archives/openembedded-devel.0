Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56F4DCA9EBE
	for <webhook@archiver.kernel.org>; Sat, 10 Oct 2026 07:54:24 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5389.1791618857137193308
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Oct 2026 00:54:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=uMy3mtx6;
 spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout05.t-online.de (Postfix) with SMTP id 240A381B
	for <openembedded-devel@lists.openembedded.org>; Sat, 10 Oct 2026 09:54:15 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.229.158]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xFRuG-3wF0HQ0; Sat, 10 Oct 2026 09:54:12 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [blacksail][meta-gnome][PATCHv2 1/3] Revert "gnome-shell-extensions: upgrade 50.3 -> 51.0"
Date: Sat, 10 Oct 2026 09:54:03 +0200
Message-ID: <20261010075405.1740272-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1791618852-CD7F9BCA-0C00F136/0/0 CLEAN NORMAL
X-TOI-MSGID: 561e22f2-4893-4175-82b5-7ee0db8ba7e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1791618855; i=f_l_k@t-online.de;
	bh=PzS8KcI8RmvC+dfAmKLtdCQ0a99sA+7FNB39Ub2sufY=;
	h=From:To:Subject:Date;
	b=uMy3mtx6HkvupY9t9s+bCNWnZHgm0h3WXoqUF4CQb/9vs4ANc/a2uPNeWvCy9TLKg
	 JOsCsLMPUkrm10bX6npUD5Em8dzPTOgDDDGtldmQ+wvu9dxSc76PKHyWIkT6ZFzyKn
	 wKSESIEuBvWMU6ccD8KbRTTJ7boJLM/SMldg2URg4VnTcPV78cx6h6kJVK/fauqf1M
	 bJ04mw05ae/Os+c5FoETNokONOKoVjqFlnED4IItjv0ybm7pZkx+CEJVIp2S9jXTNT
	 3Duzhd8rfIXXg5c+jVIDEubaMFaQxiXnGzT8Cwg0ju5pyarAOy8PQwfPQhhMZOIx+f
	 UYRVWAdJbcO3g==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Oct 2026 07:54:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130721

This reverts commit 89448d167e9e672609801802286c432ad0b88218.

The extensions follow gnome-shell, which goes back to 50.4 on blacksail.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
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


