Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0E711792AF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 20:39:24 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id r16-v6so5250894wrt.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 13:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZxxM9EyyDSm/PDH2XrI/M79MJc7h6+uTw1SDICsZ0p8=;
	b=oBlVIfg6AICMB/XncxmNUs/OJY5NHe2OqHi/wLzoUyocj3OefFbgMghh7bnhNXoXlH
	aKFWUVENFskWj0S5J5gjhDUdA0N8RRs3q2YdDB50jBBjdBfs8F1wxMpbEitGV4PEuaSY
	+YyMesIzrNWOdH+sTfk+uVzHqiyrzioRtS1lyjU9npFHx3EovIeimNu+3Ld6v7TYQ9FZ
	RzJub5onR83j18FDJTHaQuC4OucB4bmIhgNQX2gWIlS1XjXES5/F1IimJ9V7bied3ppm
	mMYEIf7r9CKxO/Oxvgtlc0gZPsd78QxjSpbn1upkV/3QbrgN+gLcmd/PvD2IH4B1m8yX
	IPwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ZxxM9EyyDSm/PDH2XrI/M79MJc7h6+uTw1SDICsZ0p8=;
	b=KZ2s+PYNOaQD2rZ2XigeNwE4Y9cs3EY65UhtIJs0MQvNS51sO1GkWj+VF2X6s3or0T
	31Fi8/kZ6VtJ6mdfh62o2RpHAy1On8TfSWpQpHLqy81nWUGXfBomSizPvtzw5qsywHtL
	RmJ/422yI8vjxpF8RAH+UviMl84pjNXNOJkLAZPvY+dDqLlSr8y1LabTOB/slzH3VipD
	RoQi+kpwe6W8QcWZAb5Wv/9wCahZmYgAoi11Ds8c9gM5br7svN6V6Mo3QqrM74Vev5gA
	lDP8mpNWtIuEvITDcktRmxDziyeM2m1X4KxdEEbcNceB0UorU3RLtVKjwQ6LK9mDMzKR
	i01Q==
X-Gm-Message-State: AOUpUlEt900pWHbKcMMy8nTmw2YacEApOj8C38UAPqSCQi4/Oaws+8hf
	IeoE9n0dQJTT4KYwud3o8hRPtohH
X-Google-Smtp-Source: AA+uWPxUNl+A0GbnTxFoF91Md0CzTTPT73Km8xXlKChAAFGW7wIk+B3/t1csYzBMiwKak2aRDOEtsQ==
X-Received: by 2002:adf:eccb:: with SMTP id
	s11-v6mr2548628wro.160.1534451965632; 
	Thu, 16 Aug 2018 13:39:25 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	d12-v6sm492828wru.36.2018.08.16.13.39.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 16 Aug 2018 13:39:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Aug 2018 20:39:20 +0000
Message-Id: <20180816203920.464-6-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180816203920.464-1-Martin.Jansa@gmail.com>
References: <20180816203920.464-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-networking][PATCH 6/6] kernel-selftest: fix various issues
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
X-List-Received-Date: Thu, 16 Aug 2018 20:39:25 -0000

* respect PACKAGECONFIG when setting TEST_LIST
* call the sed in remove_clang_related only when bpf PACKAGECONFIG is
  enabled and if ${S}/tools/testing/selftests/bpf/Makefile doesn't exist
  then show more useful error message than:
  sed: can't read kernel-selftest/1.0-r0/kernel-selftest-1.0/tools/testing/selftests/bpf/Makefile: No such file or directory
  because kernels older than 4.10 don't have bpf selftest which was
  added in:
  https://github.com/torvalds/linux/commit/5aa5bd14c5f8660c64ceedf14a549781be47e53d
* disable ldflags QA errors, the selftests Makefile explicitly overrides
  LDFLAGS to empty:
  https://github.com/torvalds/linux/blob/5aa5bd14c5f8660c64ceedf14a549781be47e53d/tools/testing/selftests/Makefile#L46
  and the vm/Makefile doesn't respect LDFLAGS anyway:
  https://github.com/torvalds/linux/blob/5aa5bd14c5f8660c64ceedf14a549781be47e53d/tools/testing/selftests/vm/Makefile#L17
  so it was causing a lot of errors:
  ERROR: kernel-selftest-1.0-r0 do_package_qa: QA Issue: No GNU_HASH in the elf binary: 'kernel-selftest/1.0-r0/packages-split/kernel-selftest/usr/kernel-selftest/vm/thuge-gen'
  No GNU_HASH in the elf binary: 'kernel-selftest/1.0-r0/packages-split/kernel-selftest/usr/kernel-selftest/vm/thuge-gen'
  No GNU_HASH in the elf binary: 'kernel-selftest/1.0-r0/packages-split/kernel-selftest/usr/kernel-selftest/vm/transhuge-stress'
  No GNU_HASH in the elf binary: 'kernel-selftest/1.0-r0/packages-split/kernel-selftest/usr/kernel-selftest/vm/transhuge-stress'
  No GNU_HASH in the elf binary: 'kernel-selftest/1.0-r0/packages-split/kernel-selftest/usr/kernel-selftest/vm/userfaultfd'
  No GNU_HASH in the elf binary: 'kernel-selftest/1.0-r0/packages-split/kernel-selftest/usr/kernel-selftest/vm/userfaultfd'
  No GNU_HASH in the elf binary: 'kernel-selftest/1.0-r0/packages-split/kernel-selftest/usr/kernel-selftest/vm/hugepage-shm'
  No GNU_HASH in the elf binary: 'kernel-selftest/1.0-r0/packages-split/kernel-selftest/usr/kernel-selftest/vm/hugepage-shm'
  No GNU_HASH in the elf binary: 'kernel-selftest/1.0-r0/packages-split/kernel-selftest/usr/kernel-selftest/vm/on-fault-limit'
  No GNU_HASH in the elf binary: 'kernel-selftest/1.0-r0/packages-split/kernel-selftest/usr/kernel-selftest/vm/on-fault-limit'
  No GNU_HASH in the elf binary: 'kernel-selftest/1.0-r0/packages-split/kernel-selftest/usr/kernel-selftest/vm/hugepage-mmap'
  No GNU_HASH in the elf binary: 'kernel-selftest/1.0-r0/packages-split/kernel-selftest/usr/kernel-selftest/vm/hugepage-mmap'
  No GNU_HASH in the elf binary: 'kernel-selftest/1.0-r0/packages-split/kernel-selftest/usr/kernel-selftest/vm/compaction_test'
  No GNU_HASH in the elf binary: 'kernel-selftest/1.0-r0/packages-split/kernel-selftest/usr/kernel-selftest/vm/compaction_test'
  No GNU_HASH in the elf binary: 'kernel-selftest/1.0-r0/packages-split/kernel-selftest/usr/kernel-selftest/vm/mlock2-tests'
  No GNU_HASH in the elf binary: 'kernel-selftest/1.0-r0/packages-split/kernel-selftest/usr/kernel-selftest/vm/mlock2-tests'
  No GNU_HASH in the elf binary: 'kernel-selftest/1.0-r0/packages-split/kernel-selftest/usr/kernel-selftest/vm/map_hugetlb'
  No GNU_HASH in the elf binary: 'kernel-selftest/1.0-r0/packages-split/kernel-selftest/usr/kernel-selftest/vm/map_hugetlb' [ldflags]
