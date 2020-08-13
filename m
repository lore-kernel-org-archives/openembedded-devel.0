Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.13967.1597336090594339787
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2020 09:28:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ka3zZ/aB;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id kq25so6847687ejb.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2020 09:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WUtDVfjoYR6P+khaoj6VdfXr6MVa+4GhAZLIOfSU1mY=;
        b=ka3zZ/aBmzbreYtH5bkb4EEXnC8SX7w09GwRrg+0lXAAfhN/B6Aa1yuIAmaCdK8kWD
         2PQynZaLkn3GvY7WfJDioduHs+GdlBp2QrOn93Km0NKf0zgoPA9fz+mLfqyuCJgPyMwJ
         sBnsSPicwJP3Uh6nQdC3JRoKboQ7zAD+K0UlbWIgO4OxBHf0XxTGdvaJqbxv6kgSH7SF
         qDV6CdQ6HGi4MvFX0y4V4ST1Ipnn20xMaFjqcScCWtfhN4+v+r1f1oRbJGRfqaxd09NE
         YitehaLPp7BB7FPFeaDXB75Wo8Eiz+Wg/DMGXUDVbO1oBatBv5VgBsjwscj8woeEFLIN
         C4eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WUtDVfjoYR6P+khaoj6VdfXr6MVa+4GhAZLIOfSU1mY=;
        b=U5DlhfpI08elrR/DwHX3z8mC+hWnpMBwW4JCf3Km6B/KtpsEqXFU2Z57lzo30QIRen
         sE+iKmKgJ+iz4eQbISnCx6AjCUs0tZlSMabFXdhrN3s4tTWEwLevz8/Vq/QMZzs5VBiq
         NIixjulnIfItDov/gXoh6mKgNh2hn+flHCb4+BC11+otbA1dn2m5H/xl9EAznXBGh8at
         MmdyJxpnoMmttAAbCLS0I/NfDwbE31AxXnBK1ujMRTUaxD+yD6JjPe9KD0sVKBu6w4nG
         xqq+aGoSOOYbktKbSyyQp0d/nDChsc/aH03t+QaoqGTetuff8W7cwwEzRZJg20SEYyeU
         uZqg==
X-Gm-Message-State: AOAM530aB3SZipDQiBaLTHUQ9LkS6dqYvmY+Nu+hEjPrFFS84Gt+fW4C
	dWHfec0YBWApv4Ihlf/rVenrDice
X-Google-Smtp-Source: ABdhPJzaLq3KPzFFMviYVsz7Ye3CNGx9qANlRXB1Xc8e8gkwbb6imlKUzDOKXzE+S7IPMtLNOVnhJw==
X-Received: by 2002:a17:906:82d5:: with SMTP id a21mr5413947ejy.213.1597336088795;
        Thu, 13 Aug 2020 09:28:08 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box (cable-95-168-130-13.cust.telecolumbus.net. [95.168.130.13])
        by smtp.gmail.com with ESMTPSA id n5sm4620328eja.105.2020.08.13.09.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 09:28:07 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [meta-java][PATCHv2] openjdk-8: add a glibc 2.32 compatibility patch
Date: Thu, 13 Aug 2020 18:27:56 +0200
Message-Id: <20200813162756.24193-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
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

