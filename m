Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8049.1792577262676851939
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 03:07:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=qux2nX5p;
 spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout02.t-online.de (Postfix) with SMTP id 455D1E963
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 12:07:40 +0200 (CEST)
Received: from localhost.localdomain ([84.163.40.237]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xJTEL-0cELaM0; Wed, 21 Oct 2026 12:07:34 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 19/26] gspell: upgrade 1.12.2 -> 1.14.5
Date: Wed, 21 Oct 2026 12:07:07 +0200
Message-ID: <20261021100717.11068-19-f_l_k@t-online.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021100717.11068-1-f_l_k@t-online.de>
References: <20261021100717.11068-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1792577254-65FF8903-BD4A9E19/0/0 CLEAN NORMAL
X-TOI-MSGID: 8212cd5a-e0f4-499b-b2cd-c94ae7a1b75a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1792577260; i=f_l_k@t-online.de;
	bh=ONJJvThTjbCjJfKaOw3ufvNPvN26sl1Ng/miPi10BHY=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=qux2nX5pE7LKhEo9FFNB8xJ1PRNnZrADO0ZsukUs7CNvW4AUDAeeUq6qCb2v0ZOQt
	 xEypYHRSejBEkVuSLOSOjXiPGpOVIl29pHzOWIGNO5YmHYhgceInFcvheR5uSVCKb4
	 tGSon7Akt0my9gFgCRMV2c+2olfuFjtRp4wUh1XaaM6v40ulOS+cQelbTW8hHsyo9p
	 4mqzn7yV28m/4MgLmrfqv7zHxYykeAUHCt8q9mD1aItGJRX1u11B3nN4FOWIv2gCGU
	 fFrxnFScxwi4DcsdXBsx2ix/+Gl/3BNo1zy9xlSGcb+o/V/bqEkMOedKOTuo5sW6Bg
	 msLuOQvNhW5LA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 10:07:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131239
Content-Type: text/plain; charset="utf-8"

gspell builds with meson only now; drop the autotools build class and map
the introspection and gtk-doc options, without the demo app and tests.
The license is LGPL-2.1-or-later as stated in LICENSES/, the text is
unchanged.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/gspell/gspell_1.12.2.bb | 11 -----------
 meta-gnome/recipes-gnome/gspell/gspell_1.14.5.bb | 15 +++++++++++++++
 2 files changed, 15 insertions(+), 11 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gspell/gspell_1.12.2.bb
 create mode 100644 meta-gnome/recipes-gnome/gspell/gspell_1.14.5.bb

diff --git a/meta-gnome/recipes-gnome/gspell/gspell_1.12.2.bb b/meta-gnom=
e/recipes-gnome/gspell/gspell_1.12.2.bb
deleted file mode 100644
index 2668fc009f..0000000000
--- a/meta-gnome/recipes-gnome/gspell/gspell_1.12.2.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-SUMMARY =3D "gspell adds spell-checking to a GTK+ applications"
-HOMEPAGE =3D "https://wiki.gnome.org/Projects/gspell"
-LICENSE =3D "LGPL-2.1-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8c2e1ec1540fb3e0beb68361344cb=
a7e"
-
-DEPENDS =3D "gtk+3 icu enchant2"
-
-GNOMEBASEBUILDCLASS =3D "autotools"
-inherit gnomebase gettext gobject-introspection vala gtk-doc
-
-SRC_URI[archive.sha256sum] =3D "b4e993bd827e4ceb6a770b1b5e8950fce3be9c8b=
2b0cbeb22fdf992808dd2139"
diff --git a/meta-gnome/recipes-gnome/gspell/gspell_1.14.5.bb b/meta-gnom=
e/recipes-gnome/gspell/gspell_1.14.5.bb
new file mode 100644
index 0000000000..9e4a597440
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gspell/gspell_1.14.5.bb
@@ -0,0 +1,15 @@
+SUMMARY =3D "gspell adds spell-checking to a GTK+ applications"
+HOMEPAGE =3D "https://wiki.gnome.org/Projects/gspell"
+LICENSE =3D "LGPL-2.1-or-later"
+LIC_FILES_CHKSUM =3D "file://LICENSES/LGPL-2.1-or-later.txt;md5=3D8c2e1e=
c1540fb3e0beb68361344cba7e"
+
+DEPENDS =3D "gtk+3 icu enchant2"
+
+inherit gnomebase gettext gobject-introspection vala gtk-doc
+
+GIR_MESON_OPTION =3D "gobject_introspection"
+GTKDOC_MESON_OPTION =3D "gtk_doc"
+
+EXTRA_OEMESON =3D "-Dgspell_app=3Dfalse -Dtests=3Dfalse -Dinstall_tests=3D=
false"
+
+SRC_URI[archive.sha256sum] =3D "788783b56fc3d03283b3aa29302d0b958aeca888=
35e10b1ec61f19e0efc7e8a4"
--=20
2.56.0

