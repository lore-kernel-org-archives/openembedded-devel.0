Return-Path: <andrei@gherzan.ro>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2A73579AE7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2019 18:41:22 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id t4so13099149wrx.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2019 11:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.ro; s=google;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=sjlM/os2aTszwdfZmk9pVIgpYVtCEgvzz1CQmXMU6Ws=;
	b=MifSuNXWgq9Sl3oF00w97CJaafR7hPpybbVL64I1gITFnlbLHQSuNB3V4r6nPB0t5X
	mKcdqOeJR7eMCn5n3GBWApps28+OgFeYB7+gButfUIrH2QCUyUejxPJdXFqYgxU1taSn
	uRJDNJuuIbqf0OhipOKggBBfn4mWeOSDu/j3iyRuClNXVdk6/9D+fAp21xSJk2cw9njb
	oQFYHVMRTeBs9tfrAScG1nHiJjbZLuAmSf7W7cJ2dcXr9GYdwJzAJQ9ykk9yMEq2kGP+
	4mG5g8OVy0tiqSGFBWYreokfkjr3ejMLI+WqVYHlVcNMigsJo0hy4XYVcNE9ytMapXOF
	pAUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; s=google;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=sjlM/os2aTszwdfZmk9pVIgpYVtCEgvzz1CQmXMU6Ws=;
	b=VUh7r5AiZMJhvCE3BWXCagRMlUJiDG4zU6exVvnDQEjX5xsYRO+gnWyP/B5dzeZuMh
	1N6i8PF8OFaboPIWDeNjkSBsyAsBlhqwZpzJYSV2ceERNye6+J97dlTqm6OmB6IP6hXr
	QGE7nMhWZjnM6tP5hQyWikdXBwMzhtzrAUXJRSEBDq1aWVPByFD8uH6UeaAJqplZR0dE
	tBlsn9moNpJdVul+H4PC8bLCYQ6sb4AO2+hIE+lnPFmpPJ08wDCV2IT3/VzBWdUWWKJk
	1wTPmsP8dxmGgz27TBQkXw57z1UCyKXf2kSydScAxB/rkcb9ggEFodC0LFj/WUy6h7CI
	Hssg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=sjlM/os2aTszwdfZmk9pVIgpYVtCEgvzz1CQmXMU6Ws=;
	b=eTLtShrROSdXLqtQuJZ06vGyudPT2WO0cT1jFsPj83y8s2l4RExUb8dpqwLkufCUo5
	p3M8CLvPzqmvQjzx+nUJyiyBqNXsR7uBwD2Q9ADLP4qcDwqg9YbBM42mPY62wYwXZy90
	lXaprchB1MAu4HsSFlVXOqlg0uTERL43nkCUMWEoR3vptmaMaoa1e4Pjl0kDBwDfZ4uQ
	C307LzvLl9PeNKFLoIfLvI41CxUQ+b/WWKZSWh5GXurgukTvbiO/M2s75JapvB7NiU5K
	t1hrfyCymhWzo9VD+kHuI493wkMH6uUYM7KaKxFpqx0olsJbD0BgtSnVeclkG4b+1XYU
	3HpA==
X-Gm-Message-State: APjAAAVmXEDIV0a4k3aRn3re6KcS/Ow9O7PZTqAmDBBh3lhsjtstWUA0
	jzaLfxkPAS4uVD8AI0JZGYw2XkKGNOQ=
X-Google-Smtp-Source: APXvYqxdXs4iexwpW9zmO687m3r3y7lBWugShYAtoUj5CZG0FfzOe4qwdOIhT5unLpP/PMXXXHjOnw==
X-Received: by 2002:a5d:4692:: with SMTP id u18mr601698wrq.285.1559068882273; 
	Tue, 28 May 2019 11:41:22 -0700 (PDT)
Received: from localhost.localdomain (host90-152-4-101.ipv4.regusnet.com.
	[90.152.4.101])
	by smtp.gmail.com with ESMTPSA id x22sm4689684wmi.4.2019.05.28.11.41.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 May 2019 11:41:21 -0700 (PDT)
