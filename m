Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lb0-f182.google.com (mail-lb0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id 0FBDB6E688
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2016 11:26:38 +0000 (UTC)
Received: by mail-lb0-f182.google.com with SMTP id qe11so50392712lbc.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2016 04:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5FJ64Mu2RIlYjjP4/W5Zhdw0BQsaq6Z5iEkhd/zuTMg=;
	b=CKGaF2lJT2f1pd71tHRiKnJoFPdNNqeXtJ0DVWdCzLSgClnB+TI5miJoX3uAXITCPQ
	SVrBSaLnVLckr/rGunxJjDor7g/x8GfPTiCBM2qGGDV+lXB19arWfxBWRzKwuXmXzs6U
	TIFaQsU3UtRxU0n2iLD6U1UveIB2BSC3DJfeWi964y4HvuTUMW6swEXJ4qZFwFBEQEci
	hxDIcf0DrEYJ3ejxuN8SISVdi9OCCMgTeiNaAb36+1fX+S8jhT0Y7wHU8rnoi8tM54dZ
	361Edn12sjPbHDeem35WKvL12NSZru6E2+vYs0KyZHaNLZxweh5roRV34Z5MM3F41kh1
	ISGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=5FJ64Mu2RIlYjjP4/W5Zhdw0BQsaq6Z5iEkhd/zuTMg=;
	b=mGNRP3Upp8MhKs7/DvK2AvPJVBDyeCsvoKC7V/l8PK9p+SojHJ8L+o+f/L80m6bdaj
	jaTtNQxigrIBQbl7/Y0N4UpTIytleUbhB5Ogxo54QaR0NuJ8C/76G2QpPOulvz1VSM3D
	oQUbOpGsU3C0q9j5b2bw/39vlyXfGiOVqJHm33lNAvs7ms6TDPK8oVlv/bjWsV155C+G
	enM2zPMjtELFQOP13dGmNoVHSu4Ovkmg5FFSQjI6K8yQLeED0Fg3TjvDeNRRj1qr4w+R
	WaxGa+my9Iv2EzW/BHfuABjGCBlzvVxW6OZFnc/f6sn0PvfC+4/+bRtX6bMwGxVyULWp
	2pPg==
X-Gm-Message-State: AD7BkJKKru2LWHn/w+y0oe/vfyUI3K92Q+HkM7HJ+EzLpMIzDm/GrR1xbfCtCpVATzMT+w==
X-Received: by 10.112.167.37 with SMTP id zl5mr6535916lbb.60.1459423599324;
	Thu, 31 Mar 2016 04:26:39 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	t17sm1328655lfd.17.2016.03.31.04.26.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 31 Mar 2016 04:26:38 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: Martin Jansa <Martin.Jansa@gmail.com>, Andre McCurdy <armccurdy@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>,
	openembedded-devel@lists.openembedded.org
Date: Thu, 31 Mar 2016 13:26:29 +0200
Message-Id: <1459423593-4123-4-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.8.0.rc3
In-Reply-To: <1459423593-4123-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1459423593-4123-1-git-send-email-ricardo.ribalda@gmail.com>
Subject: [meta-oe][PATCH v4 3/7] opencv: Fix pkg-config file.
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
X-List-Received-Date: Thu, 31 Mar 2016 11:26:39 -0000

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


