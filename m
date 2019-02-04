Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id 4F22C7BF9E
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Feb 2019 18:11:09 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id z11so277686pgu.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Feb 2019 10:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1Ugl4dfk07YOLVpbriaohauUa5j3LMzTZ4pfATkikCQ=;
	b=gU2+uC3ZO8uU5IZKV4g3CmsxR54waMOC2WJ8rskwnU8DQGZMk2mjdsvthPOqAKeBQO
	MvaGl76Cp1+eui88jL6Vt2/7n8Q+wxsbVom4C0gbF7cy/D+eYJ/VXGgrtjG8EAlTByxp
	121QIktU/uEdC9UXjR+CzKsOX6YH+fKCzLi3MXNRHD2GIWTuuwPq5e9CMKZqt/9hb5QD
	nnqCQ1c7RZcDEQFtPy3UM3rga0CM/aCX2NltZJ+vdozGeUF1R7vn1utWsQH5a2ZvoWWG
	Xsip82WMdYTNtRkbG79CUZl+NVblyePQ1JiwQzkiRRtS++d2uPtDc9XWFh4t61ftJgXc
	izUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1Ugl4dfk07YOLVpbriaohauUa5j3LMzTZ4pfATkikCQ=;
	b=jCRZZNITlLOJUnJlXTYxe/TIaMMPT7yuY3Zk2T9cfjqX/e5fSEpLbivc1YdpVfjx4x
	fD9B63oOcMFlKYZhLjO9BvTetfUz8siJX5+FtWB19MiNmABN447W6hbzPKiwWbyQrZyr
	FsPNu5toqOYfzTpsi+FOt5+y2MyQFCLT4V5n3nokYQ0jr53M770P1+trIat5adFZhIvD
	vKaL1mdxIX5SCAS+PGTilWzeMovUsrNnW0aVvJ5PkdWaCVgXUtHGOkom7XoXNnRh2z/S
	wIhRbTTwDrqHe3ytUdweahaqWEUAvM6p06pdFzkWzqXfaZm9krefzZDOTTizNzprf00I
	gjtw==
X-Gm-Message-State: AHQUAuYl9/YfQWbsLLKJL2LW8+U92sxyUW9/AKIvv/9EHJ7x4YzsPNdc
	h2gi6H8z3HCuzmhQsLZbb7uIyyOE
X-Google-Smtp-Source: AHgI3IbCnf7ARcxIEr1P1I4R5swdI1IB5LU35Siw9JIk3hWGWn9XXQdJ7yQsYN3Kj8f3P0B+xp4kUg==
X-Received: by 2002:a62:16d6:: with SMTP id 205mr637901pfw.256.1549303869735; 
	Mon, 04 Feb 2019 10:11:09 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::1609])
	by smtp.gmail.com with ESMTPSA id b2sm991515pfm.3.2019.02.04.10.11.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Feb 2019 10:11:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Feb 2019 10:10:59 -0800
Message-Id: <20190204181101.22055-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/3] opencv: Upgrade to 3.4.5
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
X-List-Received-Date: Mon, 04 Feb 2019 18:11:09 -0000
Content-Transfer-Encoding: 8bit

Drop adding git revs to PV, its not needed since we are on release tag
Drop upstreamed patches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...001-Add-missing-multi-line-separator.patch | 36 -------------------
 ...Check-for-clang-before-using-isystem.patch | 32 -----------------
 .../{opencv_3.4.3.bb => opencv_3.4.5.bb}      | 22 ++++++------
 3 files changed, 11 insertions(+), 79 deletions(-)
 delete mode 100644 meta-oe/recipes-support/opencv/opencv/0001-Add-missing-multi-line-separator.patch
 delete mode 100644 meta-oe/recipes-support/opencv/opencv/0001-Check-for-clang-before-using-isystem.patch
 rename meta-oe/recipes-support/opencv/{opencv_3.4.3.bb => opencv_3.4.5.bb} (94%)

