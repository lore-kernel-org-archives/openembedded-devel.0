Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C3DEC18E7C
	for <webhook@archiver.kernel.org>; Wed, 26 Feb 2025 15:50:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.8944.1740585036487739321
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Feb 2025 07:50:36 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C3C61516
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 07:50:52 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D0EB73F673
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 07:50:35 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2 16/23] neon: use gettext class
Date: Wed, 26 Feb 2025 15:50:13 +0000
Message-ID: <20250226155022.1989209-16-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250226155022.1989209-1-ross.burton@arm.com>
References: <20250226155022.1989209-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 15:50:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115668

Just use the gettext class to simplify the enable/disabling of NLS
support.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-support/neon/neon_0.33.0.bb | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-support/neon/neon_0.33.0.bb b/meta-oe/recipe=
s-support/neon/neon_0.33.0.bb
index 0b8bee0efe..4c6ed00827 100644
--- a/meta-oe/recipes-support/neon/neon_0.33.0.bb
+++ b/meta-oe/recipes-support/neon/neon_0.33.0.bb
@@ -13,21 +13,19 @@ SRC_URI =3D "${DEBIAN_MIRROR}/main/n/neon27/neon27_${=
PV}.orig.tar.gz \
=20
 SRC_URI[sha256sum] =3D "659a5cc9cea05e6e7864094f1e13a77abbbdbab452f04d75=
1a8c16a9447cf4b8"
=20
-inherit autotools-brokensep binconfig-disabled lib_package pkgconfig pte=
st
+inherit autotools-brokensep binconfig-disabled lib_package pkgconfig pte=
st gettext
=20
 EXTRA_AUTORECONF +=3D "-I macros"
=20
 # Enable gnutls or openssl, not both
-PACKAGECONFIG ?=3D "expat gnutls libproxy webdav zlib nls"
-PACKAGECONFIG:class-native =3D "expat gnutls webdav zlib nls"
-PACKAGECONFIG:remove:libc-musl =3D "nls"
+PACKAGECONFIG ?=3D "expat gnutls libproxy webdav zlib"
+PACKAGECONFIG:class-native =3D "expat gnutls webdav zlib"
=20
 PACKAGECONFIG[expat] =3D "--with-expat,--without-expat,expat"
 PACKAGECONFIG[gnutls] =3D "--with-ssl=3Dgnutls,,gnutls"
 PACKAGECONFIG[gssapi] =3D "--with-gssapi,--without-gssapi,krb5"
 PACKAGECONFIG[libproxy] =3D "--with-libproxy,--without-libproxy,libproxy=
"
 PACKAGECONFIG[libxml2] =3D "--with-libxml2,--without-libxml2,libxml2"
-PACKAGECONFIG[nls] =3D ",--disable-nls,gettext-native"
 PACKAGECONFIG[openssl] =3D "--with-ssl=3Dopenssl,,openssl"
 PACKAGECONFIG[webdav] =3D "--enable-webdav,--disable-webdav,"
 PACKAGECONFIG[zlib] =3D "--with-zlib,--without-zlib,zlib"
@@ -42,7 +40,7 @@ do_configure:prepend() {
 }
=20
 do_compile:append() {
-    if ${@bb.utils.contains('PACKAGECONFIG', 'nls', 'true', 'false', d)}=
; then
+    if ${@bb.utils.contains('USE_NLS', 'yes', 'true', 'false', d)}; then
         oe_runmake compile-gmo
     fi
     oe_runmake -C test
--=20
2.43.0


