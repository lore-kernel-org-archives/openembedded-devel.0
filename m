Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id ADE187F969
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Nov 2019 03:49:43 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id a18so7535795plm.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Nov 2019 19:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7DxEYFwcJ8X3YhrMIVKvYi+D8aju4LbeTwOURUrzocg=;
	b=dYkb/imHJSVaTbCAUQX0JgMojSqukSQpB577Y+h0qI6ZlurStq0hy4Bv0MNDjHwprU
	55Xc0cUs741mU/mAQF1ITx+9vV3ELjg83kWPqJzLZ6dIj8RhYJtwFytQC6RB8CikOCZI
	UY8ZkDoxg5mwlMaMiVgWAf/icOqmjpBAPVo9qriceWJWT7j5LR25MH7I0mNVhPm2rOAY
	qJCRCQ229mXPwgNNEGfuEeS4dyarbYO+qJeOMkRXOzh1cENJopcDxDrys28YsHSc7J3c
	jELNbmPB3MU6z9oQwBtPVaIYFacLwz6KHWGNO4t+KSmRti3ls30gxgNwg/AbQpZexnpp
	bFmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7DxEYFwcJ8X3YhrMIVKvYi+D8aju4LbeTwOURUrzocg=;
	b=doVkgc7nMc/DJJmlmHggPajYCD5rC++PVza777mDILwiVHoBb0QswRkXUoPzp9UIL2
	0HG+e9K8F376swinW+ReywSP4GpZCfJYq+HMV5VyrXYsEg3NC3GZk47IMBgpBDyImDpC
	Y2RNngW4KQzpS+V0q/MH0JP0voAR+BZjfChPBkDj4f1FQTmq9X3GjRDkfzB6U9vWLAx8
	27eyl5YRTpEAHnMmnk6axYGYR6IzdsyU/n+4deM/t6oChvBPMV3K1kgt+vhIXTTnnzQ4
	LPc2Nz4T2dDz73L8qZCorzoO5KRSyuCLSivQgrwo6AJtO4jj3VHrJjhW/ftaqPeZ81eS
	xCnw==
X-Gm-Message-State: APjAAAXfG+5BcGlH4MtCm6KdE+m9PeUFo5eyHy1rvz67WA8pNG+PXzSo
	GcRPFgyHxGx3ovQPW/AehXsCS7OxE2A=
X-Google-Smtp-Source: APXvYqwD290H6vdpsTipA57bGNWjJBczPvHx1916eYrV/4iphVwGg1aaOtC44oAggDeRARz0a2v04g==
X-Received: by 2002:a17:90a:ec07:: with SMTP id
	l7mr30004539pjy.68.1573962583880; 
	Sat, 16 Nov 2019 19:49:43 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::30e8])
	by smtp.gmail.com with ESMTPSA id
	w15sm14881103pfn.13.2019.11.16.19.49.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 16 Nov 2019 19:49:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 16 Nov 2019 19:49:27 -0800
Message-Id: <20191117034929.3298760-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/3] poppler: Extend the c/c++ flags fix to cover clang
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
X-List-Received-Date: Sun, 17 Nov 2019 03:49:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...Do-not-overwrite-all-our-build-flags.patch | 24 +++++++++++++++----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-support/poppler/poppler/0001-Do-not-overwrite-all-our-build-flags.patch b/meta-oe/recipes-support/poppler/poppler/0001-Do-not-overwrite-all-our-build-flags.patch
index 18f508519e..05e0abede6 100644
--- a/meta-oe/recipes-support/poppler/poppler/0001-Do-not-overwrite-all-our-build-flags.patch
+++ b/meta-oe/recipes-support/poppler/poppler/0001-Do-not-overwrite-all-our-build-flags.patch
@@ -13,11 +13,9 @@ Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
  cmake/modules/PopplerMacros.cmake | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/cmake/modules/PopplerMacros.cmake b/cmake/modules/PopplerMacros.cmake
-index ccb2790..0f392cb 100644
 --- a/cmake/modules/PopplerMacros.cmake
 +++ b/cmake/modules/PopplerMacros.cmake
-@@ -125,14 +125,14 @@ if(CMAKE_COMPILER_IS_GNUCXX)
+@@ -123,14 +123,14 @@ if(CMAKE_COMPILER_IS_GNUCXX)
    set(DEFAULT_COMPILE_WARNINGS_EXTRA "${_warn} ${_warnx}")
  
    set(_save_cxxflags "${CMAKE_CXX_FLAGS}")
@@ -34,5 +32,21 @@ index ccb2790..0f392cb 100644
    set(CMAKE_C_FLAGS_RELWITHDEBINFO   "-O2 -g ${_save_cflags}")
    set(CMAKE_C_FLAGS_RELEASE          "-O2 -DNDEBUG ${_save_cflags}")
    set(CMAKE_C_FLAGS_DEBUG            "-g -O2 -fno-reorder-blocks -fno-schedule-insns -fno-inline ${_save_cflags}")
--- 
-2.14.3
+@@ -167,7 +167,7 @@ if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL
+   set(DEFAULT_COMPILE_WARNINGS_EXTRA "${_warn} ${_warnx}")
+ 
+   set(_save_cxxflags "${CMAKE_CXX_FLAGS}")
+-  set(CMAKE_CXX_FLAGS                "-fno-exceptions -fno-check-new -fno-common -D_DEFAULT_SOURCE")
++  set(CMAKE_CXX_FLAGS                "-fno-exceptions -fno-check-new -fno-common -D_DEFAULT_SOURCE ${_save_cxxflags}")
+   set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "-O2 -g ${_save_cxxflags}")
+   set(CMAKE_CXX_FLAGS_RELEASE        "-O2 -DNDEBUG ${_save_cxxflags}")
+   # clang does not support -fno-reorder-blocks -fno-schedule-insns, so do not use -O2
+@@ -175,7 +175,7 @@ if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL
+   set(CMAKE_CXX_FLAGS_DEBUGFULL      "-g3 -fno-inline ${_save_cxxflags}")
+   set(CMAKE_CXX_FLAGS_PROFILE        "-g3 -fno-inline -ftest-coverage -fprofile-arcs ${_save_cxxflags}")
+   set(_save_cflags "${CMAKE_C_FLAGS}")
+-  set(CMAKE_C_FLAGS                  "-std=c99 -D_DEFAULT_SOURCE")
++  set(CMAKE_C_FLAGS                  "-std=c99 -D_DEFAULT_SOURCE ${_save_cflags}")
+   set(CMAKE_C_FLAGS_RELWITHDEBINFO   "-O2 -g ${_save_cflags}")
+   set(CMAKE_C_FLAGS_RELEASE          "-O2 -DNDEBUG ${_save_cflags}")
+   # clang does not support -fno-reorder-blocks -fno-schedule-insns, so do not use -O2
-- 
2.24.0