diff --git a/meta-oe/recipes-support/opencv/opencv/0001-Add-missing-multi-line-separator.patch b/meta-oe/recipes-support/opencv/opencv/0001-Add-missing-multi-line-separator.patch
deleted file mode 100644
index 513597b8c2..0000000000
--- a/meta-oe/recipes-support/opencv/opencv/0001-Add-missing-multi-line-separator.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 60857229aab13ccc426572a43ab891409bb76ea4 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 9 Sep 2018 22:52:55 -0700
-Subject: [PATCH] Add missing multi-line separator
-
-Otherwise this fails to build ( found on mips )
-
-Fixes
-contrib/modules/surface_matching/src/hash_murmur86.hpp:97:15: error:
-expected constructor, destructor, or type conversion before '(' token
-     && defined(__GNUC__) && (__GNUC__>4 || (__GNUC__==4 &&
-__GNUC_MINOR__>=3))
-               ^
-
-Upstream-Status: Submitted [https://github.com/opencv/opencv_contrib/pull/1764]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- modules/surface_matching/src/hash_murmur86.hpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/modules/surface_matching/src/hash_murmur86.hpp b/modules/surface_matching/src/hash_murmur86.hpp
-index 1edf6bf4..0477d37e 100644
---- a/modules/surface_matching/src/hash_murmur86.hpp
-+++ b/modules/surface_matching/src/hash_murmur86.hpp
-@@ -93,7 +93,7 @@ void hashMurmurx86 ( const void * key, const int len, const uint seed, void * ou
- /* Now find best way we can to READ_UINT32 */
- #ifndef WORDS_BIGENDIAN
- # define READ_UINT32(ptr)   (*((uint32_t*)(ptr)))
--#elif defined(WORDS_BIGENDIAN)
-+#elif defined(WORDS_BIGENDIAN) \
-     && defined(__GNUC__) && (__GNUC__>4 || (__GNUC__==4 && __GNUC_MINOR__>=3))
- # define READ_UINT32(ptr)   (__builtin_bswap32(*((uint32_t*)(ptr))))
- #endif
--- 
-2.18.0
-
diff --git a/meta-oe/recipes-support/opencv/opencv/0001-Check-for-clang-before-using-isystem.patch b/meta-oe/recipes-support/opencv/opencv/0001-Check-for-clang-before-using-isystem.patch
deleted file mode 100644
index 319071a311..0000000000
--- a/meta-oe/recipes-support/opencv/opencv/0001-Check-for-clang-before-using-isystem.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From fa76d8646bb2b9b514728eeef41afed7c43a36f2 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 11 Sep 2018 18:18:33 -0700
-Subject: [PATCH] Check for clang before using -isystem
-
-When cross compiling with clang, the internal C++ headers are not found
-when adding sysroot to -isystem, that is redundant anyway because it
-will look for headers insider --sysroot path with same quality as it
-would do with -isystem otherwise
-
-Upstream-Status: Submitted [https://github.com/opencv/opencv/pull/12504]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- cmake/OpenCVUtils.cmake | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/cmake/OpenCVUtils.cmake b/cmake/OpenCVUtils.cmake
-index fae91c165f..60c20192dc 100644
---- a/cmake/OpenCVUtils.cmake
-+++ b/cmake/OpenCVUtils.cmake
-@@ -259,7 +259,7 @@ function(ocv_include_directories)
-     ocv_is_opencv_directory(__is_opencv_dir "${dir}")
-     if(__is_opencv_dir)
-       list(APPEND __add_before "${dir}")
--    elseif(CV_GCC AND NOT CMAKE_CXX_COMPILER_VERSION VERSION_LESS "6.0" AND
-+    elseif(((CV_GCC AND NOT CMAKE_CXX_COMPILER_VERSION VERSION_LESS "6.0") OR CV_CLANG) AND
-            dir MATCHES "/usr/include$")
-       # workaround for GCC 6.x bug
-     else()
--- 
-2.18.0
-
diff --git a/meta-oe/recipes-support/opencv/opencv_3.4.3.bb b/meta-oe/recipes-support/opencv/opencv_3.4.5.bb
similarity index 94%
rename from meta-oe/recipes-support/opencv/opencv_3.4.3.bb
rename to meta-oe/recipes-support/opencv/opencv_3.4.5.bb
index 2b25e39dc9..d299c599b8 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.4.3.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.4.5.bb
@@ -10,9 +10,9 @@ ARM_INSTRUCTION_SET_armv5 = "arm"
 
 DEPENDS = "libtool swig-native bzip2 zlib glib-2.0 libwebp"
 
-SRCREV_opencv = "b38c50b3d0c31e82294315ec44b54b7ef559ef12"
-SRCREV_contrib = "1f6d6f06266e1ef336437ae5404bee1c65d42cda"
-SRCREV_ipp = "bdb7bb85f34a8cb0d35e40a81f58da431aa1557a"
+SRCREV_opencv = "8f1356c3c5b16721349582db461a2051653059e8"
+SRCREV_contrib = "7292df62624ded8af8035231435dfd17c93e1a80"
+SRCREV_ipp = "32e315a5b106a7b89dbed51c28f8120a48b368b4"
 SRCREV_boostdesc = "34e4206aef44d50e6bbcd0ab06354b52e7466d26"
 SRCREV_vgg = "fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d"
 SRC_URI[tinydnn.md5sum] = "adb1c512e09ca2c7a6faef36f9c53e59"
@@ -22,17 +22,17 @@ def ipp_filename(d):
     import re
     arch = d.getVar('TARGET_ARCH')
     if re.match("i.86$", arch):
-        return "ippicv_2017u3_lnx_ia32_general_20180518.tgz"
+        return "ippicv_2019_lnx_ia32_general_20180723.tgz"
     else:
-        return "ippicv_2017u3_lnx_intel64_general_20180518.tgz"
+        return "ippicv_2019_lnx_intel64_general_20180723.tgz"
 
 def ipp_md5sum(d):
     import re
     arch = d.getVar('TARGET_ARCH')
     if re.match("i.86$", arch):
-        return "ea72de74dae3c604eb6348395366e78e"
+        return "4f38432c30bfd6423164b7a24bbc98a0"
     else:
-        return "b7cc351267db2d34b9efa1cd22ff0572"
+        return "c0bd78adb4156bbf552c1dfe90599607"
 
 IPP_FILENAME = "${@ipp_filename(d)}"
 IPP_MD5 = "${@ipp_md5sum(d)}"
@@ -40,21 +40,19 @@ IPP_MD5 = "${@ipp_md5sum(d)}"
 SRCREV_FORMAT = "opencv_contrib_ipp_boostdesc_vgg"
 SRC_URI = "git://github.com/opencv/opencv.git;name=opencv \
     git://github.com/opencv/opencv_contrib.git;destsuffix=contrib;name=contrib \
-    git://github.com/opencv/opencv_3rdparty.git;branch=ippicv/master_20180518;destsuffix=ipp;name=ipp \
+    git://github.com/opencv/opencv_3rdparty.git;branch=ippicv/master_20180723;destsuffix=ipp;name=ipp \
     git://github.com/opencv/opencv_3rdparty.git;branch=contrib_xfeatures2d_boostdesc_20161012;destsuffix=boostdesc;name=boostdesc \
     git://github.com/opencv/opencv_3rdparty.git;branch=contrib_xfeatures2d_vgg_20160317;destsuffix=vgg;name=vgg \
     https://github.com/tiny-dnn/tiny-dnn/archive/v1.0.0a3.tar.gz;destsuffix=git/3rdparty/tinydnn/tiny-dnn-1.0.0a3;name=tinydnn;unpack=false \
     file://0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch \
     file://uselocalxfeatures.patch;patchdir=../contrib/ \
-    file://0001-Add-missing-multi-line-separator.patch;patchdir=../contrib/ \
     file://0002-Make-opencv-ts-create-share-library-intead-of-static.patch \
     file://0003-To-fix-errors-as-following.patch \
     file://fixpkgconfig.patch \
     file://0001-Temporarliy-work-around-deprecated-ffmpeg-RAW-functi.patch \
     file://0001-Dont-use-isystem.patch \
-    file://0001-Check-for-clang-before-using-isystem.patch \
 "
-PV = "3.4.3+git${SRCPV}"
+PV = "3.4.5"
 
 S = "${WORKDIR}/git"
 
@@ -180,6 +178,8 @@ SUMMARY_python3-opencv = "Python bindings to opencv"
 FILES_python3-opencv = "${PYTHON_SITEPACKAGES_DIR}/*"
 RDEPENDS_python3-opencv = "python3-core python3-numpy"
 
+RDEPENDS_opencv-apps  = "bash"
+
 do_install_append() {
     cp ${S}/include/opencv/*.h ${D}${includedir}/opencv/
     sed -i '/blobtrack/d' ${D}${includedir}/opencv/cvaux.h
-- 
2.20.1


