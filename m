Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71DAFC88E75
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 10:21:40 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19804.1789467695277947144
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2026 03:21:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=lGu4vZsA;
 spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout01.t-online.de (Postfix) with SMTP id BDD281C298
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 12:21:32 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.162.202]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x6QI7-35axka0; Tue, 15 Sep 2026 12:21:31 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [RFC][meta-gnome][PATCH 5/5] nautilus: upgrade 50.3 -> 51.0.1
Date: Tue, 15 Sep 2026 12:21:23 +0200
Message-ID: <20260915102123.5530-5-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915102123.5530-1-f_l_k@t-online.de>
References: <20260915102123.5530-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789467691-0D7F99C6-13621923/0/0 CLEAN NORMAL
X-TOI-MSGID: b541abbe-68ae-43e5-955d-fbf6058e84c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789467692; i=f_l_k@t-online.de;
	bh=x9i+b2lcGoGd71bvqdnqpZ5eeASXfOF0I8EQkN3sNVc=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=lGu4vZsAdcWqbPrYvY2zpMT1Wh0NANHEjqHnAyO4gI+Ngc8LB1quWG111yLvgiNJY
	 5X5+ZhG5O4YmcVEGSOAW3Lez86gFpzXWoA8YxxJG1KjsnvVlTvkI8cPbkh0CuS8RMl
	 QqDVeq3R3mJDxAP3i8/m9FSKfZFUgVzRhtopuBJ5nEhasW5cbD7ECeEo2uaik+0hVY
	 kvkZ00uUL4E2+u0OuXD8Ve3mX5dZYLD7IfXMxN3CGme5U1QY6NwNIruw/aPdXGZ4J7
	 Q3YBPaloFCBZ246FHmdH4hvSdVU7WA1btEWJlpN9bqo+oRTgALmoNuVRYqIzd8L4Gz
	 XRuXTesEflqdg==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 10:21:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130073

Depends on the glib-2.0 2.90.0 upgrade in oe-core; 51.0.1 requires
gio-2.0 >=3D 2.89.0.

gnome_verdir() turns the three component version into "51.0", while the
tarball lives in the "51" directory, so set SRC_URI accordingly.

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../nautilus/{nautilus_50.3.bb =3D> nautilus_51.0.1.bb}         | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/nautilus/{nautilus_50.3.bb =3D> nautilus=
_51.0.1.bb} (87%)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_50.3.bb b/meta-gn=
ome/recipes-gnome/nautilus/nautilus_51.0.1.bb
similarity index 87%
rename from meta-gnome/recipes-gnome/nautilus/nautilus_50.3.bb
rename to meta-gnome/recipes-gnome/nautilus/nautilus_51.0.1.bb
index e3a825b0a1..19a850089b 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_50.3.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_51.0.1.bb
@@ -24,7 +24,9 @@ DEPENDS =3D " \
=20
 inherit gnomebase gsettings gobject-introspection gi-docgen gettext feat=
ures_check mime-xdg gtk-icon-cache
=20
-SRC_URI[archive.sha256sum] =3D "63773baf0ddec7b4875fc2c22040378562ea1e68=
12fe0a2e29c9c8d5c72807f8"
+SRC_URI =3D "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version('${PV}'=
, 1)}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=3Darchive"
+
+SRC_URI[archive.sha256sum] =3D "a00db908fd65026cbd5dc634e12d189de8eba2b0=
3f105d2425341768a5ee92fb"
=20
 REQUIRED_DISTRO_FEATURES =3D "opengl gobject-introspection-data"
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
--=20
2.55.0


