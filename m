Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.13655.1597335406863415893
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2020 09:16:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=n5FO+Pk1;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id m22so6771195eje.10
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2020 09:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GZO6L/G+v3Ct4FT8yKOWgkt86Bu9GAT3byGl3KI1m7w=;
        b=n5FO+Pk16NNF9+b5pCdmBu14vfodIY09MZuI8A3lNb/P0Di2apL7jHZlz1wWH7P7uF
         +gP7ohievM/latnCovKYIqSpw/IST6QkLMTNK1YGgl97B2D88qMre9SIW5RcclKMXzmE
         i9xADSbW8vVNEZL8yJA8syeL8LxSrC8gXXhPdgeguNRX3YNtvywWdymUVRoW2CBn4wiz
         IooFJCtOGdKmVOAo33f0wlySlfE5IoXu2soNMjWUMaHAAPquSoIAP5s5UbvfSB4F0AT+
         ILEVDW3TAjT5Oe5mHLT27fgEo5oa0lGko67S8p1RBmDnFRETVUkne8lOFFwprOWHIZYv
         Nnkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GZO6L/G+v3Ct4FT8yKOWgkt86Bu9GAT3byGl3KI1m7w=;
        b=f/bZvxfyY5a0v7VKX4EMZ4Nc1e+0ymjfkW6g3O+E07quyEx5ecVo1uW8XKK0luUi2I
         j3AKnLjvstctqjhrrwrxkJ6HzVCnNmN6cwrMmELHEdaULtMPGuSU3WJ162YsrOcvbaa/
         rJ/bhplUnCWm/P24LERpSVsYW8TN3yXK5AhoS73hkQNejh4v6Zt0RA85x6/R1kC8VPFd
         bVHTQI/lymSM5a/fZ7iUx27b6ugJ9/A3+xVp8gfdfMCzlDYU3I4AVE6mOU6SB/WZWUgg
         gVw/Bbr54Xq+ECAB+x9mT1aH9LbDJ9T/cbbmiewTuZgJKsrsqw+7R3b7CF9LiSSvFocm
         6Owg==
X-Gm-Message-State: AOAM53236CbQgBwsQiz7WXrcLgkTq1epb9SDnHiLPpuwZj3qiURXbcD3
	VQk4jmyVFuCalOtaJSSgqClC/rdL
X-Google-Smtp-Source: ABdhPJzVO4Zk77qbmpf2XuK8ge7/cYkbphn7iuFcrL6FrCc15PX+36FW/p3y+01VVjh1h1hWdsd5iQ==
X-Received: by 2002:a17:907:9483:: with SMTP id dm3mr5643098ejc.333.1597335405021;
        Thu, 13 Aug 2020 09:16:45 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box (cable-95-168-130-13.cust.telecolumbus.net. [95.168.130.13])
        by smtp.gmail.com with ESMTPSA id b62sm4241411edf.61.2020.08.13.09.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 09:16:44 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alexander.kanavin@daimler.com>
Subject: [meta-java][PATCH] openjdk-8: add a glibc 2.32 compatibility patch
Date: Thu, 13 Aug 2020 18:16:14 +0200
Message-Id: <20200813161614.22699-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alexander.kanavin@daimler.com>

Signed-off-by: Alexander Kanavin <alexander.kanavin@daimler.com>
---
 .../openjdk/openjdk-8-release-common.inc      |  1 +
 .../2010-Remove-usage-of-sys-sysctl.h.patch   | 39 +++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 recipes-core/openjdk/patches-openjdk-8/2010-Remove-usage-of-sys-sysctl.h.patch

diff --git a/recipes-core/openjdk/openjdk-8-release-common.inc b/recipes-core/openjdk/openjdk-8-release-common.inc
index 02210a1..c43fd22 100644
--- a/recipes-core/openjdk/openjdk-8-release-common.inc
+++ b/recipes-core/openjdk/openjdk-8-release-common.inc
@@ -20,6 +20,7 @@ PATCHES_URI = "\
     file://2007-jdk-no-genx11-in-headless.patch \
     file://2008-jdk-no-unused-deps.patch \
     file://2009-jdk-use-gcc-instead-of-ld-to-link-genSocketOptionRegistry.patch \
+    file://2010-Remove-usage-of-sys-sysctl.h.patch \
 "
 HOTSPOT_UB_PATCH = "\
     file://1001-hotspot-fix-crash-on-JNI_CreateJavaVM.patch \
diff --git a/recipes-core/openjdk/patches-openjdk-8/2010-Remove-usage-of-sys-sysctl.h.patch b/recipes-core/openjdk/patches-openjdk-8/2010-Remove-usage-of-sys-sysctl.h.patch
new file mode 100644
index 0000000..f6d7681
--- /dev/null
+++ b/recipes-core/openjdk/patches-openjdk-8/2010-Remove-usage-of-sys-sysctl.h.patch
@@ -0,0 +1,39 @@
+From 3ed9b4a109cf2f31b97ab8ba317d67886452523c Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 13 Aug 2020 17:59:42 +0200
+Subject: [PATCH] Remove usage of sys/sysctl.h
+
+This header has been removed in glibc 2.32, and isn't used for
+anything.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ jdk/src/solaris/native/java/net/PlainDatagramSocketImpl.c | 1 -
+ jdk/src/solaris/native/java/net/PlainSocketImpl.c         | 1 -
+ 2 files changed, 2 deletions(-)
+
+diff --git a/jdk/src/solaris/native/java/net/PlainDatagramSocketImpl.c b/jdk/src/solaris/native/java/net/PlainDatagramSocketImpl.c
+index cd15654e..4d8abe03 100644
+--- a/jdk/src/solaris/native/java/net/PlainDatagramSocketImpl.c
++++ b/jdk/src/solaris/native/java/net/PlainDatagramSocketImpl.c
+@@ -41,7 +41,6 @@
+ #endif
+ #ifdef __linux__
+ #include <unistd.h>
+-#include <sys/sysctl.h>
+ #include <sys/utsname.h>
+ #include <netinet/ip.h>
+ 
+diff --git a/jdk/src/solaris/native/java/net/PlainSocketImpl.c b/jdk/src/solaris/native/java/net/PlainSocketImpl.c
+index 170957e7..9aafbc09 100644
+--- a/jdk/src/solaris/native/java/net/PlainSocketImpl.c
++++ b/jdk/src/solaris/native/java/net/PlainSocketImpl.c
+@@ -43,7 +43,6 @@
+ #endif
+ #ifdef __linux__
+ #include <unistd.h>
+-#include <sys/sysctl.h>
+ #endif
+ 
+ #include "jvm.h"
-- 
2.28.0

