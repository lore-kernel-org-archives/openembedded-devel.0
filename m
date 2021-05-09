Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.24749.1620600298631588740
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 May 2021 15:44:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gULFbjUX;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id b21so5217831pft.10
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 May 2021 15:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lWFEs2RFwQY618sMOFX6IGsFxpJ5EN1ctIWEbp1lMGo=;
        b=gULFbjUXU+JzHtvlbs9ZiisK7CVowYLC9CBzarjhlxIxbCTns4/5V0+KLcjURXI9Ww
         uQnn/0yAU6UIcPx47MnmBMhfzqt4qIW+rqsCUuJJulsnjCY9yh/fqtnrtpEGcOqp/bZR
         nqgtxlRowXU0Pc+ngCQvIFIW5tr1sKatEsd3r/zQpM9fPo5A/Zy+hTHazqyHg2StoULG
         eRW9huBtzTPICe7307aganJTv0BmL9sd896jL1k7FTT+qltcdkozk5EXiY7SJPKPo6l+
         oPBY2EbmwSpNb26+Fk2zW3CtahvW/wymFZZu0+Ydrn0wQQfeTMdV5komKJNc+V9lO7MX
         mEng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lWFEs2RFwQY618sMOFX6IGsFxpJ5EN1ctIWEbp1lMGo=;
        b=jyCIo2GsCQZgQxOQYwZYbDdDqmxuTYJ6BnBkzoQT7mBUioTVjJt3UDAlVAKrjqSUIl
         uOwV+HfkO9kWDxgecUcOjl5WOCoWn+RSGa+OFY3+LTe9pI4qFG2OCyLOpbYIAKlpNtlq
         laYxyL/8l4lJbdHnwQLEVNx4Y8/EQN4+JFXLKdgfoHwD8WyRA004nowvypH83HcO6Pxn
         aYZ78+SokG68oeTckdUF4+L7baDAKjyOkxMgkkV7tx+YGXIbEO8+GKQcDqtO0py9Ro1D
         yDWwaae7WH61QDpHqQeaKjUk4H7xL+Zzu5DWDGHcAdpXm6on41wzI7lWQoMsRdd848yu
         MXzg==
X-Gm-Message-State: AOAM532hAJBAM4t8vD5zDjlvI2IrLxM0ltc/oI9SQL1e8x5d71HR40CF
	aWTnLhyVgpHEKmKf1zTp7XSZaU32ErhY5g==
X-Google-Smtp-Source: ABdhPJw4Eb5VOp6Fy3SQ+pc1WD1IFlrCsEUuB3ef8ODfPETv+p9Y9Uw5Xhq2BS2rMsXscJ2YXipjFw==
X-Received: by 2002:a62:3201:0:b029:211:3dcc:c9ca with SMTP id y1-20020a6232010000b02902113dccc9camr21886880pfy.46.1620600297764;
        Sun, 09 May 2021 15:44:57 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::308d])
        by smtp.gmail.com with ESMTPSA id 3sm9008337pff.132.2021.05.09.15.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 May 2021 15:44:57 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
Subject: [meta-multimedia][PATCH] libupnp: Do not use _np versions of mutex APIs
Date: Sun,  9 May 2021 15:44:54 -0700
Message-Id: <20210509224454.1573151-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These APIs are deprecated/removed in future glibc 2.34+

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
 ...ead_mutexattr_gettype-pthread_mutexa.patch | 42 +++++++++++++++++++
 .../libupnp/libupnp_1.14.6.bb                 |  8 ++--
 2 files changed, 47 insertions(+), 3 deletions(-)
 create mode 100644 meta-multimedia/recipes-connectivity/libupnp/libupnp/0001-ithread-Use-pthread_mutexattr_gettype-pthread_mutexa.patch

diff --git a/meta-multimedia/recipes-connectivity/libupnp/libupnp/0001-ithread-Use-pthread_mutexattr_gettype-pthread_mutexa.patch b/meta-multimedia/recipes-connectivity/libupnp/libupnp/0001-ithread-Use-pthread_mutexattr_gettype-pthread_mutexa.patch
new file mode 100644
index 0000000000..ee78196779
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/libupnp/libupnp/0001-ithread-Use-pthread_mutexattr_gettype-pthread_mutexa.patch
@@ -0,0 +1,42 @@
+From 343a3b724225d3c87af0b268da14d3acb7a5b9a1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 9 May 2021 15:38:43 -0700
+Subject: [PATCH] ithread: Use
+ pthread_mutexattr_gettype/pthread_mutexattr_settype on linux
+
+_np variants are not recommended anymore, and glibc 2.34+ will have
+these removed
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ upnp/inc/ithread.h | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/upnp/inc/ithread.h b/upnp/inc/ithread.h
+index f6800ea9..1d0f9dba 100644
+--- a/upnp/inc/ithread.h
++++ b/upnp/inc/ithread.h
+@@ -304,7 +304,8 @@ static UPNP_INLINE int ithread_cleanup_thread(void)
+  *      Returns EINVAL if the kind is not supported.
+  *      See man page for pthread_mutexattr_setkind_np
+  *****************************************************************************/
+-#if defined(PTHREAD_MUTEX_RECURSIVE) || defined(__DragonFly__)
++#if defined(PTHREAD_MUTEX_RECURSIVE) || defined(__DragonFly__) \
++    || defined (__linux__)
+ 	#define ithread_mutexattr_setkind_np pthread_mutexattr_settype
+ #else
+ 	#define ithread_mutexattr_setkind_np pthread_mutexattr_setkind_np
+@@ -329,7 +330,8 @@ static UPNP_INLINE int ithread_cleanup_thread(void)
+  *      Always returns 0.
+  *      See man page for pthread_mutexattr_getkind_np
+  *****************************************************************************/
+-#if defined(PTHREAD_MUTEX_RECURSIVE) || defined(__DragonFly__)
++#if defined(PTHREAD_MUTEX_RECURSIVE) || defined(__DragonFly__) \
++    || defined (__linux__)
+ 	#define ithread_mutexattr_getkind_np pthread_mutexattr_gettype
+ #else
+ 	#define ithread_mutexattr_getkind_np pthread_mutexattr_getkind_np
+-- 
+2.31.1
+
diff --git a/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.6.bb b/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.6.bb
index ff6fb55dd3..81b42da412 100644
--- a/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.6.bb
+++ b/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.6.bb
@@ -9,7 +9,9 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=394a0f17b97f33426275571e15920434"
 
 SRCREV = "cef2b23fb36baac091b0c7d41136b4c1d9549c6d"
-SRC_URI = "git://github.com/pupnp/pupnp.git;protocol=https;branch=branch-1.14.x"
+SRC_URI = "git://github.com/pupnp/pupnp.git;protocol=https;branch=branch-1.14.x \
+           file://0001-ithread-Use-pthread_mutexattr_gettype-pthread_mutexa.patch \
+          "
 
 S="${WORKDIR}/git"
 
@@ -18,5 +20,5 @@ inherit autotools pkgconfig
 EXTRA_OECONF += "--enable-reuseaddr"
 
 # Enable LFS support ( for samples )
-CFLAGS += "-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64"
-CXXFLAGS += "-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64"
+CFLAGS += "-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE"
+CXXFLAGS += "-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE"
-- 
2.31.1

