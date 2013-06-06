Return-Path: <cazfi74@gmail.com>
Received: from mail-la0-f50.google.com (mail-la0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id 17CC46A456
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Jun 2013 08:03:05 +0000 (UTC)
Received: by mail-la0-f50.google.com with SMTP id dy20so74533lab.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Jun 2013 01:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=iZmvl1OGOPf5+XaHCVV9pkvtXaR+DY6E0eBP5akRkfM=;
	b=UGnj8xu/pjl1sOb5HELsRUXToMxhZcwvFSceCuOoHxYAbyzWIdPGpQDERO1M/MZE0a
	hyyIo1FcVxI0vmQpX1UrLaf6NMgg/yTZPsh1IvWzjvzNlxi3WJJn6TUPBn8TwIZd0s8S
	l7ZzhQUQlw08UcZbg+CZk3NSYTgK1pTIBrMlSK2FpjhTNnq4MFnvfiYrjZx0C3yGIlZr
	9LtyCHYVkbB/xHD/zaRev4gAozOELNue1NmZeVjrsss8GvFSG37aGGd/iMilFQRvFa/z
	UccNKv79SzK1akqD3WTBga5D2m8HdStuTUFBfOeKFh2N2jPPSsaVdUo6tSwPNVKE0Dl8
	PhHw==
X-Received: by 10.112.133.35 with SMTP id oz3mr2678273lbb.7.1370505786426;
	Thu, 06 Jun 2013 01:03:06 -0700 (PDT)
Received: from prime (a91-153-5-47.elisa-laajakaista.fi. [91.153.5.47])
	by mx.google.com with ESMTPSA id 4sm11064047lao.0.2013.06.06.01.03.04
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 06 Jun 2013 01:03:05 -0700 (PDT)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1UkVA0-0007JV-KV; Thu, 06 Jun 2013 11:03:04 +0300
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Jun 2013 11:02:54 +0300
Message-Id: <1370505774-28083-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-oe][PATCH 2/2] imagemagick: enable freetype delegate
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
X-List-Received-Date: Thu, 06 Jun 2013 08:03:06 -0000

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 meta-oe/recipes-support/imagemagick/imagemagick_6.8.5.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_6.8.5.bb b/meta-oe/recipes-support/imagemagick/imagemagick_6.8.5.bb
index 6cb3b4a..e77f92c 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_6.8.5.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_6.8.5.bb
@@ -3,7 +3,7 @@ SECTION = "console/utils"
 LICENSE = "ImageMagick"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1bf06a8d02cb00b02dea7d03ef9525f"
 # FIXME: There is much more checked libraries. All should be added or explicitly disabled to get consistent results.
-DEPENDS = "lcms bzip2 jpeg libpng librsvg tiff zlib fftw"
+DEPENDS = "lcms bzip2 jpeg libpng librsvg tiff zlib fftw freetype"
 
 PATCHSET = "9"
 SRC_URI = "ftp://ftp.nluug.nl/pub/ImageMagick/ImageMagick-${PV}-${PATCHSET}.tar.bz2 \
@@ -18,7 +18,7 @@ inherit autotools binconfig pkgconfig
 
 # xml disabled because it's using xml2-config --prefix to determine prefix which returns just /usr with our libxml2
 # if someone needs xml support then fix it first
-EXTRA_OECONF = "--program-prefix= --without-x --without-freetype --without-perl --disable-openmp --without-xml --disable-opencl"
+EXTRA_OECONF = "--program-prefix= --without-x --without-perl --disable-openmp --without-xml --disable-opencl"
 
 FILES_${PN} += "${libdir}/ImageMagick-${PV}/modules-Q16/*/*.so \
                 ${libdir}/ImageMagick-${PV}/modules-Q16/*/*.la \
-- 
1.7.10.4


