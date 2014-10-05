Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 0D7E67054E
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  5 Oct 2014 17:13:33 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id d1so2621619wiv.14
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Oct 2014 10:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=u3BKPpCxjaB2XagzCFNER7y7pZTZ8xkf/dPS/pq6ALY=;
	b=nPhMmCWy0PnA+lKqCXP9cldy0QGVRLR0N/Mhhy36o32a2cuhdo2QrOUu7nIbhDteAO
	wG+Q7P5BSFJML8U/PFzhqnND/lkK63tk4S3018K6btWZeZaHNKAk0HGeImKOqfYsmnAx
	baoWAHBmJnzcm5w+jC63gQhtApMYBp/Rk9GGkiMzkskaF1T4fEro35Yn+Mp9a7WkW1QK
	IKQ6RoqLoJdm/SEm0gaIhtVO8TdYobB6eB80mJUWadkfv9UIcUY54K3mx9oVraMTUJmp
	DzLXYhlcYe3JzahNEGaGyq3xrRrpNJpHiNw3ubXkzDFCt9/M62JVuNSYcI18duszwN3a
	5+yA==
X-Received: by 10.180.211.36 with SMTP id mz4mr13614251wic.39.1412529214152;
	Sun, 05 Oct 2014 10:13:34 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id u7sm8557404wif.7.2014.10.05.10.13.33
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 05 Oct 2014 10:13:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 Oct 2014 19:14:30 +0200
Message-Id: <1412529272-10914-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.1.1
Subject: [meta-oe][PATCH 1/3] fftw: add virtual/fftw to PROVIDES and EXCLUDE_FROM_WORLD
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
X-List-Received-Date: Sun, 05 Oct 2014 17:13:40 -0000

* now when sysroot conflicts are fatal we really don't want to build
  multiple fftw providers in the same sysroot

  ERROR: The recipe fftwl is trying to install files into a shared area
  when those files already exist. Those files and their manifest
  location are:
     /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm/usr/include/fftw3.f
     Matched in
	manifest-qemuarm-fftw.populate_sysroot
	manifest-qemuarm-fftwf.populate_sysroot

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/fftw/fftw.inc                    | 2 ++
 meta-oe/recipes-support/fftw/fftwf_3.3.4.bb              | 3 +++
 meta-oe/recipes-support/fftw/fftwl_3.3.4.bb              | 3 +++
 meta-oe/recipes-support/imagemagick/imagemagick_6.8.9.bb | 2 +-
 meta-oe/recipes-support/nonworking/fftw/benchfft_3.1.bb  | 2 +-
 5 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/fftw/fftw.inc b/meta-oe/recipes-support/fftw/fftw.inc
index 6bd622d..9007e1d 100644
--- a/meta-oe/recipes-support/fftw/fftw.inc
+++ b/meta-oe/recipes-support/fftw/fftw.inc
@@ -3,6 +3,8 @@ SECTION = "libs"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
+PROVIDES = "virtual/fftw"
+
 RPROVIDES_${PN} += "libfftw3"
 
 SRC_URI = "http://www.fftw.org/fftw-${PV}.tar.gz"
diff --git a/meta-oe/recipes-support/fftw/fftwf_3.3.4.bb b/meta-oe/recipes-support/fftw/fftwf_3.3.4.bb
index 59f4a11..7a4fbac 100644
--- a/meta-oe/recipes-support/fftw/fftwf_3.3.4.bb
+++ b/meta-oe/recipes-support/fftw/fftwf_3.3.4.bb
@@ -1,5 +1,8 @@
 require fftw.inc
 
+# conflicts with fftw and fftwl
+EXCLUDE_FROM_WORLD = "1"
+
 EXTRA_OECONF += "--enable-single \
     ${@base_contains('TUNE_FEATURES', 'neon', '--enable-neon', '', d)} \
 "
diff --git a/meta-oe/recipes-support/fftw/fftwl_3.3.4.bb b/meta-oe/recipes-support/fftw/fftwl_3.3.4.bb
index 8f37346..432ff12 100644
--- a/meta-oe/recipes-support/fftw/fftwl_3.3.4.bb
+++ b/meta-oe/recipes-support/fftw/fftwl_3.3.4.bb
@@ -1,5 +1,8 @@
 require fftw.inc
 
+# conflicts with fftw and fftwf
+EXCLUDE_FROM_WORLD = "1"
+
 EXTRA_OECONF += "--enable-long-double"
 
 SRC_URI[md5sum] = "2edab8c06b24feeb3b82bbb3ebf3e7b3"
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_6.8.9.bb b/meta-oe/recipes-support/imagemagick/imagemagick_6.8.9.bb
index 9b15f62..454db64 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_6.8.9.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_6.8.9.bb
@@ -3,7 +3,7 @@ SECTION = "console/utils"
 LICENSE = "ImageMagick"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d84c6ddd4028aa53d028b4c50f9361e"
 # FIXME: There are many more checked libraries. All should be added or explicitly disabled to get consistent results.
-DEPENDS = "lcms bzip2 jpeg libpng librsvg tiff zlib fftw freetype"
+DEPENDS = "lcms bzip2 jpeg libpng librsvg tiff zlib virtual/fftw freetype"
 
 PATCHSET = "8"
 SRC_URI = "http://www.imagemagick.org/download/ImageMagick-${PV}-${PATCHSET}.tar.bz2 \
diff --git a/meta-oe/recipes-support/nonworking/fftw/benchfft_3.1.bb b/meta-oe/recipes-support/nonworking/fftw/benchfft_3.1.bb
index 5da4561..feb3c3c 100644
--- a/meta-oe/recipes-support/nonworking/fftw/benchfft_3.1.bb
+++ b/meta-oe/recipes-support/nonworking/fftw/benchfft_3.1.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "GPLv2"
 
 # single precision fftw is called fftwf 
-DEPENDS = "fftwf"
+DEPENDS = "virtual/fftw"
 
 SRC_URI = "http://www.fftw.org/benchfft/benchfft-${PV}.tar.gz"
 
-- 
2.1.1


