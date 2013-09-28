Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f54.google.com (mail-pb0-f54.google.com
	[209.85.160.54])
	by mail.openembedded.org (Postfix) with ESMTP id B7CB06C9A1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Sep 2013 10:26:43 +0000 (UTC)
Received: by mail-pb0-f54.google.com with SMTP id ro12so3569400pbb.13
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Sep 2013 03:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=kBa2dFuyTbnTYBikYC3/kQq2jmsZdScFokqtb0o7+Ok=;
	b=Zbkeqee/KUBW9SBQFS33XOz6o8y+iYhOJojGE2e7LjJHx0QVAOQBhEWMD25XdCiajF
	v2cwwAnl1T0GxkF7DTffh/fU9R5K6qWMgvYdVzSPi8831ocgd59xF+1bvETN7Dx1QMKv
	00H8uetiDaN9z5OoHMOinp+4jMvXvI4xjKrvj8hQ9CV1CfYm9Bt0o4CXf9JgV/Xv202r
	xHLvQ6wDWnSKut8pcCvKnujSquvh+4L8HhhY39pLRNfgtJ+rJvMta+6Iz7zTW93erbwY
	Zgf6h/o3DsOruH4l1ZtKksu48IMaRlQUwupF5d/nBS7VvpE6wtmXoSmrMTXO7fm92Apx
	tkKA==
X-Received: by 10.68.196.227 with SMTP id ip3mr712111pbc.163.1380364004660;
	Sat, 28 Sep 2013 03:26:44 -0700 (PDT)
Received: from haswell.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id f2sm14143276pbg.44.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 28 Sep 2013 03:26:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 28 Sep 2013 03:26:31 -0700
Message-Id: <1380363991-27494-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-oe][PATCH] opencv: Update SRC_URI to use git
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
X-List-Received-Date: Sat, 28 Sep 2013 10:26:44 -0000

opencv now has moved to using git. Lets use the git
version to fetch SRCs

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{opencv-samples_2.4.3.bb => opencv-samples_2.4.bb}       | 12 +++++-------
 .../opencv/{opencv_2.4.3.bb => opencv_2.4.bb}                | 10 ++++------
 2 files changed, 9 insertions(+), 13 deletions(-)
 rename meta-oe/recipes-support/opencv/{opencv-samples_2.4.3.bb => opencv-samples_2.4.bb} (82%)
 rename meta-oe/recipes-support/opencv/{opencv_2.4.3.bb => opencv_2.4.bb} (91%)

diff --git a/meta-oe/recipes-support/opencv/opencv-samples_2.4.3.bb b/meta-oe/recipes-support/opencv/opencv-samples_2.4.bb
similarity index 82%
rename from meta-oe/recipes-support/opencv/opencv-samples_2.4.3.bb
rename to meta-oe/recipes-support/opencv/opencv-samples_2.4.bb
index 50efd77..e00a5e6 100644
--- a/meta-oe/recipes-support/opencv/opencv-samples_2.4.3.bb
+++ b/meta-oe/recipes-support/opencv/opencv-samples_2.4.bb
@@ -7,14 +7,12 @@ DEPENDS = "opencv"
 
 LIC_FILES_CHKSUM = "file://include/opencv2/opencv.hpp;endline=41;md5=6d690d8488a6fca7a2c192932466bb14 \
 "
+SRCREV = "6fae07ba8867b8fd2c53344a774aab669afa7c5e"
+SRC_URI = "git://github.com/Itseez/opencv.git;branch=2.4 \
+          "
+PV = "2.4.3+git${SRCPV}"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/opencvlibrary/opencv-unix/${PV}/OpenCV-${PV}.tar.bz2 \
-"
-
-SRC_URI[md5sum] = "c0a5af4ff9d0d540684c0bf00ef35dbe"
-SRC_URI[sha256sum] = "f8fbe985978d4eae73e8c3b526ed40a37d4761d2029a5b035233f58146f6f59b"
-
-S = "${WORKDIR}/OpenCV-${PV}"
+S = "${WORKDIR}/git"
 
 do_install() {
     cd samples/c
diff --git a/meta-oe/recipes-support/opencv/opencv_2.4.3.bb b/meta-oe/recipes-support/opencv/opencv_2.4.bb
similarity index 91%
rename from meta-oe/recipes-support/opencv/opencv_2.4.3.bb
rename to meta-oe/recipes-support/opencv/opencv_2.4.bb
index 39b608a..3ca32f9 100644
--- a/meta-oe/recipes-support/opencv/opencv_2.4.3.bb
+++ b/meta-oe/recipes-support/opencv/opencv_2.4.bb
@@ -9,16 +9,14 @@ ARM_INSTRUCTION_SET = "arm"
 
 DEPENDS = "python-numpy v4l-utils libav gtk+ libtool swig swig-native python jpeg bzip2 zlib libpng tiff glib-2.0"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/opencvlibrary/opencv-unix/${PV}/OpenCV-${PV}.tar.bz2 \
+SRCREV = "6fae07ba8867b8fd2c53344a774aab669afa7c5e"
+SRC_URI = "git://github.com/Itseez/opencv.git;branch=2.4 \
            file://opencv-fix-pkgconfig-generation.patch \
 "
 
-SRC_URI[md5sum] = "c0a5af4ff9d0d540684c0bf00ef35dbe"
-SRC_URI[sha256sum] = "f8fbe985978d4eae73e8c3b526ed40a37d4761d2029a5b035233f58146f6f59b"
+PV = "2.4.3+git${SRCPV}"
 
-PR = "r2"
-
-S = "${WORKDIR}/OpenCV-${PV}"
+S = "${WORKDIR}/git"
 
 # Do an out-of-tree build
 OECMAKE_SOURCEPATH = "${S}"
-- 
1.8.3.2


