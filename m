Received: from mail-iw0-f182.google.com ([209.85.223.182])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Ng1un-0001fk-EX
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Feb 2010 21:15:04 +0100
Received: by iwn12 with SMTP id 12so3010192iwn.26
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Feb 2010 12:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=WEmTWLU0MYAOVWj6gG40Hxi/JkZg378tjpnWCUarPqc=;
	b=RK4znuN3z589AUb2vKMqrJbsZk6uEVzRglCc+Nv7PCk2GHRk7/AJGxeecf4aEKaSpQ
	Hka3+SmqKXIKw3mzFfYOck8FRWgSuriWuXvsIMHNABLyFmiqEPPujTPx5FP4Qdpvw0cS
	llLrV8cpbqbA2CrN88fDudo0NR1c79l0u9OYU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=g0hj+VZwLjrAHhb18osxrtUl9lYha0He7wmPGOdhbDqd0o+SYq/K6K4YUG+MklvMrP
	9Cs5Q1z63PddQJNcT+UbSH0RwJ9DzmhsnpcoE+ecWSNjD5Ksi3tayvJ6kx2UKDVusDOr
	f9ykvR8q0LtbfklYoCiMU3+9tExynaiho2aL0=
MIME-Version: 1.0
Received: by 10.231.162.9 with SMTP id t9mr3155144ibx.5.1266005544983; Fri, 12 
	Feb 2010 12:12:24 -0800 (PST)
In-Reply-To: <1265986283-28972-3-git-send-email-marcin@juszkiewicz.com.pl>
References: <1265986283-28972-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1265986283-28972-3-git-send-email-marcin@juszkiewicz.com.pl>
Date: Fri, 12 Feb 2010 12:12:24 -0800
Message-ID: <19c1b8a91002121212lfc08525uc615f845de7160e8@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.182
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 2/2] util-linux-ng: provide libblkid/libuuid/fsck
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
X-List-Received-Date: Fri, 12 Feb 2010 20:15:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 12, 2010 at 6:51 AM, Marcin Juszkiewicz
<marcin@juszkiewicz.com.pl> wrote:
> This commit is next step after e2fsprogs lost libblkid/libuuid/fsck
> packages. Most applications/libraries now require u-l-ng versions.
>
> Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
> ---
> =A0recipes/util-linux-ng/util-linux-ng-2.17/tls.patch | =A0 70 ++++++++++=
++++++++++
> =A0.../util-linux-ng-2.17/uclibc-compile.patch =A0 =A0 =A0 =A0| =A0 13 ++=
++
> =A0.../util-linux-ng-replace-siginterrupt.patch =A0 =A0 =A0 | =A0 23 ++++=
+++
> =A0recipes/util-linux-ng/util-linux-ng.inc =A0 =A0 =A0 =A0 =A0 =A0| =A0 1=
8 ++++-
> =A0recipes/util-linux-ng/util-linux-ng_2.17.bb =A0 =A0 =A0 =A0| =A0 13 ++=
++
> =A05 files changed, 133 insertions(+), 4 deletions(-)
> =A0create mode 100644 recipes/util-linux-ng/util-linux-ng-2.17/tls.patch
> =A0create mode 100644 recipes/util-linux-ng/util-linux-ng-2.17/uclibc-com=
pile.patch
> =A0create mode 100644 recipes/util-linux-ng/util-linux-ng-2.17/util-linux=
-ng-replace-siginterrupt.patch
> =A0create mode 100644 recipes/util-linux-ng/util-linux-ng_2.17.bb
>
> diff --git a/recipes/util-linux-ng/util-linux-ng-2.17/tls.patch b/recipes=
/util-linux-ng/util-linux-ng-2.17/tls.patch
> new file mode 100644
> index 0000000..bdb29ca
> --- /dev/null
> +++ b/recipes/util-linux-ng/util-linux-ng-2.17/tls.patch
> @@ -0,0 +1,70 @@
> +Index: util-linux-ng-2.16/m4/tls.m4
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- util-linux-ng-2.16.orig/m4/tls.m4 =A02009-07-04 01:20:03.000000000 +=
0200
> ++++ util-linux-ng-2.16/m4/tls.m4 =A0 =A0 =A0 2009-07-30 01:57:30.1516970=
33 +0200
> +@@ -18,31 +18,26 @@
> + # version as well.
> + #
> + AC_DEFUN([AX_TLS], [
> +- =A0AC_MSG_CHECKING(for thread local storage (TLS) class)
> +- =A0AC_CACHE_VAL(ac_cv_tls, [
> +- =A0 =A0ax_tls_keywords=3D"__thread __declspec(thread) none"
> +- =A0 =A0for ax_tls_keyword in $ax_tls_keywords; do
> +- =A0 =A0 =A0 case $ax_tls_keyword in
> +- =A0 =A0 =A0 =A0 =A0none) ac_cv_tls=3Dnone ; break ;;
> +- =A0 =A0 =A0 =A0 =A0*)
> +- =A0 =A0 =A0 =A0 =A0 =A0 AC_TRY_COMPILE(
> +- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0[#include <stdlib.h>
> +- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 static void
> +- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 foo(void) {
> +- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 static ] $ax_tls_keyword [ int bar;
> +- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 exit(1);
> +- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }],
> +- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 [],
> +- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 [ac_cv_tls=3D$ax_tls_keyword ; break],
> +- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ac_cv_tls=3Dnone
> +- =A0 =A0 =A0 =A0 =A0 =A0 )
> +- =A0 =A0 =A0 =A0 =A0esac
> +- =A0 =A0done
> +-])
> ++ =A0AC_CACHE_CHECK([for thread local storage (TLS) class],
> ++ =A0 =A0ac_cv_tls,
> ++ =A0 =A0[AC_LINK_IFELSE([__thread int a; int b; int main() { return a =
=3D b; }],
> ++ =A0 =A0 =A0 [chktls_save_LDFLAGS=3D"$LDFLAGS"
> ++ =A0 =A0 =A0 =A0LDFLAGS=3D"-shared -Wl,--no-undefined $LDFLAGS"
> ++ =A0 =A0 =A0 =A0chktls_save_CFLAGS=3D"$CFLAGS"
> ++ =A0 =A0 =A0 =A0CFLAGS=3D"-fPIC $CFLAGS"
> ++ =A0 =A0 =A0 =A0dnl If -shared works, test if TLS works in a shared lib=
rary.
> ++ =A0 =A0 =A0 =A0AC_LINK_IFELSE([int f() { return 0; }],
> ++ =A0 =A0 =A0 =A0 =A0AC_LINK_IFELSE([__thread int a; int b; int f() { re=
turn a =3D b; }],
> ++ =A0 =A0 =A0 =A0 =A0 =A0[ac_cv_tls=3Dyes],
> ++ =A0 =A0 =A0 =A0 =A0 =A0[ac_cv_tls=3Dno]),
> ++ =A0 =A0 =A0 =A0 =A0[ac_cv_tls=3Dyes])
> ++ =A0 =A0 =A0 =A0CFLAGS=3D"$chktls_save_CFLAGS"
> ++ =A0 =A0 =A0 =A0LDFLAGS=3D"$chktls_save_LDFLAGS"], [ac_cv_tls=3Dno])
> ++ =A0 =A0])
> +
> +- =A0if test "$ac_cv_tls" !=3D "none"; then
> +- =A0 =A0dnl AC_DEFINE([TLS], [], [If the compiler supports a TLS storag=
e class define it to that here])
> +- =A0 =A0AC_DEFINE_UNQUOTED([TLS], $ac_cv_tls, [If the compiler supports=
 a TLS storage class define it to that here])
