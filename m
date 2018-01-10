Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 00BE5788CB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jan 2018 05:34:27 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Jan 2018 21:34:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,338,1511856000"; d="scan'208,223";a="18051577"
Received: from efconnel-mobl.amr.corp.intel.com ([10.255.230.181])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Jan 2018 21:34:28 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
Message-Id: <1919E005-DFF5-46F3-BAF4-8585985A2BC5@linux.intel.com>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Date: Tue, 9 Jan 2018 21:34:27 -0800
In-Reply-To: <2AD6C5F1-F975-4F02-B2E7-82091F520993@linux.intel.com>
To: Tim Orling <timothy.t.orling@linux.intel.com>
References: <20180110041539.11889-1-timothy.t.orling@linux.intel.com>
	<20180110051244.GF9657@denix.org>
	<2AD6C5F1-F975-4F02-B2E7-82091F520993@linux.intel.com>
X-Mailer: Apple Mail (2.3273)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] stress-ng: upgrade to 0.09.09 and fix musl build
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
X-List-Received-Date: Wed, 10 Jan 2018 05:34:28 -0000
X-Groupsio-MsgNum: 70261
Content-Type: multipart/mixed;
	boundary="Apple-Mail=_FC46CD4E-C41D-4426-AF6D-D931FBE53645"

--Apple-Mail=_FC46CD4E-C41D-4426-AF6D-D931FBE53645
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Here=E2=80=99s another bb diff with -M05 threshold

=20



--Apple-Mail=_FC46CD4E-C41D-4426-AF6D-D931FBE53645
Content-Disposition: attachment;
	filename=0001-stress-ng-upgrade-to-0.09.09-and-fix-musl-build.patch
Content-Type: application/octet-stream;
	x-unix-mode=0644;
	name="0001-stress-ng-upgrade-to-0.09.09-and-fix-musl-build.patch"
Content-Transfer-Encoding: quoted-printable

From fe159c68a8d004c1ea44274273141a33be3c0f9f Mon Sep 17 00:00:00 2001
From: Tim Orling <timothy.t.orling@linux.intel.com>
Date: Tue, 9 Jan 2018 19:35:51 -0800
Subject: [PATCH] stress-ng: upgrade to 0.09.09 and fix musl build

* Upstream tarballs are now xz compressed
* Patch 0001 modified:
  - stress-pthread and stress-context change not needed
* Add patch to fix stress-fcntl for musl
* Add patch to fix syntax errors in stress-fcntl
  - Accepted upstream
* Add UPSTREAM_CHECK_URI and UPSTREAM_CHECK_REGEX

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../0001-Several-changes-to-fix-musl-build.patch   | 31 +-------------
 .../0002-stress-fcntl-fix-build-for-musl.patch     | 27 +++++++++++++
 .../0003-stress-fcntl.c-fix-syntax-errors.patch    | 47 ++++++++++++++++++=
++++
 .../{stress-ng_0.08.17.bb =3D> stress-ng_0.09.09.bb} | 14 +++++--
 4 files changed, 86 insertions(+), 33 deletions(-)
 create mode 100644 meta-oe/recipes-test/stress-ng/stress-ng/0002-stress-fc=
ntl-fix-build-for-musl.patch
 create mode 100644 meta-oe/recipes-test/stress-ng/stress-ng/0003-stress-fc=
ntl.c-fix-syntax-errors.patch
 rename meta-oe/recipes-test/stress-ng/{stress-ng_0.08.17.bb =3D> stress-ng=
_0.09.09.bb} (49%)

diff --git a/meta-oe/recipes-test/stress-ng/stress-ng/0001-Several-changes-=
to-fix-musl-build.patch b/meta-oe/recipes-test/stress-ng/stress-ng/0001-Sev=
eral-changes-to-fix-musl-build.patch
index 3ed7efc7e..f90e704f0 100644
--- a/meta-oe/recipes-test/stress-ng/stress-ng/0001-Several-changes-to-fix-=
musl-build.patch
+++ b/meta-oe/recipes-test/stress-ng/stress-ng/0001-Several-changes-to-fix-=
musl-build.patch
@@ -11,7 +11,6 @@ swapcontext, musl provide the definition but not the impl=
ementation due
   to that functions are pre-POSIX and set to be deprecated.
   stress-{resources, pty}.c: Doesn't include termio.h and remove stress
   operations that uses struct termio, musl doesn't provide that struct.
-stress-pthread.c: Change pthread_yield to sched_yield to be more compatibl=
e.
 stress-malloc.c: Check for definition of M_MMAP_THRESHOLD musl doesn't
   ptovide that constant.
 stress-madvise.c: Add static poision_count integer, definition of
