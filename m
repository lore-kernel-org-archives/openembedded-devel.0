Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21F43C88E77
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 10:21:40 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19785.1789467696428941292
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2026 03:21:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=ruFwdFSp;
 spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout03.t-online.de (Postfix) with SMTP id B9138E158
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 12:21:32 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.162.202]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x6QI7-35axkZ0; Tue, 15 Sep 2026 12:21:31 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [RFC][meta-gnome][PATCH 4/5] gnome-control-center: upgrade 50.4 -> 51.0
Date: Tue, 15 Sep 2026 12:21:22 +0200
Message-ID: <20260915102123.5530-4-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915102123.5530-1-f_l_k@t-online.de>
References: <20260915102123.5530-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789467691-997F99C6-31436A54/0/0 CLEAN NORMAL
X-TOI-MSGID: a3350b08-f057-4384-a893-774dcbc85218
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789467692; i=f_l_k@t-online.de;
	bh=78HWhkItYCfg+eSMQFEaxfQrO8PSJVPRenovVwp19Pk=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=ruFwdFSp7r6FJEiyO+YshV/lx3hBs4z8wwKhFNRzdAi2r3rit9JCfOp2cBuucNIlo
	 +lcjdgFLbb0yfCbm7CiFSMC7mClONDqDN8loNfNX2aKCeF+AfNbrX5ddBiY/VBSdf6
	 vxfYmbqjoiwREidpxVr03sJ0Rpn0xB5rYwiB9qJN7ajh3JUpj+F8+bVNKgkg3LDltd
	 dCjlDpSpuM34mVcXNsu5P3QvPha5cDOiHBaSY2BpfBunJmN+xyHaMLc6ywGewfy1dY
	 mT4XQWAU+bP38kTGODhxydamuVzSCCBJD7QsaqW/3EwR4AJA5RVbgQgmh3btWGNiYE
	 eD4gtjARVrarA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 10:21:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130074

Depends on the gtk4 4.24.0 upgrade in oe-core; 51.0 requires gtk4
>=3D 4.23.0. It also needs accountsservice >=3D 26.27.3, upgraded earlier
in this series.

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...nome-control-center_50.4.bb =3D> gnome-control-center_51.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-control-center/{gnome-control-cent=
er_50.4.bb =3D> gnome-control-center_51.0.bb} (96%)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-=
center_50.4.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-cont=
rol-center_51.0.bb
similarity index 96%
rename from meta-gnome/recipes-gnome/gnome-control-center/gnome-control-c=
enter_50.4.bb
rename to meta-gnome/recipes-gnome/gnome-control-center/gnome-control-cen=
ter_51.0.bb
index ea45485b69..9323572d4b 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
50.4.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
51.0.bb
@@ -40,7 +40,7 @@ inherit gtk-icon-cache pkgconfig gnomebase gsettings ge=
ttext gi-docgen upstream-
 REQUIRED_DISTRO_FEATURES +=3D "opengl polkit pulseaudio systemd"
=20
 SRC_URI =3D "https://download.gnome.org/sources/gnome-control-center/${@=
oe.utils.trim_version('${PV}', 1)}/gnome-control-center-${PV}.tar.xz"
-SRC_URI[sha256sum] =3D "5856c73999bedf45e74f73bac3d61e2b5ec1689f8bcf1943=
737baeee8204fb11"
+SRC_URI[sha256sum] =3D "c8ca5b6a0ae44fd0d64aac5aa3b79a83c2445095b159a9d1=
3d1c9cc172ac4fb9"
=20
 SRC_URI +=3D "file://0001-Add-meson-option-to-pass-sysroot.patch"
=20
--=20
2.55.0


