Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97C51C7EE39
	for <webhook@archiver.kernel.org>; Sat, 28 Jun 2025 16:37:44 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.1419.1751128654342139357
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Jun 2025 09:37:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ewpl4MmP;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4538bc1cffdso8084335e9.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 28 Jun 2025 09:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751128653; x=1751733453; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SeCCF3jw/nSbXMJsgkC3UqJuZl5DFeQvdZnxiw//1dY=;
        b=Ewpl4MmPMo8r640z1p6fRqyAmXkgJo0MGyOTfoPJfNALepBYtijiQDp+npdJyYoUfz
         e63QHF7tsF8mJV4zbrfLK07k1qIpWTu6T2XR2rIXc/eTj95DCccdOFLWdVRlGJ7/yqZP
         VDngvXNQEeRq+HU4g0orbmk+MgYSdF+Q+oWt54tTWYD5awNBG3qZrh7sfQU18CLgPI96
         ozUOorlntP7WUpXCSr6YVRI075K3EGClVcPouB+BsIjUQRkk6IG9wS5ZgOBmAuutPvjv
         gKSzNW7MVBGmy9oT3+nVv//sWx4YTs11oSsyDMKryGjVzOaP9WHLCPC3tJncIMlIk8Jv
         2naA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751128653; x=1751733453;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SeCCF3jw/nSbXMJsgkC3UqJuZl5DFeQvdZnxiw//1dY=;
        b=ovyS3PLSYaEdYOgJ+oVRl7yjiJVnrTjq2WrsWZLmM8XdTn8cGUOc+BF0YDkiQLPaVG
         xhv+XoeEo7yhSfPLjjuefhCEojiEzyBP15wWSZQ4ySQe/yFBYickqZv7mAEIQYBdGo85
         z1QSQQI8KySOnKa4uawZK3OgZRevdKrMxDxRiNC3U8gi5+f2rke5BOlZehRh4xuZGfL4
         Ntf5Nvvpor+Cy1jUn2jMVsBkbuVVhU58hQaj/ryxu2poox0C2E3io68x8EhOvGYwoltk
         iZSFZVjEAo1ktvQAMKu7zv9/uYpX8OZGKPSS6Pe2gZ25t6fIjNPI+W4cC62b2yv7ekEU
         9Hag==
X-Gm-Message-State: AOJu0YwY7sbFyvf/NvNA0493zyAN68BjaU91lB2746g8Ql8b4L53toyu
	RQjAWCQQgW/jsF6Wpk+fQQ3cTCD7g9WF92KyNlKrSQ/p/WFqwyu2IOUIS+6ZPg==
X-Gm-Gg: ASbGnctYcNu8RwWgGG9HM9BVdibnowQTxPOlGAf6VNvHsvXGgmpQfOdDnA+Ri0aNVcK
	AwuJhLhM/wcb4DXJEt4ToIbkBIuBfvrAgV4pE7QVFIAA3d8Gyg2/v50vdiUNqX9hrpdgNgGX7Sj
	7pazvm4qGgDIRQ0OrYRB6AoHQdjfyPL4zaeFdv6yhhDC3lpmRBbnCCoDLGD4WkaziNWdY30lR2Y
	n7kuPp9uB4sr+OpG5rXyhVG3JoUbVwHdNc5DGR9y3qJBefSO3ZSgKGwvtGgYX3rN4zqrEWI0vOk
	8JQ8R2aIMzkmL4lnm8G/on0dBhU2ON8ZonLLNAIrXHntRgVfwLSVnMA/Do44oHY7
X-Google-Smtp-Source: AGHT+IEWRL2vfTL72VIPERtPnBSjGwMM0TFvA3RWyrSODSGxAyZbHuQI1rfvBWW9IYd2krjV/apkdw==
X-Received: by 2002:a05:600c:1caa:b0:453:6150:de41 with SMTP id 5b1f17b1804b1-453936a4bcbmr56420255e9.17.1751128652325;
        Sat, 28 Jun 2025 09:37:32 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-453823b6e9esm116018175e9.28.2025.06.28.09.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 09:37:31 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.com>,
	Yoann Congal <yoann.congal@smile.fr>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][walnascar][PATCH 1/2] python3-evdev: Use Yocto kernel headers instead of host's
Date: Sat, 28 Jun 2025 18:37:26 +0200
Message-ID: <20250628163727.859462-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 Jun 2025 16:37:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118160

From: Yoann Congal <yoann.congal@smile.fr>

Commit 01ebfecf1c94 ("python3-evdev: switch to PEP-517 build backend")
did not update the way build arguments are passed to the build making
them unused. In python3-evdev case that meant that the build used host
kernel headers instead of Yocto's.

When host's and Yocto's headers were different (currently the case on
Debian 12 as seen on AB[0]), that triggered:

| src/evdev/ecodes.c:542:29: error: 'KEY_LINK_PHONE' undeclared (first use in this function); did you mean 'KEY_PICKUP_PHONE'?
|   542 |     PyModule_AddIntMacro(m, KEY_LINK_PHONE);
|       |                             ^~~~~~~~~~~~~~
[...]
ERROR: Task (.../../../layers/meta-openembedded/meta-python/recipes-devtools/python/python3-evdev_1.9.1.bb:do_compile) failed with exit code '1'

To fix this, use PEP517_BUILD_OPTS with the working (but weird looking) escaping.

Now that correct headers are used, their paths end up in the ecode.c
file which lead to a buildpaths error, skip the check for this patch.
This will be fixed in a following patch.

[0]: https://autobuilder.yoctoproject.org/valkyrie/#/builders/87/builds/40/steps/40/logs/stdio

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-evdev_1.9.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-evdev_1.9.1.bb b/meta-python/recipes-devtools/python/python3-evdev_1.9.1.bb
index c48bc39c1f..b8930c97d5 100644
--- a/meta-python/recipes-devtools/python/python3-evdev_1.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-evdev_1.9.1.bb
@@ -11,7 +11,8 @@ do_compile:prepend() {
     rm -rf ${S}/evdev/ecodes.c
 }
 
-SETUPTOOLS_BUILD_ARGS = "build_ecodes --evdev-headers ${STAGING_DIR_TARGET}/usr/include/linux/input.h:${STAGING_DIR_TARGET}/usr/include/linux/input-event-codes.h"
+PEP517_BUILD_OPTS = "--config-setting=--build-option='build_ecodes \
+    --evdev-headers ${STAGING_DIR_TARGET}/usr/include/linux/input.h:${STAGING_DIR_TARGET}/usr/include/linux/input-event-codes.h'"
 
 RDEPENDS:${PN} += "\
     python3-ctypes \
@@ -20,3 +21,4 @@ RDEPENDS:${PN} += "\
     python3-shell \
     python3-stringold \
     "
+INSANE_SKIP:${PN}-src = "buildpaths"

