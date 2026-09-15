Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70D39C982C9
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 07:44:40 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18121.1789458275929360787
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2026 00:44:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=b5daiN+e;
 spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout01.t-online.de (Postfix) with SMTP id 5478D1C493
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 09:44:20 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.162.202]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x6Npr-00ds610; Tue, 15 Sep 2026 09:44:11 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 22/31] libdex: upgrade 1.0.0 -> 1.2.0
Date: Tue, 15 Sep 2026 09:43:38 +0200
Message-ID: <20260915074347.6003-22-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915074347.6003-1-f_l_k@t-online.de>
References: <20260915074347.6003-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789458251-757F99B9-9C4162B4/0/0 CLEAN NORMAL
X-TOI-MSGID: 5e7f788f-f1f6-4f07-9291-fc57fce5e17b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789458260; i=f_l_k@t-online.de;
	bh=f6M5GGagT67gwJJs7zxw4Yz8urJFIKEDo8bVQom9OfQ=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=b5daiN+epwQVuPul9na7+3nUxj3+7DUavvWKm806uUb2sek1rGenBvhNRVg/KO8cn
	 BTNnmGqpfaKH7iqSG0fBmi8iims/vlueFIaD7Ulr/LeAHQZ+LmISA7bE8mku0dKsAL
	 2u2nIfAyRaG9c4sMSJ/PHAkrLISir020ctw21CRCb+rB3C1ThbMjAfwd7zl/wzuc/E
	 dPtIC0CJtkvsBq93+qLC9WyAcZe/a2QlJz/00vSeKS19XcNrUUMmzWnLwwZV4A22Pi
	 scyldBXoobXu0+q3PICwMMqNuUc4adZEdZiyrteY2BZke5VI586RF5NSGVxpP37gmV
	 0DLvOvGV53o0w==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 07:44:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130066

1.2.0 installs PyGObject overrides. They need python3-pygobject at
runtime, so put them behind a PACKAGECONFIG that is off by default and
ship them when it is enabled.

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../libdex/{libdex_1.0.0.bb =3D> libdex_1.2.0.bb}             | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/libdex/{libdex_1.0.0.bb =3D> libdex_1.2.=
0.bb} (65%)

diff --git a/meta-gnome/recipes-gnome/libdex/libdex_1.0.0.bb b/meta-gnome=
/recipes-gnome/libdex/libdex_1.2.0.bb
similarity index 65%
rename from meta-gnome/recipes-gnome/libdex/libdex_1.0.0.bb
rename to meta-gnome/recipes-gnome/libdex/libdex_1.2.0.bb
index 7d7ae2fa2b..a7f45448ad 100644
--- a/meta-gnome/recipes-gnome/libdex/libdex_1.0.0.bb
+++ b/meta-gnome/recipes-gnome/libdex/libdex_1.2.0.bb
@@ -11,9 +11,13 @@ DEPENDS:append:libc-musl =3D " libucontext"
=20
 LDFLAGS:append:libc-musl =3D " -lucontext"
=20
-SRC_URI[archive.sha256sum] =3D "7b8f5c5db3796e14e12e10422e2356766ba830b9=
2815fee70bbc867b5b207f5d"
+SRC_URI[archive.sha256sum] =3D "69f5b244c21f6402831c3ab8af85a01772f72fb1=
18677388436f12f32bfb06d9"
=20
 PACKAGECONFIG ?=3D ""
+PACKAGECONFIG[pygobject] =3D "-Dpygobject=3Dtrue,-Dpygobject=3Dfalse,,py=
thon3-pygobject"
+
 EXTRA_OEMESON +=3D "-Dintrospection=3Denabled -Dvapi=3Dfalse"
=20
+FILES:${PN} +=3D "${libdir}/python3*/site-packages/gi/overrides"
+
 REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
--=20
2.55.0


