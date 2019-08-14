Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id 000B07E954
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Aug 2019 13:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id
	:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=AlVOyjTKiNIpQtybwjiQvG582n7HS9uTkWDg7nbSaq4=;
	b=ciOUQqEcCYkWGAkPr+wOIFUsdp
	e6N5qJ7e4cRovc1GvXo24NAbDy4ltQQQi+25F+dgsmYTuKcyjOnH/hMJkQ3rBXdARYhaGE3RXpNHm
	S+ouRXQVjM5GEHKFcuC73EUraF+TIFh251mVzy+JQsVwUNQGRBjEBDMcdJgxodhNki8HF+pWhwmp5
	WmFqMtFloDlylv0MfoOZ807Z/bg9GyYGnlWWhv+XA9wFN7uu5m6bzx4z7Z/O/vZnTpLPW7qnuC+yZ
	VMGH2cjk7QanYYJhEWSAqty2MeKpJ6JOBDhyyy+R0zZjAuFdEiHubsXU79Dyez6UY2pnabCI/5Rgg
	ivMklY4A==;
Received: from kapsi.fi ([91.232.154.11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <mcfrisk@kapsi.fi>)
	id 1hxt89-0003Pi-4D; Wed, 14 Aug 2019 16:15:57 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1hxsoR-0000WV-IY; Wed, 14 Aug 2019 15:55:35 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 Aug 2019 15:55:27 +0300
Message-Id: <1565787327-27580-1-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
X-Rspam-Score: 4.7 (++++)
X-Rspam-Report: Action: no action Symbol: ARC_NA(0.00)
	Symbol: DMARC_POLICY_SOFTFAIL(0.10) Symbol: R_SPF_NEUTRAL(0.00)
	Symbol: FROM_HAS_DN(0.00) Symbol: TO_DN_SOME(0.00)
	Symbol: TO_MATCH_ENVRCPT_ALL(0.00) Symbol: MIME_GOOD(-0.10)
	Symbol: RCVD_TLS_LAST(0.00) Symbol: NEURAL_SPAM(0.00)
	Symbol: IP_SCORE(-0.09) Symbol: RCPT_COUNT_TWO(0.00)
	Symbol: MID_CONTAINS_FROM(1.00) Symbol: SEM_URIBL(3.50)
	Symbol: FORGED_SENDER(0.30) Symbol: R_DKIM_NA(0.00)
	Symbol: MIME_TRACE(0.00) Symbol: ASN(0.00)
	Symbol: FROM_NEQ_ENVFROM(0.00) Symbol: GREYLIST(0.00)
	Symbol: RCVD_COUNT_TWO(0.00) Message: (SPF): spf neutral
	Message-ID: 1565787327-27580-1-git-send-email-mikko.rapeli@bmw.de
X-Rspam-Bar: ++++
X-SA-Exim-Connect-IP: 91.232.154.11
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [meta-oe][PATCH] stress-ng: delete recipe
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
X-List-Received-Date: Wed, 14 Aug 2019 13:15:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

stress-ng is now available from poky directly.

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 ...file-force-sync-after-build-in-case-reboo.patch |  31 -----
 .../0001-Several-changes-to-fix-musl-build.patch   | 132 ---------------------
 .../recipes-test/stress-ng/stress-ng_0.09.45.bb    |  26 ----
 3 files changed, 189 deletions(-)
 delete mode 100644 meta-oe/recipes-test/stress-ng/stress-ng/0001-Revert-Makefile-force-sync-after-build-in-case-reboo.patch
 delete mode 100644 meta-oe/recipes-test/stress-ng/stress-ng/0001-Several-changes-to-fix-musl-build.patch
 delete mode 100644 meta-oe/recipes-test/stress-ng/stress-ng_0.09.45.bb

diff --git a/meta-oe/recipes-test/stress-ng/stress-ng/0001-Revert-Makefile-force-sync-after-build-in-case-reboo.patch b/meta-oe/recipes-test/stress-ng/stress-ng/0001-Revert-Makefile-force-sync-after-build-in-case-reboo.patch
deleted file mode 100644
index 469791d..0000000
--- a/meta-oe/recipes-test/stress-ng/stress-ng/0001-Revert-Makefile-force-sync-after-build-in-case-reboo.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 7c97710bfc44d895b7111bef9c55866f00a3589c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 13 Aug 2018 11:54:27 -0700
-Subject: [PATCH] Revert "Makefile: force sync after build in case reboot loses
- executable"
-
-This reverts commit ae6322b1baea56a589207c96e358daae8edd0a8f.
-
-Not needed for cross-builds
-
-Upstream-Status: Inappropriate [Cross compile specific]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Makefile | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index c0db72c0..5781dda6 100644
---- a/Makefile
-+++ b/Makefile
-@@ -348,7 +348,6 @@ endif
- stress-ng: $(OBJS)
- 	@echo "LD $@"
- 	@$(CC) $(CPPFLAGS) $(CFLAGS) $(OBJS) -lm $(LDFLAGS) -o $@
--	@sync
- 
- makeconfig:
- 	@if [ ! -s config ]; then \
--- 
-2.17.0
-
diff --git a/meta-oe/recipes-test/stress-ng/stress-ng/0001-Several-changes-to-fix-musl-build.patch b/meta-oe/recipes-test/stress-ng/stress-ng/0001-Several-changes-to-fix-musl-build.patch
deleted file mode 100644
index c0b3449..0000000
--- a/meta-oe/recipes-test/stress-ng/stress-ng/0001-Several-changes-to-fix-musl-build.patch
+++ /dev/null
@@ -1,132 +0,0 @@
-From 9bcb4e170f01dbe0a9e7bf6b899c5d9b5283d4c6 Mon Sep 17 00:00:00 2001
-From: Randy MacLeod <Randy.MacLeod@windriver.com>
-Date: Sun, 11 Nov 2018 23:00:53 -0500
-Subject: [PATCH] Several changes to fix musl build
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Rebased patch for:
-
-stress-{context, stackmmap}.c: Set tests to non-implemented because uses
-swapcontext, musl provide the definition but not the implementation due
-  to that functions are pre-POSIX and set to be deprecated.
-  stress-{resources, pty}.c: Doesn't include termio.h and remove stress
-  operations that uses struct termio, musl doesn't provide that struct.
-stress-malloc.c: Check for definition of M_MMAP_THRESHOLD musl doesn't
-  ptovide that constant.
-stress-madvise.c: Add static poision_count integer, definition of
-  MADV_SOFT_OFFLINE doesn't grauntee MADV_HWPOISON to be defined.
-cache.c: Define GLOB_ONLYDIR not available on MUSL.
-
-Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
-Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
-Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
-
-Upstream-status: Pending
----
- cache.c            |  4 ++++
- stress-madvise.c   |  1 +
- stress-pty.c       | 18 ------------------
- stress-resources.c |  1 -
- stress-stackmmap.c |  2 +-
- 5 files changed, 6 insertions(+), 20 deletions(-)
-
-diff --git a/cache.c b/cache.c
-index e8a0f791..4c7bb486 100644
---- a/cache.c
-+++ b/cache.c
-@@ -28,6 +28,10 @@ typedef struct {
- 
- #include <glob.h>
- 
-+#ifndef GLOB_ONLYDIR
-+#define GLOB_ONLYDIR    0x100
-+#endif
-+
- #if defined(__linux__)
- #define SYS_CPU_PREFIX               "/sys/devices/system/cpu"
- #define GLOB_PATTERN SYS_CPU_PREFIX  "/cpu[0-9]*"
-diff --git a/stress-madvise.c b/stress-madvise.c
-index b2e3497f..77e43a91 100644
---- a/stress-madvise.c
-+++ b/stress-madvise.c
-@@ -146,6 +146,7 @@ static int stress_random_advise(const args_t *args)
- #if defined(MADV_SOFT_OFFLINE)
- 	if (advise == MADV_SOFT_OFFLINE) {
- 		static int soft_offline_count;
-+		static int poison_count;
- 
- 		/* ..and minimize number of soft offline pages */
- 		if ((soft_offline_count >= NUM_SOFT_OFFLINE_MAX) ||
-diff --git a/stress-pty.c b/stress-pty.c
-index 4dd88ab9..c79a7021 100644
---- a/stress-pty.c
-+++ b/stress-pty.c
-@@ -26,7 +26,6 @@
- 
- #if defined(__linux__)
- 
--#include <termio.h>
- #include <termios.h>
- 
- typedef struct {
-@@ -111,7 +110,6 @@ static int stress_pty(const args_t *args)
- 		 */
- 		for (i = 0; i < n; i++) {
- 			struct termios ios;
--			struct termio io;
- 			struct winsize ws;
- 			int arg;
- 
-@@ -133,22 +131,6 @@ static int stress_pty(const args_t *args)
- 			if (ioctl(ptys[i].slave, TCSETSF, &ios) < 0)
- 				pr_fail_err("ioctl TCSETSF on slave pty");
- #endif
--#if defined(TCGETA)
--			if (ioctl(ptys[i].slave, TCGETA, &io) < 0)
--				pr_fail_err("ioctl TCGETA on slave pty");
--#endif
--#if defined(TCSETA)
--			if (ioctl(ptys[i].slave, TCSETA, &io) < 0)
--				pr_fail_err("ioctl TCSETA on slave pty");
--#endif
--#if defined(TCSETAW)
--			if (ioctl(ptys[i].slave, TCSETAW, &io) < 0)
--				pr_fail_err("ioctl TCSETAW on slave pty");
--#endif
--#if defined(TCSETAF)
--			if (ioctl(ptys[i].slave, TCSETAF, &io) < 0)
--				pr_fail_err("ioctl TCSETAF on slave pty");
--#endif
- #if defined(TIOCGLCKTRMIOS)
- 			if (ioctl(ptys[i].slave, TIOCGLCKTRMIOS, &ios) < 0)
- 				pr_fail_err("ioctl TIOCGLCKTRMIOS on slave pty");
-diff --git a/stress-resources.c b/stress-resources.c
-index f3dcfb38..86f9a5ba 100644
---- a/stress-resources.c
-+++ b/stress-resources.c
-@@ -28,7 +28,6 @@
- #include <sys/inotify.h>
- #endif
- #if defined(__linux__)
--#include <termio.h>
- #include <termios.h>
- #endif
- #if defined(HAVE_LIB_PTHREAD) && defined(__linux__)
-diff --git a/stress-stackmmap.c b/stress-stackmmap.c
-index c2f4c31d..54308777 100644
---- a/stress-stackmmap.c
-+++ b/stress-stackmmap.c
-@@ -24,7 +24,7 @@
-  */
- #include "stress-ng.h"
- 
--#if defined(__linux__)
-+#if defined(__linux__) && False
- 
- #include <ucontext.h>
- 
--- 
-2.17.0
-
diff --git a/meta-oe/recipes-test/stress-ng/stress-ng_0.09.45.bb b/meta-oe/recipes-test/stress-ng/stress-ng_0.09.45.bb
deleted file mode 100644
index 3e8f2d4..0000000
--- a/meta-oe/recipes-test/stress-ng/stress-ng_0.09.45.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-SUMMARY = "A tool to load and stress a computer system"
-HOMEPAGE = "http://kernel.ubuntu.com/~cking/stress-ng/"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-
-DEPENDS = "zlib libaio"
-
-SRC_URI = "http://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
-           file://0001-Revert-Makefile-force-sync-after-build-in-case-reboo.patch \
-           "
-SRC_URI_append_libc-musl = " \
-    file://0001-Several-changes-to-fix-musl-build.patch \
-    "
-
-SRC_URI[md5sum] = "b03744c2eb68bf7e9a300e78e397f348"
-SRC_URI[sha256sum] = "0741e3004bf590bb7af3db979a46fe89bee7aaad6065cd1d87d0b7fa49046cb2"
-
-UPSTREAM_CHECK_URI ?= "http://kernel.ubuntu.com/~cking/tarballs/${BPN}/"
-UPSTREAM_CHECK_REGEX ?= "(?P<pver>\d+(\.\d+)+)\.tar"
-
-CFLAGS += "-Wall -Wextra -DVERSION='"$(VERSION)"'"
-
-do_install_append() {
-    install -d ${D}${bindir}
-    install -m 755 ${S}/stress-ng ${D}${bindir}/stress-ng
-}
-- 
1.9.1


