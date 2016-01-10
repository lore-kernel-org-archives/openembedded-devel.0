Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6C64175D4A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jan 2016 01:00:11 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id gi1so30430812pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Jan 2016 17:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=5HxogltzD7tgBUdpHCFr1+H7UcpkrfX6+9UtWKwRQpA=;
	b=OZMEslYcowZCgy3evuFAJedvEUnDYORb+TrF9iEtMQYu6LcmmaLvI1HKkwGGJ+fmwk
	uWb7GxNJDdq8xVhAZng2NdxlTNOMZcWwYL9XjEwBydj1Kgunbe1imTLUEyfkjDgkFiGR
	zrOfNcFlXcqB+Wo3R5XTeA4bvW/8AtfVD5u0UZxeKDjbQBzhMpxW0SREjS666UdtKtMO
	zfHYIvWERQ76JeegpzpykWXUbsVt8Xqp2q2pSm2zr7G/8G85mPhN5edyVkHG6MPozllB
	VKr08ow1yv9CV5ra8PtBXyrEt7vPOo4KwLs1WVxL1DlWVRQed1tpg/t2BRHV8p7/hpqh
	vTMg==
X-Received: by 10.67.2.73 with SMTP id bm9mr170906982pad.94.1452387612463;
	Sat, 09 Jan 2016 17:00:12 -0800 (PST)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by smtp.gmail.com with ESMTPSA id r12sm9314568pfi.9.2016.01.09.17.00.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Jan 2016 17:00:05 -0800 (PST)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 85037FCC84F; Sat,  9 Jan 2016 16:59:48 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Jan 2016 16:59:44 -0800
Message-Id: <74a7c7d117604750a6098728d7915de242d0cb64.1452386603.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1452386602.git.akuster808@gmail.com>
References: <cover.1452386602.git.akuster808@gmail.com>
In-Reply-To: <cover.1452386602.git.akuster808@gmail.com>
References: <cover.1452386602.git.akuster808@gmail.com>
Subject: [PATCH 21/22] fltk: fix build issue.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 10 Jan 2016 01:00:11 -0000

this patch fixes:
Fl_JPEG_Image.cxx: In constructor 'Fl_JPEG_Image::Fl_JPEG_Image(const char*)':
| Fl_JPEG_Image.cxx:156:29: error: invalid conversion from 'int' to 'boolean' [-fpermissive]

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../fltk/fltk-1.1.10/Fl_JPEG_Image_buildix.patch   | 37 ++++++++++++++++++++++
 meta-oe/recipes-support/fltk/fltk_1.1.10.bb        |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-oe/recipes-support/fltk/fltk-1.1.10/Fl_JPEG_Image_buildix.patch

diff --git a/meta-oe/recipes-support/fltk/fltk-1.1.10/Fl_JPEG_Image_buildix.patch b/meta-oe/recipes-support/fltk/fltk-1.1.10/Fl_JPEG_Image_buildix.patch
new file mode 100644
index 0000000..ea80011
--- /dev/null
+++ b/meta-oe/recipes-support/fltk/fltk-1.1.10/Fl_JPEG_Image_buildix.patch
@@ -0,0 +1,37 @@
+fltk: Fl_JPEG_Image.cxx bug in fltk-1.3.x for jpeg-9
+
+Link: http://www.fltk.org/str.php?L2920
+Version: 1.3-current
+
+There has been a change in jpeg-9:
+
+Fl_JPEG_Image.cxx: In constructor 'Fl_JPEG_Image::Fl_JPEG_Image(const
+char*)':
+Fl_JPEG_Image.cxx:158:29: error: invalid conversion from 'int' to
+'boolean' [-fpermissive]
+In file included from Fl_JPEG_Image.cxx:50:0:
+/usr/include/jpeglib.h:1032:13: error:   initializing argument 2 of 'int
+jpeg_read_header(j_decompress_ptr, boolean)' [-fpermissive]
+
+
+http://permalink.gmane.org/gmane.comp.lib.fltk.bugs/10893
+
+Upstream-Status: Backport
+
+partical back port as this version is only affected by on change.
+
+Signed-off-by: Armin Kuster <akuster808@gmail.com>
+
+Index: fltk-1.1.10/src/Fl_JPEG_Image.cxx
+===================================================================
+--- fltk-1.1.10.orig/src/Fl_JPEG_Image.cxx
++++ fltk-1.1.10/src/Fl_JPEG_Image.cxx
+@@ -153,7 +153,7 @@ Fl_JPEG_Image::Fl_JPEG_Image(const char
+ 
+   jpeg_create_decompress(&dinfo);
+   jpeg_stdio_src(&dinfo, fp);
+-  jpeg_read_header(&dinfo, 1);
++  jpeg_read_header(&dinfo, TRUE);
+ 
+   dinfo.quantize_colors      = (boolean)FALSE;
+   dinfo.out_color_space      = JCS_RGB;
diff --git a/meta-oe/recipes-support/fltk/fltk_1.1.10.bb b/meta-oe/recipes-support/fltk/fltk_1.1.10.bb
index 1404961..22a1a50 100644
--- a/meta-oe/recipes-support/fltk/fltk_1.1.10.bb
+++ b/meta-oe/recipes-support/fltk/fltk_1.1.10.bb
@@ -13,6 +13,7 @@ SRC_URI = "ftp://ftp.rz.tu-bs.de/pub/mirror/ftp.easysw.com/ftp/pub/fltk/${PV}/fl
            file://dso-fix.patch \
            file://libpng15.patch \
            file://fltk-no-freetype-config.patch \
+	   file://Fl_JPEG_Image_buildix.patch \
 "
 
 S = "${WORKDIR}/fltk-${PV}"
-- 
1.9.1


