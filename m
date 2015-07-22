Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id 42D3876167
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jul 2015 19:47:28 +0000 (UTC)
Received: by qgeu79 with SMTP id u79so52318378qge.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jul 2015 12:47:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization;
	bh=GydoVihPUjyBbKRmxdQRmoC5IV1VdUtmtWE9+hMghSI=;
	b=LM5P3eKm2H1feYYjj6DUynv14m1LQ3amd8c2vECH224s75y2qj4X7gO5nFnc5h9zuq
	oL+czIvzeqcNoFXoSC0yOVMhfG0G9hp2GoNY4lslojddIUZTR+gl5Rvdx5qcNslkBXMn
	qnBKtLFOEpsBLBKkgq3zmdo1JAvKPE5gn0Trn8yggR/rLTigCCRNvFlEwIwhVdWt6rpb
	9nSFmTz2xJmkv7YMoyxom4dYsEHHTEum1/lU5XPe9z43mrxqYFT4WB/8wuU49l4jIdoF
	ws8PehAxMUroa9jRMZFiWt5biHKWUzpJ+EKtJZdGLUyNuORSYTImaZFCoWGgfkFnclrt
	G5cA==
X-Received: by 10.55.31.40 with SMTP id f40mr6458029qkf.18.1437594448935;
	Wed, 22 Jul 2015 12:47:28 -0700 (PDT)
Received: from localhost ([179.105.243.19]) by smtp.gmail.com with ESMTPSA id
	t77sm1208968qge.42.2015.07.22.12.47.25
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Jul 2015 12:47:27 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Wed, 22 Jul 2015 16:47:22 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 22 Jul 2015 16:47:07 -0300
Message-Id: <1437594429-21142-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.4.6
In-Reply-To: <1437594429-21142-1-git-send-email-otavio@ossystems.com.br>
References: <1437594429-21142-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH v3 2/4] opencv: Add 'libv4l' PACKAGECONFIG
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
X-List-Received-Date: Wed, 22 Jul 2015 19:47:29 -0000

The i.MX SoCs need to allow the removal of libv4l support so a new
PACKAGECONFIG option has been included.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-support/opencv/opencv_2.4.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_2.4.bb b/meta-oe/recipes-support/opencv/opencv_2.4.bb
index f8946f4..75441fd 100644
--- a/meta-oe/recipes-support/opencv/opencv_2.4.bb
+++ b/meta-oe/recipes-support/opencv/opencv_2.4.bb
@@ -30,7 +30,7 @@ EXTRA_OECMAKE = "-DPYTHON_NUMPY_INCLUDE_DIR:PATH=${STAGING_LIBDIR}/${PYTHON_DIR}
                  ${@base_conditional("libdir", "/usr/lib32", "-DLIB_SUFFIX=32", "", d)} \
 "
 
-PACKAGECONFIG ??= "eigen jpeg png tiff v4l \
+PACKAGECONFIG ??= "eigen jpeg png tiff v4l libv4l \
                    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk", "", d)} \
                    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "libav", "", d)}"
 PACKAGECONFIG[eigen] = "-DWITH_EIGEN=ON,-DWITH_EIGEN=OFF,libeigen,"
@@ -40,6 +40,7 @@ PACKAGECONFIG[libav] = "-DWITH_FFMPEG=ON,-DWITH_FFMPEG=OFF,libav,"
 PACKAGECONFIG[png] = "-DWITH_PNG=ON,-DWITH_PNG=OFF,libpng,"
 PACKAGECONFIG[tiff] = "-DWITH_TIFF=ON,-DWITH_TIFF=OFF,tiff,"
 PACKAGECONFIG[v4l] = "-DWITH_V4L=ON,-DWITH_V4L=OFF,v4l-utils,"
+PACKAGECONFIG[libv4l] = "-DWITH_LIBV4L=ON,-DWITH_LIBV4L=OFF,v4l-utils,"
 PACKAGECONFIG[jasper] = "-DWITH_JASPER=ON,-DWITH_JASPER=OFF,jasper,"
 
 inherit distutils-base pkgconfig cmake
-- 
2.4.6


