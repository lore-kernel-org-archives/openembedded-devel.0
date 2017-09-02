Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id A395572F2A
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  2 Sep 2017 19:02:13 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id r25so2020933pfk.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Sep 2017 12:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=CRjyM3R4fztFFXOvKBO2gjzChlJ6qvGj9yATdTS7aMM=;
	b=XXGvVR+RXADptSthdq9x5EOhK0gvdh+vMa7RoCTC2CVpV7liPVhuHCLcZZzWdszhjT
	r9kiFoE9v4gbSP7ZRLNdiVH/8zE0/M4DPGCDtqwfx5CTVQumC71+7SfB3Y/IOConLxEN
	qMwjp2pn9VD8k+WAfWFg3vGL2H2YKAssCS7PEHFuCY3nDPMaizcN2rEWdo5ln4Zqoz5F
	WRjSmArxoQdeMgOhdHohbLIlM/3cxIcug002YZTdILGqtllMdzcb784SQ2bhRAYQ4nEI
	k1lzBY6SrPEzLcE/I7RU0x4azTccgeDDH6vyzOidOA8Ja4zv/LIse3EBlTuZmNgCF4Bf
	Sa4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CRjyM3R4fztFFXOvKBO2gjzChlJ6qvGj9yATdTS7aMM=;
	b=iJnx2U2SeWxObgidyVF8YjsCWZgGW65QgHc9nvjKA7yaxcADYn08uigUblOtx0cX95
	qe0u1PgH86Xz3gmq1/a/N6oKQlYV9PEnXDQjP68zNn67m7RU2SllwjWGZkgk8bFkQGbf
	e82FEmqNR8X+CpS62uVVj1YHnHKsawhN9PjCGg6hH05rel5rjWLesvLOeFFzfUwl4Diw
	ntG5757FKiKMldIeMLwA8jvKZw1a7QFfTyH4WpwN69lfqe3AGROzC/dQqScbFpZAzbxM
	de9idlby7vt7dON7NHrxab+xpVYsKXPaPxF3dDKd5PFDF/AAwNYGa642O5T4LEVZ8py5
	HeyA==
X-Gm-Message-State: AHPjjUiOMXDDMGv6A5f3Wq/GReZOfJC/Pkd+VabG+eydiDtqOpqj82d+
	F91VD7WNVjxwVHKh
X-Google-Smtp-Source: ADKCNb4dv4fG37DBn1uNu0kbS54paMphw0Vn5SeTgS+IUfGzPPZsOeG5+ZXYZ3J7JrDX79JYUfSqpQ==
X-Received: by 10.99.176.12 with SMTP id h12mr6952557pgf.100.1504378934735;
	Sat, 02 Sep 2017 12:02:14 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::2e06])
	by smtp.gmail.com with ESMTPSA id
	n18sm4989232pgd.13.2017.09.02.12.02.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 Sep 2017 12:02:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  2 Sep 2017 12:02:04 -0700
Message-Id: <20170902190205.18257-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [meta-oe][PATCH 1/2] gperftools: Fix build with musl
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
X-List-Received-Date: Sat, 02 Sep 2017 19:02:13 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...heap-checkers-and-debug-allocator-on-musl.patch | 25 ++++++++++++++++++++++
 .../gperftools/disable_libunwind_aarch64.patch     | 23 ++++++++++++++++++++
 .../recipes-support/gperftools/gperftools_2.6.1.bb |  4 ++--
 3 files changed, 50 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/gperftools/gperftools/0001-disbale-heap-checkers-and-debug-allocator-on-musl.patch
 create mode 100644 meta-oe/recipes-support/gperftools/gperftools/disable_libunwind_aarch64.patch

