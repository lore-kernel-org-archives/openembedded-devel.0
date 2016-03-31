Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f52.google.com (mail-lf0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id 33CD36FF84
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2016 11:26:42 +0000 (UTC)
Received: by mail-lf0-f52.google.com with SMTP id p188so29995852lfd.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2016 04:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/XeySXyuDVRzZjPjbgFUVQmXy7URkE0PbJ6Se8SbDOw=;
	b=mmxVGodOOEEGAzkyUgJasLxdZZ17MSqbxtgD2EpmVL6AhF6tfVFQcs6mPktbDw3qnK
	w/ScXEvUntEBWHqUs+W1GE6vNHaceHwosTKqD9c+OlIM/IpYe1EGY/vTDNhogk3LcAmR
	Fu/LmMGo/0kP9sK2KyKUaOrMaS6sdrAhYLQGhWhiJU4fUAZK34vs2RWjSIzIx+SQCSC8
	GZG84TGJzkWqnj0CiiLjwdDI2BSz4KFYMblX2a8/dknkkbk5PllZsadyTY20gcYymOEn
	SpdaktAPs8nciGMqxuPcFBfJ3CE++M/hLY4cgtC7NwR2X9XFRLLYZmNKIegC+mxIvuEg
	4O8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=/XeySXyuDVRzZjPjbgFUVQmXy7URkE0PbJ6Se8SbDOw=;
	b=fqtElAJ7t1tWuGqln3z+UY5g9HeHraoCKAYdaHuR5MUBpPRoxv1695mpU3erDQRrxw
	Z3+bz4lxUTgtiq0QfWoaOrTBtjxgctt9npT1iBWczTmcuNDqCl3PG4JPSA287KSc/sKh
	qb5NF0YJPZ+f/of/CliqMpf4TT3G5IC4uJfziqci9eWQRWUjmE7OrZJ8fuD8oV3cfCYC
	jrfNVldku8uJu5WZqUvm+Kr53L7uNXs6cnMLH8QAkIa2qeLr6MOPJEHF7/tw/d827o4Q
	xT4PYbqytwWaQmT9AYcwXhi9o8q7rZY76U1Ry6MiTC55tEQRQ5/Q8tBRG4QLL/VNlh1M
	yRVw==
X-Gm-Message-State: AD7BkJJcvbi2IygLOzu9FeTG2qD5Y+yM+sYQ7LyrcMjEt7NhEIkGQmb2Ord7S8LTQ5i24A==
X-Received: by 10.25.167.19 with SMTP id q19mr280199lfe.24.1459423603089;
	Thu, 31 Mar 2016 04:26:43 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	t17sm1328655lfd.17.2016.03.31.04.26.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 31 Mar 2016 04:26:41 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: Martin Jansa <Martin.Jansa@gmail.com>, Andre McCurdy <armccurdy@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>,
	openembedded-devel@lists.openembedded.org
Date: Thu, 31 Mar 2016 13:26:32 +0200
Message-Id: <1459423593-4123-7-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.8.0.rc3
In-Reply-To: <1459423593-4123-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1459423593-4123-1-git-send-email-ricardo.ribalda@gmail.com>
Subject: [meta-oe][PATCH v4 6/7] opencv: Fix build on x86 platform
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
X-List-Received-Date: Thu, 31 Mar 2016 11:26:43 -0000

OpenCV wrongly assumes that the X86 variable would be set on Intel 32
bit architectures.

This patch adds the missing definition on those cases.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_3.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recipes-support/opencv/opencv_3.1.bb
index 84a592799c0a..7f09168784d9 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
@@ -41,6 +41,7 @@ EXTRA_OECMAKE = "-DPYTHON2_NUMPY_INCLUDE_DIRS:PATH=${STAGING_LIBDIR}/${PYTHON_DI
                  ${@base_conditional("libdir", "/usr/lib64", "-DLIB_SUFFIX=64", "", d)} \
                  ${@base_conditional("libdir", "/usr/lib32", "-DLIB_SUFFIX=32", "", d)} \
 "
+EXTRA_OECMAKE_append_x86 += " -DX86=ON"
 
 PACKAGECONFIG ??= "eigen jpeg png tiff v4l libv4l gstreamer samples tbb \
                    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk", "", d)} \
-- 
2.8.0.rc3


