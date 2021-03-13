Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.2601.1615661519809302803
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Mar 2021 10:51:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XC7qktwI;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id x21so2745551pfa.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Mar 2021 10:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fd1SQ5qKv2RDP4qX/tl6IUm2rhu/j9xcvmIrF+oICPU=;
        b=XC7qktwIAqU/5467R/Nm8Fd83eAOQFcIxT4KAHAfNl6gf2zXhOfexvOSaD+M5uZZ96
         pVvwTAVEghLtqQKHyJnSZMQmkblIeuSiw3X8JdkDjtEPFXzvlOQvsvk47PtlMf+lmIl/
         gzTtjlVHLjokLO6wFIrMBTpsBq8RFkkn5yg3LUBq9RSShycHcg1VQG3fymyUr5Bl+V31
         bkD9HWWTYOXYQtx21bUmzmF+LubcOnSCOZcPwLV0AJMKaPvcvDEDVFfU+0Y12RIOqMaA
         HcTU+eSH8Jp/+As36rRyVJL2Ua5yxmjuQ3ohmghy4AitQ7Haw5Ub85JbiUC2WqNhFk+c
         MQsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fd1SQ5qKv2RDP4qX/tl6IUm2rhu/j9xcvmIrF+oICPU=;
        b=XB5f/Jbs7iAPhHtw5nKN8zsWn58EjEYzND2lvO33LixMmaslsRIwzbdjkgMK1DEDio
         Cbxy0X4LxqPsOCx8lvD4/OddSLeJnJNLhmnzOR+c5A9yieFpwjnvS120t+CBtr+foFEg
         Wf1VZs1Cpj7JrshRkfSicg1JVPErr6zln7kgSXIg24EslhiqKjio0cm2q/r39nu9IlaD
         qwkb4cvHT/Fz55gfs5M9wdP/UeEAwlOoL2mcP+5aAUNykjUTKPjql+LxUHRlH2x1tpyD
         YpgmZ4+SPRhnPsVnlUIZkXMYu1KjDVKnT3zV2Nj3fHo6CUZpSOXk/mXAldFXLFqOIITL
         Rrqg==
X-Gm-Message-State: AOAM533OL+/Z+r6P/sosntxT/BEpNwyn+aqNKDQjknklEtl7K7wqf8yt
	Lsy9M7u/99lBjsGXsVS7RY3knII1cD+VLQ==
X-Google-Smtp-Source: ABdhPJy2YuenYMjn9Ngtz+U1JJFtRCIb0uOJ6QqsScxzIwKIZfDoBt2GoBRA9JnKSkpM4LNXrirPWQ==
X-Received: by 2002:a62:bd05:0:b029:1ab:6d2:5edf with SMTP id a5-20020a62bd050000b02901ab06d25edfmr3785801pff.32.1615661519021;
        Sat, 13 Mar 2021 10:51:59 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::c2dd])
        by smtp.gmail.com with ESMTPSA id y9sm6047021pja.50.2021.03.13.10.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Mar 2021 10:51:58 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] mariadb: Fix build on musl/ppc
Date: Sat, 13 Mar 2021 10:51:56 -0800
Message-Id: <20210313185156.452218-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
2.30.2

