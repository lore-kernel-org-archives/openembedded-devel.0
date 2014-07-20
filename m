Return-Path: <ticotimo@gmail.com>
Received: from mail-vc0-f174.google.com (mail-vc0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 9881F7058B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 19:16:31 +0000 (UTC)
Received: by mail-vc0-f174.google.com with SMTP id la4so10772485vcb.19
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 12:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=gx+j0EaJ9b6ZCGCQsRuiu2AnXRFGx8HhSH0uCQ/mZWQ=;
	b=Qe8YKAe2GsXRplJNqUpfL8iJ9GuH1bwZRDX/uosUpKi6YAf9KGcJW+1540ONhSwA0D
	kSefIMENfUHRGv4VtzbMBTuwzsiV9eUyDxO3OkLP/Bj7Ax+06w0jOzZAoittrnbfXBNz
	6RDi+jEa15llbVGuQv9P8ITHm3FIfDnaMDngHe232FxMtVc6JounExL6pvixATL1wywj
	MzbqS89pVVoynxdeL8kzswqVc+k8k7jrspw+gZkWOitcGk8g1UhihT1t+rOAbfFvYDu7
	ZPfoVHMFL22tRNJownevKxky9ik8+iR0zGDj1N57t0HjYWKX6h26qPqDQ51nK6qT2Ilm
	973g==
X-Received: by 10.52.9.68 with SMTP id x4mr17550239vda.20.1405883792460;
	Sun, 20 Jul 2014 12:16:32 -0700 (PDT)
Received: from localhost.localdomain.com ([196.40.10.133])
	by mx.google.com with ESMTPSA id
	sx10sm19527218vdb.16.2014.07.20.12.16.30 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Jul 2014 12:16:31 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 Jul 2014 12:16:26 -0700
Message-Id: <1405883786-26358-1-git-send-email-TicoTimo@gmail.com>
X-Mailer: git-send-email 1.9.3
Subject: [meta-oe][PATCH v2] imagemagick: add some PACKAGECONFIG, fix unrecognized --without-jp2 option
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
X-List-Received-Date: Sun, 20 Jul 2014 19:16:35 -0000

* Add PACKAGECONFIG for lzma, pango, webp, wmf

Change in v2:
* libwmf is currently blacklisted, so #comment it out

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 meta-oe/recipes-support/imagemagick/imagemagick_6.8.8.bb | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_6.8.8.bb b/meta-oe/recipes-support/imagemagick/imagemagick_6.8.8.bb
index e261eb8..4b52568 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_6.8.8.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_6.8.8.bb
@@ -2,7 +2,7 @@ SUMMARY = "ImageMagick is an image convertion tools"
 SECTION = "console/utils"
 LICENSE = "ImageMagick"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d84c6ddd4028aa53d028b4c50f9361e"
-# FIXME: There is much more checked libraries. All should be added or explicitly disabled to get consistent results.
+# FIXME: There are many more checked libraries. All should be added or explicitly disabled to get consistent results.
 DEPENDS = "lcms bzip2 jpeg libpng librsvg tiff zlib fftw freetype"
 
 PATCHSET = "10"
@@ -21,7 +21,12 @@ inherit autotools binconfig pkgconfig
 EXTRA_OECONF = "--program-prefix= --program-suffix=.im6 --without-x --without-perl --disable-openmp --without-xml --disable-opencl"
 
 PACKAGECONFIG ??= ""
-PACKAGECONFIG[jp2] = "--with-jp2,--without-jp2,jasper"
+PACKAGECONFIG[jp2] = "--with-jp2,,jasper"
+PACKAGECONFIG[lzma] = "--with-lzma,--without-lzma,xz"
+PACKAGECONFIG[pango] = "--with-pango,--without-pango,pango cairo"
+PACKAGECONFIG[webp] = "--with-webp,--without-webp,libwebp"
+# libwmf is currently blacklisted
+#PACKAGECONFIG[wmf] = "--with-wmf,--without-wmf,libwmf"
 
 FILES_${PN} += "${libdir}/ImageMagick-${PV}/modules-Q16/*/*.so \
                 ${libdir}/ImageMagick-${PV}/modules-Q16/*/*.la \
-- 
1.9.3


