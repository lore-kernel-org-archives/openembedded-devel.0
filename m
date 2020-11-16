Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web08.39939.1605554307509321030
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2020 11:18:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=j+KSF1Lr;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id b63so11470632pfg.12
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2020 11:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TQp0pxmqt/k4aMW6srIJAYqh8ER4iSrVjaQjCbiCZu8=;
        b=j+KSF1LrW7lH6KD5Y96fl8m5v0G/yvlR6vPzGNAhgPXIUv9mbqSjC3HX4QNfsLb/+h
         VoHSdlG3ueldSJ/4sFSvvpch9xLQH1vaP9XkSehdamB1uv7t7pRBfmJDaJePUSsVhFcF
         Y996NUK9rPnPHm02o+iM4tGOSU8NBKAYk++LBxOcNyDVjZ2bI4qS9/g//fb1x2EC20CU
         JV/y3mIg10dMfh/U89JAO0SWxGO1AQLe4feo0ISmAYQzyreairM/QIko4JDe1YWdxovK
         MH1ayInDpVfoTNqRo5dlU+sO+L7By0WW0gLT9lfq436kq9ym4RvgjS4Ziq0lJ9ZUT2ZG
         iiww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TQp0pxmqt/k4aMW6srIJAYqh8ER4iSrVjaQjCbiCZu8=;
        b=SQZqjWIp97C6mqz8wiUz6bwrDIFbS3EcU4L4xF5wSEv+E/isx2BcL77ISbso8NCFj4
         79sNy2aUdjqSnDxyxCpbW4lz/PyIcX5xf0LtAjit4ESpT+A5HRybD5eNL7q/Dn3e+9B8
         RGBu7IYpZHfj3IH31NHPpOFpX3MI11fJLDQwxnMXO8itaQ7ZsCj1HfZK7GeZWvqNGtBT
         K//u2g2uxLGRm1Y0qes9E5yNI1u0aQdJGIdX4bQqofngNeSksN51YCeg4sGBTx4sQWd/
         XMGmQg9Fw7rW45bYvx+yBiQrftKs8TU8GzWlbA9M/Ab1lyqBwy0MRfBlsQJ+4mKg6RGT
         N7sw==
X-Gm-Message-State: AOAM530xr+jpes7qSIKi0T+A4LLDW++Ub4OE5+tGyXc7d+2SVvjykRKC
	phDVvZd9bLMnNybtY/fpTKo7gs+ZbcrZnw==
X-Google-Smtp-Source: ABdhPJx87uiwTABlv2rl0XJC0/jhy9q3gxqv53R8VRvCQ/s7a+4qCXUSaEGeNtI1TETi0ogLFndi9g==
X-Received: by 2002:a62:178d:0:b029:18a:ab5a:39be with SMTP id 135-20020a62178d0000b029018aab5a39bemr14740304pfx.38.1605554306359;
        Mon, 16 Nov 2020 11:18:26 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4611])
        by smtp.gmail.com with ESMTPSA id in14sm143370pjb.57.2020.11.16.11.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 11:18:25 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] jack: Upgrade to 1.19.16
Date: Mon, 16 Nov 2020 11:18:23 -0800
Message-Id: <20201116191823.970898-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the jack_simdtests patch to latest submission upstream
Fix build on RISCV32

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-Use-SYS_futex-instead-of-__NR_futex.patch | 62 +++++++++++++++++++
 ...ts-Use-c-compiler-for-jack_simdtests.patch | 30 +++++----
 .../jack/{jack_1.19.14.bb => jack_1.19.16.bb} |  3 +-
 3 files changed, 81 insertions(+), 14 deletions(-)
 create mode 100644 meta-oe/recipes-multimedia/jack/jack/0001-Use-SYS_futex-instead-of-__NR_futex.patch
 rename meta-oe/recipes-multimedia/jack/{jack_1.19.14.bb => jack_1.19.16.bb} (93%)

