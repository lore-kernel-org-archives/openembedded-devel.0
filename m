Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1B3DC88E7F
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 07:44:28 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18106.1789458264369269709
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2026 00:44:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=C7ixcvvF;
 spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout10.t-online.de (Postfix) with SMTP id 4F11137E21
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 09:44:20 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.162.202]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x6Npr-00ds600; Tue, 15 Sep 2026 09:44:11 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 21/31] gvfs: upgrade 1.60.2 -> 1.62.0
Date: Tue, 15 Sep 2026 09:43:37 +0200
Message-ID: <20260915074347.6003-21-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915074347.6003-1-f_l_k@t-online.de>
References: <20260915074347.6003-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789458251-11FF09B9-F801081D/0/0 CLEAN NORMAL
X-TOI-MSGID: 0996f1aa-2791-4c9f-ac43-8ad241baa7d2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789458260; i=f_l_k@t-online.de;
	bh=Urn7Usxd2lFQuayEzO5HFIcRgRtVP0F92VZjzRCMXFI=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=C7ixcvvFTsDRAq3dL/qPhoLq48wH7xtk7Zp8OYGG3uDggxHZ2zIa//LwYWJFXRo3u
	 tWa9QRxWyt3xo5tJ464k8d33OkcxzUGEUwrrF4HR9wRBc1aup2XakZC65Ar5le8Bf1
	 Fl9lFBsoKz8gMaWXeG3cGEUTuwerWJfQDtbMy41XsW+uZpFPaVKJIkMLXdOo3/aPd8
	 D1sHOhOtlHqXlV2yyYKf16lc0n1KYtgk01gcsN9/Ito3SI65yGyToUN3JCt90H/V4q
	 r0l4ML7s7JDUwRBDpdp3heUUS6x2P6bM6Yo/LnwJ4k8ln6QTSQvkGydfh4eRJrwHng
	 YbnOokOEBxlww==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 07:44:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130044

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/gvfs/{gvfs_1.60.2.bb =3D> gvfs_1.62.0.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.60.2.bb =3D> gvfs_1.62.0.bb=
} (97%)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.60.2.bb b/meta-gnome/re=
cipes-gnome/gvfs/gvfs_1.62.0.bb
similarity index 97%
rename from meta-gnome/recipes-gnome/gvfs/gvfs_1.60.2.bb
rename to meta-gnome/recipes-gnome/gvfs/gvfs_1.62.0.bb
index bdcc331712..441c575524 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.60.2.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.62.0.bb
@@ -18,7 +18,7 @@ DEPENDS +=3D "\
 RDEPENDS:${PN} +=3D "gsettings-desktop-schemas"
=20
 SRC_URI =3D "https://download.gnome.org/sources/${BPN}/${@gnome_verdir("=
${PV}")}/${BPN}-${PV}.tar.xz;name=3Darchive"
-SRC_URI[archive.sha256sum] =3D "a8d7744615a488a559302fe0cc8f418d5b44aba3=
c2ba2163e5a9e6f607c1be9a"
+SRC_URI[archive.sha256sum] =3D "dd8e6c255fd3bed5eeb190b59027c88b38e63c1b=
e0932ddce9cfeb48f3c43d0f"
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
--=20
2.55.0


