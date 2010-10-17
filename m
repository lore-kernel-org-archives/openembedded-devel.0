Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1P7SpT-0004AX-Tv
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Oct 2010 14:59:13 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id D5B0C3149F7C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Oct 2010 14:58:37 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id ObpJZmyt-3aY; Sun, 17 Oct 2010 14:58:31 +0200 (CEST)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id EB06E3149F79;
	Sun, 17 Oct 2010 14:58:29 +0200 (CEST)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Sun, 17 Oct 2010 12:58:29 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Oct 2010 12:58:21 +0000
Message-Id: <1287320301-17359-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <20101015143014.GA9736@rhein.zuhause.netz>
References: <20101015143014.GA9736@rhein.zuhause.netz>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] inherit lib_package before binconfig
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
X-List-Received-Date: Sun, 17 Oct 2010 12:59:13 -0000

* binconfig modifies FILES_${PN}-dev, but lib_package assigns this
  variable. Therefore, lib_package must be inherited before binconfig.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 recipes/confuse/confuse_2.7.bb        |    2 +-
 recipes/fltk/fltk_1.1.4.bb            |    2 +-
 recipes/gutenprint/ijs_0.35.bb        |    2 +-
 recipes/libgcrypt/libgcrypt.inc       |    2 +-
 recipes/libusb/libusb-compat_0.1.2.bb |    2 +-
 recipes/libusb/libusb-compat_0.1.3.bb |    2 +-
 recipes/libusb/libusb_0.1.12.bb       |    2 +-
 recipes/neon/neon_0.25.5.bb           |    2 +-
 recipes/neon/neon_0.29.3.bb           |    2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/recipes/confuse/confuse_2.7.bb b/recipes/confuse/confuse_2.7.bb
index 3bb57eb..64f1d43 100644
--- a/recipes/confuse/confuse_2.7.bb
+++ b/recipes/confuse/confuse_2.7.bb
@@ -5,7 +5,7 @@ SECTION = "libs"
 
 SRC_URI = "http://download.savannah.gnu.org/releases/confuse/confuse-${PV}.tar.gz \
 	  "
-inherit autotools binconfig pkgconfig lib_package
+inherit autotools lib_package binconfig pkgconfig
 
 EXTRA_OECONF = "--enable-shared"
 
diff --git a/recipes/fltk/fltk_1.1.4.bb b/recipes/fltk/fltk_1.1.4.bb
index e9927d6..6a7fdf9 100644
--- a/recipes/fltk/fltk_1.1.4.bb
+++ b/recipes/fltk/fltk_1.1.4.bb
@@ -10,7 +10,7 @@ SRC_URI = "ftp://ftp-fourier.ujf-grenoble.fr/xcas/devel/sources/fltk-${PV}-devic
 
 S = "${WORKDIR}/fltk-${PV}-Fl_Device"
 
-inherit autotools binconfig lib_package
+inherit autotools lib_package binconfig
 
 CXXFLAGS = ""
 
diff --git a/recipes/gutenprint/ijs_0.35.bb b/recipes/gutenprint/ijs_0.35.bb
index f6aec3b..5b6ccdd 100644
--- a/recipes/gutenprint/ijs_0.35.bb
+++ b/recipes/gutenprint/ijs_0.35.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.linuxprinting.org/ijs/"
 
 SRC_URI = "http://www.linuxprinting.org/ijs/download/ijs-${PV}.tar.bz2"
 
-inherit autotools pkgconfig binconfig lib_package
+inherit autotools lib_package pkgconfig binconfig
 
 EXTRA_OECONF = " --enable-shared "
 
diff --git a/recipes/libgcrypt/libgcrypt.inc b/recipes/libgcrypt/libgcrypt.inc
index f29dc8d..a3bd5bc 100644
--- a/recipes/libgcrypt/libgcrypt.inc
+++ b/recipes/libgcrypt/libgcrypt.inc
@@ -8,7 +8,7 @@ SRC_URI = "ftp://ftp.gnupg.org/gcrypt/libgcrypt/libgcrypt-${PV}.tar.gz \
            file://add-pkgconfig-support.patch \
            file://mips-h-constraint.patch"
 
