Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.5.1610622904116382131
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Jan 2021 03:15:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F5401042
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Jan 2021 03:15:03 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7A3ED3F719
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Jan 2021 03:15:02 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/2] protobuf: apply fix for pkg-config pthread flags
Date: Thu, 14 Jan 2021 11:14:58 +0000
Message-Id: <20210114111458.2170077-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210114111458.2170077-1-ross.burton@arm.com>
References: <20210114111458.2170077-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Adrian Herrera <adrian.herrera@arm.com>

This upstream fix solves an issue by which the protobuf pkg-config
linker flags did not provide -pthread. This can result in segmentation
faults due to no available pthread library.

See https://github.com/protocolbuffers/protobuf/issues/8059 for details
on the issue.

Signed-off-by: Adrian Herrera <adrian.herrera@arm.com>
Change-Id: I628be3b352a2e3bd70a046c8c3b3fe1f10fb9669
---
 .../protobuf/0001-fix-m4-pthread-update.patch | 731 ++++++++++++++++++
 .../protobuf/protobuf_3.14.0.bb               |   1 +
 2 files changed, 732 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf/0001-fix-m=
4-pthread-update.patch

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-fix-m4-pthre=
ad-update.patch b/meta-oe/recipes-devtools/protobuf/protobuf/0001-fix-m4-=
pthread-update.patch
new file mode 100644
index 0000000000..7e4aa103a2
--- /dev/null
+++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-fix-m4-pthread-upda=
te.patch
@@ -0,0 +1,731 @@
+From 8cfb4284b4e8b2893bd30e9c764d45f288e71efb Mon Sep 17 00:00:00 2001
+From: Adam Cozzette <acozzette@google.com>
+Date: Fri, 20 Nov 2020 16:36:56 -0800
+Subject: [PATCH] Updated ax_pthread.m4 to its most recent upstream versi=
on
+
+This should fix #8059.
+
+Upstream-Status: Backport [471317f03adc09a0436670c31d58264b3bef6561]
+Signed-off-by: Adrian Herrera <adrian.herrera@arm.com>
+Expected version: v4.0.0+
+---
+ m4/ax_pthread.m4 | 614 ++++++++++++++++++++++++-----------------------
+ 1 file changed, 318 insertions(+), 296 deletions(-)
+
+diff --git a/m4/ax_pthread.m4 b/m4/ax_pthread.m4
+index d218d1af73..1598d077ff 100644
+--- a/m4/ax_pthread.m4
++++ b/m4/ax_pthread.m4
+@@ -1,5 +1,5 @@
+ # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
+-#        http://www.gnu.org/software/autoconf-archive/ax_pthread.html
++#        https://www.gnu.org/software/autoconf-archive/ax_pthread.html
+ # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
+ #
+ # SYNOPSIS
+@@ -55,6 +55,7 @@
+ #
+ #   Copyright (c) 2008 Steven G. Johnson <stevenj@alum.mit.edu>
+ #   Copyright (c) 2011 Daniel Richard G. <skunk@iSKUNK.ORG>
++#   Copyright (c) 2019 Marc Stevens <marc.stevens@cwi.nl>
+ #
+ #   This program is free software: you can redistribute it and/or modif=
y it
+ #   under the terms of the GNU General Public License as published by t=
he
+@@ -67,7 +68,7 @@
+ #   Public License for more details.
+ #
+ #   You should have received a copy of the GNU General Public License a=
long
+-#   with this program. If not, see <http://www.gnu.org/licenses/>.
++#   with this program. If not, see <https://www.gnu.org/licenses/>.
+ #
+ #   As a special exception, the respective Autoconf Macro's copyright o=
wner
+ #   gives unlimited permission to copy, distribute and modify the confi=
gure
+@@ -82,7 +83,7 @@
+ #   modified version of the Autoconf Macro, you may extend this special
+ #   exception to the GPL to apply to your modified version as well.
+=20
+-#serial 22
++#serial 27
+=20
+ AU_ALIAS([ACX_PTHREAD], [AX_PTHREAD])
+ AC_DEFUN([AX_PTHREAD], [
+@@ -100,22 +101,22 @@ ax_pthread_ok=3Dno
+ # etcetera environment variables, and if threads linking works using
+ # them:
+ if test "x$PTHREAD_CFLAGS$PTHREAD_LIBS" !=3D "x"; then
+-	ax_pthread_save_CC=3D"$CC"
+-	ax_pthread_save_CFLAGS=3D"$CFLAGS"
+-	ax_pthread_save_LIBS=3D"$LIBS"
+-	AS_IF([test "x$PTHREAD_CC" !=3D "x"], [CC=3D"$PTHREAD_CC"])
+-	CFLAGS=3D"$CFLAGS $PTHREAD_CFLAGS"
+-	LIBS=3D"$PTHREAD_LIBS $LIBS"
+-	AC_MSG_CHECKING([for pthread_join using $CC $PTHREAD_CFLAGS $PTHREAD_L=
IBS])
+-	AC_LINK_IFELSE([AC_LANG_CALL([], [pthread_join])], [ax_pthread_ok=3Dye=
s])
+-	AC_MSG_RESULT([$ax_pthread_ok])
+-	if test "x$ax_pthread_ok" =3D "xno"; then
+-		PTHREAD_LIBS=3D""
+-		PTHREAD_CFLAGS=3D""
+-	fi
+-	CC=3D"$ax_pthread_save_CC"
+-	CFLAGS=3D"$ax_pthread_save_CFLAGS"
+-	LIBS=3D"$ax_pthread_save_LIBS"
++        ax_pthread_save_CC=3D"$CC"
++        ax_pthread_save_CFLAGS=3D"$CFLAGS"
++        ax_pthread_save_LIBS=3D"$LIBS"
++        AS_IF([test "x$PTHREAD_CC" !=3D "x"], [CC=3D"$PTHREAD_CC"])
++        CFLAGS=3D"$CFLAGS $PTHREAD_CFLAGS"
++        LIBS=3D"$PTHREAD_LIBS $LIBS"
++        AC_MSG_CHECKING([for pthread_join using $CC $PTHREAD_CFLAGS $PT=
HREAD_LIBS])
++        AC_LINK_IFELSE([AC_LANG_CALL([], [pthread_join])], [ax_pthread_=
ok=3Dyes])
++        AC_MSG_RESULT([$ax_pthread_ok])
++        if test "x$ax_pthread_ok" =3D "xno"; then
++                PTHREAD_LIBS=3D""
++                PTHREAD_CFLAGS=3D""
++        fi
++        CC=3D"$ax_pthread_save_CC"
++        CFLAGS=3D"$ax_pthread_save_CFLAGS"
++        LIBS=3D"$ax_pthread_save_LIBS"
+ fi
+=20
+ # We must check for the threads library under a number of different
+@@ -123,10 +124,12 @@ fi
+ # (e.g. DEC) have both -lpthread and -lpthreads, where one of the
+ # libraries is broken (non-POSIX).
+=20
+-# Create a list of thread flags to try.  Items starting with a "-" are
+-# C compiler flags, and other items are library names, except for "none=
"
+-# which indicates that we try without any flags at all, and "pthread-co=
nfig"
+-# which is a program returning the flags for the Pth emulation library.
++# Create a list of thread flags to try. Items with a "," contain both
++# C compiler flags (before ",") and linker flags (after ","). Other ite=
ms
++# starting with a "-" are C compiler flags, and remaining items are
++# library names, except for "none" which indicates that we try without
++# any flags at all, and "pthread-config" which is a program returning
++# the flags for the Pth emulation library.
+=20
+ ax_pthread_flags=3D"pthreads none -Kthread -pthread -pthreads -mthreads=
 pthread --thread-safe -mt pthread-config"
+=20
+@@ -152,319 +155,338 @@ ax_pthread_flags=3D"pthreads none -Kthread -pthr=
ead -pthreads -mthreads pthread --
+=20
+ case $host_os in
+=20
+-	freebsd*)
++        freebsd*)
+=20
+-	# -kthread: FreeBSD kernel threads (preferred to -pthread since SMP-ab=
le)
+-	# lthread: LinuxThreads port on FreeBSD (also preferred to -pthread)
++        # -kthread: FreeBSD kernel threads (preferred to -pthread since=
 SMP-able)
