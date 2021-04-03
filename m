Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.34232.1617478925552775685
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Apr 2021 12:42:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kpui1jXo;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d8so3903844plh.11
        for <openembedded-devel@lists.openembedded.org>; Sat, 03 Apr 2021 12:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qcXfrzgvngO+/HZmgby41585eXSj4QKM8TcgAGSO6o0=;
        b=kpui1jXoVhmDg/o+9QQ0lp00zfgpHDeUFqSLew99RvgXgMOIkT4a6F9pq0ziKXrY9l
         bmK8of8qL2wKIr2qVs0rjHPbDEJa2e2NzkDq7aP5jICWCDEdKMgYNSnRMvzAu0F3/kRY
         HW/N5skrtl7Tns5ppJWEZLwG0oNuLCGauZQYmVch2tZ7GSeawNRtLg3ScLbD9ZBkPJ3w
         p+9j65x/R6euKga186wfs/c8LE3StDmQ07D7vwfduvnKLkAGgvYOMLCaRwnqJ/bemivH
         IZSLsD6UqIZwsfpHNeS5IJu1JwQAi0yfMTQOKtGzCixDqB8fXxhS4dAyMa4YbBDg71Wp
         OgVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qcXfrzgvngO+/HZmgby41585eXSj4QKM8TcgAGSO6o0=;
        b=kgoc+8fv+A7pqh9GAmjjdlNUAaJNPCo/CvbceVRcgcAOH8fHCk/7BxApdSPw5lYOsE
         dkqMhj8ila2MHu3fqDh0D48pXUS4IbIIsNsti8tQb+blGMUea9a8/uwpezSbaI6EpkdM
         RRj0SM0S73jeWMptoj+wwpxBsanqqF0D7+8LNXKsLQGyEbC/iZRYbCynsDofXf8JqEmz
         IZf1JSo+3U9nEEIzudU6DzUPF2J4pbohhNeh/ovthJuyULwlU9jyCyA/fFrY4CgxQZCH
         FGPfGf8lOsrWZ0pkLIcionf+GqdOWo6CdCX/wdfqNvkt7yNxf3gUwdBu+46okiIBvhqB
         cZVw==
X-Gm-Message-State: AOAM530QIr0oNEbaaqeouLnLZTFGHDlY7iUmEj/uPBicKF/AaI90gqVV
	WHxR49ECrtplKjJJsQruDLWQfTXPxjJd/A==
X-Google-Smtp-Source: ABdhPJx+Y5u27QTgYo7KA3r2aofF7xo2CdhWTBXt+CQ4rmi45QUYyHRILnUTFLHCwIu7UsAQhtZc9A==
X-Received: by 2002:a17:90b:608:: with SMTP id gb8mr19372393pjb.121.1617478924769;
        Sat, 03 Apr 2021 12:42:04 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bc1b])
        by smtp.gmail.com with ESMTPSA id n5sm11865562pfq.44.2021.04.03.12.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Apr 2021 12:42:04 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] mariadb: Fix build on newer 32bit architectures
Date: Sat,  3 Apr 2021 12:42:01 -0700
Message-Id: <20210403194201.369722-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

newer 32bit arches e.g. RV32 and ARC do not have __NR_io_getevents
syscall and have started of with 64bit time_t so there is no 32bit
version

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  2 +
 ...ck-if-syscall-exists-before-using-it.patch | 43 +++++++++++++++++++
 .../recipes-dbs/mysql/mariadb/sys_futex.patch | 22 ++++++++++
 3 files changed, 67 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-aio_linux-Check-if-syscall-exists-before-using-it.patch
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/sys_futex.patch

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 67cfa54f02..9833b28857 100644
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
index 0000000000..a2f7812c50
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
index 0000000000..3277a3eee1
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
2.31.1

