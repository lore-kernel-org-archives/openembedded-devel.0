Received: from 2.mo2.mail-out.ovh.net ([188.165.53.149]
	helo=mo2.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1TdOBs-0004UG-Ro
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Nov 2012 17:39:21 +0100
Received: from mail190.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo2.mail-out.ovh.net (Postfix) with SMTP id DF95EDC7EE8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2012 17:24:24 +0100 (CET)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 27 Nov 2012 18:16:25 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	buildor.local.eukrea.com) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 27 Nov 2012 18:16:19 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
X-Ovh-Mailout: 178.32.228.2 (mo2.mail-out.ovh.net)
Date: Tue, 27 Nov 2012 17:16:42 +0100
Message-Id: <1354033003-31657-2-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1354033003-31657-1-git-send-email-eric@eukrea.com>
References: <1354033003-31657-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 16668666647874678090
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: 0
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehhedrtdduucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecunecuhfhrohhmpefgrhhitgcuueornhgrrhguuceovghrihgtsegvuhhkrhgvrgdrtghomheqnecuffhomhgrihhnpehphhhprdhnvghtnecujfgurhephffvufffkffojghfgggtgfesthekredtredtje
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehhedrtdduucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecunecuhfhrohhmpefgrhhitgcuueornhgrrhguuceovghrihgtsegvuhhkrhgvrgdrtghomheqnecuffhomhgrihhnpehphhhprdhnvghtnecujfgurhephffvufffkffojghfgggtgfesthekredtredtje
Subject: [meta-oe][PATCH 2/3] php: enable gettext and sqlite
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
X-List-Received-Date: Tue, 27 Nov 2012 16:39:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 meta-oe/recipes-devtools/php/php.inc |   10 ++++++----
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
1.7.10.4



