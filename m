Return-Path: <gthomas@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 0EA0660589
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jun 2016 09:29:59 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 22AEE68A01F; Thu, 16 Jun 2016 10:30:00 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id A6C7468A01A;
	Thu, 16 Jun 2016 10:29:51 +0100 (BST)
Received: by zeus.mlbassoc.com (Postfix, from userid 1000)
	id 6B83B674043C; Thu, 16 Jun 2016 11:29:51 +0200 (CEST)
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Jun 2016 11:29:48 +0200
Message-Id: <1466069388-18584-1-git-send-email-gary@mlbassoc.com>
X-Mailer: git-send-email 2.7.4
Cc: Gary Thomas <gary@mlbassoc.com>
Subject: [meta-oe][PATCH] v4lutils: Update to latest upstream
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
X-List-Received-Date: Thu, 16 Jun 2016 09:30:00 -0000

Update to latest upstream version (1.10.1 2016-06-15).
Now builds with libjpeg-turbo so remove blacklist

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
---
 .../v4l2apps/{v4l-utils_1.6.2.bb => v4l-utils_1.10.1.bb}          | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-multimedia/v4l2apps/{v4l-utils_1.6.2.bb => v4l-utils_1.10.1.bb} (82%)

diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.6.2.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.10.1.bb
similarity index 82%
rename from meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.6.2.bb
rename to meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.10.1.bb
index 1141bff..6148695 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.6.2.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.10.1.bb
@@ -17,8 +17,8 @@ SRC_URI = "http://linuxtv.org/downloads/v4l-utils/v4l-utils-${PV}.tar.bz2 \
            file://mediactl-pkgconfig.patch \
            file://export-mediactl-headers.patch \
           "
-SRC_URI[md5sum] = "9cb3c178f937954e65bf30920af433ef"
-SRC_URI[sha256sum] = "d3d6eb1f0204fb11f3d318bfca35d5f73cc077f88fac7665a47856a16496be7d"
+SRC_URI[md5sum] = "936c9c58343840e91294e4dcec7dc05f"
+SRC_URI[sha256sum] = "6147ccc29fe7dd3c5c3994d613c4f2a099bac8b44694a96e5cf4d7caca8336c0"
 
 EXTRA_OECONF = "--disable-qv4l2 --enable-shared --with-udevdir=${base_libdir}/udev"
 
@@ -43,7 +43,3 @@ FILES_libv4l-dbg += "${libdir}/libv4l/.debug ${libdir}/libv4l/plugins/.debug"
 FILES_libv4l-dev += "${includedir} ${libdir}/pkgconfig \
                      ${libdir}/libv4l*${SOLIBSDEV} ${libdir}/*.la \
                      ${libdir}/v4l*${SOLIBSDEV} ${libdir}/libv4l/*.la ${libdir}/libv4l/plugins/*.la"
-
-# | ../../../v4l-utils-1.6.2/lib/libv4lconvert/jpeg_memsrcdest.h:4:1: error: conflicting types for 'jpeg_mem_src'
-# |  jpeg_mem_src (j_decompress_ptr cinfo, unsigned char * buffer,
-PNBLACKLIST[v4l-utils] ?= "Not compatible with libjpeg-turbo-1.5.0"
-- 
2.7.4