diff --git a/meta-oe/recipes-support/gperftools/gperftools/0001-disbale-heap-checkers-and-debug-allocator-on-musl.patch b/meta-oe/recipes-support/gperftools/gperftools/0001-disbale-heap-checkers-and-debug-allocator-on-musl.patch
new file mode 100644
index 000000000..99127e11a
--- /dev/null
+++ b/meta-oe/recipes-support/gperftools/gperftools/0001-disbale-heap-checkers-and-debug-allocator-on-musl.patch
@@ -0,0 +1,25 @@
+From b5961f17e9d7f2bc44da611b3e4b27c8a641fc72 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 2 Sep 2017 08:07:17 -0700
+Subject: [PATCH] disbale heap checkers and debug allocator on musl
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ configure.ac | 2 ++
+ 1 file changed, 2 insertions(+)
+
+Index: git/configure.ac
+===================================================================
+--- git.orig/configure.ac
++++ git/configure.ac
+@@ -51,6 +51,8 @@ case "$host" in
+    *-cygwin*) default_enable_heap_checker=no; default_enable_cpu_profiler=no;;
+    *-freebsd*) default_enable_heap_checker=no;;
+    *-darwin*) default_enable_heap_checker=no;;
++   *-musl*) default_enable_heap_checker=no; default_enable_heap_profiler=no;
++            default_enable_debugalloc=no; default_enable_libunwind=no;
+ esac
+ 
+ # Currently only backtrace works on s390.
diff --git a/meta-oe/recipes-support/gperftools/gperftools/disable_libunwind_aarch64.patch b/meta-oe/recipes-support/gperftools/gperftools/disable_libunwind_aarch64.patch
new file mode 100644
index 000000000..f2647404b
--- /dev/null
+++ b/meta-oe/recipes-support/gperftools/gperftools/disable_libunwind_aarch64.patch
@@ -0,0 +1,23 @@
+Disable libunwind on aarch64
+
+Fixes hangs when using libtcmalloc.so
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: git/configure.ac
+===================================================================
+--- git.orig/configure.ac
++++ git/configure.ac
+@@ -69,6 +69,11 @@ AC_COMPILE_IFELSE([AC_LANG_PROGRAM(, [re
+                   [default_enable_libunwind=yes
+                    default_tcmalloc_pagesize=8])
+ 
++# Disable libunwind linking on aarch64 by default.
++AC_COMPILE_IFELSE([AC_LANG_PROGRAM(, [return __aarch64__])],
++                  [default_enable_libunwind=no],
++                  [default_enable_libunwind=yes])
++
+ AC_ARG_ENABLE([cpu-profiler],
+               [AS_HELP_STRING([--disable-cpu-profiler],
+                               [do not build the cpu profiler])],
diff --git a/meta-oe/recipes-support/gperftools/gperftools_2.6.1.bb b/meta-oe/recipes-support/gperftools/gperftools_2.6.1.bb
index ece9dd9e8..23284670b 100644
--- a/meta-oe/recipes-support/gperftools/gperftools_2.6.1.bb
+++ b/meta-oe/recipes-support/gperftools/gperftools_2.6.1.bb
@@ -10,6 +10,8 @@ SRC_URI = "git://github.com/gperftools/gperftools \
            file://0001-Use-ucontext_t-instead-of-struct-ucontext.patch \
            file://0001-fix-build-with-musl-libc.patch \
            file://0001-include-fcntl.h-for-loff_t-definition.patch \
+           file://0001-disbale-heap-checkers-and-debug-allocator-on-musl.patch \
+           file://disable_libunwind_aarch64.patch \
            "
 
 inherit autotools
@@ -20,8 +22,6 @@ S = "${WORKDIR}/git"
 #   do_page_fault(): sending SIGSEGV to ls for invalid read access from 00000008
 #   Segmentation fault (core dumped)
 COMPATIBLE_HOST = "(i.86|x86_64|powerpc|powerpc64|arm|aarch64).*-linux*"
-# On aarch64, add this option to avoid system hanging when using libtcmalloc.so.
-EXTRA_OECONF_aarch64 += "--disable-libunwind"
 # Disable thumb1
 # {standard input}: Assembler messages:
 # {standard input}:434: Error: lo register required -- `ldr pc,[sp]'
-- 
2.14.1


