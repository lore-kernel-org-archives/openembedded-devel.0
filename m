Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id F139574941
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Apr 2018 22:03:14 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id u189so22081496wmd.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Apr 2018 15:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=HhHT8EhjAe9FSTcCtjm2WXXg8gB1xTAw8PRfC2RIgLs=;
	b=k11QkzcD7k2tQ8sDH+qPZ+wQ+4mltgVD7i/ceyn3YFY+ZyTyp07TqdinqFCkDw0bfi
	wA1bJZkME8X/pOJgvi/fFzXrT3xUyz3b4oHFYEPilNJP2NDaTDx+YL+zC64eHkSdcoVK
	Us3hEgZLAO9kLu3OY0RtOCxHQutoi0KdqV1ZMQ1Ph8K7edc/rmE0/hy5hLxyqUZzBGa5
	lE1AN+cZOxdg6Yw5ucfqAP2ENxIZ45VNGSJBtIe3M7mB5/ynUI50871kWVeAzNPE57bw
	KKozGo6eHzWNa4PktVCMS6ui/bOqEXr+eN8qNAUUxB9VahNBoMk1j7sXQYD+IDp64yV6
	87XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=HhHT8EhjAe9FSTcCtjm2WXXg8gB1xTAw8PRfC2RIgLs=;
	b=K9lLDgmRO0rfV8ehBYDpu4flRfMG5J7tULxFVJtSHKQ7lvOstUSIRbSuVPTjDouNvm
	ZEoGNnOB86rMe/zZBhdwd8Y7eVuK/+QaB7nvzAHHieZHBOeG29IOKDIstEcdT8NiVxqZ
	meaY+AZcGNpPBft4L9CXe7AG+6dT8iozRD94B2aAQ9zqoCFaSyjTSJbf7YmED+CbThEY
	v8l72PCyfAocRKaybmqZ3YUufS6JIKSDCKr/olH5/sKCEYzmDa8NNeEqQgCV+dKHEeoc
	qnAkR3ZJMta7qFa7jibQ9NGW5Ia5Jj79GS65sCoGRyIBZSI46ws8CEEWLNZd+xFZyd8d
	hEZA==
X-Gm-Message-State: ALQs6tD1g1XIVL2+jWTu8eTBKmAhOv0y8+CZffg+4k+ZFUi2LsbBZuyR
	jyoC82OcLYNGwdT0WJdcTySAcg==
X-Google-Smtp-Source: AIpwx4+Xm6x/hRa4Q7UJtGQmr4r5v59gDK/xZIQ1k5MI7Vho7LSrpMDwV2nwyUvb4Fy3yrA5wNx0vQ==
X-Received: by 10.28.99.84 with SMTP id x81mr7469wmb.8.1523311394999;
	Mon, 09 Apr 2018 15:03:14 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC14F231E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:4f23:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	g185sm650954wmf.40.2018.04.09.15.03.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 09 Apr 2018 15:03:14 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Apr 2018 00:02:42 +0200
Message-Id: <20180409220249.11796-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180409220249.11796-1-schnitzeltony@gmail.com>
References: <20180409220249.11796-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/9] poppler: Rework patch fixing do_configure
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
X-List-Received-Date: Mon, 09 Apr 2018 22:03:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Turn the patch from a workaround into a proper fix. It was submitted to poppler
bugzilla.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...0001-Do-not-overwrite-all-our-build-flags.patch | 36 ++++++++++++----------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/meta-oe/recipes-support/poppler/poppler/0001-Do-not-overwrite-all-our-build-flags.patch b/meta-oe/recipes-support/poppler/poppler/0001-Do-not-overwrite-all-our-build-flags.patch
index 5b66a8a9c..18f508519 100644
--- a/meta-oe/recipes-support/poppler/poppler/0001-Do-not-overwrite-all-our-build-flags.patch
+++ b/meta-oe/recipes-support/poppler/poppler/0001-Do-not-overwrite-all-our-build-flags.patch
@@ -10,27 +10,29 @@ Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
 ---
- cmake/modules/PopplerMacros.cmake | 2 ++
- 1 file changed, 2 insertions(+)
+ cmake/modules/PopplerMacros.cmake | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/cmake/modules/PopplerMacros.cmake b/cmake/modules/PopplerMacros.cmake
-index ccb2790..f29481e 100644
+index ccb2790..0f392cb 100644
 --- a/cmake/modules/PopplerMacros.cmake
 +++ b/cmake/modules/PopplerMacros.cmake
-@@ -98,6 +98,7 @@ if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
-   set(CMAKE_BUILD_TYPE RelWithDebInfo)
- endif(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
- 
-+if(false)
- if(CMAKE_COMPILER_IS_GNUCXX)
-   # set the default compile warnings
-   set(_warn "-Wall -Wextra -Wpedantic")
-@@ -159,4 +160,5 @@ if(CMAKE_C_COMPILER MATCHES "icc")
-   set(CMAKE_C_FLAGS_DEBUG            "-O2 -g -Ob0 -noalign ${_save_cflags}")
-   set(CMAKE_C_FLAGS_DEBUGFULL        "-g -Ob0 -noalign ${_save_cflags}")
- endif(CMAKE_C_COMPILER MATCHES "icc")
-+endif(false)
+@@ -125,14 +125,14 @@ if(CMAKE_COMPILER_IS_GNUCXX)
+   set(DEFAULT_COMPILE_WARNINGS_EXTRA "${_warn} ${_warnx}")
  
+   set(_save_cxxflags "${CMAKE_CXX_FLAGS}")
+-  set(CMAKE_CXX_FLAGS                "-fno-exceptions -fno-check-new -fno-common -D_DEFAULT_SOURCE")
++  set(CMAKE_CXX_FLAGS                "-fno-exceptions -fno-check-new -fno-common -D_DEFAULT_SOURCE ${_save_cxxflags}")
+   set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "-O2 -g ${_save_cxxflags}")
+   set(CMAKE_CXX_FLAGS_RELEASE        "-O2 -DNDEBUG ${_save_cxxflags}")
+   set(CMAKE_CXX_FLAGS_DEBUG          "-g -O2 -fno-reorder-blocks -fno-schedule-insns -fno-inline ${_save_cxxflags}")
+   set(CMAKE_CXX_FLAGS_DEBUGFULL      "-g3 -fno-inline ${_save_cxxflags}")
+   set(CMAKE_CXX_FLAGS_PROFILE        "-g3 -fno-inline -ftest-coverage -fprofile-arcs ${_save_cxxflags}")
+   set(_save_cflags "${CMAKE_C_FLAGS}")
+-  set(CMAKE_C_FLAGS                  "-std=c99 -D_DEFAULT_SOURCE")
++  set(CMAKE_C_FLAGS                  "-std=c99 -D_DEFAULT_SOURCE ${_save_cflags}")
+   set(CMAKE_C_FLAGS_RELWITHDEBINFO   "-O2 -g ${_save_cflags}")
+   set(CMAKE_C_FLAGS_RELEASE          "-O2 -DNDEBUG ${_save_cflags}")
+   set(CMAKE_C_FLAGS_DEBUG            "-g -O2 -fno-reorder-blocks -fno-schedule-insns -fno-inline ${_save_cflags}")
 -- 
 2.14.3
-
-- 
2.14.3


