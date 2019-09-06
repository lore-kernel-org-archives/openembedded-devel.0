Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5DF7E7CFEE
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Sep 2019 12:37:14 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id u16so6452927wrr.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Sep 2019 05:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RN76lJHyIkiz/toG/kKTpiPcy1V+9uWsT79G/EkMk1Q=;
	b=TrWNhupDkYf5Axiz5C4ddVfOU4UsamotB01VLA2dnr/4ewy+EwwhfGJARDvqB5J/BH
	Rq0pVcTy7biOVdOqtzGXBGeVnJW/AH3pInX91ts0FugtNL9i1NjTlBKPlR6yLF9ZYwcY
	mYh+uHxev3kP/dbHnFssmkKPq5mPDl2wTBKzH/+NvlsqKK1VGR4gW0UYYEiU2M33LLQX
	Kud2MEykfya+6xeNvYM+TT3heTHxjCkcPDYQ0hDkp7rEEzhSM7FaDEZN8WGDe243qcjU
	HNEHzLHGax9o/LXZUjDOd6AaFW7rzzmbvUSgr16f/2zt75Kp11Acs7gI222qW8vQP6WH
	sQIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=RN76lJHyIkiz/toG/kKTpiPcy1V+9uWsT79G/EkMk1Q=;
	b=D1G1XoCGJi0NybKGQu6WzCEbgAZUtu4wzSG6OXc6Xq13zHDJMpFboWlUZ3SMkmNs7R
	3Df6Vl+An4rj8M846pot5J9uTDoQ8j1kk6l/LgxJgaNFPaQb6I7c+6cgy+dYBOJqwqzF
	jIM6by/rpFipYLLxbbyBWdTBV+jUNc6x/T+EVChBTajvmqG3hf32hIEDFlbfQj9ivT0a
	b4CKsLNt38OFCuNwsMXWuZwnJbFy+ZkW7070y9R0cG9Xcciu3M49v8f8GxEFWOv7m0Nm
	pDn6/1lMQJJyVrwABgUuy/XGG9RAXg6Wkgf2jEheNZtBUo3k2UGgi707xEkbIXsyklqj
	/OhQ==
X-Gm-Message-State: APjAAAXueA7uIVSJbRQ7gmHfUQhYhxUxp1U/sXpr8oxZbn4oCPU4kLVo
	djt1K5tL807Wr26q6WYGs1j0QPyR
X-Google-Smtp-Source: APXvYqx8CMhn+3bXI49oHdjWkHs2BAh8Z7Msw7w/TpqaSML22wzjZeNmBPjeDIDBPWJM4Y8fUzRTsg==
X-Received: by 2002:a5d:43cc:: with SMTP id v12mr7472635wrr.75.1567773434620; 
	Fri, 06 Sep 2019 05:37:14 -0700 (PDT)
Received: from Unimatrix05-Bionic.lan
	([2001:b07:5d32:c012:7c5d:97d6:64f2:9ca6])
	by smtp.gmail.com with ESMTPSA id k6sm9958213wrg.0.2019.09.06.05.37.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Sep 2019 05:37:14 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Sep 2019 14:36:27 +0200
Message-Id: <20190906123627.17290-2-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190906123627.17290-1-costamagnagianfranco@yahoo.it>
References: <20190906123627.17290-1-costamagnagianfranco@yahoo.it>
Cc: Gianfranco Costamagna <locutusofborg@debian.org>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
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
X-List-Received-Date: Fri, 06 Sep 2019 12:37:14 -0000

Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 ...01-Define-gettid-only-for-glibc-2.30.patch | 128 +++++++++++++-----
 1 file changed, 95 insertions(+), 33 deletions(-)

diff --git a/meta-networking/recipes-devtools/grpc/grpc/0001-Define-gettid-only-for-glibc-2.30.patch b/meta-networking/recipes-devtools/grpc/grpc/0001-Define-gettid-only-for-glibc-2.30.patch
index 4f9b115ec..88b0af7f8 100644
--- a/meta-networking/recipes-devtools/grpc/grpc/0001-Define-gettid-only-for-glibc-2.30.patch
+++ b/meta-networking/recipes-devtools/grpc/grpc/0001-Define-gettid-only-for-glibc-2.30.patch
@@ -1,53 +1,115 @@
-From c27261a8bc1e45ff7d7a585c79b2b871d47217e4 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 26 Jul 2019 18:56:26 -0700
-Subject: [PATCH] Define gettid() only for glibc < 2.30
+Upstream-Status: Backport
 
-glibc 2.30 has added this API, so let us use that when possible
+From de6255941a5e1c2fb2d50e57f84e38c09f45023d Mon Sep 17 00:00:00 2001
+From: Juanli Shen <juanlishen@google.com>
+Date: Fri, 23 Aug 2019 08:46:09 -0700
+Subject: [PATCH] Fix gettid() naming conflict
 
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- src/core/lib/gpr/log_linux.cc          | 4 ++++
- src/core/lib/iomgr/ev_epollex_linux.cc | 7 +++++--
- 2 files changed, 9 insertions(+), 2 deletions(-)
+ src/core/lib/gpr/log_linux.cc | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
 
 diff --git a/src/core/lib/gpr/log_linux.cc b/src/core/lib/gpr/log_linux.cc
-index 561276f0c2..25a74864a1 100644
+index 561276f0c20..81026e5689b 100644
 --- a/src/core/lib/gpr/log_linux.cc
 +++ b/src/core/lib/gpr/log_linux.cc
-@@ -40,7 +40,11 @@
+@@ -40,7 +40,9 @@
  #include <time.h>
  #include <unistd.h>
  
-+#if defined(__GLIBC__) && (__GLIBC_MINOR__ >= 30)
-+#include <unistd.h>
-+#else
- static long gettid(void) { return syscall(__NR_gettid); }
-+#endif
+-static long gettid(void) { return syscall(__NR_gettid); }
++// Not naming it as gettid() to avoid duplicate declarations when complied with
++// GCC 9.1.
++static long local_gettid(void) { return syscall(__NR_gettid); }
  
  void gpr_log(const char* file, int line, gpr_log_severity severity,
               const char* format, ...) {
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
+
+glibc 2.30 will declare its own gettid; see https://sourceware.org/git/?p=glibc.git;a=commit;h=1d0fc213824eaa2a8f8c4385daaa698ee8fb7c92. Rename the grpc versions to avoid naming conflicts.
+---
+ src/core/lib/gpr/log_linux.cc          | 6 ++----
+ src/core/lib/gpr/log_posix.cc          | 4 ++--
+ src/core/lib/iomgr/ev_epollex_linux.cc | 4 ++--
+ 3 files changed, 6 insertions(+), 8 deletions(-)
+
+diff --git a/src/core/lib/gpr/log_linux.cc b/src/core/lib/gpr/log_linux.cc
+index 81026e5689b..8b597b4cf2f 100644
+--- a/src/core/lib/gpr/log_linux.cc
++++ b/src/core/lib/gpr/log_linux.cc
+@@ -40,9 +40,7 @@
+ #include <time.h>
+ #include <unistd.h>
+ 
+-// Not naming it as gettid() to avoid duplicate declarations when complied with
+-// GCC 9.1.
+-static long local_gettid(void) { return syscall(__NR_gettid); }
++static long sys_gettid(void) { return syscall(__NR_gettid); }
+ 
+ void gpr_log(const char* file, int line, gpr_log_severity severity,
+              const char* format, ...) {
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


