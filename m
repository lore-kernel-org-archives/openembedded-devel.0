Return-Path: <ticotimo@gmail.com>
Received: from mail-vc0-f181.google.com (mail-vc0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 986EB65D03
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 19:12:39 +0000 (UTC)
Received: by mail-vc0-f181.google.com with SMTP id lf12so10693249vcb.40
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 12:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=9aSrx+UfuT5YLDe6m4D7GMz/R9UNwijzwE56boAsLXA=;
	b=juyrv36ZQbqBvXO7Q4lSv+5m4Oq4BVfeBKd3KxEVmvMC8NSSFqYcpYLDMe9zmWwIOT
	bZUHMC3BZH4MVMeJl4jxFibNjxYfGjje2Iuf4+qHgGiprrm7Q+eYallKZXA22j6MXpHE
	8DF0a8OSt3DdipTKMJu/yCIuj/I1j9Oyyuz1E7tfS/LNkzO944Rx64tzuxiuaNhw/7z4
	HuCW7VVQHHYYKd8WLkjDS+mo+uIhudl9gqmwFPN9IpM0cSYR8xLeKfGfTzKk36tWPXKS
	58DTrqCJZyX3Rn5p3Z6/Ka7O9ofuug/tXu30vCI720rVFZk4dL/VmzNdCFNW8ZSxPl+U
	547Q==
X-Received: by 10.220.74.10 with SMTP id s10mr4941970vcj.61.1405883560534;
	Sun, 20 Jul 2014 12:12:40 -0700 (PDT)
Received: from localhost.localdomain.com ([196.40.10.133])
	by mx.google.com with ESMTPSA id og9sm19549347vdb.1.2014.07.20.12.12.38
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Jul 2014 12:12:39 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 Jul 2014 12:12:14 -0700
Message-Id: <1405883534-26207-1-git-send-email-TicoTimo@gmail.com>
X-Mailer: git-send-email 1.9.3
Subject: [meta-oe][PATCH] imagemagick: add some PACKAGECONFIG, fix unrecognized --without-jp2 option
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
X-List-Received-Date: Sun, 20 Jul 2014 19:12:46 -0000

* Add PACKAGECONFIG for lzma, pango, webp, wmf
* libwmf is currently blacklisted, so #comment it out

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 meta-oe/recipes-support/imagemagick/imagemagick_6.8.8.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_6.8.8.bb b/meta-oe/recipes-support/imagemagick/imagemagick_6.8.8.bb
index e261eb8..31207da 100644
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
@@ -21,7 +21,11 @@ inherit autotools binconfig pkgconfig
 EXTRA_OECONF = "--program-prefix= --program-suffix=.im6 --without-x --without-perl --disable-openmp --without-xml --disable-opencl"
 
 PACKAGECONFIG ??= ""
-PACKAGECONFIG[jp2] = "--with-jp2,--without-jp2,jasper"
+PACKAGECONFIG[jp2] = "--with-jp2,,jasper"
+PACKAGECONFIG[lzma] = "--with-lzma,--without-lzma,xz"
+PACKAGECONFIG[pango] = "--with-pango,--without-pango,pango cairo"
+PACKAGECONFIG[webp] = "--with-webp,--without-webp,libwebp"
+PACKAGECONFIG[wmf] = "--with-wmf,--without-wmf,libwmf"
 
 FILES_${PN} += "${libdir}/ImageMagick-${PV}/modules-Q16/*/*.so \
                 ${libdir}/ImageMagick-${PV}/modules-Q16/*/*.la \
-- 
1.9.3


