Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8055.1792577264870885578
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 03:07:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=rwc9aGaJ;
 spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout07.t-online.de (Postfix) with SMTP id 67844E40F
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 12:07:40 +0200 (CEST)
Received: from localhost.localdomain ([84.163.40.237]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xJTEM-0cELaS0; Wed, 21 Oct 2026 12:07:35 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 25/26] yelp: upgrade 42.2 -> 49.2
Date: Wed, 21 Oct 2026 12:07:13 +0200
Message-ID: <20261021100717.11068-25-f_l_k@t-online.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021100717.11068-1-f_l_k@t-online.de>
References: <20261021100717.11068-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1792577255-A97F9903-BAB96235/0/0 CLEAN NORMAL
X-TOI-MSGID: 85a063ce-4ff7-4eae-8af3-9140e44bd9ef
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1792577260; i=f_l_k@t-online.de;
	bh=tjZq1g2JmuUOVYJaxrkegFUvcfFz7IizBchQUm5+KN8=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=rwc9aGaJ9CzC78bT7cXzJ+LlA9SMaw5t4jWZ5/lcLQyX3S8ExcrzN42f06/s6v0X3
	 ZVKLx36z+gFg2KqgWaQmK1B2OMMC4XWAoDsNC+FcYOPE+6WZr8XN/hmdxQcW5DK7hz
	 1VMNl11cySex6CpXhBqlTgfhYpqtYTR84Rg88DPKlkC9rRRukkUWsB5AVk6qQ32dsV
	 TR0oeczsWljpgPxu9QsPLxLTSEFWXAlnHKo2JdBt1X4A3fwDZ4h4I49SJT4ExFBgNz
	 MytEaJzraAd5hNTonp2/verfB3Q7Yrpd6gEzLhLa4JixLHQFTXb3I5TIhwg5SltD76
	 9o8Ky4/8fwi9Q==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 10:07:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131253
Content-Type: text/plain; charset="utf-8"

yelp is ported to GTK 4 and libadwaita and builds with meson only now.
Drop the autotools build class, autotools-brokensep, gtk-doc and the
configure workaround. DEPENDS move from gtk+3, libhandy and webkitgtk3 to
gtk4, libadwaita and webkitgtk (WebKitGTK 6.0); appstream-glib is no
longer used. The lzma and bzip2 support become PACKAGECONFIG options.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../yelp/{yelp_42.2.bb =3D> yelp_49.2.bb}       | 21 +++++++++----------
 1 file changed, 10 insertions(+), 11 deletions(-)
 rename meta-gnome/recipes-gnome/yelp/{yelp_42.2.bb =3D> yelp_49.2.bb} (5=
3%)

diff --git a/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb b/meta-gnome/reci=
pes-gnome/yelp/yelp_49.2.bb
similarity index 53%
rename from meta-gnome/recipes-gnome/yelp/yelp_42.2.bb
rename to meta-gnome/recipes-gnome/yelp/yelp_49.2.bb
index 4ebb5bb3b3..ce0d1dc69e 100644
--- a/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb
+++ b/meta-gnome/recipes-gnome/yelp/yelp_49.2.bb
@@ -3,36 +3,35 @@ LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D " \
     file://COPYING;md5=3D6e1b9cb787e76d7e6946887a65caa754 \
 "
-GNOMEBASEBUILDCLASS =3D "autotools"
-inherit gnomebase itstool autotools-brokensep gsettings gettext gtk-doc =
features_check mime-xdg
+inherit gnomebase itstool gsettings gettext features_check mime-xdg
=20
 # for webkitgtk
 REQUIRED_DISTRO_FEATURES =3D "opengl"
 ANY_OF_DISTRO_FEATURES =3D "wayland x11"
=20
-SRC_URI[archive.sha256sum] =3D "a2c5fd0787a9089c722cc66bd0f85cdf7088d870=
e7b6cc85799f8e5bff9eac4b"
+SRC_URI[archive.sha256sum] =3D "5afc8e77308451ee45ee919efee5a154ca3c153a=
90e2a1b58cebf7827ab88ad0"
=20
 DEPENDS +=3D " \
     libxml2-native \
     glib-2.0-native \
-    gtk+3 \
-    appstream-glib \
+    gtk4 \
+    libadwaita \
     libxslt \
     sqlite3 \
-    libhandy \
-    webkitgtk3 \
+    webkitgtk \
     yelp-xsl \
 "
=20
-do_configure:prepend() {
-    export ITSTOOL=3D${STAGING_BINDIR_NATIVE}/itstool
-}
+PACKAGECONFIG ??=3D "lzma bzip2"
+PACKAGECONFIG[lzma] =3D "-Dlzma=3Denabled,-Dlzma=3Ddisabled,xz"
+PACKAGECONFIG[bzip2] =3D "-Dbzip2=3Denabled,-Dbzip2=3Ddisabled,bzip2"
=20
 FILES:${PN} +=3D " \
+    ${libdir}/yelp-1/web-process-extensions \
     ${datadir}/metainfo \
     ${datadir}/yelp-xsl \
 "
=20
 RDEPENDS:${PN} +=3D "yelp-xsl"
=20
-CVE_STATUS[CVE-2008-3533] =3D "cpe-incorrect: The current version (42.2)=
 is not affected. Fixed in 2.24."
+CVE_STATUS[CVE-2008-3533] =3D "cpe-incorrect: The current version (49.2)=
 is not affected. Fixed in 2.24."
--=20
2.56.0

