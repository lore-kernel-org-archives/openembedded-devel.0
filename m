Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F521D73092
	for <webhook@archiver.kernel.org>; Sat,  4 Apr 2026 14:57:38 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18194.1775314652648529365
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2026 07:57:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=V1X+lDDx;
 spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout10.t-online.de (Postfix) with SMTP id 6FE2637C7A
	for <openembedded-devel@lists.openembedded.org>; Sat,  4 Apr 2026 16:57:30 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.174.190]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1w92RD-0InvMn0; Sat, 4 Apr 2026 16:57:27 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] libavif: use system libxml2 for building apps
Date: Sat,  4 Apr 2026 16:57:09 +0200
Message-ID: <20260404145709.174492-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1775314647-C77FD829-164C669B/0/0 CLEAN NORMAL
X-TOI-MSGID: 9890189d-3b90-4926-b6d7-53d0e4ec419f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1775314650; i=f_l_k@t-online.de;
	bh=arqLqGs1iFywgz9n7/fyNrQYETKkDussyXiomlJyHFo=;
	h=From:To:Subject:Date;
	b=V1X+lDDxoTJ/6Yci1uL4fg+RfFnk0z0m4rf8i+yl+17RdO5yuG6sgUH+TkHdlUP78
	 lcXsiyxokND3ymZWLcrv/U43YOZ9TtlhndoR8mLGicccVADa/8VOjhBHpcYwOvfWtt
	 suig7tPpGX16xoWc8OmE7GCMJKc1pPMu+3oz899KGnoGQR85swPO266jwvfQ13cSda
	 3D1W3Tt7lQqXHzNxdFr+uPIQYdEMfg6nnKTcODxx6R1KcRpcsogUkHqY726r9i3CJc
	 1PpSqBc7mvzzdsS7/uWzrhVQ8IwGo7ohnu6qNw7lxj0qYEQHVyzhOIvRDDXZNH2Mwb
	 NxI0eUm2c3o3A==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2026 14:57:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125998

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-multimedia/recipes-multimedia/libavif/libavif_1.4.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/libavif/libavif_1.4.1.bb =
b/meta-multimedia/recipes-multimedia/libavif/libavif_1.4.1.bb
index a6e90335f8..77b81fffbf 100644
--- a/meta-multimedia/recipes-multimedia/libavif/libavif_1.4.1.bb
+++ b/meta-multimedia/recipes-multimedia/libavif/libavif_1.4.1.bb
@@ -24,7 +24,7 @@ EXTRA_OECMAKE +=3D " \
 "
=20
 PACKAGECONFIG ?=3D "dav1d gdk-pixbuf"
-PACKAGECONFIG[apps] =3D "-DAVIF_BUILD_APPS=3DON,-DAVIF_BUILD_APPS=3DOFF =
-DAVIF_LIBXML2=3DOFF,zlib libjpeg-turbo libpng libwebp libxml2"
+PACKAGECONFIG[apps] =3D "-DAVIF_BUILD_APPS=3DON -DAVIF_LIBXML2=3DSYSTEM,=
-DAVIF_BUILD_APPS=3DOFF -DAVIF_LIBXML2=3DOFF,zlib libjpeg-turbo libpng li=
bwebp libxml2"
 PACKAGECONFIG[gdk-pixbuf] =3D "-DAVIF_BUILD_GDK_PIXBUF=3DON,-DAVIF_BUILD=
_GDK_PIXBUF=3DOFF,gdk-pixbuf"
 PACKAGECONFIG[aom] =3D "-DAVIF_CODEC_AOM=3DSYSTEM,-DAVIF_CODEC_AOM=3DOFF=
,aom"
 PACKAGECONFIG[dav1d] =3D "-DAVIF_CODEC_DAV1D=3DSYSTEM,-DAVIF_CODEC_DAV1D=
=3DOFF,dav1d"
--=20
2.53.0


