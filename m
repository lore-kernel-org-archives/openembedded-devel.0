Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63F59E88D8B
	for <webhook@archiver.kernel.org>; Sat,  4 Apr 2026 11:43:57 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15217.1775303032460811042
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2026 04:43:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=qbDURJmn;
 spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout11.t-online.de (Postfix) with SMTP id AF6A41C508
	for <openembedded-devel@lists.openembedded.org>; Sat,  4 Apr 2026 13:43:49 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.174.190]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1w8zPn-3VhVcP0; Sat, 4 Apr 2026 13:43:47 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 1/2] libavif: add gdk-pixbuf support for av1 image format
Date: Sat,  4 Apr 2026 13:43:38 +0200
Message-ID: <20260404114339.51364-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1775303027-DDFF8826-48E493B8/0/0 CLEAN NORMAL
X-TOI-MSGID: d3f19dbc-d636-496b-8f01-2fc9823f486b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1775303029; i=f_l_k@t-online.de;
	bh=doGET/jDwR+qQpb6s7mrj8UWY2lBv+bAXAoRwur7tnE=;
	h=From:To:Subject:Date;
	b=qbDURJmnwsmvqCgG/jvOu4GBzjTe5WF6aKwYR9LSS0fZ2Qjv6BM3wFtzHE9ABD/fU
	 5JSwfXADk59cBeNj5Eqzm1NyXqv2S0k5FZXoXQsmhcxfFj4g9OPbE5MOTPdR6mhTXg
	 WMqlANN+lqTD9DRIWEwb2j3CwJd2t21qcH4mnJROyBAj29RwYnrFae40lYG9PGsvu7
	 Jlt70BFb7feXJNl/Ns0bYTwGUV39yi8/SIJn6cJj9U1xWrW+gGthRobB25rQzl0NJe
	 P3MFDC+V4v8cHbuZ8gX020WKZx9NpN9zmxW/jeB1gwlk6Nq/u0cm/sHJSE+KouSBng
	 MOBIjEdy59wcA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2026 11:43:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125995

This commit adds a PACKAGECONFIG to build the av1 gdk-pixbuf-loader/thumb=
nailer
and enables it by default.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-multimedia/recipes-multimedia/libavif/libavif_1.4.1.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/libavif/libavif_1.4.1.bb =
b/meta-multimedia/recipes-multimedia/libavif/libavif_1.4.1.bb
index 553b620e08..5c12e4dc85 100644
--- a/meta-multimedia/recipes-multimedia/libavif/libavif_1.4.1.bb
+++ b/meta-multimedia/recipes-multimedia/libavif/libavif_1.4.1.bb
@@ -17,11 +17,13 @@ EXTRA_OECMAKE +=3D " \
     -DAVIF_BUILD_MAN_PAGES=3DOFF \
     -DAVIF_CODEC_RAV1E=3DOFF \
     -DAVIF_LIBXML2=3DOFF \
-    -DAVIF_BUILD_GDK_PIXBUF=3DOFF \
     -DAVIF_LIBYUV=3DOFF \
 "
=20
-PACKAGECONFIG ?=3D "dav1d"
+PACKAGECONFIG ?=3D "dav1d gdk-pixbuf"
+PACKAGECONFIG[gdk-pixbuf] =3D "-DAVIF_BUILD_GDK_PIXBUF=3DON,-DAVIF_BUILD=
_GDK_PIXBUF=3DOFF,gdk-pixbuf"
 PACKAGECONFIG[aom] =3D "-DAVIF_CODEC_AOM=3DSYSTEM,-DAVIF_CODEC_AOM=3DOFF=
,aom"
 PACKAGECONFIG[dav1d] =3D "-DAVIF_CODEC_DAV1D=3DSYSTEM,-DAVIF_CODEC_DAV1D=
=3DOFF,dav1d"
 PACKAGECONFIG[svt] =3D "-DAVIF_CODEC_SVT=3DSYSTEM,-DAVIF_CODEC_SVT=3DOFF=
,svt-av1"
+
+FILES:${PN} +=3D "${libdir}/gdk-pixbuf-2.0 ${datadir}"
--=20
2.53.0


