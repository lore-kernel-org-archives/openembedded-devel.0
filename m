Received: from smtp.missinglinkelectronics.com (smtp.missinglinkelectronics.com [94.130.14.54])
 by mx.groups.io with SMTP id smtpd.web11.6670.1620824940224954368
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 May 2021 06:09:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: missinglinkelectronics.com, ip: 94.130.14.54, mailfrom: stefan.wiehler@missinglinkelectronics.com)
Received: from localhost (localhost [127.0.0.1])
	by smtp.missinglinkelectronics.com (Postfix) with ESMTP id D2E2820784
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 May 2021 15:08:58 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at missinglinkelectronics.com
Received: from smtp.missinglinkelectronics.com ([127.0.0.1])
	by localhost (mail.missinglinkelectronics.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p9iJksJM92Ia; Wed, 12 May 2021 15:08:58 +0200 (CEST)
Received: from pfanne-bionic2.mle (p578c5bfe.dip0.t-ipconnect.de [87.140.91.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: stefan)
	by smtp.missinglinkelectronics.com (Postfix) with ESMTPSA id 857D920429;
	Wed, 12 May 2021 15:08:58 +0200 (CEST)
From: "Stefan Wiehler" <stefan.wiehler@missinglinkelectronics.com>
To: openembedded-devel@lists.openembedded.org
Cc: Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>
Subject: [meta-networking][PATCH 2/2] restinio: add recipe
Date: Wed, 12 May 2021 15:08:41 +0200
Message-Id: <20210512130841.51911-2-stefan.wiehler@missinglinkelectronics.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210512130841.51911-1-stefan.wiehler@missinglinkelectronics.com>
References: <20210512130841.51911-1-stefan.wiehler@missinglinkelectronics.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Header-only C++14 library that gives you an embedded HTTP server.

Signed-off-by: Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>
---
 .../restinio/restinio_0.6.13.bb               | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/restinio/restini=
o_0.6.13.bb

diff --git a/meta-networking/recipes-connectivity/restinio/restinio_0.6.1=
3.bb b/meta-networking/recipes-connectivity/restinio/restinio_0.6.13.bb
new file mode 100644
index 000000000..ec9b056e5
--- /dev/null
+++ b/meta-networking/recipes-connectivity/restinio/restinio_0.6.13.bb
@@ -0,0 +1,31 @@
+SUMMARY =3D "Header-only C++14 library that gives you an embedded HTTP s=
erver"
+DESCRIPTION =3D "Cross-platform, efficient, customizable, and robust \
+               asynchronous HTTP/WebSocket server C++14 library with the=
 \
+               right balance between performance and ease of use"
+AUTHOR =3D "Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>"
+HOMEPAGE =3D "https://stiffstream.com/en/products/restinio.html"
+SECTION =3D "libs"
+LICENSE =3D "BSD"
+LIC_FILES_CHKSUM =3D "file://../LICENSE;md5=3Df399b62ce0a152525d1589a5a4=
0c0ff6"
+DEPENDS =3D "asio fmt http-parser"
+
+SRC_URI =3D "https://github.com/Stiffstream/restinio/releases/download/v=
.${PV}/restinio-${PV}.tar.bz2"
+SRC_URI[md5sum] =3D "37a4310e98912030a74bdd4ed789f33c"
+SRC_URI[sha256sum] =3D "b35d696e6fafd4563ca708fcecf9d0cf6705c846d417b500=
0f5252e0188848e7"
+
+S =3D "${WORKDIR}/${PN}-${PV}/dev"
+
+inherit cmake
+
+EXTRA_OECMAKE +=3D "\
+                  -DRESTINIO_TEST=3DOFF \
+                  -DRESTINIO_SAMPLE=3DOFF \
+                  -DRESTINIO_BENCH=3DOFF \
+                  -DRESTINIO_FIND_DEPS=3DON \
+                  -DRESTINIO_ALLOW_SOBJECTIZER=3DOFF \
+                  -DRESTINIO_USE_EXTERNAL_HTTP_PARSER=3DON \
+                  "
+
+# Header-only library
+RDEPENDS_${PN}-dev =3D ""
+RRECOMMENDS_${PN}-dbg =3D "${PN}-dev (=3D ${EXTENDPKGV})"
--=20
2.29.2

