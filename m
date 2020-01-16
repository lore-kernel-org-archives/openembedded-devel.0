Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 224677F88D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2020 17:08:10 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id a33so10195729pgm.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2020 09:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=DkVLKwuFncZywTdwoRsQwrG67Ufxr6gb8fZfBfmbtro=;
	b=t8AhZEGmO1lRwl19B2hEsczl2Pi76AXRBCDEyMmFg8yKFQUX5JpT+sii3IWHZNv5iO
	xDDdq35Ymhdmi+GXzL7rwC1SjEp06PHaHIcQUmCDoK8hZv5qetwj/YGGrE2/H2WgryTB
	YhuUapXPtFipWubxvtfr17M5HT0IF8XtY2Nls+E2NFcdaaQ/fxGN3NLc8zGcV2q2KNa9
	Ro0tAoTq82OuIVystGFV0ieXFfwLM9FPX45CFcQbrFYEvJgnOwQfgzTl3qLrkhZJkfCI
	LvEFoSE74rrofQXQWudBK0Y0lFYc6jVUsvqV8i0sLYNjTlfX8HbbsC16etCxr5NjEko8
	tV2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=DkVLKwuFncZywTdwoRsQwrG67Ufxr6gb8fZfBfmbtro=;
	b=Ox1kaEhE1FaMFofTJAlbwKFp67/ATjfq7bfYx1mZIy5TP7xwl9KEjveVRes76ERN7O
	QSKmPUN6kgPaRCTkt7sEwkBJdg7lzVr8dAEJbTZhGcOPSQW2Ghu0aHWi6ghapGaYV3bf
	mlJgxFEOKuo2RLTsTxbBU5UMLrdk3KXnko5ECvAZjg6jikNlzA0Y0U/jbWYhzgiork4P
	zXubCr5dBeotG7uhMoE6NuVbnoBcs439kgvdCoR6dakMi8qSFPzyjOmZsEjbMyi4WsCV
	Cx4tGO9AqbZ7qmour5ao7HeIOTKablV5lKiHS8X+O1+d5/BktNw6ESYnur8G9l3rryD3
	4qSA==
X-Gm-Message-State: APjAAAWEBihGF+uRDGF2Qplsqyifdf+6N2QaYIxJ2qJ/XjLWklGMYD9j
	xGP1yG17i78c2iyoqsFNEswq6V3L0hI=
X-Google-Smtp-Source: APXvYqwSKTUpTUiMC5UxO7UoD7zWupvl5K6hCbCsCS+INIiiWKvTbSZXkR6XpdocqyVMy/vP7r6j0A==
X-Received: by 2002:a63:4287:: with SMTP id
	p129mr39799946pga.122.1579194490693; 
	Thu, 16 Jan 2020 09:08:10 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e77a])
	by smtp.gmail.com with ESMTPSA id
	z26sm27146763pfa.90.2020.01.16.09.08.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 16 Jan 2020 09:08:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Jan 2020 09:08:09 -0800
Message-Id: <20200116170809.2621066-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] opencv: Tend for the compiler --param option rename in gcc10
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
X-List-Received-Date: Thu, 16 Jan 2020 17:08:10 -0000
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


