Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f52.google.com (mail-lf0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id 1286076F8C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Apr 2016 21:36:37 +0000 (UTC)
Received: by mail-lf0-f52.google.com with SMTP id g184so15796869lfb.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Apr 2016 14:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5FJ64Mu2RIlYjjP4/W5Zhdw0BQsaq6Z5iEkhd/zuTMg=;
	b=DEJIvX6eBmMsDT+l11L3wJttFYVJXee1WXMscdLWFxLI1jLPfoQOVvva26L9UvK8hm
	3m8NmodlyemAYSU39VYUdPTrPMByuAUnvwnvRiBC2txE9cT8dHuWow5ITbPIOxr3bsxu
	H/e25GPTzBjMJ9GA84waeABkpgc8zKVLgHjzmBEgPgvsfXSMDhZenW07bbe5fA9UIK0O
	HAv6t96b2FX1UKOvls4ztmDuYZ+EUdU2LSvpu1DA5iuPTHg+lK6IcBu3ISXznxtRSxc1
	l5BSqfcUdZM0i6sUQTFBoh3SmaOPklofeIPSwc3rpoeHIBQCbb1UG8dvOMVlT5ZArMIG
	92tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=5FJ64Mu2RIlYjjP4/W5Zhdw0BQsaq6Z5iEkhd/zuTMg=;
	b=DHESuK603zjG9MKQjxK6yZVXYsKxxmB06xz4v93UGaCziYmOyOSMKkS9eu1UNLOxmr
	lTu/RwWeVr8Uyaerombk9AdMxicwkkZRhAkqfPYNgsQx0MH9nE72LiBH8zQRVBRs+iQz
	Sk9by8lKVvwNxvnqfVHORENNz8rLGiHM/B3U6FZ51FypWeukXrQ5fW7GDnA7XARfljUD
	o4HHji4bOgWWMm2/aJHxpDNztkm9KiscfcSKSzh15iXdFA5+X79j3lcNrUr0CFK4UEIP
	/VDuzJBzkFNUVv0E7ZWks4isfPDEHiER031jn3uk0gBBPbNfJy94GY8JSKOia5jY9O8a
	LQ+w==
X-Gm-Message-State: AD7BkJI/9tOt3OR0z4r12Thpl78HbpOf1SbJsZYTeXoMjTkh4sheisVf41nyM3J0TvjHEg==
X-Received: by 10.25.15.105 with SMTP id e102mr2682669lfi.103.1459546598112;
	Fri, 01 Apr 2016 14:36:38 -0700 (PDT)
Received: from localhost.localdomain (x1-6-74-44-01-e3-62-1a.cpe.webspeed.dk.
	[80.167.115.215])
	by smtp.gmail.com with ESMTPSA id i8sm2445759lbj.30.2016.04.01.14.36.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 01 Apr 2016 14:36:36 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: Martin Jansa <Martin.Jansa@gmail.com>, Andre McCurdy <armccurdy@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>,
	openembedded-devel@lists.openembedded.org
Date: Fri,  1 Apr 2016 23:36:26 +0200
Message-Id: <1459546590-9513-4-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.8.0.rc3
In-Reply-To: <1459546590-9513-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1459546590-9513-1-git-send-email-ricardo.ribalda@gmail.com>
Subject: [meta-oe][PATCH v7 3/7] opencv: Fix pkg-config file.
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
X-List-Received-Date: Fri, 01 Apr 2016 21:36:38 -0000

Libdir was pointing to the wrong location

also fix for QA Issue: opencv.pc failed sanity test (tmpdir) in path

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 .../opencv/opencv/fixpkgconfig.patch               | 29 ++++++++++++++++++++++
 meta-oe/recipes-support/opencv/opencv_3.1.bb       |  3 ++-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/opencv/opencv/fixpkgconfig.patch

diff --git a/meta-oe/recipes-support/opencv/opencv/fixpkgconfig.patch b/meta-oe/recipes-support/opencv/opencv/fixpkgconfig.patch
new file mode 100644
index 000000000000..3aeda7d4439d
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv/fixpkgconfig.patch
@@ -0,0 +1,29 @@
+diff --git a/cmake/OpenCVGenPkgconfig.cmake b/cmake/OpenCVGenPkgconfig.cmake
+index b8cb8777c06b..75281ee964fd 100644
+--- a/cmake/OpenCVGenPkgconfig.cmake
++++ b/cmake/OpenCVGenPkgconfig.cmake
+@@ -27,7 +27,7 @@ macro(fix_prefix lst isown)
+       get_filename_component(libdir "${item}" PATH)
+       get_filename_component(libname "${item}" NAME_WE)
+       string(REGEX REPLACE "^lib(.*)" "\\1" libname "${libname}")
+-      list(APPEND _lst "-L${libdir}" "-l${libname}")
++      list(APPEND _lst "-l${libname}")
+     else()
+       list(APPEND _lst "-l${item}")
+     endif()
+@@ -66,10 +66,14 @@ ocv_list_unique(_3rdparty)
+ 
+ set(OPENCV_PC_LIBS
+   "-L\${exec_prefix}/${OPENCV_LIB_INSTALL_PATH}"
++  "-L\${exec_prefix}/${OPENCV_3P_LIB_INSTALL_PATH}"
+   "${_modules}"
+ )
+ if (BUILD_SHARED_LIBS)
+-  set(OPENCV_PC_LIBS_PRIVATE "${_extra}")
++  set(OPENCV_PC_LIBS_PRIVATE
++    "-L\${exec_prefix}/${OPENCV_LIB_INSTALL_PATH}"
++    "${_extra}"
++  )
+ else()
+   set(OPENCV_PC_LIBS_PRIVATE
+     "-L\${exec_prefix}/${OPENCV_3P_LIB_INSTALL_PATH}"
diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recipes-support/opencv/opencv_3.1.bb
index b8fb6a51376f..6f0c83829809 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
@@ -16,7 +16,8 @@ SRCREV_opencv = "92387b1ef8fad15196dd5f7fb4931444a68bc93a"
 SRCREV_contrib = "5409d5ad560523c85c6796cc5a009347072d883c"
 SRCREV_FORMAT = "opencv"
 SRC_URI = "git://github.com/Itseez/opencv.git;name=opencv \
-	   git://github.com/Itseez/opencv_contrib.git;destsuffix=contrib;name=contrib"
+            git://github.com/Itseez/opencv_contrib.git;destsuffix=contrib;name=contrib \
+            file://fixpkgconfig.patch"
 
 PV = "3.1+git${SRCPV}"
 
-- 
2.8.0.rc3


