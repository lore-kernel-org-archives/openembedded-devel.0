Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 702BCC43334
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 08:49:19 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.26178.1657529352859929308
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Jul 2022 01:49:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Qw5ksDql;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1657529351; i=@fujitsu.com;
	bh=8mdKW0gwnVhrQay3TnQOO4PCmPni2rJRBiAdxXFIq2Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Qw5ksDql/gvbDgsyBRNBFA8yvxuWDH2OM/vz9SZ8++9sqHgIp6PTVk/mxHYknlwan
	 5+tFCYvogmTRUH4oOz2SP1nEaQrVvCD5nnqmzylGhYwAPGoQE1HL9CnZkf3IKkVk6a
	 KD3UFuedHLvLwugewJ5nNUgprZ3HKcW4Jk0tsJGv5NgngUgNmT5ms0kzCYXuvF+5Jn
	 Yp6k80YrW+pnUU9t5CSzS+Da4Jk8WM3CmEq8oKgJahwVQuBFCqNxlZodN4nPohWhw0
	 nTtfRulZd+CfoBilOsK0QFmj1oAZClUqszmjqCmlBT/0fAxzilM96qiugGqxnJjE+F
	 NTtF9BAckzldA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrAIsWRWlGSWpSXmKPExsViZ8MxSZftyek
  kg89HDCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oxJ308wFmzXrbjxeypjA+NT9S5GLg4hgSeM
  Et2tjWwQznUmid0zPrFAOHsYJdpWrmPsYuTkYBNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1jARmJd81awOIuAqsS8G4/AenkFnCTef70BViMhoCAx5eF7sBpOAWeJT/s+gc0UAqrpeP
  OMDaJeUOLkzCcsEPMlJA6+eMEM0asoMftyMwuEXSExY8Y2NghbTeLquU3MExgFZyFpn4WkfQE
  j0ypG66SizPSMktzEzBxdQwMDXUNDU11jS10jQ2O9xCrdRL3UUt3y1OISXSO9xPJivdTiYr3i
  ytzknBS9vNSSTYzAQE4pVr+6g3Hzqp96hxglOZiURHmFT55OEuJLyk+pzEgszogvKs1JLT7EK
  MPBoSTB++URUE6wKDU9tSItMwcYVTBpCQ4eJRHeqyeA0rzFBYm5xZnpEKlTjK4cV69c2cvMMX
  X2v/3MHMvB5MyvbQeYOTbt6zrALMSSl5+XKiXOewRktgBIc0ZpHtxoWEK4xCgrJczLyMDAIMR
  TkFqUm1mCKv+KUZyDUUmY1/kx0BSezLwSuAteAR3HBHRcXMoJkONKEhFSUg1M+dPXfXU5563J
  o8JuvT00ZtqszTyC3qslJm/2fLHnpErs8oM3jV6JLuu2sUy6GV0mtij3kotj5r/2R0fNQjRC+
  w+nFUmph0z+v9tp2YYVW1VmlfAfqy15IL7LbkH7w01hHyrvP+ffra62oztRNvmSq+ChHy951b
  22bpHfeeuKBN/v22WmL3KNn2zevyn4gNKqX3INK/yNqgumslpP+p3C8vHWuo7VSr9ET7091bx
  U4McU5rfFZ649S1GTLta4uTXI/PfRH42pzGGFm2ylde5rHi05WWXCuIbtnWZpib0x13aWhbOj
  3hbM1u/L3SvAeO3yK+nt8/mT+AWTWj5eb/376E2fldW09ECbutB57wQuKbEUZyQaajEXFScCA
  OUeZeWDAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-565.messagelabs.com!1657529350!7363!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27928 invoked from network); 11 Jul 2022 08:49:10 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-11.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 11 Jul 2022 08:49:10 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 7A8711000C2
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Jul 2022 09:49:10 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 6D2D0100077
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Jul 2022 09:49:10 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 11 Jul 2022 09:49:08 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] liburing: upgrade 2.1 -> 2.2
Date: Mon, 11 Jul 2022 16:45:15 +0800
Message-ID: <1657529116-24181-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1657529116-24181-1-git-send-email-wangmy@fujitsu.com>
References: <1657529116-24181-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Jul 2022 08:49:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97808

0001-test-Use-syscall-wrappers-instead-of-using-syscall-2.patch
removed since it's included in 2.2.

License-Update:
  Add "kernel version dependency"
  Add affect of "ulimit settings"

Changelog:
===========
- Support non-libc builds.
- Optimized syscall handling for x86-64/x86/aarch64.
- Enable non-lib function calls for fast path functions.
- Add support for multishot accept.
- io_uring_register_files() will set RLIMIT_NOFILE if necessary.
- Add support for registered ring fds, io_uring_register_ring_fd(),
  reducingthe overhead of an io_uring_enter() system call.
- Add support for the message ring opcode.
- Add support for newer request cancelation features.
- Add support for IORING_SETUP_COOP_TASKRUN, which can help reduce the
  overhead of io_uring in general. Most applications should set this flag,
  see the io_uring_setup.2 man page for details.
- Add support for registering a sparse buffer and file set.
- Add support for a new buffer provide scheme, see
  io_uring_register_buf_ring.3 for details.
- Add io_uring_submit_and_wait_timeout() for submitting IO and waiting
  for completions with a timeout.
- Add io_uring_prep_{read,write}v2 prep helpers.
- Add io_uring_prep_close_direct() helper.
- Add support for SQE128 and CQE32, which are doubly sized SQE and CQE
  rings. This is needed for some cases of the new IORING_OP_URING_CMD,
  notably for NVMe passthrough.