++        # lthread: LinuxThreads port on FreeBSD (also preferred to -pth=
read)
+=20
+-	ax_pthread_flags=3D"-kthread lthread $ax_pthread_flags"
+-	;;
++        ax_pthread_flags=3D"-kthread lthread $ax_pthread_flags"
++        ;;
+=20
+-	hpux*)
++        hpux*)
+=20
+-	# From the cc(1) man page: "[-mt] Sets various -D flags to enable
+-	# multi-threading and also sets -lpthread."
++        # From the cc(1) man page: "[-mt] Sets various -D flags to enab=
le
++        # multi-threading and also sets -lpthread."
+=20
+-	ax_pthread_flags=3D"-mt -pthread pthread $ax_pthread_flags"
+-	;;
++        ax_pthread_flags=3D"-mt -pthread pthread $ax_pthread_flags"
++        ;;
+=20
+-	openedition*)
++        openedition*)
+=20
+-	# IBM z/OS requires a feature-test macro to be defined in order to
+-	# enable POSIX threads at all, so give the user a hint if this is
+-	# not set. (We don't define these ourselves, as they can affect
+-	# other portions of the system API in unpredictable ways.)
++        # IBM z/OS requires a feature-test macro to be defined in order=
 to
++        # enable POSIX threads at all, so give the user a hint if this =
is
++        # not set. (We don't define these ourselves, as they can affect
++        # other portions of the system API in unpredictable ways.)
+=20
+-	AC_EGREP_CPP([AX_PTHREAD_ZOS_MISSING],
+-	    [
+-#	     if !defined(_OPEN_THREADS) && !defined(_UNIX03_THREADS)
+-	     AX_PTHREAD_ZOS_MISSING
+-#	     endif
+-	    ],
+-	    [AC_MSG_WARN([IBM z/OS requires -D_OPEN_THREADS or -D_UNIX03_THREA=
DS to enable pthreads support.])])
+-	;;
++        AC_EGREP_CPP([AX_PTHREAD_ZOS_MISSING],
++            [
++#            if !defined(_OPEN_THREADS) && !defined(_UNIX03_THREADS)
++             AX_PTHREAD_ZOS_MISSING
++#            endif
++            ],
++            [AC_MSG_WARN([IBM z/OS requires -D_OPEN_THREADS or -D_UNIX0=
3_THREADS to enable pthreads support.])])
++        ;;
+=20
+-	solaris*)
++        solaris*)
+=20
+-	# On Solaris (at least, for some versions), libc contains stubbed
+-	# (non-functional) versions of the pthreads routines, so link-based
+-	# tests will erroneously succeed. (N.B.: The stubs are missing
+-	# pthread_cleanup_push, or rather a function called by this macro,
+-	# so we could check for that, but who knows whether they'll stub
+-	# that too in a future libc.)  So we'll check first for the
+-	# standard Solaris way of linking pthreads (-mt -lpthread).
++        # On Solaris (at least, for some versions), libc contains stubb=
ed
++        # (non-functional) versions of the pthreads routines, so link-b=
ased
++        # tests will erroneously succeed. (N.B.: The stubs are missing
++        # pthread_cleanup_push, or rather a function called by this mac=
ro,
++        # so we could check for that, but who knows whether they'll stu=
b
++        # that too in a future libc.)  So we'll check first for the
++        # standard Solaris way of linking pthreads (-mt -lpthread).
+=20
+-	ax_pthread_flags=3D"-mt,pthread pthread $ax_pthread_flags"
+-	;;
++        ax_pthread_flags=3D"-mt,-lpthread pthread $ax_pthread_flags"
++        ;;
+ esac
+=20
++# Are we compiling with Clang?
++
++AC_CACHE_CHECK([whether $CC is Clang],
++    [ax_cv_PTHREAD_CLANG],
++    [ax_cv_PTHREAD_CLANG=3Dno
++     # Note that Autoconf sets GCC=3Dyes for Clang as well as GCC
++     if test "x$GCC" =3D "xyes"; then
++        AC_EGREP_CPP([AX_PTHREAD_CC_IS_CLANG],
++            [/* Note: Clang 2.7 lacks __clang_[a-z]+__ */
++#            if defined(__clang__) && defined(__llvm__)
++             AX_PTHREAD_CC_IS_CLANG
++#            endif
++            ],
++            [ax_cv_PTHREAD_CLANG=3Dyes])
++     fi
++    ])
++ax_pthread_clang=3D"$ax_cv_PTHREAD_CLANG"
++
++
+ # GCC generally uses -pthread, or -pthreads on some platforms (e.g. SPA=
RC)
+=20
++# Note that for GCC and Clang -pthread generally implies -lpthread,
++# except when -nostdlib is passed.
++# This is problematic using libtool to build C++ shared libraries with =
pthread:
++# [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D25460
++# [2] https://bugzilla.redhat.com/show_bug.cgi?id=3D661333
++# [3] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D468555
++# To solve this, first try -pthread together with -lpthread for GCC
++
+ AS_IF([test "x$GCC" =3D "xyes"],
+-      [ax_pthread_flags=3D"-pthread -pthreads $ax_pthread_flags"])
++      [ax_pthread_flags=3D"-pthread,-lpthread -pthread -pthreads $ax_pt=
hread_flags"])
++
++# Clang takes -pthread (never supported any other flag), but we'll try =
with -lpthread first
++
++AS_IF([test "x$ax_pthread_clang" =3D "xyes"],
++      [ax_pthread_flags=3D"-pthread,-lpthread -pthread"])
++
+=20
+ # The presence of a feature test macro requesting re-entrant function
+ # definitions is, on some systems, a strong hint that pthreads support =
is
+ # correctly enabled
+=20
+ case $host_os in
+-	darwin* | hpux* | linux* | osf* | solaris*)
+-	ax_pthread_check_macro=3D"_REENTRANT"
+-	;;
++        darwin* | hpux* | linux* | osf* | solaris*)
++        ax_pthread_check_macro=3D"_REENTRANT"
++        ;;
+=20
+-	aix* | freebsd*)
+-	ax_pthread_check_macro=3D"_THREAD_SAFE"
+-	;;
++        aix*)
++        ax_pthread_check_macro=3D"_THREAD_SAFE"
++        ;;
+=20
+-	*)
+-	ax_pthread_check_macro=3D"--"
+-	;;
++        *)
++        ax_pthread_check_macro=3D"--"
++        ;;
+ esac
+ AS_IF([test "x$ax_pthread_check_macro" =3D "x--"],
+       [ax_pthread_check_cond=3D0],
+       [ax_pthread_check_cond=3D"!defined($ax_pthread_check_macro)"])
+=20
+-# Are we compiling with Clang?
+=20
+-AC_CACHE_CHECK([whether $CC is Clang],
+-    [ax_cv_PTHREAD_CLANG],
+-    [ax_cv_PTHREAD_CLANG=3Dno
+-     # Note that Autoconf sets GCC=3Dyes for Clang as well as GCC
+-     if test "x$GCC" =3D "xyes"; then
+-	AC_EGREP_CPP([AX_PTHREAD_CC_IS_CLANG],
+-	    [/* Note: Clang 2.7 lacks __clang_[a-z]+__ */
+-#	     if defined(__clang__) && defined(__llvm__)
+-	     AX_PTHREAD_CC_IS_CLANG
+-#	     endif
+-	    ],
+-	    [ax_cv_PTHREAD_CLANG=3Dyes])
+-     fi
+-    ])
+-ax_pthread_clang=3D"$ax_cv_PTHREAD_CLANG"
++if test "x$ax_pthread_ok" =3D "xno"; then
++for ax_pthread_try_flag in $ax_pthread_flags; do
++
++        case $ax_pthread_try_flag in
++                none)
++                AC_MSG_CHECKING([whether pthreads work without any flag=
s])
++                ;;
++
++                *,*)
++                PTHREAD_CFLAGS=3D`echo $ax_pthread_try_flag | sed "s/^\=
(.*\),\(.*\)$/\1/"`
++                PTHREAD_LIBS=3D`echo $ax_pthread_try_flag | sed "s/^\(.=
*\),\(.*\)$/\2/"`
++                AC_MSG_CHECKING([whether pthreads work with "$PTHREAD_C=
FLAGS" and "$PTHREAD_LIBS"])
++                ;;
++
++                -*)
++                AC_MSG_CHECKING([whether pthreads work with $ax_pthread=
_try_flag])
++                PTHREAD_CFLAGS=3D"$ax_pthread_try_flag"
++                ;;
++
++                pthread-config)
++                AC_CHECK_PROG([ax_pthread_config], [pthread-config], [y=
es], [no])
++                AS_IF([test "x$ax_pthread_config" =3D "xno"], [continue=
])
++                PTHREAD_CFLAGS=3D"`pthread-config --cflags`"
++                PTHREAD_LIBS=3D"`pthread-config --ldflags` `pthread-con=
fig --libs`"
++                ;;
++
++                *)
++                AC_MSG_CHECKING([for the pthreads library -l$ax_pthread=
_try_flag])
++                PTHREAD_LIBS=3D"-l$ax_pthread_try_flag"
++                ;;
++        esac
++
++        ax_pthread_save_CFLAGS=3D"$CFLAGS"
++        ax_pthread_save_LIBS=3D"$LIBS"
++        CFLAGS=3D"$CFLAGS $PTHREAD_CFLAGS"
++        LIBS=3D"$PTHREAD_LIBS $LIBS"
++
++        # Check for various functions.  We must include pthread.h,
++        # since some functions may be macros.  (On the Sequent, we
++        # need a special flag -Kthread to make this header compile.)
++        # We check for pthread_join because it is in -lpthread on IRIX
++        # while pthread_create is in libc.  We check for pthread_attr_i=
nit
++        # due to DEC craziness with -lpthreads.  We check for
++        # pthread_cleanup_push because it is one of the few pthread
++        # functions on Solaris that doesn't have a non-functional libc =
stub.
++        # We try pthread_create on general principles.
++
++        AC_LINK_IFELSE([AC_LANG_PROGRAM([#include <pthread.h>
++#                       if $ax_pthread_check_cond
++#                        error "$ax_pthread_check_macro must be defined=
"
++#                       endif
++                        static void *some_global =3D NULL;
++                        static void routine(void *a)
++                          {
++                             /* To avoid any unused-parameter or
++                                unused-but-set-parameter warning.  */
++                             some_global =3D a;
++                          }
++                        static void *start_routine(void *a) { return a;=
 }],
++                       [pthread_t th; pthread_attr_t attr;
++                        pthread_create(&th, 0, start_routine, 0);
++                        pthread_join(th, 0);
++                        pthread_attr_init(&attr);
++                        pthread_cleanup_push(routine, 0);
++                        pthread_cleanup_pop(0) /* ; */])],
++            [ax_pthread_ok=3Dyes],
++            [])
++
++        CFLAGS=3D"$ax_pthread_save_CFLAGS"
++        LIBS=3D"$ax_pthread_save_LIBS"
++
++        AC_MSG_RESULT([$ax_pthread_ok])
++        AS_IF([test "x$ax_pthread_ok" =3D "xyes"], [break])
++
++        PTHREAD_LIBS=3D""
++        PTHREAD_CFLAGS=3D""
++done
++fi
+=20
+-ax_pthread_clang_warning=3Dno
+=20
+ # Clang needs special handling, because older versions handle the -pthr=
ead
+ # option in a rather... idiosyncratic way
+=20
+ if test "x$ax_pthread_clang" =3D "xyes"; then
+=20
+-	# Clang takes -pthread; it has never supported any other flag
+-
+-	# (Note 1: This will need to be revisited if a system that Clang
+-	# supports has POSIX threads in a separate library.  This tends not
+-	# to be the way of modern systems, but it's conceivable.)
+-
+-	# (Note 2: On some systems, notably Darwin, -pthread is not needed
+-	# to get POSIX threads support; the API is always present and
+-	# active.  We could reasonably leave PTHREAD_CFLAGS empty.  But
+-	# -pthread does define _REENTRANT, and while the Darwin headers
+-	# ignore this macro, third-party headers might not.)
+-
+-	PTHREAD_CFLAGS=3D"-pthread"
+-	PTHREAD_LIBS=3D
+-
+-	ax_pthread_ok=3Dyes
+-
+-	# However, older versions of Clang make a point of warning the user
+-	# that, in an invocation where only linking and no compilation is
+-	# taking place, the -pthread option has no effect ("argument unused
+-	# during compilation").  They expect -pthread to be passed in only
+-	# when source code is being compiled.
+-	#
+-	# Problem is, this is at odds with the way Automake and most other
+-	# C build frameworks function, which is that the same flags used in
+-	# compilation (CFLAGS) are also used in linking.  Many systems
+-	# supported by AX_PTHREAD require exactly this for POSIX threads
+-	# support, and in fact it is often not straightforward to specify a
+-	# flag that is used only in the compilation phase and not in
+-	# linking.  Such a scenario is extremely rare in practice.
+-	#
+-	# Even though use of the -pthread flag in linking would only print
+-	# a warning, this can be a nuisance for well-run software projects
+-	# that build with -Werror.  So if the active version of Clang has
+-	# this misfeature, we search for an option to squash it.
+-
+-	AC_CACHE_CHECK([whether Clang needs flag to prevent "argument unused" =
warning when linking with -pthread],
+-	    [ax_cv_PTHREAD_CLANG_NO_WARN_FLAG],
+-	    [ax_cv_PTHREAD_CLANG_NO_WARN_FLAG=3Dunknown
+-	     # Create an alternate version of $ac_link that compiles and
+-	     # links in two steps (.c -> .o, .o -> exe) instead of one
+-	     # (.c -> exe), because the warning occurs only in the second
+-	     # step
+-	     ax_pthread_save_ac_link=3D"$ac_link"
+-	     ax_pthread_sed=3D's/conftest\.\$ac_ext/conftest.$ac_objext/g'
+-	     ax_pthread_link_step=3D`$as_echo "$ac_link" | sed "$ax_pthread_se=
d"`
+-	     ax_pthread_2step_ac_link=3D"($ac_compile) && (echo =3D=3D=3D=3D >=
&5) && ($ax_pthread_link_step)"
+-	     ax_pthread_save_CFLAGS=3D"$CFLAGS"
+-	     for ax_pthread_try in '' -Qunused-arguments -Wno-unused-command-l=
ine-argument unknown; do
+-		AS_IF([test "x$ax_pthread_try" =3D "xunknown"], [break])
+-		CFLAGS=3D"-Werror -Wunknown-warning-option $ax_pthread_try -pthread $=
ax_pthread_save_CFLAGS"
+-		ac_link=3D"$ax_pthread_save_ac_link"
+-		AC_LINK_IFELSE([AC_LANG_SOURCE([[int main(void){return 0;}]])],
+-		    [ac_link=3D"$ax_pthread_2step_ac_link"
+-		     AC_LINK_IFELSE([AC_LANG_SOURCE([[int main(void){return 0;}]])],
+-			 [break])
+-		    ])
+-	     done
+-	     ac_link=3D"$ax_pthread_save_ac_link"
+-	     CFLAGS=3D"$ax_pthread_save_CFLAGS"
+-	     AS_IF([test "x$ax_pthread_try" =3D "x"], [ax_pthread_try=3Dno])
+-	     ax_cv_PTHREAD_CLANG_NO_WARN_FLAG=3D"$ax_pthread_try"
+-	    ])
+-
+-	case "$ax_cv_PTHREAD_CLANG_NO_WARN_FLAG" in
+-		no | unknown) ;;
+-		*) PTHREAD_CFLAGS=3D"$ax_cv_PTHREAD_CLANG_NO_WARN_FLAG $PTHREAD_CFLAG=
S" ;;
+-	esac
++        # Clang takes -pthread; it has never supported any other flag
++
++        # (Note 1: This will need to be revisited if a system that Clan=
g
++        # supports has POSIX threads in a separate library.  This tends=
 not
