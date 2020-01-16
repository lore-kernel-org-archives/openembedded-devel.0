Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
	[209.85.210.178])
	by mail.openembedded.org (Postfix) with ESMTP id 0A7CB7F7C3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2020 19:12:19 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id q8so10674034pfh.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2020 11:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=DkVLKwuFncZywTdwoRsQwrG67Ufxr6gb8fZfBfmbtro=;
	b=AYthsWLIhv2/52BfxflVRG/+r8Sh5Eln0NXKL4t/ybQXINPLSTXSFt3tJs5Re0/1d+
	HTSMoVok2c4JUFkm2Wn+i032jenrho7wUOFN7yxDfUMbqdIgSMjsqau+kRo2pixG5fCm
	FQ31nfOQHFuMVtQwdFNXAgl/TLD6zcFwprPRf1LpC8HgsMBW4L8stSpqDZTuZglh46iq
	5Slc5PBB3vTsXeIJepN3PjJmmTZvx8OqGhHov8Eij/dGnYk4tgLUTArhzBF8demKa15g
	BXXXwjimJAHBQJPKvBhn8j0IqDYX2L+AMgr3ac+1r+sDqt1iu1v2muMlddpFtdMCGVcL
	dHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=DkVLKwuFncZywTdwoRsQwrG67Ufxr6gb8fZfBfmbtro=;
	b=hYVY4v4B1i+Nos2cwRi/3fHMtPuvjWaJmynZIYgntD9m8lPbJ8dJSGQNR9RIPgtFIp
	8NxN+ny7W8n98VXrpdRydk+MgWxuYRL7WNUgYXM6b/gtrFCP9HgNSMsiXM4Wp5ggsNOS
	oCcQTxY51vQBeWwAm8gnpVOxG5iJBzEzGxZOv6WbXQ+iQh1pK4zbkp9lPGE644ST60lG
	3l6hXMaIxwGNp+h4drG8gZYHk044pznHvP2NTf/+fzWNkA58VmiCyVa2Zk5257Kh5S3H
	2ytDWYnAckpZ2KJKB1URbkAsVmSQuW2cJ1YUzg+SNYuQB7uLM50vRok+Etu3TIGyEOnF
	o/1w==
X-Gm-Message-State: APjAAAUv9Wc4q8IN/4gDjoAr5t2fg2RSoeqLtIvParu0SGdeoQH+6Vmb
	V3GkllamI8F3cKeJ7ZLvqUtTW8d2ZSA=
X-Google-Smtp-Source: APXvYqw1t0JyUjHMrAg6We/OFZLLmCeJYMmLbPUgOMm3hu39y9XU9/Djp1qEugtkBwGmWJjDb/F1gg==
X-Received: by 2002:a63:364f:: with SMTP id d76mr41958152pga.215.1579201940384;
	Thu, 16 Jan 2020 11:12:20 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e77a])
	by smtp.gmail.com with ESMTPSA id l10sm4539199pjy.5.2020.01.16.11.12.19
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 16 Jan 2020 11:12:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Jan 2020 11:12:14 -0800
Message-Id: <20200116191218.2768160-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/5] opencv: Tend for the compiler --param option rename in gcc10
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
X-List-Received-Date: Thu, 16 Jan 2020 19:12:20 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-ipcp-unit-growth-with-ipa-cp-unit-g.patch | 55 +++++++++++++++++++
 .../recipes-support/opencv/opencv_4.1.0.bb    |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta-oe/recipes-support/opencv/opencv/0001-carotene-Replace-ipcp-unit-growth-with-ipa-cp-unit-g.patch

