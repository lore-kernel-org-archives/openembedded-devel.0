Received: from smtpfb1-g21.free.fr ([212.27.42.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1Tcvd9-0006kX-HB
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Nov 2012 11:09:38 +0100
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by smtpfb1-g21.free.fr (Postfix) with ESMTP id 2D18F2C986
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Nov 2012 18:25:34 +0100 (CET)
Received: from localhost.localdomain (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id C4AA9A621D
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Nov 2012 18:25:30 +0100 (CET)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Nov 2012 18:25:09 +0100
Message-Id: <1353864310-20097-6-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1353864310-20097-1-git-send-email-eric@eukrea.com>
References: <1353864310-20097-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
Subject: [meta-webserver][PATCH 6/7] php: enable gettext and sqlite
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Nov 2012 10:09:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 meta-oe/recipes-devtools/php/php.inc | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devto=
ols/php/php.inc
index 03b7b40..10dc154 100644
--- a/meta-oe/recipes-devtools/php/php.inc
+++ b/meta-oe/recipes-devtools/php/php.inc
@@ -4,16 +4,16 @@ SECTION =3D "console/network"
 LICENSE =3D "PHP-3.0"
 BBCLASSEXTEND =3D "native"
 DEPENDS =3D "zlib libxml2 virtual/libiconv php-native lemon-native mysql=
5 \
-           libc-client openssl"
+           libc-client openssl sqlite3"
 DEPENDS_virtclass-native =3D "zlib-native libxml2-native"
=20
-INC_PR =3D "r0"
+INC_PR =3D "r1"
=20
 SRC_URI =3D "http://www.php.net/distributions/php-${PV}.tar.bz2"
=20
 S =3D "${WORKDIR}/php-${PV}"
=20
-inherit autotools pkgconfig pythonnative
+inherit autotools pkgconfig pythonnative gettext
=20
 SSTATE_SCAN_FILES +=3D "build-defs.h"
=20
@@ -22,6 +22,7 @@ COMMON_EXTRA_OECONF =3D "--enable-sockets --enable-pcnt=
l --enable-shared"
 EXTRA_OECONF =3D "--enable-mbstring --enable-discard-path --enable-wddx =
\
                 --enable-magic-quotes --enable-fastcgi \
                 --with-imap=3D${STAGING_DIR_HOST} \
+                --with-gettext=3D${STAGING_LIBDIR}/.. \
                 --with-imap-ssl=3D${STAGING_DIR_HOST} \
                 --with-zlib --with-zlib-dir=3D${STAGING_LIBDIR}/.. \
                 --with-iconv=3D${STAGING_LIBDIR}/.. \
@@ -29,8 +30,9 @@ EXTRA_OECONF =3D "--enable-mbstring --enable-discard-pa=
th --enable-wddx \
                 --disable-embedded-mysqli \
                 --with-mysql=3D"${STAGING_DIR_TARGET}${prefix}" \
                 --with-mysqli=3D"${STAGING_BINDIR_CROSS}/mysql_config" \
+		--with-sqlite3=3D${STAGING_LIBDIR}/.. --enable-sqlite-utf8 \
                 --with-pdo-mysql=3D"${STAGING_BINDIR_CROSS}/mysql_config=
" \
-                --without-pdo-sqlite ${COMMON_EXTRA_OECONF} \
+                --with-pdo-sqlite=3D${STAGING_LIBDIR}/.. ${COMMON_EXTRA_=
OECONF} \
                "
 EXTRA_OECONF_virtclass-native =3D "--with-cgi --without-libpng --without=
-libjpeg \
                 --with-zlib --with-zlib-dir=3D${STAGING_LIBDIR_NATIVE}/.=
. \
--=20
1.7.11.7



