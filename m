Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B34DCD5BB1
	for <webhook@archiver.kernel.org>; Sun, 24 May 2026 12:57:29 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7604.1779627442468037522
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 May 2026 05:57:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=gpAy5M25;
 spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd95.aul.t-online.de (fwd95.aul.t-online.de [10.223.144.121])
	by mailout06.t-online.de (Postfix) with SMTP id 94EC370D
	for <openembedded-devel@lists.openembedded.org>; Sun, 24 May 2026 14:57:19 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.161.166]) by fwd95.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wR8ON-0Whidv0; Sun, 24 May 2026 14:57:19 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 3/3] mpv: add PACKAGECONFIG for mpris
Date: Sun, 24 May 2026 14:57:09 +0200
Message-ID: <20260524125709.9164-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260524125709.9164-1-f_l_k@t-online.de>
References: <20260524125709.9164-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1779627439-E7FFCF97-071A400D/0/0 CLEAN NORMAL
X-TOI-MSGID: 61e9f0e0-97e9-43d4-a973-52a19e7caf9d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1779627439; i=f_l_k@t-online.de;
	bh=UbjlyovTdvAFiN8ZXDPT8+aOfB9oVP1rCCKS9xxIjsc=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=gpAy5M25fTLQxBIR/MmltrOIZy9W4vtw8Y8uCdxrhCUw4GZO5WTVmZd3RB4Y27Wqi
	 8HtaWgqakavlKDN/6bKEcHi6rk02q8jNOYE6PQDx7+YDd1z6M4xzstR2J8KggXIYjd
	 aOz1Gwgeipy7+1pKkid0cHVuWC+ZagjmGPxtOQ/UAR11+SJFMJbeMsOKxM2Cd3XhN7
	 egrYMjE0RzvIvGB8txuZhxXRYYM1234y8FKL89bqQKZ5Yz/+XNIUqjA4awpQtFViCu
	 SIq/2JObXIJme523Xr7VCo/kF/EZ4n+UgyNGZFx9H+Bz5SR5XK3jeNdlp/XOsvON7O
	 eJEnkQDaPSZjw==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 24 May 2026 12:57:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127187

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-multimedia/mplayer/mpv_0.41.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.41.0.bb b/meta-oe/r=
ecipes-multimedia/mplayer/mpv_0.41.0.bb
index ccb66adb7a..02dbe64968 100644
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.41.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.41.0.bb
@@ -51,6 +51,7 @@ PACKAGECONFIG[libarchive] =3D "-Dlibarchive=3Denabled,-=
Dlibarchive=3Ddisabled,libarchi
 PACKAGECONFIG[lcms2] =3D "-Dlcms2=3Denabled,-Dlcms2=3Ddisabled,lcms"
 PACKAGECONFIG[libmpv] =3D "-Dlibmpv=3Dtrue,-Dlibmpv=3Dfalse"
 PACKAGECONFIG[jack] =3D "-Djack=3Denabled,-Djack=3Ddisabled,jack"
+PACKAGECONFIG[mpris] =3D ",,,playerctl mpv-mpris"
 PACKAGECONFIG[pipewire] =3D "-Dpipewire=3Denabled,-Dpipewire=3Ddisabled,=
pipewire"
 PACKAGECONFIG[pulseaudio] =3D "-Dpulse=3Denabled,-Dpulse=3Ddisabled,puls=
eaudio"
 PACKAGECONFIG[vaapi] =3D "-Dvaapi=3Denabled,-Dvaapi=3Ddisabled,libva"
--=20
2.54.0


