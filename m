Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC9DFC982C9
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 07:44:29 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18102.1789458262175507011
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2026 00:44:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=hYwy8L/r;
 spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout10.t-online.de (Postfix) with SMTP id 4042637D8B
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 09:44:20 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.162.202]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x6Npr-00ds5y0; Tue, 15 Sep 2026 09:44:11 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 19/31] gnome-text-editor: upgrade 50.1 -> 51.0
Date: Tue, 15 Sep 2026 09:43:35 +0200
Message-ID: <20260915074347.6003-19-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915074347.6003-1-f_l_k@t-online.de>
References: <20260915074347.6003-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789458251-667FB9B9-9E012110/0/0 CLEAN NORMAL
X-TOI-MSGID: 98ea618a-f1da-407c-9b1b-04eedf60323a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789458260; i=f_l_k@t-online.de;
	bh=Lo/WO5WepBdwx+yXB1VWVty6+XjJSPFB+BSnK+jOFHo=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=hYwy8L/rV+ZoMIyQkKyRjZOKq3euhLadGdUg/sTtzG6c8Jdl7IWz076X2BqZVWDYu
	 e7wvZOyWQwLUP40qVeFGM4bxjD1NLSFHTJnEAYSKtCJkeDnypIfW09ibDumliGHTFu
	 bH9Ywk+BLyQGoz9QdjakOGlKOgCCSErhKlaxMvHEQ9TuO7jlGbYfiTmiYeDbJKFmRg
	 qK23SMEG4Am6VlRvxswE/anf4+Ua3E24MSsnlSNpntriO6DGiiM3LsV9uAK3jZnPyl
	 akq30QdRHCDSrsdSGJscKHjmDc5woT+cQqpN72PW4c1A2WlbCpxXWWHs9jV9A6lRBz
	 mDJAao8+MXPqQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 07:44:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130039

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-text-editor_50.1.bb =3D> gnome-text-editor_51.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-text-editor/{gnome-text-editor_50.=
1.bb =3D> gnome-text-editor_51.0.bb} (83%)

diff --git a/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor=
_50.1.bb b/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_5=
1.0.bb
similarity index 83%
rename from meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_=
50.1.bb
rename to meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_51=
.0.bb
index bd988f23fd..b0aafa9bd6 100644
--- a/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_50.1.b=
b
+++ b/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_51.0.b=
b
@@ -18,7 +18,7 @@ inherit gnomebase gtk-icon-cache itstool gnome-help mim=
e-xdg features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "opengl"
=20
-SRC_URI[archive.sha256sum] =3D "f68036b09d378faa883bfe936e479c6ff37027c2=
ffed101daf912df70c51d0e6"
+SRC_URI[archive.sha256sum] =3D "2b76e6da1506346c54b36ba1a3aeedcd28f4cb7d=
6a8793d217f209456c92dd4c"
=20
 FILES:${PN} +=3D " \
     ${datadir}/metainfo \
--=20
2.55.0


