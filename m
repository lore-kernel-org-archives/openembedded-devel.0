Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.41408.1605558929259962343
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2020 12:35:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=j9/YB8kK;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id q28so3737703pgk.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2020 12:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hkxkfbUBJId2JhsXtB91ywTDDlmrydv5zPWKFa7IWAA=;
        b=j9/YB8kKty4xL8AtrW03VD+PyP3xspYvFqOTlRtiheoRNu7sKHO14bCaNoGGTlyKcm
         8pISbxT1GctgeOb+SLhB2TrUXE+5cEJ8w0+7EUaNodnJlYp0PeQqJJfIfqeE9IFurMYc
         Wm+OXBAw/shjW2LhYny+Uw1otqQGkprjF7p+3N3cAjinp+RezGcckV8nZy187Ry0hKHl
         Xtmp6dai9b7Zr52fnbstwqhKUS9A6mqScdTokLTQlxrNN1BotyFBD9oNzcjXj4V43aBu
         JixeJzLD3LoLpt8kj82hSKChFqJm5c/p9NRMAxZdlPtbCGIp/T7iyNTuVtrdQivz6V8H
         7SQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hkxkfbUBJId2JhsXtB91ywTDDlmrydv5zPWKFa7IWAA=;
        b=aDyu5XDnG7mkK5eZ3e70tkHevQDpqwHVZKF2bR4xhY88hsrcSrK3XcU0l9QWvRuw+P
         SEj7ukHExZOZpVTYS3m87FPVR3NbD85zO+aW4b23dAjhwPfkQKU74fx+UIzqFgViil//
         fmFZJtlBh/1AFP4l89xI8BMuNZDK47yO3X0T6MRyUibZ8bo+NpNJPHA9cC6Q0lR1vC/w
         N+wLNNqTzwcHN2G59FY2JAIbXTAkY9UPaP0A96rHglqtePGNzasQDp1wp4rRO9Ozgn/q
         Bqq3yYM6BQY3EN5McEpuApYHUAX1RhczWLWTis8n9dZ3b8+9Knszwmk9CfHpZft3WUZt
         fjnQ==
X-Gm-Message-State: AOAM533YGINbHAqxL1Vrbx53/HAkrG0xYdM2CFjONvC85B4EYsXWA9ei
	VQSfj7Q1cEAZ/C5Cd4Jw9KNI3xJrqEYpLg==
X-Google-Smtp-Source: ABdhPJxbAFP7XYVHqd1qV+FOvxp3xI5ZRN8UVUF5VxRMoZAIoYFmadYDEu0ct0eOuP6vS7TcYsHhyA==
X-Received: by 2002:a65:6205:: with SMTP id d5mr838129pgv.76.1605558928398;
        Mon, 16 Nov 2020 12:35:28 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4611])
        by smtp.gmail.com with ESMTPSA id f19sm18732908pfa.82.2020.11.16.12.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 12:35:27 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH] vlc: Fix build on riscv32
Date: Mon, 16 Nov 2020 12:35:25 -0800
Message-Id: <20201116203525.1754323-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-Use-SYS_futex-instead-of-__NR_futex.patch | 46 +++++++++++++++++++
 .../recipes-multimedia/vlc/vlc_3.0.11.1.bb    |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc/0001-linux-thread-Use-SYS_futex-instead-of-__NR_futex.patch

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/0001-linux-thread-Use-SYS_futex-instead-of-__NR_futex.patch b/meta-multimedia/recipes-multimedia/vlc/vlc/0001-linux-thread-Use-SYS_futex-instead-of-__NR_futex.patch
new file mode 100644
index 0000000000..405490dcfc
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc/0001-linux-thread-Use-SYS_futex-instead-of-__NR_futex.patch
@@ -0,0 +1,46 @@
+From f7957c35654222e5bd1038341612bbb40a88e98b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 16 Nov 2020 12:08:43 -0800
+Subject: [PATCH] linux/thread: Use SYS_futex instead of __NR_futex
+
+SYS_futex it expected from system C library.
+in glibc (/usr/include/bits/syscall.h defines it in terms of of NR_futex)
+some newer 32bit architectures e.g. riscv32 are using 64bit time_t from
+get go unlike other 32bit architectures in glibc, therefore it wont have
+NR_futex defined but just NR_futex_time64 this aliases it to NR_futex so
+that SYS_futex is then defined for rv32
+
+Upstream-Status: Submitted [https://github.com/videolan/vlc/pull/117]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/linux/thread.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/src/linux/thread.c b/src/linux/thread.c
+index 20da296..30639a3 100644
+--- a/src/linux/thread.c
++++ b/src/linux/thread.c
+@@ -30,6 +30,11 @@
+ #include <sys/syscall.h>
+ #include <linux/futex.h>
+ 
++/* 32bit architectures with 64bit time_t do not define __NR_futex syscall */
++#if !defined(SYS_futex) && defined(SYS_futex_time64)
++#define SYS_futex SYS_futex_time64
++#endif
++
+ #ifndef FUTEX_PRIVATE_FLAG
+ #define FUTEX_WAKE_PRIVATE FUTEX_WAKE
+ #define FUTEX_WAIT_PRIVATE FUTEX_WAIT
+@@ -50,7 +55,7 @@ unsigned long vlc_thread_id(void)
+ static int sys_futex(void *addr, int op, unsigned val,
+                      const struct timespec *to, void *addr2, int val3)
+ {
+-    return syscall(__NR_futex, addr, op, val, to, addr2, val3);
++    return syscall(SYS_futex, addr, op, val, to, addr2, val3);
+ }
+ 
+ static int vlc_futex_wake(void *addr, int nr)
+-- 
+2.29.2
+
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.11.1.bb b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.11.1.bb
index 44178a10d1..83cb176cc4 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.11.1.bb
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.11.1.bb
@@ -24,6 +24,7 @@ SRC_URI = "http://download.videolan.org/pub/videolan/${BPN}/${PV}/${BP}.tar.xz \
            file://0003-fix-luaL-checkint.patch \
            file://0004-Use-packageconfig-to-detect-mmal-support.patch \
            file://0005-Fix-build-with-Qt-5.15.patch \
+           file://0001-linux-thread-Use-SYS_futex-instead-of-__NR_futex.patch \
 "
 SRC_URI[sha256sum] = "189311d28aa814f106a7b3645211ac52c0b3e2b9f4b348de2f63bab3218086b8"
 
-- 
2.29.2

