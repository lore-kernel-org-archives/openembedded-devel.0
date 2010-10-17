Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1P7TJE-0007YR-8R
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Oct 2010 15:29:57 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 705863149EF4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Oct 2010 15:29:24 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id z8rOeCsOHyTI; Sun, 17 Oct 2010 15:29:16 +0200 (CEST)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 9C15E3149EF9;
	Sun, 17 Oct 2010 15:29:15 +0200 (CEST)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Sun, 17 Oct 2010 13:29:15 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Oct 2010 13:29:09 +0000
Message-Id: <1287322149-3526-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1287320301-17359-1-git-send-email-obi@opendreambox.org>
References: <1287320301-17359-1-git-send-email-obi@opendreambox.org>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v2] inherit lib_package before binconfig
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
X-List-Received-Date: Sun, 17 Oct 2010 13:29:57 -0000

* binconfig modifies FILES_${PN}-dev, but lib_package assigns this
  variable. Therefore, lib_package must be inherited before binconfig.
* v2: bump PRs

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 recipes/confuse/confuse_2.7.bb        |    3 ++-
 recipes/fltk/fltk_1.1.4.bb            |    4 ++--
 recipes/gutenprint/ijs_0.35.bb        |    3 ++-
 recipes/libgcrypt/libgcrypt.inc       |    3 ++-
 recipes/libgcrypt/libgcrypt_1.2.4.bb  |    2 +-
 recipes/libgcrypt/libgcrypt_1.4.0.bb  |    2 +-
 recipes/libgcrypt/libgcrypt_1.4.1.bb  |    1 +
 recipes/libusb/libusb-compat_0.1.2.bb |    4 ++--
 recipes/libusb/libusb-compat_0.1.3.bb |    4 ++--
 recipes/libusb/libusb_0.1.12.bb       |    4 ++--
 recipes/neon/neon_0.25.5.bb           |    4 ++--
 recipes/neon/neon_0.29.3.bb           |    4 ++--
 12 files changed, 21 insertions(+), 17 deletions(-)

diff --git a/recipes/confuse/confuse_2.7.bb b/recipes/confuse/confuse_2.7.bb
index 3bb57eb..8cf837a 100644
--- a/recipes/confuse/confuse_2.7.bb
+++ b/recipes/confuse/confuse_2.7.bb
@@ -2,10 +2,11 @@ DESCRIPTION = "Library for parsing configuration files."
 HOMEPAGE = "http://www.nongnu.org/confuse/"
 LICENSE = "LGPL"
 SECTION = "libs"
+PR = "r1"
 
 SRC_URI = "http://download.savannah.gnu.org/releases/confuse/confuse-${PV}.tar.gz \
 	  "
-inherit autotools binconfig pkgconfig lib_package
+inherit autotools lib_package binconfig pkgconfig
 
 EXTRA_OECONF = "--enable-shared"
 
diff --git a/recipes/fltk/fltk_1.1.4.bb b/recipes/fltk/fltk_1.1.4.bb
index e9927d6..c48d6e2 100644
--- a/recipes/fltk/fltk_1.1.4.bb
+++ b/recipes/fltk/fltk_1.1.4.bb
@@ -4,13 +4,13 @@ SECTION = "libs"
 PRIORITY = "optional"
 LICENSE = "LGPL"
 DEPENDS = "jpeg libpng virtual/libgl zlib"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "ftp://ftp-fourier.ujf-grenoble.fr/xcas/devel/sources/fltk-${PV}-device.tar.gz"
 
 S = "${WORKDIR}/fltk-${PV}-Fl_Device"
 
-inherit autotools binconfig lib_package
+inherit autotools lib_package binconfig
 
 CXXFLAGS = ""
 
diff --git a/recipes/gutenprint/ijs_0.35.bb b/recipes/gutenprint/ijs_0.35.bb
index f6aec3b..948dd94 100644
--- a/recipes/gutenprint/ijs_0.35.bb
+++ b/recipes/gutenprint/ijs_0.35.bb
@@ -1,10 +1,11 @@
 DESCRIPTION = "Inkjet driver from linuxprinting.org"
 LICENSE = "MIT"
 HOMEPAGE = "http://www.linuxprinting.org/ijs/"
