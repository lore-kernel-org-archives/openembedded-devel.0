Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (unknown [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 4788F61F16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 May 2014 09:17:49 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.98,879,1392159600"; d="scan'208";a="51542560"
Received: from cosnadexc22.usr.ingenico.loc ([10.31.4.222])
	by antispam1.usr.ingenico.loc with ESMTP; 21 May 2014 11:17:41 +0200
Received: from COSNADEXC12.usr.ingenico.loc (10.31.4.212) by
	COSNADEXC22.usr.ingenico.loc (10.31.4.222) with Microsoft SMTP Server
	(TLS) id 14.2.318.1; Wed, 21 May 2014 11:17:40 +0200
Received: from u56.usr.ingenico.loc (10.23.7.56) by
	COSNADEXC12.usr.ingenico.loc (10.31.4.212) with Microsoft SMTP Server
	id 14.2.328.9; Wed, 21 May 2014 11:17:39 +0200
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 21 May 2014 11:17:45 +0200
Message-ID: <1400663865-4304-2-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.9.2
In-Reply-To: <1400663865-4304-1-git-send-email-Matthieu.Crapet@ingenico.com>
References: <1400663865-4304-1-git-send-email-Matthieu.Crapet@ingenico.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/2] libwebp: add new recipe for version 0.4.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 May 2014 09:17:49 -0000
Content-Type: text/plain

This is the WebP image format designed by Google.
WebM is already included in meta-openembedded.

Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 meta-oe/recipes-multimedia/webp/libwebp_0.4.0.bb | 46 ++++++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/webp/libwebp_0.4.0.bb

diff --git a/meta-oe/recipes-multimedia/webp/libwebp_0.4.0.bb b/meta-oe/recipes-multimedia/webp/libwebp_0.4.0.bb
new file mode 100644
index 0000000..a5a9169
--- /dev/null
+++ b/meta-oe/recipes-multimedia/webp/libwebp_0.4.0.bb
@@ -0,0 +1,46 @@
+SUMMARY = "WebP is an image format designed for the Web"
+DESCRIPTION = "WebP is a method of lossy and lossless compression that can be \
+               used on a large variety of photographic, translucent and \
+               graphical images found on the web. The degree of lossy \
+               compression is adjustable so a user can choose the trade-off \
+               between file size and image quality. WebP typically achieves \
+               an average of 30% more compression than JPEG and JPEG 2000, \
+               without loss of image quality."
+HOMEPAGE = "https://developers.google.com/speed/webp/"
+SECTION = "libs"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://PATENTS;md5=7ec8a34de2073ea13ea2991006246d20"
+
+SRC_URI = "https://webp.googlecode.com/files/${BP}.tar.gz"
+SRC_URI[md5sum] = "c8dd1d26eb9566833aba269b86d97e68"
+SRC_URI[sha256sum] = "31913577e96386556855b41d210736449445fe96cfbe9289014e9b8afa944d69"
+
+EXTRA_OECONF = " \
+    --disable-experimental \
+    --disable-wic \
+    --enable-libwebpmux \
+    --enable-libwebpdemux \
+    --enable-threading \
+"
+
+inherit autotools lib_package
+
+PACKAGECONFIG ??= ""
+
+# libwebpdecoder is a subset of libwebp, don't build it unless requested
+PACKAGECONFIG[decoder] = "--enable-libwebpdecoder,--disable-libwebpdecoder"
+
+# Apply for examples programs: cwebp and dwebp
+PACKAGECONFIG[jpeg] = ",ac_cv_header_jpeglib_h=no,jpeg"
+PACKAGECONFIG[png] = ",ac_cv_header_png_h=no,libpng"
+PACKAGECONFIG[tiff] = ",ac_cv_header_tiffio_h=no,tiff"
+
+# Apply only for example program vwebp
+PACKAGECONFIG[gl] = ",,mesa-glut"
+
+PACKAGES =+ "${PN}-gif2webp"
+
+DESCRIPTION_${PN}-gif2webp = "Simple tool to convert animated GIFs to WebP"
+FILES_${PN}-gif2webp = "${bindir}/gif2webp"
+DEPENDS_${PN}-gif2webp += "giflib"
-- 
1.8.1.2


