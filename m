Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id D6B386212F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2016 14:11:36 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id c62so60539764lfc.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2016 07:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KB5iO9ewzrAnkLYk+QP+ZR8PRryFEGnN5avR1WQZ3J0=;
	b=B1Fu4pa4PSmjsz47EGqVLtTB8ZgQv8+0FYo1oPMbGAep0KrN+oCJKhGTWX69GATIYp
	c80BjcZkdvjScKxTrfuuUEJtEtVfe2q8L63Yj33lbOAhUCV6+c9lizYV+wbC6OsbklAn
	HRMegkt+BqTrdiaPUij+iTLJJS+B8nU5x1VuPkiuyagCdDyDs857uTonKzHbHg2EgsNO
	O5X1IfOmupI1EuwS5y9fPNVWW6QeSxD8nX6o/YDjJzx1G7ZJ8BT7dWN/GCvmt90O+f1S
	bUNjHGZdX8yKAG88hoOaADUKck93E6beJpCXuLdwCL2SCRVJPhgT82wjwUDtqJUSYzm8
	N9Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KB5iO9ewzrAnkLYk+QP+ZR8PRryFEGnN5avR1WQZ3J0=;
	b=Q5lf0LRh09MeWvK1nyE25QQXe6I9VemyInAUCE08C0BvMIJ2L51wHZZSU/u3wNVsf8
	qWhOF7buI7Iypu71OutBp4encBwLe7KmnWNF1Wt7GNqrJ3tL6leCYg2JjVysWHiSZLI4
	rsVjNJ2HzcERNkoMP+RYwlcZra3637Xqc9n8Dgta1yzuCJoob/SX5dP632Oox74bvkP7
	qHVDm28qy5m2hXe6hKt/QsyyDP2kaY5Ly0+5SDTDRJa9VneI0VGpP4nSfMdoFpHZht9k
	OYTJs0j5RR41Km4mxWAhzivFDbM9LS9zupgBaZbmovEnB6/7WDj68JSc2b8jDRGH9P3O
	TMtw==
X-Gm-Message-State: AD7BkJKcT/sgTyYTZI+FS+KehfKRPbsaNOAtXC0JMfA9ZjdkWNWOyHh5np19V/KzjXxjww==
X-Received: by 10.25.31.14 with SMTP id f14mr6765930lff.143.1459433496942;
	Thu, 31 Mar 2016 07:11:36 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	rg10sm1293415lbc.21.2016.03.31.07.11.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 31 Mar 2016 07:11:35 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: Martin Jansa <Martin.Jansa@gmail.com>, Andre McCurdy <armccurdy@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>,
	openembedded-devel@lists.openembedded.org
Date: Thu, 31 Mar 2016 16:11:32 +0200
Message-Id: <1459433492-9346-2-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.8.0.rc3
In-Reply-To: <1459433492-9346-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1459433492-9346-1-git-send-email-ricardo.ribalda@gmail.com>
Subject: [meta-oe][PATCH v6 6/7] opencv: Fix build on x86 platform
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
X-List-Received-Date: Thu, 31 Mar 2016 14:11:37 -0000

OpenCV wrongly assumes that the X86 variable would be set on Intel 32
bit architectures.

This patch adds the missing definition on those cases.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_3.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recipes-support/opencv/opencv_3.1.bb
index 63955a862d4a..ecba0216fd45 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
@@ -45,6 +45,7 @@ EXTRA_OECMAKE = "-DPYTHON2_NUMPY_INCLUDE_DIRS:PATH=${STAGING_LIBDIR}/${PYTHON_DI
                  ${@base_conditional("libdir", "/usr/lib64", "-DLIB_SUFFIX=64", "", d)} \
                  ${@base_conditional("libdir", "/usr/lib32", "-DLIB_SUFFIX=32", "", d)} \
 "
+EXTRA_OECMAKE_append_x86 += "-DX86=ON"
 
 PACKAGECONFIG ??= "eigen jpeg png tiff v4l libv4l gstreamer samples tbb \
                    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk", "", d)} \
-- 
2.8.0.rc3


