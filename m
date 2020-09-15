Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.7551.1600204865828791765
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2020 14:21:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jOrBtGX7;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id bh1so2010808plb.12
        for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2020 14:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xetiRy0//UfTPBz8sYkmRAIx/WPyHbUevt2L118l3k8=;
        b=jOrBtGX7f9OlgGSRYoPVOgJrJwnif3bwQBGtkeaVUF0kMaE1ajHQelWtRZSCTT3bxM
         zXrh3AhnJ/dXGjLaziLEEmfXfhEyP1euLRlBhRCgvmVB/9ZMGJXiMFHEBP8MxOOX0uox
         LOAhSlQ6h39YKeHfcKyJOSywuGNbYKUfVpXRNdJXSVLpRmhCS/cwlKZ+jw/sGQP4nPzu
         MU9u7TgatF1rgbPmJI6O8SIrf1l9Tt0Lgs111Ylxbv42cll4ds/8IgAEo6pq5eIiX+j9
         9gTQ+ia4O1KDa4iw1h6wMlUkfvjI3kBsuOi3SL3uF/QvlUM5zR1ovyM1vLspGi8mWH4Z
         6x2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xetiRy0//UfTPBz8sYkmRAIx/WPyHbUevt2L118l3k8=;
        b=KUQ+PdffJa39Q9hW5I6CBi08Agjj2g0y5V4DcTaB4zoySqxfRObsbZk1oPyMT0VPeZ
         yLKRuMJRJ71DHaoQPFAGnEV1emxcaNpcmwCHTljOJj9bxqxJ3mjcC5g2cwvSY3U7BLSm
         zGQLLLgJvnKovtsxIP3Io11Zduh21u8uyuAIkLalh3Xu2xbGajkf2EuIHCvX5wMvSnkG
         3QtmvodPMaT+jYGQeaR0r5N+nsxbfyGGToonXfH1TXCGWqbyOA1RgksRSbETjxIKLZxp
         +7E+XONEHV/zgpRBs7FTfkGtUFi5CppOYFKflBI05PWqLoSBgtx/0bwY/YJqgspO61Xq
         1kXQ==
X-Gm-Message-State: AOAM5326xG/jDkI+sIen2TDyhW938JtvXNMqfOUpMOsAq2yXeoAEBi+W
	zWXuedR5/Vtm6nTKdo9V6wdpD6RrKefahw==
X-Google-Smtp-Source: ABdhPJynsY6U35gYhF3md4rP6ZteQlevE9L/awOnJRrYuHBUvY9Ug+Kj6TFxA9rqqbz83RAXtzrLXA==
X-Received: by 2002:a17:90a:e093:: with SMTP id q19mr1112887pjy.98.1600204864463;
        Tue, 15 Sep 2020 14:21:04 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1759])
        by smtp.gmail.com with ESMTPSA id m13sm13440710pfk.103.2020.09.15.14.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 14:21:04 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] mongodb: Fix libunwind build with -fno-common
