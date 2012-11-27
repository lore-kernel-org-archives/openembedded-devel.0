Received: from 7.mo2.mail-out.ovh.net ([188.165.48.182]
	helo=mo2.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1TdPHd-0006N0-D5
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Nov 2012 18:49:21 +0100
Received: from mail190.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo2.mail-out.ovh.net (Postfix) with SMTP id 4DB16DC6EA6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2012 17:24:21 +0100 (CET)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 27 Nov 2012 18:16:21 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	buildor.local.eukrea.com) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 27 Nov 2012 18:16:18 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
X-Ovh-Mailout: 178.32.228.2 (mo2.mail-out.ovh.net)
Date: Tue, 27 Nov 2012 17:16:41 +0100
Message-Id: <1354033003-31657-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
X-Ovh-Tracer-Id: 16668385172897967433
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: 0
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehhedrtdduucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecunecuhfhrohhmpefgrhhitgcuueornhgrrhguuceovghrihgtsegvuhhkrhgvrgdrtghomheqnecuffhomhgrihhnpehphhhprdhnvghtnecujfgurhephffvufffkffogggtgfesthekredtredtje
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehhedrtdduucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecunecuhfhrohhmpefgrhhitgcuueornhgrrhguuceovghrihgtsegvuhhkrhgvrgdrtghomheqnecuffhomhgrihhnpehphhhprdhnvghtnecujfgurhephffvufffkffogggtgfesthekredtredtje
Subject: [meta-oe][PATCH 1/3] php: upgrade to 5.3.19
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
X-List-Received-Date: Tue, 27 Nov 2012 17:49:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 meta-oe/recipes-devtools/php/php.inc         |    4 ++--
 meta-oe/recipes-devtools/php/php/iconv.patch |   26 +++++++++++++-------=
------
 meta-oe/recipes-devtools/php/php_5.3.19.bb   |   19 +++++++++++++++++++
 meta-oe/recipes-devtools/php/php_5.3.6.bb    |   19 -------------------
 4 files changed, 34 insertions(+), 34 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/php/php_5.3.19.bb
 delete mode 100644 meta-oe/recipes-devtools/php/php_5.3.6.bb

diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devto=
ols/php/php.inc
index 87eb4b1..03b7b40 100644
--- a/meta-oe/recipes-devtools/php/php.inc
+++ b/meta-oe/recipes-devtools/php/php.inc
@@ -1,13 +1,13 @@
 DESCRIPTION =3D "A server-side, HTML-embedded scripting language. This p=
ackage provides the CGI."
 HOMEPAGE =3D "http://www.php.net"
 SECTION =3D "console/network"
-LICENSE =3D "PHP"
+LICENSE =3D "PHP-3.0"
 BBCLASSEXTEND =3D "native"
 DEPENDS =3D "zlib libxml2 virtual/libiconv php-native lemon-native mysql=
5 \
            libc-client openssl"
 DEPENDS_virtclass-native =3D "zlib-native libxml2-native"
=20
-INC_PR =3D "r2"
+INC_PR =3D "r0"
=20
 SRC_URI =3D "http://www.php.net/distributions/php-${PV}.tar.bz2"
=20
diff --git a/meta-oe/recipes-devtools/php/php/iconv.patch b/meta-oe/recip=
es-devtools/php/php/iconv.patch
index 66b39cc..f3d2a16 100644
--- a/meta-oe/recipes-devtools/php/php/iconv.patch
+++ b/meta-oe/recipes-devtools/php/php/iconv.patch
@@ -1,21 +1,21 @@
-Index: php-5.2.13/acinclude.m4
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- php-5.2.13.orig/acinclude.m4
-+++ php-5.2.13/acinclude.m4
-@@ -2430,7 +2430,8 @@ AC_DEFUN([PHP_SETUP_ICONV], [
-   dnl
+diff --git a/acinclude.m4 b/acinclude.m4
+index 4c28b80..d6491a1 100644
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -2439,7 +2439,8 @@ AC_DEFUN([PHP_SETUP_ICONV], [
    dnl Check libc first if no path is provided in --with-iconv
    dnl
+=20
 -  if test "$PHP_ICONV" =3D "yes"; then
 +  dnl must check against no, not against yes as PHP_ICONV can also incl=
ude a path, which implies yes
 +  if test "$PHP_ICONV" !=3D "no"; then
-     AC_CHECK_FUNC(iconv, [
-       found_iconv=3Dyes
-     ],[
-Index: php-5.2.13/ext/iconv/config.m4
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- php-5.2.13.orig/ext/iconv/config.m4
-+++ php-5.2.13/ext/iconv/config.m4
+     dnl Reset LIBS temporarily as it may have already been included
+     dnl -liconv in.
+     LIBS_save=3D"$LIBS"
+diff --git a/ext/iconv/config.m4 b/ext/iconv/config.m4
+index d673b0a..1fbef13 100644
+--- a/ext/iconv/config.m4
++++ b/ext/iconv/config.m4
 @@ -15,7 +15,7 @@ if test "$PHP_ICONV" !=3D "no"; then
 =20
    if test "$iconv_avail" !=3D "no"; then
diff --git a/meta-oe/recipes-devtools/php/php_5.3.19.bb b/meta-oe/recipes=
-devtools/php/php_5.3.19.bb
new file mode 100644
index 0000000..e96b760
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php_5.3.19.bb
@@ -0,0 +1,19 @@
+require php.inc
+
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dcb564efdf78cce8ea6e4b5a4f7c05=
d97"
+
+PR =3D "${INC_PR}.0"
+
+SRC_URI +=3D "file://acinclude-xml2-config.patch \
+            file://php-m4-divert.patch \
+            file://0001-php-don-t-use-broken-wrapper-for-mkdir.patch"
+
+SRC_URI_append_pn-php +=3D "file://iconv.patch \
+            file://imap-fix-autofoo.patch \
+            file://pear-makefile.patch \
+            file://phar-makefile.patch \
+            file://php_exec_native.patch \
+            "
+
+SRC_URI[md5sum] =3D "e1d2a3ec7849d4b3032bd1abf1916aa4"
+SRC_URI[sha256sum] =3D "814ce55b950158c4ddadbcd0b2d7d8cb4b570de4a29b9db0=
21020594e2469fd6"
diff --git a/meta-oe/recipes-devtools/php/php_5.3.6.bb b/meta-oe/recipes-=
devtools/php/php_5.3.6.bb
deleted file mode 100644
index 9524bd9..0000000
--- a/meta-oe/recipes-devtools/php/php_5.3.6.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-require php.inc
-
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dcb564efdf78cce8ea6e4b5a4f7c05=
d97"
-
-PR =3D "${INC_PR}.0"
-
-SRC_URI +=3D "file://acinclude-xml2-config.patch \
-            file://php-m4-divert.patch \
-            file://0001-php-don-t-use-broken-wrapper-for-mkdir.patch"
-
-SRC_URI_append_pn-php +=3D "file://iconv.patch \
-            file://imap-fix-autofoo.patch \
-            file://pear-makefile.patch \
-            file://phar-makefile.patch \
-            file://php_exec_native.patch \
-            "
-
-SRC_URI[md5sum] =3D "2286f5a82a6e8397955a0025c1c2ad98"
-SRC_URI[sha256sum] =3D "30ae880f22e3ee93eccc9b80e3c58b0d6364d139bb4366dc=
c27f2fab658d3198"
--=20
1.7.10.4



