Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62B96E88D99
	for <webhook@archiver.kernel.org>; Sat,  4 Apr 2026 11:43:57 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14952.1775303032476690463
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2026 04:43:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=LOqv8X1+;
 spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout11.t-online.de (Postfix) with SMTP id BD0601C50A
	for <openembedded-devel@lists.openembedded.org>; Sat,  4 Apr 2026 13:43:49 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.174.190]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1w8zPn-3VhVcQ0; Sat, 4 Apr 2026 13:43:47 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 2/2] libavif: add PACKAGECONFIG for apps
Date: Sat,  4 Apr 2026 13:43:39 +0200
Message-ID: <20260404114339.51364-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260404114339.51364-1-f_l_k@t-online.de>
References: <20260404114339.51364-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1775303027-9D7F9826-7A8B3424/0/0 CLEAN NORMAL
X-TOI-MSGID: 3d54abea-02d9-46b8-bb46-ea3df92cb76b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1775303029; i=f_l_k@t-online.de;
	bh=YIiVMUxqCUaB9FtfHH93vUjBjeub32VpKqc3Q3E0Ox0=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=LOqv8X1+ozVXzPSGi5StjLxmBYgHWEQAI51UBcA5BePi4Hcb/K2ijpWzG6K4vA5iU
	 DVj+CnbeEThAADqFj2U/Xk4O+0jfX3RqtHVZgDdfKL+VUeTOi7jTUI0jPCF9R15pX1
	 JtseQU/xMr3zVF1xJ6XhscGzFypdCAHuw0GaXEkbPTaT9vqZyXX8mzhNr9uJrSVz7L
	 G/FcMR0dthH2bYxnRV4AQPie0v1vS/rvQuGVTzQtVomjvCR6URuYvM9lqU1vlIxWk1
	 PJzqO9PQNyVUyafqHpAnlobud1enH0grjEaOzJPPU9NxPIE25oG2WsluXTjLFLHsGX
	 dadkE7bO2hNxw==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2026 11:43:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125996

- This allows to build avifdec,avifenc and avifgainmaputil
---
 .../recipes-multimedia/libavif/libavif_1.4.1.bb        | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/libavif/libavif_1.4.1.bb =
b/meta-multimedia/recipes-multimedia/libavif/libavif_1.4.1.bb
index 5c12e4dc85..b8008b6980 100644
--- a/meta-multimedia/recipes-multimedia/libavif/libavif_1.4.1.bb
+++ b/meta-multimedia/recipes-multimedia/libavif/libavif_1.4.1.bb
@@ -5,22 +5,24 @@ SECTION =3D "libs"
 LICENSE =3D "BSD-2-Clause & BSD-3-Clause & IJG"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D51549db0941829faeedcc86efec2f=
4c0"
=20
-SRC_URI =3D "git://github.com/AOMediaCodec/libavif.git;protocol=3Dhttps;=
branch=3Dmain;tag=3Dv${PV}"
-SRCREV =3D "6543b22b5bc706c53f038a16fe515f921556d9b3"
+SRC_URI =3D "git://github.com/AOMediaCodec/libavif.git;protocol=3Dhttps;=
branch=3Dmain;tag=3Dv${PV};name=3Dlibavif"
+SRC_URI +=3D "git://github.com/kmurray/libargparse.git;protocol=3Dhttps;=
nobranch=3D1;name=3Dlibargparse;subdir=3D${S}/ext/libargparse"
+SRCREV_libavif =3D "6543b22b5bc706c53f038a16fe515f921556d9b3"
+SRCREV_libargparse =3D "ee74d1b53bd680748af14e737378de57e2a0a954"
+SRCREV_FORMAT =3D "libavif"
=20
 DEPENDS =3D "nasm-native"
=20
 inherit cmake pkgconfig
=20
 EXTRA_OECMAKE +=3D " \
-    -DAVIF_BUILD_APPS=3DOFF \
     -DAVIF_BUILD_MAN_PAGES=3DOFF \
     -DAVIF_CODEC_RAV1E=3DOFF \
-    -DAVIF_LIBXML2=3DOFF \
     -DAVIF_LIBYUV=3DOFF \
 "
=20
 PACKAGECONFIG ?=3D "dav1d gdk-pixbuf"
+PACKAGECONFIG[apps] =3D "-DAVIF_BUILD_APPS=3DON,-DAVIF_BUILD_APPS=3DOFF =
-DAVIF_LIBXML2=3DOFF,zlib libjpeg-turbo libpng libwebp libxml2"
 PACKAGECONFIG[gdk-pixbuf] =3D "-DAVIF_BUILD_GDK_PIXBUF=3DON,-DAVIF_BUILD=
_GDK_PIXBUF=3DOFF,gdk-pixbuf"
 PACKAGECONFIG[aom] =3D "-DAVIF_CODEC_AOM=3DSYSTEM,-DAVIF_CODEC_AOM=3DOFF=
,aom"
 PACKAGECONFIG[dav1d] =3D "-DAVIF_CODEC_DAV1D=3DSYSTEM,-DAVIF_CODEC_DAV1D=
=3DOFF,dav1d"
--=20
2.53.0


