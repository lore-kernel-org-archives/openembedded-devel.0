Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lb0-f175.google.com (mail-lb0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id BE6FA605FF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2016 11:20:20 +0000 (UTC)
Received: by mail-lb0-f175.google.com with SMTP id qe11so31906410lbc.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2016 04:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=zXai0Bp+ZTorpbc3THSEmXieDz1Igzq64GNXHCZmfMg=;
	b=IGLw7wjdMZcPu6RFKjb6GooPHxi9TjvzcQVJWNILPMp/wrxd9mD6Hp7hsSpxOLALkn
	mE6iv/9LYDT8u3HCMTEAb+DNoCgWtWlIPXNlTMqB9Uwm2auODe9K2YOHYBZ8uPcV8Wwz
	wnsBmu566qHE/aG6WjviWuIfmkmEzO/vQEd/KKQUuEh3nNvFXqOBw6RGef/lcrTlTbil
	hz0pzrgFAdTGr3K6pVh4kbDN0VC3MNThMtzh76FF7b5CrwFPKq3/r+QQ8VET2CoouRyM
	2csehgTDGXwRsv1Ve+AmSrdR/5UxeWMUs8aSPPI1yn0pSnYTQT62gt7sv3GRprE4bimZ
	wdYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=zXai0Bp+ZTorpbc3THSEmXieDz1Igzq64GNXHCZmfMg=;
	b=Mqs3WSSstBpPigla65QKgD+kYSVLWyvdWMX9bx/Q94+QdNbmbF/IXd/cwzj4h7fu8K
	N5CwTpk3tFFwDZBHRPoyCYc4XaS8sO35tzcVYAiWl6z9aEkM5kEgS44mGz2N8U/TEUJe
	525AeuwcWxVuAvIVQ4TzJ8BnmFKY2B9bThQ0g2GC9FSyolclC+dqWaPr6BIZlLyCt17Z
	ZjlOywOwbPcJ/VD5tuev5reQ5k+/Gzzb+W0zYBCbRDrCOADrwK5xJeRbUi4vQBMD54uZ
	36ivirvKjO8sUGDSNu/nQYNlPi1/4vvWII+nZywAsxJwmNZgBlmd8+2KWurAt2hpJlSx
	VVqA==
X-Gm-Message-State: AD7BkJIsFeefYSJxhq7thrugAbDqKK1rdjjWOQHwx2MwfGkD9N0PlgDuVY3hDVsz8WNbKw==
X-Received: by 10.112.125.9 with SMTP id mm9mr4538073lbb.113.1458300020909;
	Fri, 18 Mar 2016 04:20:20 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	pi5sm2107256lbb.41.2016.03.18.04.20.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 18 Mar 2016 04:20:19 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: Martin Jansa <Martin.Jansa@gmail.com>, Andre McCurdy <armccurdy@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>,
	openembedded-devel@lists.openembedded.org
Date: Fri, 18 Mar 2016 12:20:14 +0100
Message-Id: <1458300015-9666-3-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1458300015-9666-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1458300015-9666-1-git-send-email-ricardo.ribalda@gmail.com>
Subject: [meta-oe][PATCH v3 3/4] opencv: Fix pkg-config file.
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
X-List-Received-Date: Fri, 18 Mar 2016 11:20:21 -0000

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
2.7.0


