Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web09.12333.1619098417078244426
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Apr 2021 06:33:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NQ45k1Se;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id y62so467953pfg.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Apr 2021 06:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=H6dxDIpjjtHGKSFTHBgMxg7/XvLrPYgravHl3jVH7bU=;
        b=NQ45k1SeFzLzHC8jTfcQlulAMDT65I0u7Xu4n5vwbhYzvNYPOYJ/gnQO+0Y+BLjl1k
         n7SzWL1HWip/5ETU8Bs7idlmKJFoA1AsT6qPXkGmY7c89z569N7yDGIQnuFRj+Igb1PJ
         LcTSf4weAopmpwZva7FVGuCWRqYr+ORHm4dvY73ohTtT8D3FHyZ6CyiwMuX/u1VrQ5uT
         9tVSAtcYDI22MnGXQtP61K856ZhNQ/Ftj8kGY/0cKlNQ5yyGpNeS0AKKtY8zqVLa6lFm
         8TXzh5+IruF/m78z5mqTuqcK126kGFKAWcMuU6UrOluA2O2+Czk5UzxhYpM8TIa8Z/dx
         O5Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=H6dxDIpjjtHGKSFTHBgMxg7/XvLrPYgravHl3jVH7bU=;
        b=mA6ET/XDoP6Vjd+udnAvoAF53LfPadKLYywlSAjCHrryr5S8BBL8W3GHmPRBMThj06
         qw/a59cIa2ZeHY4dMuZ2JFfkpiCj/kjZ4rSHhNUhMmaHm032fpZDeNPSrlhaNo0bC3zz
         WYHXlZEuxCbmmcw3uZFUiqvD+BinLNMEQJNiPJvbqXoWM+Mnkl9jWWZEP9VYjeqclk8b
         rh/Vaxc3UqEIZ/hLf5irTH8vDQjRAQSsDtfTC8/ydYa/wl2h08fOtQdvS6PcFZBbZTUX
         I0pTaQXFYvOCsSrZlPtIBBWNn0jIakgCaVrJETSKvd1YULeA8MI2j305cdb43bH7cpzB
         pOZA==
X-Gm-Message-State: AOAM532YjvvsiSWT3VAEuzQcMbnCGlb0kTVaMJNBKH/qZ2/CyuezspJ4
	MosVkpuVn+94GgCj+4qrBKqnikq+fFhwtA==
X-Google-Smtp-Source: ABdhPJywKiDSotiIt+FJzw6hJkCc6Js4aDiwZHYZ5atYt0FkbDAQ+IoVSVJUGGS3ch9X+QPcKWFfVg==
X-Received: by 2002:a63:dc49:: with SMTP id f9mr3520293pgj.361.1619098416274;
        Thu, 22 Apr 2021 06:33:36 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:e183:e120:a0a1:83e4])
        by smtp.gmail.com with ESMTPSA id gd1sm2376182pjb.49.2021.04.22.06.33.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Apr 2021 06:33:35 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 2/4] mariadb: Fix build on musl/ppc
Date: Thu, 22 Apr 2021 06:33:18 -0700
Message-Id: <a21c185df98e47599a53e3e2f66598e6d52f0075.1619098298.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1619098298.git.akuster808@gmail.com>
References: <cover.1619098298.git.akuster808@gmail.com>

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e68935ce287e2b0abd819180ebd86364c853d055)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  2 +
 .../mysql/mariadb/ppc-remove-glibc-dep.patch  | 50 +++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 27eede6c30..1fbcb71427 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -22,6 +22,8 @@ SRC_URI = "https://downloads.mariadb.org/interstitial/${BP}/source/${BP}.tar.gz
            file://0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch \
            file://0001-stacktrace-t.c-make-the-test-conditional.patch \
           "
+SRC_URI_append_libc-musl = " file://ppc-remove-glibc-dep.patch"
+
 SRC_URI[sha256sum] = "eb4824f6f2c532cd3fc6a6bce7bf78ea7c6b949f8bdd07656b2c84344e757be8"
 
 UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/releases"
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch b/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch
new file mode 100644
index 0000000000..1ca86bcca2
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch
@@ -0,0 +1,50 @@
+Remove glibc specific function dependencies
+
+Sourced from: https://git.alpinelinux.org/aports/tree/main/mariadb/ppc-remove-glibc-dep.patch
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/include/my_cpu.h
++++ b/include/my_cpu.h
+@@ -24,17 +24,16 @@
+ */
+ 
+ #ifdef _ARCH_PWR8
+-#include <sys/platform/ppc.h>
+ /* Very low priority */
+-#define HMT_very_low() __ppc_set_ppr_very_low()
++#define HMT_very_low() asm volatile("or 31,31,31")
+ /* Low priority */
+-#define HMT_low() __ppc_set_ppr_low()
++#define HMT_low() asm volatile ("or 1,1,1")
+ /* Medium low priority */
+-#define HMT_medium_low() __ppc_set_ppr_med_low()
++#define HMT_medium_low() asm volatile ("or 6,6,6")
+ /* Medium priority */
+-#define HMT_medium() __ppc_set_ppr_med()
++#define HMT_medium() asm volatile ("or 2,2,2")
+ /* Medium high priority */
+-#define HMT_medium_high() __ppc_set_ppr_med_high()
++#define HMT_medium_high() asm volatile("or 5,5,5")
+ /* High priority */
+ #define HMT_high() asm volatile("or 3,3,3")
+ #else
+@@ -81,7 +80,7 @@ static inline void MY_RELAX_CPU(void)
+   __asm__ __volatile__ ("pause");
+ #endif
+ #elif defined(_ARCH_PWR8)
+-  __ppc_get_timebase();
++  __builtin_ppc_get_timebase();
+ #elif defined __GNUC__ && (defined __arm__ || defined __aarch64__)
+   /* Mainly, prevent the compiler from optimizing away delay loops */
+   __asm__ __volatile__ ("":::"memory");
+--- a/storage/tokudb/PerconaFT/portability/toku_time.h
++++ b/storage/tokudb/PerconaFT/portability/toku_time.h
+@@ -124,7 +124,7 @@ static inline tokutime_t toku_time_now(v
+     __asm __volatile__ ("mrs %[rt], cntvct_el0" : [rt] "=r" (result));
+     return result;
+ #elif defined(__powerpc__)
+-    return __ppc_get_timebase();
++    return __builtin_ppc_get_timebase();
+ #else
+ #error No timer implementation for this platform
+ #endif
-- 
2.17.1