++        # to be the way of modern systems, but it's conceivable.)
++
++        # (Note 2: On some systems, notably Darwin, -pthread is not nee=
ded
++        # to get POSIX threads support; the API is always present and
++        # active.  We could reasonably leave PTHREAD_CFLAGS empty.  But
++        # -pthread does define _REENTRANT, and while the Darwin headers
++        # ignore this macro, third-party headers might not.)
++
++        # However, older versions of Clang make a point of warning the =
user
++        # that, in an invocation where only linking and no compilation =
is
++        # taking place, the -pthread option has no effect ("argument un=
used
++        # during compilation").  They expect -pthread to be passed in o=
nly
++        # when source code is being compiled.
++        #
++        # Problem is, this is at odds with the way Automake and most ot=
her
++        # C build frameworks function, which is that the same flags use=
d in
++        # compilation (CFLAGS) are also used in linking.  Many systems
++        # supported by AX_PTHREAD require exactly this for POSIX thread=
s
++        # support, and in fact it is often not straightforward to speci=
fy a
++        # flag that is used only in the compilation phase and not in
++        # linking.  Such a scenario is extremely rare in practice.
++        #
++        # Even though use of the -pthread flag in linking would only pr=
int
++        # a warning, this can be a nuisance for well-run software proje=
cts
++        # that build with -Werror.  So if the active version of Clang h=
as
++        # this misfeature, we search for an option to squash it.
++
++        AC_CACHE_CHECK([whether Clang needs flag to prevent "argument u=
nused" warning when linking with -pthread],
++            [ax_cv_PTHREAD_CLANG_NO_WARN_FLAG],
++            [ax_cv_PTHREAD_CLANG_NO_WARN_FLAG=3Dunknown
++             # Create an alternate version of $ac_link that compiles an=
d
++             # links in two steps (.c -> .o, .o -> exe) instead of one
++             # (.c -> exe), because the warning occurs only in the seco=
nd
++             # step
++             ax_pthread_save_ac_link=3D"$ac_link"
++             ax_pthread_sed=3D's/conftest\.\$ac_ext/conftest.$ac_objext=
/g'
++             ax_pthread_link_step=3D`$as_echo "$ac_link" | sed "$ax_pth=
read_sed"`
++             ax_pthread_2step_ac_link=3D"($ac_compile) && (echo =3D=3D=3D=
=3D >&5) && ($ax_pthread_link_step)"
++             ax_pthread_save_CFLAGS=3D"$CFLAGS"
++             for ax_pthread_try in '' -Qunused-arguments -Wno-unused-co=
mmand-line-argument unknown; do
++                AS_IF([test "x$ax_pthread_try" =3D "xunknown"], [break]=
)
++                CFLAGS=3D"-Werror -Wunknown-warning-option $ax_pthread_=
try -pthread $ax_pthread_save_CFLAGS"
++                ac_link=3D"$ax_pthread_save_ac_link"
++                AC_LINK_IFELSE([AC_LANG_SOURCE([[int main(void){return =
0;}]])],
++                    [ac_link=3D"$ax_pthread_2step_ac_link"
++                     AC_LINK_IFELSE([AC_LANG_SOURCE([[int main(void){re=
turn 0;}]])],
++                         [break])
++                    ])
++             done
++             ac_link=3D"$ax_pthread_save_ac_link"
++             CFLAGS=3D"$ax_pthread_save_CFLAGS"
++             AS_IF([test "x$ax_pthread_try" =3D "x"], [ax_pthread_try=3D=
no])
++             ax_cv_PTHREAD_CLANG_NO_WARN_FLAG=3D"$ax_pthread_try"
++            ])
++
++        case "$ax_cv_PTHREAD_CLANG_NO_WARN_FLAG" in
++                no | unknown) ;;
++                *) PTHREAD_CFLAGS=3D"$ax_cv_PTHREAD_CLANG_NO_WARN_FLAG =
$PTHREAD_CFLAGS" ;;
++        esac
+=20
+ fi # $ax_pthread_clang =3D yes
+=20
+-if test "x$ax_pthread_ok" =3D "xno"; then
+-for ax_pthread_try_flag in $ax_pthread_flags; do
+=20
+-	case $ax_pthread_try_flag in
+-		none)
+-		AC_MSG_CHECKING([whether pthreads work without any flags])
+-		;;
+-
+-		-mt,pthread)
+-		AC_MSG_CHECKING([whether pthreads work with -mt -lpthread])
+-		PTHREAD_CFLAGS=3D"-mt"
+-		PTHREAD_LIBS=3D"-lpthread"
+-		;;
+-
+-		-*)
+-		AC_MSG_CHECKING([whether pthreads work with $ax_pthread_try_flag])
+-		PTHREAD_CFLAGS=3D"$ax_pthread_try_flag"
+-		;;
+-
+-		pthread-config)
+-		AC_CHECK_PROG([ax_pthread_config], [pthread-config], [yes], [no])
+-		AS_IF([test "x$ax_pthread_config" =3D "xno"], [continue])
+-		PTHREAD_CFLAGS=3D"`pthread-config --cflags`"
+-		PTHREAD_LIBS=3D"`pthread-config --ldflags` `pthread-config --libs`"
+-		;;
+-
+-		*)
+-		AC_MSG_CHECKING([for the pthreads library -l$ax_pthread_try_flag])
+-		PTHREAD_LIBS=3D"-l$ax_pthread_try_flag"
+-		;;
+-	esac
+-
+-	ax_pthread_save_CFLAGS=3D"$CFLAGS"
+-	ax_pthread_save_LIBS=3D"$LIBS"
+-	CFLAGS=3D"$CFLAGS $PTHREAD_CFLAGS"
+-	LIBS=3D"$PTHREAD_LIBS $LIBS"
+-
+-	# Check for various functions.  We must include pthread.h,
+-	# since some functions may be macros.  (On the Sequent, we
+-	# need a special flag -Kthread to make this header compile.)
+-	# We check for pthread_join because it is in -lpthread on IRIX
+-	# while pthread_create is in libc.  We check for pthread_attr_init
+-	# due to DEC craziness with -lpthreads.  We check for
+-	# pthread_cleanup_push because it is one of the few pthread
+-	# functions on Solaris that doesn't have a non-functional libc stub.
+-	# We try pthread_create on general principles.
+-
+-	AC_LINK_IFELSE([AC_LANG_PROGRAM([#include <pthread.h>
+-#			if $ax_pthread_check_cond
+-#			 error "$ax_pthread_check_macro must be defined"
+-#			endif
+-			static void routine(void *a) { a =3D 0; }
+-			static void *start_routine(void *a) { return a; }],
+-		       [pthread_t th; pthread_attr_t attr;
+-			pthread_create(&th, 0, start_routine, 0);
+-			pthread_join(th, 0);
+-			pthread_attr_init(&attr);
+-			pthread_cleanup_push(routine, 0);
+-			pthread_cleanup_pop(0) /* ; */])],
+-	    [ax_pthread_ok=3Dyes],
+-	    [])
+-
+-	CFLAGS=3D"$ax_pthread_save_CFLAGS"
+-	LIBS=3D"$ax_pthread_save_LIBS"
+-
+-	AC_MSG_RESULT([$ax_pthread_ok])
+-	AS_IF([test "x$ax_pthread_ok" =3D "xyes"], [break])
+-
+-	PTHREAD_LIBS=3D""
+-	PTHREAD_CFLAGS=3D""
+-done
+-fi
+=20
+ # Various other checks:
+ if test "x$ax_pthread_ok" =3D "xyes"; then
+-	ax_pthread_save_CFLAGS=3D"$CFLAGS"
+-	ax_pthread_save_LIBS=3D"$LIBS"
+-	CFLAGS=3D"$CFLAGS $PTHREAD_CFLAGS"
+-	LIBS=3D"$PTHREAD_LIBS $LIBS"
+-
+-	# Detect AIX lossage: JOINABLE attribute is called UNDETACHED.
+-	AC_CACHE_CHECK([for joinable pthread attribute],
+-	    [ax_cv_PTHREAD_JOINABLE_ATTR],
+-	    [ax_cv_PTHREAD_JOINABLE_ATTR=3Dunknown
+-	     for ax_pthread_attr in PTHREAD_CREATE_JOINABLE PTHREAD_CREATE_UND=
ETACHED; do
+-		 AC_LINK_IFELSE([AC_LANG_PROGRAM([#include <pthread.h>],
+-						 [int attr =3D $ax_pthread_attr; return attr /* ; */])],
+-				[ax_cv_PTHREAD_JOINABLE_ATTR=3D$ax_pthread_attr; break],
+-				[])
+-	     done
+-	    ])
+-	AS_IF([test "x$ax_cv_PTHREAD_JOINABLE_ATTR" !=3D "xunknown" && \
+-	       test "x$ax_cv_PTHREAD_JOINABLE_ATTR" !=3D "xPTHREAD_CREATE_JOIN=
ABLE" && \
+-	       test "x$ax_pthread_joinable_attr_defined" !=3D "xyes"],
+-	      [AC_DEFINE_UNQUOTED([PTHREAD_CREATE_JOINABLE],
+-				  [$ax_cv_PTHREAD_JOINABLE_ATTR],
+-				  [Define to necessary symbol if this constant
+-				   uses a non-standard name on your system.])
+-	       ax_pthread_joinable_attr_defined=3Dyes
+-	      ])
+-
+-	AC_CACHE_CHECK([whether more special flags are required for pthreads],
+-	    [ax_cv_PTHREAD_SPECIAL_FLAGS],
+-	    [ax_cv_PTHREAD_SPECIAL_FLAGS=3Dno
+-	     case $host_os in
+-	     solaris*)
+-	     ax_cv_PTHREAD_SPECIAL_FLAGS=3D"-D_POSIX_PTHREAD_SEMANTICS"
+-	     ;;
+-	     esac
+-	    ])
+-	AS_IF([test "x$ax_cv_PTHREAD_SPECIAL_FLAGS" !=3D "xno" && \
+-	       test "x$ax_pthread_special_flags_added" !=3D "xyes"],
+-	      [PTHREAD_CFLAGS=3D"$ax_cv_PTHREAD_SPECIAL_FLAGS $PTHREAD_CFLAGS"
+-	       ax_pthread_special_flags_added=3Dyes])
+-
+-	AC_CACHE_CHECK([for PTHREAD_PRIO_INHERIT],
+-	    [ax_cv_PTHREAD_PRIO_INHERIT],
+-	    [AC_LINK_IFELSE([AC_LANG_PROGRAM([[#include <pthread.h>]],
+-					     [[int i =3D PTHREAD_PRIO_INHERIT;]])],
+-			    [ax_cv_PTHREAD_PRIO_INHERIT=3Dyes],
+-			    [ax_cv_PTHREAD_PRIO_INHERIT=3Dno])
+-	    ])
+-	AS_IF([test "x$ax_cv_PTHREAD_PRIO_INHERIT" =3D "xyes" && \
+-	       test "x$ax_pthread_prio_inherit_defined" !=3D "xyes"],
+-	      [AC_DEFINE([HAVE_PTHREAD_PRIO_INHERIT], [1], [Have PTHREAD_PRIO_=
INHERIT.])
+-	       ax_pthread_prio_inherit_defined=3Dyes
+-	      ])
+-
+-	CFLAGS=3D"$ax_pthread_save_CFLAGS"
+-	LIBS=3D"$ax_pthread_save_LIBS"
+-
+-	# More AIX lossage: compile with *_r variant
+-	if test "x$GCC" !=3D "xyes"; then
+-	    case $host_os in
+-		aix*)
+-		AS_CASE(["x/$CC"],
+-		    [x*/c89|x*/c89_128|x*/c99|x*/c99_128|x*/cc|x*/cc128|x*/xlc|x*/xlc=
_v6|x*/xlc128|x*/xlc128_v6],
+-		    [#handle absolute path differently from PATH based program lookup
+-		     AS_CASE(["x$CC"],
+-			 [x/*],
+-			 [AS_IF([AS_EXECUTABLE_P([${CC}_r])],[PTHREAD_CC=3D"${CC}_r"])],
+-			 [AC_CHECK_PROGS([PTHREAD_CC],[${CC}_r],[$CC])])])
+-		;;
+-	    esac
+-	fi
++        ax_pthread_save_CFLAGS=3D"$CFLAGS"
++        ax_pthread_save_LIBS=3D"$LIBS"
++        CFLAGS=3D"$CFLAGS $PTHREAD_CFLAGS"
++        LIBS=3D"$PTHREAD_LIBS $LIBS"
++
++        # Detect AIX lossage: JOINABLE attribute is called UNDETACHED.
++        AC_CACHE_CHECK([for joinable pthread attribute],
++            [ax_cv_PTHREAD_JOINABLE_ATTR],
++            [ax_cv_PTHREAD_JOINABLE_ATTR=3Dunknown
++             for ax_pthread_attr in PTHREAD_CREATE_JOINABLE PTHREAD_CRE=
ATE_UNDETACHED; do
++                 AC_LINK_IFELSE([AC_LANG_PROGRAM([#include <pthread.h>]=
,
++                                                 [int attr =3D $ax_pthr=
ead_attr; return attr /* ; */])],
++                                [ax_cv_PTHREAD_JOINABLE_ATTR=3D$ax_pthr=
ead_attr; break],
++                                [])
++             done
++            ])
++        AS_IF([test "x$ax_cv_PTHREAD_JOINABLE_ATTR" !=3D "xunknown" && =
\
++               test "x$ax_cv_PTHREAD_JOINABLE_ATTR" !=3D "xPTHREAD_CREA=
TE_JOINABLE" && \
++               test "x$ax_pthread_joinable_attr_defined" !=3D "xyes"],
++              [AC_DEFINE_UNQUOTED([PTHREAD_CREATE_JOINABLE],
++                                  [$ax_cv_PTHREAD_JOINABLE_ATTR],
++                                  [Define to necessary symbol if this c=
onstant
++                                   uses a non-standard name on your sys=
tem.])
++               ax_pthread_joinable_attr_defined=3Dyes
++              ])
++
++        AC_CACHE_CHECK([whether more special flags are required for pth=
reads],
++            [ax_cv_PTHREAD_SPECIAL_FLAGS],
++            [ax_cv_PTHREAD_SPECIAL_FLAGS=3Dno
++             case $host_os in
++             solaris*)
++             ax_cv_PTHREAD_SPECIAL_FLAGS=3D"-D_POSIX_PTHREAD_SEMANTICS"
++             ;;
++             esac
++            ])
++        AS_IF([test "x$ax_cv_PTHREAD_SPECIAL_FLAGS" !=3D "xno" && \
++               test "x$ax_pthread_special_flags_added" !=3D "xyes"],
++              [PTHREAD_CFLAGS=3D"$ax_cv_PTHREAD_SPECIAL_FLAGS $PTHREAD_=
CFLAGS"
++               ax_pthread_special_flags_added=3Dyes])
++
++        AC_CACHE_CHECK([for PTHREAD_PRIO_INHERIT],
++            [ax_cv_PTHREAD_PRIO_INHERIT],
++            [AC_LINK_IFELSE([AC_LANG_PROGRAM([[#include <pthread.h>]],
++                                             [[int i =3D PTHREAD_PRIO_I=
NHERIT;
++                                               return i;]])],
++                            [ax_cv_PTHREAD_PRIO_INHERIT=3Dyes],
++                            [ax_cv_PTHREAD_PRIO_INHERIT=3Dno])
++            ])
++        AS_IF([test "x$ax_cv_PTHREAD_PRIO_INHERIT" =3D "xyes" && \
++               test "x$ax_pthread_prio_inherit_defined" !=3D "xyes"],
++              [AC_DEFINE([HAVE_PTHREAD_PRIO_INHERIT], [1], [Have PTHREA=
D_PRIO_INHERIT.])
++               ax_pthread_prio_inherit_defined=3Dyes
++              ])
++
++        CFLAGS=3D"$ax_pthread_save_CFLAGS"
++        LIBS=3D"$ax_pthread_save_LIBS"
++
++        # More AIX lossage: compile with *_r variant
++        if test "x$GCC" !=3D "xyes"; then
++            case $host_os in
++                aix*)
++                AS_CASE(["x/$CC"],
++                    [x*/c89|x*/c89_128|x*/c99|x*/c99_128|x*/cc|x*/cc128=
|x*/xlc|x*/xlc_v6|x*/xlc128|x*/xlc128_v6],
++                    [#handle absolute path differently from PATH based =
program lookup
++                     AS_CASE(["x$CC"],
++                         [x/*],
++                         [AS_IF([AS_EXECUTABLE_P([${CC}_r])],[PTHREAD_C=
C=3D"${CC}_r"])],
++                         [AC_CHECK_PROGS([PTHREAD_CC],[${CC}_r],[$CC])]=
)])
++                ;;
++            esac
++        fi
+ fi
+=20
+ test -n "$PTHREAD_CC" || PTHREAD_CC=3D"$CC"
+@@ -475,11 +497,11 @@ AC_SUBST([PTHREAD_CC])
+=20
+ # Finally, execute ACTION-IF-FOUND/ACTION-IF-NOT-FOUND:
+ if test "x$ax_pthread_ok" =3D "xyes"; then
+-	ifelse([$1],,[AC_DEFINE([HAVE_PTHREAD],[1],[Define if you have POSIX t=
hreads libraries and header files.])],[$1])
+-	:
++        ifelse([$1],,[AC_DEFINE([HAVE_PTHREAD],[1],[Define if you have =
POSIX threads libraries and header files.])],[$1])
++        :
+ else
+-	ax_pthread_ok=3Dno
+-	$2
++        ax_pthread_ok=3Dno
++        $2
+ fi
+ AC_LANG_POP
+ ])dnl AX_PTHREAD
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.14.0.bb b/meta-=
oe/recipes-devtools/protobuf/protobuf_3.14.0.bb
index 31e3bcc5b1..00f1e99d35 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.14.0.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.14.0.bb
@@ -17,6 +17,7 @@ SRC_URI =3D "git://github.com/protocolbuffers/protobuf.=
git \
            file://0001-protobuf-fix-configure-error.patch \
            file://0001-Makefile.am-include-descriptor.cc-when-building-l=
ibp.patch \
            file://0001-examples-Makefile-respect-CXX-LDFLAGS-variables-f=
ix-.patch \
+           file://0001-fix-m4-pthread-update.patch \
 "
 S =3D "${WORKDIR}/git"
=20
--=20
2.25.1

