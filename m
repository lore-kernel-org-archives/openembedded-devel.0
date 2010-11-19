Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PJXyu-00007G-Cc
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Nov 2010 21:54:54 +0100
Received: by yxd5 with SMTP id 5so3152987yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Nov 2010 12:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=q3n5Sg9KBV7zwkhHYGnHv8Kol/EHMWjXInPCainSxW4=;
	b=VP/ltOaRw3szTYI5aUauwZE0MiPGLNZKiCtgZA9OAlC0ADzySGCcInX9AOyVS7I0UP
	o4R+p5Gh+DSp7ViU/o9GZgBuZ7XZudtKkg9eghyuLTQ9x1Levuur/GYX4PmmntYo5/GL
	5r4xZysdVv1JOKsQGAZqDusIUK9FKbEkNYM5c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=qAFoEFRqxfmBhiEzDxJGWzqRbL51um+QImOx4PzH/f5HKwWziVk4bmbjWFqF/RJwc4
	TTtbgMuwJ8sVB7pmQvzu3KQ6bU4mCuh2+RLX/WsNDUM2vUyO8/vEqKYfd/cnJLnl9uH5
	vg/NhumtRau6y10EbjHRUh5X1b+1fBnCsu4yE=
Received: by 10.90.80.18 with SMTP id d18mr3336637agb.31.1290200021621;
	Fri, 19 Nov 2010 12:53:41 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id b25sm2220151anb.23.2010.11.19.12.53.40
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 19 Nov 2010 12:53:40 -0800 (PST)
Date: Fri, 19 Nov 2010 12:53:02 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101119205302.GA8017@gmail.com>
References: <1290161253-19634-1-git-send-email-dp@xora.org.uk>
MIME-Version: 1.0
In-Reply-To: <1290161253-19634-1-git-send-email-dp@xora.org.uk>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] libffi_3.0.9.bb : add a BBCLASSEXTEND version of latest libffi
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
X-List-Received-Date: Fri, 19 Nov 2010 20:54:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (19/11/10 10:07), Graeme Gregory wrote:
> Initially taken from poky with changes required for OE. Poky recipe is much
> simpler than the ones we have in OE and it seems we have a lot of historic that
> is no longer needed.


