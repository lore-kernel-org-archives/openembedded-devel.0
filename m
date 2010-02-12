Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NfxCA-00047B-Ta for openembedded-devel@lists.openembedded.org;
	Fri, 12 Feb 2010 16:12:42 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nfx9g-0004PQ-Bs for openembedded-devel@lists.openembedded.org;
	Fri, 12 Feb 2010 16:10:04 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Feb 2010 16:10:04 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Feb 2010 16:10:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 12 Feb 2010 16:05:23 +0100
Message-ID: <hl3qnh$blr$2@ger.gmane.org>
References: <1265986283-28972-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1265986283-28972-3-git-send-email-marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100204 Shredder/3.0.2pre
In-Reply-To: <1265986283-28972-3-git-send-email-marcin@juszkiewicz.com.pl>
X-Enigmail-Version: 1.0.1
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
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
X-List-Received-Date: Fri, 12 Feb 2010 15:12:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 12-02-10 15:51, Marcin Juszkiewicz wrote:
> This commit is next step after e2fsprogs lost libblkid/libuuid/fsck
> packages. Most applications/libraries now require u-l-ng versions.
> 

I'm not really fond of the PACKAGES_DYNAMIC bit, but:

Acked-by: Koen Kooi <koen@openembedded.org>



> Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
> ---
>  recipes/util-linux-ng/util-linux-ng-2.17/tls.patch |   70 ++++++++++++++++++++
>  .../util-linux-ng-2.17/uclibc-compile.patch        |   13 ++++
>  .../util-linux-ng-replace-siginterrupt.patch       |   23 +++++++
>  recipes/util-linux-ng/util-linux-ng.inc            |   18 ++++-
>  recipes/util-linux-ng/util-linux-ng_2.17.bb        |   13 ++++
>  5 files changed, 133 insertions(+), 4 deletions(-)
>  create mode 100644 recipes/util-linux-ng/util-linux-ng-2.17/tls.patch
>  create mode 100644 recipes/util-linux-ng/util-linux-ng-2.17/uclibc-compile.patch
>  create mode 100644 recipes/util-linux-ng/util-linux-ng-2.17/util-linux-ng-replace-siginterrupt.patch
>  create mode 100644 recipes/util-linux-ng/util-linux-ng_2.17.bb
> 
> diff --git a/recipes/util-linux-ng/util-linux-ng-2.17/tls.patch b/recipes/util-linux-ng/util-linux-ng-2.17/tls.patch
> new file mode 100644
> index 0000000..bdb29ca
> --- /dev/null
> +++ b/recipes/util-linux-ng/util-linux-ng-2.17/tls.patch
> @@ -0,0 +1,70 @@
> +Index: util-linux-ng-2.16/m4/tls.m4
> +===================================================================
> +--- util-linux-ng-2.16.orig/m4/tls.m4	2009-07-04 01:20:03.000000000 +0200
> ++++ util-linux-ng-2.16/m4/tls.m4	2009-07-30 01:57:30.151697033 +0200
> +@@ -18,31 +18,26 @@
> + # version as well.
> + #
> + AC_DEFUN([AX_TLS], [
> +-  AC_MSG_CHECKING(for thread local storage (TLS) class)
> +-  AC_CACHE_VAL(ac_cv_tls, [
> +-    ax_tls_keywords="__thread __declspec(thread) none"
> +-    for ax_tls_keyword in $ax_tls_keywords; do
> +-       case $ax_tls_keyword in
> +-          none) ac_cv_tls=none ; break ;;
> +-          *)
> +-             AC_TRY_COMPILE(
> +-                [#include <stdlib.h>
> +-                 static void
> +-                 foo(void) {
> +-                 static ] $ax_tls_keyword [ int bar;
> +-                 exit(1);
> +-                 }],
> +-                 [],
> +-                 [ac_cv_tls=$ax_tls_keyword ; break],
> +-                 ac_cv_tls=none
> +-             )
> +-          esac
> +-    done
> +-])
> ++  AC_CACHE_CHECK([for thread local storage (TLS) class],
> ++    ac_cv_tls,
> ++    [AC_LINK_IFELSE([__thread int a; int b; int main() { return a = b; }],
> ++	 [chktls_save_LDFLAGS="$LDFLAGS"
> ++	  LDFLAGS="-shared -Wl,--no-undefined $LDFLAGS"
> ++	  chktls_save_CFLAGS="$CFLAGS"
> ++	  CFLAGS="-fPIC $CFLAGS"
> ++	  dnl If -shared works, test if TLS works in a shared library.
> ++	  AC_LINK_IFELSE([int f() { return 0; }],
> ++	    AC_LINK_IFELSE([__thread int a; int b; int f() { return a = b; }],
> ++	      [ac_cv_tls=yes],
> ++	      [ac_cv_tls=no]),
> ++	    [ac_cv_tls=yes])
> ++	  CFLAGS="$chktls_save_CFLAGS"
> ++	  LDFLAGS="$chktls_save_LDFLAGS"], [ac_cv_tls=no])
> ++    ])
> + 
> +-  if test "$ac_cv_tls" != "none"; then
> +-    dnl AC_DEFINE([TLS], [], [If the compiler supports a TLS storage class define it to that here])
> +-    AC_DEFINE_UNQUOTED([TLS], $ac_cv_tls, [If the compiler supports a TLS storage class define it to that here])
> +-  fi
> +-  AC_MSG_RESULT($ac_cv_tls)
> ++  AS_IF([test "x$ac_cv_tls" = "xyes"],
> ++    [AC_DEFINE([TLS], 1,
> ++     [Define this if the compiler supports __thread for Thread-Local Storage])
> ++     $1],
> ++    [$2])
> + ])
> +Index: util-linux-ng-2.16/shlibs/uuid/src/gen_uuid.c
> +===================================================================
> +--- util-linux-ng-2.16.orig/shlibs/uuid/src/gen_uuid.c	2009-07-30 02:31:48.518159459 +0200
> ++++ util-linux-ng-2.16/shlibs/uuid/src/gen_uuid.c	2009-07-30 02:32:04.867871183 +0200
> +@@ -99,7 +99,7 @@
> + #endif
> + 
> + #ifdef TLS
> +-#define THREAD_LOCAL static TLS
> ++#define THREAD_LOCAL static __thread
> + #else
> + #define THREAD_LOCAL static
> + #endif
> diff --git a/recipes/util-linux-ng/util-linux-ng-2.17/uclibc-compile.patch b/recipes/util-linux-ng/util-linux-ng-2.17/uclibc-compile.patch
> new file mode 100644
> index 0000000..b2e8a8b
> --- /dev/null
> +++ b/recipes/util-linux-ng/util-linux-ng-2.17/uclibc-compile.patch
> @@ -0,0 +1,13 @@
> +Index: util-linux-ng-2.16/misc-utils/cal.c
> +===================================================================
> +--- util-linux-ng-2.16.orig/misc-utils/cal.c	2009-07-03 16:20:01.000000000 -0700
> ++++ util-linux-ng-2.16/misc-utils/cal.c	2009-07-18 23:21:37.000000000 -0700
> +@@ -407,7 +407,7 @@
> +   strcpy(day_headings,"");
> +   strcpy(j_day_headings,"");
> + 
> +-#ifdef HAVE_LANGINFO_H
> ++#ifdef HAVE_LANGINFO_H && !defined(__UCLIBC__)
> + # define weekday(wd)	nl_langinfo(ABDAY_1+wd)
> + #else
> + # define weekday(wd)	_time_info->abbrev_wkday[wd]
> diff --git a/recipes/util-linux-ng/util-linux-ng-2.17/util-linux-ng-replace-siginterrupt.patch b/recipes/util-linux-ng/util-linux-ng-2.17/util-linux-ng-replace-siginterrupt.patch
> new file mode 100644
> index 0000000..4b5eb73
> --- /dev/null
> +++ b/recipes/util-linux-ng/util-linux-ng-2.17/util-linux-ng-replace-siginterrupt.patch
> @@ -0,0 +1,23 @@
> +Index: util-linux-ng-2.14/login-utils/login.c
> +===================================================================
> +--- util-linux-ng-2.14.orig/login-utils/login.c	2008-05-28 16:01:02.000000000 -0700
> ++++ util-linux-ng-2.14/login-utils/login.c	2009-03-04 18:31:42.000000000 -0800
> +@@ -358,6 +358,7 @@
> +     char *childArgv[10];
> +     char *buff;
> +     int childArgc = 0;
> ++    struct sigaction act;
> + #ifdef HAVE_SECURITY_PAM_MISC_H
> +     int retcode;
> +     pam_handle_t *pamh = NULL;
> +@@ -373,7 +374,9 @@
> +     pid = getpid();
> + 
> +     signal(SIGALRM, timedout);
> +-    siginterrupt(SIGALRM,1);           /* we have to interrupt syscalls like ioclt() */
> ++    (void) sigaction(SIGALRM, NULL, &act);
> ++    act.sa_flags &= ~SA_RESTART;
> ++    sigaction(SIGALRM, &act, NULL);
> +     alarm((unsigned int)timeout);
> +     signal(SIGQUIT, SIG_IGN);
> +     signal(SIGINT, SIG_IGN);
> diff --git a/recipes/util-linux-ng/util-linux-ng.inc b/recipes/util-linux-ng/util-linux-ng.inc
> index 7f4333b..c8c2b3c 100644
> --- a/recipes/util-linux-ng/util-linux-ng.inc
> +++ b/recipes/util-linux-ng/util-linux-ng.inc
> @@ -7,7 +7,7 @@ inherit autotools
>  
>  DEFAULT_PREFERENCE = "-1"
>  
> -INC_PR = "r9"
> +INC_PR = "r10"
>  
>  # allows for a release candidate
>  RC ?= ""
> @@ -16,7 +16,7 @@ SRC_URI = "${KERNELORG_MIRROR}/pub/linux/utils/util-linux-ng/v${PV}/util-linux-n
>  
>  SRC_URI_append_chinook-compat = " file://chinook_libtool.patch;patch=1 "
>  
> -PACKAGES =+ "util-linux-ng-fdisk util-linux-ng-cfdisk util-linux-ng-sfdisk util-linux-ng-swaponoff util-linux-ng-losetup util-linux-ng-umount util-linux-ng-mount util-linux-ng-readprofile "
> +PACKAGES =+ "util-linux-ng-fdisk util-linux-ng-cfdisk util-linux-ng-sfdisk util-linux-ng-swaponoff util-linux-ng-losetup util-linux-ng-umount util-linux-ng-mount util-linux-ng-readprofile util-linux-ng-fsck"
>  PACKAGES_DYNAMIC = "libblkid*"
>  
>  # Provide old util-linux names (several recipes still use DEPENDS or RDEPENDS = "util-linux"):
> @@ -30,6 +30,7 @@ RPROVIDES_util-linux-ng-losetup = "util-linux-losetup"
>  RPROVIDES_util-linux-ng-umount = "util-linux-umount"
>  RPROVIDES_util-linux-ng-mount = "util-linux-mount"
>  RPROVIDES_util-linux-ng-readprofile = "util-linux-readprofile"
> +RPROVIDES_util-linux-ng-fsck = "e2fsprogs-fsck"
>  
>  FILES_${PN}-doc += "/usr/share/misc/getopt/getopt-*.*"
>  FILES_${PN} = "${bindir} ${sbindir} ${base_bindir} ${base_sbindir}"
> @@ -44,13 +45,14 @@ FILES_util-linux-ng-mount = "${base_bindir}/mount.${PN} ${sysconfdir}/default/mo
>  FILES_util-linux-ng-umount = "${base_bindir}/umount.${PN}"
>  # Moved to ${base_sbindir} by do_install:
>  FILES_util-linux-ng-readprofile = "${base_sbindir}/readprofile.${PN}"
> +FILES_util-linux-ng-fsck = "${base_sbindir}/fsck.${PN}"
>  
>  PACKAGES =+ "${PN}-mountall"
>  FILES_${PN}-mountall = "${sysconfdir}/default/mountall"
>  RREPLACES_${PN}-mountall = "busybox-mountall"
>  
>  RRECOMMENDS_${PN} = "util-linux-ng-fdisk util-linux-ng-cfdisk util-linux-ng-sfdisk util-linux-ng-mount util-linux-ng-readprofile "
> -RDEPENDS_${PN} = "${PN}-mountall util-linux-ng-umount util-linux-ng-swaponoff util-linux-ng-losetup"
> +RDEPENDS_${PN} = "${PN}-mountall util-linux-ng-umount util-linux-ng-swaponoff util-linux-ng-losetup ${PN}-fsck"
>  
>  EXTRA_OECONF = "--disable-use-tty-group --disable-makeinstall-chown \
>  --enable-kill --enable-last --enable-mesg --enable-raw --enable-login-utils \
> @@ -111,7 +113,7 @@ do_install () {
>  	mkdir -p ${D}${base_bindir}
>  
>          sbinprogs="agetty blockdev ctrlaltdel cfdisk"
> -        sbinprogs_a="pivot_root hwclock mkswap shutdown mkfs.minix fsck.minix losetup swapon fdisk readprofile"
> +        sbinprogs_a="pivot_root hwclock mkswap shutdown mkfs.minix fsck.minix losetup swapon fdisk readprofile fsck"
>          usrbinprogs_a="hexdump last logger mesg renice wall"
>          binprogs_a="dmesg kill more umount mount"
>  
> @@ -247,6 +249,14 @@ pkg_postinst_util-linux-ng-losetup () {
>  	update-alternatives --install ${base_sbindir}/losetup losetup losetup.${PN} 100
>  }
>  
> +pkg_postinst_util-linux-ng-fsck () {
> +	update-alternatives --install ${base_sbindir}/fsck fsck fsck.${PN} 100
> +}
> +
> +pkg_prerm_util-linux-ng-fsck () {
> +	update-alternatives --remove fsck fsck.${PN}
> +}
> +
>  pkg_prerm_util-linux-ng-losetup () {
>  	update-alternatives --remove losetup losetup.${PN}
>  }
> diff --git a/recipes/util-linux-ng/util-linux-ng_2.17.bb b/recipes/util-linux-ng/util-linux-ng_2.17.bb
> new file mode 100644
> index 0000000..3fbdb8c
> --- /dev/null
> +++ b/recipes/util-linux-ng/util-linux-ng_2.17.bb
> @@ -0,0 +1,13 @@
> +require util-linux-ng.inc
> +
> +PR = "${INC_PR}.4"
> +
> +SRC_URI += "file://uclibc-compile.patch;patch=1 \
> +	    file://util-linux-ng-replace-siginterrupt.patch;patch=1 \
> +           "
> +
> +EXTRA_OECONF += " --enable-libuuid --enable-libblkid \
> +		--enable-fsck"
> +LDFLAGS_append_libc-uclibc = " -lintl"
> +PACKAGES_DYNAMIC += "libuuid*"
> +

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLdW4zMkyGM64RGpERAvmhAJ4gHJ9oK4BnzplDHCSxmrQW9Mwl7QCgoW+l
A0A6U/AQjdbfHxMNf/+Pmxk=
=8b3U
-----END PGP SIGNATURE-----



