Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CF1FCD98C5
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 14:44:05 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.131160.1781534642174499037
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jun 2026 07:44:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=a426YSlv;
 spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout02.t-online.de (Postfix) with SMTP id 27AB1E280
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jun 2026 16:44:00 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.161.136]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wZ8Xf-4etWgD0; Mon, 15 Jun 2026 16:43:59 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multrimedia][PATCHv2] libdvdread: switch to meson buildsystem
Date: Mon, 15 Jun 2026 16:43:48 +0200
Message-ID: <20260615144348.7946-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1781534639-9D7F99B2-B6A65EE5/0/0 CLEAN NORMAL
X-TOI-MSGID: b668b19e-e3fc-40eb-afc9-b5403dee6422
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1781534640; i=f_l_k@t-online.de;
	bh=Lm1VX77Xvqv0uQ6LnDvTl9XMisEo5AMEU3Yj0MfoEZc=;
	h=From:To:Subject:Date;
	b=a426YSlv8pu3RpsLM9lprE1FZXuwdGALqMclLRC6Sj4R/j7WUPHLpQyhf5Sk5X27B
	 jYtj2b+/Q/POWWgwbBJtnHnczofzHEPDBpklQMFD9VeywYDAQ0wX3GV9lLwaX2U82y
	 5BjhI5fFbFrjmNbdaN06jfH3dUu7kYRSW7UzyskfAi/kvBNHK7OR3fTAm9TT9Uculz
	 eMJHw4FfmOMFJWC+CMNH3UIu6hQ4j9X82TUwEQYWMyETqd8bURX0ZF537p0W+D88Uj
	 Mq+ma+LIlenVzr0vngpa6bK8OMyFwdM6RIfY0gUBkqQYHA0I2SAJhnPLIUXm9wKEaJ
	 pT7iap4JKJOcQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jun 2026 14:44:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127585

autotools buildsystem has been removed:
do_configure: no configure script found

move recipe to meta-multimedia

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-multimedia/libdvdread/libdvdread_7.0.1.bb       | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename {meta-oe =3D> meta-multimedia}/recipes-multimedia/libdvdread/libd=
vdread_7.0.1.bb (59%)

diff --git a/meta-oe/recipes-multimedia/libdvdread/libdvdread_7.0.1.bb b/=
meta-multimedia/recipes-multimedia/libdvdread/libdvdread_7.0.1.bb
similarity index 59%
rename from meta-oe/recipes-multimedia/libdvdread/libdvdread_7.0.1.bb
rename to meta-multimedia/recipes-multimedia/libdvdread/libdvdread_7.0.1.=
bb
index 0e56f0bd3c..0be61c2174 100644
--- a/meta-oe/recipes-multimedia/libdvdread/libdvdread_7.0.1.bb
+++ b/meta-multimedia/recipes-multimedia/libdvdread/libdvdread_7.0.1.bb
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


