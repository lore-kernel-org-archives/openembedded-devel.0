Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5EFD4788DC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jan 2018 04:16:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Jan 2018 20:16:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,338,1511856000"; d="scan'208";a="165545607"
Received: from efconnel-mobl.amr.corp.intel.com ([10.255.230.181])
	by orsmga004.jf.intel.com with ESMTP; 09 Jan 2018 20:16:16 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Date: Tue, 9 Jan 2018 20:16:15 -0800
References: <20180110041407.11817-1-timothy.t.orling@linux.intel.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
In-Reply-To: <20180110041407.11817-1-timothy.t.orling@linux.intel.com>
Message-Id: <B368DEED-899A-460B-96E0-0778D62C9A07@linux.intel.com>
X-Mailer: Apple Mail (2.3273)
Subject: Re: [PATCH] stress-ng: upgrade to 0.09.09 and fix musl build
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
X-List-Received-Date: Wed, 10 Jan 2018 04:16:16 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Meh. wrong subject line resending. Please ignore the noise.

> On Jan 9, 2018, at 8:14 PM, Tim Orling =
<timothy.t.orling@linux.intel.com> wrote:
>=20
> * Upstream tarballs are now xz compressed
> * Patch 0001 modified:
>  - stress-pthread and stress-context change not needed
> * Add patch to fix stress-fcntl for musl
> * Add patch to fix syntax errors in stress-fcntl
>  - Accepted upstream
> * Add UPSTREAM_CHECK_URI and UPSTREAM_CHECK_REGEX
>=20
> Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
> ---
> .../0001-Several-changes-to-fix-musl-build.patch   | 31 +-------------
> .../0002-stress-fcntl-fix-build-for-musl.patch     | 27 +++++++++++++
> .../0003-stress-fcntl.c-fix-syntax-errors.patch    | 47 =
++++++++++++++++++++++
> .../recipes-test/stress-ng/stress-ng_0.08.17.bb    | 20 ---------
> .../recipes-test/stress-ng/stress-ng_0.09.09.bb    | 26 ++++++++++++
> 5 files changed, 102 insertions(+), 49 deletions(-)
> create mode 100644 =
meta-oe/recipes-test/stress-ng/stress-ng/0002-stress-fcntl-fix-build-for-m=
usl.patch
> create mode 100644 =
meta-oe/recipes-test/stress-ng/stress-ng/0003-stress-fcntl.c-fix-syntax-er=
rors.patch
> delete mode 100644 meta-oe/recipes-test/stress-ng/stress-ng_0.08.17.bb
> create mode 100644 meta-oe/recipes-test/stress-ng/stress-ng_0.09.09.bb
>=20
> diff --git =
a/meta-oe/recipes-test/stress-ng/stress-ng/0001-Several-changes-to-fix-mus=
l-build.patch =
b/meta-oe/recipes-test/stress-ng/stress-ng/0001-Several-changes-to-fix-mus=
l-build.patch
> index 3ed7efc7e..f90e704f0 100644
> --- =
a/meta-oe/recipes-test/stress-ng/stress-ng/0001-Several-changes-to-fix-mus=
l-build.patch
> +++ =
b/meta-oe/recipes-test/stress-ng/stress-ng/0001-Several-changes-to-fix-mus=
l-build.patch
> @@ -11,7 +11,6 @@ swapcontext, musl provide the definition but not the =
implementation due
>   to that functions are pre-POSIX and set to be deprecated.
>   stress-{resources, pty}.c: Doesn't include termio.h and remove =
stress
>   operations that uses struct termio, musl doesn't provide that =
struct.
> -stress-pthread.c: Change pthread_yield to sched_yield to be more =
compatible.
> stress-malloc.c: Check for definition of M_MMAP_THRESHOLD musl doesn't
>   ptovide that constant.
> stress-madvise.c: Add static poision_count integer, definition of
> @@ -19,13 +18,13 @@ stress-madvise.c: Add static poision_count =
integer, definition of
> cache.c: Define GLOB_ONLYDIR not available on MUSL.
>=20
> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>
> +Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
> +
> Upstream-status: Pending
> ---
>  cache.c            |  4 ++++
> - stress-context.c   |  2 +-
>  stress-madvise.c   |  1 +
>  stress-malloc.c    |  2 +-
> - stress-pthread.c   |  2 +-
>  stress-pty.c       | 18 ------------------
>  stress-resources.c |  1 -
>  stress-stackmmap.c |  2 +-
> @@ -46,19 +45,6 @@ index e01fad0..27870ee 100644
>  #if defined(__linux__)
>  #define SYS_CPU_PREFIX               "/sys/devices/system/cpu"
>  #define GLOB_PATTERN SYS_CPU_PREFIX  "/cpu[0-9]*"
> -diff --git a/stress-context.c b/stress-context.c
> -index c5f50ed..67209e5 100644
> ---- a/stress-context.c
> -+++ b/stress-context.c
> -@@ -24,7 +24,7 @@
> -  */
> - #include "stress-ng.h"
> -=20
> --#if !defined(__OpenBSD__)
> -+#if !defined(__OpenBSD__) && False
> -=20
> - #include <ucontext.h>
> -=20
> diff --git a/stress-madvise.c b/stress-madvise.c
> index 43ea454..2e1f8ee 100644
> --- a/stress-madvise.c
> @@ -84,19 +70,6 @@ index 8dbe5cc..f505f32 100644
>  	if (get_setting("malloc-threshold", &malloc_threshold))
>  		(void)mallopt(M_MMAP_THRESHOLD, (int)malloc_threshold);
>  #endif
> -diff --git a/stress-pthread.c b/stress-pthread.c
> -index 323a1d4..8269f4c 100644
> ---- a/stress-pthread.c
> -+++ b/stress-pthread.c
> -@@ -139,7 +139,7 @@ static void *stress_pthread_func(void *parg)
> - 			break;
> - 		}
> - #if !defined(__NetBSD__) && !defined(__sun__)
> --		(void)pthread_yield();
> -+		(void)sched_yield();
> - #endif
> - 	}
> - 	ret =3D pthread_mutex_unlock(&mutex);
> diff --git a/stress-pty.c b/stress-pty.c
> index 8c3edf8..518f118 100644
> --- a/stress-pty.c
> diff --git =
a/meta-oe/recipes-test/stress-ng/stress-ng/0002-stress-fcntl-fix-build-for=
-musl.patch =
b/meta-oe/recipes-test/stress-ng/stress-ng/0002-stress-fcntl-fix-build-for=
-musl.patch
> new file mode 100644
> index 000000000..826340169
> --- /dev/null
> +++ =
b/meta-oe/recipes-test/stress-ng/stress-ng/0002-stress-fcntl-fix-build-for=
-musl.patch
> @@ -0,0 +1,27 @@
> +=46rom 7be4680930e2867cefd5c8fe27a4ae81a4ae2628 Mon Sep 17 00:00:00 =
2001
> +From: Tim Orling <timothy.t.orling@linux.intel.com>
> +Date: Tue, 9 Jan 2018 18:38:45 -0800
> +Subject: [PATCH] stress-fcntl: fix build for musl
> +
> +Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
> +
> +Upstream-status: Pending
> +---
> + stress-fcntl.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/stress-fcntl.c b/stress-fcntl.c
> +index b7eade2..9fa5c38 100644
> +--- a/stress-fcntl.c
> ++++ b/stress-fcntl.c
> +@@ -413,6 +413,7 @@ ofd_lock_abort:	{ /* Nowt */ }
> +=20
> + #if defined(F_GET_FILE_RW_HINT) && defined(F_SET_FILE_RW_HINT)
> + 	{
> ++		int ret;
> + 		size_t i;
> + 		unsigned long hint;
> + 		static const unsigned long hints[] =3D {
> +--=20
> +2.14.3
> +
> diff --git =
a/meta-oe/recipes-test/stress-ng/stress-ng/0003-stress-fcntl.c-fix-syntax-=
errors.patch =
b/meta-oe/recipes-test/stress-ng/stress-ng/0003-stress-fcntl.c-fix-syntax-=
errors.patch
> new file mode 100644
> index 000000000..4b6a9b391
> --- /dev/null
> +++ =
b/meta-oe/recipes-test/stress-ng/stress-ng/0003-stress-fcntl.c-fix-syntax-=
errors.patch
> @@ -0,0 +1,47 @@
> +=46rom 8537dcafb12be4d986b571f1e1d9f3ceecdc8e63 Mon Sep 17 00:00:00 =
2001
> +From: Tim Orling <timothy.t.orling@linux.intel.com>
> +Date: Sun, 7 Jan 2018 21:29:12 -0800
> +Subject: [PATCH] stress-fcntl.c: fix syntax errors
> +
> +Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
> +
> +Upstream-status: Accepted
> +(commit 61d93d6857256cd49df6a6302caf6e7bb69b0f46)
> +---
> + stress-fcntl.c | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/stress-fcntl.c b/stress-fcntl.c
> +index 7c15d28..b7eade2 100644
> +--- a/stress-fcntl.c
> ++++ b/stress-fcntl.c
> +@@ -173,7 +173,7 @@ static int do_fcntl(const args_t *args, const int =
fd)
> + 		owner.pid =3D getpgrp();
> + 		ret =3D fcntl(fd, F_SETOWN_EX, &owner);
> + 		check_return(args, ret, "F_SETOWN_EX, F_OWNER_PGRP");
> +-#else if defined(HAVE_GETPGRP) && defined(F_OWNER_GID)
> ++#elif defined(HAVE_GETPGRP) && defined(F_OWNER_GID)
> + 		owner.type =3D F_OWNER_GID;
> + 		owner.pid =3D getpgrp();
> + 		ret =3D fcntl(fd, F_SETOWN_EX, &owner);
> +@@ -202,7 +202,7 @@ static int do_fcntl(const args_t *args, const int =
fd)
> + 		owner.type =3D F_OWNER_PGRP;
> + 		ret =3D fcntl(fd, F_GETOWN_EX, &owner);
> + 		check_return(args, ret, "F_GETOWN_EX, F_OWNER_PGRP");
> +-#ele if defined(F_OWNER_GID)
> ++#elif defined(F_OWNER_GID)
> + 		owner.type =3D F_OWNER_GID;
> + 		ret =3D fcntl(fd, F_GETOWN_EX, &owner);
> + 		check_return(args, ret, "F_GETOWN_EX, F_OWNER_GID");
> +@@ -436,7 +436,7 @@ ofd_lock_abort:	{ /* Nowt */ }
> + #endif
> + 		};
> +=20
> +-		ret =3D fcntl(fd, F_GET_FILE_RW_HINT, &hint)
> ++		ret =3D fcntl(fd, F_GET_FILE_RW_HINT, &hint);
> + 		if (ret =3D=3D 0) {
> + 			for (i =3D 0; i < SIZEOF_ARRAY(hints); i++) {
> + 				hint =3D hints[i];
> +--=20
> +2.14.3
> +
> diff --git a/meta-oe/recipes-test/stress-ng/stress-ng_0.08.17.bb =
b/meta-oe/recipes-test/stress-ng/stress-ng_0.08.17.bb
> deleted file mode 100644
> index dc5b2e8eb..000000000
> --- a/meta-oe/recipes-test/stress-ng/stress-ng_0.08.17.bb
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -SUMMARY =3D "A tool to load and stress a computer system"
> -HOMEPAGE =3D "http://kernel.ubuntu.com/~cking/stress-ng/"
> -LICENSE =3D "GPLv2"
> -LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263"
> -
> -DEPENDS =3D "zlib libaio"
> -
> -SRC_URI =3D =
"http://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.gz \
> -          "
> -SRC_URI_append_libc-musl =3D =
"file://0001-Several-changes-to-fix-musl-build.patch"
> -
> -SRC_URI[md5sum] =3D "e0f6497a8c06f5d652bc2ad88d449c12"
> -SRC_URI[sha256sum] =3D =
"37cc73e42f5bdb0e0571ba88f6a69b8f05ee28e51afcafc2231c1058b1a5dd18"
> -
> -CFLAGS +=3D "-Wall -Wextra -DVERSION=3D'"$(VERSION)"'"
> -
> -do_install_append() {
> -    install -d ${D}${bindir}
> -    install -m 755 ${S}/stress-ng ${D}${bindir}/stress-ng
> -}
> diff --git a/meta-oe/recipes-test/stress-ng/stress-ng_0.09.09.bb =
b/meta-oe/recipes-test/stress-ng/stress-ng_0.09.09.bb
> new file mode 100644
> index 000000000..24f55ada2
> --- /dev/null
> +++ b/meta-oe/recipes-test/stress-ng/stress-ng_0.09.09.bb
> @@ -0,0 +1,26 @@
> +SUMMARY =3D "A tool to load and stress a computer system"
> +HOMEPAGE =3D "http://kernel.ubuntu.com/~cking/stress-ng/"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263"
> +
> +DEPENDS =3D "zlib libaio"
> +
> +SRC_URI =3D =
"http://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
> +          "
> +SRC_URI_append_libc-musl =3D " \
> +    file://0001-Several-changes-to-fix-musl-build.patch \
> +    file://0002-stress-fcntl-fix-build-for-musl.patch \
> +    file://0003-stress-fcntl.c-fix-syntax-errors.patch"
> +
> +SRC_URI[md5sum] =3D "6e4df71095e780654ccc0a713b8423fe"
> +SRC_URI[sha256sum] =3D =
"e993fddb1d990a0cdb23b2af6cf6c417a1c09e155ada7c558ad80eae8a5feed3"
> +
> +UPSTREAM_CHECK_URI ?=3D =
"http://kernel.ubuntu.com/~cking/tarballs/${BPN}/"
> +UPSTREAM_CHECK_REGEX ?=3D "(?P<pver>\d+(\.\d+)+)\.tar"
> +
> +CFLAGS +=3D "-Wall -Wextra -DVERSION=3D'"$(VERSION)"'"
> +
> +do_install_append() {
> +    install -d ${D}${bindir}
> +    install -m 755 ${S}/stress-ng ${D}${bindir}/stress-ng
> +}
> --=20
> 2.14.3
>=20


