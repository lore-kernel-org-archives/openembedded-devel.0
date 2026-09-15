Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 396CCC982C2
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 07:44:28 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18105.1789458262726089038
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2026 00:44:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=WSIwk/28;
 spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout11.t-online.de (Postfix) with SMTP id D19421C59A
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 09:44:20 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.162.202]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x6Nps-00ds6A0; Tue, 15 Sep 2026 09:44:12 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 31/31] gnome-chess: upgrade 50.0 -> 50.1
Date: Tue, 15 Sep 2026 09:43:47 +0200
Message-ID: <20260915074347.6003-31-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915074347.6003-1-f_l_k@t-online.de>
References: <20260915074347.6003-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789458252-E97F99B9-123872EC/0/0 CLEAN NORMAL
X-TOI-MSGID: 427d6012-a5ed-498b-b5bc-13318523b3ee
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789458260; i=f_l_k@t-online.de;
	bh=KNEXGsRuIEA9e7eAs3NUJCQE5IDt/j/glH0BFI7vvNA=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=WSIwk/287GlmfafEydCVWTdBbPRj47IBtyYh3niKYx1m55a8nRqk2oXhTFpDJl/Wq
	 bIPuPErlvgI73zMYqwggj+FAfFaFXIwaycJGrC7kkyL45OOlq+0AyVLjSvj6pVH9DB
	 +ctFSrELWMu60lR/oKZ4Lgrut/jy2PLDiDti+QHffzuarbb7nXzaLPotvQjAynvYWF
	 OSaIi1tfdsjxDcawJyo4iVowII7KYze60Ash7Xmip9OlAdil62itU/3C/ee9T1rkyn
	 9/suRL029eqv2Y3Bq6+rl0gtKYLKzwm3f9O1E+0+jNHrRKleLWVk0f39YgqL/0p7Dw
	 +zYvRmCdd+T3g==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 07:44:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130041

SRCREV is the commit the 50.1 tag points at, not the tag object.

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/gnome-chess/gnome-chess_50.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_50.1.bb b/m=
eta-gnome/recipes-gnome/gnome-chess/gnome-chess_50.1.bb
index e57bdd39f2..abd70a68ed 100644
--- a/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_50.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_50.1.bb
@@ -28,6 +28,6 @@ inherit meson pkgconfig gobject-introspection gtk-icon-=
cache vala features_check
=20
 GIR_MESON_OPTION =3D ""
=20
-SRCREV =3D "079ef83fe6c538be9178b03999724d5f4649bc69"
+SRCREV =3D "b999e7d82b3c492436aa98827c0c6d64fa4a57f3"
=20
 FILES:${PN} +=3D "${datadir}"
--=20
2.55.0