diff --git a/meta-oe/recipes-support/opencv/opencv/0001-carotene-Replace-ipcp-unit-growth-with-ipa-cp-unit-g.patch b/meta-oe/recipes-support/opencv/opencv/0001-carotene-Replace-ipcp-unit-growth-with-ipa-cp-unit-g.patch
new file mode 100644
index 0000000000..43d32fbc75
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv/0001-carotene-Replace-ipcp-unit-growth-with-ipa-cp-unit-g.patch
@@ -0,0 +1,55 @@
+From 1edc925ecd7fb54d2dc78452069084475fbe2a70 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 16 Jan 2020 08:52:00 -0800
+Subject: [PATCH] carotene: Replace ipcp-unit-growth with ipa-cp-unit-growth on gcc >= 10
+
+gcc 10+ has renamed this option, therefore check for gcc version before
+deciding which name to use for opt parameter
+
+Upstream-Status: Submitted [https://github.com/opencv/opencv/pull/16369]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ 3rdparty/carotene/CMakeLists.txt     | 8 ++++++--
+ 3rdparty/carotene/hal/CMakeLists.txt | 7 ++++++-
+ 2 files changed, 12 insertions(+), 3 deletions(-)
+
+diff --git a/3rdparty/carotene/CMakeLists.txt b/3rdparty/carotene/CMakeLists.txt
+index bfa9368d79..1c43b85b28 100644
+--- a/3rdparty/carotene/CMakeLists.txt
++++ b/3rdparty/carotene/CMakeLists.txt
+@@ -20,8 +20,12 @@ if(CMAKE_COMPILER_IS_GNUCC)
+     # - matchTemplate about 5-10%
+     # - goodFeaturesToTrack 10-20%
+     # - cornerHarris 30% for some cases
+-
+-    set_source_files_properties(${carotene_sources} COMPILE_FLAGS "--param ipcp-unit-growth=100000 --param inline-unit-growth=100000 --param large-stack-frame-growth=5000")
++    set_source_files_properties(${carotene_sources} COMPILE_FLAGS "--param inline-unit-growth=100000 --param large-stack-frame-growth=5000")
++    if(CMAKE_CXX_COMPILER_VERSION VERSION_LESS "10.0.0")
++	    set_source_files_properties(${carotene_sources} COMPILE_FLAGS "--param ipcp-unit-growth=100000 ${COMPILE_FLAGS}")
++    else()
++	    set_source_files_properties(${carotene_sources} COMPILE_FLAGS "--param ipa-cp-unit-growth=100000 ${COMPILE_FLAGS}")
++    endif()
+ endif()
+ 
+ add_library(carotene_objs OBJECT
+diff --git a/3rdparty/carotene/hal/CMakeLists.txt b/3rdparty/carotene/hal/CMakeLists.txt
+index c4b9acaedd..bbc5b11a80 100644
+--- a/3rdparty/carotene/hal/CMakeLists.txt
++++ b/3rdparty/carotene/hal/CMakeLists.txt
+@@ -90,7 +90,12 @@ set_property(DIRECTORY APPEND PROPERTY COMPILE_DEFINITIONS ${carotene_defs})
+     #   matchTemplate about 5-10%
+     #   goodFeaturesToTrack 10-20%
+     #   cornerHarris 30% for some cases
+-    set_source_files_properties(impl.cpp $<TARGET_OBJECTS:carotene_objs> COMPILE_FLAGS "--param ipcp-unit-growth=100000 --param inline-unit-growth=100000 --param large-stack-frame-growth=5000")
++    set_source_files_properties(impl.cpp $<TARGET_OBJECTS:carotene_objs> COMPILE_FLAGS "--param inline-unit-growth=100000 --param large-stack-frame-growth=5000")
++    if(CMAKE_CXX_COMPILER_VERSION VERSION_LESS "10.0.0")
++      set_source_files_properties(impl.cpp $<TARGET_OBJECTS:carotene_objs> COMPILE_FLAGS "--param ipcp-unit-growth=100000 ${COMPILE_FLAGS}")
++    else()
++      set_source_files_properties(impl.cpp $<TARGET_OBJECTS:carotene_objs> COMPILE_FLAGS "--param ipa-cp-unit-growth=100000 ${COMPILE_FLAGS}")
++    endif()
+ #    set_source_files_properties(impl.cpp $<TARGET_OBJECTS:carotene_objs> COMPILE_FLAGS "--param ipcp-unit-growth=100000 --param inline-unit-growth=100000 --param large-stack-frame-growth=5000")
+   endif()
+ 
+-- 
+2.25.0
+
diff --git a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb b/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
index f679ccb05f..d781da6005 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
@@ -48,6 +48,7 @@ SRC_URI = "git://github.com/opencv/opencv.git;name=opencv \
            file://0003-To-fix-errors-as-following.patch \
            file://0001-Temporarliy-work-around-deprecated-ffmpeg-RAW-functi.patch \
            file://0001-Dont-use-isystem.patch \
+           file://0001-carotene-Replace-ipcp-unit-growth-with-ipa-cp-unit-g.patch \
            file://download.patch \
            "
 PV = "4.1.0"
-- 
2.25.0


