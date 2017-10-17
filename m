Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 5DFD778304
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Oct 2017 18:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4DD3520A3B;
	Tue, 17 Oct 2017 18:12:59 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id t1G1wpN8hg0A; Tue, 17 Oct 2017 18:12:59 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id F24EF204B1;
	Tue, 17 Oct 2017 18:12:53 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 8DD9F1626FF; Tue, 17 Oct 2017 14:12:53 -0400 (EDT)
Date: Tue, 17 Oct 2017 14:12:53 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: =?iso-8859-1?Q?An=EDbal_Lim=F3n?= <limon.anibal@gmail.com>
Message-ID: <20171017181253.GG9221@denix.org>
References: <20171017164439.19667-1-limon.anibal@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20171017164439.19667-1-limon.anibal@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: =?iso-8859-1?Q?An=EDbal_Lim=F3n?= <anibal.limon@linaro.org>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [PATCHv3] meta-oe/recipes-test: Add stress-ng recipe
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
X-List-Received-Date: Tue, 17 Oct 2017 18:12:58 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Not very critical, but you lost my SoB in v2 of the recipe. Not the musl 
patch, which is completely yours though.


On Tue, Oct 17, 2017 at 11:44:39AM -0500, Aníbal Limón wrote:
> From: Aníbal Limón <anibal.limon@linaro.org>
> 
> A tool to generate load and stress a system, currently this recipe
> is on a couple of layers [1] and is not updated, a good reason to
> have in meta-oe.
> 
> [1] https://layers.openembedded.org/layerindex/branch/master/recipes/?q=stress-ng
> 
> Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
> ---
>  .../0001-Several-changes-to-fix-musl-build.patch   | 170 +++++++++++++++++++++
>  .../recipes-test/stress-ng/stress-ng_0.08.17.bb    |  20 +++
>  2 files changed, 190 insertions(+)
>  create mode 100644 meta-oe/recipes-test/stress-ng/stress-ng/0001-Several-changes-to-fix-musl-build.patch
>  create mode 100644 meta-oe/recipes-test/stress-ng/stress-ng_0.08.17.bb
> 
> diff --git a/meta-oe/recipes-test/stress-ng/stress-ng/0001-Several-changes-to-fix-musl-build.patch b/meta-oe/recipes-test/stress-ng/stress-ng/0001-Several-changes-to-fix-musl-build.patch
> new file mode 100644
> index 000000000..3ed7efc7e
> --- /dev/null
> +++ b/meta-oe/recipes-test/stress-ng/stress-ng/0001-Several-changes-to-fix-musl-build.patch
> @@ -0,0 +1,170 @@
> +From d50203b233cb8820bf83b6651c2a8487e0db1fcf Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
> +Date: Tue, 17 Oct 2017 10:13:20 -0500
> +Subject: [PATCH] Several changes to fix musl build
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +stress-{context, stackmmap}.c: Set tests to non-implemented because uses
> +swapcontext, musl provide the definition but not the implementation due
> +  to that functions are pre-POSIX and set to be deprecated.
> +  stress-{resources, pty}.c: Doesn't include termio.h and remove stress
> +  operations that uses struct termio, musl doesn't provide that struct.
> +stress-pthread.c: Change pthread_yield to sched_yield to be more compatible.
> +stress-malloc.c: Check for definition of M_MMAP_THRESHOLD musl doesn't
> +  ptovide that constant.
> +stress-madvise.c: Add static poision_count integer, definition of
> +  MADV_SOFT_OFFLINE doesn't grauntee MADV_HWPOISON to be defined.
> +cache.c: Define GLOB_ONLYDIR not available on MUSL.
> +
> +Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
> +Upstream-status: Pending
> +---
> + cache.c            |  4 ++++
> + stress-context.c   |  2 +-
> + stress-madvise.c   |  1 +
> + stress-malloc.c    |  2 +-
> + stress-pthread.c   |  2 +-
> + stress-pty.c       | 18 ------------------
> + stress-resources.c |  1 -
> + stress-stackmmap.c |  2 +-
> + 8 files changed, 9 insertions(+), 23 deletions(-)
> +
> +diff --git a/cache.c b/cache.c
> +index e01fad0..27870ee 100644
> +--- a/cache.c
> ++++ b/cache.c
> +@@ -27,6 +27,10 @@ typedef struct {
> + 
> + #include <glob.h>
> + 
> ++#ifndef GLOB_ONLYDIR
> ++#define GLOB_ONLYDIR    0x100
> ++#endif
> ++
> + #if defined(__linux__)
> + #define SYS_CPU_PREFIX               "/sys/devices/system/cpu"
> + #define GLOB_PATTERN SYS_CPU_PREFIX  "/cpu[0-9]*"
> +diff --git a/stress-context.c b/stress-context.c
> +index c5f50ed..67209e5 100644
> +--- a/stress-context.c
> ++++ b/stress-context.c
> +@@ -24,7 +24,7 @@
> +  */
> + #include "stress-ng.h"
> + 
> +-#if !defined(__OpenBSD__)
> ++#if !defined(__OpenBSD__) && False
> + 
> + #include <ucontext.h>
> + 
> +diff --git a/stress-madvise.c b/stress-madvise.c
> +index 43ea454..2e1f8ee 100644
> +--- a/stress-madvise.c
> ++++ b/stress-madvise.c
> +@@ -141,6 +141,7 @@ static int stress_random_advise(const args_t *args)
> + #if defined(MADV_SOFT_OFFLINE)
> + 	if (advise == MADV_SOFT_OFFLINE) {
> + 		static int soft_offline_count;
> ++		static int poison_count;
> + 
> + 		/* ..and minimize number of soft offline pages */
> + 		if ((soft_offline_count >= NUM_SOFT_OFFLINE_MAX) ||
> +diff --git a/stress-malloc.c b/stress-malloc.c
> +index 8dbe5cc..f505f32 100644
> +--- a/stress-malloc.c
> ++++ b/stress-malloc.c
> +@@ -99,7 +99,7 @@ int stress_malloc(const args_t *args)
> + 			malloc_max = MIN_MALLOC_MAX;
> + 	}
> + 
> +-#if defined(__GNUC__) && defined(__linux__)
> ++#if defined(__GNUC__) && defined(__linux__) && defined(M_MMAP_THRESHOLD)
> + 	if (get_setting("malloc-threshold", &malloc_threshold))
> + 		(void)mallopt(M_MMAP_THRESHOLD, (int)malloc_threshold);
> + #endif
> +diff --git a/stress-pthread.c b/stress-pthread.c
> +index 323a1d4..8269f4c 100644
> +--- a/stress-pthread.c
> ++++ b/stress-pthread.c
> +@@ -139,7 +139,7 @@ static void *stress_pthread_func(void *parg)
> + 			break;
> + 		}
> + #if !defined(__NetBSD__) && !defined(__sun__)
> +-		(void)pthread_yield();
> ++		(void)sched_yield();
> + #endif
> + 	}
> + 	ret = pthread_mutex_unlock(&mutex);
> +diff --git a/stress-pty.c b/stress-pty.c
> +index 8c3edf8..518f118 100644
> +--- a/stress-pty.c
> ++++ b/stress-pty.c
> +@@ -26,7 +26,6 @@
> + 
> + #if defined(__linux__)
> + 
> +-#include <termio.h>
> + #include <termios.h>
> + 
> + typedef struct {
> +@@ -108,7 +107,6 @@ int stress_pty(const args_t *args)
> + 		 */
> + 		for (i = 0; i < n; i++) {
> + 			struct termios ios;
> +-			struct termio io;
> + 			struct winsize ws;
> + 			int arg;
> + 
> +@@ -130,22 +128,6 @@ int stress_pty(const args_t *args)
> + 			if (ioctl(ptys[i].slave, TCSETSF, &ios) < 0)
> + 				pr_fail_err("ioctl TCSETSF on slave pty");
> + #endif
> +-#if defined(TCGETA)
> +-			if (ioctl(ptys[i].slave, TCGETA, &io) < 0)
> +-				pr_fail_err("ioctl TCGETA on slave pty");
> +-#endif
> +-#if defined(TCSETA)
> +-			if (ioctl(ptys[i].slave, TCSETA, &io) < 0)
> +-				pr_fail_err("ioctl TCSETA on slave pty");
> +-#endif
> +-#if defined(TCSETAW)
> +-			if (ioctl(ptys[i].slave, TCSETAW, &io) < 0)
> +-				pr_fail_err("ioctl TCSETAW on slave pty");
> +-#endif
> +-#if defined(TCSETAF)
> +-			if (ioctl(ptys[i].slave, TCSETAF, &io) < 0)
> +-				pr_fail_err("ioctl TCSETAF on slave pty");
> +-#endif
> + #if defined(TIOCGLCKTRMIOS)
> + 			if (ioctl(ptys[i].slave, TIOCGLCKTRMIOS, &ios) < 0)
> + 				pr_fail_err("ioctl TIOCGLCKTRMIOS on slave pty");
> +diff --git a/stress-resources.c b/stress-resources.c
> +index 182e176..880433d 100644
> +--- a/stress-resources.c
> ++++ b/stress-resources.c
> +@@ -31,7 +31,6 @@
> + #include <sys/inotify.h>
> + #endif
> + #if defined(__linux__)
> +-#include <termio.h>
> + #include <termios.h>
> + #endif
> + #if defined(HAVE_LIB_PTHREAD) && defined(__linux__)
> +diff --git a/stress-stackmmap.c b/stress-stackmmap.c
> +index e1378e2..00d1268 100644
> +--- a/stress-stackmmap.c
> ++++ b/stress-stackmmap.c
> +@@ -24,7 +24,7 @@
> +  */
> + #include "stress-ng.h"
> + 
> +-#if defined(__linux__)
> ++#if defined(__linux__) && False
> + 
> + #include <ucontext.h>
> + 
> +-- 
> +2.11.0
> +
> diff --git a/meta-oe/recipes-test/stress-ng/stress-ng_0.08.17.bb b/meta-oe/recipes-test/stress-ng/stress-ng_0.08.17.bb
> new file mode 100644
> index 000000000..dc5b2e8eb
> --- /dev/null
> +++ b/meta-oe/recipes-test/stress-ng/stress-ng_0.08.17.bb
> @@ -0,0 +1,20 @@
> +SUMMARY = "A tool to load and stress a computer system"
> +HOMEPAGE = "http://kernel.ubuntu.com/~cking/stress-ng/"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +
> +DEPENDS = "zlib libaio"
> +
> +SRC_URI = "http://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.gz \
> +          "
> +SRC_URI_append_libc-musl = "file://0001-Several-changes-to-fix-musl-build.patch"
> +
> +SRC_URI[md5sum] = "e0f6497a8c06f5d652bc2ad88d449c12"
> +SRC_URI[sha256sum] = "37cc73e42f5bdb0e0571ba88f6a69b8f05ee28e51afcafc2231c1058b1a5dd18"
> +
> +CFLAGS += "-Wall -Wextra -DVERSION='"$(VERSION)"'"
> +
> +do_install_append() {
> +    install -d ${D}${bindir}
> +    install -m 755 ${S}/stress-ng ${D}${bindir}/stress-ng
> +}
> -- 
> 2.11.0
> 

