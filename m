Return-Path: <limon.anibal@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3F4DF78303
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Oct 2017 18:22:19 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id k31so5566289qta.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Oct 2017 11:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lae5Os6r7hzWVyTHwEBhCWn4t4KwDwM+6iDA9LIHjdE=;
	b=EoNv9yATOo34VX/iubulF9LY9Kwzv+ln7iLCZfqT6C4W6zYDaQbKFW+Ii6XTpqko9+
	kz9kQbGAqNIh4pt/wmKU+Jrwo74x2X8Kq+mTQ+ZZrL2QlaxckvjbkATBkxAcamUiLNOJ
	KWTxtNOLz1qMz5kdX500D2WQbzIHi+6ZCe+5l7A3Zf4ryzOfCDMg9+2VxCgUNffmxe5m
	GEKA0s6gfTxBKwql9or69mPdBD6w4PL8OZX/JnM3q5FMKmV+aFx824ZryWneYZZ62qcN
	LlfIDUTqM94wU8qShBwH0nP/kQ8XyV/zp+Gu8eBSSWRawgnjpDjo93Ri0kphdVLY5+62
	IGvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lae5Os6r7hzWVyTHwEBhCWn4t4KwDwM+6iDA9LIHjdE=;
	b=Ob5r7Wzfa6QnX4PjoOTD9aBZwIozpfB3OKxCc3y5+eGXAAGjAttct7rDpHdezSQpn4
	oqjTMTU108qpv/rVaYmsC06huf3+Ga9BgEzA9A+Dm5Rvf9xrsejJ4jUTcjcgoCMbHpGe
	gBv30zYcRqy5uoSjiMO3bNQsqrGIilKSYZQyva7bBMeAsXsXvj2oGK2YFYQmCyii3tc1
	IUAEZKE0/a4aJgTCNFkx9D04TBFsz6SnNjIQnz2aFR9E+MFqVAKXtCckLZ3bql/e24uU
	t3pO+QRDhbuBDjWgiL9svXRV3i1oZcAjNIFASZIgImI5en8xbpi6qr6UZl/0FLFJ/Lkq
	gLRw==
X-Gm-Message-State: AMCzsaVpGnOxncXxwF2LkeqYLtNHKEb4zatWzJAbFquwyFOGj6g80uYc
	WckiZ8W2PUW8f25jtghsFnc1FJMs
X-Google-Smtp-Source: AOwi7QDwBjUdLupKWMcGzpbMc7djsdEfiws2/0m9TYJreRJkBFzZsXS0eBN+LSZrkX7yr/0NCtfVpw==
X-Received: by 10.200.24.231 with SMTP id o36mr19563956qtk.91.1508264540318;
	Tue, 17 Oct 2017 11:22:20 -0700 (PDT)
Received: from localhost.localdomain ([177.34.165.164])
	by smtp.gmail.com with ESMTPSA id
	d143sm6346018qkc.41.2017.10.17.11.22.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Oct 2017 11:22:19 -0700 (PDT)
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <limon.anibal@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Oct 2017 13:22:11 -0500
Message-Id: <20171017182211.24743-1-limon.anibal@gmail.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Cc: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
Subject: [PATCHv4] meta-oe/recipes-test: Add stress-ng recipe
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
X-List-Received-Date: Tue, 17 Oct 2017 18:22:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Aníbal Limón <anibal.limon@linaro.org>

A tool to generate load and stress a system, currently this recipe
is on a couple of layers [1] and is not updated, a good reason to
have in meta-oe.

[1] https://layers.openembedded.org/layerindex/branch/master/recipes/?q=stress-ng

Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 .../0001-Several-changes-to-fix-musl-build.patch   | 170 +++++++++++++++++++++
 .../recipes-test/stress-ng/stress-ng_0.08.17.bb    |  20 +++
 2 files changed, 190 insertions(+)
 create mode 100644 meta-oe/recipes-test/stress-ng/stress-ng/0001-Several-changes-to-fix-musl-build.patch
 create mode 100644 meta-oe/recipes-test/stress-ng/stress-ng_0.08.17.bb