* fix the formatting and useless append
* add dependency on rsync-native as it's used during do_install:
  | make: Entering directory 'kernel-selftest/1.0-r0/kernel-selftest-1.0/tools/testing/selftests/vm'
  | rsync -a  run_vmtests  compaction_test hugepage-mmap hugepage-shm map_hugetlb mlock2-tests on-fault-limit thuge-gen transhuge-stress userfaultfd kernel-selftest/1.0-r0/image/usr/kernel-selftest/vm/
  | /bin/sh: 1: rsync: not found
  | ../lib.mk:24: recipe for target 'install' failed

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../kernel-selftest/kernel-selftest.bb        | 29 ++++++++++++-------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
index 27d98a3049..34a869d1fe 100644
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -2,14 +2,19 @@ SUMMARY = "Kernel selftest for Linux"
 DESCRIPTION = "Kernel selftest for Linux"
 LICENSE = "GPLv2"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7 \
-"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
+
+DEPENDS = "rsync-native"
 
 # for musl libc
 SRC_URI_libc-musl += "file://userfaultfd.patch \
                       file://0001-bpf-test_progs.c-add-support-for-musllibc.patch \
 "
 
+# now we just test bpf and vm
+# we will append other kernel selftest in the future
+# bpf was added in 4.10 with: https://github.com/torvalds/linux/commit/5aa5bd14c5f8660c64ceedf14a549781be47e53d
+# if you have older kernel than that you need to remove it from PACKAGECONFIG
 PACKAGECONFIG ??= "bpf vm"
 
 PACKAGECONFIG[bpf] = ",,elfutils libcap libcap-ng rsync-native,"
@@ -23,10 +28,8 @@ do_populate_lic[depends] += "virtual/kernel:do_patch"
 
 S = "${WORKDIR}/${BP}"
 
-# now we just test bpf and vm
-# we will append other kernel selftest in the future
-TEST_LIST = "bpf \
-             vm \
+TEST_LIST = " \
+    ${@bb.utils.filter('PACKAGECONFIG', 'bpf vm', d)} \
 "
 
 EXTRA_OEMAKE = '\
@@ -35,12 +38,9 @@ EXTRA_OEMAKE = '\
     CC="${CC}" \
     AR="${AR}" \
     LD="${LD}" \
+    DESTDIR="${D}" \
 '
 
-EXTRA_OEMAKE += "\
-    'DESTDIR=${D}' \
-"
-
 KERNEL_SELFTEST_SRC ?= "Makefile \
                         include \
                         tools \
@@ -95,10 +95,17 @@ python copy_kselftest_source_from_kernel() {
 }
 
 remove_clang_related() {
-	sed -i -e '/test_pkt_access/d' -e '/test_pkt_md_access/d' ${S}/tools/testing/selftests/bpf/Makefile
+    if ${@bb.utils.contains('PACKAGECONFIG','bpf','true','false',d)} ; then
+        test -f ${S}/tools/testing/selftests/bpf/Makefile && \
+            sed -i -e '/test_pkt_access/d' -e '/test_pkt_md_access/d' ${S}/tools/testing/selftests/bpf/Makefile || \
+            bberror "Your kernel is probably older than 4.10 and doesn't have tools/testing/selftests/bpf/Makefile file from https://github.com/torvalds/linux/commit/5aa5bd14c5f8660c64ceedf14a549781be47e53d, disable bpf PACKAGECONFIG"
+    fi
 }
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 INHIBIT_PACKAGE_DEBUG_SPLIT="1"
 FILES_${PN} += "/usr/kernel-selftest"
+
+# tools/testing/selftests/vm/Makefile doesn't respect LDFLAGS and tools/testing/selftests/Makefile explicitly overrides to empty
+INSANE_SKIP_${PN} += "ldflags"
-- 
2.17.1


