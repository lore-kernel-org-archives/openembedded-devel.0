Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 339F4C982D2
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 07:44:41 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18079.1789458271648498507
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2026 00:44:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=azEoDYmm;
 spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout01.t-online.de (Postfix) with SMTP id D07951C3B8
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 09:44:19 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.162.202]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x6Npp-00ds5k0; Tue, 15 Sep 2026 09:44:09 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 05/31] gjs: upgrade 1.88.1 -> 1.90.0
Date: Tue, 15 Sep 2026 09:43:21 +0200
Message-ID: <20260915074347.6003-5-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915074347.6003-1-f_l_k@t-online.de>
References: <20260915074347.6003-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789458249-65FF89B9-69CE36FE/0/0 CLEAN NORMAL
X-TOI-MSGID: 9e09d33d-8b62-4a06-89ea-38c55bfd53b6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789458259; i=f_l_k@t-online.de;
	bh=2zwyadWxxPiJ/ONDUWnO/WH6zM0AiPvUTNXlsCsUh4s=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=azEoDYmmrGbbpHzu9MX74ABNMpCI2RHQacXVkz/re0wG7DrwB2xOg+dQOfgMzLm5E
	 rDidD7R1yMoc3ZkRqDIBtc/x2u/z/6WFpYbjVXerNFrLmFtzC/XLfUC9SAUkJ9vkzN
	 Lj1eI8nJLdcAUTg/WsrdhUGJFfZj5XKkGx1Co4DFSbnFCCpyUiA3NromO9uLuswbtT
	 SQ/0CKUl1FPqDLN8XpjTGrM4dulAUfmQJN1BmLIt946yXFA9AWXRmWPArxGduvTmhP
	 gRdOm6tUP4ZSn3I4rn0mxF3jevspjMTTKGDZauwoBndXmifm35AQA49uQBAJ42W58c
	 qiObnnJlSM9bA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 07:44:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130051

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/gjs/{gjs_1.88.1.bb =3D> gjs_1.90.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gjs/{gjs_1.88.1.bb =3D> gjs_1.90.0.bb} (=
95%)

diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.88.1.bb b/meta-gnome/reci=
pes-gnome/gjs/gjs_1.90.0.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/gjs/gjs_1.88.1.bb
rename to meta-gnome/recipes-gnome/gjs/gjs_1.90.0.bb
index 16c8636d84..50bbc20e71 100644
--- a/meta-gnome/recipes-gnome/gjs/gjs_1.88.1.bb
+++ b/meta-gnome/recipes-gnome/gjs/gjs_1.90.0.bb
@@ -10,7 +10,7 @@ inherit meson pkgconfig gettext gobject-introspection f=
eatures_check
 SRC_URI =3D "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}", 2)=
}/${BP}.tar.xz;name=3Darchive"
 SRC_URI +=3D "file://0001-Support-cross-builds-a-bit-better.patch"
 SRC_URI +=3D "file://0002-meson.build-Do-not-add-dir-installed-tests-whe=
n-inst.patch"
-SRC_URI[archive.sha256sum] =3D "767bab80e665d672cb00563c25f0b392a9ec8c29=
96ed1d4454c698b4c2f0a3d9"
+SRC_URI[archive.sha256sum] =3D "47e9f22b1d4aca841c6c492b449b6de32ff68097=
2183e26fe7b98a45c5c3fee1"
=20
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
--=20
2.55.0


