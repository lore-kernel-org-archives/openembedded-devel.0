Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F3D2C021A0
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 09:04:40 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.6962.1739437478702902741
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Feb 2025 01:04:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=BlhRTdNF;
 spf=pass (domain: konsulko.com, ip: 209.85.128.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-438a3216fc2so6640115e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Feb 2025 01:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1739437476; x=1740042276; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cs2Lpytk++TAmjUbkAVFu62/SZBrdQgnH+CFKRbtzLI=;
        b=BlhRTdNFL8AZoQrUIFAxSw5fna73fJxdWRwOKBK+lzWWATHtjFC9zUE9bEzystJDjd
         WeNq+Fx2FpFITSHVnn9tI+QEnH+hcaYFtRsZCKiQ5ESOYvDH8jh6ope34Gvfx9pVmYmp
         AQ4QlC56VT+ppAU4ZUSI5p0skhXXKvtZlY+KY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739437476; x=1740042276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cs2Lpytk++TAmjUbkAVFu62/SZBrdQgnH+CFKRbtzLI=;
        b=dahh6r4wDTyBykzspS+x4rlMlqaLQg8ZET4OKEmoyaP95fdtivNAM2x8SU1RNE9JLc
         LatHaeWO4u2F/iJvc46kHRTeQ4rsDHqy26R+Z/eUXjvzEVf+ee7Ab5t2k9LuhdIf+TtT
         QcDedaUdz6VbwSrlsMNfejaxOzGjzOC6l8ELc2esKkxRhGrjEoSXsNeEFSkIgRy204TX
         avVnzP0hyuQUXS3Q7Q5vNUhGTSEwF64CrF3gbZKxltYn/Rmq8Qgmle4ALUP8nC5ommbE
         3GC34WbIitQ5xU6zMD2jGJw1+eHs64QOJQQC/KUlFUP2kay853KQKrNJwDfKvKUdrfrj
         UEyg==
X-Gm-Message-State: AOJu0Yw4IDJ4F3LSNj3p+Vm6saM1mQM0F7hxv7rfySUeJ+okCRvVA7JF
	Da9DDR8YFsav3C6mIXCmv34GmO4/r2qIT9SvqEEOf+9kOCKnJvmk5h97mCPKrhQvfHMyEBVqOUQ
	1
X-Gm-Gg: ASbGncv6rgk/tYSdz+zfdUEr/K4vtYre0uRuysjuefXYr2bZWxNtuWciyZKg6h2KT7Q
	oTwnOMcQtZy7DYyRBahbbiwdntB95RKKnNMcbx4uDJFIAj58YMjUiVGCjvJmncyn7SqMMAmjKVX
	2ak/YW+eykcAFS76sHtrUMYNKneex3dWhJ2txh7K9xyQQXVSCbSrdiNNsonnZrXgLOE/sO8YpAp
	F+IBg8qkfFMGhpDBiGHt8SCaBvVScv1Yq5oRv6/0OtePBcuOJ5B+cJgLK5jBOFgClbqmeE/0uRa
	qolpD4lf+0L8z4UudDov+20JZYGkQw==
X-Google-Smtp-Source: AGHT+IFyG5GXZV1S0KDqbvWxN288wb9i69lpG6cpa3mKJC3g8wHttp9e6tvxeJaTZtPqE1DR7sVL2w==
X-Received: by 2002:a05:600c:5007:b0:439:4d39:99f1 with SMTP id 5b1f17b1804b1-439581c9be2mr53234775e9.26.1739437476518;
        Thu, 13 Feb 2025 01:04:36 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a06e309sm42507005e9.24.2025.02.13.01.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 01:04:35 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-evdev: Upgrade 1.8.0 -> 1.9.0
Date: Thu, 13 Feb 2025 11:04:27 +0200
Message-Id: <20250213090430.3750793-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250213090430.3750793-1-leon.anavi@konsulko.com>
References: <20250213090430.3750793-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Feb 2025 09:04:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115456

Upgrade to release 1.9.0:

- Fix for CPATH/C_INCLUDE_PATH being ignored during build.
- Slightly faster reading of events in device.read() and
  device.read_one().
- Fix FreeBSD support.
- Drop deprecated InputDevice.fn (use InputDevice.path instead).
- Improve type hint coverage and add a py.typed file to the sdist.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-evdev_1.8.0.bb => python3-evdev_1.9.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-evdev_1.8.0.bb => python3-evdev_1.9.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-evdev_1.8.0.bb b/meta-python/recipes-devtools/python/python3-evdev_1.9.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-evdev_1.8.0.bb
rename to meta-python/recipes-devtools/python/python3-evdev_1.9.0.bb
index 1a382f49dd..82849e0006 100644
--- a/meta-python/recipes-devtools/python/python3-evdev_1.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-evdev_1.9.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/gvalkov/python-evdev"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d7bd1cc4c71b706c7e2d4053aef50f2a"
 
-SRC_URI[sha256sum] = "45598eee1ae3876a3122ca1dc0ec8049c01931672d12478b5c610afc24e47d75"
+SRC_URI[sha256sum] = "38218bc95507cad756bc621a5fe7a77a41eb8d9c1213855de8e4ba0aba28e79f"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.39.5