- ~5500 lines of man page additions, including adding ~90 new man pages.
- Synced with the 5.19 kernel release, supporting all the features of
  5.19 and earlier.
- 24 new regression test cases, and ~7000 lines of new tests in general.
- General optimizations and fixes.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-wrappers-instead-of-using-syscall-2.patch | 59 -------------------
 .../{liburing_2.1.bb => liburing_2.2.bb}      |  8 +--
 2 files changed, 3 insertions(+), 64 deletions(-)
 delete mode 100644 meta-oe/recipes-support/liburing/liburing/0001-test-Use-syscall-wrappers-instead-of-using-syscall-2.patch
 rename meta-oe/recipes-support/liburing/{liburing_2.1.bb => liburing_2.2.bb} (81%)

diff --git a/meta-oe/recipes-support/liburing/liburing/0001-test-Use-syscall-wrappers-instead-of-using-syscall-2.patch b/meta-oe/recipes-support/liburing/liburing/0001-test-Use-syscall-wrappers-instead-of-using-syscall-2.patch
deleted file mode 100644
index 2777a9404..000000000
--- a/meta-oe/recipes-support/liburing/liburing/0001-test-Use-syscall-wrappers-instead-of-using-syscall-2.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From cb350a8989adbd65db574325d9a86d5437d800da Mon Sep 17 00:00:00 2001
-From: Guillem Jover <guillem@hadrons.org>
-Date: Mon, 13 Sep 2021 23:56:08 +0200
-Subject: [PATCH] test: Use syscall wrappers instead of using syscall(2) directly
-
-Some of these syscalls have different entry points depending on the
-architecture. Use the wrappers to avoid having to reimplement them
-portably.
-
-Fixes build failures on Debian armel and armhf builds.
-
-Upstream-Status: Backport [https://github.com/kraj/liburing/commit/cb350a8989adbd65db574325d9a86d5437d800da]
-Signed-off-by: Guillem Jover <guillem@hadrons.org>
----
- test/sqpoll-cancel-hang.c | 7 ++-----
- 1 file changed, 2 insertions(+), 5 deletions(-)
-
-diff --git a/test/sqpoll-cancel-hang.c b/test/sqpoll-cancel-hang.c
-index c9032c8..e561478 100644
---- a/test/sqpoll-cancel-hang.c
-+++ b/test/sqpoll-cancel-hang.c
-@@ -4,7 +4,6 @@
- #include <stdlib.h>
- #include <string.h>
- #include <sys/mman.h>
--#include <sys/syscall.h>
- #include <sys/wait.h>
- #include <time.h>
- #include <unistd.h>
-@@ -29,8 +28,6 @@ static uint64_t current_time_ms(void)
- 
- #define IORING_OFF_SQES 0x10000000ULL
- 
--#define sys_io_uring_setup 425
--
- static void kill_and_wait(int pid, int* status)
- {
-     kill(-pid, SIGKILL);
-@@ -53,7 +50,7 @@ a5)
-     void* vma2 = (void*)a3;
-     void** ring_ptr_out = (void**)a4;
-     void** sqes_ptr_out = (void**)a5;
--    uint32_t fd_io_uring = syscall(sys_io_uring_setup, entries, setup_params);
-+    uint32_t fd_io_uring = __sys_io_uring_setup(entries, setup_params);
-     uint32_t sq_ring_sz = setup_params->sq_off.array +
- setup_params->sq_entries * sizeof(uint32_t);
-     uint32_t cq_ring_sz = setup_params->cq_off.cqes +
-@@ -135,7 +132,7 @@ void trigger_bug(void)
- }
- int main(void)
- {
--    syscall(__NR_mmap, 0x20000000ul, 0x1000000ul, 7ul, 0x32ul, -1, 0ul);
-+    mmap((void *)0x20000000ul, 0x1000000ul, 7ul, 0x32ul, -1, 0ul);
-     int pid = fork();
-     if (pid < 0)
-         exit(1);
--- 
-2.33.1
-
diff --git a/meta-oe/recipes-support/liburing/liburing_2.1.bb b/meta-oe/recipes-support/liburing/liburing_2.2.bb
similarity index 81%
rename from meta-oe/recipes-support/liburing/liburing_2.1.bb
rename to meta-oe/recipes-support/liburing/liburing_2.2.bb
index da8e6d333..8cc7d74f9 100644
--- a/meta-oe/recipes-support/liburing/liburing_2.1.bb
+++ b/meta-oe/recipes-support/liburing/liburing_2.2.bb
@@ -7,14 +7,12 @@ BUGTRACKER = "https://github.com/axboe/liburing/issues"
 SECTION = "libs"
 
 LICENSE = "LGPL-2.1-only | MIT"
-LIC_FILES_CHKSUM = "file://README;beginline=41;endline=44;md5=d51b5805e2a675685e6a66ca50904cf9"
+LIC_FILES_CHKSUM = "file://README;beginline=41;endline=44;md5=2b0e9926530c269f5ae95560370195af"
 
-SRC_URI = "git://github.com/axboe/liburing.git;branch=master;protocol=https \
-           file://0001-test-Use-syscall-wrappers-instead-of-using-syscall-2.patch \
-           "
+SRC_URI = "git://github.com/axboe/liburing.git;branch=master;protocol=https"
 SRC_URI:append:libc-musl:riscv64 = " file://0001-do-not-build-examples.patch "
 SRC_URI:append:libc-musl:riscv32 = " file://0001-do-not-build-examples.patch "
-SRCREV = "41a61c97c2e3df4475c93fdf5026d575ce3f1377"
+SRCREV = "dda4848a9911120a903bef6284fb88286f4464c9"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


