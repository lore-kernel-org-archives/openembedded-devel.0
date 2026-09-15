Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DB55C982C4
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 07:44:40 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18117.1789458273740984107
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2026 00:44:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=WKJti0cE;
 spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout01.t-online.de (Postfix) with SMTP id 0C54B1C41F
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 09:44:20 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.162.202]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x6Npq-00ds5r0; Tue, 15 Sep 2026 09:44:10 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 12/31] gnome-keyring: upgrade 50.0 -> 51.0
Date: Tue, 15 Sep 2026 09:43:28 +0200
Message-ID: <20260915074347.6003-12-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915074347.6003-1-f_l_k@t-online.de>
References: <20260915074347.6003-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789458250-E9FF89B9-0FA1280E/0/0 CLEAN NORMAL
X-TOI-MSGID: d9aac45d-3b0b-4e48-b7f2-b63c0a021fc0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789458259; i=f_l_k@t-online.de;
	bh=s2bwuKIap+BoJbEst8HGfaVQDPqjLPqX+3w2x6UjRFs=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=WKJti0cEoeZb+ve7sLflAIidnCg6EzBls03DDL8ra1Xh2PY44H8RunccJoCI8jvL3
	 uD5JxEOO9I29w1S1fFUWULuclM1zoGNSZE5s5cITGhg1RPZPWEPO35Xn9nmO4QcX1O
	 uVSrgu+/o8jzEmowOTNf6KDQtS3pBPzMJb9LdlI1omg42FX7ZYuvGsGzTNhytlsdbP
	 Rm9klcZzzHQJJTUBZ6GpmG4bYtlPHMeA0T16R1IiFitgYx47hSQCOEIodnX1BYXCRy
	 U9tCQyt7PbPugBn8G8NRH4mHQMUuIpwKKxLDWKp9HlD5i2iAOR4+HA+eF49NXF6klT
	 a8WpizujeA/hA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 07:44:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130057

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-keyring_50.0.bb =3D> gnome-keyring_51.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-keyring/{gnome-keyring_50.0.bb =3D=
> gnome-keyring_51.0.bb} (94%)

diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_50.0.bb=
 b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_51.0.bb
similarity index 94%
rename from meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_50.0.bb
rename to meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_51.0.bb
index 215397ffd3..14945145dd 100644
--- a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_50.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_51.0.bb
@@ -20,7 +20,7 @@ DEPENDS =3D " \
=20
 inherit gnomebase gsettings gettext
=20
-SRC_URI[archive.sha256sum] =3D "cbd72062c53c9702bc2c4733991ad5f051ca6828=
82b30905a2829bcf1a8ecc7c"
+SRC_URI[archive.sha256sum] =3D "2aebaa2d474cc31507c87a7bbbdb3e16dbe26b1c=
fef9f206457f3f9df43558b0"
 SRC_URI +=3D "file://0001-meson-allow-setting-the-paths-to-ssh-agent-and=
-ssh-add-by-option.patch"
=20
 PACKAGECONFIG ??=3D " \
--=20
2.55.0


