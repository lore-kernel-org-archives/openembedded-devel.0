Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id EA89373694
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jul 2015 12:52:10 +0000 (UTC)
Received: by qkfc129 with SMTP id c129so88884589qkf.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jul 2015 05:52:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization;
	bh=GydoVihPUjyBbKRmxdQRmoC5IV1VdUtmtWE9+hMghSI=;
	b=ETFomd2KKYUxHiUCqSU+KdbyP2CE6MGXq1tCkLLI6eKXjAZDabCkHmwZhC4nKfFjaa
	xbGcZTopcjvEreo9vqa76uLQvQY/Bf/hBPnCUhVqMbIzr25yAkef43XQT23SqbL4ofOp
	9ihF8/UHR/j8IWxgdFaReWJVOvvKdvFIwyU8SK/mwmHWcj6EsiIn92Qqq2YWi7hDfBYx
	mAV793qyX6fum3uB/6Q9qskzNeHslvx/C1wEQwTNjd4rK/hXhMP0uSS/ibDI5tZ1n3M6
	UmEcR7Bf5EHLsxsaZmqWWn89+VWlENimpMHZEytATG8Pg5KlJT+miI70cA16bB1xot/m
	bNRA==
X-Received: by 10.140.90.99 with SMTP id w90mr54035635qgd.57.1437483130547;
	Tue, 21 Jul 2015 05:52:10 -0700 (PDT)
Received: from localhost ([179.105.243.19])
	by smtp.gmail.com with ESMTPSA id f27sm341075qkh.23.2015.07.21.05.52.07
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Jul 2015 05:52:09 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Tue, 21 Jul 2015 09:52:04 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 21 Jul 2015 09:51:54 -0300
Message-Id: <1437483116-22509-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.4.6
In-Reply-To: <1437483116-22509-1-git-send-email-otavio@ossystems.com.br>
References: <1437483116-22509-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH v2 2/4] opencv: Add 'libv4l' PACKAGECONFIG
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
X-List-Received-Date: Tue, 21 Jul 2015 12:52:14 -0000

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


