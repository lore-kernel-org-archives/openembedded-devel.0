Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PnH4r-00025y-UN
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Feb 2011 21:55:54 +0100
Received: by gxk20 with SMTP id 20so274179gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Feb 2011 12:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=5l2EzDlRF7H3YMuTjXSTQotjNmEXxgYslqQ0qBDHLA0=;
	b=pujaNZpNPGndxc1h31JV80rmxdl0s56lIBa2u1WaGGz9QQo+oqRF8gX9Cx7EGrFTQ7
	ugnKOmKTkVBy0mWPXtqNnbvai6LEEgJ7eAd3hy+onn/KxhUtv4ykHQGXj6JJHdg+hqiw
	peKohEHTzFFAfJ/xzcGA/lAPoPC3lIst9BxLM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=U1GF/3yFTcPeq6abAmCm31ue84JR87dSW0PyIjwJab6z+u1YR6gwMthhfuWJxz57tA
	X7bQsUYQC2+0744cNSHTyq9o8JsgeIqPUgcHkbNx8IwxBWycew3iTSDA7WqgGvzA6atd
	QtXzJOEw3gFmw+CCcPX/oAJklob5ZoqnvCRG4=
Received: by 10.90.74.14 with SMTP id w14mr1907621aga.34.1297284889839; Wed,
	09 Feb 2011 12:54:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.32.12 with HTTP; Wed, 9 Feb 2011 12:54:29 -0800 (PST)
In-Reply-To: <1297097613-6619-1-git-send-email-eric@eukrea.com>
References: <1297097613-6619-1-git-send-email-eric@eukrea.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 9 Feb 2011 12:54:29 -0800
Message-ID: <AANLkTi=DhzWMEZy+Zq1DgUfNomiXDuPe=bOH-7i9D4Zx@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] util-linux-ng: add 2.18
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
X-List-Received-Date: Wed, 09 Feb 2011 20:55:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 7, 2011 at 8:53 AM, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> from the changelong, the most important update over 2.17
> is a memory leak fix in mount
>
> Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>

PR =3D "${INC_PR}.0" is better to use instead of PR =3D "${INC_PR}"
EXTRA_OECONF +=3D "ac_cv_func_fallocate=3Dno"

