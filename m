Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2FFBC4167B
	for <webhook@archiver.kernel.org>; Sat, 26 Nov 2022 23:04:38 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.81054.1669503871495015378
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Nov 2022 15:04:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout10.t-online.de (Postfix) with SMTP id 1080177E4
	for <openembedded-devel@lists.openembedded.org>; Sun, 27 Nov 2022 00:04:30 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.224.10]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oz4Di-1zml0X0; Sun, 27 Nov 2022 00:04:26 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCHv2 13/14] libnma: update 1.8.38 -> 1.10.4
Date: Sun, 27 Nov 2022 00:03:50 +0100
Message-Id: <20221126230351.1431843-13-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221126230351.1431843-1-f_l_k@t-online.de>
References: <20221126230351.1431843-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1669503866-17FE898D-74655892/0/0 CLEAN NORMAL
X-TOI-MSGID: 7df39faa-e27b-496d-b803-74912a133ece
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Nov 2022 23:04:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99763

Update to fix use with gcr4

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../libnma/{libnma_1.8.38.bb =3D> libnma_1.10.4.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-connectivity/libnma/{libnma_1.8.38.bb =3D> lib=
nma_1.10.4.bb} (88%)

diff --git a/meta-gnome/recipes-connectivity/libnma/libnma_1.8.38.bb b/me=
ta-gnome/recipes-connectivity/libnma/libnma_1.10.4.bb
similarity index 88%
rename from meta-gnome/recipes-connectivity/libnma/libnma_1.8.38.bb
rename to meta-gnome/recipes-connectivity/libnma/libnma_1.10.4.bb
index 341e29c08..3abfe0b7e 100644
--- a/meta-gnome/recipes-connectivity/libnma/libnma_1.8.38.bb
+++ b/meta-gnome/recipes-connectivity/libnma/libnma_1.10.4.bb
@@ -10,10 +10,10 @@ inherit gnomebase gobject-introspection gtk-doc gette=
xt vala features_check
 REQUIRED_DISTRO_FEATURES =3D "${@bb.utils.contains('PACKAGECONFIG','gcr'=
,'x11','',d)} opengl"
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
-SRC_URI[archive.sha256sum] =3D "5ed93eae18456ff5a8a4f408178c1ee198dc8d3a=
46c65f9075b101916e64e8b4"
+SRC_URI[archive.sha256sum] =3D "79e730dda19f9b34886f4064aa170f1a2326b083=
29d655d80b67e906c7f78b7c"
=20
 PACKAGECONFIG ?=3D "gcr iso_codes mobile_broadband_provider_info"
-PACKAGECONFIG[gcr] =3D "-Dgcr=3Dtrue,-Dgcr=3Dfalse,gcr"
+PACKAGECONFIG[gcr] =3D "-Dgcr=3Dtrue,-Dgcr=3Dfalse,gcr4"
 PACKAGECONFIG[iso_codes] =3D "-Diso_codes=3Dtrue,-Diso_codes=3Dfalse,iso=
-codes,iso-codes"
 PACKAGECONFIG[mobile_broadband_provider_info] =3D "-Dmobile_broadband_pr=
ovider_info=3Dtrue,-Dmobile_broadband_provider_info=3Dfalse,mobile-broadb=
and-provider-info,mobile-broadband-provider-info"
=20
--=20
2.34.1