@@ -19,13 +18,13 @@ stress-madvise.c: Add static poision_count integer, def=
inition of
 cache.c: Define GLOB_ONLYDIR not available on MUSL.
=20
 Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>
+Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
+
 Upstream-status: Pending
 ---
  cache.c            |  4 ++++
- stress-context.c   |  2 +-
  stress-madvise.c   |  1 +
  stress-malloc.c    |  2 +-
- stress-pthread.c   |  2 +-
  stress-pty.c       | 18 ------------------
  stress-resources.c |  1 -
  stress-stackmmap.c |  2 +-
@@ -46,19 +45,6 @@ index e01fad0..27870ee 100644
  #if defined(__linux__)
  #define SYS_CPU_PREFIX               "/sys/devices/system/cpu"
  #define GLOB_PATTERN SYS_CPU_PREFIX  "/cpu[0-9]*"
-diff --git a/stress-context.c b/stress-context.c
-index c5f50ed..67209e5 100644
---- a/stress-context.c
-+++ b/stress-context.c
-@@ -24,7 +24,7 @@
-  */
- #include "stress-ng.h"
-=20
--#if !defined(__OpenBSD__)
-+#if !defined(__OpenBSD__) && False
-=20
- #include <ucontext.h>
-=20
 diff --git a/stress-madvise.c b/stress-madvise.c
 index 43ea454..2e1f8ee 100644
 --- a/stress-madvise.c
@@ -84,19 +70,6 @@ index 8dbe5cc..f505f32 100644
  	if (get_setting("malloc-threshold", &malloc_threshold))
  		(void)mallopt(M_MMAP_THRESHOLD, (int)malloc_threshold);
  #endif
-diff --git a/stress-pthread.c b/stress-pthread.c
-index 323a1d4..8269f4c 100644
---- a/stress-pthread.c
-+++ b/stress-pthread.c
-@@ -139,7 +139,7 @@ static void *stress_pthread_func(void *parg)
- 			break;
- 		}
- #if !defined(__NetBSD__) && !defined(__sun__)
--		(void)pthread_yield();
-+		(void)sched_yield();
- #endif
- 	}
- 	ret =3D pthread_mutex_unlock(&mutex);
 diff --git a/stress-pty.c b/stress-pty.c
 index 8c3edf8..518f118 100644
 --- a/stress-pty.c
