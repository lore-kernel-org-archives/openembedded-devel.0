Received: from unicorn.mansr.com (unicorn.mansr.com [81.2.72.234])
 by mx.groups.io with SMTP id smtpd.web08.33912.1610978648993012842
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Jan 2021 06:04:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: mansr.com, ip: 81.2.72.234, mailfrom: mru@mansr.com)
Received: from raven.mansr.com (raven.mansr.com [IPv6:2001:8b0:ca0d:8d8e::3])
	by unicorn.mansr.com (Postfix) with ESMTPS id 4D09915360;
	Mon, 18 Jan 2021 14:04:05 +0000 (GMT)
Received: by raven.mansr.com (Postfix, from userid 51770)
	id 3C96A21A3D9; Mon, 18 Jan 2021 14:04:05 +0000 (GMT)
From: "Mans Rullgard" <mans@mansr.com>
To: akuster808@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Subject: [zeus][meta-oe][PATCH] libwebsockets: update to 3.2.3
Date: Mon, 18 Jan 2021 14:03:59 +0000
Message-Id: <20210118140359.7562-1-mans@mansr.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Version 3.2.0 broke mosquitto, fixed in 3.2.1.

Signed-off-by: Mans Rullgard <mans@mansr.com>
---
 .../{libwebsockets_3.2.0.bb =3D> libwebsockets_3.2.3.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/libwebsockets/{libwebsockets_3.2.0.b=
b =3D> libwebsockets_3.2.3.bb} (95%)

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.2=
.0.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.2.3.bb
similarity index 95%
rename from meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.2.=
0.bb
rename to meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.2.3.=
bb
index 9c5503357f12..dbce9ee42bf2 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.2.0.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.2.3.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4ce87f3facb6f9=
11c142c8bef9bfb380"
 DEPENDS =3D "zlib"
=20
 S =3D "${WORKDIR}/git"
-SRCREV =3D "94931cad003faf9d316e698b557bbb6d245f1f91"
+SRCREV =3D "c744c0934d69912e1cc50ff23d203ad60d535709"
 SRC_URI =3D "git://github.com/warmcat/libwebsockets.git;protocol=3Dhttps=
;branch=3Dv3.2-stable"
=20
 inherit cmake pkgconfig
--=20
2.30.0

