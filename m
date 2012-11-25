Received: from smtpfb2-g21.free.fr ([212.27.42.10])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1TcvbR-0006GC-JZ
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Nov 2012 11:07:49 +0100
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by smtpfb2-g21.free.fr (Postfix) with ESMTP id 43117CB2CB1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Nov 2012 18:25:28 +0100 (CET)
Received: from localhost.localdomain (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id DC5EBA6217
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Nov 2012 18:25:23 +0100 (CET)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Nov 2012 18:25:07 +0100
Message-Id: <1353864310-20097-4-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1353864310-20097-1-git-send-email-eric@eukrea.com>
References: <1353864310-20097-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
Subject: [meta-webserver][PATCH 4/7] modphp: enable bz2, zip and mbstring
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
X-List-Received-Date: Mon, 26 Nov 2012 10:07:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

- bz2 and zip remove warnings in phpmyadmin
- mbstring is usefull for multibyte strings

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 meta-webserver/recipes-php/modphp/modphp5.inc      | 5 ++++-
 meta-webserver/recipes-php/modphp/modphp_5.3.19.bb | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-webserver/recipes-php/modphp/modphp5.inc b/meta-webserv=
er/recipes-php/modphp/modphp5.inc
index 1db85bf..3302936 100644
--- a/meta-webserver/recipes-php/modphp/modphp5.inc
+++ b/meta-webserver/recipes-php/modphp/modphp5.inc
@@ -1,7 +1,7 @@
 SECTION =3D "console/network"
 DESCRIPTION =3D "A server-side, HTML-embedded scripting language. This p=
ackage provides the apache php module."
 LICENSE =3D "PHP-3.0"
-DEPENDS =3D "apache2-native apache2 zlib"
+DEPENDS =3D "apache2-native apache2 zlib bzip2"
=20
 SRC_URI =3D "http://www.php.net/distributions/php-${PV}.tar.bz2 \
            file://configure.patch \
@@ -36,6 +36,9 @@ EXTRA_OECONF =3D "--with-apxs2=3D${STAGING_BINDIR_CROSS=
}/apxs \
                 --disable-rpath \
                 --libdir=3D${libdir}/php5 \
                 --with-zlib --with-zlib-dir=3D${STAGING_DIR_TARGET}${exe=
c_prefix} \
+                --with-bz2=3D${STAGING_DIR_TARGET}${exec_prefix} \
+                --enable-zip \
+                --enable-mbstring \
                 --with-config-file-path=3D${sysconfdir}/php/apache2-php5=
"
=20
 PACKAGECONFIG ??=3D ""
diff --git a/meta-webserver/recipes-php/modphp/modphp_5.3.19.bb b/meta-we=
bserver/recipes-php/modphp/modphp_5.3.19.bb
index 56599d6..ecc6e86 100644
--- a/meta-webserver/recipes-php/modphp/modphp_5.3.19.bb
+++ b/meta-webserver/recipes-php/modphp/modphp_5.3.19.bb
@@ -1,5 +1,5 @@
 include modphp5.inc
-PR =3D "r0"
+PR =3D "r1"
=20
 SRC_URI[md5sum] =3D "e1d2a3ec7849d4b3032bd1abf1916aa4"
 SRC_URI[sha256sum] =3D "814ce55b950158c4ddadbcd0b2d7d8cb4b570de4a29b9db0=
21020594e2469fd6"
--=20
1.7.11.7



