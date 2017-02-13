Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id B42A6760A6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2017 22:33:02 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id v77so633225wmv.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2017 14:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=t4PfmsAOW/HG/40lNjZHr0u82qLHekU6FO7XM9nMnKA=;
	b=PNTf1cr05H9NUekbNGTCb0GuyfnsORdnHriswfIi8GTYFfu9Kf76zIBAbhpZoQl5HQ
	RJxJxAuxtt6DG96pOFsaUaaFUmB/yeVXAYEq7OFmoMLxsXyEW6i9KMKZ3JrqRMuF5raw
	B1yYh3msAYX1Oz2ZPu5eoJpjInw6CpDSs3LMOYKrd3LRG5j+oy7wVUlJdaXpNeO5nTHw
	PHD/m3kicpVo74rdJPxrGAKQRhHndQ2FaS6SXNe1nwsc59qOBp9vLED+x9zc+36hk0kd
	VzdXcZnJvyBlaGuiytpnAd0Ww+GUdx/DiV7yTrPlKODuOqJ7O0/OykCOEFGcgswnHYf8
	m2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=t4PfmsAOW/HG/40lNjZHr0u82qLHekU6FO7XM9nMnKA=;
	b=epDtgqAsYz5VjRGZT/OYmihd4c4dekdUCi3lXMt2KIMW7k6Gpz2x9ozim5sxAvkvjY
	RRpILWVvFk+lv9lZp3cd+00ccfMxhjhSf+U3E/Iw9osGkDu1ZOUJFDjuXe/8trAxxbR9
	tLh446vtHComqGVffnmf+SR1u+SwDQIhA2ycl0FqTYKNVXm9fZMM+d5xZkHGHFnJ42Xo
	DFbgbb1b6R4URKbKgPpuGDVylrfGymQA2yJ0NZi9dBj6ggjd8y9YCj08gggQFm6glnLm
	rUu23eMce4t0puJ8jWvnu2okh2+wEJgO9kZ6ZK5ZIaxfQ2xEhfQODmq4y0pd8FR0frsq
	ES3g==
X-Gm-Message-State: AMke39mYsGBa0sMGaxZenRoSKEenccYRiAogVhXwJCTeAkXnCHGFFcuDpcZYfMGAkG8hsw==
X-Received: by 10.28.145.3 with SMTP id t3mr474944wmd.47.1487025182668;
	Mon, 13 Feb 2017 14:33:02 -0800 (PST)
Received: from ThinkPad-T520.homenet.telecomitalia.it
	(host13-229-dynamic.20-79-r.retail.telecomitalia.it. [79.20.229.13])
	by smtp.gmail.com with ESMTPSA id
	r100sm15550944wrb.20.2017.02.13.14.33.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Feb 2017 14:33:01 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Feb 2017 23:32:38 +0100
Message-Id: <1487025163-21628-5-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1487025163-21628-1-git-send-email-andrea.adami@gmail.com>
References: <1487025163-21628-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-initramfs][PATCH 4/9] klcc-cross: Use SYSROOT_DIRS to add dirs to stage in sysroot
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
X-List-Received-Date: Mon, 13 Feb 2017 22:33:04 -0000

As done for libtool-cross in oe-core.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.4.bb | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.4.bb b/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.4.bb
index 1a68ab4..b285b2e 100644
--- a/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.4.bb
+++ b/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.4.bb
@@ -30,10 +30,5 @@ do_install() {
         ${D}${bindir_crossscripts}/${TARGET_PREFIX}klcc
 }
 
-SYSROOT_PREPROCESS_FUNCS += "klcc_sysroot_preprocess"
-
-klcc_sysroot_preprocess () {
-       sysroot_stage_dir ${D}${bindir_crossscripts} ${SYSROOT_DESTDIR}${bindir_crossscripts}
-}
-
+SYSROOT_DIRS += "${bindir_crossscripts}"
 SSTATE_SCAN_FILES += "*-klcc"
-- 
2.7.4