> +- =A0fi
> +- =A0AC_MSG_RESULT($ac_cv_tls)
> ++ =A0AS_IF([test "x$ac_cv_tls" =3D "xyes"],
> ++ =A0 =A0[AC_DEFINE([TLS], 1,
> ++ =A0 =A0 [Define this if the compiler supports __thread for Thread-Loca=
l Storage])
> ++ =A0 =A0 $1],
> ++ =A0 =A0[$2])
> + ])
> +Index: util-linux-ng-2.16/shlibs/uuid/src/gen_uuid.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- util-linux-ng-2.16.orig/shlibs/uuid/src/gen_uuid.c 2009-07-30 02:31:=
48.518159459 +0200
> ++++ util-linux-ng-2.16/shlibs/uuid/src/gen_uuid.c =A0 =A0 =A02009-07-30 =
02:32:04.867871183 +0200
> +@@ -99,7 +99,7 @@
> + #endif
> +
> + #ifdef TLS
> +-#define THREAD_LOCAL static TLS
> ++#define THREAD_LOCAL static __thread
> + #else
> + #define THREAD_LOCAL static
> + #endif
> diff --git a/recipes/util-linux-ng/util-linux-ng-2.17/uclibc-compile.patc=
h b/recipes/util-linux-ng/util-linux-ng-2.17/uclibc-compile.patch
> new file mode 100644
> index 0000000..b2e8a8b
> --- /dev/null
> +++ b/recipes/util-linux-ng/util-linux-ng-2.17/uclibc-compile.patch
> @@ -0,0 +1,13 @@
> +Index: util-linux-ng-2.16/misc-utils/cal.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- util-linux-ng-2.16.orig/misc-utils/cal.c =A0 2009-07-03 16:20:01.000=
000000 -0700
> ++++ util-linux-ng-2.16/misc-utils/cal.c =A0 =A0 =A0 =A02009-07-18 23:21:=
37.000000000 -0700
> +@@ -407,7 +407,7 @@
> + =A0 strcpy(day_headings,"");
> + =A0 strcpy(j_day_headings,"");
> +
> +-#ifdef HAVE_LANGINFO_H
> ++#ifdef HAVE_LANGINFO_H && !defined(__UCLIBC__)
> + # define weekday(wd) =A0nl_langinfo(ABDAY_1+wd)
> + #else
> + # define weekday(wd) =A0_time_info->abbrev_wkday[wd]
> diff --git a/recipes/util-linux-ng/util-linux-ng-2.17/util-linux-ng-repla=
ce-siginterrupt.patch b/recipes/util-linux-ng/util-linux-ng-2.17/util-linux=
-ng-replace-siginterrupt.patch
> new file mode 100644
> index 0000000..4b5eb73
> --- /dev/null
> +++ b/recipes/util-linux-ng/util-linux-ng-2.17/util-linux-ng-replace-sigi=
nterrupt.patch
> @@ -0,0 +1,23 @@
> +Index: util-linux-ng-2.14/login-utils/login.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- util-linux-ng-2.14.orig/login-utils/login.c =A0 =A0 =A0 =A02008-05-2=
8 16:01:02.000000000 -0700
> ++++ util-linux-ng-2.14/login-utils/login.c =A0 =A0 2009-03-04 18:31:42.0=
00000000 -0800
> +@@ -358,6 +358,7 @@
> + =A0 =A0 char *childArgv[10];
> + =A0 =A0 char *buff;
> + =A0 =A0 int childArgc =3D 0;
> ++ =A0 =A0struct sigaction act;
> + #ifdef HAVE_SECURITY_PAM_MISC_H
> + =A0 =A0 int retcode;
> + =A0 =A0 pam_handle_t *pamh =3D NULL;
> +@@ -373,7 +374,9 @@
> + =A0 =A0 pid =3D getpid();
> +
> + =A0 =A0 signal(SIGALRM, timedout);
> +- =A0 =A0siginterrupt(SIGALRM,1); =A0 =A0 =A0 =A0 =A0 /* we have to inte=
rrupt syscalls like ioclt() */
> ++ =A0 =A0(void) sigaction(SIGALRM, NULL, &act);
> ++ =A0 =A0act.sa_flags &=3D ~SA_RESTART;
> ++ =A0 =A0sigaction(SIGALRM, &act, NULL);
> + =A0 =A0 alarm((unsigned int)timeout);
> + =A0 =A0 signal(SIGQUIT, SIG_IGN);
> + =A0 =A0 signal(SIGINT, SIG_IGN);
> diff --git a/recipes/util-linux-ng/util-linux-ng.inc b/recipes/util-linux=
-ng/util-linux-ng.inc
> index 7f4333b..c8c2b3c 100644
> --- a/recipes/util-linux-ng/util-linux-ng.inc
> +++ b/recipes/util-linux-ng/util-linux-ng.inc
> @@ -7,7 +7,7 @@ inherit autotools
>
> =A0DEFAULT_PREFERENCE =3D "-1"
>
> -INC_PR =3D "r9"
> +INC_PR =3D "r10"
>
> =A0# allows for a release candidate
> =A0RC ?=3D ""
> @@ -16,7 +16,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/utils/util-l=
inux-ng/v${PV}/util-linux-n
>
> =A0SRC_URI_append_chinook-compat =3D " file://chinook_libtool.patch;patch=
=3D1 "
>
> -PACKAGES =3D+ "util-linux-ng-fdisk util-linux-ng-cfdisk util-linux-ng-sf=
disk util-linux-ng-swaponoff util-linux-ng-losetup util-linux-ng-umount uti=
l-linux-ng-mount util-linux-ng-readprofile "
> +PACKAGES =3D+ "util-linux-ng-fdisk util-linux-ng-cfdisk util-linux-ng-sf=
disk util-linux-ng-swaponoff util-linux-ng-losetup util-linux-ng-umount uti=
l-linux-ng-mount util-linux-ng-readprofile util-linux-ng-fsck"
> =A0PACKAGES_DYNAMIC =3D "libblkid*"
>
> =A0# Provide old util-linux names (several recipes still use DEPENDS or R=
DEPENDS =3D "util-linux"):
> @@ -30,6 +30,7 @@ RPROVIDES_util-linux-ng-losetup =3D "util-linux-losetup=
"
> =A0RPROVIDES_util-linux-ng-umount =3D "util-linux-umount"
> =A0RPROVIDES_util-linux-ng-mount =3D "util-linux-mount"
> =A0RPROVIDES_util-linux-ng-readprofile =3D "util-linux-readprofile"
> +RPROVIDES_util-linux-ng-fsck =3D "e2fsprogs-fsck"
>
> =A0FILES_${PN}-doc +=3D "/usr/share/misc/getopt/getopt-*.*"
> =A0FILES_${PN} =3D "${bindir} ${sbindir} ${base_bindir} ${base_sbindir}"
> @@ -44,13 +45,14 @@ FILES_util-linux-ng-mount =3D "${base_bindir}/mount.$=
{PN} ${sysconfdir}/default/mo
> =A0FILES_util-linux-ng-umount =3D "${base_bindir}/umount.${PN}"
> =A0# Moved to ${base_sbindir} by do_install:
> =A0FILES_util-linux-ng-readprofile =3D "${base_sbindir}/readprofile.${PN}=
"
> +FILES_util-linux-ng-fsck =3D "${base_sbindir}/fsck.${PN}"
>
> =A0PACKAGES =3D+ "${PN}-mountall"
> =A0FILES_${PN}-mountall =3D "${sysconfdir}/default/mountall"
> =A0RREPLACES_${PN}-mountall =3D "busybox-mountall"
>
> =A0RRECOMMENDS_${PN} =3D "util-linux-ng-fdisk util-linux-ng-cfdisk util-l=
inux-ng-sfdisk util-linux-ng-mount util-linux-ng-readprofile "
> -RDEPENDS_${PN} =3D "${PN}-mountall util-linux-ng-umount util-linux-ng-sw=
aponoff util-linux-ng-losetup"
> +RDEPENDS_${PN} =3D "${PN}-mountall util-linux-ng-umount util-linux-ng-sw=
aponoff util-linux-ng-losetup ${PN}-fsck"
>
> =A0EXTRA_OECONF =3D "--disable-use-tty-group --disable-makeinstall-chown =
\
> =A0--enable-kill --enable-last --enable-mesg --enable-raw --enable-login-=
utils \
> @@ -111,7 +113,7 @@ do_install () {
> =A0 =A0 =A0 =A0mkdir -p ${D}${base_bindir}
>
> =A0 =A0 =A0 =A0 sbinprogs=3D"agetty blockdev ctrlaltdel cfdisk"
> - =A0 =A0 =A0 =A0sbinprogs_a=3D"pivot_root hwclock mkswap shutdown mkfs.m=
inix fsck.minix losetup swapon fdisk readprofile"
> + =A0 =A0 =A0 =A0sbinprogs_a=3D"pivot_root hwclock mkswap shutdown mkfs.m=
inix fsck.minix losetup swapon fdisk readprofile fsck"
> =A0 =A0 =A0 =A0 usrbinprogs_a=3D"hexdump last logger mesg renice wall"
> =A0 =A0 =A0 =A0 binprogs_a=3D"dmesg kill more umount mount"
>
> @@ -247,6 +249,14 @@ pkg_postinst_util-linux-ng-losetup () {
> =A0 =A0 =A0 =A0update-alternatives --install ${base_sbindir}/losetup lose=
tup losetup.${PN} 100
> =A0}
>
> +pkg_postinst_util-linux-ng-fsck () {
> + =A0 =A0 =A0 update-alternatives --install ${base_sbindir}/fsck fsck fsc=
k.${PN} 100
> +}
> +
> +pkg_prerm_util-linux-ng-fsck () {
> + =A0 =A0 =A0 update-alternatives --remove fsck fsck.${PN}
> +}
> +
> =A0pkg_prerm_util-linux-ng-losetup () {
> =A0 =A0 =A0 =A0update-alternatives --remove losetup losetup.${PN}
> =A0}
> diff --git a/recipes/util-linux-ng/util-linux-ng_2.17.bb b/recipes/util-l=
inux-ng/util-linux-ng_2.17.bb
> new file mode 100644
> index 0000000..3fbdb8c
> --- /dev/null
> +++ b/recipes/util-linux-ng/util-linux-ng_2.17.bb
> @@ -0,0 +1,13 @@
> +require util-linux-ng.inc
> +
> +PR =3D "${INC_PR}.4"

may be you should start with 0 instead of 4 since its a new recipe.

> +
> +SRC_URI +=3D "file://uclibc-compile.patch;patch=3D1 \
> + =A0 =A0 =A0 =A0 =A0 file://util-linux-ng-replace-siginterrupt.patch;pat=
ch=3D1 \
> + =A0 =A0 =A0 =A0 =A0 "
> +
> +EXTRA_OECONF +=3D " --enable-libuuid --enable-libblkid \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 --enable-fsck"

in this recipe fsck is enabled but 2.16 disables it will that create
packaging problems for 2.16 now due to changes in util-linux-ng.inc ?

> +LDFLAGS_append_libc-uclibc =3D " -lintl"
> +PACKAGES_DYNAMIC +=3D "libuuid*"
> +
> --
> 1.6.6.1
>
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


