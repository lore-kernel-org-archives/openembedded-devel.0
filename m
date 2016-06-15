Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id 457F1601A5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jun 2016 15:08:08 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id z189so110402340itg.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jun 2016 08:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3Ptb5p/X+IiweQPz5h+3LmerN8ZrVLUUIlC7dROtM2A=;
	b=I0ZBeokLxw22TicKLXYQ/NYm6JtGN/5C9VAQDUGjm8D62We8d+kgQULJbWoCQ4m7Cn
	VkpJow23XqHkV3SgiUGksupCq5zJCu4CMNw/aUnltgC33xruuQCN+Za9NlB/Qao5hark
	qaSbegDC2QzG2jXobNYXIfHzCZwJwGGDUrxd0i30Vd7mnI42WFI/7B5fF7+Myr8B3tMo
	6/JshicMIelruI4Y4n4vSjd6hMCrxt/CkBAMmfThP+lNnK62R/hxAtmJLnhG//MGC20L
	I/F2hRyU8CH0NdEV11G8+Kk+e4KIihxQtFcPheLj3+1CLMj4mH6dk4OX+Sv7smkmJnzo
	yDbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3Ptb5p/X+IiweQPz5h+3LmerN8ZrVLUUIlC7dROtM2A=;
	b=GUg5WmHxHIJda82bZHo8ncb4eeWoysyD7EoHuiQ+8+8FCCsDIxqvzrm1CRgVtnhURp
	muJmQuRcG8+4RC4Ahi0c5OydsexAevSZIC0haDQcooEjbBZ1Eep5SnA7LBj1doVPfQbi
	F7AJgnLklFHRyCt/F0/VrnzdEr8sJh3KSE2gHRecZwre8OBWZ/wq1UuFfOHfQUsT7Bg7
	iDJE4st/anXLySrz+yzkERMK8uiX1gLAXKRLgz7Dtjwo2Wef47i9shh6nVyBaq7D0nWU
	BGkkR8/tOSUUhqSbmSwMAZHy4snzvWa5zpzRrO2Roc5aM+pWcQbNrZMIW+SRRGwEtcur
	3rLw==
X-Gm-Message-State: ALyK8tKobHCbz2hZdlYT+soTx/AAmxhuTOZKA5sXaiOh5UzS2/ggy+qhxlOs/BAlu3Uoh1vf
X-Received: by 10.36.110.149 with SMTP id w143mr17895087itc.28.1466003289105; 
	Wed, 15 Jun 2016 08:08:09 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8D2EE.dip0.t-ipconnect.de.
	[93.232.210.238])
	by smtp.gmail.com with ESMTPSA id o4sm4362486itc.18.2016.06.15.08.08.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 15 Jun 2016 08:08:08 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Jun 2016 17:08:01 +0200
Message-Id: <1466003282-21411-1-git-send-email-patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1466002419.9543.1.camel@intel.com>
References: <1466002419.9543.1.camel@intel.com>
Subject: [meta-oe][PATCH 1/2] libgphoto2: fix compatibility with libjpeg-turbo
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
X-List-Received-Date: Wed, 15 Jun 2016 15:08:10 -0000

The libjpeg-turbo update to 1.5.0 broke components which embedd their
own, conflicting definitions of the jpeg_mem functions.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 .../jpeg_memsrcdest-extend-feature-check.patch     | 97 ++++++++++++++++++++++
 .../recipes-graphics/gphoto2/libgphoto2_2.5.8.bb   |  1 +
 2 files changed, 98 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2-2.5.8/jpeg_memsrcdest-extend-feature-check.patch

diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2-2.5.8/jpeg_memsrcdest-extend-feature-check.patch b/meta-oe/recipes-graphics/gphoto2/libgphoto2-2.5.8/jpeg_memsrcdest-extend-feature-check.patch
new file mode 100644
index 0000000..810d025
--- /dev/null
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2-2.5.8/jpeg_memsrcdest-extend-feature-check.patch
@@ -0,0 +1,97 @@
+From d4f7fdc9de00562d796287a365408b4c24de5db2 Mon Sep 17 00:00:00 2001
+From: Patrick Ohly <patrick.ohly@intel.com>
+Date: Wed, 15 Jun 2016 10:33:24 +0200
+Subject: [PATCH] jpeg_memsrcdest: extend feature check
+
+libjpeg.h in OpenEmbedded master (from libjpeg-turbo 1.5.0) provides
+these methods if "JPEG_LIB_VERSION >= 80 ||
+defined(MEM_SRCDST_SUPPORTED)".
+
+The support for the jpeg_mem functions was added even when not
+emulating the libjpeg8 API, controlled via the MEM_SRCDST_SUPPORTED
+define, so checking for the version alone is not enough anymore.
+
+See https://github.com/libjpeg-turbo/libjpeg-turbo/commit/ab70623eb29e09e67222be5b9e1ea320fe5aa0e9
+
+This fixes errors about conflicting declarations (signed vs. unsigned
+char).
+
+Upstream-Status: Submitted [https://github.com/gphoto/libgphoto2/pull/64]
+
+Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
+---
+ camlibs/ax203/jpeg_memsrcdest.c   | 4 ++--
+ camlibs/ax203/jpeg_memsrcdest.h   | 4 ++++
+ camlibs/jl2005c/jpeg_memsrcdest.c | 4 ++--
+ camlibs/jl2005c/jpeg_memsrcdest.h | 4 ++++
+ 4 files changed, 12 insertions(+), 4 deletions(-)
+
+diff --git a/camlibs/ax203/jpeg_memsrcdest.c b/camlibs/ax203/jpeg_memsrcdest.c
+index 0ed83b1..5614573 100644
+--- a/camlibs/ax203/jpeg_memsrcdest.c
++++ b/camlibs/ax203/jpeg_memsrcdest.c
+@@ -25,8 +25,8 @@
+ #include "jpeg_memsrcdest.h"
+ 
+ /* libjpeg8 and later come with their own (API compatible) memory source
+-   and dest */
+-#if JPEG_LIB_VERSION < 80
++   and dest, and older versions may have it backported */
++#if JPEG_LIB_VERSION < 80 && !defined(MEM_SRCDST_SUPPORTED)
+ 
+ /* Expanded data source object for memory input */
+ 
+diff --git a/camlibs/ax203/jpeg_memsrcdest.h b/camlibs/ax203/jpeg_memsrcdest.h
+index e971182..b13bf3f 100644
+--- a/camlibs/ax203/jpeg_memsrcdest.h
++++ b/camlibs/ax203/jpeg_memsrcdest.h
+@@ -1,5 +1,7 @@
+ #include <jpeglib.h>
+ 
++#if JPEG_LIB_VERSION < 80 && !defined(MEM_SRCDST_SUPPORTED)
++
+ void
+ jpeg_mem_src (j_decompress_ptr cinfo, unsigned char * buffer,
+ 	unsigned long bufsize);
+@@ -7,3 +9,5 @@ jpeg_mem_src (j_decompress_ptr cinfo, unsigned char * buffer,
+ void
+ jpeg_mem_dest (j_compress_ptr cinfo, unsigned char ** outbuffer,
+ 	unsigned long * outsize);
++
++#endif
+diff --git a/camlibs/jl2005c/jpeg_memsrcdest.c b/camlibs/jl2005c/jpeg_memsrcdest.c
+index 321f926..b65310e 100644
+--- a/camlibs/jl2005c/jpeg_memsrcdest.c
++++ b/camlibs/jl2005c/jpeg_memsrcdest.c
+@@ -25,8 +25,8 @@
+ #include "jpeg_memsrcdest.h"
+ 
+ /* libjpeg8 and later come with their own (API compatible) memory source
+-   and dest */
+-#if JPEG_LIB_VERSION < 80
++   and dest, and older versions may have it backported */
++#if JPEG_LIB_VERSION < 80 && !defined(MEM_SRCDST_SUPPORTED)
+ 
+ /* Expanded data source object for memory input */
+ 
+diff --git a/camlibs/jl2005c/jpeg_memsrcdest.h b/camlibs/jl2005c/jpeg_memsrcdest.h
+index e971182..b13bf3f 100644
+--- a/camlibs/jl2005c/jpeg_memsrcdest.h
++++ b/camlibs/jl2005c/jpeg_memsrcdest.h
+@@ -1,5 +1,7 @@
+ #include <jpeglib.h>
+ 
++#if JPEG_LIB_VERSION < 80 && !defined(MEM_SRCDST_SUPPORTED)
++
+ void
+ jpeg_mem_src (j_decompress_ptr cinfo, unsigned char * buffer,
+ 	unsigned long bufsize);
+@@ -7,3 +9,5 @@ jpeg_mem_src (j_decompress_ptr cinfo, unsigned char * buffer,
+ void
+ jpeg_mem_dest (j_compress_ptr cinfo, unsigned char ** outbuffer,
+ 	unsigned long * outsize);
++
++#endif
+-- 
+2.1.4
+
diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.8.bb b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.8.bb
index 3de6942..25c82cb 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.8.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.8.bb
@@ -14,6 +14,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/gphoto/libgphoto2-${PV}.tar.bz2;name=libgphoto2
            file://10-camera-libgphoto2.fdi \
            file://40-libgphoto2.rules \
            file://0001-configure.ac-remove-AM_PO_SUBDIRS.patch \
+           file://jpeg_memsrcdest-extend-feature-check.patch \
 "
 
 SRC_URI[libgphoto2.md5sum] = "873ab01aced49c6b92a98e515db5dcef"
-- 
2.1.4