Is there someway to poke underlying eglibc/uclibc for availability of fallo=
cate
rather than disabling it explicitly. but thats something can be done
as a separate patch

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0.../util-linux-ng-2.18/fdiskbsdlabel.h-nios2.patch | =C2=A0 14 ++++
> =C2=A0recipes/util-linux-ng/util-linux-ng-2.18/tls.patch | =C2=A0 70 ++++=
++++++++++++++++
> =C2=A0.../util-linux-ng-2.18/uclibc-compile.patch =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 13 ++++
> =C2=A0.../util-linux-ng-2.18/uclibc-nolargefile.patch =C2=A0 =C2=A0| =C2=
=A0 13 ++++
> =C2=A0.../util-linux-ng-replace-siginterrupt.patch =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 23 +++++++
> =C2=A0recipes/util-linux-ng/util-linux-ng_2.18.bb =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 17 +++++
> =C2=A06 files changed, 150 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 recipes/util-linux-ng/util-linux-ng-2.18/fdiskbs=
dlabel.h-nios2.patch
> =C2=A0create mode 100644 recipes/util-linux-ng/util-linux-ng-2.18/tls.pat=
ch
> =C2=A0create mode 100644 recipes/util-linux-ng/util-linux-ng-2.18/uclibc-=
compile.patch
> =C2=A0create mode 100644 recipes/util-linux-ng/util-linux-ng-2.18/uclibc-=
nolargefile.patch
> =C2=A0create mode 100644 recipes/util-linux-ng/util-linux-ng-2.18/util-li=
nux-ng-replace-siginterrupt.patch
> =C2=A0create mode 100644 recipes/util-linux-ng/util-linux-ng_2.18.bb
>
> diff --git a/recipes/util-linux-ng/util-linux-ng-2.18/fdiskbsdlabel.h-nio=
s2.patch b/recipes/util-linux-ng/util-linux-ng-2.18/fdiskbsdlabel.h-nios2.p=
atch
> new file mode 100644
> index 0000000..5b5051e
> --- /dev/null
> +++ b/recipes/util-linux-ng/util-linux-ng-2.18/fdiskbsdlabel.h-nios2.patc=
h
> @@ -0,0 +1,14 @@
> +Index: util-linux-ng-2.17/fdisk/fdiskbsdlabel.h
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- util-linux-ng-2.17.orig/fdisk/fdiskbsdlabel.h =C2=A0 =C2=A0 =C2=A020=
10-07-07 14:13:04.073530165 +0200
> ++++ util-linux-ng-2.17/fdisk/fdiskbsdlabel.h =C2=A0 2010-07-07 14:13:43.=
053535150 +0200
> +@@ -48,7 +48,8 @@
> +
> + #if defined (i386) || defined (__sparc__) || defined (__arm__) || \
> + =C2=A0 =C2=A0 defined (__mips__) || defined (__s390__) || defined (__sh=
__) || \
> +- =C2=A0 =C2=A0defined(__x86_64__) || defined (__avr32__) || defined(__c=
ris__)
> ++ =C2=A0 =C2=A0defined(__x86_64__) || defined (__avr32__) || defined(__c=
ris__) || \
> ++ =C2=A0 =C2=A0defined (__nios2__)
> + #define BSD_LABELSECTOR =C2=A0 1
> + #define BSD_LABELOFFSET =C2=A0 0
> + #elif defined (__alpha__) || defined (__powerpc__) || defined (__ia64__=
) || defined (__hppa__)
> diff --git a/recipes/util-linux-ng/util-linux-ng-2.18/tls.patch b/recipes=
/util-linux-ng/util-linux-ng-2.18/tls.patch
> new file mode 100644
> index 0000000..bdb29ca
> --- /dev/null
> +++ b/recipes/util-linux-ng/util-linux-ng-2.18/tls.patch
> @@ -0,0 +1,70 @@
> +Index: util-linux-ng-2.16/m4/tls.m4
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- util-linux-ng-2.16.orig/m4/tls.m4 =C2=A02009-07-04 01:20:03.00000000=
0 +0200
> ++++ util-linux-ng-2.16/m4/tls.m4 =C2=A0 =C2=A0 =C2=A0 2009-07-30 01:57:3=
0.151697033 +0200
> +@@ -18,31 +18,26 @@
> + # version as well.
> + #
> + AC_DEFUN([AX_TLS], [
> +- =C2=A0AC_MSG_CHECKING(for thread local storage (TLS) class)
> +- =C2=A0AC_CACHE_VAL(ac_cv_tls, [
> +- =C2=A0 =C2=A0ax_tls_keywords=3D"__thread __declspec(thread) none"
> +- =C2=A0 =C2=A0for ax_tls_keyword in $ax_tls_keywords; do
> +- =C2=A0 =C2=A0 =C2=A0 case $ax_tls_keyword in
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none) ac_cv_tls=3Dnone ; break ;;
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*)
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_TRY_COMPILE(
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[#include <stdl=
ib.h>
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 static void
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 foo(void) {
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 static ] $ax_t=
ls_keyword [ int bar;
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(1);
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }],
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [],
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ac_cv_tls=3D$=
ax_tls_keyword ; break],
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ac_cv_tls=3Dno=
ne
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0esac
> +- =C2=A0 =C2=A0done
> +-])
> ++ =C2=A0AC_CACHE_CHECK([for thread local storage (TLS) class],
> ++ =C2=A0 =C2=A0ac_cv_tls,
> ++ =C2=A0 =C2=A0[AC_LINK_IFELSE([__thread int a; int b; int main() { retu=
rn a =3D b; }],
> ++ =C2=A0 =C2=A0 =C2=A0 [chktls_save_LDFLAGS=3D"$LDFLAGS"
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0LDFLAGS=3D"-shared -Wl,--no-undefined $LDFL=
AGS"
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0chktls_save_CFLAGS=3D"$CFLAGS"
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0CFLAGS=3D"-fPIC $CFLAGS"
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0dnl If -shared works, test if TLS works in =
a shared library.
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_LINK_IFELSE([int f() { return 0; }],
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_LINK_IFELSE([__thread int a; int =
b; int f() { return a =3D b; }],
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[ac_cv_tls=3Dyes],
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[ac_cv_tls=3Dno]),
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[ac_cv_tls=3Dyes])
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0CFLAGS=3D"$chktls_save_CFLAGS"
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0LDFLAGS=3D"$chktls_save_LDFLAGS"], [ac_cv_t=
ls=3Dno])
> ++ =C2=A0 =C2=A0])
> +
> +- =C2=A0if test "$ac_cv_tls" !=3D "none"; then
> +- =C2=A0 =C2=A0dnl AC_DEFINE([TLS], [], [If the compiler supports a TLS =
storage class define it to that here])
> +- =C2=A0 =C2=A0AC_DEFINE_UNQUOTED([TLS], $ac_cv_tls, [If the compiler su=
pports a TLS storage class define it to that here])
> +- =C2=A0fi
> +- =C2=A0AC_MSG_RESULT($ac_cv_tls)
> ++ =C2=A0AS_IF([test "x$ac_cv_tls" =3D "xyes"],
> ++ =C2=A0 =C2=A0[AC_DEFINE([TLS], 1,
> ++ =C2=A0 =C2=A0 [Define this if the compiler supports __thread for Threa=
d-Local Storage])
> ++ =C2=A0 =C2=A0 $1],
> ++ =C2=A0 =C2=A0[$2])
> + ])
> +Index: util-linux-ng-2.16/shlibs/uuid/src/gen_uuid.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- util-linux-ng-2.16.orig/shlibs/uuid/src/gen_uuid.c 2009-07-30 02:31:=
48.518159459 +0200
> ++++ util-linux-ng-2.16/shlibs/uuid/src/gen_uuid.c =C2=A0 =C2=A0 =C2=A020=
09-07-30 02:32:04.867871183 +0200
> +@@ -99,7 +99,7 @@
> + #endif
> +
> + #ifdef TLS
> +-#define THREAD_LOCAL static TLS
> ++#define THREAD_LOCAL static __thread
> + #else
> + #define THREAD_LOCAL static
> + #endif
> diff --git a/recipes/util-linux-ng/util-linux-ng-2.18/uclibc-compile.patc=
h b/recipes/util-linux-ng/util-linux-ng-2.18/uclibc-compile.patch
> new file mode 100644
> index 0000000..b2e8a8b
> --- /dev/null
> +++ b/recipes/util-linux-ng/util-linux-ng-2.18/uclibc-compile.patch
> @@ -0,0 +1,13 @@
> +Index: util-linux-ng-2.16/misc-utils/cal.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- util-linux-ng-2.16.orig/misc-utils/cal.c =C2=A0 2009-07-03 16:20:01.=
000000000 -0700
> ++++ util-linux-ng-2.16/misc-utils/cal.c =C2=A0 =C2=A0 =C2=A0 =C2=A02009-=
07-18 23:21:37.000000000 -0700
> +@@ -407,7 +407,7 @@
> + =C2=A0 strcpy(day_headings,"");
> + =C2=A0 strcpy(j_day_headings,"");
> +
> +-#ifdef HAVE_LANGINFO_H
> ++#ifdef HAVE_LANGINFO_H && !defined(__UCLIBC__)
> + # define weekday(wd) =C2=A0nl_langinfo(ABDAY_1+wd)
> + #else
> + # define weekday(wd) =C2=A0_time_info->abbrev_wkday[wd]
> diff --git a/recipes/util-linux-ng/util-linux-ng-2.18/uclibc-nolargefile.=
patch b/recipes/util-linux-ng/util-linux-ng-2.18/uclibc-nolargefile.patch
> new file mode 100644
> index 0000000..2c0c1bd
> --- /dev/null
> +++ b/recipes/util-linux-ng/util-linux-ng-2.18/uclibc-nolargefile.patch
> @@ -0,0 +1,13 @@
> +Upstream: http://www.spinics.net/lists/util-linux-ng/msg03651.html
> +
> +--- util-linux-ng-2.17/shlibs/blkid/src/llseek.c.orig =C2=A02010-11-29 1=
1:31:49.000000000 +1030
> ++++ util-linux-ng-2.17/shlibs/blkid/src/llseek.c =C2=A0 =C2=A0 =C2=A0 20=
10-11-29 11:52:07.000000000 +1030
> +@@ -28,7 +28,7 @@
> +
> + #include "blkidP.h"
> +
> +-#ifdef __linux__
> ++#if defined(__linux__) && !(defined(__UCLIBC__) && !defined(__USE_FILE_=
OFFSET64))
> +
> + #if defined(HAVE_LSEEK64) && defined(HAVE_LSEEK64_PROTOTYPE) || defined=
(__UCLIBC__)
> +
> diff --git a/recipes/util-linux-ng/util-linux-ng-2.18/util-linux-ng-repla=
ce-siginterrupt.patch b/recipes/util-linux-ng/util-linux-ng-2.18/util-linux=
-ng-replace-siginterrupt.patch
> new file mode 100644
> index 0000000..4b5eb73
> --- /dev/null
> +++ b/recipes/util-linux-ng/util-linux-ng-2.18/util-linux-ng-replace-sigi=
nterrupt.patch
> @@ -0,0 +1,23 @@
> +Index: util-linux-ng-2.14/login-utils/login.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- util-linux-ng-2.14.orig/login-utils/login.c =C2=A0 =C2=A0 =C2=A0 =C2=
=A02008-05-28 16:01:02.000000000 -0700
> ++++ util-linux-ng-2.14/login-utils/login.c =C2=A0 =C2=A0 2009-03-04 18:3=
1:42.000000000 -0800
> +@@ -358,6 +358,7 @@
> + =C2=A0 =C2=A0 char *childArgv[10];
> + =C2=A0 =C2=A0 char *buff;
> + =C2=A0 =C2=A0 int childArgc =3D 0;
> ++ =C2=A0 =C2=A0struct sigaction act;
> + #ifdef HAVE_SECURITY_PAM_MISC_H
> + =C2=A0 =C2=A0 int retcode;
> + =C2=A0 =C2=A0 pam_handle_t *pamh =3D NULL;
> +@@ -373,7 +374,9 @@
> + =C2=A0 =C2=A0 pid =3D getpid();
> +
> + =C2=A0 =C2=A0 signal(SIGALRM, timedout);
> +- =C2=A0 =C2=A0siginterrupt(SIGALRM,1); =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* we have to interrupt syscalls like ioclt() */
> ++ =C2=A0 =C2=A0(void) sigaction(SIGALRM, NULL, &act);
> ++ =C2=A0 =C2=A0act.sa_flags &=3D ~SA_RESTART;
> ++ =C2=A0 =C2=A0sigaction(SIGALRM, &act, NULL);
> + =C2=A0 =C2=A0 alarm((unsigned int)timeout);
> + =C2=A0 =C2=A0 signal(SIGQUIT, SIG_IGN);
> + =C2=A0 =C2=A0 signal(SIGINT, SIG_IGN);
> diff --git a/recipes/util-linux-ng/util-linux-ng_2.18.bb b/recipes/util-l=
inux-ng/util-linux-ng_2.18.bb
> new file mode 100644
> index 0000000..d243836
> --- /dev/null
> +++ b/recipes/util-linux-ng/util-linux-ng_2.18.bb
> @@ -0,0 +1,17 @@
> +require util-linux-ng.inc
> +
> +PR =3D "${INC_PR}"
> +
> +SRC_URI +=3D "file://uclibc-compile.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://util-linux-ng-replace-siginte=
rrupt.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://fdiskbsdlabel.h-nios2.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://uclibc-nolargefile.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
> +
> +# fallocate is glibc 2.10, fallocate64 is glibc 2.11
> +# we need to disable it for older versions
> +EXTRA_OECONF +=3D "ac_cv_func_fallocate=3Dno"
> +EXTRA_OECONF_append_virtclass-native +=3D "--disable-fallocate --disable=
-use-tty-group"
> +
> +SRC_URI[archive.md5sum] =3D "2f5f71e6af969d041d73ab778c141a77"
> +SRC_URI[archive.sha256sum] =3D "b8c5c07c763888aa712b4585393346667a007931=
27c54cef0470cfa456b031cc"
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


