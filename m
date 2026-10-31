Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.699.1793419084228046213
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Oct 2026 20:58:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=AttpgwNJ;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3282db206d3so702674eec.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 20:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793419084; x=1794023884; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l4i+Y9chIIR5N3zp/b0JshR1NWpFba9SPhxGPLPIMN8=;
        b=AttpgwNJAaiVoC7qrvFPqgrpg9Nb3+32BHbdkBVoqjVPDx9yqCA5Q/Hx1HXYsul06q
         5bPVYZ0x/jE/rOTWu7yBQrl9eLyelRsvq7TxgsylpUfIKRUos5w0nYKnQR28mylYv+rb
         hCagyBYyEzs1n5xZUFlrhjClJLojrdoag9cGlcr5i25F3Nd+9ADea4SPl/2qgnSTMm6g
         z7KfFFsfmnSNhSvkvUTWVlyZsZHCEkZXoQEjPJzap5rXni9XR7JqT8Aajm4vP2pS8RBu
         +Ctmu19192KcFf+p7e1abKJnXPkQWvk4ywa8zdI/jwQ8F7PeuqDv+i9owTxooGHS+qje
         /g9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793419084; x=1794023884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l4i+Y9chIIR5N3zp/b0JshR1NWpFba9SPhxGPLPIMN8=;
        b=IBeT+mWljvvlqZOK+rzwFXfjfi8mLBabznf7tiT0bGdadjkbsqX+ahgycKQstndpf7
         nCKaNDzCmVslPdcJIHNLxT/cH/O+9ddkMOX8Spni4Gpcpb7SinRAwn2cpXNx0PehKBVi
         O3Et8Jhets0ZT1CO0UWtcjUq1jkvaEBKuxUhGNcuivNh6w5nYrF90GsBFy+9p0KcNHGZ
         AQmeV0rKpVUhrWPD5fqssfTh/GwMiLwqft4GcixnjqhGdCGqcXoPCLvMaAovQY2auEE5
         yuB8NjpC88tFroghw7EJfpz4kezlXkKHju36pDOVA81wBniLV42yq4NRMko5OiwuS60M
         TXoA==
X-Gm-Message-State: AFq9FYKaCJURcIe+c3p42LrCgWGTc5EXhsD7p2ZSWWn/e2+O6CvsvzEp
	WykJQPSOq8k7NTYSMB9qvPWA4NiI3WDyhfZqwgr4CLwV9pW2sV7wxjio81fDorzbqA8=
X-Gm-Gg: AYBFou17A3r+5yXFIrHciZRgWkUqfDvNPcsv1LkgartC9LIRMfnBWvzVjXkFGUBf6Uc
	yeXjLhdkDQgSeX/Z8RQbf2lEJZWCm5UFdNjy+D6njM1jmUmTe0AjvYc1ZyU2aVYjSnpZWiGcniq
	JKMMkwqszNevnjSForrcbTxq7jRnGJi7TgaPOcIeUxdVDHMGAKrTjn3uVLFpQEdjxYepL6cWFr0
	tMoitVOhG0wyj1VoGGE2ZY1pJl830Ow1LL0bEFlOn9YwSK1bc8Bv5oDNgn/BAu7EI+Zq61MSZvo
	FUA7Qd0knFsKZ06+1lpSIv7K81S96rLhNGMlQW0zPXexa4r8jSvnvWhIlVkjPnWkLhmX9OiX6lf
	+2WrK2G1qo9PeUYyCPAaN1fKuLLll77HxSjsrFg+J7lwC+4qpezP21BNeMlYwhjhiczI6wQgkSB
	YbA1gWRkZVyQ5QXag8NcsnzDkvu77BSfgDwPuiaHUS3pymtr8x6mO9TWA+M+ZPpVkWlvurOkzfB
	LThGQo4YZU45eh2IGKEjKVfyBzX8K4Nv1mly29ZBlgilbx8guTPInyOhOzQRFff6qBmzprLbJwl
	rs+B/1LYgtL2uHq0b66BnkfRiKUYUa9jmHJJ0DSHgqlS17bacXQSKhBZAEcNYEJPtLi3xi1cY1l
	+CFy5188uFGJ147VqLc7Y1wg6fr2L+UEHGSr4C0XrhnYkyTHXY4Zc0X3ursNAR05bjBoNdOYiUP
	1/15hd1gYYKOtw9ToLQDF0ubcSQVShxz+ZjjScGJiYZ8/lKqOkKQ7Y+UmkWGeV9YmetK7gYLfCX
	661bXLRQWl8pcpaOUCtj/bXQ4g2idwzKJzM7wn2WmbQEqyoOzzf9u3++CA2CgaWatQQsw9+iaJk
	ncUoBrdX7/+ql/T7uuqUaeEvGw==
X-Received: by 2002:a05:7301:d198:b0:360:db68:3264 with SMTP id 5a478bee46e88-36a42340756mr6437125eec.6.1793419083181;
        Fri, 30 Oct 2026 20:58:03 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a5fb97sm13687837eec.23.2026.10.30.20.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 20:58:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 09/10] kernel-selftest: Fix tests that fail on qemu
Date: Fri, 30 Oct 2026 20:57:46 -0700
Message-ID: <20261031035748.2130261-9-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261031035748.2130261-1-khem.raj@oss.qualcomm.com>
References: <20261031035748.2130261-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 31 Oct 2026 03:58:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131719
Content-Type: text/plain; charset="utf-8"

Add fixes for tests that fail on qemux86-64 because of bugs in the
tests, and make tests that fail when an optional kernel feature or
device is missing skip instead:

- core: unshare_test fails when fs.nr_open is at its maximum
- proc: proc-empty-vm treats pkey_alloc() ENOSPC as a failure, and
  read fails when a task exits while it walks /proc
- sched: cs_prctl_test is not installed from the output directory and
  fails without core scheduling
- gpio: gpio-mockup expects an empty range to be accepted, and
  gpio-cdev-uaf fails without CONFIG_GPIO_CDEV_V1
- splice: short_splice_read fails without test_module
- syscall_user_dispatch: sud_benchmark needs a frame pointer
- lsm: lsm_get_self_attr_test checks the wrong errno and
  lsm_list_modules_test fails without securityfs