diff --git a/meta-oe/recipes-test/stress-ng/stress-ng/0001-Several-changes-to-fix-musl-build.patch b/meta-oe/recipes-test/stress-ng/stress-ng/0001-Several-changes-to-fix-musl-build.patch
new file mode 100644
index 000000000..3ed7efc7e
--- /dev/null
+++ b/meta-oe/recipes-test/stress-ng/stress-ng/0001-Several-changes-to-fix-musl-build.patch
@@ -0,0 +1,170 @@
+From d50203b233cb8820bf83b6651c2a8487e0db1fcf Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
+Date: Tue, 17 Oct 2017 10:13:20 -0500
+Subject: [PATCH] Several changes to fix musl build
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+stress-{context, stackmmap}.c: Set tests to non-implemented because uses
+swapcontext, musl provide the definition but not the implementation due
+  to that functions are pre-POSIX and set to be deprecated.
+  stress-{resources, pty}.c: Doesn't include termio.h and remove stress
+  operations that uses struct termio, musl doesn't provide that struct.
+stress-pthread.c: Change pthread_yield to sched_yield to be more compatible.
+stress-malloc.c: Check for definition of M_MMAP_THRESHOLD musl doesn't
+  ptovide that constant.
+stress-madvise.c: Add static poision_count integer, definition of
+  MADV_SOFT_OFFLINE doesn't grauntee MADV_HWPOISON to be defined.
+cache.c: Define GLOB_ONLYDIR not available on MUSL.
+
+Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
+Upstream-status: Pending
+---
+ cache.c            |  4 ++++
+ stress-context.c   |  2 +-
+ stress-madvise.c   |  1 +
+ stress-malloc.c    |  2 +-
+ stress-pthread.c   |  2 +-
+ stress-pty.c       | 18 ------------------
+ stress-resources.c |  1 -
+ stress-stackmmap.c |  2 +-
+ 8 files changed, 9 insertions(+), 23 deletions(-)
+
+diff --git a/cache.c b/cache.c
+index e01fad0..27870ee 100644
+--- a/cache.c
++++ b/cache.c
+@@ -27,6 +27,10 @@ typedef struct {
+ 
+ #include <glob.h>
+ 
++#ifndef GLOB_ONLYDIR
++#define GLOB_ONLYDIR    0x100
++#endif
++
+ #if defined(__linux__)
+ #define SYS_CPU_PREFIX               "/sys/devices/system/cpu"
+ #define GLOB_PATTERN SYS_CPU_PREFIX  "/cpu[0-9]*"
+diff --git a/stress-context.c b/stress-context.c
+index c5f50ed..67209e5 100644
+--- a/stress-context.c
++++ b/stress-context.c
+@@ -24,7 +24,7 @@
+  */
+ #include "stress-ng.h"
+ 
+-#if !defined(__OpenBSD__)
++#if !defined(__OpenBSD__) && False
+ 
+ #include <ucontext.h>
+ 
+diff --git a/stress-madvise.c b/stress-madvise.c
+index 43ea454..2e1f8ee 100644
+--- a/stress-madvise.c
++++ b/stress-madvise.c
+@@ -141,6 +141,7 @@ static int stress_random_advise(const args_t *args)
+ #if defined(MADV_SOFT_OFFLINE)
+ 	if (advise == MADV_SOFT_OFFLINE) {
+ 		static int soft_offline_count;
++		static int poison_count;
+ 
+ 		/* ..and minimize number of soft offline pages */
+ 		if ((soft_offline_count >= NUM_SOFT_OFFLINE_MAX) ||
+diff --git a/stress-malloc.c b/stress-malloc.c
+index 8dbe5cc..f505f32 100644
+--- a/stress-malloc.c
++++ b/stress-malloc.c
+@@ -99,7 +99,7 @@ int stress_malloc(const args_t *args)
+ 			malloc_max = MIN_MALLOC_MAX;
+ 	}
+ 
+-#if defined(__GNUC__) && defined(__linux__)
++#if defined(__GNUC__) && defined(__linux__) && defined(M_MMAP_THRESHOLD)
+ 	if (get_setting("malloc-threshold", &malloc_threshold))
+ 		(void)mallopt(M_MMAP_THRESHOLD, (int)malloc_threshold);
+ #endif
+diff --git a/stress-pthread.c b/stress-pthread.c
+index 323a1d4..8269f4c 100644
+--- a/stress-pthread.c
++++ b/stress-pthread.c
+@@ -139,7 +139,7 @@ static void *stress_pthread_func(void *parg)
+ 			break;
+ 		}
+ #if !defined(__NetBSD__) && !defined(__sun__)
+-		(void)pthread_yield();
++		(void)sched_yield();
+ #endif
+ 	}
+ 	ret = pthread_mutex_unlock(&mutex);
+diff --git a/stress-pty.c b/stress-pty.c
+index 8c3edf8..518f118 100644
+--- a/stress-pty.c
++++ b/stress-pty.c
+@@ -26,7 +26,6 @@
+ 
+ #if defined(__linux__)
+ 
+-#include <termio.h>
+ #include <termios.h>
+ 
+ typedef struct {
+@@ -108,7 +107,6 @@ int stress_pty(const args_t *args)
+ 		 */
+ 		for (i = 0; i < n; i++) {
+ 			struct termios ios;
+-			struct termio io;
+ 			struct winsize ws;
+ 			int arg;
+ 
+@@ -130,22 +128,6 @@ int stress_pty(const args_t *args)
+ 			if (ioctl(ptys[i].slave, TCSETSF, &ios) < 0)
+ 				pr_fail_err("ioctl TCSETSF on slave pty");
+ #endif
+-#if defined(TCGETA)
+-			if (ioctl(ptys[i].slave, TCGETA, &io) < 0)
+-				pr_fail_err("ioctl TCGETA on slave pty");
+-#endif
+-#if defined(TCSETA)
+-			if (ioctl(ptys[i].slave, TCSETA, &io) < 0)
+-				pr_fail_err("ioctl TCSETA on slave pty");
+-#endif
+-#if defined(TCSETAW)
+-			if (ioctl(ptys[i].slave, TCSETAW, &io) < 0)
+-				pr_fail_err("ioctl TCSETAW on slave pty");
+-#endif
+-#if defined(TCSETAF)
+-			if (ioctl(ptys[i].slave, TCSETAF, &io) < 0)
+-				pr_fail_err("ioctl TCSETAF on slave pty");
+-#endif
+ #if defined(TIOCGLCKTRMIOS)
+ 			if (ioctl(ptys[i].slave, TIOCGLCKTRMIOS, &ios) < 0)
+ 				pr_fail_err("ioctl TIOCGLCKTRMIOS on slave pty");
+diff --git a/stress-resources.c b/stress-resources.c
+index 182e176..880433d 100644
+--- a/stress-resources.c
++++ b/stress-resources.c
+@@ -31,7 +31,6 @@
+ #include <sys/inotify.h>
+ #endif
+ #if defined(__linux__)
+-#include <termio.h>
+ #include <termios.h>
+ #endif
+ #if defined(HAVE_LIB_PTHREAD) && defined(__linux__)
+diff --git a/stress-stackmmap.c b/stress-stackmmap.c
+index e1378e2..00d1268 100644
+--- a/stress-stackmmap.c
++++ b/stress-stackmmap.c
+@@ -24,7 +24,7 @@
+  */
+ #include "stress-ng.h"
+ 
+-#if defined(__linux__)
++#if defined(__linux__) && False
+ 
+ #include <ucontext.h>
+ 
+-- 
+2.11.0
+
diff --git a/meta-oe/recipes-test/stress-ng/stress-ng_0.08.17.bb b/meta-oe/recipes-test/stress-ng/stress-ng_0.08.17.bb
new file mode 100644
index 000000000..dc5b2e8eb
--- /dev/null
+++ b/meta-oe/recipes-test/stress-ng/stress-ng_0.08.17.bb
@@ -0,0 +1,20 @@
+SUMMARY = "A tool to load and stress a computer system"
+HOMEPAGE = "http://kernel.ubuntu.com/~cking/stress-ng/"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+DEPENDS = "zlib libaio"
+
+SRC_URI = "http://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.gz \
+          "
+SRC_URI_append_libc-musl = "file://0001-Several-changes-to-fix-musl-build.patch"
+
+SRC_URI[md5sum] = "e0f6497a8c06f5d652bc2ad88d449c12"
+SRC_URI[sha256sum] = "37cc73e42f5bdb0e0571ba88f6a69b8f05ee28e51afcafc2231c1058b1a5dd18"
+
+CFLAGS += "-Wall -Wextra -DVERSION='"$(VERSION)"'"
+
+do_install_append() {
+    install -d ${D}${bindir}
+    install -m 755 ${S}/stress-ng ${D}${bindir}/stress-ng
+}
-- 
2.11.0


