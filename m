Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 6A6677702A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Sep 2015 20:59:41 +0000 (UTC)
Received: by wicge5 with SMTP id ge5so53735449wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Sep 2015 13:59:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ADaaw5EzrS7vKWyWOqI0Sy8dQCOFb3x6t01GmI0g6C0=;
	b=dvXoWR1mzP0yLKlDlG5MVlnqvDzlgZXUDSwIb1qUkDi3nCHCmz72cA4mj8388nVnaV
	wSHV13VZVJlgF7AvedZKT6abC1E+PaNaP7VwgfT8iAUpyr+QsFpxm8xy7GUI8WGF/kvT
	VrXrq4lUUJqSUR6H0QMbaE9sKUp2/pLKQl38yUgYd4KJhElaBRBoHkcdRDWB8GZqTtOz
	OybQg79D9nV6nqM86iRjZ9IfVyQLOIBfZFMQO3zqd2Cplmj+BbVmhAVts+Hj0CdqPDu+
	W8M7bwuotTAX9Dnv072D+uTF9tW3rd2JB3ho2tyUHVuqHv3EKrnFprbUV8p8v14UXjsF
	lSog==
X-Gm-Message-State: ALoCoQnVxQqefYCf3cjRXUsdJHgB7i3RlySlncGENgl26gFqv94xUEMFDIuqHfDFbcYI3rsbDZrO
X-Received: by 10.194.202.198 with SMTP id kk6mr24944177wjc.52.1441227581127; 
	Wed, 02 Sep 2015 13:59:41 -0700 (PDT)
Received: from flashheart.home
	(host212-140-113-248.range212-140.btcentralplus.com.
	[212.140.113.248]) by smtp.gmail.com with ESMTPSA id
	lz10sm34151118wjb.48.2015.09.02.13.59.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Sep 2015 13:59:40 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Sep 2015 21:52:51 +0100
Message-Id: <1441227171-7647-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] libwebp: upgrade to 0.4.3
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
X-List-Received-Date: Wed, 02 Sep 2015 20:59:42 -0000

Change SRC_URI as googlecode is dead, update the license checksum (based on work
by Alexander Kanavin <alexander.kanavin@linux.intel.com>).

Also make the giflib dependency optional as the PNG/JPEG/TIFF dependencies
already are.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../webp/{libwebp_0.4.0.bb => libwebp_0.4.3.bb}               | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-multimedia/webp/{libwebp_0.4.0.bb => libwebp_0.4.3.bb} (80%)

diff --git a/meta-oe/recipes-multimedia/webp/libwebp_0.4.0.bb b/meta-oe/recipes-multimedia/webp/libwebp_0.4.3.bb
similarity index 80%
rename from meta-oe/recipes-multimedia/webp/libwebp_0.4.0.bb
rename to meta-oe/recipes-multimedia/webp/libwebp_0.4.3.bb
index 7663b3b..50caa70 100644
--- a/meta-oe/recipes-multimedia/webp/libwebp_0.4.0.bb
+++ b/meta-oe/recipes-multimedia/webp/libwebp_0.4.3.bb
@@ -10,13 +10,11 @@ HOMEPAGE = "https://developers.google.com/speed/webp/"
 SECTION = "libs"
 
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://PATENTS;md5=7ec8a34de2073ea13ea2991006246d20"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6e8dee932c26f2dab503abf70c96d8bb"
 
-DEPENDS = "giflib"
-
-SRC_URI = "https://webp.googlecode.com/files/${BP}.tar.gz"
-SRC_URI[md5sum] = "c8dd1d26eb9566833aba269b86d97e68"
-SRC_URI[sha256sum] = "31913577e96386556855b41d210736449445fe96cfbe9289014e9b8afa944d69"
+SRC_URI = "http://downloads.webmproject.org/releases/webp/${BP}.tar.gz"
+SRC_URI[md5sum] = "08813525eeeffe7e305b4cbfade8ae9b"
+SRC_URI[sha256sum] = "efbe0d58fda936f2ed99d0b837ed7087d064d6838931f282c4618d2a3f7390c4"
 
 EXTRA_OECONF = " \
     --disable-experimental \
@@ -34,6 +32,7 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[decoder] = "--enable-libwebpdecoder,--disable-libwebpdecoder"
 
 # Apply for examples programs: cwebp and dwebp
+PACKAGECONFIG[gif] = ",ac_cv_header_gif_lib_h=no,giflib"
 PACKAGECONFIG[jpeg] = ",ac_cv_header_jpeglib_h=no,jpeg"
 PACKAGECONFIG[png] = ",ac_cv_header_png_h=no,libpng"
 PACKAGECONFIG[tiff] = ",ac_cv_header_tiffio_h=no,tiff"
-- 
2.1.4


