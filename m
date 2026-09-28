Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9B51C9830E
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 00:40:57 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47270.1790556055049239052
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 17:40:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=TEUU252E;
 spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd95.aul.t-online.de (fwd95.aul.t-online.de [10.223.144.121])
	by mailout12.t-online.de (Postfix) with SMTP id 3C9A3E355
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 02:40:52 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.166.136]) by fwd95.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xAzQJ-05nx1E0; Mon, 28 Sep 2026 02:40:52 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] sushi: add gstreamer1.0-plugins-base to RDEPENDS
Date: Mon, 28 Sep 2026 02:40:43 +0200
Message-ID: <20260928004043.31271-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1790556052-91FF8989-6C2DCF8F/0/0 CLEAN NORMAL
X-TOI-MSGID: daaf619f-6022-4240-b4a3-ff4fd10c1aea
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1790556052; i=f_l_k@t-online.de;
	bh=ulojdtREfrs76AT00ODuuJ+LDH+8VhZrk1RGAoRj+Mk=;
	h=From:To:Subject:Date;
	b=TEUU252EK9my57aW8cwIgyYAoP2EDzv2LnG8P27DHvyjqukRpbdxH01KSPCfDHtIv
	 Y48ukK8FYpzpJk23lWE2Q7+OjsTbh2HgVnpUVb2eKmVZju0KHr6DEYSq9Xd8a+IPzf
	 1aw/wOTcvQQK7Pc4C4GuD/kqwr8AJmhNsFwC83/fYpYtF3D1AAOM6Wjtc7fsGhByqG
	 rV+rFrv57wrqueq2HuBNMeBLGDZ8GbgwaN7rT2TBLSF9gSesJDSWf0VZrRbaiRXE1o
	 oVc/kZRqgMh6l85fJNISQMK3RHW42u9aCxcSxMEGsTRTQwSevmUwUwcTH3Lvver+2v
	 3kCEcGRKI+7ew==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 00:40:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130418

The previewer imports GstTag through GObject introspection. Its typelib i=
s
shipped in gstreamer1.0-plugins-base, and without that package
org.gnome.NautilusPreviewer exits at startup with "Typelib file for
namespace 'GstTag', version '1.0' not found".

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/sushi/sushi_51.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/sushi/sushi_51.1.bb b/meta-gnome/re=
cipes-gnome/sushi/sushi_51.1.bb
index c1584554b5..a6c93da10d 100644
--- a/meta-gnome/recipes-gnome/sushi/sushi_51.1.bb
+++ b/meta-gnome/recipes-gnome/sushi/sushi_51.1.bb
@@ -54,4 +54,4 @@ FILES:${PN} +=3D " \
     ${libdir}/sushi \
 "
=20
-RDEPENDS:${PN} +=3D "gjs glycin-gtk4 gtksourceview5 libadwaita webkitgtk=
"
+RDEPENDS:${PN} +=3D "gjs glycin-gtk4 gstreamer1.0-plugins-base gtksource=
view5 libadwaita webkitgtk"
--=20
2.55.0


