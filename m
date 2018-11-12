Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D87CE6C263
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Nov 2018 21:15:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wACLFA0r023564
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Nov 2018 13:15:21 -0800
Received: from fidler.wrs.com (172.25.44.4) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Mon, 12 Nov 2018 13:15:00 -0800
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 12 Nov 2018 16:14:59 -0500
Message-ID: <20181112211459.26202-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] stress-ng: Upgrade from 0.09.37 to 0.09.45
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
X-List-Received-Date: Mon, 12 Nov 2018 21:15:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Drop the upstreamed patch:
   0001-stress-ng-don-t-enable-TARGET_CLONES-for-musl.patch
Rebase other patches except for the stress-malloc.c change
which has made it upstream:
   c3a2e662 stress-malloc: use HAVE_MALLOPT check for mallopt glibc function

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 ...force-sync-after-build-in-case-reboo.patch | 21 +++++----
 ...01-Several-changes-to-fix-musl-build.patch | 47 ++++++++-----------
 ...-don-t-enable-TARGET_CLONES-for-musl.patch | 30 ------------
 ...ess-ng_0.09.37.bb => stress-ng_0.09.45.bb} |  6 +--
 4 files changed, 34 insertions(+), 70 deletions(-)
 delete mode 100644 meta-oe/recipes-test/stress-ng/stress-ng/0001-stress-ng-don-t-enable-TARGET_CLONES-for-musl.patch
 rename meta-oe/recipes-test/stress-ng/{stress-ng_0.09.37.bb => stress-ng_0.09.45.bb} (78%)

diff --git a/meta-oe/recipes-test/stress-ng/stress-ng/0001-Revert-Makefile-force-sync-after-build-in-case-reboo.patch b/meta-oe/recipes-test/stress-ng/stress-ng/0001-Revert-Makefile-force-sync-after-build-in-case-reboo.patch
index fd2199e53..469791d8e 100644
--- a/meta-oe/recipes-test/stress-ng/stress-ng/0001-Revert-Makefile-force-sync-after-build-in-case-reboo.patch
+++ b/meta-oe/recipes-test/stress-ng/stress-ng/0001-Revert-Makefile-force-sync-after-build-in-case-reboo.patch
@@ -14,15 +14,18 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  Makefile | 1 -
  1 file changed, 1 deletion(-)
 
-Index: stress-ng-0.09.37/Makefile
-===================================================================
---- stress-ng-0.09.37.orig/Makefile
-+++ stress-ng-0.09.37/Makefile
-@@ -344,7 +344,6 @@ OBJS += $(CONFIG_OBJS)
- stress-ng: info $(OBJS)
+diff --git a/Makefile b/Makefile
+index c0db72c0..5781dda6 100644
+--- a/Makefile
++++ b/Makefile
+@@ -348,7 +348,6 @@ endif
+ stress-ng: $(OBJS)
  	@echo "LD $@"
- 	@$(CC) $(CPPFLAGS) $(CFLAGS) $(OBJS) -lm $(LDFLAGS) -lc -o $@
+ 	@$(CC) $(CPPFLAGS) $(CFLAGS) $(OBJS) -lm $(LDFLAGS) -o $@
 -	@sync
  
- .PHONY: info
- info:
+ makeconfig:
+ 	@if [ ! -s config ]; then \
+-- 
+2.17.0
+
diff --git a/meta-oe/recipes-test/stress-ng/stress-ng/0001-Several-changes-to-fix-musl-build.patch b/meta-oe/recipes-test/stress-ng/stress-ng/0001-Several-changes-to-fix-musl-build.patch
index 93d9b544d..c0b344901 100644
--- a/meta-oe/recipes-test/stress-ng/stress-ng/0001-Several-changes-to-fix-musl-build.patch
+++ b/meta-oe/recipes-test/stress-ng/stress-ng/0001-Several-changes-to-fix-musl-build.patch
@@ -1,11 +1,13 @@
-From d499375fe267be8819ecb985123d89a21edc0e59 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
-Date: Tue, 17 Oct 2017 10:13:20 -0500
+From 9bcb4e170f01dbe0a9e7bf6b899c5d9b5283d4c6 Mon Sep 17 00:00:00 2001
+From: Randy MacLeod <Randy.MacLeod@windriver.com>
+Date: Sun, 11 Nov 2018 23:00:53 -0500
 Subject: [PATCH] Several changes to fix musl build
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
 
