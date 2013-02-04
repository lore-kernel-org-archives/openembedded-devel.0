Received: from smtpfb2-g21.free.fr ([212.27.42.10])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1U2QHr-0002sj-SE
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Feb 2013 18:57:13 +0100
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by smtpfb2-g21.free.fr (Postfix) with ESMTP id 509A7CABF76
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Feb 2013 18:41:12 +0100 (CET)
Received: from e6520eb.local.eukrea.com (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id CEE4B4B01DA
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Feb 2013 18:41:07 +0100 (CET)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Feb 2013 18:41:06 +0100
Message-Id: <1359999666-26843-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.11.7
MIME-Version: 1.0
Subject: [RFC] php: build both php-cgi and php-fpm
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
X-List-Received-Date: Mon, 04 Feb 2013 17:57:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

- when enabling fpm, CGI is disabled, so build php-cgi first and then
reconfigure and build fpm
- php-fpm is run tested after this change
- php-cgi is only compil tested
- --enable-discard-path, --enable-fastcgi were removed as these options
are not recognized by configure :
    configure: WARNING: unrecognized options: --disable-silent-rules,
    --disable-dependency-tracking, --enable-discard-path,
    --enable-fastcgi, --enable-nls

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 meta-oe/recipes-devtools/php/php.inc | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devto=
ols/php/php.inc
index 29e82fa..e3daaa5 100644
--- a/meta-oe/recipes-devtools/php/php.inc
+++ b/meta-oe/recipes-devtools/php/php.inc
@@ -7,7 +7,7 @@ DEPENDS =3D "zlib libxml2 virtual/libiconv php-native lem=
on-native mysql5 \
            libc-client openssl sqlite3"
 DEPENDS_virtclass-native =3D "zlib-native libxml2-native"
=20
-INC_PR =3D "r4"
+INC_PR =3D "r5"
=20
 SRC_URI =3D "http://www.php.net/distributions/php-${PV}.tar.bz2"
=20
@@ -19,8 +19,8 @@ SSTATE_SCAN_FILES +=3D "build-defs.h"
=20
 # Common EXTRA_OECONF
 COMMON_EXTRA_OECONF =3D "--enable-sockets --enable-pcntl --enable-shared=
"
-EXTRA_OECONF =3D "--enable-mbstring --enable-discard-path --enable-wddx =
\
-                --enable-magic-quotes --enable-fastcgi --enable-fpm \
+EXTRA_OECONF =3D "--enable-mbstring --enable-wddx \
+                --enable-magic-quotes --enable-cgi \
                 --with-imap=3D${STAGING_DIR_HOST} \
                 --with-gettext=3D${STAGING_LIBDIR}/.. \
                 --with-imap-ssl=3D${STAGING_DIR_HOST} \
@@ -30,7 +30,7 @@ EXTRA_OECONF =3D "--enable-mbstring --enable-discard-pa=
th --enable-wddx \
                 --disable-embedded-mysqli \
                 --with-mysql=3D"${STAGING_DIR_TARGET}${prefix}" \
                 --with-mysqli=3D"${STAGING_BINDIR_CROSS}/mysql_config" \
-		--with-sqlite3=3D${STAGING_LIBDIR}/.. --enable-sqlite-utf8 \
+                --with-sqlite3=3D${STAGING_LIBDIR}/.. --enable-sqlite-ut=
f8 \
                 --with-pdo-mysql=3D"${STAGING_BINDIR_CROSS}/mysql_config=
" \
                 --with-pdo-sqlite=3D${STAGING_LIBDIR}/.. ${COMMON_EXTRA_=
OECONF} \
                "
@@ -63,6 +63,10 @@ do_install_append_pn-php-native() {
=20
 # fixme
 do_install_append_pn-php() {
+    # reconfigure to build php-fpm
+    oe_runconf --enable-fpm
+    oe_runmake 'INSTALL_ROOT=3D${D}' install
+
     install -d ${D}/${sysconfdir}/
     mv ${D}/${STAGING_DIR_NATIVE}/${sysconfdir}/* ${D}/${sysconfdir}/
     rm -rf ${D}/${TMPDIR}
--=20
1.7.11.7