+PR = "r1"
 
 SRC_URI = "http://www.linuxprinting.org/ijs/download/ijs-${PV}.tar.bz2"
 
-inherit autotools pkgconfig binconfig lib_package
+inherit autotools lib_package pkgconfig binconfig
 
 EXTRA_OECONF = " --enable-shared "
 
diff --git a/recipes/libgcrypt/libgcrypt.inc b/recipes/libgcrypt/libgcrypt.inc
index f29dc8d..2a01e04 100644
--- a/recipes/libgcrypt/libgcrypt.inc
+++ b/recipes/libgcrypt/libgcrypt.inc
@@ -3,12 +3,13 @@ SECTION = "libs"
 PRIORITY = "optional"
 LICENSE = "GPL LGPL FDL"
 DEPENDS = "libgpg-error"
+INC_PR = "r4"
 
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/libgcrypt/libgcrypt-${PV}.tar.gz \
            file://add-pkgconfig-support.patch \
            file://mips-h-constraint.patch"
 
-inherit autotools binconfig pkgconfig lib_package
+inherit autotools lib_package binconfig pkgconfig
 
 EXTRA_OECONF = "--without-pth --disable-asm --with-capabilities"
 
diff --git a/recipes/libgcrypt/libgcrypt_1.2.4.bb b/recipes/libgcrypt/libgcrypt_1.2.4.bb
index 2241e65..3db5486 100644
--- a/recipes/libgcrypt/libgcrypt_1.2.4.bb
+++ b/recipes/libgcrypt/libgcrypt_1.2.4.bb
@@ -1,6 +1,6 @@
 require libgcrypt.inc
 
-PR = "r2"
+PR = "${INC_PR}.0"
 
 SRC_URI[md5sum] = "be20ee47778ff90703afd58c090f07b9"
 SRC_URI[sha256sum] = "cf3c3f313ebeb9165d80439beaeb7f621b73856a2159e4b84c70f32b455fd9ec"
diff --git a/recipes/libgcrypt/libgcrypt_1.4.0.bb b/recipes/libgcrypt/libgcrypt_1.4.0.bb
index efd48d8..b71e10b 100644
--- a/recipes/libgcrypt/libgcrypt_1.4.0.bb
+++ b/recipes/libgcrypt/libgcrypt_1.4.0.bb
@@ -1,6 +1,6 @@
 require libgcrypt.inc
 
-PR = "r3"
+PR = "${INC_PR}.0"
 
 SRC_URI[md5sum] = "4f80e46b38a71767479a3d953af22bdd"
 SRC_URI[sha256sum] = "14d457c3ed1d4751664f7196cbcd20e7db82532025f35634812f0cb7470fc43e"
diff --git a/recipes/libgcrypt/libgcrypt_1.4.1.bb b/recipes/libgcrypt/libgcrypt_1.4.1.bb
index bb7457d..64e14a4 100644
--- a/recipes/libgcrypt/libgcrypt_1.4.1.bb
+++ b/recipes/libgcrypt/libgcrypt_1.4.1.bb
@@ -1,5 +1,6 @@
 require libgcrypt.inc
 
+PR = "${INC_PR}.0"
 
 SRC_URI[md5sum] = "555488ddfc81a6e0df1fb5112e7eee13"
 SRC_URI[sha256sum] = "7562042a6210947363bd6a9bbcdd03f8d02470c0347970b507f689d25a907844"
diff --git a/recipes/libusb/libusb-compat_0.1.2.bb b/recipes/libusb/libusb-compat_0.1.2.bb
index 8283251..19f5709 100644
--- a/recipes/libusb/libusb-compat_0.1.2.bb
+++ b/recipes/libusb/libusb-compat_0.1.2.bb
@@ -4,14 +4,14 @@ SECTION = "libs"
 LICENSE = "LGPLv2.1"
 PROVIDES = "virtual/libusb0"
 PE = "1"