- cgroup: test_cpu fails without CONFIG_CFS_BANDWIDTH
- binderfs: binderfs_stress fails without binderfs
- kvm: nx_huge_pages_test.sh fails without KVM
- watchdog: watchdog-test fails without a watchdog device
- net: udpgro_fwd.sh hangs the whole run without vxlan, and icmp.sh
  fails without tcpdump

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../kernel-selftest/kernel-selftest.bb        |  18 +++
 ...-skip-the-cpu.max-tests-without-CONF.patch |  69 ++++++++++
 ...ix-unshare_test-with-large-fs.nr_ope.patch |  82 +++++++++++
 ...stems-binderfs-skip-binderfs_stress-.patch |  65 +++++++++
 ...xpect-gpio-mockup-to-reject-an-empty.patch |  52 +++++++
 ...kip-the-gpio-cdev-uaf-v1-tests-witho.patch | 127 ++++++++++++++++++
 ...ip-nx_huge_pages_test.sh-without-KVM.patch |  36 +++++
 ...eck-lsm_get_self_attr-errno-before-a.patch |  45 +++++++
 ...ip-correct_lsm_list_modules-without-.patch |  33 +++++
 ...ftests-net-icmp-skip-without-tcpdump.patch |  30 +++++
 ...pgro_fwd-don-t-hang-when-the-iperf3-.patch |  33 +++++
 ...pgro_fwd-skip-the-UDP-tunnel-tests-w.patch |  52 +++++++
 ...roc-empty-vm-treat-pkey_alloc-ENOSPC.patch |  35 +++++
 ...ead-tolerate-tasks-exiting-during-th.patch |  70 ++++++++++
 ...install-cs_prctl_test-from-the-outpu.patch |  34 +++++
 ...skip-cs_prctl_test-when-core-schedul.patch |  55 ++++++++
 ...-skip-the-kernfs-checks-without-test.patch |  45 +++++++
 ...l_user_dispatch-build-sud_benchmark-.patch |  35 +++++
 ...og-skip-when-there-is-no-watchdog-de.patch |  46 +++++++
 19 files changed, 962 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-cgroup-skip-the-cpu.max-tests-without-CONF.patch
 create mode 100644 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-core-fix-unshare_test-with-large-fs.nr_ope.patch
 create mode 100644 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-filesystems-binderfs-skip-binderfs_stress-.patch
 create mode 100644 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-gpio-expect-gpio-mockup-to-reject-an-empty.patch
 create mode 100644 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-gpio-skip-the-gpio-cdev-uaf-v1-tests-witho.patch
 create mode 100644 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-kvm-skip-nx_huge_pages_test.sh-without-KVM.patch
 create mode 100644 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-lsm-check-lsm_get_self_attr-errno-before-a.patch
 create mode 100644 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-lsm-skip-correct_lsm_list_modules-without-.patch
 create mode 100644 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-net-icmp-skip-without-tcpdump.patch
 create mode 100644 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-net-udpgro_fwd-don-t-hang-when-the-iperf3-.patch
 create mode 100644 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-net-udpgro_fwd-skip-the-UDP-tunnel-tests-w.patch
 create mode 100644 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-proc-proc-empty-vm-treat-pkey_alloc-ENOSPC.patch
 create mode 100644 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-proc-read-tolerate-tasks-exiting-during-th.patch
 create mode 100644 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-sched-install-cs_prctl_test-from-the-outpu.patch
 create mode 100644 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-sched-skip-cs_prctl_test-when-core-schedul.patch
 create mode 100644 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-splice-skip-the-kernfs-checks-without-test.patch
 create mode 100644 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-syscall_user_dispatch-build-sud_benchmark-.patch
 create mode 100644 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-watchdog-skip-when-there-is-no-watchdog-de.patch

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
index b1266fe553..96b837fb20 100644
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -26,6 +26,24 @@ SRC_URI += "file://run-ptest \
             file://0001-selftests-filelock-fix-the-test-plan-count-in-ofdloc.patch \
             file://0001-selftests-cgroup-memcontrol-keep-anon-page-touches-f.patch \
             file://0001-selftests-filesystems-idmapped_tmpfile-chown-the-lay.patch \
+            file://0001-selftests-core-fix-unshare_test-with-large-fs.nr_ope.patch \
+            file://0001-selftests-proc-proc-empty-vm-treat-pkey_alloc-ENOSPC.patch \
+            file://0001-selftests-proc-read-tolerate-tasks-exiting-during-th.patch \
+            file://0001-selftests-sched-install-cs_prctl_test-from-the-outpu.patch \
+            file://0001-selftests-sched-skip-cs_prctl_test-when-core-schedul.patch \
+            file://0001-selftests-gpio-expect-gpio-mockup-to-reject-an-empty.patch \
+            file://0001-selftests-gpio-skip-the-gpio-cdev-uaf-v1-tests-witho.patch \
+            file://0001-selftests-splice-skip-the-kernfs-checks-without-test.patch \
+            file://0001-selftests-syscall_user_dispatch-build-sud_benchmark-.patch \
+            file://0001-selftests-lsm-check-lsm_get_self_attr-errno-before-a.patch \
+            file://0001-selftests-lsm-skip-correct_lsm_list_modules-without-.patch \
+            file://0001-selftests-cgroup-skip-the-cpu.max-tests-without-CONF.patch \
+            file://0001-selftests-filesystems-binderfs-skip-binderfs_stress-.patch \
+            file://0001-selftests-kvm-skip-nx_huge_pages_test.sh-without-KVM.patch \
+            file://0001-selftests-watchdog-skip-when-there-is-no-watchdog-de.patch \
+            file://0001-selftests-net-udpgro_fwd-don-t-hang-when-the-iperf3-.patch \
+            file://0001-selftests-net-udpgro_fwd-skip-the-UDP-tunnel-tests-w.patch \
+            file://0001-selftests-net-icmp-skip-without-tcpdump.patch \
             ${@bb.utils.contains('PACKAGECONFIG', 'mm', '${MM_PATCH}', '', d)} \
             "

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-cgroup-skip-the-cpu.max-tests-without-CONF.patch b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-cgroup-skip-the-cpu.max-tests-without-CONF.patch
new file mode 100644
index 0000000000..d879b8b846
--- /dev/null
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-cgroup-skip-the-cpu.max-tests-without-CONF.patch
@@ -0,0 +1,69 @@
+From 889f34043a639015b2f844801a6e83bd3eaafe32 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Fri, 30 Oct 2026 15:02:43 -0700
+Subject: [PATCH] selftests/cgroup: skip the cpu.max tests without
+ CONFIG_CFS_BANDWIDTH
+
+The cpu controller only provides cpu.max when the kernel is built with
+CONFIG_CFS_BANDWIDTH. Without it, test_cpucg_max and
+test_cpucg_max_nested fail to write the file and report a failure:
+
+  not ok 8 test_cpucg_max
+  not ok 9 test_cpucg_max_nested
+
+Skip both tests when cpu.max does not exist.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ tools/testing/selftests/cgroup/test_cpu.c | 14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+diff --git a/tools/testing/selftests/cgroup/test_cpu.c b/tools/testing/selftests/cgroup/test_cpu.c
+index 8f96bfd..5fbdd24 100644
+--- a/tools/testing/selftests/cgroup/test_cpu.c
++++ b/tools/testing/selftests/cgroup/test_cpu.c
+@@ -654,6 +654,7 @@ static int test_cpucg_max(const char *root)
+ 	long usage_usec, n_periods, remainder_usec, expected_usage_usec;
+ 	char *cpucg;
+ 	char quota_buf[32];
++	char buf[64];
+
+ 	snprintf(quota_buf, sizeof(quota_buf), "%ld", quota_usec);
+
+@@ -664,6 +665,12 @@ static int test_cpucg_max(const char *root)
+ 	if (cg_create(cpucg))
+ 		goto cleanup;
+
++	/* cpu.max needs CONFIG_CFS_BANDWIDTH */
++	if (cg_read(cpucg, "cpu.max", buf, sizeof(buf))) {
++		ret = KSFT_SKIP;
++		goto cleanup;
++	}
++
+ 	if (cg_write(cpucg, "cpu.max", quota_buf))
+ 		goto cleanup;
+
+@@ -718,6 +725,7 @@ static int test_cpucg_max_nested(const char *root)
+ 	long usage_usec, n_periods, remainder_usec, expected_usage_usec;
+ 	char *parent, *child;
+ 	char quota_buf[32];
++	char buf[64];
+
+ 	snprintf(quota_buf, sizeof(quota_buf), "%ld", quota_usec);
+
+@@ -735,6 +743,12 @@ static int test_cpucg_max_nested(const char *root)
+ 	if (cg_create(child))
+ 		goto cleanup;
+
++	/* cpu.max needs CONFIG_CFS_BANDWIDTH */
++	if (cg_read(parent, "cpu.max", buf, sizeof(buf))) {
++		ret = KSFT_SKIP;
++		goto cleanup;
++	}
++
+ 	if (cg_write(parent, "cpu.max", quota_buf))
+ 		goto cleanup;
+
+--
+2.0
diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-core-fix-unshare_test-with-large-fs.nr_ope.patch b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-core-fix-unshare_test-with-large-fs.nr_ope.patch
new file mode 100644
index 0000000000..f501ca11b8
--- /dev/null
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-core-fix-unshare_test-with-large-fs.nr_ope.patch
@@ -0,0 +1,82 @@
+From df0b7e0ea59c43708cff8c7e34da5e2f8d430e5e Mon Sep 17 00:00:00 2001
+From: Konstantin Khorenko <khorenko@virtuozzo.com>
+Date: Fri, 14 Aug 2026 18:57:09 +0200
+Subject: [PATCH] selftests/core: fix unshare_test with large fs.nr_open
+
+The test assumes fs.nr_open is close to the default 1048576, but some
+systems set it much higher (e.g.  1073741816).  This is systemd's doing:
+since systemd v240 (2018), PID 1 bumps fs.nr_open and fs.file-max to their
+largest possible values on boot, as file descriptors are already accounted
+for by memcg [1].
+
+In that case, dup2() to nr_open + 64 requires the kernel to allocate a
+file descriptor table with ~1 billion entries, which fails with ENOMEM.
+
+On a kernel that already carries 04a2c4b4511d1, dup2() no longer fails
+with ENOMEM.  The allocation is now rejected up front and the caller
+gets EMFILE instead, without the WARNING, but the test still fails.
+
+Cap the nr_open value used for the test's own arithmetic to a known
+reasonable base value (1048576) and restore the true original value once
+the test has completed.
+
+Link: https://lore.kernel.org/20260814165709.513263-1-khorenko@virtuozzo.com
+Link: https://github.com/systemd/systemd/commit/a8b627aaed409a15260c25988970c795bf963812 [1]
+Upstream-Status: Backport [https://git.kernel.org/torvalds/c/df0b7e0ea59c]
+Signed-off-by: Konstantin Khorenko <khorenko@virtuozzo.com>
+Signed-off-by: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Cc: Shuah Khan <shuah@kernel.org>
+Cc: Wei Yang <richard.weiyang@gmail.com>
+Cc: <stable@vger.kernel.org>
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ tools/testing/selftests/core/unshare_test.c | 19 +++++++++++++++++--
+ 1 file changed, 17 insertions(+), 2 deletions(-)
+
+diff --git a/tools/testing/selftests/core/unshare_test.c b/tools/testing/selftests/core/unshare_test.c
+index ffce75a6c228..d40e963dd520 100644
+--- a/tools/testing/selftests/core/unshare_test.c
++++ b/tools/testing/selftests/core/unshare_test.c
+@@ -40,6 +40,14 @@ TEST(unshare_EMFILE)
+
+ 	ASSERT_EQ(sscanf(buf, "%d", &nr_open), 1);
+
++	/*
++	 * Cap nr_open for the duration of the test to avoid ENOMEM from a
++	 * huge fd table allocation; buf/n keep the real original value so
++	 * fs.nr_open can be restored to it once the test is done.
++	 */
++	if (nr_open > 1024 * 1024)
++		nr_open = 1024 * 1024;
++
+ 	ASSERT_EQ(0, getrlimit(RLIMIT_NOFILE, &rlimit));
+
+ 	/* bump fs.nr_open */
+@@ -73,10 +81,13 @@ TEST(unshare_EMFILE)
+
+ 	if (pid == 0) {
+ 		int err;
++		char buf3[32];
++		ssize_t n3;
+
+-		/* restore fs.nr_open */
++		/* restore fs.nr_open to the (possibly capped) test baseline */
++		n3 = sprintf(buf3, "%d\n", nr_open);
+ 		lseek(fd, 0, SEEK_SET);
+-		write(fd, buf, n);
++		write(fd, buf3, n3);
+ 		/* ... and now unshare(CLONE_FILES) must fail with EMFILE */
+ 		err = unshare(CLONE_FILES);
+ 		EXPECT_EQ(err, -1)
+@@ -89,6 +100,10 @@ TEST(unshare_EMFILE)
+ 	EXPECT_EQ(waitpid(pid, &status, 0), pid);
+ 	EXPECT_EQ(true, WIFEXITED(status));
+ 	EXPECT_EQ(0, WEXITSTATUS(status));
++
++	/* restore the real fs.nr_open value */
++	lseek(fd, 0, SEEK_SET);
++	write(fd, buf, n);
+ }
+
+ TEST_HARNESS_MAIN
diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-filesystems-binderfs-skip-binderfs_stress-.patch b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-filesystems-binderfs-skip-binderfs_stress-.patch
new file mode 100644
index 0000000000..5cdfa080da
--- /dev/null
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-filesystems-binderfs-skip-binderfs_stress-.patch
@@ -0,0 +1,65 @@
+From 35b394922e4f715f31a2a7361adf38f32c00ddaf Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Fri, 30 Oct 2026 15:03:06 -0700
+Subject: [PATCH] selftests/filesystems/binderfs: skip binderfs_stress
+ without binderfs
+
+binderfs_test_privileged and binderfs_test_unprivileged skip when the
+kernel has no binderfs, but binderfs_stress mounts it in a child process
+and fails:
+
+  binderfs_test.c:417:binderfs_stress:No such device - Failed to mount binderfs, ...
+  binderfs_test.c:491:binderfs_stress:wait_for_pid() failed
+  not ok 1 global.binderfs_stress
+
+Check /proc/filesystems first and skip the test if binderfs is not
+available.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ .../filesystems/binderfs/binderfs_test.c      | 24 +++++++++++++++++++
+ 1 file changed, 24 insertions(+)
+
+diff --git a/tools/testing/selftests/filesystems/binderfs/binderfs_test.c b/tools/testing/selftests/filesystems/binderfs/binderfs_test.c
+index cd82c89f558f..913102d3c620 100644
+--- a/tools/testing/selftests/filesystems/binderfs/binderfs_test.c
++++ b/tools/testing/selftests/filesystems/binderfs/binderfs_test.c
+@@ -36,6 +36,27 @@
+ 		fd = -EBADF;        \
+ 	}
+
++static bool binderfs_supported(void)
++{
++	char line[256];
++	bool found = false;
++	FILE *f;
++
++	f = fopen("/proc/filesystems", "re");
++	if (!f)
++		return false;
++
++	while (fgets(line, sizeof(line), f)) {
++		if (!strcmp(line, "nodev\tbinder\n")) {
++			found = true;
++			break;
++		}
++	}
++	fclose(f);
++
++	return found;
++}
++
+ static void change_mountns(struct __test_metadata *_metadata)
+ {
+ 	int ret;
+@@ -388,6 +409,9 @@ TEST(binderfs_stress)
+ 	char binderfs_mntpt[] = P_tmpdir "/binderfs_XXXXXX",
+ 		device_path[sizeof(P_tmpdir "/binderfs_XXXXXX/") + BINDERFS_MAX_NAME];
+
++	if (!binderfs_supported())
++		SKIP(return, "The Android binderfs filesystem is not available");
++
+ 	ret = socketpair(PF_LOCAL, SOCK_STREAM | SOCK_CLOEXEC, 0, syncfds);
+ 	ASSERT_EQ(ret, 0) {
+ 		TH_LOG("%s - Failed to create socket pair", strerror(errno));
diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-gpio-expect-gpio-mockup-to-reject-an-empty.patch b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-gpio-expect-gpio-mockup-to-reject-an-empty.patch
new file mode 100644
index 0000000000..d7127eb5d4
--- /dev/null
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-gpio-expect-gpio-mockup-to-reject-an-empty.patch
@@ -0,0 +1,52 @@
+From d033bebce48e7900680e325789e1b55186a7cc04 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Fri, 30 Oct 2026 14:57:35 -0700
+Subject: [PATCH] selftests/gpio: expect gpio-mockup to reject an empty
+ range
+
+Since commit 446e8c31d0fc ("gpio: mockup: reject invalid
+gpio_mockup_ranges widths") the module refuses to load with a zero-width
+range, but the "no lines defined" test still expects it to load and
+create no gpiochips:
+
+  2.1 no lines defined
+  test failed: insert gpio-mockup failed with error 1
+
+Check that the module load fails instead.
+
+Fixes: 446e8c31d0fc ("gpio: mockup: reject invalid gpio_mockup_ranges widths")
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ tools/testing/selftests/gpio/gpio-mockup.sh | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/tools/testing/selftests/gpio/gpio-mockup.sh b/tools/testing/selftests/gpio/gpio-mockup.sh
+index fc2dd4c24d06..51856c9ad7e1 100755
+--- a/tools/testing/selftests/gpio/gpio-mockup.sh
++++ b/tools/testing/selftests/gpio/gpio-mockup.sh
+@@ -271,6 +271,15 @@ test_no_line()
+ 	[ ! -e "$GPIO_DEBUGFS/$1/$2" ] || fail "unexpected line $1:$2"
+ }
+
++# Check that loading the module with the gpio_mockup_ranges parameter $1 fails.
++insmod_fail_test()
++{
++	if modprobe -q $module "gpio_mockup_ranges=$1"; then
++		remove_module
++		fail "insert $module with ranges <$1> should fail"
++	fi
++}
++
+ # Load the module and check that the expected number of gpiochips, with the
+ # expected number of lines, are created and are functional.
+ #
+@@ -378,7 +387,7 @@ if [ "$full_test" ]; then
+ fi
+ echo "2.  Module load error tests"
+ echo "2.1 no lines defined"
+-insmod_test "0,0"
++insmod_fail_test "0,0"
+ if [ "$full_test" ]; then
+ 	echo "2.2 ignore range overlap"
+ 	insmod_test "0,32,0,1" 32
diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-gpio-skip-the-gpio-cdev-uaf-v1-tests-witho.patch b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-gpio-skip-the-gpio-cdev-uaf-v1-tests-witho.patch
new file mode 100644
index 0000000000..3dc56419b6
--- /dev/null
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-gpio-skip-the-gpio-cdev-uaf-v1-tests-witho.patch
@@ -0,0 +1,127 @@
+From 192a749bd2e9ca16fd709a48636239955c169291 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Fri, 30 Oct 2026 15:10:03 -0700
+Subject: [PATCH] selftests/gpio: skip the gpio-cdev-uaf v1 tests without
+ CONFIG_GPIO_CDEV_V1
+
+The linehandle and lineevent tests use GPIO_GET_LINEHANDLE_IOCTL and
+GPIO_GET_LINEEVENT_IOCTL, which the kernel only provides with
+CONFIG_GPIO_CDEV_V1. Without it they fail with EINVAL and the whole test
+fails:
+
+  failed to get handle FD
+  failed to test handle ioctl
+  GPIO gpio-cdev-uaf test FAIL
+
+Exit with KSFT_SKIP in that case and let the script carry on with the
+uAPI v2 tests.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ tools/testing/selftests/gpio/gpio-cdev-uaf.c  | 20 ++++++++++++++----
+ tools/testing/selftests/gpio/gpio-cdev-uaf.sh | 21 +++++++++++++++----
+ 2 files changed, 33 insertions(+), 8 deletions(-)
+
+diff --git a/tools/testing/selftests/gpio/gpio-cdev-uaf.c b/tools/testing/selftests/gpio/gpio-cdev-uaf.c
+index 765d3cc4f0ef..ef81e5c2b8be 100644
+--- a/tools/testing/selftests/gpio/gpio-cdev-uaf.c
++++ b/tools/testing/selftests/gpio/gpio-cdev-uaf.c
+@@ -17,6 +17,8 @@
+ #include <sys/types.h>
+ #include <unistd.h>
+
++#include "kselftest.h"
++
+ #define CONFIGFS_DIR "/sys/kernel/config/gpio-sim"
+ #define PROCFS_DIR "/proc"
+
+@@ -201,7 +203,7 @@ static int test_ioctl(int fd)
+
+ int main(int argc, char **argv)
+ {
+-	int cfd, fd, ret;
++	int cfd, fd, ret = EXIT_FAILURE;
+ 	int (*test_func)(int);
+
+ 	if (argc != 3) {
+@@ -249,7 +251,12 @@ int main(int argc, char **argv)
+
+ 		req.lines = 1;
+ 		if (ioctl(cfd, GPIO_GET_LINEHANDLE_IOCTL, &req) == -1) {
+-			fprintf(stderr, "failed to get handle FD\n");
++			if (errno == EINVAL) {
++				ret = KSFT_SKIP;
++				fprintf(stderr, "GPIO uAPI v1 is not available\n");
++			} else {
++				fprintf(stderr, "failed to get handle FD\n");
++			}
+ 			goto err_close_chip;
+ 		}
+
+@@ -259,7 +266,12 @@ int main(int argc, char **argv)
+ 		struct gpioevent_request req = {0};
+
+ 		if (ioctl(cfd, GPIO_GET_LINEEVENT_IOCTL, &req) == -1) {
+-			fprintf(stderr, "failed to get event FD\n");
++			if (errno == EINVAL) {
++				ret = KSFT_SKIP;
++				fprintf(stderr, "GPIO uAPI v1 is not available\n");
++			} else {
++				fprintf(stderr, "failed to get event FD\n");
++			}
+ 			goto err_close_chip;
+ 		}
+
+@@ -288,5 +300,5 @@ int main(int argc, char **argv)
+ err_close_chip:
+ 	close(cfd);
+ 	close_chip("chip", "bank");
+-	return EXIT_FAILURE;
++	return ret;
+ }
+diff --git a/tools/testing/selftests/gpio/gpio-cdev-uaf.sh b/tools/testing/selftests/gpio/gpio-cdev-uaf.sh
+index 6e47533019cf..dd7c702af873 100755
+--- a/tools/testing/selftests/gpio/gpio-cdev-uaf.sh
++++ b/tools/testing/selftests/gpio/gpio-cdev-uaf.sh
+@@ -17,6 +17,19 @@ skip() {
+ 	exit 4
+ }
+
++# The linehandle and lineevent tests need the GPIO uAPI v1
++# (CONFIG_GPIO_CDEV_V1); gpio-cdev-uaf exits with 4 if it is not available.
++test_v1() {
++	$BASE_DIR/gpio-cdev-uaf $1 $2
++	case $? in
++	0|4)
++		;;
++	*)
++		fail "failed to test $1 $2"
++		;;
++	esac
++}
++
+ # Load the gpio-sim module. This will pull in configfs if needed too.
+ modprobe gpio-sim || skip "unable to load the gpio-sim module"
+ # Make sure configfs is mounted at /sys/kernel/config. Wait a bit if needed.
+@@ -40,16 +53,16 @@ $BASE_DIR/gpio-cdev-uaf chip ioctl || fail "failed to test chip ioctl"
+ echo "2. linehandle"
+
+ echo "2.1. ioctl"
+-$BASE_DIR/gpio-cdev-uaf handle ioctl || fail "failed to test handle ioctl"
++test_v1 handle ioctl
+
+ echo "3. lineevent"
+
+ echo "3.1. read"
+-$BASE_DIR/gpio-cdev-uaf event read || fail "failed to test event read"
++test_v1 event read
+ echo "3.2. poll"
+-$BASE_DIR/gpio-cdev-uaf event poll || fail "failed to test event poll"
++test_v1 event poll
+ echo "3.3. ioctl"
+-$BASE_DIR/gpio-cdev-uaf event ioctl || fail "failed to test event ioctl"
++test_v1 event ioctl
+
+ echo "4. linereq"
+
diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-kvm-skip-nx_huge_pages_test.sh-without-KVM.patch b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-kvm-skip-nx_huge_pages_test.sh-without-KVM.patch
new file mode 100644
index 0000000000..b67d03f06c
--- /dev/null
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-kvm-skip-nx_huge_pages_test.sh-without-KVM.patch
@@ -0,0 +1,36 @@
+From f5789245c843627b4982f3ded204186b4914dedb Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Fri, 30 Oct 2026 15:03:17 -0700
+Subject: [PATCH] selftests/kvm: skip nx_huge_pages_test.sh without KVM
+
+The script reads the kvm module parameters with "set -e" in effect, so on
+a kernel without KVM it exits with an error instead of skipping:
+
+  cat: /sys/module/kvm/parameters/nx_huge_pages: No such file or directory
+  not ok 1 selftests: kvm: nx_huge_pages_test.sh # exit=1
+
+The other KVM tests skip when /dev/kvm is missing. Skip this one as well
+when the nx_huge_pages parameter does not exist.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ tools/testing/selftests/kvm/x86/nx_huge_pages_test.sh | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/tools/testing/selftests/kvm/x86/nx_huge_pages_test.sh b/tools/testing/selftests/kvm/x86/nx_huge_pages_test.sh
+index caad084b8bfd..0bacd025b601 100755
+--- a/tools/testing/selftests/kvm/x86/nx_huge_pages_test.sh
++++ b/tools/testing/selftests/kvm/x86/nx_huge_pages_test.sh
+@@ -8,6 +8,11 @@
+
+ set -e
+
++if [ ! -f /sys/module/kvm/parameters/nx_huge_pages ]; then
++	echo "KVM is not available"
++	exit 4 # KSFT_SKIP=4
++fi
++
+ NX_HUGE_PAGES=$(cat /sys/module/kvm/parameters/nx_huge_pages)
+ NX_HUGE_PAGES_RECOVERY_RATIO=$(cat /sys/module/kvm/parameters/nx_huge_pages_recovery_ratio)
+ NX_HUGE_PAGES_RECOVERY_PERIOD=$(cat /sys/module/kvm/parameters/nx_huge_pages_recovery_period_ms)
diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-lsm-check-lsm_get_self_attr-errno-before-a.patch b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-lsm-check-lsm_get_self_attr-errno-before-a.patch
new file mode 100644
index 0000000000..2bd5b1bfbc
--- /dev/null
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-lsm-check-lsm_get_self_attr-errno-before-a.patch
@@ -0,0 +1,45 @@
+From 90d24deaa365d597ffba9ae2db5fa27209ce5402 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Fri, 30 Oct 2026 15:01:15 -0700
+Subject: [PATCH] selftests/lsm: check lsm_get_self_attr() errno before
+ attr_lsm_count()
+
+size_too_small_lsm_get_self_attr checks errno after calling
+attr_lsm_count(), which reads /sys/kernel/security/lsm with fopen().
+Without securityfs mounted the fopen() fails, errno becomes ENOENT, and
+the test fails even though the syscall returned the expected error:
+
+  lsm_get_self_attr_test.c:68:size_too_small_lsm_get_self_attr:Expected EOPNOTSUPP (95) == errno (2)
+
+Save errno right after the syscall.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ tools/testing/selftests/lsm/lsm_get_self_attr_test.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/tools/testing/selftests/lsm/lsm_get_self_attr_test.c b/tools/testing/selftests/lsm/lsm_get_self_attr_test.c
+index 60caf8528f81..14c01b1b626c 100644
+--- a/tools/testing/selftests/lsm/lsm_get_self_attr_test.c
++++ b/tools/testing/selftests/lsm/lsm_get_self_attr_test.c
+@@ -58,14 +58,17 @@ TEST(size_too_small_lsm_get_self_attr)
+ 	const long page_size = sysconf(_SC_PAGESIZE);
+ 	struct lsm_ctx *ctx = calloc(page_size, 1);
+ 	__u32 size = 1;
++	int err;
+
+ 	ASSERT_NE(NULL, ctx);
+ 	errno = 0;
+ 	ASSERT_EQ(-1, lsm_get_self_attr(LSM_ATTR_CURRENT, ctx, &size, 0));
++	/* attr_lsm_count() can change errno */
++	err = errno;
+ 	if (attr_lsm_count()) {
+-		ASSERT_EQ(E2BIG, errno);
++		ASSERT_EQ(E2BIG, err);
+ 	} else {
+-		ASSERT_EQ(EOPNOTSUPP, errno);
++		ASSERT_EQ(EOPNOTSUPP, err);
+ 	}
+ 	ASSERT_NE(1, size);
+
diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-lsm-skip-correct_lsm_list_modules-without-.patch b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-lsm-skip-correct_lsm_list_modules-without-.patch
new file mode 100644
index 0000000000..a6eeb5dbf5
--- /dev/null
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-lsm-skip-correct_lsm_list_modules-without-.patch
@@ -0,0 +1,33 @@
+From aec608f3643722f98098618f72fcc3c75a14c407 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Fri, 30 Oct 2026 15:01:22 -0700
+Subject: [PATCH] selftests/lsm: skip correct_lsm_list_modules without
+ securityfs
+
+correct_lsm_list_modules compares the lsm_list_modules() result with
+/sys/kernel/security/lsm. When the kernel is built without
+CONFIG_SECURITYFS that file does not exist and the test fails:
+
+  lsm_list_modules_test.c:85:correct_lsm_list_modules:Expected 0 (0) == read_sysfs_lsms(sysfs_lsms, page_size) (-1)
+
+Skip the test in that case.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ tools/testing/selftests/lsm/lsm_list_modules_test.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/tools/testing/selftests/lsm/lsm_list_modules_test.c b/tools/testing/selftests/lsm/lsm_list_modules_test.c
+index 54d59044ace1..f5108c0eb99e 100644
+--- a/tools/testing/selftests/lsm/lsm_list_modules_test.c
++++ b/tools/testing/selftests/lsm/lsm_list_modules_test.c
+@@ -82,6 +82,8 @@ TEST(correct_lsm_list_modules)
+
+ 	ASSERT_NE(NULL, sysfs_lsms);
+ 	ASSERT_NE(NULL, syscall_lsms);
++	if (access("/sys/kernel/security/lsm", R_OK))
++		SKIP(return, "/sys/kernel/security/lsm is not available");
+ 	ASSERT_EQ(0, read_sysfs_lsms(sysfs_lsms, page_size));
+
+ 	count = lsm_list_modules(syscall_lsms, &size, 0);
diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-net-icmp-skip-without-tcpdump.patch b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-net-icmp-skip-without-tcpdump.patch
new file mode 100644
index 0000000000..ea03ad4f65
--- /dev/null
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-net-icmp-skip-without-tcpdump.patch
@@ -0,0 +1,30 @@
+From bd02c9f9ff8b78eada28d6d6c8a23b0d044d10ba Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Fri, 30 Oct 2026 17:19:28 -0700
+Subject: [PATCH] selftests: net: icmp: skip without tcpdump
+
+icmp.sh captures the ICMP reply with tcpdump. Without it the capture
+file stays empty and the test fails with "got ICMP response from ,
+should be 192.0.0.8".
+
+Skip the test when tcpdump is not installed.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ tools/testing/selftests/net/icmp.sh | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/tools/testing/selftests/net/icmp.sh b/tools/testing/selftests/net/icmp.sh
+index 0714e8b34d12..eff9da3238b4 100755
+--- a/tools/testing/selftests/net/icmp.sh
++++ b/tools/testing/selftests/net/icmp.sh
+@@ -20,6 +20,8 @@
+
+ source lib.sh
+
++require_command tcpdump
++
+ H1_IP=172.16.0.1/32
+ H1_IP6=2001:db8:1::1
+ RT1=172.16.1.0/24
diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-net-udpgro_fwd-don-t-hang-when-the-iperf3-.patch b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-net-udpgro_fwd-don-t-hang-when-the-iperf3-.patch
new file mode 100644
index 0000000000..a02319ff90
--- /dev/null
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-net-udpgro_fwd-don-t-hang-when-the-iperf3-.patch
@@ -0,0 +1,33 @@
+From c0649196a87bf5d80336ba9ff703f06c8e50d954 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Fri, 30 Oct 2026 16:51:47 -0700
+Subject: [PATCH] selftests: net: udpgro_fwd: don't hang when the iperf3
+ client fails
+
+run_test_csum() starts a one-shot iperf3 server and waits for it after
+running the client. If the client can't connect, e.g. because the vxlan
+devices could not be created, the server never gets a client and the
+test blocks in wait until the kselftest timeout kills it.
+
+Kill the server when the client fails, so the test reports the failure
+and moves on.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ tools/testing/selftests/net/udpgro_fwd.sh | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/tools/testing/selftests/net/udpgro_fwd.sh b/tools/testing/selftests/net/udpgro_fwd.sh
+index 9b722c1e4b0f..854b65c752e9 100755
+--- a/tools/testing/selftests/net/udpgro_fwd.sh
++++ b/tools/testing/selftests/net/udpgro_fwd.sh
+@@ -177,6 +177,8 @@ run_test_csum() {
+ 	local spid="$!"
+ 	ip netns exec "$NS_SRC" iperf3 -c "$dst" -t 2 >/dev/null
+ 	local retc="$?"
++	# the server only exits after serving a client
++	[ "$retc" -ne 0 ] && kill "$spid" 2>/dev/null
+ 	wait "$spid"
+ 	local rets="$?"
+ 	if [ "$rets" -ne 0 ] || [ "$retc" -ne 0 ]; then
diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-net-udpgro_fwd-skip-the-UDP-tunnel-tests-w.patch b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-net-udpgro_fwd-skip-the-UDP-tunnel-tests-w.patch
new file mode 100644
index 0000000000..c30135498b
--- /dev/null
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-net-udpgro_fwd-skip-the-UDP-tunnel-tests-w.patch
@@ -0,0 +1,52 @@
+From 7b89e7979ca943a760a87943fa9e26a459ad5457 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Fri, 30 Oct 2026 16:52:35 -0700
+Subject: [PATCH] selftests: net: udpgro_fwd: skip the UDP tunnel tests
+ without vxlan
+
+The last three tests of each address family run over a vxlan tunnel.
+When the kernel can't create vxlan devices they can't pass, and before
+the previous fix they hung the whole test.
+
+Probe for vxlan support once and report those tests as skipped when it
+is missing.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ tools/testing/selftests/net/udpgro_fwd.sh | 15 +++++++++++++++
+ 1 file changed, 15 insertions(+)
+
+diff --git a/tools/testing/selftests/net/udpgro_fwd.sh b/tools/testing/selftests/net/udpgro_fwd.sh
+index 854b65c752e9..839170257230 100755
+--- a/tools/testing/selftests/net/udpgro_fwd.sh
++++ b/tools/testing/selftests/net/udpgro_fwd.sh
+@@ -227,6 +227,13 @@ run_bench() {
+ 	fi
+ }
+
++# the UDP tunnel tests need vxlan support in the kernel
++have_vxlan=yes
++ip netns add "$BASE"
++ip -n "$BASE" link add dev vxlan_probe type vxlan id 1 dstport 4789 \
++	2>/dev/null || have_vxlan=no
++ip netns del "$BASE"
++
+ for family in 4 6; do
+ 	BM_NET=$BM_NET_V4
+ 	OL_NET=$OL_NET_V4
+@@ -276,6 +283,14 @@ for family in 4 6; do
+ 	run_bench "UDP GRO fwd perf" $BM_NET$DST
+ 	cleanup
+
++	if [ "$have_vxlan" = no ]; then
++		for msg in "GRO frag list over UDP tunnel" \
++			   "GRO fwd over UDP tunnel" "GSO after GRO"; do
++			printf "%-40s skip - vxlan not supported\n" "$msg"
++		done
++		continue
++	fi
++
+ 	create_vxlan_pair
+ 	ip netns exec $NS_DST ethtool -K veth$DST generic-receive-offload on
+ 	ip netns exec $NS_DST ethtool -K veth$DST rx-gro-list on
diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-proc-proc-empty-vm-treat-pkey_alloc-ENOSPC.patch b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-proc-proc-empty-vm-treat-pkey_alloc-ENOSPC.patch
new file mode 100644
index 0000000000..e1f1484ef1
--- /dev/null
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-proc-proc-empty-vm-treat-pkey_alloc-ENOSPC.patch
@@ -0,0 +1,35 @@
+From d41aa0d89994e56d629a4f22526c3310e0b1a6ae Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Fri, 30 Oct 2026 14:51:52 -0700
+Subject: [PATCH] selftests/proc: proc-empty-vm: treat pkey_alloc()
+ ENOSPC as no pkey support
+
+On x86, mm_pkey_alloc() returns -1 when OSPKE is not enabled, which
+pkey_alloc() reports as ENOSPC. This happens on any CPU without PKU, for
+example QEMU's Skylake-Client model, and with nopku, and the test then
+bails out before checking anything:
+
+  protection_key_support: error: rv -1, errno 28
+
+Treat ENOSPC the same as the other "not supported" errors.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ tools/testing/selftests/proc/proc-empty-vm.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/tools/testing/selftests/proc/proc-empty-vm.c b/tools/testing/selftests/proc/proc-empty-vm.c
+index b3f898aab4ab..cc619539e336 100644
+--- a/tools/testing/selftests/proc/proc-empty-vm.c
++++ b/tools/testing/selftests/proc/proc-empty-vm.c
+@@ -77,6 +77,9 @@ static int protection_key_support(void)
+ 	} else if (rv == -1 && errno == EINVAL) {
+ 		// ospke=n
+ 		return 0;
++	} else if (rv == -1 && errno == ENOSPC) {
++		// ospke=n on x86 since mm_pkey_alloc() checks arch_pkeys_enabled()
++		return 0;
+ 	} else {
+ 		fprintf(stderr, "%s: error: rv %ld, errno %d\n", __func__, rv, errno);
+ 		exit(EXIT_FAILURE);
diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-proc-read-tolerate-tasks-exiting-during-th.patch b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-proc-read-tolerate-tasks-exiting-during-th.patch
new file mode 100644
index 0000000000..0571b8ae3d
--- /dev/null
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-proc-read-tolerate-tasks-exiting-during-th.patch
@@ -0,0 +1,70 @@
+From bfc5fb89d1ec500baf6fecfb2affb9e729166509 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Fri, 30 Oct 2026 14:52:54 -0700
+Subject: [PATCH] selftests/proc: read: tolerate tasks exiting during the
+ walk
+
+The test walks all of /proc, including the directories of other tasks.
+If one of them exits in the middle of the walk, reading its directories
+fails: proc_pident_readdir() and friends return ENOENT for a dead task,
+and proc_tgid_net_readdir() returns EINVAL once the task's network
+namespace can't be found. xreaddir() asserts on any error:
+
+  read: proc.h:49: xreaddir: Assertion `de || errno == 0' failed.
+
+Any short-lived process on the system, like systemd's userdbd workers,
+makes the test fail randomly. Treat those errors as the end of the
+directory.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ tools/testing/selftests/proc/read.c | 25 ++++++++++++++++++++++---
+ 1 file changed, 22 insertions(+), 3 deletions(-)
+
+diff --git a/tools/testing/selftests/proc/read.c b/tools/testing/selftests/proc/read.c
+index 35ee78dff144..e8b1f6feb1ba 100644
+--- a/tools/testing/selftests/proc/read.c
++++ b/tools/testing/selftests/proc/read.c
+@@ -74,19 +74,38 @@ static void f_lnk(DIR *d, const char *filename)
+ 	assert((0 <= rv && rv <= sizeof(buf)) || rv == -1);
+ }
+
++/*
++ * Like xreaddir(), but a task can exit while its /proc/PID directory is
++ * being walked. Reading its directories then fails with ENOENT, or with
++ * EINVAL for /proc/PID/net, which ends the directory.
++ */
++static struct dirent *xreaddir_task(DIR *d)
++{
++	struct dirent *de;
++
++	errno = 0;
++	de = readdir(d);
++	assert(de || errno == 0 || errno == ENOENT || errno == EINVAL);
++	return de;
++}
++
+ static void f(DIR *d, unsigned int level)
+ {
+ 	struct dirent *de;
+
+-	de = xreaddir(d);
++	de = xreaddir_task(d);
++	if (!de)
++		return;
+ 	assert(de->d_type == DT_DIR);
+ 	assert(streq(de->d_name, "."));
+
+-	de = xreaddir(d);
++	de = xreaddir_task(d);
++	if (!de)
++		return;
+ 	assert(de->d_type == DT_DIR);
+ 	assert(streq(de->d_name, ".."));
+
+-	while ((de = xreaddir(d))) {
++	while ((de = xreaddir_task(d))) {
+ 		assert(!streq(de->d_name, "."));
+ 		assert(!streq(de->d_name, ".."));
+
diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-sched-install-cs_prctl_test-from-the-outpu.patch b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-sched-install-cs_prctl_test-from-the-outpu.patch
new file mode 100644
index 0000000000..532f99f3bf
--- /dev/null
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-sched-install-cs_prctl_test-from-the-outpu.patch
@@ -0,0 +1,34 @@
+From a24b4ff5908c55fa77e1c63192769d8b0449c82d Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Fri, 30 Oct 2026 14:56:28 -0700
+Subject: [PATCH] selftests/sched: install cs_prctl_test from the output
+ directory
+
+cs_prctl_test is built, so it belongs in TEST_GEN_PROGS. Listing it in
+TEST_PROGS makes "make install" copy it from the source directory, which
+only works for in-tree builds. With O= the binary is in the output
+directory and nothing gets installed:
+
+  rsync: [sender] link_stat ".../selftests/sched/cs_prctl_test" failed: No such file or directory (2)
+
+and run_kselftest.sh then reports "file cs_prctl_test is missing".
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ tools/testing/selftests/sched/Makefile | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/tools/testing/selftests/sched/Makefile b/tools/testing/selftests/sched/Makefile
+index 099ee9213557..f5228cfd3eb6 100644
+--- a/tools/testing/selftests/sched/Makefile
++++ b/tools/testing/selftests/sched/Makefile
+@@ -8,7 +8,6 @@ CFLAGS += -O2 -Wall -g -I./ $(KHDR_INCLUDES) -Wl,-rpath=./ \
+ 	  $(CLANG_FLAGS)
+ LDLIBS += -lpthread
+
+-TEST_GEN_FILES := cs_prctl_test
+-TEST_PROGS := cs_prctl_test
++TEST_GEN_PROGS := cs_prctl_test
+
+ include ../lib.mk
diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-sched-skip-cs_prctl_test-when-core-schedul.patch b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-sched-skip-cs_prctl_test-when-core-schedul.patch
new file mode 100644
index 0000000000..2ac9cc450e
--- /dev/null
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-sched-skip-cs_prctl_test-when-core-schedul.patch
@@ -0,0 +1,55 @@
+From 36be863d675f80ed11b96a87ebecb08c65904d4f Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Fri, 30 Oct 2026 14:56:28 -0700
+Subject: [PATCH] selftests/sched: skip cs_prctl_test when core
+ scheduling is unavailable
+
+PR_SCHED_CORE fails with EINVAL when the kernel is built without
+CONFIG_SCHED_CORE, and with ENODEV when SMT is not active, e.g. in a VM
+without SMT siblings. The test then fails on its first prctl() call:
+
+  -1 = prctl(62, 1, 0, 2, 0)
+  (cs_prctl_test.c:287) -
+
+Probe for core scheduling first and skip the test if it is unavailable.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ tools/testing/selftests/sched/cs_prctl_test.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/tools/testing/selftests/sched/cs_prctl_test.c b/tools/testing/selftests/sched/cs_prctl_test.c
+index 52d97fae4dbd..e504138cf632 100644
+--- a/tools/testing/selftests/sched/cs_prctl_test.c
++++ b/tools/testing/selftests/sched/cs_prctl_test.c
+@@ -32,6 +32,8 @@
+ #include <stdlib.h>
+ #include <string.h>
+
++#include "kselftest.h"
++
+ #if __GLIBC_PREREQ(2, 30) == 0
+ #include <sys/syscall.h>
+ static pid_t gettid(void)
+@@ -231,6 +233,7 @@ void _validate(int line, int val, char *msg)
+
+ int main(int argc, char *argv[])
+ {
++	unsigned long cookie;
+ 	int keypress = 0;
+ 	int num_threads = 3;
+ 	int delay = 0;
+@@ -270,6 +273,12 @@ int main(int argc, char *argv[])
+ 	if (keypress)
+ 		delay = -1;
+
++	if (prctl(PR_SCHED_CORE, PR_SCHED_CORE_GET, getpid(), PIDTYPE_PID,
++		  (unsigned long)&cookie) && (errno == EINVAL || errno == ENODEV)) {
++		printf("core scheduling is not available: %s\n", strerror(errno));
++		return KSFT_SKIP;
++	}
++
+ 	srand(time(NULL));
+
+ 	/* put into separate process group */
diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-splice-skip-the-kernfs-checks-without-test.patch b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-splice-skip-the-kernfs-checks-without-test.patch
new file mode 100644
index 0000000000..52b5a6a7cb
--- /dev/null
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-splice-skip-the-kernfs-checks-without-test.patch
@@ -0,0 +1,45 @@
+From ce9bcf34e00ffbf49712edf1523e5b6c48978204 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Fri, 30 Oct 2026 14:57:59 -0700
+Subject: [PATCH] selftests/splice: skip the kernfs checks without
+ test_module
+
+short_splice_read.sh uses test_module's sysfs files for its kernfs
+checks. When the kernel is built without CONFIG_TEST_LKM there is no
+such module, and the test fails even though all the other checks pass:
+
+  modprobe: FATAL: Module test_module not found in directory /lib/modules/...
+  FAIL: test_module kernel module load should work
+
+Skip the kernfs checks when the module is not available.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ tools/testing/selftests/splice/short_splice_read.sh | 13 +++++++++----
+ 1 file changed, 9 insertions(+), 4 deletions(-)
+
+diff --git a/tools/testing/selftests/splice/short_splice_read.sh b/tools/testing/selftests/splice/short_splice_read.sh
+index 4710e09f49fa..b6249046a580 100755
+--- a/tools/testing/selftests/splice/short_splice_read.sh
++++ b/tools/testing/selftests/splice/short_splice_read.sh
+@@ -124,10 +124,15 @@ expect_success "proc_handler: proc_dostring() splice" test_splice /proc/sys/kern
+ expect_success "proc_handler: special read splice" test_splice /proc/sys/kernel/version
+
+ ### /sys/ has no splice interface; these should all fail.
+-if ! [ -d /sys/module/test_module/sections ] ; then
+-	expect_success "test_module kernel module load" modprobe test_module
++if [ -d /sys/module/test_module/sections ] || modinfo test_module >/dev/null 2>&1 ; then
++	if ! [ -d /sys/module/test_module/sections ] ; then
++		expect_success "test_module kernel module load" modprobe test_module
++	fi
++	expect_success "kernfs attr splice" test_splice /sys/module/test_module/coresize
++	expect_success "kernfs binattr splice" test_splice /sys/module/test_module/sections/.init.text
++else
++	echo "" >&2
++	echo "SKIP: kernfs splice tests, test_module (CONFIG_TEST_LKM) is not available" >&2
+ fi
+-expect_success "kernfs attr splice" test_splice /sys/module/test_module/coresize
+-expect_success "kernfs binattr splice" test_splice /sys/module/test_module/sections/.init.text
+
+ exit $ret
diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-syscall_user_dispatch-build-sud_benchmark-.patch b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-syscall_user_dispatch-build-sud_benchmark-.patch
new file mode 100644
index 0000000000..100f0aca57
--- /dev/null
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-syscall_user_dispatch-build-sud_benchmark-.patch
@@ -0,0 +1,35 @@
+From 5bd11503bf3a582f3be9eef427b2d3384ff03ba2 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Fri, 30 Oct 2026 14:59:30 -0700
+Subject: [PATCH] selftests/syscall_user_dispatch: build sud_benchmark
+ with a frame pointer
+
+On x86-64, handle_sigsys() returns from the SIGSYS handler by hand: it
+runs "leaveq; add $0x8, %rsp" and then issues rt_sigreturn from inside
+the dispatcher region. That relies on the handler having a frame pointer,
+which is only the case when the test is built without optimization. With
+CFLAGS="-O2" the frame pointer is omitted, rt_sigreturn finds a bogus
+frame and the test crashes:
+
+  sud_benchmark[3299] bad frame in rt_sigreturn frame:... sp:1 ...
+
+Always build sud_benchmark with -fno-omit-frame-pointer.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ tools/testing/selftests/syscall_user_dispatch/Makefile | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/tools/testing/selftests/syscall_user_dispatch/Makefile b/tools/testing/selftests/syscall_user_dispatch/Makefile
+index 03c120270953..1f60b49c2d45 100644
+--- a/tools/testing/selftests/syscall_user_dispatch/Makefile
++++ b/tools/testing/selftests/syscall_user_dispatch/Makefile
+@@ -7,3 +7,7 @@ CFLAGS += -Wall -I$(LINUX_HDR_PATH)
+
+ TEST_GEN_PROGS := sud_test sud_benchmark
+ include ../lib.mk
++
++# handle_sigsys() unwinds its own stack frame with inline assembly to return
++# through rt_sigreturn, which only works if it has a frame pointer.
++$(OUTPUT)/sud_benchmark: CFLAGS += -fno-omit-frame-pointer
diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-watchdog-skip-when-there-is-no-watchdog-de.patch b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-watchdog-skip-when-there-is-no-watchdog-de.patch
new file mode 100644
index 0000000000..5d2a1bfda3
--- /dev/null
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftests-watchdog-skip-when-there-is-no-watchdog-de.patch
@@ -0,0 +1,46 @@
+From e5c9e9d546c54acba09537b4722da906cc910dfb Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Fri, 30 Oct 2026 15:05:15 -0700
+Subject: [PATCH] selftests/watchdog: skip when there is no watchdog
+ device
+
+watchdog-test exits with -1 when /dev/watchdog does not exist, so on
+systems without a watchdog it is reported as a failure:
+
+  Watchdog device (/dev/watchdog) not found.
+  not ok 1 selftests: watchdog: watchdog-test # exit=255
+
+Skip the test in that case.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ tools/testing/selftests/watchdog/watchdog-test.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/tools/testing/selftests/watchdog/watchdog-test.c b/tools/testing/selftests/watchdog/watchdog-test.c
+index 4f09c5db0c7f..6756231df9fb 100644
+--- a/tools/testing/selftests/watchdog/watchdog-test.c
++++ b/tools/testing/selftests/watchdog/watchdog-test.c
+@@ -23,6 +23,8 @@
+ #include <linux/types.h>
+ #include <linux/watchdog.h>
+
++#include "kselftest.h"
++
+ #define DEFAULT_PING_RATE	1
+
+ int fd;
+@@ -189,9 +191,10 @@ int main(int argc, char *argv[])
+ 	fd = open(file, O_WRONLY);
+
+ 	if (fd == -1) {
+-		if (errno == ENOENT)
++		if (errno == ENOENT) {
+ 			printf("Watchdog device (%s) not found.\n", file);
+-		else if (errno == EACCES)
++			exit(KSFT_SKIP);
++		} else if (errno == EACCES)
+ 			printf("Run watchdog as root.\n");
+ 		else
+ 			printf("Watchdog device open failed %s\n",
