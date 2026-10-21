Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8050.1792577262676885340
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 03:07:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=HuZ4cbWL;
 spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout02.t-online.de (Postfix) with SMTP id 36BACE95D
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 12:07:40 +0200 (CEST)
Received: from localhost.localdomain ([84.163.40.237]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xJTEL-0cELaJ0; Wed, 21 Oct 2026 12:07:33 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 16/26] gnome-terminal: upgrade 3.54.0 -> 3.60.0
Date: Wed, 21 Oct 2026 12:07:04 +0200
Message-ID: <20261021100717.11068-16-f_l_k@t-online.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021100717.11068-1-f_l_k@t-online.de>
References: <20261021100717.11068-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1792577253-A97F9903-710EE1D3/0/0 CLEAN NORMAL
X-TOI-MSGID: 6d0a968f-70b6-4f74-b43e-8d4991304d71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1792577260; i=f_l_k@t-online.de;
	bh=77tV84oMUR2g5ibSB//2kdr5d+e/fkH4f/58U5x32Jo=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=HuZ4cbWLGsSGLWMER44mi3J6c/oJU/fH3eLCKwcUeqBiDhjWN7EjLT/1YSIuMKb9K
	 yw1qiesEtilU9V3EiMd+olLA2cXD2oAePh4kEj/XrIXScr+D8oBdokBH6kvf9b5ckR
	 lebn+1JDACuYL3H8K2C2iCoshGMkgZNikNbvjvW1sdVdugPaRt5UHvMKxhUks+RzvL
	 OmFJ3/fc2NI9GMidNUyc7guZBHMzjjajhjTlpqjrb+hWllv2SRd8ea6NT/rMdJByt9
	 RzQ0lw7hWFwoKEDEBFsOSEFGkHra+CcZF1gS3uHgFvqbkKnNDjwj1fdr0NYycq+f9O
	 mV/Q7VV/0cCoQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 10:07:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131241
Content-Type: text/plain; charset="utf-8"

Built for x86-64 with the existing patch and options.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-terminal_3.54.0.bb =3D> gnome-terminal_3.60.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-terminal/{gnome-terminal_3.54.0.bb=
 =3D> gnome-terminal_3.60.0.bb} (95%)

diff --git a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.54.=
0.bb b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.60.0.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.54.0=
.bb
rename to meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.60.0.b=
b
index 449ce6d1ed..33cafe6184 100644
--- a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.54.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.60.0.bb
@@ -23,7 +23,7 @@ SRC_URI =3D " \
 	git://gitlab.gnome.org/GNOME/gnome-terminal.git;protocol=3Dhttps;nobran=
ch=3D1 \
 	file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch \
 "
-SRCREV =3D "965cb9307713c618253918633416fcad86bcc5d2"
+SRCREV =3D "5d1d01d8bad69d33b0048f7791ebb6b0c7fb9f21"
=20
 PACKAGECONFIG ?=3D ""
 PACKAGECONFIG[nautilus] =3D "-Dnautilus_extension=3Dtrue,-Dnautilus_exte=
nsion=3Dfalse,nautilus,nautilus"
--=20
2.56.0

