Return-Path: <tafil@tafhub.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FE7EC9832F
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 18:24:30 +0000 (UTC)
Received: from mail.tafhub.de (mail.tafhub.de [5.9.40.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41303.1790533464016932709
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 11:24:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@tafhub.de header.s=dkim header.b=KfFgRqNO;
 spf=pass (domain: tafhub.de, ip: 5.9.40.180, mailfrom: tafil@tafhub.de)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4E8DA2E41115;
	Sun, 27 Sep 2026 20:24:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tafhub.de; s=dkim;
	t=1790533461; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=MoTIylf8EX9ZZpoJXiW7ivH7NXI+n5QBssdpZRgf7zw=;
	b=KfFgRqNOjP5Rl4aXfTrfBM++V1NpD42jchW38IgdnduMCUrIeSjUf4GaeJl9g3jmgPv8wv
	l3RDKo/jD6AzehBUk0Rvzg3SyxrpDis2GvDT88J2O0JwfvU1GypESgHc+ncDa482Lrb+ef
	Zn3FuJWFXxZUAXRK7GM6z16HBZbftehGej4e+ru+nJeDqhzXRrbUxXxC1hNFLZJ77KevJl
	J4a7BjPTXYuDcc+b4nURKgCPizCDuqoBO4eOz3cG7p3Jssdh7qKLBL81Ad44YvCMbJVPPL
	8Vm4zUSRAPSUCVeIrXS2RdvMq4QDFAkg7t4Y67CxBN3oWBgqjucL6QscxjRj/w==
From: Tafil Avdyli <tafil@tafhub.de>
To: openembedded-devel@lists.openembedded.org
Cc: Tafil Avdyli <tafil@tafhub.de>
Subject: [meta-oe][PATCH 2/2] fastfetch: add quickjs option
Date: Sun, 27 Sep 2026 20:24:18 +0200
Message-ID: <20260927182418.1339166-2-tafil@tafhub.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260927182418.1339166-1-tafil@tafhub.de>
References: <20260927182418.1339166-1-tafil@tafhub.de>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 18:24:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130376

quickjs is now available in meta-wayland [1].

[1]: https://codeberg.org/flk/meta-wayland/commit/c5c5f9f2ebf4f1e01b028a9=
beab28aec21508bd7

Signed-off-by: Tafil Avdyli <tafil@tafhub.de>
---
 meta-oe/recipes-support/fastfetch/fastfetch_2.69.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/fastfetch/fastfetch_2.69.0.bb b/meta=
-oe/recipes-support/fastfetch/fastfetch_2.69.0.bb
index 83f7480011..761dafc039 100644
--- a/meta-oe/recipes-support/fastfetch/fastfetch_2.69.0.bb
+++ b/meta-oe/recipes-support/fastfetch/fastfetch_2.69.0.bb
@@ -19,7 +19,6 @@ EXTRA_OECMAKE +=3D "\
     ${@bb.utils.contains_any('PACKAGECONFIG', 'chafa imagemagick sixel',=
 '-DENABLE_IMAGE_LOGO=3DON', '-DENABLE_IMAGE_LOGO=3DOFF', d)} \
     -DENABLE_SYSTEM_YYJSON=3DON \
     -DENABLE_EET=3DOFF \
-    -DENABLE_QUICKJS=3DOFF \
 "
=20
 PACKAGECONFIG ??=3D "\
@@ -47,6 +46,7 @@ PACKAGECONFIG[imagemagick] =3D "-DENABLE_IMAGEMAGICK7=3D=
ON -DENABLE_IMAGEMAGICK6=3DOFF
 PACKAGECONFIG[lua] =3D "-DENABLE_LUA=3DON,-DENABLE_LUA=3DOFF,lua"
 PACKAGECONFIG[opencl] =3D "-DENABLE_OPENCL=3DON,-DENABLE_OPENCL=3DOFF,op=
encl-headers virtual/libopencl1"
 PACKAGECONFIG[pulseaudio] =3D "-DENABLE_PULSE=3DON,-DENABLE_PULSE=3DOFF,=
pulseaudio"
+PACKAGECONFIG[quickjs] =3D "-DENABLE_QUICKJS=3DON,-DENABLE_QUICKJS=3DOFF=
,quickjs"
 PACKAGECONFIG[rpm] =3D "-DENABLE_RPM=3DON,-DENABLE_RPM=3DOFF,rpm"
 PACKAGECONFIG[sixel] =3D "-DENABLE_SIXEL=3DON,-DENABLE_SIXEL=3DOFF,"
 PACKAGECONFIG[sqlite3] =3D "-DENABLE_SQLITE3=3DON,-DENABLE_SQLITE3=3DOFF=
,sqlite3"

