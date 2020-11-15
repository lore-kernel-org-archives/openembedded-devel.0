Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
 by mx.groups.io with SMTP id smtpd.web11.25276.1605472508214364628
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2020 12:35:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GK2CswPm;
 spf=pass (domain: gmail.com, ip: 209.85.210.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f196.google.com with SMTP id 131so891742pfb.9
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2020 12:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FTZOLLrXzn84kIX5KaYMgfnX2prnnDGWz5KzEmDOcsM=;
        b=GK2CswPmBR3JxFg5yT61ATybvESHoEuF1jlGdruyUEohaaF0UEr8hVzAFK4uURPbSM
         h/6xTL/Knym4NuejFYYa4tdxyFpr30Yy5L13ehPNXAT1OM6L77qzPLB62o+bL96vhgQh
         LjkBWl7WfQjRHZTw+/oWTCmkf/i59/mraKGaEk/Rf9+eWipkNq3P3xtTWEJCLKfFuU5U
         d0sKvnc7LIsltQWTIWHe6GtQV2AXELjlkaAyX7eS8XRR4CLJBQsU21ymF0/sy6V5JI2d
         7HZgfZdcU8sliQERKipJVhsWVl2Pi9rUjr4/zt2fplFvfrNb2Qbfnjw71QuqhnaIajVJ
         isHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FTZOLLrXzn84kIX5KaYMgfnX2prnnDGWz5KzEmDOcsM=;
        b=Okr5D9IZyPIzlqnpVEPqk8MgeH4YbMf/IL7gAPPBP6QcCUEItsrjnctQlxW+uw/A2s
         Ygqw7gjv4TL4EethxrYbvRdhXAkjDoJ/3kT6x2oGl3opJ15dybNU/n61YEp2Wzbh1m6W
         plrWHXxbZD581e974oBoppBfSAip7sp3KONcqT+6RrOMDHd+TagN8BGepbBZrB2a+uK7
         N9CTGwTJO7uBGQ6vMoakG6/iBUc0qCnqgi0kD8q4rPlStApJTjE1dc/4dXlnxRBqA5aX
         1rAwj5LgpFj5IJ+wu6AkbE6gqDkuDgL6LCp8pAcyzh1Yfa64njyMliUyDkoGKZm87mLH
         CNOw==
X-Gm-Message-State: AOAM532deRKFptt97PLQqjLVDJocyvmbl7nuBgmUC+63HWiLxPZlR5R5
	9nvef7qVyz3tT6vC6aGk5hhElIlIQDnuSg==
X-Google-Smtp-Source: ABdhPJxk6ZfQne7ZrBx2Ki7iYB6EfvGsnmZBIvRBdERjUch4s6399zVJL1jYacUti1uTL624rC6xrQ==
X-Received: by 2002:a17:90a:7e0f:: with SMTP id i15mr10662740pjl.77.1605472507384;
        Sun, 15 Nov 2020 12:35:07 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id m68sm14073212pga.46.2020.11.15.12.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2020 12:35:06 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] directfb: Fix build on riscv32
Date: Sun, 15 Nov 2020 12:35:04 -0800
Message-Id: <20201115203504.2817534-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-graphics/directfb/directfb.inc    |  1 +
 ...ild-when-__NR_futex-is-not-available.patch | 54 +++++++++++++++++++
 2 files changed, 55 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/directfb/directfb/0001-os-linux-Fix-build-when-__NR_futex-is-not-available.patch

diff --git a/meta-oe/recipes-graphics/directfb/directfb.inc b/meta-oe/recipes-graphics/directfb/directfb.inc
index f7dc668433..e11f7a60f6 100644
--- a/meta-oe/recipes-graphics/directfb/directfb.inc
+++ b/meta-oe/recipes-graphics/directfb/directfb.inc
@@ -22,6 +22,7 @@ SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/DirectFB-${PV}.tar.g
            file://fix-client-gfx_state-initialisation.patch \
            file://fix-tslib-version-check.patch \
            file://0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch \
+           file://0001-os-linux-Fix-build-when-__NR_futex-is-not-available.patch \
            "
 
 S = "${WORKDIR}/DirectFB-${PV}"
diff --git a/meta-oe/recipes-graphics/directfb/directfb/0001-os-linux-Fix-build-when-__NR_futex-is-not-available.patch b/meta-oe/recipes-graphics/directfb/directfb/0001-os-linux-Fix-build-when-__NR_futex-is-not-available.patch
new file mode 100644
index 0000000000..db4417a3d6
--- /dev/null
+++ b/meta-oe/recipes-graphics/directfb/directfb/0001-os-linux-Fix-build-when-__NR_futex-is-not-available.patch
@@ -0,0 +1,54 @@
+From 7df69c3a784ab2cc4770bdb366cf788cdb78099a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 15 Nov 2020 12:30:41 -0800
+Subject: [PATCH] os/linux: Fix build when __NR_futex is not available
+
+Newer architectures like riscv32 do not define __NR_futex intentionally
+since it uses 64bit time_t from very beginning, therefore only caters to
+futex_time64 syscall
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/direct/os/linux/glibc/system.c | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/lib/direct/os/linux/glibc/system.c b/lib/direct/os/linux/glibc/system.c
+index 373a711..d027a70 100644
+--- a/lib/direct/os/linux/glibc/system.c
++++ b/lib/direct/os/linux/glibc/system.c
+@@ -36,6 +36,7 @@
+ 
+ #include <errno.h>
+ #include <signal.h>
++#include <sys/syscall.h>
+ #include <unistd.h>
+ 
+ #include <linux/unistd.h>
+@@ -46,6 +47,10 @@
+ #include <direct/system.h>
+ #include <direct/util.h>
+ 
++#if !defined(SYS_futex) && defined(SYS_futex_time64)
++# define SYS_futex SYS_futex_time64
++#endif
++
+ D_LOG_DOMAIN( Direct_Futex, "Direct/Futex", "Direct Futex" );
+ D_LOG_DOMAIN( Direct_Trap,  "Direct/Trap",  "Direct Trap" );
+ 
+@@ -239,10 +244,9 @@ direct_futex( int *uaddr, int op, int val, const struct timespec *timeout, int *
+      }
+ #endif
+ 
+-     ret = syscall( __NR_futex, uaddr, op, val, timeout, uaddr2, val3 );
++     ret = syscall( SYS_futex, uaddr, op, val, timeout, uaddr2, val3 );
+      if (ret < 0)
+           return errno2result( errno );
+ 
+      return DR_OK;
+ }
+-
+-- 
+2.29.2
+
-- 
2.29.2

