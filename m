Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PpSIs-0003WA-Sj
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Feb 2011 22:19:22 +0100
Received: by mail-fx0-f47.google.com with SMTP id 17so620907fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Feb 2011 13:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=L5d/tHBwNALyLmrvvczUz6ji1k8V1sUR+sT6mTdmPVs=;
	b=lJf7T0WUqzP6fqfU1u8zi4Cv/fRC8HcIO85HTOsy/andysBPUoiHkl+kG/IYbKQUsX
	HbOo+T4c22/q04J5V7DPDlZJ3a0F16eXWs1nk8oK/S52OCLVFDFXfp8W/ZUsgqG7phow
	UMlkXDrM8AxV+08Xf1ILYjlO1UoxWb8Hxf/nI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=s2pqN/Qq9YOIRZ12zK+DpS/10KwPo0oAiK6muwh/Eg+CK6xi17f1pcspwzVX6Oysqc
	XyOC4JwefCRcbNHKZvM0YpMTKaP+iiW07WgEkbtygDc701hmlnoY8tn/f/dVIoLphqBc
	v+bX6WOoiDftNCwx7/NJ471nhyODNB+bIdqx0=
Received: by 10.223.96.199 with SMTP id i7mr6911458fan.101.1297804604967; Tue,
	15 Feb 2011 13:16:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.66.22 with HTTP; Tue, 15 Feb 2011 13:16:16 -0800 (PST)
In-Reply-To: <1297803782-8395-1-git-send-email-Martin.Jansa@gmail.com>
References: <1297803782-8395-1-git-send-email-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 15 Feb 2011 13:16:16 -0800
Message-ID: <AANLkTi=ZYgy4jcrz2gOGyyzz9i8FT_sA3qRY6m--o4AL@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/4] glib-2.0: add 2.28.0, needed by newer libsoup
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
X-List-Received-Date: Tue, 15 Feb 2011 21:19:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2011 at 1:02 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

You have to reset PR to 0 otherwise ok

Acked-by: Khem Raj <raj.khem@gmail.com>


> ---
> =C2=A0.../60_wait-longer-for-threads-to-die.patch =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 26 ++++++
> =C2=A0.../glib-2.0/glib-2.0-2.28.0/configure-ipv6.patch =C2=A0| =C2=A0 92=
 ++++++++++++++++++++
