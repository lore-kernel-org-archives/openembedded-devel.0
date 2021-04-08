Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web10.261.1617899821458491003
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:37:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BwOi5ClP;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: akuster808@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id c12-20020a4ae24c0000b02901bad05f40e4so649855oot.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=a9rJ0TUegqJv2+nGbS/8TDAR2h0uJ967rVVJu8eiO+U=;
        b=BwOi5ClPVmHyQsSp+DS0wapkMXhPjYzFTtgbYm98MQWMHiJ/pZYkyTMjUiRycor2tf
         VH0bgHIc2AEDSXUKjr/WToavKAZ+eI6Hbhx4zx8zqThr3B97eyoVGAK+m8Xral7sCe1N
         1Z9MCY7aCkeDI+LE5hM/XpF+IDhi6XHdTSpxIdH+l+fVnH0/wejGstM5HBPthVMkrEVY
         vb9agB7PVGZAyT1qSGgFbQKWbOoujab55zh+m77V9CKNQ84AcrNWrg7P3kEL7KCNYb+V
         OTI6p5DCELPNKq2VqJZ+j+ndIZxvOMmQA14ZPL3g6iRE3r8u82E8UYi7CEM+JepGUsv8
         F5iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=a9rJ0TUegqJv2+nGbS/8TDAR2h0uJ967rVVJu8eiO+U=;
        b=kk0umwwyDd7TgiJnTyJEbUUHgVpSp+MZu8R6p19lj8Zmg+agRAWsGMfFRH2Kf95CKZ
         C+EoQeYKDTvupZwXiTHLMGZn66qmsmkiChY1QARvGqxKj2H3xU5FpOtih5TB1eQKGd0a
         Ep3ex+9Bu+lAlbzphaC2fc3zZfZ8MPJoqtLgKqO+7v8BAKVIulyHQ2HhbVy4k4uQkjbb
         PyVwVlmYfwoXuzoV0Dx7itetid+XoKT259r4kdqx/J/QgOIv8Oci4ZVhK9dUw/TC6BaB
         cCYXup76fHJ1NO7HDFNmW6hE+0T74vj5Fbjzjvv1iaQZ06Mx+c1/geyWwzlKrrypkWll
         gvEQ==
X-Gm-Message-State: AOAM531XaZYnec1ZpksKGYeIUkf8hzQ73sCm8SZkIkBSOCtLRCkVJEAg
	abCz4WFGs0STeY80HBu6vNBwGSKnQ7w=
X-Google-Smtp-Source: ABdhPJw6XdzVLeNqvHN9R+qPefehLvA/akWDZyVhGIDaVXe3Jrsej8Urj9KvWQgh91lvYeep5wOKiQ==
X-Received: by 2002:a4a:bd1a:: with SMTP id n26mr8140785oop.45.1617899820578;
        Thu, 08 Apr 2021 09:37:00 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.36.59
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:37:00 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 51/64] mariadb: Fix build on newer 32bit architectures
Date: Thu,  8 Apr 2021 09:35:58 -0700
Message-Id: <7580c96d6ae244262c6c74395b1a656f1dc50a36.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>

From: Khem Raj <raj.khem@gmail.com>

newer 32bit arches e.g. RV32 and ARC do not have __NR_io_getevents
syscall and have started of with 64bit time_t so there is no 32bit
version

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit bd8e72c1397f700fca0ddc44120abf9d325fd872)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  2 +
 ...ck-if-syscall-exists-before-using-it.patch | 43 +++++++++++++++++++
 .../recipes-dbs/mysql/mariadb/sys_futex.patch | 22 ++++++++++
 3 files changed, 67 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-aio_linux-Check-if-syscall-exists-before-using-it.patch
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/sys_futex.patch

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 67cfa54f02e..9833b288571 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -20,6 +20,8 @@ SRC_URI = "https://downloads.mariadb.org/interstitial/${BP}/source/${BP}.tar.gz
            file://fix-arm-atomic.patch \
            file://0001-Fix-library-LZ4-lookup.patch \
            file://0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch \
+           file://0001-aio_linux-Check-if-syscall-exists-before-using-it.patch \
+           file://sys_futex.patch \
           "
 SRC_URI_append_libc-musl = " file://ppc-remove-glibc-dep.patch"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-aio_linux-Check-if-syscall-exists-before-using-it.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-aio_linux-Check-if-syscall-exists-before-using-it.patch
new file mode 100644
index 00000000000..a2f7812c509
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-aio_linux-Check-if-syscall-exists-before-using-it.patch
@@ -0,0 +1,43 @@
+From 5d9a869a72420cf0bb08b6aa93e980df90bdcf2e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 3 Apr 2021 12:02:36 -0700
+Subject: [PATCH] aio_linux: Check if syscall exists before using it
+
+Return -ENOSYS if not implememented, fixes build on arches like RISCV32
+Fixes
+tpool/aio_linux.cc:63:20: error: '__NR_io_getevents' was not declared in this scope; did you mean 'io_getevents'?
+   63 |   int ret= syscall(__NR_io_getevents, reinterpret_cast<long>(ctx),
+      |                    ^~~~~~~~~~~~~~~~~
+      |                    io_getevents
+
+Upstream-Staus: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tpool/aio_linux.cc | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/tpool/aio_linux.cc b/tpool/aio_linux.cc
+index d9aa8be2..d8a87a8f 100644
+--- a/tpool/aio_linux.cc
++++ b/tpool/aio_linux.cc
+@@ -59,6 +59,7 @@ Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02111 - 1301 USA*/
+ */
+ static int my_getevents(io_context_t ctx, long min_nr, long nr, io_event *ev)
+ {
++#ifdef __NR_io_getevents
+   int saved_errno= errno;
+   int ret= syscall(__NR_io_getevents, reinterpret_cast<long>(ctx),
+                    min_nr, nr, ev, 0);
+@@ -68,6 +69,9 @@ static int my_getevents(io_context_t ctx, long min_nr, long nr, io_event *ev)
+     errno= saved_errno;
+   }
+   return ret;
++#else
++  return -ENOSYS;
++#endif
+ }
+ #endif
+ 
+-- 
+2.31.1
+
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/sys_futex.patch b/meta-oe/recipes-dbs/mysql/mariadb/sys_futex.patch
new file mode 100644
index 00000000000..3277a3eee11
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/sys_futex.patch
@@ -0,0 +1,22 @@
+ Use SYS_futex for syscall
+
+glibc defines SYS_futex and on newer 32bit CPUs like RISCV-32, arc there
+is no 32bit time_t therefore define SYS_futex in terms of SYS_futex_time64
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/storage/innobase/include/ib0mutex.h
++++ b/storage/innobase/include/ib0mutex.h
+@@ -150,6 +150,12 @@ private:
+ #include <linux/futex.h>
+ #include <sys/syscall.h>
+ 
++/** Newer 32bit CPUs eg. RISCV-32 are defaulting to 64bit time_t from get go and
++ therefore do not define __NR_futex */
++#if !defined(SYS_futex) && defined(SYS_futex_time64)
++# define SYS_futex SYS_futex_time64
++#endif
++
+ /** Mutex implementation that used the Linux futex. */
+ template <template <typename> class Policy>
+ struct TTASFutexMutex {
-- 
2.17.1

