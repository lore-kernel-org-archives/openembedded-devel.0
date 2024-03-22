Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89B1BC54E71
	for <webhook@archiver.kernel.org>; Fri, 22 Mar 2024 09:25:29 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.8650.1711099527633746293
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Mar 2024 02:25:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nPyXlLOt;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-513a08f2263so2047096e87.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Mar 2024 02:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711099526; x=1711704326; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rm42VACZYGwZW5fH6xY88RcONEdx+ISKr7ae6wdSqS8=;
        b=nPyXlLOtB3++V5cRhD8zPqz1e7uT9M54OFw+/yQgbwt+K1wlA2dZ722249oe8CVKsk
         lavzBxB91W1kEhIpS7prPo68SfG5owWRKI+N6KNtbNpO2zwuG0EqDaA02woGTuXy5qb9
         2N8TrfoxNVpr7kTs/PHZACbtS8/lTjFDnl2hpUFK2kAUWnlNFH4T9ZfyIg0ek7alzbt4
         8eXt4BKstZK32QJxUh1H+52LpR3sPYLFyZ9g6mFqm6kDLg1Kr5pgeT/cteFOWFF9OnHa
         eVN9yG5USQMDoPGjSm2kSomjT4v4fJzr8zbm3r4lLu/VBIA2X1S3It4Z49Nr2a0mhKFn
         jjzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711099526; x=1711704326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rm42VACZYGwZW5fH6xY88RcONEdx+ISKr7ae6wdSqS8=;
        b=revpeYOUm+vJAi7SdqJh2NTdOrQJ93Bc9BkVUXKCujJAxpUgT9x5QnFZ9JE8zaEfLN
         gOsCDKsu/ts7jJtsZhOebveUVBOWuVg9OA+Katv6Xm/Z2aTpwZb/yfQ51JVNDaYHvEws
         UCBCBXHFkYBiHKiKjQkxqoO8TxDu+JHlSS5TesGhpAi0DpkfNQ/LCeW2LIQymvGe/jLK
         3MsPsFMTLurPz14G91aM1r37sWOQYnlXr4CCXaAo9r+44ZbU4NHXOwrT+Au2KLBckFio
         19F0/FPcYHMahUaxwyWRFaL4WD1O/0qxWTGVk7rifLDyrMJQOb+5DxpXHZd1Nmwy3I1q
         tEhA==
X-Gm-Message-State: AOJu0Yz+wgk6qpmQdd+mYdaO5vzsCIFaKntm/8lmY7o/Gr6QtuNuACzu
	HGQhix5iGUlSrtje0CMdycFsm1BV2fHH3SksKqXH4c3EjefZJ5+aDxIdFbE1
X-Google-Smtp-Source: AGHT+IFxGken5VImptty2IhJ850hZfiWis4h8Td1NvMID4CtTJpUx87u9Y6E0zBDaEBd6LAYbbQcvw==
X-Received: by 2002:a19:8c0d:0:b0:513:ca96:dbdf with SMTP id o13-20020a198c0d000000b00513ca96dbdfmr1283705lfd.12.1711099525461;
        Fri, 22 Mar 2024 02:25:25 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id dl17-20020a0560000b9100b0033d6bc17d0esm1631994wrb.74.2024.03.22.02.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 02:25:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] freerdp3: disable shadow without x11
Date: Fri, 22 Mar 2024 10:25:21 +0100
Message-ID: <20240322092521.244651-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Mar 2024 09:25:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109514

* add -DWITH_SHADOW=OFF to avoid build failure without x11 in DISTRO_FEATURES:

CMake Error at TOPDIR/BUILD/work/raspberrypi4_64-oe-linux/freerdp3/3.4.0/recipe-sysroot-native/usr/share/cmake-3.28/Modules/FindPackageHandleStandardArgs.cmake:230
(message):
  Could NOT find X11 (missing: X11_X11_INCLUDE_PATH X11_X11_LIB)

Call Stack (most recent call first):
  TOPDIR/BUILD/work/raspberrypi4_64-oe-linux/freerdp3/3.4.0/recipe-sysroot-native/usr/share/cmake-3.28/Modules/FindPackageHandleStandardArgs.cmake:600
(_FPHSA_FAILURE_MESSAGE)
  TOPDIR/BUILD/work/raspberrypi4_64-oe-linux/freerdp3/3.4.0/recipe-sysroot-native/usr/share/cmake-3.28/Modules/FindX11.cmake:665
(find_package_handle_standard_args)
  server/shadow/X11/CMakeLists.txt:1 (find_package)

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
index 55083d13c0..537d19263d 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
@@ -36,7 +36,7 @@ EXTRA_OECMAKE = " \
  "
 
 X11_DEPS = "virtual/libx11 libxinerama libxext libxcursor libxv libxi libxrender libxfixes libxdamage libxrandr libxkbfile"
-PACKAGECONFIG[x11] = "-DWITH_X11=ON -DWITH_XINERAMA=ON -DWITH_XEXT=ON -DWITH_XCURSOR=ON -DWITH_XV=ON -DWITH_XI=ON -DWITH_XRENDER=ON -DWITH_XFIXES=ON -DWITH_XDAMAGE=ON -DWITH_XRANDR=ON -DWITH_XKBFILE=ON,-DWITH_X11=OFF,${X11_DEPS}"
+PACKAGECONFIG[x11] = "-DWITH_X11=ON -DWITH_XINERAMA=ON -DWITH_XEXT=ON -DWITH_XCURSOR=ON -DWITH_XV=ON -DWITH_XI=ON -DWITH_XRENDER=ON -DWITH_XFIXES=ON -DWITH_XDAMAGE=ON -DWITH_XRANDR=ON -DWITH_XKBFILE=ON,-DWITH_X11=OFF -DWITH_SHADOW=OFF,${X11_DEPS}"
 PACKAGECONFIG[wayland] = "-DWITH_WAYLAND=ON,-DWITH_WAYLAND=OFF,wayland wayland-native libxkbcommon"
 PACKAGECONFIG[pam] = "-DWITH_PAM=ON,-DWITH_PAM=OFF,libpam"
 PACKAGECONFIG[pulseaudio] = "-DWITH_PULSEAUDIO=ON,-DWITH_PULSEAUDIO=OFF,pulseaudio"
-- 
2.44.0