> =C2=A0.../glib-2.0-2.28.0/configure-libtool.patch =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 30 +++++++
> =C2=A0.../glib-2.0-2.28.0/g_once_init_enter.patch =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 11 +++
> =C2=A0.../gatomic-proper-pointer-get-cast.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 12 +++
> =C2=A0...b2-fix-compilation-with-no-builtin-atomic.patch | =C2=A0 25 ++++=
++
> =C2=A0recipes/glib-2.0/glib-2.0_2.28.0.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 76 ++++++++++++++++
> =C2=A07 files changed, 272 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 recipes/glib-2.0/glib-2.0-2.28.0/60_wait-longer-=
for-threads-to-die.patch
> =C2=A0create mode 100644 recipes/glib-2.0/glib-2.0-2.28.0/configure-ipv6.=
patch
> =C2=A0create mode 100644 recipes/glib-2.0/glib-2.0-2.28.0/configure-libto=
ol.patch
> =C2=A0create mode 100644 recipes/glib-2.0/glib-2.0-2.28.0/g_once_init_ent=
er.patch
> =C2=A0create mode 100644 recipes/glib-2.0/glib-2.0-2.28.0/gatomic-proper-=
pointer-get-cast.patch
> =C2=A0create mode 100644 recipes/glib-2.0/glib-2.0-2.28.0/libglib2-fix-co=
mpilation-with-no-builtin-atomic.patch
> =C2=A0create mode 100644 recipes/glib-2.0/glib-2.0_2.28.0.bb
>
> diff --git a/recipes/glib-2.0/glib-2.0-2.28.0/60_wait-longer-for-threads-=
to-die.patch b/recipes/glib-2.0/glib-2.0-2.28.0/60_wait-longer-for-threads-=
to-die.patch
> new file mode 100644
> index 0000000..02fe9ff
> --- /dev/null
> +++ b/recipes/glib-2.0/glib-2.0-2.28.0/60_wait-longer-for-threads-to-die.=
patch
> @@ -0,0 +1,26 @@
> +--- glib/tests/threadpool-test.c.old =C2=A0 2008-02-12 06:11:21.00000000=
0 +0100
> ++++ glib/tests/threadpool-test.c =C2=A0 =C2=A0 =C2=A0 2008-02-12 06:11:5=
2.000000000 +0100
> +@@ -5,8 +5,8 @@
> +
> + #include <glib.h>
> +
> +-#define DEBUG_MSG(x)
> +-/* #define DEBUG_MSG(args) g_printerr args ; g_printerr ("\n"); =C2=A0*=
/
> ++/* #define DEBUG_MSG(x) */
> ++#define DEBUG_MSG(args) g_printerr args ; g_printerr ("\n");
> +
> + #define WAIT =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A05 =
=C2=A0 =C2=A0/* seconds */
> + #define MAX_THREADS =C2=A0 =C2=A0 =C2=A0 =C2=A0 10
> +@@ -124,10 +124,10 @@
> + =C2=A0 =C2=A0DEBUG_MSG (("[unused] stopping unused threads"));
> + =C2=A0 =C2=A0g_thread_pool_stop_unused_threads ();
> +
> +- =C2=A0 DEBUG_MSG (("[unused] waiting ONE second for threads to die"));
> ++ =C2=A0 DEBUG_MSG (("[unused] waiting FIVE second for threads to die"))=
;
> +
> + =C2=A0 =C2=A0/* Some time for threads to die. */
> +- =C2=A0 g_usleep (G_USEC_PER_SEC);
> ++ =C2=A0 g_usleep (5 * G_USEC_PER_SEC);
> +
> + =C2=A0 =C2=A0DEBUG_MSG (("[unused] stopped idle threads, %d remain, %d =
threads still exist",
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_thread_pool_get_num_u=
nused_threads (),
> diff --git a/recipes/glib-2.0/glib-2.0-2.28.0/configure-ipv6.patch b/reci=
pes/glib-2.0/glib-2.0-2.28.0/configure-ipv6.patch
> new file mode 100644
> index 0000000..548e0dc
> --- /dev/null
> +++ b/recipes/glib-2.0/glib-2.0-2.28.0/configure-ipv6.patch
> @@ -0,0 +1,92 @@
> +From a619a217e3e5aa5345db631213aec5a3684a3001 Mon Sep 17 00:00:00 2001
> +Subject: [PATCH] autodetect in6addr_{any,loopback} availability
> +
> +Fixes linking error on systems which choose not to support ipv6:
> +./.libs/libgio-2.0.so: undefined reference to `in6addr_loopback'
> +./.libs/libgio-2.0.so: undefined reference to `in6addr_any'
> +
> +Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> +---
> + configure.ac =C2=A0 =C2=A0 =C2=A0 | =C2=A0 31 +++++++++++++++++++++++++=
++++++
> + gio/ginetaddress.c | =C2=A0 16 ++++++++++++++--
> + 2 files changed, 45 insertions(+), 2 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 7114014..023db49 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -1019,6 +1019,37 @@ if test $glib_native_win32 =3D no; then
> + =C2=A0 AC_SUBST(LIBASYNCNS_LIBADD)
> + fi
> +
> ++dnl handle --disable-ipv6
> ++AC_ARG_ENABLE(ipv6, AC_HELP_STRING([--disable-ipv6],[Disable IPv6 suppo=
rt]))
> ++if test "$ipv6" !=3D "no"; then
> ++ =C2=A0AC_DEFINE(HAVE_IPV6, 1, [Define if IPv6 is available])
> ++
> ++ =C2=A0AC_MSG_CHECKING([for struct in6addr_any])
> ++ =C2=A0AC_TRY_LINK(
> ++ =C2=A0 [#define IN_AUTOCONF
> ++ =C2=A0 =C2=A0 #include <sys/types.h>
> ++ =C2=A0 =C2=A0 #include <sys/socket.h>
> ++ =C2=A0 =C2=A0 #include <netinet/in.h>],
> ++ =C2=A0 [struct in6_addr a =3D in6addr_any;
> ++ =C2=A0 =C2=A0return a.s6_addr[0];],
> ++ =C2=A0 [AC_MSG_RESULT(yes)
> ++ =C2=A0 =C2=A0AC_DEFINE(HAVE_IN6ADDR_ANY, 1, [Define if in6addr_any is =
available])],
> ++ =C2=A0 [AC_MSG_RESULT(no)]
> ++ =C2=A0)
> ++ =C2=A0AC_MSG_CHECKING([for struct in6addr_loopback])
> ++ =C2=A0AC_TRY_LINK(
> ++ =C2=A0 [#define IN_AUTOCONF
> ++ =C2=A0 =C2=A0 #include <sys/types.h>
> ++ =C2=A0 =C2=A0 #include <sys/socket.h>
> ++ =C2=A0 =C2=A0 #include <netinet/in.h>],
> ++ =C2=A0 [struct in6_addr a =3D in6addr_loopback;
> ++ =C2=A0 =C2=A0return a.s6_addr[0];],
> ++ =C2=A0 [AC_MSG_RESULT(yes)
> ++ =C2=A0 =C2=A0AC_DEFINE(HAVE_IN6ADDR_LOOPBACK, 1, [Define if in6addr_lo=
opback is available])],
> ++ =C2=A0 [AC_MSG_RESULT(no)]
> ++ =C2=A0)
> ++fi
> ++
> + case $host in
> + =C2=A0 *-*-solaris* )
> + =C2=A0 =C2=A0 =C2=A0AC_DEFINE(_XOPEN_SOURCE_EXTENDED, 1, Needed to get =
declarations for msg_control and msg_controllen on Solaris)
> +diff --git a/gio/ginetaddress.c b/gio/ginetaddress.c
> +index 0f67e4f..ed29be2 100644
> +--- a/gio/ginetaddress.c
> ++++ b/gio/ginetaddress.c
> +@@ -484,7 +484,13 @@ g_inet_address_new_loopback (GSocketFamily family)
> + =C2=A0 =C2=A0 =C2=A0 return g_inet_address_new_from_bytes (addr, family=
);
> + =C2=A0 =C2=A0 }
> + =C2=A0 else
> +- =C2=A0 =C2=A0return g_inet_address_new_from_bytes (in6addr_loopback.s6=
_addr, family);
> ++ =C2=A0 =C2=A0{
> ++#ifdef HAVE_IN6ADDR_LOOPBACK
> ++ =C2=A0 =C2=A0 =C2=A0return g_inet_address_new_from_bytes (in6addr_loop=
back.s6_addr, family);
> ++#else
> ++ =C2=A0 =C2=A0 =C2=A0return NULL;
> ++#endif
> ++ =C2=A0 =C2=A0}
> + }
> +
> + /**
> +@@ -511,7 +517,13 @@ g_inet_address_new_any (GSocketFamily family)
> + =C2=A0 =C2=A0 =C2=A0 return g_inet_address_new_from_bytes (addr, family=
);
> + =C2=A0 =C2=A0 }
> + =C2=A0 else
> +- =C2=A0 =C2=A0return g_inet_address_new_from_bytes (in6addr_any.s6_addr=
, family);
> ++ =C2=A0 =C2=A0{
> ++#ifdef HAVE_IN6ADDR_ANY
> ++ =C2=A0 =C2=A0 =C2=A0return g_inet_address_new_from_bytes (in6addr_any.=
s6_addr, family);
> ++#else
> ++ =C2=A0 =C2=A0 =C2=A0return NULL;
> ++#endif
> ++ =C2=A0 =C2=A0}
> + }
> +
> +
> +--
> +1.7.2.3
> +
> diff --git a/recipes/glib-2.0/glib-2.0-2.28.0/configure-libtool.patch b/r=
ecipes/glib-2.0/glib-2.0-2.28.0/configure-libtool.patch
> new file mode 100644
> index 0000000..e4e9d21
> --- /dev/null
> +++ b/recipes/glib-2.0/glib-2.0-2.28.0/configure-libtool.patch
> @@ -0,0 +1,30 @@
> +diff -uNr glib-2.28.0.orig//configure.ac glib-2.28.0/configure.ac
> +--- glib-2.28.0.orig//configure.ac =C2=A0 =C2=A0 2011-02-08 05:53:25.000=
000000 +0100
> ++++ glib-2.28.0/configure.ac =C2=A0 2011-02-15 15:07:54.683976837 +0100
> +@@ -1378,7 +1378,7 @@
> + =C2=A0 G_MODULE_LDFLAGS=3D
> + else
> + =C2=A0 export SED
> +- =C2=A0G_MODULE_LDFLAGS=3D`(./libtool --config; echo eval echo \\$expor=
t_dynamic_flag_spec) | sh`
> ++ =C2=A0G_MODULE_LDFLAGS=3D`($host_alias-libtool --config; echo eval ech=
o \\$export_dynamic_flag_spec) | sh`
> + fi
> + dnl G_MODULE_IMPL=3D don't reset, so cmd-line can override
> + G_MODULE_NEED_USCORE=3D0
> +@@ -1443,7 +1443,7 @@
> + =C2=A0 =C2=A0 =C2=A0 LDFLAGS=3D"$LDFLAGS $G_MODULE_LDFLAGS"
> + dnl *** check for OSF1/5.0 RTLD_GLOBAL brokenness
> + =C2=A0 =C2=A0 =C2=A0 echo "void glib_plugin_test(void) { }" > plugin.c
> +- =C2=A0 =C2=A0 =C2=A0${SHELL} ./libtool --mode=3Dcompile ${CC} -shared =
\
> ++ =C2=A0 =C2=A0 =C2=A0${SHELL} $host_alias-libtool --mode=3Dcompile ${CC=
} -shared \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -export-dynamic -o plu=
gin.o plugin.c 2>&1 >/dev/null
> + =C2=A0 =C2=A0 =C2=A0 AC_CACHE_CHECK([for RTLD_GLOBAL brokenness],
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 glib_cv_rtldglobal_bro=
ken,[
> +@@ -1517,7 +1517,7 @@
> +
> + AC_MSG_CHECKING(for the suffix of module shared libraries)
> + export SED
> +-shrext_cmds=3D`./libtool --config | grep '^shrext_cmds=3D'`
> ++shrext_cmds=3D`$host_alias-libtool --config | grep '^shrext_cmds=3D'`
> + eval $shrext_cmds
> + module=3Dyes eval std_shrext=3D$shrext_cmds
> + # chop the initial dot
> diff --git a/recipes/glib-2.0/glib-2.0-2.28.0/g_once_init_enter.patch b/r=
ecipes/glib-2.0/glib-2.0-2.28.0/g_once_init_enter.patch
> new file mode 100644
> index 0000000..58e4108
> --- /dev/null
> +++ b/recipes/glib-2.0/glib-2.0-2.28.0/g_once_init_enter.patch
> @@ -0,0 +1,11 @@
> +--- glib-2.22.1/glib/gthread.h.orig =C2=A0 =C2=A02009-10-13 22:53:23.000=
000000 +0200
> ++++ glib-2.22.1/glib/gthread.h 2009-10-13 23:34:59.000000000 +0200
> +@@ -341,7 +341,7 @@
> + G_INLINE_FUNC gboolean
> + g_once_init_enter (volatile gsize *value_location)
> + {
> +- =C2=A0if G_LIKELY ((gpointer) g_atomic_pointer_get (value_location) !=
=3D NULL)
> ++ =C2=A0if G_LIKELY ((gpointer) g_atomic_pointer_get ((volatile gpointer=
 *)value_location) !=3D NULL)
> + =C2=A0 =C2=A0 return FALSE;
> + =C2=A0 else
> + =C2=A0 =C2=A0 return g_once_init_enter_impl (value_location);
> diff --git a/recipes/glib-2.0/glib-2.0-2.28.0/gatomic-proper-pointer-get-=
cast.patch b/recipes/glib-2.0/glib-2.0-2.28.0/gatomic-proper-pointer-get-ca=
st.patch
> new file mode 100644
> index 0000000..5a8e37d
> --- /dev/null
> +++ b/recipes/glib-2.0/glib-2.0-2.28.0/gatomic-proper-pointer-get-cast.pa=
tch
> @@ -0,0 +1,12 @@
> +diff -uri glib-2.26.1.orig/glib/gatomic.h glib-2.26.1/glib/gatomic.h
> +--- glib-2.26.1.orig/glib/gatomic.h =C2=A0 =C2=A02010-07-11 05:56:45.000=
000000 +0200
> ++++ glib-2.26.1/glib/gatomic.h 2010-12-01 16:20:33.140009635 +0100
> +@@ -70,7 +70,7 @@
> + =C2=A0 (g_atomic_int_set) ((volatile gint G_GNUC_MAY_ALIAS *) (volatile=
 void *) (atomic), (newval)))
> + # define g_atomic_pointer_get(atomic) \
> + =C2=A0((void) sizeof (gchar [sizeof (*(atomic)) =3D=3D sizeof (gpointer=
) ? 1 : -1]), \
> +- =C2=A0(g_atomic_pointer_get) ((volatile gpointer G_GNUC_MAY_ALIAS *) (=
volatile void *) (atomic)))
> ++ =C2=A0(g_atomic_pointer_get) ((volatile gpointer G_GNUC_MAY_ALIAS *) (=
volatile void G_GNUC_MAY_ALIAS *) (atomic)))
> + # define g_atomic_pointer_set(atomic, newval) \
> + =C2=A0((void) sizeof (gchar [sizeof (*(atomic)) =3D=3D sizeof (gpointer=
) ? 1 : -1]), \
> + =C2=A0 (g_atomic_pointer_set) ((volatile gpointer G_GNUC_MAY_ALIAS *) (=
volatile void *) (atomic), (newval)))
> diff --git a/recipes/glib-2.0/glib-2.0-2.28.0/libglib2-fix-compilation-wi=
th-no-builtin-atomic.patch b/recipes/glib-2.0/glib-2.0-2.28.0/libglib2-fix-=
compilation-with-no-builtin-atomic.patch
> new file mode 100644
> index 0000000..39c0510
> --- /dev/null
> +++ b/recipes/glib-2.0/glib-2.0-2.28.0/libglib2-fix-compilation-with-no-b=
uiltin-atomic.patch
> @@ -0,0 +1,25 @@
> +From 58096320ea0888c4fbbff318839017a4d2e82703 Mon Sep 17 00:00:00 2001
> +From: Lionel Landwerlin <llandwerlin@gmail.com>
> +Date: Sat, 6 Nov 2010 14:56:15 +0100
> +Subject: [PATCH] glib: fix compilation with no builtin atomic operations=
 compilers
> +
> +Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
> +---
> + glib/gatomic.c | =C2=A0 =C2=A01 +
> + 1 files changed, 1 insertions(+), 0 deletions(-)
> +
> +diff --git a/glib/gatomic.c b/glib/gatomic.c
> +index 845c866..01468ce 100644
> +--- a/glib/gatomic.c
> ++++ b/glib/gatomic.c
> +@@ -881,6 +881,7 @@ g_atomic_pointer_compare_and_exchange (volatile gpoi=
nter G_GNUC_MAY_ALIAS *atomi
> + #endif /* DEFINE_WITH_WIN32_INTERLOCKED */
> +
> + #ifdef DEFINE_WITH_MUTEXES
> ++# include "gthread.h"
> + /* We have to use the slow, but safe locking method */
> + static GMutex *g_atomic_mutex;
> +
> +--
> +1.7.2.3
> +
> diff --git a/recipes/glib-2.0/glib-2.0_2.28.0.bb b/recipes/glib-2.0/glib-=
2.0_2.28.0.bb
> new file mode 100644
> index 0000000..b7f6b3e
> --- /dev/null
> +++ b/recipes/glib-2.0/glib-2.0_2.28.0.bb
> @@ -0,0 +1,76 @@
> +DESCRIPTION =3D "GLib is a general-purpose utility library, \
> +which provides many useful data types, macros, \
> +type conversions, string utilities, file utilities, a main \
> +loop abstraction, and so on. It works on many \
> +UNIX-like platforms, Windows, OS/2 and BeOS."
> +LICENSE =3D "LGPLv2+"
> +SECTION =3D "libs"
> +PRIORITY =3D "optional"
> +DEPENDS =3D "glib-2.0-native gtk-doc zlib"
> +DEPENDS_virtclass-native =3D "gettext-native gtk-doc-native \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0pkgconfig-native"
> +
> +PR =3D "r3"
> +
> +SRC_URI =3D "\
> + =C2=A0http://ftp.gnome.org/pub/GNOME/sources/glib/2.28/glib-${PV}.tar.b=
z2;name=3Darchive \
> + =C2=A0file://glibconfig-sysdefs.h \
> + =C2=A0file://configure-libtool.patch \
> + =C2=A0file://g_once_init_enter.patch \
> + =C2=A0file://gatomic-proper-pointer-get-cast.patch \
> + =C2=A0file://60_wait-longer-for-threads-to-die.patch \
> + =C2=A0file://libglib2-fix-compilation-with-no-builtin-atomic.patch \
> + =C2=A0file://configure-ipv6.patch \
> +"
> +
> +SRC_URI[archive.md5sum] =3D "51dbe36bc03a29a1f9bf6b74fb4a6926"
> +SRC_URI[archive.sha256sum] =3D "0605f538e5c022c237c97a34496979ba71d33c7b=
10b8d8edb84435498a651fb3"
> +
> +inherit autotools gettext
> +
> +S =3D "${WORKDIR}/glib-${PV}"
> +
> +EXTRA_OECONF =3D "--disable-debug "
> +
> +# Add and entry for your favourite arch if your (g)libc has a sane print=
f
> +EXTRA_OECONF_append_glibc_arm =3D " =C2=A0--enable-included-printf=3Dno =
"
> +
> +do_configure_prepend () {
> + =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/glibconfig-sysdefs.h .
> + =C2=A0 =C2=A0 =C2=A0 sed -i -e "s:TEST_PROGS +=3D gdbus-serialization::=
g" =C2=A0${S}/gio/tests/Makefile.am
> +}
> +
> +do_install_append() {
> + =C2=A0 =C2=A0 =C2=A0 sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $=
{D}${bindir}/glib-mkenums || true
> +}
> +
> +EXTRA_OECONF_virtclass-native =3D ""
> +
> +do_configure_prepend_virtclass-native() {
> + =C2=A0 =C2=A0if [ -e ${S}/${TARGET_SYS}-libtool ] ; then
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo "${TARGET_S=
YS}-libtool already present"
> + =C2=A0 =C2=A0else
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0cp ${STAGING_BINDIR}/${TARGET_SYS}-libtool $=
{S}
> + =C2=A0 =C2=A0fi
> +
> +}
> +
> +BBCLASSEXTEND =3D "native"
> +
> +PACKAGES =3D+ "gobject-2.0 gmodule-2.0 gthread-2.0 gio-2.0 glib-2.0-util=
s "
> +LEAD_SONAME =3D "libglib-2.0.*"
> +FILES_glib-2.0-utils =3D "${bindir}/*"
> +FILES_${PN} =3D "${libdir}/lib*so.* ${libdir}/gio/modules/*.so"
> +FILES_${PN}-dev +=3D "${libdir}/glib-2.0 ${datadir}/glib-2.0 ${libdir}/g=
io/modules/*.la"
> +FILES_${PN}-dbg +=3D "${libdir}/gio/modules/.debug"
> +FILES_gmodule-2.0 =3D "${libdir}/libgmodule-2.0.so.*"
> +FILES_gobject-2.0 =3D "${libdir}/libgobject-2.0.so.*"
> +FILES_gio-2.0 =3D "${libdir}/libgio-2.0.so.*"
> +FILES_gthread-2.0 =3D "${libdir}/libgthread-2.0.so.*"
> +
> +# Let various glib components end up in glib package
> +# for compatibility (with binary packages from Maemo).
> +FILES_gthread-2.0_chinook-compat =3D ""
> +FILES_gmodule-2.0_chinook-compat =3D ""
> +FILES_gobject-2.0_chinook-compat =3D ""
> +FILES_gio-2.0_chinook-compat =3D ""
> --
> 1.7.4.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


