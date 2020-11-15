Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web12.13776.1605400418633351133
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2020 16:33:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KsI/L5VI;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 34so6541700pgp.10
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2020 16:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ojQRuGDjOVaTpaKyxxxM4mnIliyrgkCY2WHoJj2sNjw=;
        b=KsI/L5VICly+vwN+OBI8BSDqC67TgWSEjCCHW24OL+q2XQKj303TZa0ozHN4zMEAe1
         +THI7KwmlvOJkvI9VzDpH0YKRi6tEgi9WQrFI/tJIf8Ao/frUfzvKaU4Dj9+f+sgUcsT
         i3Nr588aBXmeDzQV/EdV0otebADICKwCbpKj4HwlWX6zLwEshWJuX3oXYOndL4fjbdmD
         6h2eOaQ4b/fNm0ckeAmCwXL9nwqs59lRGh1ZckTdiPcVFBqC9tjSMI+A8Rq3JtKQc/WS
         2QP5Degk2I8+EP7IRjc6pFvsp6NBRNwZl2OBRjOuncCHmfKewo8VzxrMNdV41QVkCwyO
         JRIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ojQRuGDjOVaTpaKyxxxM4mnIliyrgkCY2WHoJj2sNjw=;
        b=J2MMkcGLsmDUodz7ClptQBaFE3Eh5JZ2p4ALTas+94fYUnvlSqf9vAiwnXVQMlGa/x
         u7HNE5B07sQwURZuT03pZF7JHQYGeqj1xGwzPYphzpmj5L0ogUscum0fqDbmv+8ZdUwa
         Jy0dT2+8wiLlXdq5ZhhMn/c4aMke7fv5Wrz8uY+ZDj/g8PiHhPeA3o3SmcW2An3nvZ4q
         k+hMEUBdpY/Yernebv1KHlB6xWeByVuKFGOfZ0SGnYy6S0ITWBKwS5SjjscV2IOVD6wo
         zsiOkLNob1/ShEXS11IfdXpKybwMSnkyeSZQhiSqgYNq1k7MAJMnXtkabmsPRaNj2qHs
         l9IA==
X-Gm-Message-State: AOAM533Jzwo37KsqTqPeaTNRAODMMVzqXWUC5Rk2QxzAn4D7DaM2R7dq
	6nkKxjUqnHmmmncKuJdaeZ4XZRYtIoT81eLH
X-Google-Smtp-Source: ABdhPJzUknNBJkXI8QIkNPt7uXVaD9/Xze4C5KViQ3oVexd1mE/PfynJH6s0zfqAyAoZgCFbFZeQ+Q==
X-Received: by 2002:aa7:9595:0:b029:18e:ecd5:bcdc with SMTP id z21-20020aa795950000b029018eecd5bcdcmr8089054pfj.47.1605400417688;
        Sat, 14 Nov 2020 16:33:37 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id a81sm13789761pfd.178.2020.11.14.16.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2020 16:33:37 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] liburing: Fix build on 32-bit arches with 64-bit time_t
Date: Sat, 14 Nov 2020 16:33:34 -0800
Message-Id: <20201115003334.1666168-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...n-32bit-architectures-with-6bit-time.patch | 35 +++++++++++++++++++
 .../recipes-support/liburing/liburing_0.7.bb  |  4 ++-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/liburing/liburing/0001-test-Fix-build-on-32bit-architectures-with-6bit-time.patch

diff --git a/meta-oe/recipes-support/liburing/liburing/0001-test-Fix-build-on-32bit-architectures-with-6bit-time.patch b/meta-oe/recipes-support/liburing/liburing/0001-test-Fix-build-on-32bit-architectures-with-6bit-time.patch
new file mode 100644
index 0000000000..01c5ccd53a
--- /dev/null
+++ b/meta-oe/recipes-support/liburing/liburing/0001-test-Fix-build-on-32bit-architectures-with-6bit-time.patch
@@ -0,0 +1,35 @@
+From 0a9b12eda0f6e487398dad004121bdd1be792428 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 14 Nov 2020 16:18:44 -0800
+Subject: [PATCH] test: Fix build on 32bit architectures with 6bit time_t
+
+It uses SYS_futex, which it expects from system C library.
+in glibc (/usr/include/bits/syscall.h defines it in terms of of NR_futex)
+rv32 is using 64bit time_t from get go unlike other 32bit architectures
+in glibc, therefore it wont have NR_futex defined but just NR_futex_time64
+this aliases it to NR_futex so that SYS_futex is then defined for rv32
+
+Upstream-Status: Submitted [https://github.com/axboe/liburing/pull/237]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ test/35fa71a030ca-test.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/test/35fa71a030ca-test.c b/test/35fa71a030ca-test.c
+index 4ecf211..7f2124b 100644
+--- a/test/35fa71a030ca-test.c
++++ b/test/35fa71a030ca-test.c
+@@ -24,6 +24,10 @@
+ 
+ #include <linux/futex.h>
+ 
++#if !defined(SYS_futex) && defined(SYS_futex_time64)
++# define SYS_futex SYS_futex_time64
++#endif
++
+ static void sleep_ms(uint64_t ms)
+ {
+   usleep(ms * 1000);
+-- 
+2.29.2
+
diff --git a/meta-oe/recipes-support/liburing/liburing_0.7.bb b/meta-oe/recipes-support/liburing/liburing_0.7.bb
index 3a1eaef873..e122a907cd 100644
--- a/meta-oe/recipes-support/liburing/liburing_0.7.bb
+++ b/meta-oe/recipes-support/liburing/liburing_0.7.bb
@@ -9,7 +9,9 @@ SECTION = "libs"
 LICENSE = "LGPLv2.1 | MIT"
 LIC_FILES_CHKSUM = "file://README;beginline=41;endline=44;md5=d51b5805e2a675685e6a66ca50904cf9"
 
-SRC_URI = "git://github.com/axboe/liburing.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/axboe/liburing.git;branch=master;protocol=https \
+           file://0001-test-Fix-build-on-32bit-architectures-with-6bit-time.patch \
+           "
 SRCREV = "45f0735219a615ae848033c47c7e2d85d101d43e"
 S = "${WORKDIR}/git"
 
-- 
2.29.2