Sender: Andrei Gherzan <andrei@gherzan.ro>
From: Andrei Gherzan <andrei@gherzan.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 May 2019 19:40:48 +0100
Message-Id: <20190528184048.10259-1-andrei@gherzan.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Cc: Andrei Gherzan <andrei@gherzan.ro>
Subject: [meta-networking][PATCH V2] networkmanager: Update to 1.18.0
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
X-List-Received-Date: Tue, 28 May 2019 18:41:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andrei Gherzan <andrei@gherzan.ro>

One patch was dropped (0003-dlopen-failure.patch) as a similar one was
merged upstream. See:
https://github.com/NetworkManager/NetworkManager/commit/bd4957fcd78a0e64d26459e94ab3b84c91cd6f5f

Refreshed musl patches as well.

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 .../networkmanager/0003-dlopen-failure.patch  |  34 -----
 ...Fix-build-with-musl-systemd-specific.patch | 128 ++++++++----------
 .../musl/0002-Fix-build-with-musl.patch       |  20 +--
 ...ger_1.16.0.bb => networkmanager_1.18.0.bb} |   6 +-
 4 files changed, 70 insertions(+), 118 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-dlopen-failure.patch
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.16.0.bb => networkmanager_1.18.0.bb} (96%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-dlopen-failure.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-dlopen-failure.patch
deleted file mode 100644
index e99c22710..000000000
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-dlopen-failure.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 57239fda56b68a8f3e413f7b6af5290ba0d86636 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
-Date: Thu, 22 Mar 2018 18:18:06 +0100
-Subject: [PATCH] musl: dlopen is included so LD_LIBS="" instead of
- LD_LIBS="none required"
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Pending
-
-Stolen from [1] and prettyfied slightly
-
-[1] https://github.com/voidlinux/void-packages/tree/master/srcpkgs/NetworkManager/patches
-
-Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
----
- configure.ac | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/configure.ac b/configure.ac
-index 487a266..96ae4f7 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -235,6 +235,7 @@ dnl
- dnl Checks for libdl - on certain platforms its part of libc
- dnl
- AC_SEARCH_LIBS([dlopen], [dl dld], [], [ac_cv_search_dlopen=])
-+AS_IF([test "$ac_cv_search_dlopen" = "none required"],[ac_cv_search_dlopen=""])
- AC_SUBST([DL_LIBS], "$ac_cv_search_dlopen")
- 
- PKG_CHECK_MODULES(GLIB, [gio-unix-2.0 >= 2.37.6 gmodule-2.0],
--- 
-2.14.3
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0001-Fix-build-with-musl-systemd-specific.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0001-Fix-build-with-musl-systemd-specific.patch
index accd2f256..af6f938ce 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0001-Fix-build-with-musl-systemd-specific.patch
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0001-Fix-build-with-musl-systemd-specific.patch
@@ -1,7 +1,7 @@
-From 7b09945585e6ce65049fa4039f26caee8daa44b9 Mon Sep 17 00:00:00 2001
+From a89c2e6d40606f563467a83fb98933e990e71377 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
 Date: Tue, 2 Apr 2019 01:34:35 +0200
-Subject: [PATCH 1/2] Fix build with musl - systemd specific
+Subject: [PATCH] Fix build with musl - systemd specific
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -14,27 +14,27 @@ Upstream-Status: Pending
 Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
 ---
  shared/systemd/src/basic/in-addr-util.c |  1 +
- shared/systemd/src/basic/process-util.c |  9 ++++++++
- shared/systemd/src/basic/socket-util.h  |  6 +++++
+ shared/systemd/src/basic/process-util.c |  9 +++++++++
+ shared/systemd/src/basic/socket-util.h  |  6 ++++++
+ shared/systemd/src/basic/sort-util.h    | 27 ++++---------------------
  shared/systemd/src/basic/stdio-util.h   |  2 ++
  shared/systemd/src/basic/string-util.h  |  5 +++++
- shared/systemd/src/basic/util.h         | 29 +++++--------------------
- 6 files changed, 28 insertions(+), 24 deletions(-)
+ 6 files changed, 27 insertions(+), 23 deletions(-)
 
 diff --git a/shared/systemd/src/basic/in-addr-util.c b/shared/systemd/src/basic/in-addr-util.c
-index 5ced350..c6b52b8 100644
+index 5899f62..0adb248 100644
 --- a/shared/systemd/src/basic/in-addr-util.c
 +++ b/shared/systemd/src/basic/in-addr-util.c
-@@ -13,6 +13,7 @@
+@@ -14,6 +14,7 @@
  #include "in-addr-util.h"
  #include "macro.h"
  #include "parse-util.h"
 +#include "string-util.h"
+ #include "random-util.h"
+ #include "strxcpyx.h"
  #include "util.h"
- 
- bool in4_addr_is_null(const struct in_addr *a) {
 diff --git a/shared/systemd/src/basic/process-util.c b/shared/systemd/src/basic/process-util.c
-index b0afb5c..7adc8bd 100644
+index 7431be3..189060a 100644
 --- a/shared/systemd/src/basic/process-util.c
 +++ b/shared/systemd/src/basic/process-util.c
 @@ -21,6 +21,9 @@
@@ -47,7 +47,7 @@ index b0afb5c..7adc8bd 100644
  #if 0 /* NM_IGNORED */
  #if HAVE_VALGRIND_VALGRIND_H
  #include <valgrind/valgrind.h>
-@@ -1168,11 +1171,13 @@ void reset_cached_pid(void) {
+@@ -1183,11 +1186,13 @@ void reset_cached_pid(void) {
          cached_pid = CACHED_PID_UNSET;
  }
  
@@ -61,7 +61,7 @@ index b0afb5c..7adc8bd 100644
  
  pid_t getpid_cached(void) {
          static bool installed = false;
-@@ -1201,7 +1206,11 @@ pid_t getpid_cached(void) {
+@@ -1216,7 +1221,11 @@ pid_t getpid_cached(void) {
                           * only half-documented (glibc doesn't document it but LSB does — though only superficially)
                           * we'll check for errors only in the most generic fashion possible. */
  
@@ -74,7 +74,7 @@ index b0afb5c..7adc8bd 100644
                                  cached_pid = CACHED_PID_UNSET;
                                  return new_pid;
 diff --git a/shared/systemd/src/basic/socket-util.h b/shared/systemd/src/basic/socket-util.h
-index d2246a8..76f257f 100644
+index 15443f1..4807198 100644
 --- a/shared/systemd/src/basic/socket-util.h
 +++ b/shared/systemd/src/basic/socket-util.h
 @@ -13,6 +13,12 @@
@@ -90,55 +90,13 @@ index d2246a8..76f257f 100644
  #include "macro.h"
  #include "missing_socket.h"
  #include "sparse-endian.h"
-diff --git a/shared/systemd/src/basic/stdio-util.h b/shared/systemd/src/basic/stdio-util.h
-index dc67b6e..6336243 100644
---- a/shared/systemd/src/basic/stdio-util.h
-+++ b/shared/systemd/src/basic/stdio-util.h
-@@ -1,7 +1,9 @@
- /* SPDX-License-Identifier: LGPL-2.1+ */
- #pragma once
+diff --git a/shared/systemd/src/basic/sort-util.h b/shared/systemd/src/basic/sort-util.h
+index e029f86..1e8b6e1 100644
+--- a/shared/systemd/src/basic/sort-util.h
++++ b/shared/systemd/src/basic/sort-util.h
+@@ -5,15 +5,10 @@
  
-+#if defined(__GLIBC__)
- #include <printf.h>
-+#endif
- #include <stdarg.h>
- #include <stdio.h>
- #include <sys/types.h>
-diff --git a/shared/systemd/src/basic/string-util.h b/shared/systemd/src/basic/string-util.h
-index 38070ab..6b918e0 100644
---- a/shared/systemd/src/basic/string-util.h
-+++ b/shared/systemd/src/basic/string-util.h
-@@ -27,6 +27,11 @@
- #define strcaseeq(a,b) (strcasecmp((a),(b)) == 0)
- #define strncaseeq(a, b, n) (strncasecmp((a), (b), (n)) == 0)
- 
-+/* musl does not know strndupa */
-+#if !defined(__GLIBC__)
-+#define strndupa(x,s) strncpy(alloca(strlen(x)+1),x,s)
-+#endif
-+
- int strcmp_ptr(const char *a, const char *b) _pure_;
- 
- static inline bool streq_ptr(const char *a, const char *b) {
-diff --git a/shared/systemd/src/basic/util.h b/shared/systemd/src/basic/util.h
-index dc33d66..cc768e9 100644
---- a/shared/systemd/src/basic/util.h
-+++ b/shared/systemd/src/basic/util.h
-@@ -27,6 +27,11 @@
  #include "macro.h"
- #include "time-util.h"
- 
-+#if !defined(__GLIBC__)
-+typedef int (*__compar_fn_t) (const void*, const void*);
-+typedef __compar_fn_t comparison_fn_t;
-+#endif
-+
- size_t page_size(void) _pure_;
- #define PAGE_ALIGN(l) ALIGN_TO((l), page_size())
- 
-@@ -66,16 +71,6 @@ int prot_from_flags(int flags) _const_;
- bool in_initrd(void);
- void in_initrd_force(bool value);
  
 -void *xbsearch_r(const void *key, const void *base, size_t nmemb, size_t size,
 -                 __compar_d_fn_t compar, void *arg);
@@ -149,14 +107,18 @@ index dc33d66..cc768e9 100644
 -                int (*_func_)(const typeof(b[0])*, const typeof(b[0])*, typeof(userdata)) = func; \
 -                xbsearch_r((const void*) _k, (b), (n), sizeof((b)[0]), (__compar_d_fn_t) _func_, userdata); \
 -        })
--
++#if !defined(__GLIBC__)
++typedef int (*__compar_fn_t) (const void*, const void*);
++typedef __compar_fn_t comparison_fn_t;
++#endif
+ 
  /**
   * Normal bsearch requires base to be nonnull. Here were require
-  * that only if nmemb > 0.
-@@ -116,20 +111,6 @@ static inline void qsort_safe(void *base, size_t nmemb, size_t size, __compar_fn
+@@ -54,17 +49,3 @@ static inline void qsort_safe(void *base, size_t nmemb, size_t size, __compar_fn
+                 int (*_func_)(const typeof(p[0])*, const typeof(p[0])*) = func; \
                  qsort_safe((p), (n), sizeof((p)[0]), (__compar_fn_t) _func_); \
          })
- 
+-
 -static inline void qsort_r_safe(void *base, size_t nmemb, size_t size, __compar_d_fn_t compar, void *userdata) {
 -        if (nmemb <= 1)
 -                return;
@@ -170,10 +132,36 @@ index dc33d66..cc768e9 100644
 -                int (*_func_)(const typeof(p[0])*, const typeof(p[0])*, typeof(userdata)) = func; \
 -                qsort_r_safe((p), (n), sizeof((p)[0]), (__compar_d_fn_t) _func_, userdata); \
 -        })
--
- /* Normal memcpy requires src to be nonnull. We do nothing if n is 0. */
- static inline void memcpy_safe(void *dst, const void *src, size_t n) {
-         if (n == 0)
+diff --git a/shared/systemd/src/basic/stdio-util.h b/shared/systemd/src/basic/stdio-util.h
+index c3b9448..e80a938 100644
+--- a/shared/systemd/src/basic/stdio-util.h
++++ b/shared/systemd/src/basic/stdio-util.h
+@@ -1,7 +1,9 @@
+ /* SPDX-License-Identifier: LGPL-2.1+ */
+ #pragma once
+ 
++#if defined(__GLIBC__)
+ #include <printf.h>
++#endif
+ #include <stdarg.h>
+ #include <stdio.h>
+ #include <sys/types.h>
+diff --git a/shared/systemd/src/basic/string-util.h b/shared/systemd/src/basic/string-util.h
+index b23f4c8..8f2f6e0 100644
+--- a/shared/systemd/src/basic/string-util.h
++++ b/shared/systemd/src/basic/string-util.h
+@@ -27,6 +27,11 @@
+ #define strcaseeq(a,b) (strcasecmp((a),(b)) == 0)
+ #define strncaseeq(a, b, n) (strncasecmp((a), (b), (n)) == 0)
+ 
++/* musl does not know strndupa */
++#if !defined(__GLIBC__)
++#define strndupa(x,s) strncpy(alloca(strlen(x)+1),x,s)
++#endif
++
+ int strcmp_ptr(const char *a, const char *b) _pure_;
+ 
+ static inline bool streq_ptr(const char *a, const char *b) {
 -- 
-2.20.1
+2.17.1
 
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0002-Fix-build-with-musl.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0002-Fix-build-with-musl.patch
index 25f9a4a00..e0973af1e 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0002-Fix-build-with-musl.patch
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0002-Fix-build-with-musl.patch
@@ -1,4 +1,4 @@
-From 0b0f2d5abe27b2c9587f449795f0ae3568fc3e38 Mon Sep 17 00:00:00 2001
+From 3d1307735667758f44378585482fe421db086af8 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
 Date: Mon, 8 Apr 2019 23:10:43 +0200
 Subject: [PATCH 2/2] Fix build with musl
@@ -23,7 +23,7 @@ The build issues caused by definition conflicts musl vs linux-libc headers
 Note:
 Be aware that this is still nasty business: We have to trust that musl headers
 define same signatures as linux would do - just because musl-makers consider
-linux-libc headers 'notoriously broken for userspace' [2] (search for 
+linux-libc headers 'notoriously broken for userspace' [2] (search for
 'error: redefinition of').
 
 [1] http://lists.openembedded.org/pipermail/openembedded-core/2019-March/280440.html
@@ -53,7 +53,7 @@ index 43fbbc1..3eae286 100644
  #include "nmtui.h"
  
 diff --git a/libnm-core/nm-utils.h b/libnm-core/nm-utils.h
-index 2b5baba..8a50131 100644
+index 2b5baba..f7abab6 100644
 --- a/libnm-core/nm-utils.h
 +++ b/libnm-core/nm-utils.h
 @@ -25,6 +25,10 @@
@@ -68,7 +68,7 @@ index 2b5baba..8a50131 100644
  
  #include <netinet/in.h>
 diff --git a/shared/nm-default.h b/shared/nm-default.h
-index 26d6476..b29e8af 100644
+index 54e9916..26e9f4e 100644
 --- a/shared/nm-default.h
 +++ b/shared/nm-default.h
 @@ -211,6 +211,9 @@
@@ -82,7 +82,7 @@ index 26d6476..b29e8af 100644
  /*****************************************************************************/
  
 diff --git a/src/devices/nm-device.c b/src/devices/nm-device.c
-index 7514fa7..d305fa5 100644
+index bd4fbcc..f70b309 100644
 --- a/src/devices/nm-device.c
 +++ b/src/devices/nm-device.c
 @@ -24,6 +24,7 @@
@@ -102,17 +102,17 @@ index 7514fa7..d305fa5 100644
  #include <linux/pkt_sched.h>
  
 diff --git a/src/platform/nm-linux-platform.c b/src/platform/nm-linux-platform.c
-index 2f5c75b..d6ca6d9 100644
+index d4b0115..22a3a90 100644
 --- a/src/platform/nm-linux-platform.c
 +++ b/src/platform/nm-linux-platform.c
-@@ -27,7 +27,6 @@
- #include <fcntl.h>
+@@ -28,7 +28,6 @@
  #include <libudev.h>
+ #include <linux/fib_rules.h>
  #include <linux/ip.h>
 -#include <linux/if_arp.h>
+ #include <linux/if_bridge.h>
  #include <linux/if_link.h>
  #include <linux/if_tun.h>
- #include <linux/if_tunnel.h>
 -- 
-2.20.1
+2.17.1
 
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.16.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.0.bb
similarity index 96%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager_1.16.0.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.0.bb
index 9f01f1bc1..9215a8676 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.16.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.0.bb
@@ -26,15 +26,13 @@ SRC_URI = " \
     ${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkManager-${PV}.tar.xz \
     file://0001-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch \
     file://0002-Do-not-create-settings-settings-property-documentati.patch \
-    file://0003-dlopen-failure.patch \
 "
 SRC_URI_append_libc-musl = " \
     file://musl/0001-Fix-build-with-musl-systemd-specific.patch \
     file://musl/0002-Fix-build-with-musl.patch \
 "
-
-SRC_URI[md5sum] = "10abacaafb162a67d2942adf03e7e9e4"
-SRC_URI[sha256sum] = "8e962833b6ca03edda1bc57ed6614a7b8c2339531b44acef098d05f2324c5d2c"
+SRC_URI[md5sum] = "c8c27116a8083bab5d5fcca0d03e988a"
+SRC_URI[sha256sum] = "c6e8df25e5a3c7309bc17664be8971689314884cdd08afdd6b0847d29d2a8ba6"
 
 UPSTREAM_CHECK_URI = "${GNOME_MIRROR}/NetworkManager/1.16/"
 UPSTREAM_CHECK_REGEX = "NetworkManager\-(?P<pver>1\.10(\.\d+)+).tar.xz"
-- 
2.17.1


