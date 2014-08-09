Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 0570865CC9
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Aug 2014 09:34:47 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id z12so6559078wgg.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Aug 2014 02:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=pzSUyCO/wjEB5vf/q48p5gjZXDIvvPDl5Dvww6NXDyk=;
	b=sEroJ7fAdXj7u5fdAD/zUlVcm4rkGw8anXr5sf8FukQwaABXJLfWxWq9EEMCrzyLPP
	kH7VT/e9TUpGkT0QlYwRfqUXmObGwh4tB5AjwHDxFMcR+qfKRFEwlL23cSajCRA7YMtJ
	/UAtauw1GsroJTXuBWm2PdIxOSd4KK0lZfD6zvVTHlJLdHprnvZHJ4p4smOAOoHFESny
	DbZtU32r6eJos7SwLB/MQaNm8rrqS4bc440cYtZ2oB0V/FCbBYTayUJ5f+O05P5/kqN6
	0P1vyxU7o3r7YjgbIMe3ROPAmQ8pK9wNYNvbs8iQ24BrxWhUwM32yeV75gmsDvqr99iX
	qajg==
X-Received: by 10.180.149.161 with SMTP id ub1mr9994034wib.32.1407576888282;
	Sat, 09 Aug 2014 02:34:48 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	w1sm17018850wiz.14.2014.08.09.02.34.47 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Aug 2014 02:34:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Aug 2014 11:32:02 +0200
Message-Id: <1407576722-2536-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
Subject: [meta-oe][WIP][PATCH] libungif: remove and use giflib everywhere
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
X-List-Received-Date: Sat, 09 Aug 2014 09:34:51 -0000

* giflib says it's API and ABI compatible with libungif
  which was in wide use while the LZW compression algorithm was
  patented.

* the selection between giflib and libungif wasn't ever determinictic
  because of conflicts in sysroot
* resolves couple of undeterministic dependencies and:
  WARNING: The recipe giflib is trying to install files into a shared area
  when those files already exist. Those files and their manifest location
  are:
   sysroots/qemuarm/usr/include/gif_lib.h
      Matched in manifest-qemuarm-libungif.populate_sysroot
      Please verify which package should provide the above files.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/libungif/libungif_4.1.4.bb  | 16 ----------------
 meta-oe/recipes-graphics/fbida/fbida_git.bb          |  2 +-
 meta-oe/recipes-graphics/leptonica/leptonica_1.70.bb |  2 +-
 3 files changed, 2 insertions(+), 18 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/libungif/libungif_4.1.4.bb

diff --git a/meta-oe/recipes-extended/libungif/libungif_4.1.4.bb b/meta-oe/recipes-extended/libungif/libungif_4.1.4.bb
deleted file mode 100644
index aa05653..0000000
--- a/meta-oe/recipes-extended/libungif/libungif_4.1.4.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "shared library for GIF images"
-SECTION = "libs"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ae11c61b04b2917be39b11f78d71519a"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/giflib/libungif-4.x/libungif-${PV}/libungif-${PV}.tar.bz2"
-SRC_URI[md5sum] = "76865bc1bed90ecb5992a1edcc4d6c15"
-SRC_URI[sha256sum] = "708a7eac218d3fd8e8dfb13f1089d4e1e98246985180a17d6ecfca5a6bd4d332"
-
-inherit autotools lib_package
-
-PACKAGES =+ "${PN}-utils"
-
-FILES_${PN}-utils = "${bindir}/*"
-
-BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-graphics/fbida/fbida_git.bb b/meta-oe/recipes-graphics/fbida/fbida_git.bb
index f4dd01d..41c14b8 100644
--- a/meta-oe/recipes-graphics/fbida/fbida_git.bb
+++ b/meta-oe/recipes-graphics/fbida/fbida_git.bb
@@ -18,7 +18,7 @@ S = "${WORKDIR}/git"
 EXTRA_OEMAKE = "STRIP="
 
 PACKAGECONFIG ??= "gif png"
-PACKAGECONFIG[gif] = ",,libungif"
+PACKAGECONFIG[gif] = ",,giflib"
 PACKAGECONFIG[png] = ",,libpng"
 PACKAGECONFIG[tiff] = ",,tiff"
 PACKAGECONFIG[motif] = ",,libx11 libxext libxpm libxt openmotif"
diff --git a/meta-oe/recipes-graphics/leptonica/leptonica_1.70.bb b/meta-oe/recipes-graphics/leptonica/leptonica_1.70.bb
index 6d57da7..e826e05 100644
--- a/meta-oe/recipes-graphics/leptonica/leptonica_1.70.bb
+++ b/meta-oe/recipes-graphics/leptonica/leptonica_1.70.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "A pedagogically-oriented open source site containing software that is broadly useful for image processing and image analysis applications"
-DEPENDS = "jpeg tiff libpng zlib libungif"
+DEPENDS = "jpeg tiff libpng zlib giflib"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://leptonica-license.txt;md5=20cdd3af097ca431b82004c691f406a6"
 
-- 
2.0.4


