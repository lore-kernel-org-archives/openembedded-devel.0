Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1R5UYC-0006Id-Pg
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Sep 2011 05:29:44 +0200
Received: by iadx2 with SMTP id x2so6478178iad.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Sep 2011 20:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=D/o+vuyVz7nTs7blb89bmdx234C7tNmg7wrK8vXZIqQ=;
	b=cs6g+iyUuR6nvnHFhzYwZLZglPDJQPt1oojAAUHCslCk4oBLkNnrAGtCXnepHURi7v
	KA3WCGTPfZJZK8I/GV0nNUiENlVCd+ZPO7NvE/It+YcsuJIin1LqA/qJkDg/QmBQF5ma
	VTA2UlXqb6tAog5hw/dwAVqWZUV/S5MiBsBoQ=
Received: by 10.42.138.1 with SMTP id a1mr3568295icu.72.1316402668412;
	Sun, 18 Sep 2011 20:24:28 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id z11sm23709034iba.6.2011.09.18.20.24.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 18 Sep 2011 20:24:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Sep 2011 20:24:18 -0700
Message-Id: <1316402659-14220-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [meta-oe][PATCH 1/2] imagemagick: Fix configure on x86_64
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Sep 2011 03:29:45 -0000

imagemagick has configure time execution test for large file offset
they wont be able to run in cross compile. We cache it.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../imagemagick/imagemagick_6.4.4.bb               |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_6.4.4.bb b/meta-oe/recipes-support/imagemagick/imagemagick_6.4.4.bb
index 40f9736..c38c644 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_6.4.4.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_6.4.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e1ebcc1358b9f81eba64255fc5da6892"
 # FIXME: There is much more checked libraries. All should be added or explicitly disabled to get consistent results.
 DEPENDS = "lcms bzip2 jpeg libpng librsvg tiff zlib"
 
-PR = "r7"
+PR = "r8"
 
 PATCHSET = "1"
 SRC_URI = "ftp://ftp.nluug.nl/pub/ImageMagick/ImageMagick-${PV}-${PATCHSET}.tar.bz2 \
@@ -32,3 +32,7 @@ FILES_${PN}-dbg += "${libdir}/ImageMagick-${IMVER}/modules-Q16/*/.debug/*"
 BBCLASSEXTEND = "native"
 
 LEAD_SONAME = "libMagickCore.so.*"
+
+do_configure_prepend() {
+    export ac_cv_sys_file_offset_bits=yes
+}
-- 
1.7.5.4



