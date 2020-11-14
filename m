Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.13167.1605395295061140389
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2020 15:08:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GWNQaM3u;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id oc3so2179026pjb.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2020 15:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8qV7jS/YfoZJBDNSny+BYv1j1faH93uf2sXTscIe/Uk=;
        b=GWNQaM3u68z1zaiGAJjOYp7o4F+nkMB7h6m/4oSpE3P0ahb/lrKeQtVZwrQ/G0Lirc
         X5laDUGAyaQuRjjv7jCin9KRJ2cIwvI26HO+Ixokf/hoLmd8toxBSTs4WVuMMyDvOXeM
         C2k4A7KcgKjlagHK7VUQiHF11gNoSt5S3AeG3jCzB3tUOq4lYlOyP8+0pItD3beZC+ay
         0t+c0Gg2eqMALldk/0uxnc7yMV2MN8eXpMxmfumSpid2WF5mVHrD8NyG2QQv9mQMzl6v
         TZcNLWYv1vmcLgvHt9UktvwyUWGKWXP2RDeE+YrBPiGgNVjmbWYH1SY9pCHNaX4uEEL1
         yBHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8qV7jS/YfoZJBDNSny+BYv1j1faH93uf2sXTscIe/Uk=;
        b=dmSQf3BL+berOCUm1i7G9guA2LvoQIhiN1bnCnK6UVBnogoC7iWSLgd7OcQ7QgVy+j
         I5JU3VrjSvqMCVwodE0n1/cK/7Wm5sZpF9rVCpUAueOLZ9lPDliJc4uUTgSgHL6xCSj7
         5BZdCu67OgdnqFQxIgEL1Ui579H7Y+KzKhSvKXBFb51xmSLaje4OSWPS5ZIJzlU+GEur
         A72cE/nkwhl4PuPPj4E5n0OUi1cabXLNaPAF4Hmtvg5nQwjmlEBMo01zLHGK+kMwKaRZ
         a4adKHc0kZT69Zn/E1Bkro7Elw6qZ9CtskxAhBFgQI0+rsHA0G0vFknduEsjepMzOeqi
         zUWQ==
X-Gm-Message-State: AOAM5316kggzQ9oKzhWQ7TlI0ugmTQGV+I4JjApOjss6MTNkeb4A2dsy
	0DrNyG+9PGeMQWo6SeO+ZawghNyC41mbbxr5
X-Google-Smtp-Source: ABdhPJwFCPq60gh/OHsMPxiKSQvTdKXN/s2ttqZB33Uk2KMenqlMPMqres81s8aO9v6Jjme9Bl0SbA==
X-Received: by 2002:a17:902:328:b029:d7:eba5:83ce with SMTP id 37-20020a1709020328b02900d7eba583cemr7545904pld.57.1605395294296;
        Sat, 14 Nov 2020 15:08:14 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id v191sm13520318pfc.19.2020.11.14.15.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2020 15:08:13 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/4] mariadb: Fix build on 32bit arches with 64bit time_t
Date: Sat, 14 Nov 2020 15:08:06 -0800
Message-Id: <20201114230806.370074-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201114230806.370074-1-raj.khem@gmail.com>
References: <20201114230806.370074-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  1 +
 ...fine-__NR_futex-if-it-does-not-exist.patch | 37 +++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 7c92bbaad6..e3ce297618 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -19,6 +19,7 @@ SRC_URI = "https://downloads.mariadb.org/interstitial/${BP}/source/${BP}.tar.gz
            file://clang_version_header_conflict.patch \
            file://fix-arm-atomic.patch \
            file://0001-Fix-library-LZ4-lookup.patch \
+           file://0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch \
           "
 SRC_URI[sha256sum] = "ff05dd69e9f6992caf1053242db704f04eda6f9accbcc98b74edfaf6013c45c4"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch
new file mode 100644
index 0000000000..0a2eed44f4
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch
@@ -0,0 +1,37 @@
+From d611f78198dee64bb6a05933d200b544e2510b76 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 14 Nov 2020 14:37:13 -0800
+Subject: [PATCH] innobase: Define __NR_futex if it does not exist
+
+__NR_futex is not defines by newer architectures e.g. arc, riscv32 as
+they only have 64bit variant of time_t. Glibc defines SYS_futex interface based
+on
+__NR_futex, since this is used in applications, such applications start
+to fail to build for these newer architectures. This patch defines a
+fallback to alias __NR_futex to __NR_futex_tim64 so SYS_futex keeps
+working
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ storage/innobase/log/log0sync.cc | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/storage/innobase/log/log0sync.cc b/storage/innobase/log/log0sync.cc
+index 7799e605..4fab8f74 100644
+--- a/storage/innobase/log/log0sync.cc
++++ b/storage/innobase/log/log0sync.cc
+@@ -66,6 +66,9 @@ Note that if write operation is very fast, a) or b) can be fine as alternative.
+ #ifdef __linux__
+ #include <linux/futex.h>
+ #include <sys/syscall.h>
++#if !defined(SYS_futex) && defined(SYS_futex_time64)
++# define SYS_futex SYS_futex_time64
++#endif
+ #endif
+ 
+ #include <atomic>
+-- 
+2.29.2
+
-- 
2.29.2

