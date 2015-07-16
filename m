Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id A2221607A5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jul 2015 21:36:50 +0000 (UTC)
Received: by qgy5 with SMTP id 5so39164298qgy.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jul 2015 14:36:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=from:to:cc:subject:date:message-id:organization;
	bh=dOnXUANI3Xsw0vNE12O8VBqDT05xyjp55wKgfWAPNBo=;
	b=Qv9NWjn8o1NeYZrWwue+FXHA980pzx/ynX2ZpqXHhWZXfyPrKKOQWHNmcYNncvTOMd
	ofhGN6UWaLG7M/ZRhDSM5LTbDgpmXMtxGsKNT+BVs/T6Lw+hT+NR8GsO9didpm21mawi
	d42RtcuIvzzNcDEQzv/tJI3VgpoZBsjkDWx/hbD87YM+cOLRd22h6aRwmYD0ORrvJgIK
	yVJUnftc3jpxs5Ui4hWHUF5Hf6nobWsz226mL757kpxf8chFpYGbYHcFYYWY5kMraZEm
	GAMGOZXsQvJMo1U5LpcW+jl1WQ31XsIy2OrnnV61h2zzHxRD866ZtejMnqju2gP9ng7v
	z2cQ==
X-Received: by 10.140.145.207 with SMTP id 198mr14715886qhr.45.1437082610737; 
	Thu, 16 Jul 2015 14:36:50 -0700 (PDT)
Received: from localhost ([179.105.243.19]) by smtp.gmail.com with ESMTPSA id
	n107sm4745106qgn.13.2015.07.16.14.36.47
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Jul 2015 14:36:49 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Thu, 16 Jul 2015 18:36:45 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 16 Jul 2015 18:36:42 -0300
Message-Id: <1437082602-14375-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.4.6
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH] opencv: Only enable 'libav' support if commercial license is whitelisted
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Jul 2015 21:36:51 -0000

The libav support requires the commercial license to be
whitelist. This makes opencv to work in non-commercial setups without
needing to change the PACKAGECONFIG settings manually.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-support/opencv/opencv_2.4.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_2.4.bb b/meta-oe/recipes-support/opencv/opencv_2.4.bb
index 2754616..f8946f4 100644
--- a/meta-oe/recipes-support/opencv/opencv_2.4.bb
+++ b/meta-oe/recipes-support/opencv/opencv_2.4.bb
@@ -30,8 +30,9 @@ EXTRA_OECMAKE = "-DPYTHON_NUMPY_INCLUDE_DIR:PATH=${STAGING_LIBDIR}/${PYTHON_DIR}
                  ${@base_conditional("libdir", "/usr/lib32", "-DLIB_SUFFIX=32", "", d)} \
 "
 
-PACKAGECONFIG ??= "eigen jpeg libav png tiff v4l \
-                   ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk", "", d)}"
+PACKAGECONFIG ??= "eigen jpeg png tiff v4l \
+                   ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk", "", d)} \
+                   ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "libav", "", d)}"
 PACKAGECONFIG[eigen] = "-DWITH_EIGEN=ON,-DWITH_EIGEN=OFF,libeigen,"
 PACKAGECONFIG[gtk] = "-DWITH_GTK=ON,-DWITH_GTK=OFF,gtk+,"
 PACKAGECONFIG[jpeg] = "-DWITH_JPEG=ON,-DWITH_JPEG=OFF,jpeg,"
-- 
2.4.6


