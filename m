Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B0B2C7EE25
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 04:37:00 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.13644.1684211818639103253
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 May 2023 21:36:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout09.t-online.de (Postfix) with SMTP id 280035773D
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 May 2023 06:36:56 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([79.219.228.204]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pymPK-33a7Xz0; Tue, 16 May 2023 06:35:30 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH 7/7] paprefs: set REQUIRED_DISTRO_FEATURES to x11
Date: Tue, 16 May 2023 06:34:58 +0200
Message-Id: <20230516043458.6180-7-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230516043458.6180-1-f_l_k@t-online.de>
References: <20230516043458.6180-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1684211731-59FF057F-7154F3C5/0/0 CLEAN NORMAL
X-TOI-MSGID: f6694614-6995-4ed8-93b2-861ec6e7e1a0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 May 2023 04:37:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102615

paprefs includes gdkx.h

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-multimedia/pulseaudio/paprefs_1.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/pulseaudio/paprefs_1.2.bb b/meta-=
oe/recipes-multimedia/pulseaudio/paprefs_1.2.bb
index 6d0cf7ed7f..371c190dca 100644
--- a/meta-oe/recipes-multimedia/pulseaudio/paprefs_1.2.bb
+++ b/meta-oe/recipes-multimedia/pulseaudio/paprefs_1.2.bb
@@ -7,7 +7,7 @@ DEPENDS =3D "pulseaudio gtkmm3 gtk+3 libsigc++-3 glibmm"
=20
 inherit meson pkgconfig features_check
=20
-ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
+REQUIRED_DISTRO_FEATURES =3D "x11"
=20
 SRC_URI =3D "http://freedesktop.org/software/pulseaudio/paprefs/${BP}.ta=
r.xz"
=20
--=20
2.34.1


