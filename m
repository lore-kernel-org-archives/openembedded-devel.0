Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 618B9C982C2
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 10:21:40 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19784.1789467695054770836
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2026 03:21:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=X1IHAA5v;
 spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout01.t-online.de (Postfix) with SMTP id AE4421C661
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 12:21:32 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.162.202]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x6QI7-35axkY0; Tue, 15 Sep 2026 12:21:31 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [RFC][meta-gnome][PATCH 3/5] gtkmm4: upgrade 4.22.0 -> 4.24.0
Date: Tue, 15 Sep 2026 12:21:21 +0200
Message-ID: <20260915102123.5530-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915102123.5530-1-f_l_k@t-online.de>
References: <20260915102123.5530-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789467691-99FF89C6-A35F9C3A/0/0 CLEAN NORMAL
X-TOI-MSGID: eae80d04-ebe6-4d22-9d9a-3a50696f52ad
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789467692; i=f_l_k@t-online.de;
	bh=Ry8KwOGeYIJTMuODnqi3B8mtDp+ufAubvq8hrMoDYaw=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=X1IHAA5vgABirZb/WynNWwHObK4KBlf07Xon8uN6n5GRumkxvdibEXXMaEYaREJTj
	 dxuKT9Equytb+BjNJRfmPlkm0YMccHazAJNVlP3uRjftjYonKfUuZFmt1isuo4qPWr
	 d4TDxYw2B26pNlKZZvxi7m7Z5y/5RPJwQ6ledX/6LiwXyL6tHwtg/4sBw588UA4aa/
	 okp/FUs59L39JgJgxIFmudSKkvO3NENtC58JE8mg7iOLiatmIuCawujZyYsbrpNfxO
	 iM7a84HzEM5y3o2/k76lTZqDdWdLKMYa5LhS/oShBVvw6aRlvEj0nDt1B8EIxDOe4R
	 HCWWIr/v5WRLg==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 10:21:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130072

GdkCursor became a final type in GTK 4.24, so gtkmm 4.22 no longer
compiles against it:

  error: conflicting declaration 'using GdkCursorClass =3D struct _GdkCur=
sorClass'

Depends on the gtk4 4.24.0 upgrade in oe-core.

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/gtk+/{gtkmm4_4.22.0.bb =3D> gtkmm4_4.24.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-gnome/gtk+/{gtkmm4_4.22.0.bb =3D> gtkmm4_4.24.0.b=
b} (85%)

diff --git a/meta-oe/recipes-gnome/gtk+/gtkmm4_4.22.0.bb b/meta-oe/recipe=
s-gnome/gtk+/gtkmm4_4.24.0.bb
similarity index 85%
rename from meta-oe/recipes-gnome/gtk+/gtkmm4_4.22.0.bb
rename to meta-oe/recipes-gnome/gtk+/gtkmm4_4.24.0.bb
index 2f56d511a0..35f0361997 100644
--- a/meta-oe/recipes-gnome/gtk+/gtkmm4_4.22.0.bb
+++ b/meta-oe/recipes-gnome/gtk+/gtkmm4_4.24.0.bb
@@ -16,7 +16,7 @@ inherit gnomebase features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "opengl"
=20
-SRC_URI[archive.sha256sum] =3D "2e8a21b4b0725f620e33aaee0cd343ed121b5332=
75b632896619b1c89e96de67"
+SRC_URI[archive.sha256sum] =3D "7fd9cea356e7d3b74bf7d2a51d7e0e6763f3f9f1=
cddc5e77c8b0b5b7fa9d5e5a"
=20
 EXTRA_OEMESON =3D "-Dbuild-demos=3Dfalse"
=20
--=20
2.55.0


