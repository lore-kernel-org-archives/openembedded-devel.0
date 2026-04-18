Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8EA4F99C86
	for <webhook@archiver.kernel.org>; Sat, 18 Apr 2026 14:35:47 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.67970.1776522944006754434
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Apr 2026 07:35:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=PLVNBLzz;
 spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout05.t-online.de (Postfix) with SMTP id 10451C6D
	for <openembedded-devel@lists.openembedded.org>; Sat, 18 Apr 2026 16:35:42 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.175.141]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wE6ll-0Toyqx0; Sat, 18 Apr 2026 16:35:37 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 3/3] libdvdread: use https for fetching code
Date: Sat, 18 Apr 2026 16:35:31 +0200
Message-ID: <20260418143531.2034507-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260418143531.2034507-1-f_l_k@t-online.de>
References: <20260418143531.2034507-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1776522937-07FFD407-4559A7F8/0/0 CLEAN NORMAL
X-TOI-MSGID: a442c1f8-9534-4b7a-b54a-5a64557c8526
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1776522942; i=f_l_k@t-online.de;
	bh=jP+Dkm0tjctLlXNcswC9c+apZ4Q/1igx+7h0/pY1hRs=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=PLVNBLzzAhUAkZW8+Qwije8ZiLxCwV8Ql3r3LP0bujpZDV1tIUUKRWue80w/dmlyg
	 SRR++lczJiX5WkPlmFcrvmRFmZXCCelowrnXMMXMX4eWU73Ncrs1BToTfdvHV4zw/5
	 pQast6H+C3HYv/EDR+GjlKm4Dqn1sX9lr4y/a0EoiVhEsTF9irp7zu5sVIGZorx4HP
	 3QuQUs16Wkh1Qzn4xVncM9mNCoZamelANye+k/T7MOhJOtMM1yuLZG56PUzhKlN7SN
	 8MivOWsBSpC5BQU43UhtZMbhm7+SGnrZ8C4f9q6jcLTakxaQYlqR7zFcxpFLFEaksV
	 vhYKzNl+wy2JQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Apr 2026 14:35:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126458

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-multimedia/libdvdread/libdvdread_6.1.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/libdvdread/libdvdread_6.1.3.bb b/=
meta-oe/recipes-multimedia/libdvdread/libdvdread_6.1.3.bb
index 9090cabb12..463e9a3dd7 100644
--- a/meta-oe/recipes-multimedia/libdvdread/libdvdread_6.1.3.bb
+++ b/meta-oe/recipes-multimedia/libdvdread/libdvdread_6.1.3.bb
@@ -3,7 +3,7 @@ SECTION =3D "libs/multimedia"
 LICENSE =3D "GPL-2.0-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D64e753fa7d1ca31632bc383da3b57=
c27"
=20
-SRC_URI =3D "http://download.videolan.org/pub/videolan/libdvdread/${PV}/=
libdvdread-${PV}.tar.bz2"
+SRC_URI =3D "https://download.videolan.org/pub/videolan/libdvdread/${PV}=
/libdvdread-${PV}.tar.bz2"
 SRC_URI[sha256sum] =3D "ce35454997a208cbe50e91232f0e73fb1ac3471965813a13=
b8730a8f18a15369"
=20
 inherit autotools lib_package binconfig pkgconfig
--=20
2.53.0