Date: Tue, 15 Sep 2020 14:21:01 -0700
Message-Id: <20200915212101.583424-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200915212101.583424-1-raj.khem@gmail.com>
References: <20200915212101.583424-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Backport a patch for libunwind to fix build with gcc10
Fixes
unwind/dist/src/x86_64/Ginit.c:52: multiple definition of `_U_dyn_info_list'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0001-Fix-compilation-with-fno-common.patch | 448 ++++++++++++++++++
 .../recipes-dbs/mongodb/mongodb_git.bb        |   1 +
 2 files changed, 449 insertions(+)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Fix-compilation-with-fno-common.patch

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Fix-compilation-with-fno-common.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Fix-compilation-with-fno-common.patch
new file mode 100644
index 0000000000..f5c2cf2179
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Fix-compilation-with-fno-common.patch
@@ -0,0 +1,448 @@
+From 3690dc5f567906c45f057509305fbaa021b33adb Mon Sep 17 00:00:00 2001
+From: Yichao Yu <yyc1992@gmail.com>
+Date: Tue, 15 Sep 2020 12:35:46 -0700
+Subject: [PATCH] Fix compilation with -fno-common.
+
+Making all other archs consistent with IA64 which should not have this problem.
+Also move the FIXME to the correct place.
+
+Also add some minimum comments about this...
+
+Upstream-Status: Backport [https://github.com/libunwind/libunwind/pull/166/commits/29e17d8d2ccbca07c423e3089a6d5ae8a1c9cb6e]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/third_party/unwind/dist/src/aarch64/Ginit.c   | 15 +++++++--------
+ src/third_party/unwind/dist/src/arm/Ginit.c       | 15 +++++++--------
+ .../src/coredump/_UPT_get_dyn_info_list_addr.c    |  5 +++++
+ src/third_party/unwind/dist/src/hppa/Ginit.c      | 15 +++++++--------
+ src/third_party/unwind/dist/src/ia64/Ginit.c      |  1 +
+ .../unwind/dist/src/mi/Gfind_dynamic_proc_info.c  |  1 +
+ src/third_party/unwind/dist/src/mips/Ginit.c      | 15 +++++++--------
+ src/third_party/unwind/dist/src/ppc32/Ginit.c     | 11 +++++++----
+ src/third_party/unwind/dist/src/ppc64/Ginit.c     | 11 +++++++----
+ .../dist/src/ptrace/_UPT_get_dyn_info_list_addr.c |  5 +++++
+ src/third_party/unwind/dist/src/s390x/Ginit.c     | 15 +++++++--------
+ src/third_party/unwind/dist/src/sh/Ginit.c        | 15 +++++++--------
+ src/third_party/unwind/dist/src/tilegx/Ginit.c    | 15 +++++++--------
+ src/third_party/unwind/dist/src/x86/Ginit.c       | 15 +++++++--------
+ src/third_party/unwind/dist/src/x86_64/Ginit.c    | 15 +++++++--------
+ 15 files changed, 89 insertions(+), 80 deletions(-)
+
+diff --git a/src/third_party/unwind/dist/src/aarch64/Ginit.c b/src/third_party/unwind/dist/src/aarch64/Ginit.c
+index dec235c829..35389762f2 100644
+--- a/src/third_party/unwind/dist/src/aarch64/Ginit.c
++++ b/src/third_party/unwind/dist/src/aarch64/Ginit.c
+@@ -61,13 +61,6 @@ tdep_uc_addr (unw_tdep_context_t *uc, int reg)
+ 
+ # endif /* UNW_LOCAL_ONLY */
+ 
+-HIDDEN unw_dyn_info_list_t _U_dyn_info_list;
+-
+-/* XXX fix me: there is currently no way to locate the dyn-info list
+-       by a remote unwinder.  On ia64, this is done via a special
+-       unwind-table entry.  Perhaps something similar can be done with
+-       DWARF2 unwind info.  */
+-
+ static void
+ put_unwind_info (unw_addr_space_t as, unw_proc_info_t *proc_info, void *arg)
+ {
+@@ -78,7 +71,13 @@ static int
+ get_dyn_info_list_addr (unw_addr_space_t as, unw_word_t *dyn_info_list_addr,
+                         void *arg)
+ {
+-  *dyn_info_list_addr = (unw_word_t) &_U_dyn_info_list;
++#ifndef UNW_LOCAL_ONLY
++# pragma weak _U_dyn_info_list_addr
++  if (!_U_dyn_info_list_addr)
++    return -UNW_ENOINFO;
++#endif
++  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libunwind.so.
++  *dyn_info_list_addr = _U_dyn_info_list_addr ();
+   return 0;
+ }
+ 
+diff --git a/src/third_party/unwind/dist/src/arm/Ginit.c b/src/third_party/unwind/dist/src/arm/Ginit.c
+index 2720d063a2..0bac0d72da 100644
+--- a/src/third_party/unwind/dist/src/arm/Ginit.c
++++ b/src/third_party/unwind/dist/src/arm/Ginit.c
+@@ -57,18 +57,17 @@ tdep_uc_addr (unw_tdep_context_t *uc, int reg)
+ 
+ # endif /* UNW_LOCAL_ONLY */
+ 
+-HIDDEN unw_dyn_info_list_t _U_dyn_info_list;
+-
+-/* XXX fix me: there is currently no way to locate the dyn-info list
+-       by a remote unwinder.  On ia64, this is done via a special
+-       unwind-table entry.  Perhaps something similar can be done with
+-       DWARF2 unwind info.  */
+-
+ static int
+ get_dyn_info_list_addr (unw_addr_space_t as, unw_word_t *dyn_info_list_addr,
+                         void *arg)
+ {
+-  *dyn_info_list_addr = (unw_word_t) &_U_dyn_info_list;
++#ifndef UNW_LOCAL_ONLY
++# pragma weak _U_dyn_info_list_addr
++  if (!_U_dyn_info_list_addr)
++    return -UNW_ENOINFO;
++#endif
++  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libunwind.so.
++  *dyn_info_list_addr = _U_dyn_info_list_addr ();
+   return 0;
+ }
+ 
+diff --git a/src/third_party/unwind/dist/src/coredump/_UPT_get_dyn_info_list_addr.c b/src/third_party/unwind/dist/src/coredump/_UPT_get_dyn_info_list_addr.c
+index 0d11905566..739ed0569b 100644
+--- a/src/third_party/unwind/dist/src/coredump/_UPT_get_dyn_info_list_addr.c
++++ b/src/third_party/unwind/dist/src/coredump/_UPT_get_dyn_info_list_addr.c
+@@ -74,6 +74,11 @@ get_list_addr (unw_addr_space_t as, unw_word_t *dil_addr, void *arg,
+ 
+ #else
+ 
++/* XXX fix me: there is currently no way to locate the dyn-info list
++       by a remote unwinder.  On ia64, this is done via a special
++       unwind-table entry.  Perhaps something similar can be done with
++       DWARF2 unwind info.  */
++
+ static inline int
+ get_list_addr (unw_addr_space_t as, unw_word_t *dil_addr, void *arg,
+                int *countp)
+diff --git a/src/third_party/unwind/dist/src/hppa/Ginit.c b/src/third_party/unwind/dist/src/hppa/Ginit.c
+index 461e4b93da..265455a68c 100644
+--- a/src/third_party/unwind/dist/src/hppa/Ginit.c
++++ b/src/third_party/unwind/dist/src/hppa/Ginit.c
+@@ -64,13 +64,6 @@ _Uhppa_uc_addr (ucontext_t *uc, int reg)
+ 
+ # endif /* UNW_LOCAL_ONLY */
+ 
+-HIDDEN unw_dyn_info_list_t _U_dyn_info_list;
+-
+-/* XXX fix me: there is currently no way to locate the dyn-info list
+-       by a remote unwinder.  On ia64, this is done via a special
+-       unwind-table entry.  Perhaps something similar can be done with
+-       DWARF2 unwind info.  */
+-
+ static void
+ put_unwind_info (unw_addr_space_t as, unw_proc_info_t *proc_info, void *arg)
+ {
+@@ -81,7 +74,13 @@ static int
+ get_dyn_info_list_addr (unw_addr_space_t as, unw_word_t *dyn_info_list_addr,
+                         void *arg)
+ {
+-  *dyn_info_list_addr = (unw_word_t) &_U_dyn_info_list;
++#ifndef UNW_LOCAL_ONLY
++# pragma weak _U_dyn_info_list_addr
++  if (!_U_dyn_info_list_addr)
++    return -UNW_ENOINFO;
++#endif
++  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libunwind.so.
++  *dyn_info_list_addr = _U_dyn_info_list_addr ();
+   return 0;
+ }
+ 
+diff --git a/src/third_party/unwind/dist/src/ia64/Ginit.c b/src/third_party/unwind/dist/src/ia64/Ginit.c
+index b09a2ad57c..8601bb3ca8 100644
+--- a/src/third_party/unwind/dist/src/ia64/Ginit.c
++++ b/src/third_party/unwind/dist/src/ia64/Ginit.c
+@@ -68,6 +68,7 @@ get_dyn_info_list_addr (unw_addr_space_t as, unw_word_t *dyn_info_list_addr,
+   if (!_U_dyn_info_list_addr)
+     return -UNW_ENOINFO;
+ #endif
++  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libunwind.so.
+   *dyn_info_list_addr = _U_dyn_info_list_addr ();
+   return 0;
+ }
+diff --git a/src/third_party/unwind/dist/src/mi/Gfind_dynamic_proc_info.c b/src/third_party/unwind/dist/src/mi/Gfind_dynamic_proc_info.c
+index 98d3501286..2e7c62e5e8 100644
+--- a/src/third_party/unwind/dist/src/mi/Gfind_dynamic_proc_info.c
++++ b/src/third_party/unwind/dist/src/mi/Gfind_dynamic_proc_info.c
+@@ -49,6 +49,7 @@ local_find_proc_info (unw_addr_space_t as, unw_word_t ip, unw_proc_info_t *pi,
+     return -UNW_ENOINFO;
+ #endif
+ 
++  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libunwind.so.
+   list = (unw_dyn_info_list_t *) (uintptr_t) _U_dyn_info_list_addr ();
+   for (di = list->first; di; di = di->next)
+     if (ip >= di->start_ip && ip < di->end_ip)
+diff --git a/src/third_party/unwind/dist/src/mips/Ginit.c b/src/third_party/unwind/dist/src/mips/Ginit.c
+index 3df170c754..bf7a8f5a8f 100644
+--- a/src/third_party/unwind/dist/src/mips/Ginit.c
++++ b/src/third_party/unwind/dist/src/mips/Ginit.c
+@@ -69,13 +69,6 @@ tdep_uc_addr (ucontext_t *uc, int reg)
+ 
+ # endif /* UNW_LOCAL_ONLY */
+ 
+-HIDDEN unw_dyn_info_list_t _U_dyn_info_list;
+-
+-/* XXX fix me: there is currently no way to locate the dyn-info list
+-       by a remote unwinder.  On ia64, this is done via a special
+-       unwind-table entry.  Perhaps something similar can be done with
+-       DWARF2 unwind info.  */
+-
+ static void
+ put_unwind_info (unw_addr_space_t as, unw_proc_info_t *proc_info, void *arg)
+ {
+@@ -86,7 +79,13 @@ static int
+ get_dyn_info_list_addr (unw_addr_space_t as, unw_word_t *dyn_info_list_addr,
+                         void *arg)
+ {
+-  *dyn_info_list_addr = (unw_word_t) (intptr_t) &_U_dyn_info_list;
++#ifndef UNW_LOCAL_ONLY
++# pragma weak _U_dyn_info_list_addr
++  if (!_U_dyn_info_list_addr)
++    return -UNW_ENOINFO;
++#endif
++  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libunwind.so.
++  *dyn_info_list_addr = _U_dyn_info_list_addr ();
+   return 0;
+ }
+ 
+diff --git a/src/third_party/unwind/dist/src/ppc32/Ginit.c b/src/third_party/unwind/dist/src/ppc32/Ginit.c
+index ba302448a3..7b45455807 100644
+--- a/src/third_party/unwind/dist/src/ppc32/Ginit.c
++++ b/src/third_party/unwind/dist/src/ppc32/Ginit.c
+@@ -91,9 +91,6 @@ tdep_uc_addr (ucontext_t *uc, int reg)
+ 
+ # endif /* UNW_LOCAL_ONLY */
+ 
+-HIDDEN unw_dyn_info_list_t _U_dyn_info_list;
+-
+-
+ static void
+ put_unwind_info (unw_addr_space_t as, unw_proc_info_t *proc_info, void *arg)
+ {
+@@ -104,7 +101,13 @@ static int
+ get_dyn_info_list_addr (unw_addr_space_t as, unw_word_t *dyn_info_list_addr,
+                         void *arg)
+ {
+-  *dyn_info_list_addr = (unw_word_t) &_U_dyn_info_list;
++#ifndef UNW_LOCAL_ONLY
++# pragma weak _U_dyn_info_list_addr
++  if (!_U_dyn_info_list_addr)
++    return -UNW_ENOINFO;
++#endif
++  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libunwind.so.
++  *dyn_info_list_addr = _U_dyn_info_list_addr ();
+   return 0;
+ }
+ 
+diff --git a/src/third_party/unwind/dist/src/ppc64/Ginit.c b/src/third_party/unwind/dist/src/ppc64/Ginit.c
+index 4c88cd6e77..7bfb395a79 100644
+--- a/src/third_party/unwind/dist/src/ppc64/Ginit.c
++++ b/src/third_party/unwind/dist/src/ppc64/Ginit.c
+@@ -95,9 +95,6 @@ tdep_uc_addr (ucontext_t *uc, int reg)
+ 
+ # endif /* UNW_LOCAL_ONLY */
+ 
+-HIDDEN unw_dyn_info_list_t _U_dyn_info_list;
+-
+-
+ static void
+ put_unwind_info (unw_addr_space_t as, unw_proc_info_t *proc_info, void *arg)
+ {
+@@ -108,7 +105,13 @@ static int
+ get_dyn_info_list_addr (unw_addr_space_t as, unw_word_t *dyn_info_list_addr,
+                         void *arg)
+ {
+-  *dyn_info_list_addr = (unw_word_t) &_U_dyn_info_list;
++#ifndef UNW_LOCAL_ONLY
++# pragma weak _U_dyn_info_list_addr
++  if (!_U_dyn_info_list_addr)
++    return -UNW_ENOINFO;
++#endif
++  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libunwind.so.
++  *dyn_info_list_addr = _U_dyn_info_list_addr ();
+   return 0;
+ }
+ 
+diff --git a/src/third_party/unwind/dist/src/ptrace/_UPT_get_dyn_info_list_addr.c b/src/third_party/unwind/dist/src/ptrace/_UPT_get_dyn_info_list_addr.c
+index cc5ed04418..16671d453e 100644
+--- a/src/third_party/unwind/dist/src/ptrace/_UPT_get_dyn_info_list_addr.c
++++ b/src/third_party/unwind/dist/src/ptrace/_UPT_get_dyn_info_list_addr.c
+@@ -71,6 +71,11 @@ get_list_addr (unw_addr_space_t as, unw_word_t *dil_addr, void *arg,
+ 
+ #else
+ 
++/* XXX fix me: there is currently no way to locate the dyn-info list
++       by a remote unwinder.  On ia64, this is done via a special
++       unwind-table entry.  Perhaps something similar can be done with
++       DWARF2 unwind info.  */
++
+ static inline int
+ get_list_addr (unw_addr_space_t as, unw_word_t *dil_addr, void *arg,
+                int *countp)
+diff --git a/src/third_party/unwind/dist/src/s390x/Ginit.c b/src/third_party/unwind/dist/src/s390x/Ginit.c
+index f0886ac933..db01743c06 100644
+--- a/src/third_party/unwind/dist/src/s390x/Ginit.c
++++ b/src/third_party/unwind/dist/src/s390x/Ginit.c
+@@ -50,8 +50,6 @@ static struct unw_addr_space local_addr_space;
+ 
+ unw_addr_space_t unw_local_addr_space = &local_addr_space;
+ 
+-HIDDEN unw_dyn_info_list_t _U_dyn_info_list;
+-
+ static inline void *
+ uc_addr (ucontext_t *uc, int reg)
+ {
+@@ -75,11 +73,6 @@ tdep_uc_addr (ucontext_t *uc, int reg)
+ 
+ # endif /* UNW_LOCAL_ONLY */
+ 
+-/* XXX fix me: there is currently no way to locate the dyn-info list
+-       by a remote unwinder.  On ia64, this is done via a special
+-       unwind-table entry.  Perhaps something similar can be done with
+-       DWARF2 unwind info.  */
+-
+ static void
+ put_unwind_info (unw_addr_space_t as, unw_proc_info_t *proc_info, void *arg)
+ {
+@@ -90,7 +83,13 @@ static int
+ get_dyn_info_list_addr (unw_addr_space_t as, unw_word_t *dyn_info_list_addr,
+                         void *arg)
+ {
+-  *dyn_info_list_addr = (unw_word_t) &_U_dyn_info_list;
++#ifndef UNW_LOCAL_ONLY
++# pragma weak _U_dyn_info_list_addr
++  if (!_U_dyn_info_list_addr)
++    return -UNW_ENOINFO;
++#endif
++  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libunwind.so.
++  *dyn_info_list_addr = _U_dyn_info_list_addr ();
+   return 0;
+ }
+ 
+diff --git a/src/third_party/unwind/dist/src/sh/Ginit.c b/src/third_party/unwind/dist/src/sh/Ginit.c
+index 52988a721e..9fe96d2bd4 100644
+--- a/src/third_party/unwind/dist/src/sh/Ginit.c
++++ b/src/third_party/unwind/dist/src/sh/Ginit.c
+@@ -58,13 +58,6 @@ tdep_uc_addr (ucontext_t *uc, int reg)
+ 
+ # endif /* UNW_LOCAL_ONLY */
+ 
+-HIDDEN unw_dyn_info_list_t _U_dyn_info_list;
+-
+-/* XXX fix me: there is currently no way to locate the dyn-info list
+-       by a remote unwinder.  On ia64, this is done via a special
+-       unwind-table entry.  Perhaps something similar can be done with
+-       DWARF2 unwind info.  */
+-
+ static void
+ put_unwind_info (unw_addr_space_t as, unw_proc_info_t *proc_info, void *arg)
+ {
+@@ -75,7 +68,13 @@ static int
+ get_dyn_info_list_addr (unw_addr_space_t as, unw_word_t *dyn_info_list_addr,
+                         void *arg)
+ {
+-  *dyn_info_list_addr = (unw_word_t) &_U_dyn_info_list;
++#ifndef UNW_LOCAL_ONLY
++# pragma weak _U_dyn_info_list_addr
++  if (!_U_dyn_info_list_addr)
++    return -UNW_ENOINFO;
++#endif
++  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libunwind.so.
++  *dyn_info_list_addr = _U_dyn_info_list_addr ();
+   return 0;
+ }
+ 
+diff --git a/src/third_party/unwind/dist/src/tilegx/Ginit.c b/src/third_party/unwind/dist/src/tilegx/Ginit.c
+index 7564a558be..925e641324 100644
+--- a/src/third_party/unwind/dist/src/tilegx/Ginit.c
++++ b/src/third_party/unwind/dist/src/tilegx/Ginit.c
+@@ -64,13 +64,6 @@ tdep_uc_addr (ucontext_t *uc, int reg)
+ 
+ # endif /* UNW_LOCAL_ONLY */
+ 
+-HIDDEN unw_dyn_info_list_t _U_dyn_info_list;
+-
+-/* XXX fix me: there is currently no way to locate the dyn-info list
+-       by a remote unwinder.  On ia64, this is done via a special
+-       unwind-table entry.  Perhaps something similar can be done with
+-       DWARF2 unwind info.  */
+-
+ static void
+ put_unwind_info (unw_addr_space_t as, unw_proc_info_t *proc_info, void *arg)
+ {
+@@ -81,7 +74,13 @@ static int
+ get_dyn_info_list_addr (unw_addr_space_t as, unw_word_t *dyn_info_list_addr,
+                         void *arg)
+ {
+-  *dyn_info_list_addr = (unw_word_t) (intptr_t) &_U_dyn_info_list;
++#ifndef UNW_LOCAL_ONLY
++# pragma weak _U_dyn_info_list_addr
++  if (!_U_dyn_info_list_addr)
++    return -UNW_ENOINFO;
++#endif
++  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libunwind.so.
++  *dyn_info_list_addr = _U_dyn_info_list_addr ();
+   return 0;
+ }
+ 
+diff --git a/src/third_party/unwind/dist/src/x86/Ginit.c b/src/third_party/unwind/dist/src/x86/Ginit.c
+index f6b8dc27d4..3cec74a216 100644
+--- a/src/third_party/unwind/dist/src/x86/Ginit.c
++++ b/src/third_party/unwind/dist/src/x86/Ginit.c
+@@ -54,13 +54,6 @@ tdep_uc_addr (ucontext_t *uc, int reg)
+ 
+ # endif /* UNW_LOCAL_ONLY */
+ 
+-HIDDEN unw_dyn_info_list_t _U_dyn_info_list;
+-
+-/* XXX fix me: there is currently no way to locate the dyn-info list
+-       by a remote unwinder.  On ia64, this is done via a special
+-       unwind-table entry.  Perhaps something similar can be done with
+-       DWARF2 unwind info.  */
+-
+ static void
+ put_unwind_info (unw_addr_space_t as, unw_proc_info_t *proc_info, void *arg)
+ {
+@@ -71,7 +64,13 @@ static int
+ get_dyn_info_list_addr (unw_addr_space_t as, unw_word_t *dyn_info_list_addr,
+                         void *arg)
+ {
+-  *dyn_info_list_addr = (unw_word_t) &_U_dyn_info_list;
++#ifndef UNW_LOCAL_ONLY
++# pragma weak _U_dyn_info_list_addr
++  if (!_U_dyn_info_list_addr)
++    return -UNW_ENOINFO;
++#endif
++  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libunwind.so.
++  *dyn_info_list_addr = _U_dyn_info_list_addr ();
+   return 0;
+ }
+ 
+diff --git a/src/third_party/unwind/dist/src/x86_64/Ginit.c b/src/third_party/unwind/dist/src/x86_64/Ginit.c
+index 6161da6401..5c4e4269a6 100644
+--- a/src/third_party/unwind/dist/src/x86_64/Ginit.c
++++ b/src/third_party/unwind/dist/src/x86_64/Ginit.c
+@@ -49,13 +49,6 @@ static struct unw_addr_space local_addr_space;
+ 
+ unw_addr_space_t unw_local_addr_space = &local_addr_space;
+ 
+-HIDDEN unw_dyn_info_list_t _U_dyn_info_list;
+-
+-/* XXX fix me: there is currently no way to locate the dyn-info list
+-       by a remote unwinder.  On ia64, this is done via a special
+-       unwind-table entry.  Perhaps something similar can be done with
+-       DWARF2 unwind info.  */
+-
+ static void
+ put_unwind_info (unw_addr_space_t as, unw_proc_info_t *proc_info, void *arg)
+ {
+@@ -66,7 +59,13 @@ static int
+ get_dyn_info_list_addr (unw_addr_space_t as, unw_word_t *dyn_info_list_addr,
+                         void *arg)
+ {
+-  *dyn_info_list_addr = (unw_word_t) &_U_dyn_info_list;
++#ifndef UNW_LOCAL_ONLY
++# pragma weak _U_dyn_info_list_addr
++  if (!_U_dyn_info_list_addr)
++    return -UNW_ENOINFO;
++#endif
++  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libunwind.so.
++  *dyn_info_list_addr = _U_dyn_info_list_addr ();
+   return 0;
+ }
+ 
+-- 
+2.28.0
+
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
index 6ac14ebd02..7aa69b11cb 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -25,6 +25,7 @@ SRC_URI = "git://github.com/mongodb/mongo.git;branch=v4.4 \
            file://0001-Support-deprecated-resolver-functions.patch \
            file://0003-Fix-unknown-prefix-env.patch \
            file://1296.patch \
+           file://0001-Fix-compilation-with-fno-common.patch \
            "
 SRC_URI_append_libc-musl ="\
            file://0001-Mark-one-of-strerror_r-implementation-glibc-specific.patch \
-- 
2.28.0

