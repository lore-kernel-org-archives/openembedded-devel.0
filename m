Return-Path: <ml@communistcode.co.uk>
X-Greylist: delayed 2576 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 02 Sep 2015 11:53:25 UTC
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 00AB576BD7
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Sep 2015 11:53:25 +0000 (UTC)
From: ml@communistcode.co.uk
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Sep 2015 12:10:59 +0100
Message-Id: <1441192259-20483-1-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 2.5.1
Cc: Jack Mitchell <jack@embed.me.uk>
Subject: [PATCH] libjpeg-turbo: fix libturbojpeg packaging
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
X-List-Received-Date: Wed, 02 Sep 2015 11:53:27 -0000

From: Jack Mitchell <jack@embed.me.uk>

put libjpegturbo library files and headers into correct packages rather
than them being in the main libjpeg-turbo package.

remove INSANE_SKIP[dev-so]
move .so, .a into -dev package
move .la into -staticdev
move .so.* into main library package

Signed-off-by: Jack Mitchell <jack@embed.me.uk>
---
 meta-oe/recipes-core/jpeg/libjpeg-turbo_8d+1.4.0.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-core/jpeg/libjpeg-turbo_8d+1.4.0.bb b/meta-oe/recipes-core/jpeg/libjpeg-turbo_8d+1.4.0.bb
index 8e214c9..16f62c5 100644
--- a/meta-oe/recipes-core/jpeg/libjpeg-turbo_8d+1.4.0.bb
+++ b/meta-oe/recipes-core/jpeg/libjpeg-turbo_8d+1.4.0.bb
@@ -25,13 +25,14 @@ inherit autotools pkgconfig
 
 EXTRA_OECONF = "--with-jpeg8 "
 
-PACKAGES =+ "jpeg-tools libturbojpeg"
+PACKAGES =+ "jpeg-tools libturbojpeg libturbojpeg-staticdev libturbojpeg-dev"
 
 DESCRIPTION_jpeg-tools = "The jpeg-tools package includes client programs to access libjpeg functionality.  These tools allow for the compression, decompression, transformation and display of JPEG files and benchmarking of the libjpeg library."
 FILES_jpeg-tools = "${bindir}/*"
 
-FILES_libturbojpeg = "${libdir}/libturbojpeg.so"
-INSANE_SKIP_libturbojpeg = "dev-so"
+FILES_libturbojpeg = "${libdir}/libturbojpeg.so.*"
+FILES_libturbojpeg-staticdev = "${libdir}/libturbojpeg.a"
+FILES_libturbojpeg-dev = "${libdir}/libturbojpeg.la ${incdir}/turbojpeg.h ${libdir}/libturbojpeg.so"
 
 BBCLASSEXTEND = "native"
 DEPENDS = "nasm-native"
-- 
2.5.1