-PR = "r0"
+PR = "r1"
 
 DEPENDS = "libusb1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/${P}.tar.bz2"
 SRC_URI_append_nylon = " file://gcc-3-compatibility.patch"
 
-inherit autotools binconfig lib_package
+inherit autotools lib_package binconfig
 
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
 EXTRA_OECONF = "--disable-build-docs"
diff --git a/recipes/libusb/libusb-compat_0.1.3.bb b/recipes/libusb/libusb-compat_0.1.3.bb
index 0237ff4..ed30b51 100644
--- a/recipes/libusb/libusb-compat_0.1.3.bb
+++ b/recipes/libusb/libusb-compat_0.1.3.bb
@@ -4,7 +4,7 @@ SECTION = "libs"
 LICENSE = "LGPLv2.1"
 PROVIDES = "virtual/libusb0"
 PE = "1"
-PR = "r0"
+PR = "r1"
 
 DEPENDS = "libusb1"
 
@@ -14,7 +14,7 @@ SRC_URI[libusbcompat013tarbz2.sha256sum] = "a590a03b6188030ee1ca1a0af55685fcde00
 
 SRC_URI_append_nylon = " file://gcc-3-compatibility.patch"
 
-inherit autotools binconfig lib_package
+inherit autotools lib_package binconfig
 
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
 EXTRA_OECONF = "--disable-build-docs"
diff --git a/recipes/libusb/libusb_0.1.12.bb b/recipes/libusb/libusb_0.1.12.bb
index 0f224a6..8ea926b 100644
--- a/recipes/libusb/libusb_0.1.12.bb
+++ b/recipes/libusb/libusb_0.1.12.bb
@@ -3,14 +3,14 @@ HOMEPAGE = "http://libusb.sf.net"
 SECTION = "libs"
 LICENSE = "LGPLv2.1"
 PROVIDES = "virtual/libusb0"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-${PV}.tar.gz \
 	   file://configure_fix.patch"
 
 S = "${WORKDIR}/libusb-${PV}"
 
-inherit autotools pkgconfig binconfig lib_package
+inherit autotools lib_package pkgconfig binconfig
 
 PARALLEL_MAKE = ""
 EXTRA_OECONF = "--disable-build-docs"
diff --git a/recipes/neon/neon_0.25.5.bb b/recipes/neon/neon_0.25.5.bb
index e67132f..971a71d 100644
--- a/recipes/neon/neon_0.25.5.bb
+++ b/recipes/neon/neon_0.25.5.bb
@@ -4,13 +4,13 @@ SECTION = "libs"
 LICENSE = "LGPL"
 DEPENDS = "zlib libxml2 expat time gnutls"
 
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "http://www.webdav.org/${PN}/${P}.tar.gz \
            file://gnutls-force-and-detect.patch \
            file://gnutls-2.patch"
 
-inherit autotools binconfig lib_package pkgconfig
+inherit autotools lib_package binconfig pkgconfig
 
 EXTRA_OECONF = "--with-ssl=gnutls --with-libxml2 --with-expat --enable-shared --without-gssapi"
 EXTRA_AUTORECONF=" -I ${S}/macros "
diff --git a/recipes/neon/neon_0.29.3.bb b/recipes/neon/neon_0.29.3.bb
index e182d55..e69bff7 100644
--- a/recipes/neon/neon_0.29.3.bb
+++ b/recipes/neon/neon_0.29.3.bb
@@ -2,13 +2,13 @@ DESCRIPTION = "neon is an HTTP and WebDAV client library, with a C interface."
 SECTION = "libs"
 LICENSE = "LGPL"
 DEPENDS = "zlib libxml2 expat time gnutls"
-PR = "r2"
+PR = "r3"
 
 DEFAULT_PREFERENCE = "-1"
 
 SRC_URI = "http://www.webdav.org/${PN}/${P}.tar.gz"
 
-inherit autotools binconfig lib_package pkgconfig
+inherit autotools lib_package binconfig pkgconfig
 
 EXTRA_OECONF = "--with-ssl=gnutls --with-libxml2 --with-expat --enable-shared"
 EXTRA_AUTORECONF=" -I ${S}/macros "
-- 
1.7.1



