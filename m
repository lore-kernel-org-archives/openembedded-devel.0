Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95489CD4F54
	for <webhook@archiver.kernel.org>; Sat, 30 May 2026 08:19:29 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2695.1780129162348074807
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 May 2026 01:19:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=CsZBm7qt;
 spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd91.aul.t-online.de (fwd91.aul.t-online.de [10.223.144.117])
	by mailout08.t-online.de (Postfix) with SMTP id 410C0E799
	for <openembedded-devel@lists.openembedded.org>; Sat, 30 May 2026 10:18:59 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.169.166]) by fwd91.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wTEuF-2ZJ5hh0; Sat, 30 May 2026 10:18:55 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] gd: fix build with gcc 16
Date: Sat, 30 May 2026 10:18:37 +0200
Message-ID: <20260530081837.2192126-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1780129135-90FF6F83-9AC380E0/0/0 CLEAN NORMAL
X-TOI-MSGID: 67240c5f-d843-4db5-978e-9d880c126472
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1780129139; i=f_l_k@t-online.de;
	bh=fEptGDr4t+vSbt2KAsXCqOaUHg8XI626ZI6/bMWmHWU=;
	h=From:To:Subject:Date;
	b=CsZBm7qtkVCvsMbQopG8Q7dJOpU6Sx3qKJtwfJwQMGND4xHRyKCEBZgKdZg2PwG0y
	 PXEStIZLCi+MudUKuONOXCqf7eJefz7QuR9OnU6z62mQzQsmqk/5W+J8FJVcR3Wduu
	 5SZFVI29/pIIIuDhxrpT4wa1JjVXFJ7CxIrJxQRlQFrR5ZOYLZ03uEqPS6UhreGtJR
	 RAUNA+2TgHYOc06l77xCrQvcznbzCz3yZaoJSjPMw55HqEHtu8RBzsVHgs3/ftwSQd
	 v9G1B3kuMJ/Yrk56ShFj1TKQmyNhfhKhWceYKaQxPnxE3dwYpilxs9S3/AwN1dY9Nc
	 5oUKyoyZMo3YA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 May 2026 08:19:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127295

https://github.com/libgd/libgd/issues/990

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../0001-gd.c-fix-maybe_uninitialized.patch   | 26 +++++++++++++++++++
 meta-oe/recipes-support/gd/gd_2.3.3.bb        |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta-oe/recipes-support/gd/gd/0001-gd.c-fix-maybe_uni=
nitialized.patch

diff --git a/meta-oe/recipes-support/gd/gd/0001-gd.c-fix-maybe_uninitiali=
zed.patch b/meta-oe/recipes-support/gd/gd/0001-gd.c-fix-maybe_uninitializ=
ed.patch
new file mode 100644
index 0000000000..9fd51da68f
--- /dev/null
+++ b/meta-oe/recipes-support/gd/gd/0001-gd.c-fix-maybe_uninitialized.pat=
ch
@@ -0,0 +1,26 @@
+From 1bb2911c02193d32f1458b771c485980fd100010 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Sat, 30 May 2026 10:12:26 +0200
+Subject: [PATCH] gd.c: fix maybe_uninitialized
+
+Upstream-Status: Pending [https://github.com/libgd/libgd/issues/990]
+---
+ src/gd.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/gd.c b/src/gd.c
+index fd8d1aa2..6ffdd41f 100644
+--- a/src/gd.c
++++ b/src/gd.c
+@@ -2069,7 +2069,7 @@ BGD_DECLARE(void) gdImageArc (gdImagePtr im, int c=
x, int cy, int w, int h, int s
+ BGD_DECLARE(void) gdImageFilledArc (gdImagePtr im, int cx, int cy, int =
w, int h, int s, int e,
+ 									int color, int style)
+ {
+-	gdPoint pts[363];
++	gdPoint pts[363] =3D {0};
+ 	int i, pti;
+ 	int lx =3D 0, ly =3D 0;
+ 	int fx =3D 0, fy =3D 0;
+--=20
+2.54.0
+
diff --git a/meta-oe/recipes-support/gd/gd_2.3.3.bb b/meta-oe/recipes-sup=
port/gd/gd_2.3.3.bb
index 062c4b4a8f..cc78fd8de7 100644
--- a/meta-oe/recipes-support/gd/gd_2.3.3.bb
+++ b/meta-oe/recipes-support/gd/gd_2.3.3.bb
@@ -16,6 +16,7 @@ DEPENDS =3D "freetype libpng jpeg zlib tiff"
 SRC_URI =3D "git://github.com/libgd/libgd.git;nobranch=3D1;protocol=3Dht=
tps \
            file://0001-Fix-deprecared-function-prototypes.patch \
            file://Fix-ftype-missing-const.patch \
+           file://0001-gd.c-fix-maybe_uninitialized.patch \
            "
=20
 SRCREV =3D "b5319a41286107b53daa0e08e402aa1819764bdc"
--=20
2.54.0