diff --git a/meta-oe/recipes-test/stress-ng/stress-ng/0002-stress-fcntl-fix=
-build-for-musl.patch b/meta-oe/recipes-test/stress-ng/stress-ng/0002-stres=
s-fcntl-fix-build-for-musl.patch
new file mode 100644
index 000000000..826340169
--- /dev/null
+++ b/meta-oe/recipes-test/stress-ng/stress-ng/0002-stress-fcntl-fix-build-=
for-musl.patch
@@ -0,0 +1,27 @@
+From 7be4680930e2867cefd5c8fe27a4ae81a4ae2628 Mon Sep 17 00:00:00 2001
+From: Tim Orling <timothy.t.orling@linux.intel.com>
+Date: Tue, 9 Jan 2018 18:38:45 -0800
+Subject: [PATCH] stress-fcntl: fix build for musl
+
+Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
+
+Upstream-status: Pending
+---
+ stress-fcntl.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/stress-fcntl.c b/stress-fcntl.c
+index b7eade2..9fa5c38 100644
+--- a/stress-fcntl.c
++++ b/stress-fcntl.c
+@@ -413,6 +413,7 @@ ofd_lock_abort:	{ /* Nowt */ }
+=20
+ #if defined(F_GET_FILE_RW_HINT) && defined(F_SET_FILE_RW_HINT)
+ 	{
++		int ret;
+ 		size_t i;
+ 		unsigned long hint;
+ 		static const unsigned long hints[] =3D {
+--=20
+2.14.3
+
diff --git a/meta-oe/recipes-test/stress-ng/stress-ng/0003-stress-fcntl.c-f=
ix-syntax-errors.patch b/meta-oe/recipes-test/stress-ng/stress-ng/0003-stre=
ss-fcntl.c-fix-syntax-errors.patch
new file mode 100644
index 000000000..4b6a9b391
--- /dev/null
+++ b/meta-oe/recipes-test/stress-ng/stress-ng/0003-stress-fcntl.c-fix-synt=
ax-errors.patch
@@ -0,0 +1,47 @@
+From 8537dcafb12be4d986b571f1e1d9f3ceecdc8e63 Mon Sep 17 00:00:00 2001
+From: Tim Orling <timothy.t.orling@linux.intel.com>
+Date: Sun, 7 Jan 2018 21:29:12 -0800
+Subject: [PATCH] stress-fcntl.c: fix syntax errors
+
+Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
+
+Upstream-status: Accepted
+(commit 61d93d6857256cd49df6a6302caf6e7bb69b0f46)
+---
+ stress-fcntl.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/stress-fcntl.c b/stress-fcntl.c
+index 7c15d28..b7eade2 100644
+--- a/stress-fcntl.c
++++ b/stress-fcntl.c
+@@ -173,7 +173,7 @@ static int do_fcntl(const args_t *args, const int fd)
+ 		owner.pid =3D getpgrp();
+ 		ret =3D fcntl(fd, F_SETOWN_EX, &owner);
+ 		check_return(args, ret, "F_SETOWN_EX, F_OWNER_PGRP");
+-#else if defined(HAVE_GETPGRP) && defined(F_OWNER_GID)
++#elif defined(HAVE_GETPGRP) && defined(F_OWNER_GID)
+ 		owner.type =3D F_OWNER_GID;
+ 		owner.pid =3D getpgrp();
+ 		ret =3D fcntl(fd, F_SETOWN_EX, &owner);
+@@ -202,7 +202,7 @@ static int do_fcntl(const args_t *args, const int fd)
+ 		owner.type =3D F_OWNER_PGRP;
+ 		ret =3D fcntl(fd, F_GETOWN_EX, &owner);
+ 		check_return(args, ret, "F_GETOWN_EX, F_OWNER_PGRP");
+-#ele if defined(F_OWNER_GID)
++#elif defined(F_OWNER_GID)
+ 		owner.type =3D F_OWNER_GID;
+ 		ret =3D fcntl(fd, F_GETOWN_EX, &owner);
+ 		check_return(args, ret, "F_GETOWN_EX, F_OWNER_GID");
+@@ -436,7 +436,7 @@ ofd_lock_abort:	{ /* Nowt */ }
+ #endif
+ 		};
+=20
+-		ret =3D fcntl(fd, F_GET_FILE_RW_HINT, &hint)
++		ret =3D fcntl(fd, F_GET_FILE_RW_HINT, &hint);
+ 		if (ret =3D=3D 0) {
+ 			for (i =3D 0; i < SIZEOF_ARRAY(hints); i++) {
+ 				hint =3D hints[i];
+--=20
+2.14.3
+
diff --git a/meta-oe/recipes-test/stress-ng/stress-ng_0.08.17.bb b/meta-oe/=
recipes-test/stress-ng/stress-ng_0.09.09.bb
similarity index 49%
rename from meta-oe/recipes-test/stress-ng/stress-ng_0.08.17.bb
rename to meta-oe/recipes-test/stress-ng/stress-ng_0.09.09.bb
index dc5b2e8eb..24f55ada2 100644
--- a/meta-oe/recipes-test/stress-ng/stress-ng_0.08.17.bb
+++ b/meta-oe/recipes-test/stress-ng/stress-ng_0.09.09.bb
@@ -5,12 +5,18 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fc=
e4486a80fdaf4a4263"
=20
 DEPENDS =3D "zlib libaio"
=20
-SRC_URI =3D "http://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.gz =
\
+SRC_URI =3D "http://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz =
\
           "
-SRC_URI_append_libc-musl =3D "file://0001-Several-changes-to-fix-musl-buil=
d.patch"
+SRC_URI_append_libc-musl =3D " \
+    file://0001-Several-changes-to-fix-musl-build.patch \
+    file://0002-stress-fcntl-fix-build-for-musl.patch \
+    file://0003-stress-fcntl.c-fix-syntax-errors.patch"
=20
-SRC_URI[md5sum] =3D "e0f6497a8c06f5d652bc2ad88d449c12"
-SRC_URI[sha256sum] =3D "37cc73e42f5bdb0e0571ba88f6a69b8f05ee28e51afcafc223=
1c1058b1a5dd18"
+SRC_URI[md5sum] =3D "6e4df71095e780654ccc0a713b8423fe"
+SRC_URI[sha256sum] =3D "e993fddb1d990a0cdb23b2af6cf6c417a1c09e155ada7c558a=
d80eae8a5feed3"
+
+UPSTREAM_CHECK_URI ?=3D "http://kernel.ubuntu.com/~cking/tarballs/${BPN}/"
+UPSTREAM_CHECK_REGEX ?=3D "(?P<pver>\d+(\.\d+)+)\.tar"
=20
 CFLAGS +=3D "-Wall -Wextra -DVERSION=3D'"$(VERSION)"'"
=20
--=20
2.14.3


--Apple-Mail=_FC46CD4E-C41D-4426-AF6D-D931FBE53645--
