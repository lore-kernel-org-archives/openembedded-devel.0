Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id DBF6F773F0
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jun 2016 12:50:38 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id 65so5027351lfq.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jun 2016 05:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=9arAYHsEefhzhjnnf9Ur2E+JT+3HYTnDNnZ8e6e/YNE=;
	b=nk6YN7ifV0LR3j0kPG6wrR0GV0TX0OKnm8b0EIwSguxTMYCeuWpuZmj2dDaiXJ8MaW
	1y4CgQIshxJ0gTq7sJHoiI1RKw0I+FkrzUKNjtg9ATWU+5eJPjTlVYZjThBvqNCjPt3+
	4F8d503PWz0R8b2FUPy76CMwBKKv8ZaUM69molWG4qWu+z5+gNmuBTBpya4zGNPfoKed
	HtjoZq6vtJWl2rNUH0ZcnQ4nj7YlJho5JCAIInmzDdb3kiMKw6hyfvHmBGlk52aP8zBv
	zzQJWdIggSCuybuwxga6Lxq3HZEayj24CztoejrWfW2gn75Yb/6EwOSXWqMpEFK9t8Ra
	WWfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9arAYHsEefhzhjnnf9Ur2E+JT+3HYTnDNnZ8e6e/YNE=;
	b=NzqgmS2OmAy+8Hyd0P3LIcGxZH308FoaUD3J1MKYRlJ6vJQ4Bsn+yReSPnKCwRkzF8
	wyghPsjVvsP6pZVvZEFeS4z0apvV4Qy6A/lKWjKD7/FFOxd8rB1sNNdJNx3MMhGKFRqb
	3RdBdC29HXNupvT7RnZZdWvAcnnuwCRDi9bnBZl/ffNEiR8atO/08tM2QJTT5xy2k1nM
	JtBt5cnNntwc5LCSNn6mSVcDZ/fNE4amIH2NiRrM8O7BaCyn6LRQdmpLizMznCYPkZTx
	I52tf7vr+Rv0/wa2jQciPEiJZ3RSO2ui1rdnA3AABA2wed59016XfI+vThh7KsM5nWCE
	H28g==
X-Gm-Message-State: ALyK8tIqVK7YJEG3ECVm/F8Uat3dRuXQRP34dKpx4xOzYk/Ewtfhj1zTH6CYBE1wWt1alA==
X-Received: by 10.46.32.91 with SMTP id g88mr3816549ljg.42.1464871837441;
	Thu, 02 Jun 2016 05:50:37 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id z1sm36681lbl.32.2016.06.02.05.50.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Jun 2016 05:50:36 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org, otavio@ossystems.com.br,
	Martin.Jansa@gmail.com, koen@dominion.thruhere.net
Date: Thu,  2 Jun 2016 14:49:28 +0200
Message-Id: <1464871769-25990-1-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.8.1
Subject: [meta-oe][PATCH v2 1/2] opencv: Make gphoto2 dep optional via PACKAGECONFIG
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
X-List-Received-Date: Thu, 02 Jun 2016 12:50:39 -0000

Opencv can be built without support for gphoto2 if needed.

Acked-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_3.1.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recipes-support/opencv/opencv_3.1.bb
index 789512f9e0ac..e6480704a62c 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
@@ -10,7 +10,7 @@ ARM_INSTRUCTION_SET_armv5 = "arm"
 
 DEFAULT_PREFERENCE = "-1"
 
-DEPENDS = "python-numpy libtool swig swig-native python bzip2 zlib glib-2.0 libwebp libgphoto2 protobuf protobuf-native"
+DEPENDS = "python-numpy libtool swig swig-native python bzip2 zlib glib-2.0 libwebp protobuf protobuf-native"
 
 SRCREV_opencv = "92387b1ef8fad15196dd5f7fb4931444a68bc93a"
 SRCREV_contrib = "5409d5ad560523c85c6796cc5a009347072d883c"
@@ -47,13 +47,14 @@ EXTRA_OECMAKE = "-DPYTHON2_NUMPY_INCLUDE_DIRS:PATH=${STAGING_LIBDIR}/${PYTHON_DI
 "
 EXTRA_OECMAKE_append_x86 = " -DX86=ON"
 
-PACKAGECONFIG ??= "eigen jpeg png tiff v4l libv4l gstreamer samples tbb \
+PACKAGECONFIG ??= "eigen jpeg png tiff v4l libv4l gstreamer samples tbb  gphoto2 \
                    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk", "", d)} \
 		   ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "libav", "", d)}"
 
 PACKAGECONFIG[amdblas] = "-DWITH_OPENCLAMDBLAS=ON,-DWITH_OPENCLAMDBLAS=OFF,libclamdblas,"
 PACKAGECONFIG[amdfft] = "-DWITH_OPENCLAMDFFT=ON,-DWITH_OPENCLAMDFFT=OFF,libclamdfft,"
 PACKAGECONFIG[eigen] = "-DWITH_EIGEN=ON,-DWITH_EIGEN=OFF,libeigen,"
+PACKAGECONFIG[gphoto2] = "-DWITH_GPHOTO2=ON,-DWITH_GPHOTO2=OFF,libgphoto2,"
 PACKAGECONFIG[gstreamer] = "-DWITH_GSTREAMER=ON,-DWITH_GSTREAMER=OFF,gstreamer1.0 gstreamer1.0-plugins-base,"
 PACKAGECONFIG[gtk] = "-DWITH_GTK=ON,-DWITH_GTK=OFF,gtk+3,"
 PACKAGECONFIG[jasper] = "-DWITH_JASPER=ON,-DWITH_JASPER=OFF,jasper,"
-- 
2.8.1


