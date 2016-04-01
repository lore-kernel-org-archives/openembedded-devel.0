Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f51.google.com (mail-lf0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id F18397706C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Apr 2016 22:21:54 +0000 (UTC)
Received: by mail-lf0-f51.google.com with SMTP id g184so16695639lfb.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Apr 2016 15:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=io97O2d81qOfbPS/cTTQZN4GXER469GgUsVJ09EGiUo=;
	b=tYkTcpHoxBby75fUVUvyc/CHrLO1rU6Q9C6c7jAP0lKHCgZUuJTfq1M4r/h8zBq9oo
	tOR3QYdw+iOixT6ca3Xe9sPtgqPjuoWQHWpAGidxwZMnFMlQgmc3BydxHQQ3nipbfKgh
	yfGWu53Z9YtMgm2U3phb37WNpDDxFhttH/cN0WnLBlDuxcyr1moPLnvXzhaOfp7RlcST
	y1LrgvjBL491H7qWHLpuQwTfal7nOY/W1HVqxNBFL5HU/Xv0o6d6lGVmI3RsHf0MRlng
	+NfVOrdnJ7ySmXF2aypqsFF7aPda9mXVIYaRG4aOAX11JHuGtfaTdYE1EuS6ww8rR+ir
	u0zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=io97O2d81qOfbPS/cTTQZN4GXER469GgUsVJ09EGiUo=;
	b=aAnoQgxZByy0Tw9tmtlX1pprnpMSJYiIO1hz8ck98yJHEcsCOmIOYlnkcBdg0L7P+E
	ZCqfu0DBq9cFH/xsLSB33jRegQbZTUYLi0DCnFjmKOwEvuXJb5KDVlcIKIGgr34Bl4Nc
	0+w4yvc1GpTAq4sgWVifVG+zwA0YcVx4GXCP0jQE4AI+rbH1dX9iIdksPQyNrIVdN7RO
	e5YB70yiKU2V5fiMAHt0TplyPxo9AoMagAxujwZJ/0IDATm7I9oucAj6UdJO2RxJDhJH
	YPvHKiC3cxcRzG5rInHh993Nw8F7kM7PHspCw3jj8kLGkDBxUXjhp3IxDh8acrNVmRFb
	Bn6Q==
X-Gm-Message-State: AD7BkJKjCS5KhpRuPtTfxf6Ld6eqpRuGQ9mowRKAp2TfDL/sTqgPBXYPtsh8jA48lUnZIQ==
X-Received: by 10.25.34.202 with SMTP id i193mr3118704lfi.117.1459549314182;
	Fri, 01 Apr 2016 15:21:54 -0700 (PDT)
Received: from localhost.localdomain (x1-6-74-44-01-e3-62-1a.cpe.webspeed.dk.
	[80.167.115.215])
	by smtp.gmail.com with ESMTPSA id t2sm2537433lbr.45.2016.04.01.15.21.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 01 Apr 2016 15:21:52 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>, Martin Jansa <Martin.Jansa@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>,
	openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Date: Sat,  2 Apr 2016 00:21:50 +0200
Message-Id: <1459549310-11095-1-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.8.0.rc3
Subject: [meta-oe][PATCH v8 6/7] opencv: Fix build on x86 platform
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
X-List-Received-Date: Fri, 01 Apr 2016 22:21:57 -0000

OpenCV wrongly assumes that the X86 variable would be set on Intel 32
bit architectures.

This patch adds the missing definition on those cases.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
v8:
By popular demand, changing += with = " "

Thanks to Andre McCurdy <armccurdy@gmail.com> and Khem Raj <raj.khem@gmail.com> 

 meta-oe/recipes-support/opencv/opencv_3.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recipes-support/opencv/opencv_3.1.bb
index 63955a862d4a..0f6fb63e8587 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
@@ -45,6 +45,7 @@ EXTRA_OECMAKE = "-DPYTHON2_NUMPY_INCLUDE_DIRS:PATH=${STAGING_LIBDIR}/${PYTHON_DI
                  ${@base_conditional("libdir", "/usr/lib64", "-DLIB_SUFFIX=64", "", d)} \
                  ${@base_conditional("libdir", "/usr/lib32", "-DLIB_SUFFIX=32", "", d)} \
 "
+EXTRA_OECMAKE_append_x86 = " -DX86=ON"
 
 PACKAGECONFIG ??= "eigen jpeg png tiff v4l libv4l gstreamer samples tbb \
                    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk", "", d)} \
-- 
2.8.0.rc3


