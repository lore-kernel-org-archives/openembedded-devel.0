Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8C45E79520
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Sep 2018 04:19:47 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id j8-v6so1985843pll.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Sep 2018 21:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=fXb49rZpOJMljN48dV30ntKD/kKB/RCxjfwY6leIRFo=;
	b=spiyhRV6TcR7HYBYd/rGrm1K8i7kT+r20bimH0NkzfMIejbaBN3bmJnAPTj6WDFBvI
	YXZrCQE4Q6/QQET4qQhzmirt0OWsyKUGyPyUjfjydUT+6d4KyB4HE7DjlOzQftXRn8Zz
	CK45+ytXis8VnwmI96y+rEg5jMrDp0Vx30MQCkO9S2+6CqEX8IpAyxCq3MYAftn/PRwd
	wmpjYHZnAXlRRghQyuQx/e32PTFD1lNIjORWf2nBw2K9WXfLSmDJ0/CTZobNQl2yp6pK
	IgeL8hIFhxYZqAUSvdA1LwdEXJ/V4Vq9IgkwHVVolFnYCBj7GhSqU+CjuY4/VHEJ7yKv
	urrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=fXb49rZpOJMljN48dV30ntKD/kKB/RCxjfwY6leIRFo=;
	b=fPTeQIMICkA37Uc4GrjcTocKzsaw7QzQY2gjqSbW+2GJvzeEhL5dakcboYRKQO0huE
	LXQJRDnsD6016Iz+H1+jVlWmw3KDb1s6NKP8W0xaBrASx6r++MK369L4Ows+2mfakU9g
	2wTzlMtt7l32x6xuWIq0tDkOlKl5ZxMzB26Bv6Zana/UwosJsvK7DTsHcZx7EE3xy26Y
	uW1Y6dbss43k2yTyIRR9hv6Y5pobfegCwv/uIMwyuB+70fUWypnmNZcoXDLI6NB3Czk+
	mgGZou/M8PliXHOfuFSPbrb5TuokDX5/x6xwpdoBGk0Iyx4Rx9WMCSG5xExjja8tINq0
	RAsw==
X-Gm-Message-State: APzg51Du8aj0HiWk/TTaYJ9WZYCulWaadcmK7XecKTLruE6qzkAft+Bj
	p+y0NUpipA6VZgDGI5JLAa/njSWL
X-Google-Smtp-Source: ANB0VdZfhu0tl1zR7Yz2bspLzK46V8fdNkUqMhgzT7v5/m3Sg5rbzcps0YDtYKmwHQBWy//OIVJrMQ==
X-Received: by 2002:a17:902:163:: with SMTP id
	90-v6mr5261689plb.322.1536812388228; 
	Wed, 12 Sep 2018 21:19:48 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::2887])
	by smtp.gmail.com with ESMTPSA id
	u184-v6sm5673918pgd.46.2018.09.12.21.19.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Sep 2018 21:19:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Sep 2018 21:19:39 -0700
Message-Id: <20180913041939.33707-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] kernel-selftest: Fix build on musl
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
X-List-Received-Date: Thu, 13 Sep 2018 04:19:47 -0000
Content-Transfer-Encoding: 8bit

* (Depends upon a linux-libc-headers patch proposed to oe-core)
* Delete unused patch
* Mark Clang 6.0 as minimum required version
* Do not hardcode python3 interpreter path

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Hongzhi.Song <hongzhi.song@windriver.com>
Cc: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../kernel-selftest/kernel-selftest.bb        |  5 ++--
 ...est_progs.c-add-support-for-musllibc.patch | 25 ------------------
 ....h-micro-define-to-support-musl-libc.patch | 26 -------------------
 .../kernel-selftest/python3-interp.patch      | 17 ++++++++++++
 4 files changed, 20 insertions(+), 53 deletions(-)
 delete mode 100644 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-bpf-test_progs.c-add-support-for-musllibc.patch
 delete mode 100644 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-swap.h-micro-define-to-support-musl-libc.patch
 create mode 100644 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/python3-interp.patch

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
index 2a53419c22..f07a2f59c4 100644
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -9,10 +9,10 @@ DEPENDS = "rsync-native"
 # for musl libc
 SRC_URI_append_libc-musl = "\
                       file://userfaultfd.patch \
-                      file://0001-bpf-test_progs.c-add-support-for-musllibc.patch \
                       "
 SRC_URI += "file://run-ptest \
             file://COPYING \
+            file://python3-interp.patch \
             "
 
 # now we just test bpf and vm
