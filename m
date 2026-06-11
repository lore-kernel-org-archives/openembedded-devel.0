Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70E45CD98D2
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 08:57:01 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41076.1781168220045949587
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2026 01:57:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=Oa2pqExB;
 spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout04.t-online.de (Postfix) with SMTP id 28822608
	for <openembedded-devel@lists.openembedded.org>; Thu, 11 Jun 2026 10:56:58 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.168.237]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wXbDZ-3J4dNb0; Thu, 11 Jun 2026 10:56:53 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 3/3] libdvdread: switch to meson buildsystem
Date: Thu, 11 Jun 2026 10:56:47 +0200
Message-ID: <20260611085647.233427-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260611085647.233427-1-f_l_k@t-online.de>
References: <20260611085647.233427-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1781168213-797F9B6E-DC94B7F4/0/0 CLEAN NORMAL
X-TOI-MSGID: 1be6b7c6-6434-48fa-b5f4-4cbd9c1b0c50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1781168218; i=f_l_k@t-online.de;
	bh=XuFvXsWir8noQvXTNhUM5diBeazrfZxhhohNIenynLE=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Oa2pqExBcAECR90hBI6x+ICluhgoy7cOSiDIgGMMJV+RPTK78om3rkh6Nor1bTVBc
	 zikuYqYuE90p2eMyV6H7YK3SaYe3JL0UgBsMi1hJnZB61lVuUimArxr1a+GN/f4q1h
	 WFxnwQvHtccwUCQX3pguYt5bDMsFyQ9R7Jf69YhkJDJx1RNHg1D2yRGVpASa/fvOS/
	 RKfvLePFxuoDFWTJ/Pm+fjw0vzX98puKQqzzkxgCA23VsnI2TGX9quRjqxX1pGErgc
	 kGlGi6aTv4FyreFWtC9KzgxZlDq9ZrHWUbjYZEJp1tKQ2s7LIe4zBbMwT3vJL6+SVh
	 UsWGxdbjrwlrA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Jun 2026 08:57:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127520

autotools buildsystem has been removed:
do_configure: no configure script found

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-multimedia/libdvdread/libdvdread_7.0.1.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-multimedia/libdvdread/libdvdread_7.0.1.bb b/=
meta-oe/recipes-multimedia/libdvdread/libdvdread_7.0.1.bb
index 0e56f0bd3c..0be61c2174 100644
--- a/meta-oe/recipes-multimedia/libdvdread/libdvdread_7.0.1.bb
+++ b/meta-oe/recipes-multimedia/libdvdread/libdvdread_7.0.1.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D64e753fa7d1ca3=
1632bc383da3b57c27"
 SRC_URI =3D "https://download.videolan.org/pub/videolan/libdvdread/${PV}=
/libdvdread-${PV}.tar.xz"
 SRC_URI[sha256sum] =3D "2e3e04a305c15c3963aa03ae1b9a83c1d239880003fcf3dd=
e986d3943355d407"
=20
-inherit autotools lib_package binconfig pkgconfig
+inherit meson lib_package binconfig pkgconfig manpages
=20
-CONFIGUREOPTS:remove =3D "--disable-silent-rules"
+PACKAGECONFIG ?=3D "libdvdcss"
+PACKAGECONFIG[libdvdcss] =3D "-Dlibdvdcss=3Denabled,-Dlibdvdcss=3Ddisabl=
ed,libdvdcss"
+PACKAGECONFIG[manpages] =3D "-Denable_docs=3Dtrue,-Denable_docs=3Dfalse,=
doxygen-native"
--=20
2.54.0


