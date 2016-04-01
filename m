Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f48.google.com (mail-lf0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id BCECE76710
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Apr 2016 21:36:42 +0000 (UTC)
Received: by mail-lf0-f48.google.com with SMTP id k79so90176959lfb.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Apr 2016 14:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ImlhzVrtASPKyv18t+/rR6zfzCdqPC2JUKoAXOmDVJE=;
	b=jjYyoPjoB0wzvXAM+ts2E8fxZxQSxz5nzlxzAHO6X7EtIjczyl0X6NecTzTuhbN/00
	XggFz6eOLNubDiN/J1EYyzNav1FS3MF3m9IBGPkc8Rtb9gOvs2bFtSTWvS63Ste+IgGo
	fyS2Io9qiuFU8IT44/iIKy9x3c0WZy5GUl5UXLjmz49UcRNNqDOdF5TWFsqe248Syasm
	QsO45OZv/Z+R4TuQc1T2czEYlT99GWWxeLvW06yJvznJ9nfltQY0UyMGi68n9bafu4jN
	6m4G3ulEJ4hlrvxl4WzTFk04GRIMXdd+vSikNeewKTPIYAl2xHLoCp+/jUnn+loBga/Y
	fyzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ImlhzVrtASPKyv18t+/rR6zfzCdqPC2JUKoAXOmDVJE=;
	b=fOPXe+JuWgYkBAR+p+x/88GRZMgtL8jgawKfQoAYz8vgwvPIQDbK2EH0GolIKEulcR
	3Y8iSGmPCCjC+dgOTtrH66W84q6A9IpRxQ0zaB4NDhyWvx1++ajqgqhYZNhi5Kqtl/7C
	mkjK/8nnYDLwaREyEpLYzccMpTXSzDiG3IbdXhGVWdf5S/yNqc5eVk0Rha43/UGYxd5d
	H61HJjYDz1mCoW5mejQ6zHp1Ngt982WZX+fQuUxBTnIxOp9jAdtwNnCZUhNcMcP2YaWw
	YhIFobX5BLkj2HIUOus50X1m0cYjFRr9ncXTkUdxKdvJkqCKyWnl2bBLowjiPaZgte6x
	Ummw==
X-Gm-Message-State: AD7BkJJM7+7YHDVZCJQqJZNXhSnqp3O6QJvMr7ZCfjHfeY/tc8Jfy6RUqS94IgjIqs3Juw==
X-Received: by 10.25.218.1 with SMTP id r1mr3788534lfg.130.1459546602704;
	Fri, 01 Apr 2016 14:36:42 -0700 (PDT)
Received: from localhost.localdomain (x1-6-74-44-01-e3-62-1a.cpe.webspeed.dk.
	[80.167.115.215])
	by smtp.gmail.com with ESMTPSA id i8sm2445759lbj.30.2016.04.01.14.36.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 01 Apr 2016 14:36:41 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: Martin Jansa <Martin.Jansa@gmail.com>, Andre McCurdy <armccurdy@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>,
	openembedded-devel@lists.openembedded.org
Date: Fri,  1 Apr 2016 23:36:29 +0200
Message-Id: <1459546590-9513-7-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.8.0.rc3
In-Reply-To: <1459546590-9513-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1459546590-9513-1-git-send-email-ricardo.ribalda@gmail.com>
Subject: [meta-oe][PATCH v7 6/7] opencv: Fix build on x86 platform
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
X-List-Received-Date: Fri, 01 Apr 2016 21:36:43 -0000

OpenCV wrongly assumes that the X86 variable would be set on Intel 32
bit architectures.

This patch adds the missing definition on those cases.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_3.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recipes-support/opencv/opencv_3.1.bb
index 63955a862d4a..b89fbbb214f6 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
@@ -45,6 +45,7 @@ EXTRA_OECMAKE = "-DPYTHON2_NUMPY_INCLUDE_DIRS:PATH=${STAGING_LIBDIR}/${PYTHON_DI
                  ${@base_conditional("libdir", "/usr/lib64", "-DLIB_SUFFIX=64", "", d)} \
                  ${@base_conditional("libdir", "/usr/lib32", "-DLIB_SUFFIX=32", "", d)} \
 "
+EXTRA_OECMAKE_append_x86 = "-DX86=ON"
 
 PACKAGECONFIG ??= "eigen jpeg png tiff v4l libv4l gstreamer samples tbb \
                    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk", "", d)} \
-- 
2.8.0.rc3


