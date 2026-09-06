Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F1E6C79F99
	for <webhook@archiver.kernel.org>; Sun,  6 Sep 2026 09:37:31 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11203.1788687443929206098
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Sep 2026 02:37:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=Nfxaob+U;
 spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd94.aul.t-online.de (fwd94.aul.t-online.de [10.223.144.120])
	by mailout05.t-online.de (Postfix) with SMTP id 74D1859E
	for <openembedded-devel@lists.openembedded.org>; Sun,  6 Sep 2026 11:37:21 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.35.20]) by fwd94.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x39JO-22AhJj0; Sun, 6 Sep 2026 11:37:18 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 04/15] gnome-font-viewer: upgrade 49.0 -> 50.0
Date: Sun,  6 Sep 2026 11:37:02 +0200
Message-ID: <20260906093713.797648-4-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260906093713.797648-1-f_l_k@t-online.de>
References: <20260906093713.797648-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1788687438-E4FF6956-165E64E8/0/0 CLEAN NORMAL
X-TOI-MSGID: ffc42770-8c30-4c46-ac86-4b78f737b60b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1788687441; i=f_l_k@t-online.de;
	bh=vYHuSr+uY5mgK2yCQ0aX1SBM19Fdge847uhrF3Medzg=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Nfxaob+UTXwvIbH7L4SHZ8+FWvJq8zoTz/is4SQiGm2EOom/UFchgDR07a24cMBfh
	 jvVyvHisPC+Drs4xQ1xVFpjBK4eAMA5eHB2i374wNF1TTI9GWZwR6tfNaNbY+3CmLk
	 0OaddxqzD5a9j6DxwHoD+k0YuXiWkBe6lpKBmvmHFssvwk2jvjS0mADBoyF6pHPrgH
	 0GXjTP49wwkxclr8IKK31radSPW4T40ppN8G09OcakFolnLWA3gFo9ivVXffsUL8cB
	 7SNUeRM0ZMQESuXUVHgo703e3RQOS61BeJfHmZ0TgZIupOgA2pyBkjopXaJFDEarQJ
	 b77ylKV7s759Q==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Sep 2026 09:37:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129786

Build tested on corei7-64.

AI-Generated: Uses Claude Code (Claude Fable 5.1)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-font-viewer_49.0.bb =3D> gnome-font-viewer_50.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-font-viewer/{gnome-font-viewer_49.=
0.bb =3D> gnome-font-viewer_50.0.bb} (81%)

diff --git a/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer=
_49.0.bb b/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_5=
0.0.bb
similarity index 81%
rename from meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_=
49.0.bb
rename to meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_50=
.0.bb
index b8e5f1d01b..3f0b318b11 100644
--- a/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_49.0.b=
b
+++ b/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_50.0.b=
b
@@ -15,7 +15,7 @@ inherit gnomebase gtk-icon-cache gettext features_check=
 mime-xdg
=20
 REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
=20
-SRC_URI[archive.sha256sum] =3D "7c018925c285771b55d7d1a6f15711c0c193d745=
0ed9871e20d44f2548562404"
+SRC_URI[archive.sha256sum] =3D "9564b088c5b150c54e2a3a7bc7014deec6ee5512=
61e98488f891b1f1b8dc6b80"
=20
 FILES:${PN} +=3D " \
     ${datadir}/dbus-1 \
--=20
2.55.0


