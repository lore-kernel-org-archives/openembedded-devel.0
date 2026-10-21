Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8052.1792577264645697051
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 03:07:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=t94o3Xx9;
 spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout10.t-online.de (Postfix) with SMTP id 6678F37E43
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 12:07:40 +0200 (CEST)
Received: from localhost.localdomain ([84.163.40.237]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xJTEM-0cELaR0; Wed, 21 Oct 2026 12:07:34 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 24/26] yelp-xsl: upgrade 42.1 -> 49.0
Date: Wed, 21 Oct 2026 12:07:12 +0200
Message-ID: <20261021100717.11068-24-f_l_k@t-online.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021100717.11068-1-f_l_k@t-online.de>
References: <20261021100717.11068-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1792577254-AAFFA903-072B9844/0/0 CLEAN NORMAL
X-TOI-MSGID: 2adedb95-efed-4bde-9607-6bc3d0f72dbd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1792577260; i=f_l_k@t-online.de;
	bh=fxpzMXDyGfHGNYOxnZPSjQSUQrnkmyEsoTUfkDPuSkI=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=t94o3Xx9/tAGa3ztbZusxNg5FAU/P6F6Loew0kZ/OSunZU+LtkSfxDWJ/F8PGYfHZ
	 wsi7l2L3ktgLPMGZwtE6+qyC8XABK5KPTsak5l1+aHUwTabBDzMb5Z7WRUjXRnRicx
	 /M43qIRicrD+EjbcqGrFDXUqklm6px2UcIeQvk/de/8F8KCuaq3vbHci2ZHIE+95ku
	 KFb7gkQPsGyA6ejkSReCD2W9yKRPDRM/kVLhC1zscM6nnPmmxbBTWHGAGgJwYfMfP1
	 xA5B+sQAR/xg6KAWXfl/BFMFaPeExsfMw10f1ZPl7/igpw3a/khGql6A9KgoTXS45U
	 Xnch4CTw5GQwg==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 10:07:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131250
Content-Type: text/plain; charset="utf-8"

yelp-xsl builds with meson only now; drop the autotools build class. It
needs libxml2 and xsltproc, and msgfmt also for the native build, which
the gettext class gives only gettext-minimal-native.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../yelp/{yelp-xsl_42.1.bb =3D> yelp-xsl_49.0.bb}             | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-gnome/recipes-gnome/yelp/{yelp-xsl_42.1.bb =3D> yelp-xsl_49.=
0.bb} (75%)

diff --git a/meta-gnome/recipes-gnome/yelp/yelp-xsl_42.1.bb b/meta-gnome/=
recipes-gnome/yelp/yelp-xsl_49.0.bb
similarity index 75%
rename from meta-gnome/recipes-gnome/yelp/yelp-xsl_42.1.bb
rename to meta-gnome/recipes-gnome/yelp/yelp-xsl_49.0.bb
index 1ea4040490..4c1ae0da46 100644
--- a/meta-gnome/recipes-gnome/yelp/yelp-xsl_42.1.bb
+++ b/meta-gnome/recipes-gnome/yelp/yelp-xsl_49.0.bb
@@ -6,12 +6,12 @@ LIC_FILES_CHKSUM =3D " \
     file://COPYING.LGPL;md5=3Da6f89e2100d9b6cdffcea4f398e37343 \
 "
=20
-GNOMEBASEBUILDCLASS =3D "autotools"
 inherit gnomebase gettext itstool
=20
-DEPENDS +=3D "libxml2"
+DEPENDS +=3D "libxml2 libxslt-native"
+DEPENDS:append:class-native =3D " gettext-native"
=20
-SRC_URI[archive.sha256sum] =3D "238be150b1653080ce139971330fd36d3a26595e=
0d6a040a2c030bf3d2005bcd"
+SRC_URI[archive.sha256sum] =3D "59d43a8f8fe67b784f14f9a04dd4a7a092a7f4a6=
4a65e71b90fe02a47a50fbec"
=20
 RDEPENDS:${PN}:append:class-target =3D " libxml2 itstool"
=20
--=20
2.56.0

