Received: from mail-ee0-f51.google.com ([74.125.83.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tmkoh-00019w-LN
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2012 13:38:08 +0100
Received: by mail-ee0-f51.google.com with SMTP id d4so3104756eek.38
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2012 04:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=NWbeymOO0gUe6RTNq3veB2H34JxB+yummsh8rhqx94A=;
	b=DhVg2zrYa+PCmpU92CSb2SmXsuvJKUQ1LAlj6mds+OTuVZfx19wneJB9zRk07yVNjb
	ReI3SWChoccCkHpskOl4aFKFrKOqKxkMXGdsraRSSVHYCtgcNm2Z2kl9L3I7ovlUaNSZ
	0NKBGC/tv4ubWnpdTlnODPBoecS6QBAI5OY6MEkcsNyD+JpgNMfbIUav79CIp63VV2/K
	Pdzpxu4aEWmCIhdq0THT9vPmq+2RbGrN0Lw3URwB9889UuxaHoqv84E0bXXs5GuusIsQ
	Z1/5v85WeW3ejhur18ZF8uEj0+9+pnXgAz83M9w0LGym9j9upwYjI76X7Tkbx8fMJVo2
	cHhw==
X-Received: by 10.14.215.6 with SMTP id d6mr47778727eep.40.1356265399351;
	Sun, 23 Dec 2012 04:23:19 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id f49sm34555355eep.12.2012.12.23.04.23.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Dec 2012 04:23:18 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2012 13:21:34 +0100
Message-Id: <f7b703f4af4bbadb48e26ea93e54a91f00cb1a57.1356264861.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1356264861.git.Martin.Jansa@gmail.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1356264861.git.Martin.Jansa@gmail.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 09/30] fltk: fix build with libpng-1.5 from oe-core
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
X-List-Received-Date: Sun, 23 Dec 2012 12:38:08 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../fltk/fltk-1.1.10/libpng15.patch                | 61 ++++++++++++++++++++++
 meta-oe/recipes-support/fltk/fltk_1.1.10.bb        |  3 ++
 2 files changed, 64 insertions(+)
 create mode 100644 meta-oe/recipes-support/fltk/fltk-1.1.10/libpng15.patch

diff --git a/meta-oe/recipes-support/fltk/fltk-1.1.10/libpng15.patch b/meta-oe/recipes-support/fltk/fltk-1.1.10/libpng15.patch
new file mode 100644
index 0000000..b2eb8d6
--- /dev/null
+++ b/meta-oe/recipes-support/fltk/fltk-1.1.10/libpng15.patch
@@ -0,0 +1,61 @@
+Imported from gentoo
+http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/x11-libs/fltk/files/fltk-1.1.10-libpng15.patch
+
+--- a/src/Fl_PNG_Image.cxx
++++ b/src/Fl_PNG_Image.cxx
+@@ -66,7 +66,8 @@ Fl_PNG_Image::Fl_PNG_Image(const char *png) // I - File to read
+   png_structp	pp;			// PNG read pointer
+   png_infop	info;			// PNG info pointers
+   png_bytep	*rows;			// PNG row pointers
+-
++  png_byte     color_type;             // PNG color type
++  png_byte     bit_depth;              // PNG bit depth
+ 
+   // Open the PNG file...
+   if ((fp = fopen(png, "rb")) == NULL) return;
+@@ -75,7 +76,7 @@ Fl_PNG_Image::Fl_PNG_Image(const char *png) // I - File to read
+   pp   = png_create_read_struct(PNG_LIBPNG_VER_STRING, NULL, NULL, NULL);
+   info = png_create_info_struct(pp);
+ 
+-  if (setjmp(pp->jmpbuf))
++  if (setjmp(png_jmpbuf(pp)))
+   {
+     Fl::warning("PNG file \"%s\" contains errors!\n", png);
+     return;
+@@ -86,28 +87,24 @@ Fl_PNG_Image::Fl_PNG_Image(const char *png) // I - File to read
+ 
+   // Get the image dimensions and convert to grayscale or RGB...
+   png_read_info(pp, info);
++  color_type = png_get_color_type(pp, info);
+ 
+-  if (info->color_type == PNG_COLOR_TYPE_PALETTE)
++  if (color_type == PNG_COLOR_TYPE_PALETTE)
+     png_set_expand(pp);
+ 
+-  if (info->color_type & PNG_COLOR_MASK_COLOR)
+-    channels = 3;
+-  else
+-    channels = 1;
+-
+-  if ((info->color_type & PNG_COLOR_MASK_ALPHA) || info->num_trans)
+-    channels ++;
++  channels = png_get_channels(pp, info);
+ 
+-  w((int)(info->width));
+-  h((int)(info->height));
++  w((int)(png_get_image_width(pp, info)));
++  h((int)(png_get_image_height(pp, info)));
+   d(channels);
+ 
+-  if (info->bit_depth < 8)
++  bit_depth = png_get_bit_depth(pp, info);
++  if (bit_depth < 8)
+   {
+     png_set_packing(pp);
+     png_set_expand(pp);
+   }
+-  else if (info->bit_depth == 16)
++  else if (bit_depth == 16)
+     png_set_strip_16(pp);
+ 
+ #  if defined(HAVE_PNG_GET_VALID) && defined(HAVE_PNG_SET_TRNS_TO_ALPHA)
diff --git a/meta-oe/recipes-support/fltk/fltk_1.1.10.bb b/meta-oe/recipes-support/fltk/fltk_1.1.10.bb
index ad8768d..bf218ee 100644
--- a/meta-oe/recipes-support/fltk/fltk_1.1.10.bb
+++ b/meta-oe/recipes-support/fltk/fltk_1.1.10.bb
@@ -6,9 +6,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1c0b73db66884b6a925e727400315130"
 
 DEPENDS = "alsa-lib zlib jpeg libpng libxext libxft"
 
+PR = "r1"
+
 SRC_URI = "ftp://ftp.rz.tu-bs.de/pub/mirror/ftp.easysw.com/ftp/pub/fltk/${PV}/fltk-${PV}-source.tar.bz2 \
            file://disable_test.patch \
            file://dso-fix.patch \
+           file://libpng15.patch \
           "
 
 S = "${WORKDIR}/fltk-${PV}"
-- 
1.8.0.2



