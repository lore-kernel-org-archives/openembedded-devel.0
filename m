Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id BEFC47F3B6
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Sep 2019 11:19:40 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id c10so6119078wmc.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Sep 2019 04:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cgnFZQ8+QjZgSKSpIKvLPkKzlrP30aX0r/GoECXdyEM=;
	b=k83/UXuKO5gYWFhWmrni1V331RTF90YZRFcgjK0RjAv0QWdzxoqElO0rrBzvsmZ8j6
	Idqii4G6dceglMMrTUsmWqCSnDcRMnEpTXuQZHFqzbJP8V2ZLHxFhexU7YHJ8gIsxsj4
	tR5XQKMcKmb+jx7eweZun61BgeCPsq8SYJt3BIF9p9wc7vSMLd6hdB4lRN7QDIdeQI1P
	Vpri4i1DDHg4NyZWHa4XsbQXlJfXIvpgEjrUalG8RmJ/AoK7lIXv8bMDYrxH7LfZ7jqT
	DM5v9WNxG3fgOmkJjA7EvYi4sd5arOtfshkTvXIPCnApzMGOoJSOZSze+SDL8241bhy5
	ZWvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=cgnFZQ8+QjZgSKSpIKvLPkKzlrP30aX0r/GoECXdyEM=;
	b=thwC1JRRd5XZmW+uIg+rQtWZyB6dNsiiDzeTOXVLlCzK7gEIxx3hYskMLq7u5JmBbO
	qK5S4YS5QtYce+xWBDEoIj+JQWEZda6/3vTzcQ3i082TNcFUYHDAXumaYrJQiYRX9F1u
	72zxvF//pE3C3/Yt8xZRmdySIRt0FkovyBrndHxP0x4/0o4PxJ9f+KU4R/BK/ZdLgBmp
	LQ97vljD8bwUga78vQdzxMqST/P1lBhMcrY4OTP7CIePOTx9oVm2yoi8fl/uNjCZC28m
	+X/yBsObRdtOn2uKgEjr53C1OYO1eAX8ifS+BXNt/R5vraPiXUV/zke3vVY5TkjFjsJ2
	I19Q==
X-Gm-Message-State: APjAAAXVw0vJY1hPSvcCm7yAHcc4+l0Rudi+0LLC7LpRC8DbFNhtZkox
	ylNMCWQSiJCIKkPaH7guLT5IhFss
X-Google-Smtp-Source: APXvYqy2qYMG9q6l8HidrsufE/GWjRQyeCJxn9Yvd3PMNLo1386YRiktVATbBbbgPIeYg0mqy/ENrQ==
X-Received: by 2002:a1c:ef09:: with SMTP id n9mr6429098wmh.23.1567768781078;
	Fri, 06 Sep 2019 04:19:41 -0700 (PDT)
Received: from Unimatrix05-Bionic.lan
	([2001:b07:5d32:c012:7c5d:97d6:64f2:9ca6])
	by smtp.gmail.com with ESMTPSA id k9sm10148223wrd.7.2019.09.06.04.19.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Sep 2019 04:19:40 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Sep 2019 13:19:03 +0200
Message-Id: <20190906111903.16142-2-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190906111903.16142-1-costamagnagianfranco@yahoo.it>
References: <20190906111903.16142-1-costamagnagianfranco@yahoo.it>
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH 2/2] grpc: Change gettid patch with the upstream merged version
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Sep 2019 11:19:41 -0000

---
 ...01-Define-gettid-only-for-glibc-2.30.patch | 126 +++++++++++++-----
 1 file changed, 93 insertions(+), 33 deletions(-)