Sounds nice. May be cp will be better instead of mv in do_install_append ?
Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
>  recipes/libffi/libffi-2.0+gcc3.4.1/soname.patch |   32 --------
>  recipes/libffi/libffi-native_2.0+gcc4.3.2.bb    |   32 --------
>  recipes/libffi/libffi/autoconf-2.64.patch       |   24 ------
>  recipes/libffi/libffi_2.0+gcc3.4.1.bb           |   68 -----------------
>  recipes/libffi/libffi_2.0+gcc4.3.2.bb           |   90 -----------------------
>  recipes/libffi/libffi_3.0.8.bb                  |   85 ---------------------
>  recipes/libffi/libffi_3.0.9.bb                  |   15 ++++
>  7 files changed, 15 insertions(+), 331 deletions(-)
>  delete mode 100644 recipes/libffi/libffi-2.0+gcc3.4.1/soname.patch
>  delete mode 100644 recipes/libffi/libffi-native_2.0+gcc4.3.2.bb
>  delete mode 100644 recipes/libffi/libffi/autoconf-2.64.patch
>  delete mode 100644 recipes/libffi/libffi_2.0+gcc3.4.1.bb
>  delete mode 100644 recipes/libffi/libffi_2.0+gcc4.3.2.bb
>  delete mode 100644 recipes/libffi/libffi_3.0.8.bb
>  create mode 100644 recipes/libffi/libffi_3.0.9.bb
> 
> diff --git a/recipes/libffi/libffi-2.0+gcc3.4.1/soname.patch b/recipes/libffi/libffi-2.0+gcc3.4.1/soname.patch
> deleted file mode 100644
> index bccf75d..0000000
> --- a/recipes/libffi/libffi-2.0+gcc3.4.1/soname.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> ---- libffi.orig/Makefile.am	2003-10-21 21:01:53.000000000 +0200
> -+++ libffi/Makefile.am	2004-08-09 13:26:13.000000000 +0200
> -@@ -175,7 +175,7 @@
> - 
> - AM_CFLAGS = -Wall -g -fexceptions
> - 
> --libffi_la_LDFLAGS = -release $(VERSION) 
> -+libffi_la_LDFLAGS = -version-info `grep -v '^\#' $(srcdir)/libtool-version`
> - 
> - INCLUDES = -I. -I$(top_srcdir)/include -Iinclude -I$(top_srcdir)/src
> - 
> ---- libffi.orig/libtool-version	1970-01-01 01:00:00.000000000 +0100
> -+++ libffi/libtool-version	2004-08-09 13:24:18.000000000 +0200
> -@@ -0,0 +1,6 @@
> -+# This file is used to maintain libtool version info for libffi.  See
> -+# the libtool manual to understand the meaning of the fields.  This is
> -+# a separate file so that version updates don't involve re-running
> -+# automake.
> -+# CURRENT:REVISION:AGE
> -+3:0:0
> -
> ---- libtool.orig/Makefile.in	2004-08-09 14:29:09.000000000 +0200
> -+++ libtool/Makefile.in	2004-08-09 14:29:53.000000000 +0200
> -@@ -226,7 +226,7 @@
> - 
> - AM_CFLAGS = -Wall -g -fexceptions
> - 
> --libffi_la_LDFLAGS = -release $(VERSION) 
> -+libffi_la_LDFLAGS = -version-info `grep -v '^\#' $(srcdir)/libtool-version`
> - 
> - INCLUDES = -I. -I$(top_srcdir)/include -Iinclude -I$(top_srcdir)/src
> - ACLOCAL_M4 = $(top_srcdir)/aclocal.m4
> diff --git a/recipes/libffi/libffi-native_2.0+gcc4.3.2.bb b/recipes/libffi/libffi-native_2.0+gcc4.3.2.bb
> deleted file mode 100644
> index 4a26199..0000000
> --- a/recipes/libffi/libffi-native_2.0+gcc4.3.2.bb
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -require libffi_${PV}.bb
> -
> -inherit native
> -
> -EXTRA_OECONF = "--with-gnu-ld \
> -                --enable-shared \
> -                --enable-target-optspace \
> -                --enable-languages=c,c++,f77 \
> -                --enable-threads=posix \
> -                --disable-multilib \
> -                --enable-c99 \
> -                --enable-long-long \
> -                --enable-symvers=gnu \
> -                --program-prefix=${TARGET_PREFIX} \
> -                ${EXTRA_OECONF_PATHS}"
> -
> -ffi_include = "ffi.h ffitarget.h"
> -
> -install_libffi_headers() {
> -	:
> -}
> -
> -do_install () {
> -	install -d ${D}${libdir} ${D}${includedir}
> -	oe_libinstall -so -C .libs libffi ${D}${libdir}
> -
> -	for i in ${ffi_include}; do
> -		install -m 0644 include/$i ${D}${includedir}/
> -	done
> -}
> -
> -NATIVE_INSTALL_WORKS = "1"
> diff --git a/recipes/libffi/libffi/autoconf-2.64.patch b/recipes/libffi/libffi/autoconf-2.64.patch
> deleted file mode 100644
> index 7e5a41e..0000000
> --- a/recipes/libffi/libffi/autoconf-2.64.patch
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -From cc8c1160a690a1eafc35e745da5f24e258436bda Mon Sep 17 00:00:00 2001
> -From: Mike Lundy <mike@fluffypenguin.org>
> -Date: Fri, 2 Oct 2009 12:28:13 -0700
> -Subject: [PATCH] fix libffi for autoconf-2.64
> -
> ----
> - libffi-3.0.8/configure.ac |    1 +
> - 1 files changed, 1 insertions(+), 0 deletions(-)
> -
> -diff --git libffi-3.0.8/configure.ac libffi-3.0.8/configure.ac
> -index 6a7e7fb..4c3f190 100644
> ---- libffi-3.0.8/configure.ac
> -+++ libffi-3.0.8/configure.ac
> -@@ -20,6 +20,7 @@ AM_INIT_AUTOMAKE
> - m4_rename([_AC_ARG_VAR_PRECIOUS],[real_PRECIOUS])
> - m4_define([_AC_ARG_VAR_PRECIOUS],[])
> - AC_PROG_CC
> -+m4_undefine([_AC_ARG_VAR_PRECIOUS])
> - m4_rename([real_PRECIOUS],[_AC_ARG_VAR_PRECIOUS])
> - 
> - AC_SUBST(CFLAGS)
> --- 
> -1.6.4
> -
> diff --git a/recipes/libffi/libffi_2.0+gcc3.4.1.bb b/recipes/libffi/libffi_2.0+gcc3.4.1.bb
> deleted file mode 100644
> index ceb46b1..0000000
> --- a/recipes/libffi/libffi_2.0+gcc3.4.1.bb
> +++ /dev/null
> @@ -1,68 +0,0 @@
> -SECTION = "libs"
> -DESCRIPTION = "Foreign Function Interface library"
> -LICENSE = "libffi"
> -PRIORITY = "optional"
> -PR = "r1"
> -
> -inherit autotools gettext
> -
> -PACKAGES = "${PN}-dbg ${PN} ${PN}-dev"
> -
> -FILES_${PN} = "${libdir}/libffi.so.*"
> -
> -FILES_${PN}-dev = "${includedir}/ffi* \
> -		   ${libdir}/libffi.a \
> -		   ${libdir}/libffi.la \
> -		   ${libdir}/libffi.so"
> -
> -GCC_VER = "${@bb.data.getVar('PV',d,1).split('gcc')[1]}"
> -
> -SRC_URI = "${GNU_MIRROR}/gcc/gcc-${GCC_VER}/gcc-${GCC_VER}.tar.bz2 \
> -	   file://soname.patch"
> -
> -MIRRORS_prepend () {
> -${GNU_MIRROR}/gcc/	http://gcc.get-software.com/releases/
> -${GNU_MIRROR}/gcc/	http://mirrors.rcn.net/pub/sourceware/gcc/releases/
> -}
> -
> -S = "${WORKDIR}/gcc-${GCC_VER}/libffi"
> -B = "${S}/build.${HOST_SYS}.${TARGET_SYS}"
> -
> -EXTRA_OECONF = "--with-gnu-ld \
> -                --enable-shared \
> -                --enable-target-optspace \
> -                --enable-languages=c,c++,f77 \
> -                --enable-threads=posix \
> -                --enable-multilib \
> -                --enable-c99 \
> -                --enable-long-long \
> -                --enable-symvers=gnu \
> -                --program-prefix=${TARGET_PREFIX} \
> -                ${EXTRA_OECONF_PATHS}"
> -
> -EXTRA_OECONF_PATHS = "--with-local-prefix=${prefix}/local \
> -                      --with-gxx-include-dir=${includedir}/c++/${PV}"
> -
> -do_configure () {
> -	(cd ${S}/.. && gnu-configize) || die "failure running gnu-configize"
> -	oe_runconf
> -}
> -
> -do_install_append() {
> -	# follow debian and move this to $includedir
> -	mv ${D}${libdir}/gcc/${TARGET_SYS}/${GCC_VER}/include/libffi/ffitarget.h ${D}${includedir}/
> -}
> -
> -ffi_include = "ffi.h ffitarget.h"
> -
> -do_stage () {
> -	oe_libinstall -so -C .libs libffi ${STAGING_LIBDIR}
> -
> -	mkdir -p ${STAGING_INCDIR}/
> -	for i in ${ffi_include}; do
> -		install -m 0644 include/$i ${STAGING_INCDIR}/
> -	done
> -}
> -
> -SRC_URI[md5sum] = "31b459062499f9f68d451db9cbf3205c"
> -SRC_URI[sha256sum] = "5f3685533f8dc4b42b926fe70bb371b31e1368223a0ad7398ba27ea3a20e8e7a"
> diff --git a/recipes/libffi/libffi_2.0+gcc4.3.2.bb b/recipes/libffi/libffi_2.0+gcc4.3.2.bb
> deleted file mode 100644
> index 1694ce4..0000000
> --- a/recipes/libffi/libffi_2.0+gcc4.3.2.bb
> +++ /dev/null
> @@ -1,90 +0,0 @@
> -require ../gcc/gcc-common.inc
> -SECTION = "libs"
> -DESCRIPTION = "Foreign Function Interface library"
> -LICENSE = "libffi"
> -PRIORITY = "optional"
> -
> -inherit autotools gettext
> -
> -PR = "r1"
> -
> -PACKAGES = "${PN}-dbg ${PN} ${PN}-dev"
> -
> -FILES_${PN} = "${libdir}/libffi.so.*"
> -
> -FILES_${PN}-dev = "${includedir}/${TARGET_SYS}/ffi* \
> -		   ${libdir}/libffi.a \
> -		   ${libdir}/libffi.la \
> -		   ${libdir}/libffi.so"
> -
> -GCC_VER = "${@bb.data.getVar('PV',d,1).split('gcc')[1]}"
> -
> -SRC_URI = "${GNU_MIRROR}/gcc/gcc-${GCC_VER}/gcc-${GCC_VER}.tar.bz2 \
> -	   "
> -
> -MIRRORS_prepend () {
> -${GNU_MIRROR}/gcc/	http://gcc.get-software.com/releases/
> -${GNU_MIRROR}/gcc/	http://mirrors.rcn.net/pub/sourceware/gcc/releases/
> -}
> -
> -S = "${WORKDIR}/gcc-${GCC_VER}/libffi"
> -B = "${S}/build.${HOST_SYS}.${TARGET_SYS}"
> -
> -EXTRA_OECONF = "--with-gnu-ld \
> -                --enable-shared \
> -                --enable-target-optspace \
> -                --enable-languages=c,c++,f77 \
> -                --enable-threads=posix \
> -                --enable-multilib \
> -                --enable-c99 \
> -                --enable-long-long \
> -                --enable-symvers=gnu \
> -                --program-prefix=${TARGET_PREFIX} \
> -                ${EXTRA_OECONF_FPU} \
> -                ${EXTRA_OECONF_PATHS}"
> -
> -EXTRA_OECONF_PATHS = "--with-local-prefix=${prefix}/local \
> -                      --with-gxx-include-dir=${includedir}/c++/${PV}"
> -
> -# Build uclibc compilers without cxa_atexit support
> -EXTRA_OECONF_append_linux               = " --enable-__cxa_atexit"
> -EXTRA_OECONF_append_linux-gnueabi       = " --enable-__cxa_atexit"
> -EXTRA_OECONF_append_linux-uclibc        = " --disable-__cxa_atexit"
> -EXTRA_OECONF_append_linux-uclibceabi    = " --disable-__cxa_atexit"
> -EXTRA_OECONF_FPU = "${@get_gcc_fpu_setting(bb, d)}"
> -
> -#Somehow gcc doesn't set __SOFTFP__ when passing -mfloatabi=softp :(
> -TARGET_CC_ARCH_append_armv6 = " -D__SOFTFP__"
> -TARGET_CC_ARCH_append_armv7a = " -D__SOFTFP__"
> -
> -
> -do_configure () {
> -	(cd ${S}/.. && gnu-configize) || die "failure running gnu-configize"
> -	oe_runconf
> -}
> -
> -do_install_append() {
> -	install_libffi_headers
> -}
> -
> -# Separate function which can be disabled in the -native recipe.
> -install_libffi_headers() {
> -	# follow Debian and move this to $includedir/${TARGET_SYS}
> -	install -d ${D}${includedir}/${TARGET_SYS}
> -	mv ${D}${libdir}/gcc/${TARGET_SYS}/${GCC_VER}/include/ffitarget.h ${D}${includedir}/${TARGET_SYS}
> -	mv ${D}${libdir}/gcc/${TARGET_SYS}/${GCC_VER}/include/ffi.h ${D}${includedir}/${TARGET_SYS}
> -}
> -
> -ffi_include = "ffi.h ffitarget.h"
> -
> -do_stage () {
> -	oe_libinstall -so -C .libs libffi ${STAGING_LIBDIR}
> -
> -	mkdir -p ${STAGING_INCDIR}/
> -	for i in ${ffi_include}; do
> -		install -m 0644 include/$i ${STAGING_INCDIR}/
> -	done
> -}
> -
> -SRC_URI[md5sum] = "5dfac5da961ecd5f227c3175859a486d"
> -SRC_URI[sha256sum] = "bfbf487731ad5dca37efe480a837417de071bd67e685d5c1df6a290707575165"
> diff --git a/recipes/libffi/libffi_3.0.8.bb b/recipes/libffi/libffi_3.0.8.bb
> deleted file mode 100644
> index b31d9ee..0000000
> --- a/recipes/libffi/libffi_3.0.8.bb
> +++ /dev/null
> @@ -1,85 +0,0 @@
> -require ../gcc/gcc-common.inc
> -
> -SECTION = "libs"
> -DESCRIPTION = "Foreign Function Interface library"
> -LICENSE = "libffi"
> -PRIORITY = "optional"
> -
> -inherit autotools gettext pkgconfig
> -
> -PR = "r0"
> -
> -S = "${WORKDIR}/${P}"
> -
> -B = "${S}/build.${HOST_SYS}.${TARGET_SYS}"
> -
> -PACKAGES = "${PN}-dbg ${PN} ${PN}-dev ${PN}-doc"
> -
> -FILES_${PN} = "${libdir}/libffi.so.*"
> -
> -FILES_${PN}-dev = "${includedir}/${TARGET_SYS}/ffi* \
> -		   ${libdir}/libffi.a \
> -		   ${libdir}/libffi.la \
> -		   ${libdir}/libffi.so \
> -			 ${libdir}/pkgconfig \
> -"
> -
> -SRC_URI = "ftp://sourceware.org/pub/libffi/${P}.tar.gz \
> -           file://autoconf-2.64.patch"
> -
> -EXTRA_OECONF = "--with-gnu-ld \
> -                --enable-shared \
> -                --enable-target-optspace \
> -                --enable-languages=c,c++,f77 \
> -                --enable-threads=posix \
> -                --enable-multilib \
> -                --enable-c99 \
> -                --enable-long-long \
> -                --enable-symvers=gnu \
> -                --program-prefix=${TARGET_PREFIX} \
> -                ${EXTRA_OECONF_FPU} \
> -                ${EXTRA_OECONF_PATHS}"
> -
> -EXTRA_OECONF_PATHS = "--with-local-prefix=${prefix}/local \
> -                      --with-gxx-include-dir=${includedir}/c++/${PV}"
> -
> -# Build uclibc compilers without cxa_atexit support
> -EXTRA_OECONF_append_linux               = " --enable-__cxa_atexit"
> -EXTRA_OECONF_append_linux-gnueabi       = " --enable-__cxa_atexit"
> -EXTRA_OECONF_append_linux-uclibc        = " --disable-__cxa_atexit"
> -EXTRA_OECONF_append_linux-uclibceabi = " --disable-__cxa_atexit"
> -EXTRA_OECONF_FPU = "${@get_gcc_fpu_setting(bb, d)}"
> -
> -#Somehow gcc doesn't set __SOFTFP__ when passing -mfloatabi=softp :(
> -TARGET_CC_ARCH_append_armv6 = " -D__SOFTFP__"
> -TARGET_CC_ARCH_append_armv7a = " -D__SOFTFP__"
> -
> -do_compile_append() {
> -	sed -i -e"s|\\${libdir}/${P}/include|\\${includedir}/${TARGET_SYS}/|" libffi.pc
> -}
> -
> -do_install_append() {
> -	install_libffi_headers
> -}
> -
> -# Separate function which can be disabled in the -native recipe.
> -install_libffi_headers() {
> -	# follow Debian and move this to $includedir/${TARGET_SYS}
> -	install -d ${D}${includedir}/${TARGET_SYS}
> -	mv ${D}${libdir}/${P}/include/ffitarget.h ${D}${includedir}/${TARGET_SYS}
> -	mv ${D}${libdir}/${P}/include/ffi.h ${D}${includedir}/${TARGET_SYS}
> -}
> -
> -ffi_include = "ffi.h ffitarget.h"
> -
> -do_stage () {
> -	oe_libinstall -so -C .libs libffi ${STAGING_LIBDIR}
> -
> -	mkdir -p ${STAGING_INCDIR}/
> -	for i in ${ffi_include}; do
> -		install -m 0644 include/$i ${STAGING_INCDIR}/
> -	done
> -}
> -
> -SRC_URI[md5sum] = "188a4f79fdac2310044b44b7d3918ef9"
> -SRC_URI[sha256sum] = "2c7c5b88a68fb362262889ba25ef25dc27864b7bbf03547a8a36b8d567569406"
> diff --git a/recipes/libffi/libffi_3.0.9.bb b/recipes/libffi/libffi_3.0.9.bb
> new file mode 100644
> index 0000000..9f7dbc3
> --- /dev/null
> +++ b/recipes/libffi/libffi_3.0.9.bb
> @@ -0,0 +1,15 @@
> +SRC_URI = "ftp://sourceware.org/pub/libffi/${BPN}-${PV}.tar.gz"
> +LICENSE = "MIT"
> +
> +SRC_URI[md5sum] = "1f300a7a7f975d4046f51c3022fa5ff1"
> +SRC_URI[sha256sum] = "589d25152318bc780cd8919b14670793f4971d9838dab46ed38c32b3ee92c452"
> +
> +inherit autotools
> +
> +do_install_append() {
> +	install -d ${D}${includedir}
> +	mv ${D}${libdir}/libffi-${PV}/include/* ${D}${includedir}/ || true
> +}
> +
> +BBCLASSEXTEND = "native"
> +
> -- 
> 1.7.3.2
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


