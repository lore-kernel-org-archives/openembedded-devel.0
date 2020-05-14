Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web12.3740.1589499287295130655
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 May 2020 16:34:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uFuNLB8f;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id w7so1068925wre.13
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 May 2020 16:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FAQCa3kSK5bCqZpCzGJBxiryQLnNGCDQHAt43T5joa8=;
        b=uFuNLB8fLOl7vCfBd5CWd8AJLszdsv5ggzhn0U1HwlLHYiDolyJ3gEzmP/xnv8H8eO
         s5sCMQCWZ5nHpd1Z6zMyHbz1IESByDqGjootjlla8BI3Xt3tRTqK5oMtJbr3DaSLiTVv
         BgA42oolMy8MnKpr+zuZOSnvXJH9ZCLmcI70Iq5g1etcpUjesYxnJfLkyBhKpRSXWMn3
         R2SXBvqs6975/iZ2gCmG6dV8pywOPSCZmBNC4FQmaxTyETKPnPbqI6L8utLdLssZsaiu
         ygW7AqG9x1AcXSgjogEXEfep81hu7gJBrHMw3ABwSs2jrkIuKtWHGi8qd8M9+LP9WORU
         nPyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FAQCa3kSK5bCqZpCzGJBxiryQLnNGCDQHAt43T5joa8=;
        b=GJFYsX380EqfS2H7LfmY1Xhd7AD/pbvnMzOfgFJUnNPKWfbIusPsHSMn7415541bgd
         j3LvFEgi4m2KKRVCKx77sI28ZblYn6f+uJUYmK9V4+hU6DAPOjl8/+NHFPEaiUjYmIa8
         ezlJCbSIgWzmc3NQtkBVKuvYJ+5tpaqap3yKsV5bJW+qb5S0PscNTjw65rfeUrRG9AbS
         03/IyNgjj37HxMIX18xNd5ecU4Qmxtvk5y+4rWkCEq5UU7m3IvVeNmctMEK9TldssfY/
         +QJhCQNsm3zUVjs5TgyQuERs8xFJxIDOU++1WWOA6+zJ3kkjYNzDShnri96fHKh+RIIq
         mj5Q==
X-Gm-Message-State: AOAM532tL+0lofKMw87RMONxPCC9cH47TbFS/y+eHPttG/vlldjT5M8K
	5hcTbWKpb1nE5En2tctR2asf4OnD
X-Google-Smtp-Source: ABdhPJzNx3AHJcfX9aQng0fm9EXU/rK66VhEj1/cGADMmdW/Dnud8+m+ztcl80quHzr9L9ezgL8dBw==
X-Received: by 2002:a5d:4ccd:: with SMTP id c13mr900546wrt.415.1589499285342;
        Thu, 14 May 2020 16:34:45 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300F07F1074089F8D2D2EF5A696D9.dip0.t-ipconnect.de. [2003:f0:7f10:7408:9f8d:2d2e:f5a6:96d9])
        by smtp.gmail.com with ESMTPSA id a205sm956822wmf.33.2020.05.14.16.34.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 16:34:44 -0700 (PDT)
From: "Andreas M?ller" <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/2] libusb-compat: upgrade 0.1.5 -> 0.1.7
Date: Fri, 15 May 2020 01:34:34 +0200
Message-Id: <20200514233435.9551-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

They moved to github

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../0001-usb.h-Include-sys-types.h.patch        | 14 ++++++--------
 ...b-compat_0.1.5.bb => libusb-compat_0.1.7.bb} | 17 ++++++++---------
 2 files changed, 14 insertions(+), 17 deletions(-)
 rename meta-oe/recipes-support/libusb/{libusb-compat_0.1.5.bb => libusb-compat_0.1.7.bb} (70%)

diff --git a/meta-oe/recipes-support/libusb/libusb-compat/0001-usb.h-Include-sys-types.h.patch b/meta-oe/recipes-support/libusb/libusb-compat/0001-usb.h-Include-sys-types.h.patch
index b88440dec..f4f759c85 100644
--- a/meta-oe/recipes-support/libusb/libusb-compat/0001-usb.h-Include-sys-types.h.patch
+++ b/meta-oe/recipes-support/libusb/libusb-compat/0001-usb.h-Include-sys-types.h.patch
@@ -1,4 +1,4 @@
-From 340f911f9e3f4ff6b01682c5341c959060782af2 Mon Sep 17 00:00:00 2001
+From 840795dcb48214b74cfde75e7ce5e8a1a6c64a46 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 2 Apr 2015 19:18:45 -0700
 Subject: [PATCH] usb.h: Include sys/types.h
@@ -8,23 +8,21 @@ We need the definitions for things like u_intX_t
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  libusb/usb.h | 2 ++
  1 file changed, 2 insertions(+)
 
 diff --git a/libusb/usb.h b/libusb/usb.h
-index 84e730f..caffae2 100644
+index fa0e6c6..4e88eb8 100644
 --- a/libusb/usb.h
 +++ b/libusb/usb.h
-@@ -31,6 +31,8 @@
- 
- #include <dirent.h>
+@@ -45,6 +45,8 @@ typedef unsigned __int32  uint32_t;
+ #include <stdint.h>
+ #endif
  
 +#include <sys/types.h>
 +
  /*
   * USB spec information
   *
--- 
-2.1.4
-
diff --git a/meta-oe/recipes-support/libusb/libusb-compat_0.1.5.bb b/meta-oe/recipes-support/libusb/libusb-compat_0.1.7.bb
similarity index 70%
rename from meta-oe/recipes-support/libusb/libusb-compat_0.1.5.bb
rename to meta-oe/recipes-support/libusb/libusb-compat_0.1.7.bb
index 1ddbe238f..21fa478b6 100644
--- a/meta-oe/recipes-support/libusb/libusb-compat_0.1.5.bb
+++ b/meta-oe/recipes-support/libusb/libusb-compat_0.1.7.bb
@@ -18,15 +18,14 @@ BBCLASSEXTEND = "native nativesdk"
 
 PE = "1"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-compat-${PV}.tar.bz2 \
-           file://0001-usb.h-Include-sys-types.h.patch \
-          "
-
-SRC_URI[md5sum] = "2780b6a758a1e2c2943bdbf7faf740e4"
-SRC_URI[sha256sum] = "404ef4b6b324be79ac1bfb3d839eac860fbc929e6acb1ef88793a6ea328bc55a"
-
-UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/libusb/files/libusb-compat-0.1/"
-UPSTREAM_CHECK_REGEX = "/libusb-compat-(?P<pver>(\d+[\.\-_]*)+)/$"
+SRC_URI = " \
+    git://github.com/libusb/libusb-compat-0.1.git;protocol=https \
+    file://0001-usb.h-Include-sys-types.h.patch \
+"
+SRCREV = "4a27760ec5954ec8605e052a3207afbe0979eeef"
+S = "${WORKDIR}/git"
+
+UPSTREAM_CHECK_URI = "https://github.com/libusb/libusb-compat-0.1/releases"
 
 BINCONFIG = "${bindir}/libusb-config"
 
-- 
2.21.1