-inherit autotools binconfig pkgconfig lib_package
+inherit autotools lib_package binconfig pkgconfig
 
 EXTRA_OECONF = "--without-pth --disable-asm --with-capabilities"
 
diff --git a/recipes/libusb/libusb-compat_0.1.2.bb b/recipes/libusb/libusb-compat_0.1.2.bb
index 8283251..68bde9b 100644
--- a/recipes/libusb/libusb-compat_0.1.2.bb
+++ b/recipes/libusb/libusb-compat_0.1.2.bb
@@ -11,7 +11,7 @@ DEPENDS = "libusb1"
 SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/${P}.tar.bz2"
 SRC_URI_append_nylon = " file://gcc-3-compatibility.patch"
 
-inherit autotools binconfig lib_package
+inherit autotools lib_package binconfig
 
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
 EXTRA_OECONF = "--disable-build-docs"
diff --git a/recipes/libusb/libusb-compat_0.1.3.bb b/recipes/libusb/libusb-compat_0.1.3.bb
index 0237ff4..e468a3b 100644
--- a/recipes/libusb/libusb-compat_0.1.3.bb
+++ b/recipes/libusb/libusb-compat_0.1.3.bb
@@ -14,7 +14,7 @@ SRC_URI[libusbcompat013tarbz2.sha256sum] = "a590a03b6188030ee1ca1a0af55685fcde00
 
 SRC_URI_append_nylon = " file://gcc-3-compatibility.patch"
 
-inherit autotools binconfig lib_package
+inherit autotools lib_package binconfig
 
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
 EXTRA_OECONF = "--disable-build-docs"
diff --git a/recipes/libusb/libusb_0.1.12.bb b/recipes/libusb/libusb_0.1.12.bb
index 0f224a6..66bfbeb 100644
--- a/recipes/libusb/libusb_0.1.12.bb
+++ b/recipes/libusb/libusb_0.1.12.bb
@@ -10,7 +10,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-${PV}.tar.gz \
 
 S = "${WORKDIR}/libusb-${PV}"
 
-inherit autotools pkgconfig binconfig lib_package
+inherit autotools lib_package pkgconfig binconfig
 
 PARALLEL_MAKE = ""
 EXTRA_OECONF = "--disable-build-docs"
diff --git a/recipes/neon/neon_0.25.5.bb b/recipes/neon/neon_0.25.5.bb
index e67132f..8fb68f1 100644
--- a/recipes/neon/neon_0.25.5.bb
+++ b/recipes/neon/neon_0.25.5.bb
@@ -10,7 +10,7 @@ SRC_URI = "http://www.webdav.org/${PN}/${P}.tar.gz \
            file://gnutls-force-and-detect.patch \
            file://gnutls-2.patch"
 
-inherit autotools binconfig lib_package pkgconfig
+inherit autotools lib_package binconfig pkgconfig
 
 EXTRA_OECONF = "--with-ssl=gnutls --with-libxml2 --with-expat --enable-shared --without-gssapi"
 EXTRA_AUTORECONF=" -I ${S}/macros "
diff --git a/recipes/neon/neon_0.29.3.bb b/recipes/neon/neon_0.29.3.bb
index e182d55..acfc6be 100644
--- a/recipes/neon/neon_0.29.3.bb
+++ b/recipes/neon/neon_0.29.3.bb
@@ -8,7 +8,7 @@ DEFAULT_PREFERENCE = "-1"
 
 SRC_URI = "http://www.webdav.org/${PN}/${P}.tar.gz"
 
-inherit autotools binconfig lib_package pkgconfig
+inherit autotools lib_package binconfig pkgconfig
 
 EXTRA_OECONF = "--with-ssl=gnutls --with-libxml2 --with-expat --enable-shared"
 EXTRA_AUTORECONF=" -I ${S}/macros "
-- 
1.7.1



