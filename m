Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1Ppeia-0000xD-Jd
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 11:34:44 +0100
Received: (qmail 19755 invoked by uid 503); 16 Feb 2011 11:16:16 -0000
Received: from b9.ovh.net (HELO mail239.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 16 Feb 2011 11:16:16 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 16 Feb 2011 12:33:35 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 16 Feb 2011 12:33:34 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Feb 2011 11:33:45 +0100
Message-Id: <1297852433-31160-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-Ovh-Tracer-Id: 12105112849527516489
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: [PATCH 01/10] util-linux-ng: add 2.18
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
X-List-Received-Date: Wed, 16 Feb 2011 10:34:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

from the changelong, the most important update over 2.17
is a memory leak fix in mount

Signed-off-by: Eric Bénard <eric@eukrea.com>
Acked-by: Khem Raj <raj.khem@gmail.com>
---
 .../util-linux-ng-2.18/fdiskbsdlabel.h-nios2.patch |   14 ++++
 recipes/util-linux-ng/util-linux-ng-2.18/tls.patch |   70 ++++++++++++++++++++
 .../util-linux-ng-2.18/uclibc-compile.patch        |   13 ++++
 .../util-linux-ng-2.18/uclibc-nolargefile.patch    |   13 ++++
 .../util-linux-ng-replace-siginterrupt.patch       |   23 +++++++
 recipes/util-linux-ng/util-linux-ng_2.18.bb        |   17 +++++
 6 files changed, 150 insertions(+), 0 deletions(-)
 create mode 100644 recipes/util-linux-ng/util-linux-ng-2.18/fdiskbsdlabel.h-nios2.patch
 create mode 100644 recipes/util-linux-ng/util-linux-ng-2.18/tls.patch
 create mode 100644 recipes/util-linux-ng/util-linux-ng-2.18/uclibc-compile.patch
 create mode 100644 recipes/util-linux-ng/util-linux-ng-2.18/uclibc-nolargefile.patch
 create mode 100644 recipes/util-linux-ng/util-linux-ng-2.18/util-linux-ng-replace-siginterrupt.patch
 create mode 100644 recipes/util-linux-ng/util-linux-ng_2.18.bb

diff --git a/recipes/util-linux-ng/util-linux-ng-2.18/fdiskbsdlabel.h-nios2.patch b/recipes/util-linux-ng/util-linux-ng-2.18/fdiskbsdlabel.h-nios2.patch
new file mode 100644
index 0000000..5b5051e
--- /dev/null
+++ b/recipes/util-linux-ng/util-linux-ng-2.18/fdiskbsdlabel.h-nios2.patch
@@ -0,0 +1,14 @@
+Index: util-linux-ng-2.17/fdisk/fdiskbsdlabel.h
+===================================================================
+--- util-linux-ng-2.17.orig/fdisk/fdiskbsdlabel.h	2010-07-07 14:13:04.073530165 +0200
++++ util-linux-ng-2.17/fdisk/fdiskbsdlabel.h	2010-07-07 14:13:43.053535150 +0200
+@@ -48,7 +48,8 @@
+ 
+ #if defined (i386) || defined (__sparc__) || defined (__arm__) || \
+     defined (__mips__) || defined (__s390__) || defined (__sh__) || \
+-    defined(__x86_64__) || defined (__avr32__) || defined(__cris__)
++    defined(__x86_64__) || defined (__avr32__) || defined(__cris__) || \
++    defined (__nios2__)
+ #define BSD_LABELSECTOR   1
+ #define BSD_LABELOFFSET   0
+ #elif defined (__alpha__) || defined (__powerpc__) || defined (__ia64__) || defined (__hppa__)
diff --git a/recipes/util-linux-ng/util-linux-ng-2.18/tls.patch b/recipes/util-linux-ng/util-linux-ng-2.18/tls.patch
new file mode 100644
index 0000000..bdb29ca
--- /dev/null
+++ b/recipes/util-linux-ng/util-linux-ng-2.18/tls.patch
@@ -0,0 +1,70 @@
+Index: util-linux-ng-2.16/m4/tls.m4
+===================================================================
+--- util-linux-ng-2.16.orig/m4/tls.m4	2009-07-04 01:20:03.000000000 +0200
++++ util-linux-ng-2.16/m4/tls.m4	2009-07-30 01:57:30.151697033 +0200
+@@ -18,31 +18,26 @@
+ # version as well.
+ #
+ AC_DEFUN([AX_TLS], [
+-  AC_MSG_CHECKING(for thread local storage (TLS) class)
+-  AC_CACHE_VAL(ac_cv_tls, [
+-    ax_tls_keywords="__thread __declspec(thread) none"
+-    for ax_tls_keyword in $ax_tls_keywords; do
+-       case $ax_tls_keyword in
+-          none) ac_cv_tls=none ; break ;;
+-          *)
+-             AC_TRY_COMPILE(
+-                [#include <stdlib.h>
+-                 static void
+-                 foo(void) {
+-                 static ] $ax_tls_keyword [ int bar;
+-                 exit(1);
+-                 }],
+-                 [],
+-                 [ac_cv_tls=$ax_tls_keyword ; break],
+-                 ac_cv_tls=none
+-             )
+-          esac
+-    done
+-])
++  AC_CACHE_CHECK([for thread local storage (TLS) class],
++    ac_cv_tls,
++    [AC_LINK_IFELSE([__thread int a; int b; int main() { return a = b; }],
++	 [chktls_save_LDFLAGS="$LDFLAGS"
++	  LDFLAGS="-shared -Wl,--no-undefined $LDFLAGS"
++	  chktls_save_CFLAGS="$CFLAGS"
++	  CFLAGS="-fPIC $CFLAGS"
++	  dnl If -shared works, test if TLS works in a shared library.
++	  AC_LINK_IFELSE([int f() { return 0; }],
++	    AC_LINK_IFELSE([__thread int a; int b; int f() { return a = b; }],
++	      [ac_cv_tls=yes],
++	      [ac_cv_tls=no]),
++	    [ac_cv_tls=yes])
++	  CFLAGS="$chktls_save_CFLAGS"
++	  LDFLAGS="$chktls_save_LDFLAGS"], [ac_cv_tls=no])
++    ])
+ 
+-  if test "$ac_cv_tls" != "none"; then
+-    dnl AC_DEFINE([TLS], [], [If the compiler supports a TLS storage class define it to that here])
+-    AC_DEFINE_UNQUOTED([TLS], $ac_cv_tls, [If the compiler supports a TLS storage class define it to that here])
+-  fi
+-  AC_MSG_RESULT($ac_cv_tls)
++  AS_IF([test "x$ac_cv_tls" = "xyes"],
++    [AC_DEFINE([TLS], 1,
++     [Define this if the compiler supports __thread for Thread-Local Storage])
++     $1],
++    [$2])
+ ])
+Index: util-linux-ng-2.16/shlibs/uuid/src/gen_uuid.c
+===================================================================
+--- util-linux-ng-2.16.orig/shlibs/uuid/src/gen_uuid.c	2009-07-30 02:31:48.518159459 +0200
++++ util-linux-ng-2.16/shlibs/uuid/src/gen_uuid.c	2009-07-30 02:32:04.867871183 +0200
+@@ -99,7 +99,7 @@
+ #endif
+ 
+ #ifdef TLS
+-#define THREAD_LOCAL static TLS
++#define THREAD_LOCAL static __thread
+ #else
+ #define THREAD_LOCAL static
+ #endif
diff --git a/recipes/util-linux-ng/util-linux-ng-2.18/uclibc-compile.patch b/recipes/util-linux-ng/util-linux-ng-2.18/uclibc-compile.patch
new file mode 100644
index 0000000..b2e8a8b
--- /dev/null
+++ b/recipes/util-linux-ng/util-linux-ng-2.18/uclibc-compile.patch
@@ -0,0 +1,13 @@
+Index: util-linux-ng-2.16/misc-utils/cal.c
+===================================================================
+--- util-linux-ng-2.16.orig/misc-utils/cal.c	2009-07-03 16:20:01.000000000 -0700
++++ util-linux-ng-2.16/misc-utils/cal.c	2009-07-18 23:21:37.000000000 -0700
+@@ -407,7 +407,7 @@
+   strcpy(day_headings,"");
+   strcpy(j_day_headings,"");
+ 
+-#ifdef HAVE_LANGINFO_H
++#ifdef HAVE_LANGINFO_H && !defined(__UCLIBC__)
+ # define weekday(wd)	nl_langinfo(ABDAY_1+wd)
+ #else
+ # define weekday(wd)	_time_info->abbrev_wkday[wd]
diff --git a/recipes/util-linux-ng/util-linux-ng-2.18/uclibc-nolargefile.patch b/recipes/util-linux-ng/util-linux-ng-2.18/uclibc-nolargefile.patch
new file mode 100644
index 0000000..2c0c1bd
--- /dev/null
+++ b/recipes/util-linux-ng/util-linux-ng-2.18/uclibc-nolargefile.patch
@@ -0,0 +1,13 @@
+Upstream: http://www.spinics.net/lists/util-linux-ng/msg03651.html
+
+--- util-linux-ng-2.17/shlibs/blkid/src/llseek.c.orig	2010-11-29 11:31:49.000000000 +1030
++++ util-linux-ng-2.17/shlibs/blkid/src/llseek.c	2010-11-29 11:52:07.000000000 +1030
+@@ -28,7 +28,7 @@
+ 
+ #include "blkidP.h"
+ 
+-#ifdef __linux__
++#if defined(__linux__) && !(defined(__UCLIBC__) && !defined(__USE_FILE_OFFSET64))
+ 
+ #if defined(HAVE_LSEEK64) && defined(HAVE_LSEEK64_PROTOTYPE) || defined(__UCLIBC__)
+ 
diff --git a/recipes/util-linux-ng/util-linux-ng-2.18/util-linux-ng-replace-siginterrupt.patch b/recipes/util-linux-ng/util-linux-ng-2.18/util-linux-ng-replace-siginterrupt.patch
new file mode 100644
index 0000000..4b5eb73
--- /dev/null
+++ b/recipes/util-linux-ng/util-linux-ng-2.18/util-linux-ng-replace-siginterrupt.patch
@@ -0,0 +1,23 @@
+Index: util-linux-ng-2.14/login-utils/login.c
+===================================================================
+--- util-linux-ng-2.14.orig/login-utils/login.c	2008-05-28 16:01:02.000000000 -0700
++++ util-linux-ng-2.14/login-utils/login.c	2009-03-04 18:31:42.000000000 -0800
+@@ -358,6 +358,7 @@
+     char *childArgv[10];
+     char *buff;
+     int childArgc = 0;
++    struct sigaction act;
+ #ifdef HAVE_SECURITY_PAM_MISC_H
+     int retcode;
+     pam_handle_t *pamh = NULL;
+@@ -373,7 +374,9 @@
+     pid = getpid();
+ 
+     signal(SIGALRM, timedout);
+-    siginterrupt(SIGALRM,1);           /* we have to interrupt syscalls like ioclt() */
++    (void) sigaction(SIGALRM, NULL, &act);
++    act.sa_flags &= ~SA_RESTART;
++    sigaction(SIGALRM, &act, NULL);
+     alarm((unsigned int)timeout);
+     signal(SIGQUIT, SIG_IGN);
+     signal(SIGINT, SIG_IGN);
diff --git a/recipes/util-linux-ng/util-linux-ng_2.18.bb b/recipes/util-linux-ng/util-linux-ng_2.18.bb
new file mode 100644
index 0000000..f4d8c02
--- /dev/null
+++ b/recipes/util-linux-ng/util-linux-ng_2.18.bb
@@ -0,0 +1,17 @@
+require util-linux-ng.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://uclibc-compile.patch \
+	    file://util-linux-ng-replace-siginterrupt.patch \
+	    file://fdiskbsdlabel.h-nios2.patch \
+	    file://uclibc-nolargefile.patch \
+           "
+
+# fallocate is glibc 2.10, fallocate64 is glibc 2.11
+# we need to disable it for older versions
+EXTRA_OECONF += "ac_cv_func_fallocate=no"
+EXTRA_OECONF_append_virtclass-native += "--disable-fallocate --disable-use-tty-group"
+
+SRC_URI[archive.md5sum] = "2f5f71e6af969d041d73ab778c141a77"
+SRC_URI[archive.sha256sum] = "b8c5c07c763888aa712b4585393346667a00793127c54cef0470cfa456b031cc"
-- 
1.7.0.4



