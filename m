Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8EE4D780C3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jul 2017 05:40:33 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id z6so9725678pfk.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jul 2017 22:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=SlBMeSzEqXv7uvMenMahnCpD9nnRlX5cjdLf4nsL9OE=;
	b=ZyfvbUNKd6RIz10sbO+XT6M368jNp/r3YOabt20deTF4oowNZYToWqzX4t/om/Sj90
	+7/CqqNfCYzSAWVkv1cofVtg5B5PM/D6eJ10NmRe9RbZ387FHgwo3+Mci+Q+00kvSgHX
	gsbvtbHgvBnszj4LSDtc+NqHK7M0wrKt6FJFhEuuVJb3/mKzB8DacdIrz9pJiaSIrK1l
	9Ob88xQta/qanhfkZ6Mjm5OyCuR6vNzXn83O7yr7bSMtSTwDuoJDFUhWfhXnSc4qed6g
	CzN6gZUs+p9IGhrzrpujDq68RaiOwyqIdf9WPQW82HYFJpT05YFL0moIdLZmN6OaSMmn
	5nIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=SlBMeSzEqXv7uvMenMahnCpD9nnRlX5cjdLf4nsL9OE=;
	b=oQ4V4RWfhCg8e22KFr7KgaXHh0l+hg12yL6OqjSYkbsySPV0OUhCVvQIQZgdmlpybp
	85RovU/fVZ03E9M1do1LAxr+Ig8OmMTJCLp0iy5Opf4hcT2B9Szr7hBO+oj+4xYFL+Ym
	S3u1WDcwzvEaANwXAhhnTXHwG3ThBcpOhPqfcr6qRFYqxcgH2Bc5BuNGLJOdLJwffcpa
	9z9mxYw3k8fx7JUCfkTDcuUng68ktiHjvX9vZlSAWhEYAxRzktp7sm/vuvNo/Ke00W0U
	akt8VVRT1G4u0Mjw+cYRsOg5nmmY+50thDPwcJXsTW/Fv9Fuvd88WDHh9hnWys3xdxvK
	+T2g==
X-Gm-Message-State: AIVw112O5ni9ey6ZXJ5KywmECuHUsb7vx4t0qqcHr55YPYYi9Pf+02hC
	gBbtLftGgEKRZuHx
X-Received: by 10.99.36.198 with SMTP id k189mr12962133pgk.230.1500010834296; 
	Thu, 13 Jul 2017 22:40:34 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id
	z86sm17519420pfl.40.2017.07.13.22.40.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Jul 2017 22:40:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Jul 2017 22:40:02 -0700
Message-Id: <20170714054013.34458-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170714054013.34458-1-raj.khem@gmail.com>
References: <20170714054013.34458-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 07/18] lmbench: Fix build with musl
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
X-List-Received-Date: Fri, 14 Jul 2017 05:40:33 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...usl-define-guard-before-redefining-sockle.patch | 29 +++++++++
 ...t-CFLAGS-LDFLAGS-to-append-values-passed-.patch | 76 ++++++++++++++++++++++
 .../recipes-benchmark/lmbench/lmbench_3.0-a9.bb    |  8 ++-
 3 files changed, 112 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-Check-for-musl-define-guard-before-redefining-sockle.patch
 create mode 100644 meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0002-build-Adjust-CFLAGS-LDFLAGS-to-append-values-passed-.patch

diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-Check-for-musl-define-guard-before-redefining-sockle.patch b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-Check-for-musl-define-guard-before-redefining-sockle.patch
new file mode 100644
index 000000000..20791bf23
--- /dev/null
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-Check-for-musl-define-guard-before-redefining-sockle.patch
@@ -0,0 +1,29 @@
+From 31d58ed7e6552781f415501e96d7cc74f83b910d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 12 Jul 2017 18:08:51 -0700
+Subject: [PATCH 1/2] Check for musl define guard before redefining socklen_t
+
+musl uses __DEFINED_socklen_t so check for that as well
+along with HAVE_socklen_t
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/bench.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/bench.h b/src/bench.h
+index 597d068..2ebdf5a 100644
+--- a/src/bench.h
++++ b/src/bench.h
+@@ -77,7 +77,7 @@ typedef long long int64;
+ #endif /* HAVE_int64_t */
+ #endif /* HAVE_int64 */
+ 
+-#ifndef HAVE_socklen_t
++#if !defined(HAVE_socklen_t) && !defined(__DEFINED_socklen_t)
+ typedef int socklen_t;
+ #endif
+ 
+-- 
+2.13.2
+
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0002-build-Adjust-CFLAGS-LDFLAGS-to-append-values-passed-.patch b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0002-build-Adjust-CFLAGS-LDFLAGS-to-append-values-passed-.patch
new file mode 100644
index 000000000..d5c8f5f2f
--- /dev/null
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0002-build-Adjust-CFLAGS-LDFLAGS-to-append-values-passed-.patch
@@ -0,0 +1,76 @@
+From 76f3a9abc2ff96155425ef97d8c5520cfbc8fe6a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 12 Jul 2017 18:09:46 -0700
+Subject: [PATCH 2/2] build: Adjust CFLAGS/LDFLAGS to append values passed from
+ env
+
+For musl we have to pass additional arguments via cflags and ldflags
+to link in librirpc, make room for those changes to take effect
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ scripts/build |  2 +-
+ src/Makefile  | 14 +++++++-------
+ 2 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/scripts/build b/scripts/build
+index 34a1371..3786741 100755
+--- a/scripts/build
++++ b/scripts/build
+@@ -18,7 +18,7 @@ done
+ 
+ trap 'rm -f ${BASE}$$.s ${BASE}$$.c ${BASE}$$.o ${BASE}$$; exit 1' 1 2 15
+ 
+-LDLIBS=-lm
++LDLIBS+=-lm
+ 
+ # check for HP-UX's ANSI compiler
+ echo "main(int ac, char *av[]) { int i; }" > ${BASE}$$.c
+diff --git a/src/Makefile b/src/Makefile
+index d9efd54..96467d7 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -112,8 +112,8 @@ LIBOBJS= $O/lib_tcp.o $O/lib_udp.o $O/lib_unix.o $O/lib_timing.o 	\
+ 	$O/lib_sched.o
+ 
+ lmbench: $(UTILS)
+-	@env CFLAGS=-O MAKE="$(MAKE)" MAKEFLAGS="$(MAKEFLAGS)" CC="$(CC)" OS="$(OS)" ../scripts/build all
+-	-@env CFLAGS=-O MAKE="$(MAKE)" MAKEFLAGS="k$(MAKEFLAGS)" CC="$(CC)" OS="$(OS)" ../scripts/build opt
++	@env CFLAGS+=-O MAKE="$(MAKE)" MAKEFLAGS="$(MAKEFLAGS)" CC="$(CC)" OS="$(OS)" ../scripts/build all
++	-@env CFLAGS+=-O MAKE="$(MAKE)" MAKEFLAGS="k$(MAKEFLAGS)" CC="$(CC)" OS="$(OS)" ../scripts/build opt
+ 
+ results: lmbench
+ 	@env OS="${OS}" ../scripts/config-run
+@@ -137,7 +137,7 @@ os: lmbench
+ 	@env OS="${OS}" BENCHMARK_HARDWARE=NO  BENCHMARK_OS=YES ../scripts/results
+ 
+ install: lmbench
+-	@env CFLAGS=-O MAKE="$(MAKE)"  MAKEFLAGS="$(MAKEFLAGS)" CC="${CC}" OS="${OS}" ../scripts/build install-target
++	@env CFLAGS+=-O MAKE="$(MAKE)"  MAKEFLAGS="$(MAKEFLAGS)" CC="${CC}" OS="${OS}" ../scripts/build install-target
+ 
+ install-target:
+ 	if [ ! -d $(BASE) ]; then mkdir $(BASE); fi
+@@ -155,16 +155,16 @@ all: $(EXES) $O/lmbench
+ opt: $(OPT_EXES)
+ asm: $(ASMS)
+ $(ASMS):
+-	$(CC) -S $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -o $@ `basename $@ .s`.c
++	$(CC) -S $(CFLAGS) $(CPPFLAGS) -o $@ `basename $@ .s`.c $(LDFLAGS)
+ 
+ Wall:
+-	@env CFLAGS="-g -O -Wall" MAKE="$(MAKE)" MAKEFLAGS="$(MAKEFLAGS)" CC="${CC}" OS="${OS}" ../scripts/build all opt
++	@env CFLAGS+="-g -O -Wall" MAKE="$(MAKE)" MAKEFLAGS="$(MAKEFLAGS)" CC="${CC}" OS="${OS}" ../scripts/build all opt
+ 
+ debug:
+-	@env CFLAGS="-g -O -DDEBUG" MAKE="$(MAKE)" MAKEFLAGS="$(MAKEFLAGS)" CC="${CC}" OS="${OS}" ../scripts/build all opt
++	@env CFLAGS+="-g -O -DDEBUG" MAKE="$(MAKE)" MAKEFLAGS="$(MAKEFLAGS)" CC="${CC}" OS="${OS}" ../scripts/build all opt
+ 
+ assembler:
+-	@env CFLAGS=-O MAKE="$(MAKE)" MAKEFLAGS="$(MAKEFLAGS)" CC="${CC}" OS="${OS}" ../scripts/build asm
++	@env CFLAGS+=-O MAKE="$(MAKE)" MAKEFLAGS="$(MAKEFLAGS)" CC="${CC}" OS="${OS}" ../scripts/build asm
+ 
+ 
+ tag:
+-- 
+2.13.2
+
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
index 43ac1d038..03b3721ca 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
@@ -7,6 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
 
 inherit autotools-brokensep
 
+DEPENDS_append_libc-musl = " libtirpc"
+CFLAGS_append_libc-musl = " -I${STAGING_INCDIR}/tirpc"
+LDLIBS_append_libc-musl = " -ltirpc "
+
 PR = "r2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/lmbench/lmbench-${PV}.tgz \
@@ -20,12 +24,14 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/lmbench/lmbench-${PV}.tgz \
            file://fix-lmbench-memory-check-failure.patch \
            file://0001-avoid-gcc-optimize-away-the-loops.patch \
            file://0001-lat_http.c-Add-printf-format.patch \
+           file://0001-Check-for-musl-define-guard-before-redefining-sockle.patch \
+           file://0002-build-Adjust-CFLAGS-LDFLAGS-to-append-values-passed-.patch \
            "
 SRC_URI[md5sum] = "b3351a3294db66a72e2864a199d37cbf"
 SRC_URI[sha256sum] = "cbd5777d15f44eab7666dcac418054c3c09df99826961a397d9acf43d8a2a551"
 
 EXTRA_OEMAKE = 'CC="${CC}" AR="${AR}" RANLIB="${RANLIB}" CFLAGS="${CFLAGS}" \
-                LDFLAGS="${LDFLAGS}" LD="${LD}" OS="${TARGET_SYS}" \
+                LDFLAGS="${LDFLAGS}" LDLIBS="${LDLIBS}" LD="${LD}" OS="${TARGET_SYS}" \
                 TARGET="${TARGET_OS}" BASE="${prefix}" MANDIR="${mandir}"'
 
 do_configure() {
-- 
2.13.2


