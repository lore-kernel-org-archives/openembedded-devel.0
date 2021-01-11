Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.32448.1610365122345079094
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Jan 2021 03:38:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC9BB31B
	for <openembedded-devel@lists.openembedded.org>; Mon, 11 Jan 2021 03:38:41 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 98A2C3F719
	for <openembedded-devel@lists.openembedded.org>; Mon, 11 Jan 2021 03:38:41 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] libmicrohttpd: allow native/nativesdk builds
Date: Mon, 11 Jan 2021 11:38:37 +0000
Message-Id: <20210111113837.62507-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-support/libmicrohttpd/libmicrohttpd_0.9.72.bb    | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.72.b=
b b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.72.bb
index 24677386f9..66c48da3b7 100644
--- a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.72.bb
+++ b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.72.bb
@@ -6,8 +6,7 @@ SECTION =3D "net"
=20
 DEPENDS =3D "file"
=20
-SRC_URI =3D "${GNU_MIRROR}/libmicrohttpd/${BPN}-${PV}.tar.gz \
-"
+SRC_URI =3D "${GNU_MIRROR}/libmicrohttpd/${BPN}-${PV}.tar.gz"
 SRC_URI[md5sum] =3D "2a286193af88ab2ae3149748d4b46187"
 SRC_URI[sha256sum] =3D "0ae825f8e0d7f41201fd44a0df1cf454c1cb0bc50fe9d59c=
26552260264c2ff8"
=20
@@ -28,3 +27,5 @@ PACKAGECONFIG[https] =3D "--enable-https,--disable-http=
s,libgcrypt gnutls,"
 do_compile_append() {
     sed -i s:-L${STAGING_LIBDIR}::g libmicrohttpd.pc
 }
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1

