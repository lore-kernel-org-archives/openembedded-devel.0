Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8020.1792577262379193553
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 03:07:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=Rg9keYJM;
 spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout11.t-online.de (Postfix) with SMTP id 1C42C1C262
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 12:07:40 +0200 (CEST)
Received: from localhost.localdomain ([84.163.40.237]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xJTEK-0cELaD0; Wed, 21 Oct 2026 12:07:32 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 10/26] mutter: upgrade 51.0 -> 51.1
Date: Wed, 21 Oct 2026 12:06:58 +0200
Message-ID: <20261021100717.11068-10-f_l_k@t-online.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021100717.11068-1-f_l_k@t-online.de>
References: <20261021100717.11068-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1792577252-A97F9903-322956D1/0/0 CLEAN NORMAL
X-TOI-MSGID: 767cc4a9-8c79-453b-af78-6b3d0ba7cdf6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1792577260; i=f_l_k@t-online.de;
	bh=wkBA7OO6AaDI8eayW51e+3MEYa/PS/y7VSBpNbzwF6o=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Rg9keYJMwlIv60gAb107+byLHzjFrrZ4/DZrOsntYzZAlr5N2ZYmtQQiln5Ir0ggQ
	 X4qIgYAvO10dAvcvLoYHQSfUVlACHZ7Z97Dgr0WGo80itGM/rSfQ1xJZ5hXjnFHqJd
	 798hBW/b7mxL4DELFcMCINlRIc3JRMVLO6MP1vdLMFTTjtmIJzBianefV31O4ew/J8
	 iSmjsB1DzYkLC/UZr9oz3OKpWCMNwJoHrm6vSGqlnD4XTnRqdx6OfpIfyd/6KhiW1Z
	 oZAR8bLo7LqXwG8feBHzqdE7xea4DpWYK4Pn5DANJyzl7briQRKpLR4Ll9RpqWSjOI
	 wR/48PxFUYupw==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 10:07:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131245
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/mutter/{mutter_51.0.bb =3D> mutter_51.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/mutter/{mutter_51.0.bb =3D> mutter_51.1.=
bb} (97%)

diff --git a/meta-gnome/recipes-gnome/mutter/mutter_51.0.bb b/meta-gnome/=
recipes-gnome/mutter/mutter_51.1.bb
similarity index 97%
rename from meta-gnome/recipes-gnome/mutter/mutter_51.0.bb
rename to meta-gnome/recipes-gnome/mutter/mutter_51.1.bb
index 4213e2cc06..40dcf9f3b0 100644
--- a/meta-gnome/recipes-gnome/mutter/mutter_51.0.bb
+++ b/meta-gnome/recipes-gnome/mutter/mutter_51.1.bb
@@ -38,7 +38,7 @@ inherit gnomebase gsettings gobject-introspection gette=
xt features_check
 SRC_URI +=3D "file://0001-Dont-use-system-sysprof-dbus-folder.patch \
             file://0002-build-Build-remote-selection-source-without-remo=
te-desktop.patch \
             "
-SRC_URI[archive.sha256sum] =3D "5d28f3ae225692428fcafb96500d673f34328b69=
8b86960c9c1460d0b1d983b3"
+SRC_URI[archive.sha256sum] =3D "0d311d87901dbcb94518fb89304febe30852ce5d=
8a4befa9f87e85c68eceefde"
=20
 REQUIRED_DISTRO_FEATURES =3D "wayland polkit"
 ANY_OF_DISTRO_FEATURES =3D "opengl vulkan"
--=20
2.56.0

