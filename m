Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.9300.1599641153383053459
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Sep 2020 01:45:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=mQhRdl5j;
 spf=pass (domain: blade-group.com, ip: 209.85.128.46, mailfrom: yann.dirson@blade-group.com)
Received: by mail-wm1-f46.google.com with SMTP id q9so1460474wmj.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2020 01:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MB5RXiS64RSGKJ/Jv4lIBAwdphlZkeuJpqxjBBxya1k=;
        b=mQhRdl5jvskYxeYozQFCTyWi8bGQkrYHTdvDR0m0UDn1rkCEtgauLhHyIKtd4tJBEV
         krFF7SLZXjoSUXeL0qjrY1pGozeWGJEEX8uwiiBwXuRQRdiHOW9w/vnYWeIrMAWf+tx5
         cGOLRT30nayrG8fZ+a7y2W8HSKG/D0WM5BCccWYo61ARnuW6/CQFMixMIY+06uOgNs1D
         C/O4q82UX7YowHYp3gxpCDGaKrNd5l+nBWYkEcXtLfxXf/ppqovFTe88w2JUF4LVgsH2
         PvsPhBVz33O/j46S8hig3U2ehL1lGXIUfnulxLpkoauBKcwDrd8q/3o44XHDCMgBtqF9
         VnkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MB5RXiS64RSGKJ/Jv4lIBAwdphlZkeuJpqxjBBxya1k=;
        b=P+OmEuvfKhmI+hSpMTQ5TVsyrSaFXE5uaC+sj+59pTdeYSC0N5DZx5B85/owe9B1J3
         l5j/LDzp22pBD6UUFm/mMps6P0hlEUjXdpSRk6DJkLbtNN1qSIBzrTd618WcQJGC6kCm
         3d4XP/01fuVB0vKYsRt6roqd4iQuEhbkExhXfMHfK4AxPuVt2fpsRcgqAxnHwr1uHdOs
         it5I/zgT+Ir47SFAXqcoP7SiJkW9LNZJ1CsAsQssQ4UNZV6KXRR0JKAtKldnPfW4Gy+R
         CiohmgCLJh4pez8YoW3ipncYbnowlWRTpgHTTWROP/AFmOajIyJ6ZvyOc2RA7qhfEfpD
         lp5w==
X-Gm-Message-State: AOAM5312AyFF40PJd5NOojCiyp7ScMYwgnUXkkTXAb59SYSy1dOaSXY4
	oBh6Zn7blleiuz7kcNo15bs2tnn5709Iwbcn
X-Google-Smtp-Source: ABdhPJz9fLwUF9UGkDgiDTrg5QyI/eairXIdSH+G/YO2uyRokuwH+r94MNd8zCc4fuYApKc+TphMiQ==
X-Received: by 2002:a1c:1d17:: with SMTP id d23mr2513178wmd.187.1599641151278;
        Wed, 09 Sep 2020 01:45:51 -0700 (PDT)
Return-Path: <yann.dirson@blade-group.com>
Received: from blanquette.lan ([88.120.44.86])
        by smtp.gmail.com with ESMTPSA id y1sm2816452wmi.36.2020.09.09.01.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 01:45:50 -0700 (PDT)
From: "Yann Dirson" <yann.dirson@blade-group.com>
X-Google-Original-From: yann@blade-group.com
To: openembedded-devel@lists.openembedded.org
Cc: Yann Dirson <yann@blade-group.com>
Subject: [meta-oe][patch 1/4] libcec: workaround wrong choice of PYTHON_PKG_DIR when building on Debian
Date: Wed,  9 Sep 2020 10:45:37 +0200
Message-Id: <20200909084540.178949-1-yann@blade-group.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

As described in https://github.com/Pulse-Eight/libcec/issues/530 the
cmake code looks at the host to make decisions about the target, and
we can't even override this with a flag.

Signed-off-by: Yann Dirson <yann@blade-group.com>
---
 ...buggy-test-confusing-host-and-target.patch | 31 +++++++++++++++++++
 .../recipes-extended/libcec/libcec_6.0.2.bb   |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-extended/libcec/libcec/0001-Remove-buggy-test-confusing-host-and-target.patch

diff --git a/meta-oe/recipes-extended/libcec/libcec/0001-Remove-buggy-test-confusing-host-and-target.patch b/meta-oe/recipes-extended/libcec/libcec/0001-Remove-buggy-test-confusing-host-and-target.patch
new file mode 100644
index 000000000..7c29e15e2
--- /dev/null
+++ b/meta-oe/recipes-extended/libcec/libcec/0001-Remove-buggy-test-confusing-host-and-target.patch
@@ -0,0 +1,31 @@
+From 8ce50bf569ec2d931735180079bbe507730626c8 Mon Sep 17 00:00:00 2001
+From: Yann Dirson <yann@blade-group.com>
+Date: Mon, 7 Sep 2020 18:17:21 +0200
+Subject: [PATCH] Remove buggy test confusing host and target
+
+---
+ src/libcec/cmake/CheckPlatformSupport.cmake | 8 --------
+ 1 file changed, 8 deletions(-)
+
+diff --git a/src/libcec/cmake/CheckPlatformSupport.cmake b/src/libcec/cmake/CheckPlatformSupport.cmake
+index 1d99bd8..31dac4f 100644
+--- a/src/libcec/cmake/CheckPlatformSupport.cmake
++++ b/src/libcec/cmake/CheckPlatformSupport.cmake
+@@ -266,14 +266,6 @@ else()
+                 DESTINATION python/cec)
+       endif()
+     else()
+-      if(EXISTS "/etc/os-release")
+-        file(READ "/etc/os-release" OS_RELEASE)
+-        string(REGEX MATCH "ID(_LIKE)?=debian" IS_DEBIAN ${OS_RELEASE})
+-        if (IS_DEBIAN)
+-          SET(PYTHON_PKG_DIR "dist-packages")
+-        endif()
+-      endif()
+-
+       if (NOT PYTHON_PKG_DIR)
+         SET(PYTHON_PKG_DIR "site-packages")
+       endif()
+-- 
+2.28.0
+
diff --git a/meta-oe/recipes-extended/libcec/libcec_6.0.2.bb b/meta-oe/recipes-extended/libcec/libcec_6.0.2.bb
index 894ee52f9..c4aeb8c55 100644
--- a/meta-oe/recipes-extended/libcec/libcec_6.0.2.bb
+++ b/meta-oe/recipes-extended/libcec/libcec_6.0.2.bb
@@ -13,6 +13,7 @@ SRCREV = "29d82c80bcc62be2878a9ac080de7eb286c4beb9"
 SRC_URI = "git://github.com/Pulse-Eight/libcec.git;branch=release \
            file://0001-CheckPlatformSupport.cmake-Do-not-hardcode-lib-path.patch \
            file://0001-Enhance-reproducibility.patch \
+           file://0001-Remove-buggy-test-confusing-host-and-target.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.28.0

