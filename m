Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R9fSz-0004M7-1N
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Sep 2011 17:57:39 +0200
Received: by fxi1 with SMTP id 1so3210360fxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Sep 2011 08:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=j8m2UWQSLYiI+Rvo9bPsTVIazbMN+5qXg5xMvEsYn48=;
	b=gYxgsS/vrX28yJ4BT5snP3nxHIxO3GsSaQf8yP92u5bzCWMK6A/UM3kC1mDyT6eIZD
	/cnjmP+OEnJuy94Wu+K7S5oZdR6OcFW4WRvOabBuYMihAHtRBxYdNxXGfCs+Q/YzH521
	cGOzsq2TkAxRnGZcYBjuxiiEy27FGt+DtcZ8U=
Received: by 10.223.35.133 with SMTP id p5mr7478152fad.133.1317397925071;
	Fri, 30 Sep 2011 08:52:05 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w6sm7233526fah.0.2011.09.30.08.52.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Sep 2011 08:52:03 -0700 (PDT)
Date: Fri, 30 Sep 2011 17:51:57 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110930155157.GA7364@jama.jama.net>
References: <cover.1317387144.git.Martin.Jansa@gmail.com>
	<7a73a24c82f9d721c3342a14097cb105ba82a3ca.1317387144.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <7a73a24c82f9d721c3342a14097cb105ba82a3ca.1317387144.git.Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][meta-efl][PATCH 01/15] glib-2.0: upgrade from 2.29.3+git to 2.30.0 release
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Sep 2011 15:57:40 -0000
X-Groupsio-MsgNum: 34528
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9jxsPFA5p3P2qPhR"
Content-Disposition: inline

--9jxsPFA5p3P2qPhR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 30, 2011 at 02:56:37PM +0200, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  ...003-gatomic-proper-pointer-get-cast.patch.patch |   28 -------
>  .../0005-glib-mkenums-interpreter.patch.patch      |   25 -------
>  .../60_wait-longer-for-threads-to-die.patch        |   24 +++---
>  .../glib-2.0/remove.test.for.qsort_r.patch         |   77 ++++++++++----=
------
>  .../{glib-2.0_git.bb =3D> glib-2.0_2.30.0.bb}        |   21 ++++--
>  5 files changed, 65 insertions(+), 110 deletions(-)
>  delete mode 100644 meta-oe/recipes-core/glib-2.0/glib-2.0/0003-gatomic-p=
roper-pointer-get-cast.patch.patch
>  delete mode 100644 meta-oe/recipes-core/glib-2.0/glib-2.0/0005-glib-mken=
ums-interpreter.patch.patch
>  rename meta-oe/recipes-core/glib-2.0/{glib-2.0_git.bb =3D> glib-2.0_2.30=
=2E0.bb} (61%)

This patch was superseeded by new pull request..
[meta-oe][PATCH 0/6] Glib related changes

>=20
> diff --git a/meta-oe/recipes-core/glib-2.0/glib-2.0/0003-gatomic-proper-p=
ointer-get-cast.patch.patch b/meta-oe/recipes-core/glib-2.0/glib-2.0/0003-g=
atomic-proper-pointer-get-cast.patch.patch
> deleted file mode 100644
> index ad1ca12..0000000
> --- a/meta-oe/recipes-core/glib-2.0/glib-2.0/0003-gatomic-proper-pointer-=
get-cast.patch.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -From 3d371334d5668bcd02a38ff99884bd343c244d68 Mon Sep 17 00:00:00 2001
> -From: Koen Kooi <koen@dominion.thruhere.net>
> -Date: Sat, 18 Jun 2011 23:51:35 +0200
> -Subject: [PATCH 3/7] gatomic-proper-pointer-get-cast.patch
> -
> -Upstream-Status: Unknown
> -
> -Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ----
> - glib/gatomic.h |    2 +-
> - 1 files changed, 1 insertions(+), 1 deletions(-)
> -
> -diff --git a/glib/gatomic.h b/glib/gatomic.h
> -index ddd39b8..b758142 100644
> ---- a/glib/gatomic.h
> -+++ b/glib/gatomic.h
> -@@ -70,7 +70,7 @@ void     g_atomic_pointer_set                  (volati=
le gpointer G_GNUC_MAY_ALI
> -   (g_atomic_int_set) ((volatile gint G_GNUC_MAY_ALIAS *) (volatile void=
 *) (atomic), (newval)))
