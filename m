Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E54FCD342F
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 12:17:15 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37670.1777983428394808387
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 May 2026 05:17:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=WPnInD4J;
 spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout04.t-online.de (Postfix) with SMTP id 3849FE6D
	for <openembedded-devel@lists.openembedded.org>; Tue,  5 May 2026 14:17:06 +0200 (CEST)
Received: from fedora.fritz.box ([79.219.234.37]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wKEi0-3vH3cR0; Tue, 5 May 2026 14:17:04 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 3/3] libavif: add PACKAGECONFIG for rav1e codec
Date: Tue,  5 May 2026 14:16:55 +0200
Message-ID: <20260505121655.131622-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260505121655.131622-1-f_l_k@t-online.de>
References: <20260505121655.131622-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1777983424-2AFFA855-C6FB3134/0/0 CLEAN NORMAL
X-TOI-MSGID: 78b64dcb-a5a2-43e8-a9a0-6d4830a5928a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1777983426; i=f_l_k@t-online.de;
	bh=rLPDy7TxneDbAiVcH3nZc0qG1i6F3ZEBCNeIMsaxjSc=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=WPnInD4JilysYUN+Ui2J34l2N6qbIVdtYKr0zkMZ7HQGNHjYIOkxpWrZDoDWa/vjs
	 jlWwYHO+wDhbAlIGRPLFgZV1WBirWGVd01zXwSS1A8POyJDPBswkvad3CEa3v83EcV
	 arn9V2uf9aCTre2rrHz17FAjWuo9KexBwpgrpWZ8ZKIZl5xqhHbXHfURxm9MVQMal1
	 4Qz5E95RDRwGkpnsmzW/ka7j7hypMK5CsBG+rH+ImNCeuYRxL6o0VSDIpsfOAZn9Cb
	 8UUjN0I+oHCNcxlfYzepmlqbDAeF2F1CcAoMcH3fxi6Wl9u6hA5KR0ZZd4Qft7MESw
	 1hk4GxKv/A5AA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 May 2026 12:17:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126785

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-multimedia/recipes-multimedia/libavif/libavif_1.4.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/libavif/libavif_1.4.1.bb =
b/meta-multimedia/recipes-multimedia/libavif/libavif_1.4.1.bb
index 77b81fffbf..0fc0b0dfc8 100644
--- a/meta-multimedia/recipes-multimedia/libavif/libavif_1.4.1.bb
+++ b/meta-multimedia/recipes-multimedia/libavif/libavif_1.4.1.bb
@@ -19,7 +19,6 @@ inherit cmake pkgconfig
=20
 EXTRA_OECMAKE +=3D " \
     -DAVIF_BUILD_MAN_PAGES=3DOFF \
-    -DAVIF_CODEC_RAV1E=3DOFF \
     -DAVIF_LIBYUV=3DLOCAL \
 "
=20
@@ -28,6 +27,7 @@ PACKAGECONFIG[apps] =3D "-DAVIF_BUILD_APPS=3DON -DAVIF_=
LIBXML2=3DSYSTEM,-DAVIF_BUILD_A
 PACKAGECONFIG[gdk-pixbuf] =3D "-DAVIF_BUILD_GDK_PIXBUF=3DON,-DAVIF_BUILD=
_GDK_PIXBUF=3DOFF,gdk-pixbuf"
 PACKAGECONFIG[aom] =3D "-DAVIF_CODEC_AOM=3DSYSTEM,-DAVIF_CODEC_AOM=3DOFF=
,aom"
 PACKAGECONFIG[dav1d] =3D "-DAVIF_CODEC_DAV1D=3DSYSTEM,-DAVIF_CODEC_DAV1D=
=3DOFF,dav1d"
+PACKAGECONFIG[rav1e] =3D "-DAVIF_CODEC_RAV1E=3DSYSTEM,-DAVIF_CODEC_RAV1E=
=3DOFF,librav1e"
 PACKAGECONFIG[svt] =3D "-DAVIF_CODEC_SVT=3DSYSTEM,-DAVIF_CODEC_SVT=3DOFF=
,svt-av1"
=20
 FILES:${PN} +=3D "${libdir}/gdk-pixbuf-2.0 ${datadir}"
--=20
2.54.0


