Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 7D30D79957
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Sep 2018 20:58:27 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id i190-v6so3305612pgc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Sep 2018 13:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3YAa4P6mIEqC8grvRw61Jh8hiNEVhnfTmt17TR4wyVs=;
	b=obyaazV7WanW5atdI2T8GEwFilsYHNED/jEqsFexOJ7CgksYGy6AQ/+2RLRbUom78N
	1+c2pfqJPijgmfV1L4jQr7u/nOQ2Ck+1q6BtDJSmIo/aE2EBs00bkcjmRFO92CfhWtTl
	vNG9a6coexADqxNkzsZAZ0VjnQyAZK/cKPYPSsESyCsXfrhGfpIG7raZhqSa5NjVEx0o
	cVUzOOZ7lhITGW+ecd0Pu/wFz5hOmnnwf5hAU1sPDqBLYq+r2meuIlgi6jbElS/rSPIf
	d9v8RiqTsYZmw9qxm6y4S8t3/7SBF3uu9qpxjveD95WGaa6VAq697HnMAU2di2E5epAs
	nRqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3YAa4P6mIEqC8grvRw61Jh8hiNEVhnfTmt17TR4wyVs=;
	b=c+eu+dWeBuz77YSBsgdQ4A0bbb3peJj3kZw7yMSva3J44SP7f7dpxwcWla+JNwp3sv
	zijLS4TLh0yEGXBD7bB8ScC2EWLu0GHiinSMk1S2xzXR3C750EIJUodk5GdrsyAMasjP
	/zGpS/FqFA0q5Po2sPjX28DAyB9F4wCq5c32Qj1P1WwRvozZ+1Su6h7EFnI1OcUA1WVY
	457BACsJwOB9leCTSXtHPOmZaUHiaQHKqiGk0GmHF9FVA9kxSh0aGwHNxvmawQlUHY5q
	OsZQFszja6UKbqvEN0H7fE3RbkTLN1v2ucNM91vglHVhc4BXUClHNCKJRw1OVeMfrLYN
	usjg==
X-Gm-Message-State: APzg51BCGV25Pea4n4i0N2s8kYpmvP6qrA+kRNU4fF9SNWY2ChlsBdKt
	xCVtm6W89/VHlnYFgTwxFVSNZWx5
X-Google-Smtp-Source: ANB0VdbTqK1mswyCXgZGpKW5PrBfSjviY1fgM9NkkGvHNvZRsxI7n33rpCjwe0QOYu3TAFzHmGFQVg==
X-Received: by 2002:a63:f002:: with SMTP id k2-v6mr8644020pgh.8.1536872308087; 
	Thu, 13 Sep 2018 13:58:28 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::2887])
	by smtp.gmail.com with ESMTPSA id
	w5-v6sm5845788pfn.44.2018.09.13.13.58.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Sep 2018 13:58:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Sep 2018 13:58:19 -0700
Message-Id: <20180913205819.29945-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH V2] kernel-selftest: Fix build on musl
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
X-List-Received-Date: Thu, 13 Sep 2018 20:58:27 -0000
Content-Transfer-Encoding: 8bit

* (Depends upon a linux-libc-headers patch proposed to oe-core)
* Delete unused patch
* Mark Clang 6.0 as minimum required version
* Do not hardcode python3 interpreter path

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Hongzhi.Song <hongzhi.song@windriver.com>
Cc: Martin Jansa <Martin.Jansa@gmail.com>
---
V2: Fix build with older < 4.18 kernels

 .../kernel-selftest/kernel-selftest.bb        |  8 +++---
 ...est_progs.c-add-support-for-musllibc.patch | 25 ------------------
 ....h-micro-define-to-support-musl-libc.patch | 26 -------------------
 3 files changed, 5 insertions(+), 54 deletions(-)
 delete mode 100644 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-bpf-test_progs.c-add-support-for-musllibc.patch
 delete mode 100644 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-swap.h-micro-define-to-support-musl-libc.patch

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
index 2a53419c22..78413280b6 100644
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -9,7 +9,6 @@ DEPENDS = "rsync-native"
 # for musl libc
 SRC_URI_append_libc-musl = "\
                       file://userfaultfd.patch \
-                      file://0001-bpf-test_progs.c-add-support-for-musllibc.patch \
                       "
 SRC_URI += "file://run-ptest \
             file://COPYING \
@@ -62,7 +61,7 @@ python __anonymous () {
 }
 
 do_compile() {
-    bbwarn "clang with bpf support is needed with kernel 4.18+ so \
+    bbwarn "clang >= 6.0  with bpf support is needed with kernel 4.18+ so \
 either install it and add it to HOSTTOOLS, or add \
 clang-native from meta-clang to dependency"
     for i in ${TEST_LIST}
@@ -76,7 +75,9 @@ do_install() {
     do
         oe_runmake -C ${S}/tools/testing/selftests/${i} INSTALL_PATH=${D}/usr/kernel-selftest/${i} install
     done
-
+    if [ -e ${D}/usr/kernel-selftest/bpf/test_offload.py ]; then
+	sed -i -e '1s,#!.*python3,#! /usr/bin/env python3,' ${D}/usr/kernel-selftest/bpf/test_offload.py
+    fi
     chown root:root  -R ${D}/usr/kernel-selftest
 }
 
@@ -115,5 +116,6 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
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
-- 
2.19.0