> - # define g_atomic_pointer_get(atomic) \
> -  ((void) sizeof (gchar [sizeof (*(atomic)) =3D=3D sizeof (gpointer) ? 1=
 : -1]), \
> --  (g_atomic_pointer_get) ((volatile gpointer G_GNUC_MAY_ALIAS *) (volat=
ile void *) (atomic)))
> -+  (g_atomic_pointer_get) ((volatile gpointer G_GNUC_MAY_ALIAS *) (volat=
ile void G_GNUC_MAY_ALIAS *) (atomic)))
> - # define g_atomic_pointer_set(atomic, newval) \
> -  ((void) sizeof (gchar [sizeof (*(atomic)) =3D=3D sizeof (gpointer) ? 1=
 : -1]), \
> -   (g_atomic_pointer_set) ((volatile gpointer G_GNUC_MAY_ALIAS *) (volat=
ile void *) (atomic), (newval)))
> ---=20
> -1.6.6.1
> -
> diff --git a/meta-oe/recipes-core/glib-2.0/glib-2.0/0005-glib-mkenums-int=
erpreter.patch.patch b/meta-oe/recipes-core/glib-2.0/glib-2.0/0005-glib-mke=
nums-interpreter.patch.patch
> deleted file mode 100644
> index 6780330..0000000
> --- a/meta-oe/recipes-core/glib-2.0/glib-2.0/0005-glib-mkenums-interprete=
r.patch.patch
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -From a8e5c4a808e7f8572bd5023645a6cb4386b9aff8 Mon Sep 17 00:00:00 2001
> -From: Koen Kooi <koen@dominion.thruhere.net>
> -Date: Sat, 18 Jun 2011 23:52:17 +0200
> -Subject: [PATCH 5/7] don't leak buildpaths into perl hashbang
> -
> -Upstream-Status: Unknown
> -
> -Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ----
> - gobject/glib-mkenums.in |    2 +-
> - 1 files changed, 1 insertions(+), 1 deletions(-)
> -
> -diff --git a/gobject/glib-mkenums.in b/gobject/glib-mkenums.in
> -index 6372245..b486fe9 100755
> ---- a/gobject/glib-mkenums.in
> -+++ b/gobject/glib-mkenums.in
> -@@ -1,4 +1,4 @@
> --#! @PERL_PATH@
> -+#! /usr/bin/env perl
> -=20
> - use warnings;
> - use File::Basename;
> ---=20
> -1.6.6.1
> -
> diff --git a/meta-oe/recipes-core/glib-2.0/glib-2.0/60_wait-longer-for-th=
reads-to-die.patch b/meta-oe/recipes-core/glib-2.0/glib-2.0/60_wait-longer-=
for-threads-to-die.patch
> index b65a474..4ff7b80 100644
> --- a/meta-oe/recipes-core/glib-2.0/glib-2.0/60_wait-longer-for-threads-t=
o-die.patch
> +++ b/meta-oe/recipes-core/glib-2.0/glib-2.0/60_wait-longer-for-threads-t=
o-die.patch
> @@ -4,9 +4,9 @@ Rebased for glib-2.27.3 by Dongxiao Xu <dongxiao.xu@intel=
=2Ecom>, 11/16/2010
> =20
>  Upstream-Status: Inappropriate [patches for test code]
> =20
> -diff -ruN glib-2.27.3-orig/tests/threadpool-test.c glib-2.27.3/tests/thr=
eadpool-test.c
> ---- glib-2.27.3-orig/tests/threadpool-test.c	2009-04-01 07:04:21.0000000=
00 +0800
> -+++ glib-2.27.3/tests/threadpool-test.c	2010-11-16 12:28:09.002172678 +0=
800
> +diff -ruN glib-2.30.0-orig/tests/threadpool-test.c glib-2.30.0/tests/thr=
eadpool-test.c
> +--- glib-2.30.0-orig/tests/threadpool-test.c	2009-04-01 07:04:21.0000000=
00 +0800
> ++++ glib-2.30.0/tests/threadpool-test.c	2010-11-16 12:28:09.002172678 +0=
800
>  @@ -5,8 +5,8 @@
>  =20
>   #include <glib.h>
> @@ -18,16 +18,16 @@ diff -ruN glib-2.27.3-orig/tests/threadpool-test.c gl=
ib-2.27.3/tests/threadpool-
>  =20
>   #define WAIT                5    /* seconds */
>   #define MAX_THREADS         10
> -@@ -124,10 +124,10 @@
> -    DEBUG_MSG (("[unused] stopping unused threads"));
> -    g_thread_pool_stop_unused_threads ();
> +@@ -130,10 +130,10 @@
> +            test_count_threads () =3D=3D 0)
> +          break;
>  =20
> --   DEBUG_MSG (("[unused] waiting ONE second for threads to die"));
> -+   DEBUG_MSG (("[unused] waiting FIVE second for threads to die"));
> +-       DEBUG_MSG (("[unused] waiting ONE second for threads to die"));
> ++       DEBUG_MSG (("[unused] waiting FIVE second for threads to die"));
>  =20
> -    /* Some time for threads to die. */
> --   g_usleep (G_USEC_PER_SEC);
> -+   g_usleep (5 * G_USEC_PER_SEC);
> +        /* Some time for threads to die. */
> +-       g_usleep (G_USEC_PER_SEC);
> ++       g_usleep (5 * G_USEC_PER_SEC);
> +      }
>  =20
>      DEBUG_MSG (("[unused] stopped idle threads, %d remain, %d threads st=
ill exist",
> - 	       g_thread_pool_get_num_unused_threads (),
> diff --git a/meta-oe/recipes-core/glib-2.0/glib-2.0/remove.test.for.qsort=
_r.patch b/meta-oe/recipes-core/glib-2.0/glib-2.0/remove.test.for.qsort_r.p=
atch
> index 3300eb0..05805d0 100644
> --- a/meta-oe/recipes-core/glib-2.0/glib-2.0/remove.test.for.qsort_r.patch
> +++ b/meta-oe/recipes-core/glib-2.0/glib-2.0/remove.test.for.qsort_r.patch
> @@ -1,52 +1,49 @@
>  while cross compiling we cannot execute run tests
> =20
> -diff --git a/configure.ac b/configure.ac
> -index 378b082..3f2a8d3 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -580,46 +580,7 @@ AC_FUNC_VPRINTF
> - AC_FUNC_ALLOCA
> - AC_CHECK_FUNCS(mmap posix_memalign memalign valloc fsync pipe2)
> - AC_CHECK_FUNCS(atexit on_exit timegm gmtime_r)
> +--- glib-2.30.0.orig/configure.ac	2011-09-29 16:57:35.000000000 +0200
> ++++ glib-2.30.0/configure.ac	2011-09-29 17:00:19.931493488 +0200
> +@@ -586,45 +586,7 @@
> + dnl until we have checked this function is actually usable
> + AC_CHECK_FUNC([qsort_r])
> +=20
>  -# BSD has a qsort_r with wrong argument order
> --AC_CACHE_CHECK([for qsort_r], glib_cv_have_qsort_r, [
> --AC_RUN_IFELSE([AC_LANG_SOURCE([[
> --#define _GNU_SOURCE
> --#include <stdlib.h>
> +-if test x$ac_cv_func_qsort_r =3D xyes ; then
> +-  AC_CACHE_CHECK([if qsort_r uses glibc compatible argument order], gli=
b_cv_have_qsort_r, [
> +-  AC_RUN_IFELSE([AC_LANG_SOURCE([[
> +-  #define _GNU_SOURCE
> +-  #include <stdlib.h>
>  -
> --static int
> --cmp (const void *a, const void *b, void *c)
> --{
> --  const int *ia =3D a;
> --  const int *ib =3D b;
> +-  static int
> +-  cmp (const void *a, const void *b, void *c)
> +-  {
> +-    const int *ia =3D a;
> +-    const int *ib =3D b;
>  -
> --  if (*ia < *ib)
> --    return -1;
> --  else if (*ia > *ib)
> --    return 1;
> --  else
> --    return 0;
> --}
> +-    if (*ia < *ib)
> +-      return -1;
> +-    else if (*ia > *ib)
> +-      return 1;
> +-    else
> +-      return 0;
> +-  }
>  -
> --int
> --main (int argc, char **argv)
> --{
> --  int arr[3] =3D { 1, 2, 0 };
> --  int d =3D 3;
> +-  int
> +-  main (int argc, char **argv)
> +-  {
> +-    int arr[3] =3D { 1, 2, 0 };
> +-    int d =3D 3;
>  -
> --  qsort_r (arr, 3, sizeof (int), cmp, &d);
> +-    qsort_r (arr, 3, sizeof (int), cmp, &d);
>  -
> --  if (arr[0] =3D=3D 0 && arr[1] =3D=3D 1 && arr[2] =3D=3D 2)
> --    return 0;
> --  else
> --    return 1;
> --}]])],[glib_cv_have_qsort_r=3Dyes],[glib_cv_have_qsort_r=3Dno])])
> +-    if (arr[0] =3D=3D 0 && arr[1] =3D=3D 1 && arr[2] =3D=3D 2)
> +-      return 0;
> +-    else
> +-      return 1;
> +-  }]])],[glib_cv_have_qsort_r=3Dyes],[glib_cv_have_qsort_r=3Dno])])
> +-fi
>  -
> --if test $glib_cv_have_qsort_r =3D yes ; then
> --  AC_MSG_RESULT([yes])
> --    AC_DEFINE(HAVE_QSORT_R, 1, [Define to 1 if you have the 'qsort_r' f=
unction])
> --else
> --  AC_MSG_RESULT([no])
> +-if test x$glib_cv_have_qsort_r =3D xyes ; then
> +-  AC_DEFINE(HAVE_QSORT_R, 1, [Define to 1 if you have the 'qsort_r' fun=
ction])
>  -fi
>  +AC_DEFINE(HAVE_QSORT_R, 1, [Define to 1 if you have the 'qsort_r' funct=
ion])
>  =20
> diff --git a/meta-oe/recipes-core/glib-2.0/glib-2.0_git.bb b/meta-oe/reci=
pes-core/glib-2.0/glib-2.0_2.30.0.bb
> similarity index 61%
> rename from meta-oe/recipes-core/glib-2.0/glib-2.0_git.bb
> rename to meta-oe/recipes-core/glib-2.0/glib-2.0_2.30.0.bb
> index 34fcaf6..b4305b8 100644
> --- a/meta-oe/recipes-core/glib-2.0/glib-2.0_git.bb
> +++ b/meta-oe/recipes-core/glib-2.0/glib-2.0_2.30.0.bb
> @@ -1,22 +1,22 @@
>  require glib.inc
> =20
>  PE =3D "1"
> -PR =3D "r1"
> =20
>  DEFAULT_PREFERENCE =3D "-1"
> =20
>  DEPENDS +=3D "libffi python-argparse-native"
>  DEPENDS_virtclass-native +=3D "libffi-native python-argparse-native"
> =20
> -SRC_URI =3D "git://git.gnome.org/glib;protocol=3Dgit;branch=3Dmaster \
> +SHRT_VER =3D "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getV=
ar('PV',d,1).split('.')[1]}"
> +
> +SRC_URI =3D "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.bz2 \
>             file://configure-libtool.patch \
>             file://60_wait-longer-for-threads-to-die.patch \
>             file://g_once_init_enter.patch \
>             file://remove.test.for.qsort_r.patch \
>            "
> -SRCREV =3D "d97cbc6731deab137770bc0fe9c69b06f689f5b4"
> -PV =3D "2.29.3+gitr${SRCPV}"
> -S =3D "${WORKDIR}/git"
> +SRC_URI[md5sum] =3D "fee101d9d7daa8ddfbae00325f307f3b"
> +SRC_URI[sha256sum] =3D "ca9c731017ab370859e847f8b70079bc6dcf389dc0ccb0d0=
419925aff81b9687"
> =20
>  # Only apply this patch for target recipe on uclibc
>  SRC_URI_append_libc-uclibc =3D " ${@['', 'file://no-iconv.patch']['${PN}=
' =3D=3D '${BPN}']}"
> @@ -30,3 +30,14 @@ do_configure_prepend() {
>    sed -i 's/SUBDIRS =3D . m4macros glib gmodule gthread gobject gio test=
s po docs/SUBDIRS =3D . m4macros glib gmodule gthread gobject gio tests po/=
g' ${S}/Makefile.am
>    sed -i -e "s:TEST_PROGS +=3D gdbus-serialization::g"  ${S}/gio/tests/M=
akefile.am
>  }
> +
> +do_install_append() {
> +  # remove some unpackaged files
> +  rm -f ${D}${datadir}/glib-2.0/gettext/mkinstalldirs
> +  rm -f ${D}${datadir}/glib-2.0/gettext/po/Makefile.in.in
> +  rm -f ${D}${libdir}/gdbus-2.0/codegen/*.pyc
> +  rm -f ${D}${libdir}/gdbus-2.0/codegen/*.pyo
> +}
> +
> +PACKAGES +=3D "${PN}-codegen"
> +FILES_${PN}-codegen =3D "${libdir}/gdbus-2.0/codegen/*.py"
> --=20
> 1.7.6.1
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--9jxsPFA5p3P2qPhR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6F5Z0ACgkQN1Ujt2V2gBwoSwCfZOAdETupd8pe2Oftj+Dl6c8e
zoMAn3coMDI297kqAKRmjguE8MWSiHyG
=aQAx
-----END PGP SIGNATURE-----

--9jxsPFA5p3P2qPhR--