+Rebased patch for:
+
 stress-{context, stackmmap}.c: Set tests to non-implemented because uses
 swapcontext, musl provide the definition but not the implementation due
   to that functions are pre-POSIX and set to be deprecated.
@@ -19,20 +21,19 @@ cache.c: Define GLOB_ONLYDIR not available on MUSL.
 
 Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
 Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
+Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
 
 Upstream-status: Pending
-
 ---
  cache.c            |  4 ++++
  stress-madvise.c   |  1 +
- stress-malloc.c    |  2 +-
  stress-pty.c       | 18 ------------------
  stress-resources.c |  1 -
  stress-stackmmap.c |  2 +-
- 6 files changed, 7 insertions(+), 21 deletions(-)
+ 5 files changed, 6 insertions(+), 20 deletions(-)
 
 diff --git a/cache.c b/cache.c
-index fbf7674..936c1ff 100644
+index e8a0f791..4c7bb486 100644
 --- a/cache.c
 +++ b/cache.c
 @@ -28,6 +28,10 @@ typedef struct {
@@ -47,10 +48,10 @@ index fbf7674..936c1ff 100644
  #define SYS_CPU_PREFIX               "/sys/devices/system/cpu"
  #define GLOB_PATTERN SYS_CPU_PREFIX  "/cpu[0-9]*"
 diff --git a/stress-madvise.c b/stress-madvise.c
-index 9e71e11..ddf8d2d 100644
+index b2e3497f..77e43a91 100644
 --- a/stress-madvise.c
 +++ b/stress-madvise.c
-@@ -147,6 +147,7 @@ static int stress_random_advise(const args_t *args)
+@@ -146,6 +146,7 @@ static int stress_random_advise(const args_t *args)
  #if defined(MADV_SOFT_OFFLINE)
  	if (advise == MADV_SOFT_OFFLINE) {
  		static int soft_offline_count;
@@ -58,21 +59,8 @@ index 9e71e11..ddf8d2d 100644
  
  		/* ..and minimize number of soft offline pages */
  		if ((soft_offline_count >= NUM_SOFT_OFFLINE_MAX) ||
-diff --git a/stress-malloc.c b/stress-malloc.c
-index a46b8c6..427827a 100644
---- a/stress-malloc.c
-+++ b/stress-malloc.c
-@@ -99,7 +99,7 @@ int stress_malloc(const args_t *args)
- 			malloc_max = MIN_MALLOC_MAX;
- 	}
- 
--#if defined(__GNUC__) && defined(__linux__)
-+#if defined(__GNUC__) && defined(__linux__) && defined(M_MMAP_THRESHOLD)
- 	if (get_setting("malloc-threshold", &malloc_threshold))
- 		(void)mallopt(M_MMAP_THRESHOLD, (int)malloc_threshold);
- #endif
 diff --git a/stress-pty.c b/stress-pty.c
-index 1bd1fbd..b1fe573 100644
+index 4dd88ab9..c79a7021 100644
 --- a/stress-pty.c
 +++ b/stress-pty.c
 @@ -26,7 +26,6 @@
@@ -83,7 +71,7 @@ index 1bd1fbd..b1fe573 100644
  #include <termios.h>
  
  typedef struct {
-@@ -108,7 +107,6 @@ int stress_pty(const args_t *args)
+@@ -111,7 +110,6 @@ static int stress_pty(const args_t *args)
  		 */
  		for (i = 0; i < n; i++) {
  			struct termios ios;
@@ -91,7 +79,7 @@ index 1bd1fbd..b1fe573 100644
  			struct winsize ws;
  			int arg;
  
-@@ -130,22 +128,6 @@ int stress_pty(const args_t *args)
+@@ -133,22 +131,6 @@ static int stress_pty(const args_t *args)
  			if (ioctl(ptys[i].slave, TCSETSF, &ios) < 0)
  				pr_fail_err("ioctl TCSETSF on slave pty");
  #endif
@@ -115,10 +103,10 @@ index 1bd1fbd..b1fe573 100644
  			if (ioctl(ptys[i].slave, TIOCGLCKTRMIOS, &ios) < 0)
  				pr_fail_err("ioctl TIOCGLCKTRMIOS on slave pty");
 diff --git a/stress-resources.c b/stress-resources.c
-index 958c99a..af79abd 100644
+index f3dcfb38..86f9a5ba 100644
 --- a/stress-resources.c
 +++ b/stress-resources.c
-@@ -31,7 +31,6 @@
+@@ -28,7 +28,6 @@
  #include <sys/inotify.h>
  #endif
  #if defined(__linux__)
@@ -127,7 +115,7 @@ index 958c99a..af79abd 100644
  #endif
  #if defined(HAVE_LIB_PTHREAD) && defined(__linux__)
 diff --git a/stress-stackmmap.c b/stress-stackmmap.c
-index 9c83a69..2984f09 100644
+index c2f4c31d..54308777 100644
 --- a/stress-stackmmap.c
 +++ b/stress-stackmmap.c
 @@ -24,7 +24,7 @@
@@ -139,3 +127,6 @@ index 9c83a69..2984f09 100644
  
  #include <ucontext.h>
  
+-- 
+2.17.0
+
diff --git a/meta-oe/recipes-test/stress-ng/stress-ng/0001-stress-ng-don-t-enable-TARGET_CLONES-for-musl.patch b/meta-oe/recipes-test/stress-ng/stress-ng/0001-stress-ng-don-t-enable-TARGET_CLONES-for-musl.patch
deleted file mode 100644
index cd9131df5..000000000
--- a/meta-oe/recipes-test/stress-ng/stress-ng/0001-stress-ng-don-t-enable-TARGET_CLONES-for-musl.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 59f5ff72768f228cd530bb18a5fc3e8c4772857a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 20 Aug 2018 21:43:14 -0700
-Subject: [PATCH] stress-ng: don't enable TARGET_CLONES for musl
-
-musl does not support gnu ifuncs
-
-Upstream-Status: Submitted [https://github.com/ColinIanKing/stress-ng/pull/27]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- stress-ng.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/stress-ng.h b/stress-ng.h
-index b9359a4..f228808 100644
---- a/stress-ng.h
-+++ b/stress-ng.h
-@@ -1090,7 +1090,7 @@ extern void pr_fail_dbg__(const args_t *args, const char *msg);
- #endif
- 
- /* GCC5.0+ target_clones attribute */
--#if defined(__GNUC__) && NEED_GNUC(5,5,0) && STRESS_X86 && \
-+#if defined(__GNUC__) && defined(__GLIBC__) && NEED_GNUC(5,5,0) && STRESS_X86 && \
-     !defined(__gnu_hurd__) && !defined(__FreeBSD_Kernel__)
- #define TARGET_CLONES	__attribute__((target_clones("sse","sse2","ssse3", "sse4.1", "sse4a", "avx","avx2","default")))
- #else
--- 
-2.18.0
-
diff --git a/meta-oe/recipes-test/stress-ng/stress-ng_0.09.37.bb b/meta-oe/recipes-test/stress-ng/stress-ng_0.09.45.bb
similarity index 78%
rename from meta-oe/recipes-test/stress-ng/stress-ng_0.09.37.bb
rename to meta-oe/recipes-test/stress-ng/stress-ng_0.09.45.bb
index a6c327e38..3e8f2d4f5 100644
--- a/meta-oe/recipes-test/stress-ng/stress-ng_0.09.37.bb
+++ b/meta-oe/recipes-test/stress-ng/stress-ng_0.09.45.bb
@@ -7,13 +7,13 @@ DEPENDS = "zlib libaio"
 
 SRC_URI = "http://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
            file://0001-Revert-Makefile-force-sync-after-build-in-case-reboo.patch \
-           file://0001-stress-ng-don-t-enable-TARGET_CLONES-for-musl.patch \
            "
 SRC_URI_append_libc-musl = " \
     file://0001-Several-changes-to-fix-musl-build.patch \
     "
-SRC_URI[md5sum] = "81d73313ea7778f749470b6f950553af"
-SRC_URI[sha256sum] = "8494afb2f2e2cf7e79ec9c6c3129308b098e530141ba2b07d6547708fd63af3d"
+
+SRC_URI[md5sum] = "b03744c2eb68bf7e9a300e78e397f348"
+SRC_URI[sha256sum] = "0741e3004bf590bb7af3db979a46fe89bee7aaad6065cd1d87d0b7fa49046cb2"
 
 UPSTREAM_CHECK_URI ?= "http://kernel.ubuntu.com/~cking/tarballs/${BPN}/"
 UPSTREAM_CHECK_REGEX ?= "(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.17.0


