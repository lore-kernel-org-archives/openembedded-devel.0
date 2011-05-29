Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QQlYF-0007YZ-F9
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 May 2011 21:21:27 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so2510774fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 May 2011 12:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=7wZ7FOkjNXq6Av5//WDUIVej/+vIrbTiggieWZqgKc0=;
	b=vIO7oBs/mai7Tvqqy4jwrLox8g7ha2N55DLn/mDucUNhpmZTQPEAh9Oyy6KpA+EHlI
	r80ho66KJ93a7VgISlWtRa9y0FZ6t0gX0tOzvqxWgNzUeWNKiwA5MBG1eNv9gXJai9SL
	Hnkdoy7X8oxIMRC8UUFIv6JzfGHJE5bjy+jlQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=L38F5/VmPiiZhXFpYof7bhiTgfxkIarBiWJf0k0Ttn8XFNUBUNlY3v8nAjaOogS8ZW
	oKaLCkwLgZDie0qFY1mNncgs5ae5qF7ROHXLTaVwojUR4xl8rzs9Z7r3P7Cv4SSIo4Km
	L0be+kwPT6ASy5hTp7QTRbzotw8EvZT+1dSOw=
Received: by 10.223.25.201 with SMTP id a9mr1125319fac.141.1306696698943;
	Sun, 29 May 2011 12:18:18 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id a18sm498589fak.5.2011.05.29.12.18.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 May 2011 12:18:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 May 2011 21:17:21 +0200
Message-Id: <d7dee6094b523bc3962599e7aa4b096d29c06547.1306696348.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
In-Reply-To: <e6bbc59f3f64c410233cb840174a8972d4ac1664.1306696348.git.Martin.Jansa@gmail.com>
References: <e6bbc59f3f64c410233cb840174a8972d4ac1664.1306696348.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1306696348.git.Martin.Jansa@gmail.com>
References: <cover.1306696348.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 11/16] imagemagick: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
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
X-List-Received-Date: Sun, 29 May 2011 19:21:27 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../imagemagick-6.4.4/PerlMagic_MakePatch.patch    |   11 ++++++
 .../imagemagick/imagemagick_6.4.4.bb               |   34 ++++++++++++++++++++
 2 files changed, 45 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick-6.4.4/PerlMagic_MakePatch.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick_6.4.4.bb

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick-6.4.4/PerlMagic_MakePatch.patch b/meta-oe/recipes-support/imagemagick/imagemagick-6.4.4/PerlMagic_MakePatch.patch
new file mode 100644
index 0000000..f8ad0af
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick-6.4.4/PerlMagic_MakePatch.patch
@@ -0,0 +1,11 @@
+--- /tmp/Makefile.PL.in	2008-10-01 10:39:38.000000000 +0200
++++ ImageMagick-6.4.4/PerlMagick/Makefile.PL.in	2008-10-01 10:40:25.000000000 +0200
+@@ -87,6 +87,8 @@
+ 
+    # Use same compiler as ImageMagick
+    'PERLMAINCC'	=> '@PERLMAINCC@ @OPENMP_CFLAGS@',
++   'AR' => '@AR@',
++   'LD' => '@PERLMAINCC@',
+ 
+    # Set Perl installation prefix to ImageMagick installation prefix
+ #   'PREFIX'	=> '@prefix@',
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_6.4.4.bb b/meta-oe/recipes-support/imagemagick/imagemagick_6.4.4.bb
new file mode 100644
index 0000000..40f9736
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_6.4.4.bb
@@ -0,0 +1,34 @@
+DESCRIPTION = "ImageMagick is an image convertion tools"
+SECTION = "console/utils"
+LICENSE = "ImageMagick"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e1ebcc1358b9f81eba64255fc5da6892"
+# FIXME: There is much more checked libraries. All should be added or explicitly disabled to get consistent results.
+DEPENDS = "lcms bzip2 jpeg libpng librsvg tiff zlib"
+
+PR = "r7"
+
+PATCHSET = "1"
+SRC_URI = "ftp://ftp.nluug.nl/pub/ImageMagick/ImageMagick-${PV}-${PATCHSET}.tar.bz2 \
+           file://PerlMagic_MakePatch.patch \
+          "
+SRC_URI[md5sum] = "882ff241f6ad39655541d5055596f93b"
+SRC_URI[sha256sum] = "5a5b2779707bfd9816cf17d8f53d242c05005092da192a898ac10961b3b19dda"
+
+S = "${WORKDIR}/ImageMagick-${PV}"
+
+inherit autotools binconfig pkgconfig
+
+EXTRA_OECONF = "--program-prefix= --without-x --without-freetype --without-perl --disable-openmp"
+
+FILES_${PN} += "${libdir}/ImageMagick-${IMVER}/modules-Q16/*/*.so \
+                ${libdir}/ImageMagick-${IMVER}/modules-Q16/*/*.la \
+                ${libdir}/ImageMagick-${IMVER}/config/ \
+                ${datadir}/ImageMagick-${IMVER}"
+
+FILES_${PN}-dev += "${libdir}/ImageMagick-${IMVER}/modules-Q16/*/*.a"
+
+FILES_${PN}-dbg += "${libdir}/ImageMagick-${IMVER}/modules-Q16/*/.debug/*"
+
+BBCLASSEXTEND = "native"
+
+LEAD_SONAME = "libMagickCore.so.*"
-- 
1.7.5.rc3



