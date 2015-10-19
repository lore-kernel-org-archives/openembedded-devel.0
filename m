Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 187CB7701C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Oct 2015 17:53:36 +0000 (UTC)
Received: from localhost.localdomain (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id D3D7023182
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Oct 2015 19:53:35 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Oct 2015 19:53:19 +0200
Message-Id: <1445277199-1796-1-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <20151013102528.GB2396@jama>
References: <20151013102528.GB2396@jama>
Subject: [meta-multimedia][PATCH] gst-plugins-ugly: Fix opencore AMR plugin support
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
X-List-Received-Date: Mon, 19 Oct 2015 17:53:36 -0000

opencore 0.1.3 and later use a different header installation path.
Fix the gst-plugins-ugly AMR plugin to use the correct paths, and add
packageconfigs for amrwb and amrnb.

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 .../0002-Fix-opencore-include-paths.patch          | 58 ++++++++++++++++++++++
 .../gstreamer-0.10/gst-plugins-ugly_0.10.19.bb     |  7 ++-
 2 files changed, 64 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-ugly/0002-Fix-opencore-include-paths.patch

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-ugly/0002-Fix-opencore-include-paths.patch b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-ugly/0002-Fix-opencore-include-paths.patch
new file mode 100644
index 0000000..3fd6a26
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-ugly/0002-Fix-opencore-include-paths.patch
@@ -0,0 +1,58 @@
+From e634bc6420826f760f6519a9f134c6a4d3412ef8 Mon Sep 17 00:00:00 2001
+From: Carlos Rafael Giani <dv@pseudoterminal.org>
+Date: Mon, 19 Oct 2015 15:26:24 +0200
+Subject: [PATCH] Fix opencore include paths
+
+Upstream-Status: Inappropriate [no upstream - GStreamer 0.10 is no longer being maintained]
+
+Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
+---
+ ext/amrnb/amrnbdec.h    | 2 +-
+ ext/amrnb/amrnbenc.h    | 2 +-
+ ext/amrwbdec/amrwbdec.h | 4 ++--
+ 3 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/ext/amrnb/amrnbdec.h b/ext/amrnb/amrnbdec.h
+index 1e81839..01b7154 100644
+--- a/ext/amrnb/amrnbdec.h
++++ b/ext/amrnb/amrnbdec.h
+@@ -22,7 +22,7 @@
+ 
+ #include <gst/gst.h>
+ #include <gst/audio/gstaudiodecoder.h>
+-#include <interf_dec.h>
++#include <opencore-amrnb/interf_dec.h>
+ 
+ G_BEGIN_DECLS
+ 
+diff --git a/ext/amrnb/amrnbenc.h b/ext/amrnb/amrnbenc.h
+index 7f673ac..5be39b5 100644
+--- a/ext/amrnb/amrnbenc.h
++++ b/ext/amrnb/amrnbenc.h
+@@ -21,7 +21,7 @@
+ #define __GST_AMRNBENC_H__
+ 
+ #include <gst/gst.h>
+-#include <interf_enc.h>
++#include <opencore-amrnb/interf_enc.h>
+ #include <gst/audio/gstaudioencoder.h>
+ 
+ G_BEGIN_DECLS
+diff --git a/ext/amrwbdec/amrwbdec.h b/ext/amrwbdec/amrwbdec.h
+index c3528fc..f27c6d2 100644
+--- a/ext/amrwbdec/amrwbdec.h
++++ b/ext/amrwbdec/amrwbdec.h
+@@ -22,8 +22,8 @@
+ 
+ #include <gst/gst.h>
+ #include <gst/audio/gstaudiodecoder.h>
+-#include <dec_if.h>
+-#include <if_rom.h>
++#include <opencore-amrwb/dec_if.h>
++#include <opencore-amrwb/if_rom.h>
+ 
+ G_BEGIN_DECLS
+ 
+-- 
+1.9.1
+
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-ugly_0.10.19.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-ugly_0.10.19.bb
index 11f20ca..a8cb852 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-ugly_0.10.19.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-ugly_0.10.19.bb
@@ -19,6 +19,8 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[x264] = "--enable-x264,--disable-x264,x264"
 PACKAGECONFIG[cdio] = "--enable-cdio,--disable-cdio,libcdio"
 PACKAGECONFIG[dvdread] = "--enable-dvdread,--disable-dvdread,libdvdread"
+PACKAGECONFIG[amrnb] = "--enable-amrnb,--disable-amrnb,opencore-amr"
+PACKAGECONFIG[amrwb] = "--enable-amrwb,--disable-amrwb,opencore-amr"
 
 do_configure_prepend() {
 	# This m4 file contains nastiness which conflicts with libtool 2.2.2
@@ -27,4 +29,7 @@ do_configure_prepend() {
 
 SRC_URI[md5sum] = "1d81c593e22a6cdf0f2b4f57eae93df2"
 SRC_URI[sha256sum] = "1ca90059275c0f5dca71d4d1601a8f429b7852baed0723e820703b977e2c8df0"
-SRC_URI += "file://0001-cdio-compensate-for-libcdio-s-recent-cd-text-api-cha.patch"
+SRC_URI += "file://0001-cdio-compensate-for-libcdio-s-recent-cd-text-api-cha.patch \
+            file://0002-Fix-opencore-include-paths.patch"
+
+FILES_${PN}-amrnb += "${datadir}/gstreamer-0.10/presets/GstAmrnbEnc.prs"
-- 
1.9.1


