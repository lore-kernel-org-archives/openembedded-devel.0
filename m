Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20D49C0219B
	for <webhook@archiver.kernel.org>; Sun,  9 Feb 2025 23:45:33 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.39945.1739144723932989297
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Feb 2025 15:45:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Y/eFlP3y;
 spf=pass (domain: linaro.org, ip: 209.85.167.48, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-543cc81ddebso4230588e87.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Feb 2025 15:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739144722; x=1739749522; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5Lb9cOyAId5fnbyeoRMSkQcF/vmzEA2kTpa50znk1FQ=;
        b=Y/eFlP3yLzwNVOCCvySTFoRGpX1eO2OEUhWJ7fAJN/ijQcLT7V3PoGhM5A0+H0CwXG
         E0dWykGyGrjNEMvIPpxeS8Be9/Sbz6/l0Is/1PabXS7AUUs8gC7UPbonPFBZzJ2rEL0r
         0/w3ZdAwmrENnR+9yZUt8nV4kfLk3TUCNeJuxz9FEM7jd5YZDfJUvwWn2IQRdRBaNjaP
         lvAapLOCb57p06zEFvFeBLpS7wpZHiDsppVPkoYerDgikKg3p/Dd3dyTU3AQzEsnEXbX
         FHrwMfyF1Yt7ZYOThzF+ndd/Pwu6DZvEWVJcmbUb8KnEF4oYaGmM33xOnLrEfx8CCQbG
         k8gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739144722; x=1739749522;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Lb9cOyAId5fnbyeoRMSkQcF/vmzEA2kTpa50znk1FQ=;
        b=csggZBelVNUHs4WP0KXS7w6opxhVf+WUIe6gsZYLlGyFQ6ormNbvnFiq1rn9Wq2PEo
         uaNir0nA69FXrUEbT4hs285DSvSQxq95c3gs1R0QWKqzBAJB3sMpTxL5BxX2cU+nDRgK
         JqjvkpaCp2auubtB33d2v2zCTSUK7dGhUPk7ipzlQxqtigIOCMQUM+gvYGpqxoInIVAP
         PRxW6y6XHZbZOouL8QRNb/fYm5Rbft1Qnu1pjszj3KGZf3PqzLnT+ABK+ir0iKEI5bZI
         SOjxF5ifzO7RZXdB4LUySXonjPbyKe/IEsNAT9SYldTKKe9Ye6YflgFtImk+DjGPlWsm
         AOoA==
X-Gm-Message-State: AOJu0YwrRpCQwGqP6GV8UoNu5lMUYWiWIQM+nVg7oAt5H51cIpD+wOKr
	U1NgJtZd0RgLoo8oyRYzogy6LkTYE+4dSaendJyu2H/TU6XoTXvT7ihXdkLhXggsYG3fTT0zVoY
	5Hu4=
X-Gm-Gg: ASbGncvIpD8Ztbdvn7pkQEeiJRIaNNQHLRsVA/M10giTOp9FnmxGTUoXHp3qrQS3PBi
	IJWgE20r8YxLuXzrPfOT1zB4ZJjbfSO/oqTBB2TdWlp56JtFNO/Ov0bQzE1QcCurZQj6An7pFBS
	L1BfqxvBs9zV9iaOvd3JJ8i5xWUKL8CFNGRQh0Q4k9XM4HD2To7xVPnKqw28lFc/vkvt0avCuKP
	VzQQjoYCNdOfCSDwG9kDZRYShnFxcj1+OaEg3Mv4vvFjzusKyReAKxdPvwP2ZAe86k1XipzZKB4
	VfqIhNcDHRnBNYT1nUxLYhTAMpWjA9Y=
X-Google-Smtp-Source: AGHT+IEnXIpAY/oCdBqDahDBoe/sATRav2qwEVysH3JdJiWzcjuw5s2T5qXTvExN/p0TdaUYKKGfxg==
X-Received: by 2002:a05:6512:3b0f:b0:545:60b:f38c with SMTP id 2adb3069b0e04-545060bf519mr1487265e87.41.1739144721489;
        Sun, 09 Feb 2025 15:45:21 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54509ce9e42sm284632e87.4.2025.02.09.15.45.19
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 15:45:20 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] android-tools: drop useless USB_DEBUGGING_ENABLED handling
Date: Mon, 10 Feb 2025 01:45:17 +0200
Message-Id: <20250209234518.1549197-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Feb 2025 23:45:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115321

This reverts commits 4271cc28279b ("android-tools: Add flag to enable
adbd service (#147)") and b85ae59968f4 ("android-tools 10: Add flag to
enable adbd service"). These two commits added optional
ROOTFS_POSTPROCESS_COMMAND touching the flag file, however this variable
doesn't make any sense in the package recipe, it is only concerned in
the image context.

Drop useless code from the android-tools recipe.

Fixes: 4271cc28279b ("android-tools: Add flag to enable adbd service (#147)")
Fixes: b85ae59968f4 ("android-tools 10: Add flag to enable adbd service")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../android-tools/android-tools_29.0.6.r14.bb               | 6 ------
 .../android-tools/android-tools_5.1.1.r37.bb                | 6 ------
 2 files changed, 12 deletions(-)

diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
index ee665bb15147..cd3c54e32e11 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
@@ -188,9 +188,3 @@ FILES:${PN}-fstools = "\
 FILES:${PN} += "${libdir}/android ${libdir}/android/*"
 
 BBCLASSEXTEND = "native"
-
-android_tools_enable_devmode() {
-    touch ${IMAGE_ROOTFS}/etc/usb-debugging-enabled
-}
-
-ROOTFS_POSTPROCESS_COMMAND_${PN}-adbd += "${@bb.utils.contains("USB_DEBUGGING_ENABLED", "1", "android_tools_enable_devmode;", "", d)}"
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
index a291fc39a2c8..7c27efb09356 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
@@ -188,12 +188,6 @@ FILES:${PN}-fstools = "\
 
 BBCLASSEXTEND = "native"
 
-android_tools_enable_devmode() {
-    touch ${IMAGE_ROOTFS}/etc/usb-debugging-enabled
-}
-
-ROOTFS_POSTPROCESS_COMMAND_${PN}-adbd += "${@bb.utils.contains("USB_DEBUGGING_ENABLED", "1", "android_tools_enable_devmode;", "", d)}"
-
 # http://errors.yoctoproject.org/Errors/Details/766881/
 # android-tools/5.1.1.r37/git/system/core/adb/adb_auth_host.c:86:23: error: passing argument 2 of 'RSA_get0_key' from incompatible pointer type [-Wincompatible-pointer-types]
 # android-tools/5.1.1.r37/git/system/core/adb/adb_auth_host.c:86:27: error: passing argument 3 of 'RSA_get0_key' from incompatible pointer type [-Wincompatible-pointer-types]
-- 
2.39.5


