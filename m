Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 934D3CD98D4
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 08:57:01 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41085.1781168220037058846
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2026 01:57:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=qXSkh8nE;
 spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout04.t-online.de (Postfix) with SMTP id 1AD5F5FF
	for <openembedded-devel@lists.openembedded.org>; Thu, 11 Jun 2026 10:56:58 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.168.237]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wXbDZ-3J4dNa0; Thu, 11 Jun 2026 10:56:53 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 2/3] libdvdcss: switch to meson buildsystem
Date: Thu, 11 Jun 2026 10:56:46 +0200
Message-ID: <20260611085647.233427-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260611085647.233427-1-f_l_k@t-online.de>
References: <20260611085647.233427-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1781168213-9A7FBB6E-439EB682/0/0 CLEAN NORMAL
X-TOI-MSGID: 9ac4f805-7c7a-4493-a76a-2035db3898f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1781168218; i=f_l_k@t-online.de;
	bh=sUYDYLyftbFvM+v1KYHoOd15ZkmZxaeg4pTAKd018IA=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=qXSkh8nEU00MbbDVyiD8VMEz2Ola+BgSO5b7nk7wrSo8mm0Uqp6vAHjRpKhJfgsbd
	 4GOe+/1oySPzf6X1nxJWJGOQojs3wwRct0R6Ub0Aw9JBn2//21v8DqrQrLtKEcjk4L
	 jY8Mvb4h97eBXA2y2+RtZeLB0drvhhVTxS/NZq8nAt4m4bE0LDx+cKSvEuN0RiWtjw
	 9ScNEt1KznsRaqqDk1KXfiTHWgTGKodZ5EfvqUQECZ3cC9Vj0yeA2ZNxxFH/eQFRAQ
	 R6R4nKzDqOpDMFt3A59TSJTWojt9WR8RCSf6GCQvAfO/GNweZ96wTDcYFxTMwChh+l
	 LCYnhxzCwh5lQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Jun 2026 08:57:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127522

autotools buildsystem has been removed:
do_configure: no configure script found

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.5.0.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.5.0.bb b/=
meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.5.0.bb
index a455d4869d..4ea679a208 100644
--- a/meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.5.0.bb
+++ b/meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.5.0.bb
@@ -4,9 +4,9 @@ LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
=20
 SRC_URI =3D "https://download.videolan.org/pub/libdvdcss/${PV}/libdvdcss=
-${PV}.tar.xz"
+SRC_URI[sha256sum] =3D "529463e4d1befef82e5c6e470db7661a2db0343e092a2fb0=
d6c037cab8a5c399"
=20
-inherit autotools
+inherit meson pkgconfig manpages
=20
-EXTRA_OECONF =3D " --disable-doc "
+PACKAGECONFIG[manpages] =3D "-Denable_docs=3Dtrue,-Denable_docs=3Dfalse,=
doxygen-native"
=20
-SRC_URI[sha256sum] =3D "529463e4d1befef82e5c6e470db7661a2db0343e092a2fb0=
d6c037cab8a5c399"
--=20
2.54.0