@@ -62,7 +62,7 @@ python __anonymous () {
 }
 
 do_compile() {
-    bbwarn "clang with bpf support is needed with kernel 4.18+ so \
+    bbwarn "clang >= 6.0  with bpf support is needed with kernel 4.18+ so \
 either install it and add it to HOSTTOOLS, or add \
 clang-native from meta-clang to dependency"
     for i in ${TEST_LIST}
@@ -115,5 +115,6 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 INHIBIT_PACKAGE_DEBUG_SPLIT="1"
 FILES_${PN} += "/usr/kernel-selftest"
 
+RDEPENDS_${PN} += "python3"
 # tools/testing/selftests/vm/Makefile doesn't respect LDFLAGS and tools/testing/selftests/Makefile explicitly overrides to empty
 INSANE_SKIP_${PN} += "ldflags"
diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-bpf-test_progs.c-add-support-for-musllibc.patch b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-bpf-test_progs.c-add-support-for-musllibc.patch
deleted file mode 100644
index 5f25426811..0000000000
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-bpf-test_progs.c-add-support-for-musllibc.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From a2e6b8fde28b743b69990a4e16c296e099631ed4 Mon Sep 17 00:00:00 2001
-From: "Hongzhi.Song" <hongzhi.song@windriver.com>
-Date: Mon, 23 Jul 2018 00:56:19 -0700
-Subject: [PATCH] bpf: test_progs.c add support for musllibc
-
-Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
----
- tools/testing/selftests/bpf/test_progs.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/tools/testing/selftests/bpf/test_progs.c b/tools/testing/selftests/bpf/test_progs.c
-index 11ee25c..21b27b7 100644
---- a/tools/testing/selftests/bpf/test_progs.c
-+++ b/tools/testing/selftests/bpf/test_progs.c
-@@ -4,6 +4,7 @@
-  * modify it under the terms of version 2 of the GNU General Public
-  * License as published by the Free Software Foundation.
-  */
-+#define __always_inline __inline __attribute__ ((__always_inline__))
- #include <stdio.h>
- #include <unistd.h>
- #include <errno.h>
--- 
-2.11.0
-
diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-swap.h-micro-define-to-support-musl-libc.patch b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-swap.h-micro-define-to-support-musl-libc.patch
deleted file mode 100644
index e2245fc4c2..0000000000
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-swap.h-micro-define-to-support-musl-libc.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From c21dfb0dfdfec281479e267ad7fe9a8d4ba15a70 Mon Sep 17 00:00:00 2001
-From: "Hongzhi.Song" <hongzhi.song@windriver.com>
-Date: Tue, 17 Jul 2018 23:47:48 -0700
-Subject: [PATCH] add micro define to support musl libc
-
-Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
----
- recipe-sysroot/usr/include/linux/swab.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/recipe-sysroot/usr/include/linux/swab.h b/recipe-sysroot/usr/include/linux/swab.h
-index afb7eb7..33efa10 100644
---- a/recipe-sysroot/usr/include/linux/swab.h
-+++ b/recipe-sysroot/usr/include/linux/swab.h
-@@ -6,6 +6,8 @@
- 
- #include <asm/swab.h>
- 
-+#define __always_inline __inline __attribute__ ((__always_inline__))
-+
- /*
-  * casts are necessary for constants, because we never know how for sure
-  * how U/UL/ULL map to __u16, __u32, __u64. At least not in a portable way.
--- 
-2.11.0
-
diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/python3-interp.patch b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/python3-interp.patch
new file mode 100644
index 0000000000..2a410bec12
--- /dev/null
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/python3-interp.patch
@@ -0,0 +1,17 @@
+Use env to find python3 interpreter
+
+Make OE's QA checker happy
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: kernel-selftest-1.0/tools/testing/selftests/bpf/test_offload.py
+===================================================================
+--- kernel-selftest-1.0.orig/tools/testing/selftests/bpf/test_offload.py
++++ kernel-selftest-1.0/tools/testing/selftests/bpf/test_offload.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python3
++#!/usr/bin/env python3
+ 
+ # Copyright (C) 2017 Netronome Systems, Inc.
+ #
-- 
2.19.0