diff --git a/meta-oe/recipes-multimedia/jack/jack/0001-Use-SYS_futex-instead-of-__NR_futex.patch b/meta-oe/recipes-multimedia/jack/jack/0001-Use-SYS_futex-instead-of-__NR_futex.patch
new file mode 100644
index 0000000000..dd1b7ccfdd
--- /dev/null
+++ b/meta-oe/recipes-multimedia/jack/jack/0001-Use-SYS_futex-instead-of-__NR_futex.patch
@@ -0,0 +1,62 @@
+From 83068f9b71aea16d1ad036fdcc326de1027b5585 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 15 Nov 2020 22:13:29 -0800
+Subject: [PATCH] Use SYS_futex instead of __NR_futex
+
+SYS_futex is expected from system C library.
+in glibc (/usr/include/bits/syscall.h defines it in terms of of NR_futex)
+rv32 is using 64bit time_t from get go unlike other 32bit architectures
+in glibc, therefore it wont have NR_futex defined but just NR_futex_time64
+this aliases it to NR_futex so that SYS_futex is then defined for rv32
+
+Upstream-Status: Submitted [https://github.com/jackaudio/jack2/pull/670]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ linux/JackLinuxFutex.cpp | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/linux/JackLinuxFutex.cpp b/linux/JackLinuxFutex.cpp
+index deff006b..aef99cd2 100644
+--- a/linux/JackLinuxFutex.cpp
++++ b/linux/JackLinuxFutex.cpp
+@@ -29,6 +29,10 @@ Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
+ #include <syscall.h>
+ #include <linux/futex.h>
+ 
++#if !defined(SYS_futex) && defined(SYS_futex_time64)
++#define SYS_futex SYS_futex_time64
++#endif
++
+ namespace Jack
+ {
+ 
+@@ -67,7 +71,7 @@ bool JackLinuxFutex::Signal()
+         if (! fFutex->internal) return true;
+     }
+ 
+-    ::syscall(__NR_futex, fFutex, fFutex->internal ? FUTEX_WAKE_PRIVATE : FUTEX_WAKE, 1, NULL, NULL, 0);
++    ::syscall(SYS_futex, fFutex, fFutex->internal ? FUTEX_WAKE_PRIVATE : FUTEX_WAKE, 1, NULL, NULL, 0);
+     return true;
+ }
+ 
+@@ -94,7 +98,7 @@ bool JackLinuxFutex::Wait()
+         if (__sync_bool_compare_and_swap(&fFutex->futex, 1, 0))
+             return true;
+ 
+-        if (::syscall(__NR_futex, fFutex, fFutex->internal ? FUTEX_WAIT_PRIVATE : FUTEX_WAIT, 0, NULL, NULL, 0) != 0 && errno != EWOULDBLOCK)
++        if (::syscall(SYS_futex, fFutex, fFutex->internal ? FUTEX_WAIT_PRIVATE : FUTEX_WAIT, 0, NULL, NULL, 0) != 0 && errno != EWOULDBLOCK)
+             return false;
+     }
+ }
+@@ -122,7 +126,7 @@ bool JackLinuxFutex::TimedWait(long usec)
+         if (__sync_bool_compare_and_swap(&fFutex->futex, 1, 0))
+             return true;
+ 
+-        if (::syscall(__NR_futex, fFutex, fFutex->internal ? FUTEX_WAIT_PRIVATE : FUTEX_WAIT, 0, &timeout, NULL, 0) != 0 && errno != EWOULDBLOCK)
++        if (::syscall(SYS_futex, fFutex, fFutex->internal ? FUTEX_WAIT_PRIVATE : FUTEX_WAIT, 0, &timeout, NULL, 0) != 0 && errno != EWOULDBLOCK)
+             return false;
+     }
+ }
+-- 
+2.29.2
+
diff --git a/meta-oe/recipes-multimedia/jack/jack/0001-example-clients-Use-c-compiler-for-jack_simdtests.patch b/meta-oe/recipes-multimedia/jack/jack/0001-example-clients-Use-c-compiler-for-jack_simdtests.patch
index dda21a32d8..1bdc5adbc1 100644
--- a/meta-oe/recipes-multimedia/jack/jack/0001-example-clients-Use-c-compiler-for-jack_simdtests.patch
+++ b/meta-oe/recipes-multimedia/jack/jack/0001-example-clients-Use-c-compiler-for-jack_simdtests.patch
@@ -1,4 +1,4 @@
-From 76b8a389268275cc13f3b4e61394d40b24ec56f1 Mon Sep 17 00:00:00 2001
+From f8cb818ca96fc2a45a04448a51f25a277ec183db Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 15 Jan 2020 20:21:58 -0800
 Subject: [PATCH] example-clients: Use c++ compiler for jack_simdtests
@@ -12,22 +12,26 @@ x86_64-yoe-linux-ld: example-clients/simdtests.cpp.28.o: undefined reference to
 Upstream-Status: Submitted [https://github.com/jackaudio/jack2/pull/536]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- example-clients/wscript | 2 ++
- 1 file changed, 2 insertions(+)
+ example-clients/wscript | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
 
-diff --git a/example-clients/wscript b/example-clients/wscript
-index a8857aa7..df9435aa 100644
 --- a/example-clients/wscript
 +++ b/example-clients/wscript
-@@ -69,6 +69,8 @@ def build(bld):
+@@ -49,10 +49,15 @@ def build(bld):
+         else:
+             use = ['clientlib']
  
++        if example_program == 'jack_simdtests':
++            ftrs = 'cxx cxxprogram'
++        else:
++            ftrs = 'c cprogram'
++
          if bld.env['IS_MACOSX']:
-             prog = bld(features='c cprogram', framework = ['Foundation'])
-+        elif example_program == 'jack_simdtests':
-+            prog = bld(features='cxx cxxprogram')
+-            prog = bld(features='c cprogram', framework = ['Foundation'])
++            prog = bld(features = ftrs, framework = ['Foundation'])
          else:
-             prog = bld(features='c cprogram')
+-            prog = bld(features='c cprogram')
++            prog = bld(features = ftrs)
          prog.includes = os_incdir + ['../common/jack', '../common']
--- 
-2.25.0
-
+         prog.source = example_program_source
+         prog.use = use
diff --git a/meta-oe/recipes-multimedia/jack/jack_1.19.14.bb b/meta-oe/recipes-multimedia/jack/jack_1.19.16.bb
similarity index 93%
rename from meta-oe/recipes-multimedia/jack/jack_1.19.14.bb
rename to meta-oe/recipes-multimedia/jack/jack_1.19.16.bb
index e954341ffe..c13d6261c1 100644
--- a/meta-oe/recipes-multimedia/jack/jack_1.19.14.bb
+++ b/meta-oe/recipes-multimedia/jack/jack_1.19.16.bb
@@ -16,8 +16,9 @@ DEPENDS = "libsamplerate0 libsndfile1 readline"
 
 SRC_URI = "git://github.com/jackaudio/jack2.git \
            file://0001-example-clients-Use-c-compiler-for-jack_simdtests.patch \
+           file://0001-Use-SYS_futex-instead-of-__NR_futex.patch \
           "
-SRCREV = "b54a09bf7ef760d81fdb8544ad10e45575394624"
+SRCREV = "5b78c2ef158c2d9ffe09818a7dd80209ed251c5f"
 
 S = "${WORKDIR}/git"
 
-- 
2.29.2