diff --git a/meta-networking/recipes-devtools/grpc/grpc/0001-Define-gettid-only-for-glibc-2.30.patch b/meta-networking/recipes-devtools/grpc/grpc/0001-Define-gettid-only-for-glibc-2.30.patch
index 4f9b115ec..9cb38f787 100644
--- a/meta-networking/recipes-devtools/grpc/grpc/0001-Define-gettid-only-for-glibc-2.30.patch
+++ b/meta-networking/recipes-devtools/grpc/grpc/0001-Define-gettid-only-for-glibc-2.30.patch
@@ -1,53 +1,113 @@
-From c27261a8bc1e45ff7d7a585c79b2b871d47217e4 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 26 Jul 2019 18:56:26 -0700
-Subject: [PATCH] Define gettid() only for glibc < 2.30
+From de6255941a5e1c2fb2d50e57f84e38c09f45023d Mon Sep 17 00:00:00 2001
+From: Juanli Shen <juanlishen@google.com>
+Date: Fri, 23 Aug 2019 08:46:09 -0700
+Subject: [PATCH] Fix gettid() naming conflict
 
-glibc 2.30 has added this API, so let us use that when possible
+---
+ src/core/lib/gpr/log_linux.cc | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/core/lib/gpr/log_linux.cc b/src/core/lib/gpr/log_linux.cc
+index 561276f0c20..81026e5689b 100644
+--- a/src/core/lib/gpr/log_linux.cc
++++ b/src/core/lib/gpr/log_linux.cc
+@@ -40,7 +40,9 @@
+ #include <time.h>
+ #include <unistd.h>
+ 
+-static long gettid(void) { return syscall(__NR_gettid); }
++// Not naming it as gettid() to avoid duplicate declarations when complied with
++// GCC 9.1.
++static long local_gettid(void) { return syscall(__NR_gettid); }
+ 
+ void gpr_log(const char* file, int line, gpr_log_severity severity,
+              const char* format, ...) {
+@@ -70,7 +72,7 @@ void gpr_default_log(gpr_log_func_args* args) {
+   gpr_timespec now = gpr_now(GPR_CLOCK_REALTIME);
+   struct tm tm;
+   static __thread long tid = 0;
+-  if (tid == 0) tid = gettid();
++  if (tid == 0) tid = local_gettid();
+ 
+   timer = static_cast<time_t>(now.tv_sec);
+   final_slash = strrchr(args->file, '/');
+From 57586a1ca7f17b1916aed3dea4ff8de872dbf853 Mon Sep 17 00:00:00 2001
+From: Benjamin Peterson <benjamin@dropbox.com>
+Date: Fri, 3 May 2019 08:11:00 -0700
+Subject: [PATCH] Rename gettid() functions.
 
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
+glibc 2.30 will declare its own gettid; see https://sourceware.org/git/?p=glibc.git;a=commit;h=1d0fc213824eaa2a8f8c4385daaa698ee8fb7c92. Rename the grpc versions to avoid naming conflicts.
 ---
- src/core/lib/gpr/log_linux.cc          | 4 ++++
- src/core/lib/iomgr/ev_epollex_linux.cc | 7 +++++--
- 2 files changed, 9 insertions(+), 2 deletions(-)
+ src/core/lib/gpr/log_linux.cc          | 6 ++----
+ src/core/lib/gpr/log_posix.cc          | 4 ++--
+ src/core/lib/iomgr/ev_epollex_linux.cc | 4 ++--
+ 3 files changed, 6 insertions(+), 8 deletions(-)
 
 diff --git a/src/core/lib/gpr/log_linux.cc b/src/core/lib/gpr/log_linux.cc
-index 561276f0c2..25a74864a1 100644
+index 81026e5689b..8b597b4cf2f 100644
 --- a/src/core/lib/gpr/log_linux.cc
 +++ b/src/core/lib/gpr/log_linux.cc
-@@ -40,7 +40,11 @@
+@@ -40,9 +40,7 @@
  #include <time.h>
  #include <unistd.h>
  
-+#if defined(__GLIBC__) && (__GLIBC_MINOR__ >= 30)
-+#include <unistd.h>
-+#else
- static long gettid(void) { return syscall(__NR_gettid); }
-+#endif
+-// Not naming it as gettid() to avoid duplicate declarations when complied with
+-// GCC 9.1.
+-static long local_gettid(void) { return syscall(__NR_gettid); }
++static long sys_gettid(void) { return syscall(__NR_gettid); }
  
  void gpr_log(const char* file, int line, gpr_log_severity severity,
               const char* format, ...) {
+@@ -72,7 +70,7 @@ void gpr_default_log(gpr_log_func_args* args) {
+   gpr_timespec now = gpr_now(GPR_CLOCK_REALTIME);
+   struct tm tm;
+   static __thread long tid = 0;
+-  if (tid == 0) tid = local_gettid();
++  if (tid == 0) tid = sys_gettid();
+ 
+   timer = static_cast<time_t>(now.tv_sec);
+   final_slash = strrchr(args->file, '/');
+diff --git a/src/core/lib/gpr/log_posix.cc b/src/core/lib/gpr/log_posix.cc
+index b6edc14ab6b..2f7c6ce3760 100644
+--- a/src/core/lib/gpr/log_posix.cc
++++ b/src/core/lib/gpr/log_posix.cc
+@@ -31,7 +31,7 @@
+ #include <string.h>
+ #include <time.h>
+ 
+-static intptr_t gettid(void) { return (intptr_t)pthread_self(); }
++static intptr_t sys_gettid(void) { return (intptr_t)pthread_self(); }
+ 
+ void gpr_log(const char* file, int line, gpr_log_severity severity,
+              const char* format, ...) {
+@@ -86,7 +86,7 @@ void gpr_default_log(gpr_log_func_args* args) {
+   char* prefix;
+   gpr_asprintf(&prefix, "%s%s.%09d %7" PRIdPTR " %s:%d]",
+                gpr_log_severity_string(args->severity), time_buffer,
+-               (int)(now.tv_nsec), gettid(), display_file, args->line);
++               (int)(now.tv_nsec), sys_gettid(), display_file, args->line);
+ 
+   fprintf(stderr, "%-70s %s\n", prefix, args->message);
+   gpr_free(prefix);
 diff --git a/src/core/lib/iomgr/ev_epollex_linux.cc b/src/core/lib/iomgr/ev_epollex_linux.cc
-index 08116b3ab5..d3d3025111 100644
+index c2d80c08ddb..4a83cb6c215 100644
 --- a/src/core/lib/iomgr/ev_epollex_linux.cc
 +++ b/src/core/lib/iomgr/ev_epollex_linux.cc
-@@ -1101,10 +1101,13 @@ static void end_worker(grpc_pollset* pollset, grpc_pollset_worker* worker,
-   gpr_atm_no_barrier_fetch_add(&pollset->worker_count, -1);
+@@ -1077,7 +1077,7 @@ static void end_worker(grpc_pollset* pollset, grpc_pollset_worker* worker,
  }
  
--#ifndef NDEBUG
-+#if !defined(DEBUG)
-+#if defined(__GLIBC__) && (__GLIBC_MINOR__ >= 30)
-+#include <unistd.h>
-+#else
- static long gettid(void) { return syscall(__NR_gettid); }
+ #ifndef NDEBUG
+-static long gettid(void) { return syscall(__NR_gettid); }
++static long sys_gettid(void) { return syscall(__NR_gettid); }
  #endif
--
-+#endif
+ 
  /* pollset->mu lock must be held by the caller before calling this.
-    The function pollset_work() may temporarily release the lock (pollset->po.mu)
-    during the course of its execution but it will always re-acquire the lock and
--- 
-2.22.0
-
+@@ -1097,7 +1097,7 @@ static grpc_error* pollset_work(grpc_pollset* pollset,
+ #define WORKER_PTR (&worker)
+ #endif
+ #ifndef NDEBUG
+-  WORKER_PTR->originator = gettid();
++  WORKER_PTR->originator = sys_gettid();
+ #endif
+   if (GRPC_TRACE_FLAG_ENABLED(grpc_polling_trace)) {
+     gpr_log(GPR_INFO,
-- 
2.17.1


