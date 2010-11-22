Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PKeHD-0005Yp-GM
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Nov 2010 22:50:23 +0100
Received: by iwn7 with SMTP id 7so271185iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Nov 2010 13:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=E9W5A1QBKW5NtXyOvNnud3Oc5F8LN4KFkZp17cboC9o=;
	b=l8ECj50fQkENlJl1d8gnrkGktLnFubkf7zRXp68jwblKzRbjm6HwtSbVTG6G+hNNpK
	XUEakUoY8bYiFRC38Xbm3Fir4wF00uZ1bP2FzUsrTlKFzstBjrbTySVF2YUcgNoSEiuG
	9N9Rd8uYLFbIwsbElKQLZYDvROQ+rSdMuBB4s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=sBhqjSxfDTFaPacOvarY3hsNqX3oVHJP84t/xhW/y8PSQ+I9R5UTsUa4AWl5mDnv2U
	qDUZdkPqEIQBY7yoGohDRVqpR8ZW9S6BSlaiGdvorM3Ajp4eSEb+VmhGhnM9a4nT6O4I
	ADw7xxlAw29OkDX1LJDiP443/skhwoanTTjc8=
MIME-Version: 1.0
Received: by 10.231.35.194 with SMTP id q2mr7374558ibd.26.1290462548360; Mon,
	22 Nov 2010 13:49:08 -0800 (PST)
Received: by 10.231.33.4 with HTTP; Mon, 22 Nov 2010 13:49:08 -0800 (PST)
In-Reply-To: <20101119205302.GA8017@gmail.com>
References: <1290161253-19634-1-git-send-email-dp@xora.org.uk>
	<20101119205302.GA8017@gmail.com>
Date: Mon, 22 Nov 2010 22:49:08 +0100
Message-ID: <AANLkTi=2eYwkdLnjuutWzoa6kRV5X7AUgRNLj6OLBydn@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
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
X-List-Received-Date: Mon, 22 Nov 2010 21:50:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/11/19 Khem Raj <raj.khem@gmail.com>:
> On (19/11/10 10:07), Graeme Gregory wrote:
>> Initially taken from poky with changes required for OE. Poky recipe is m=
uch
>> simpler than the ones we have in OE and it seems we have a lot of histor=
ic that
>> is no longer needed.
>
>
> Sounds nice. May be cp will be better instead of mv in do_install_append =
?
> Acked-by: Khem Raj <raj.khem@gmail.com>

Review gives no issues, builds fine so:
Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>
>> ---
>> =A0recipes/libffi/libffi-2.0+gcc3.4.1/soname.patch | =A0 32 --------
>> =A0recipes/libffi/libffi-native_2.0+gcc4.3.2.bb =A0 =A0| =A0 32 --------
>> =A0recipes/libffi/libffi/autoconf-2.64.patch =A0 =A0 =A0 | =A0 24 ------
>> =A0recipes/libffi/libffi_2.0+gcc3.4.1.bb =A0 =A0 =A0 =A0 =A0 | =A0 68 --=
---------------
>> =A0recipes/libffi/libffi_2.0+gcc4.3.2.bb =A0 =A0 =A0 =A0 =A0 | =A0 90 --=
---------------------
>> =A0recipes/libffi/libffi_3.0.8.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 85 ---------------------
>> =A0recipes/libffi/libffi_3.0.9.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 15 ++++
>> =A07 files changed, 15 insertions(+), 331 deletions(-)
>> =A0delete mode 100644 recipes/libffi/libffi-2.0+gcc3.4.1/soname.patch
>> =A0delete mode 100644 recipes/libffi/libffi-native_2.0+gcc4.3.2.bb
>> =A0delete mode 100644 recipes/libffi/libffi/autoconf-2.64.patch
>> =A0delete mode 100644 recipes/libffi/libffi_2.0+gcc3.4.1.bb
>> =A0delete mode 100644 recipes/libffi/libffi_2.0+gcc4.3.2.bb
>> =A0delete mode 100644 recipes/libffi/libffi_3.0.8.bb
>> =A0create mode 100644 recipes/libffi/libffi_3.0.9.bb
>>
>> diff --git a/recipes/libffi/libffi-2.0+gcc3.4.1/soname.patch b/recipes/l=
ibffi/libffi-2.0+gcc3.4.1/soname.patch
>> deleted file mode 100644
>> index bccf75d..0000000
>> --- a/recipes/libffi/libffi-2.0+gcc3.4.1/soname.patch
>> +++ /dev/null
>> @@ -1,32 +0,0 @@
>> ---- libffi.orig/Makefile.am =A02003-10-21 21:01:53.000000000 +0200
>> -+++ libffi/Makefile.am =A0 =A0 =A0 2004-08-09 13:26:13.000000000 +0200
>> -@@ -175,7 +175,7 @@
>> -
>> - AM_CFLAGS =3D -Wall -g -fexceptions
>> -
>> --libffi_la_LDFLAGS =3D -release $(VERSION)
>> -+libffi_la_LDFLAGS =3D -version-info `grep -v '^\#' $(srcdir)/libtool-v=
ersion`
>> -
>> - INCLUDES =3D -I. -I$(top_srcdir)/include -Iinclude -I$(top_srcdir)/src
>> -
>> ---- libffi.orig/libtool-version =A0 =A0 =A01970-01-01 01:00:00.00000000=
0 +0100
>> -+++ libffi/libtool-version =A0 2004-08-09 13:24:18.000000000 +0200
>> -@@ -0,0 +1,6 @@
>> -+# This file is used to maintain libtool version info for libffi. =A0Se=
e
>> -+# the libtool manual to understand the meaning of the fields. =A0This =
is
>> -+# a separate file so that version updates don't involve re-running
>> -+# automake.
>> -+# CURRENT:REVISION:AGE
>> -+3:0:0
>> -
>> ---- libtool.orig/Makefile.in 2004-08-09 14:29:09.000000000 +0200
>> -+++ libtool/Makefile.in =A0 =A0 =A02004-08-09 14:29:53.000000000 +0200
>> -@@ -226,7 +226,7 @@
>> -
>> - AM_CFLAGS =3D -Wall -g -fexceptions
>> -
>> --libffi_la_LDFLAGS =3D -release $(VERSION)
>> -+libffi_la_LDFLAGS =3D -version-info `grep -v '^\#' $(srcdir)/libtool-v=
ersion`
>> -
>> - INCLUDES =3D -I. -I$(top_srcdir)/include -Iinclude -I$(top_srcdir)/src
>> - ACLOCAL_M4 =3D $(top_srcdir)/aclocal.m4
>> diff --git a/recipes/libffi/libffi-native_2.0+gcc4.3.2.bb b/recipes/libf=
fi/libffi-native_2.0+gcc4.3.2.bb
>> deleted file mode 100644
>> index 4a26199..0000000
>> --- a/recipes/libffi/libffi-native_2.0+gcc4.3.2.bb
>> +++ /dev/null
>> @@ -1,32 +0,0 @@
>> -require libffi_${PV}.bb
>> -
>> -inherit native
>> -
>> -EXTRA_OECONF =3D "--with-gnu-ld \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--enable-shared \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--enable-target-optspace \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--enable-languages=3Dc,c++,f77 \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--enable-threads=3Dposix \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--disable-multilib \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--enable-c99 \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--enable-long-long \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--enable-symvers=3Dgnu \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--program-prefix=3D${TARGET_PREFIX} \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${EXTRA_OECONF_PATHS}"
>> -
>> -ffi_include =3D "ffi.h ffitarget.h"
>> -
>> -install_libffi_headers() {
>> - =A0 =A0 :
>> -}
>> -
>> -do_install () {
>> - =A0 =A0 install -d ${D}${libdir} ${D}${includedir}
>> - =A0 =A0 oe_libinstall -so -C .libs libffi ${D}${libdir}
>> -
>> - =A0 =A0 for i in ${ffi_include}; do
>> - =A0 =A0 =A0 =A0 =A0 =A0 install -m 0644 include/$i ${D}${includedir}/
>> - =A0 =A0 done
>> -}
>> -
>> -NATIVE_INSTALL_WORKS =3D "1"
>> diff --git a/recipes/libffi/libffi/autoconf-2.64.patch b/recipes/libffi/=
libffi/autoconf-2.64.patch
>> deleted file mode 100644
>> index 7e5a41e..0000000
>> --- a/recipes/libffi/libffi/autoconf-2.64.patch
>> +++ /dev/null
>> @@ -1,24 +0,0 @@
>> -From cc8c1160a690a1eafc35e745da5f24e258436bda Mon Sep 17 00:00:00 2001
>> -From: Mike Lundy <mike@fluffypenguin.org>
>> -Date: Fri, 2 Oct 2009 12:28:13 -0700
>> -Subject: [PATCH] fix libffi for autoconf-2.64
>> -
>> ----
>> - libffi-3.0.8/configure.ac | =A0 =A01 +
>> - 1 files changed, 1 insertions(+), 0 deletions(-)
>> -
>> -diff --git libffi-3.0.8/configure.ac libffi-3.0.8/configure.ac
>> -index 6a7e7fb..4c3f190 100644
>> ---- libffi-3.0.8/configure.ac
>> -+++ libffi-3.0.8/configure.ac
>> -@@ -20,6 +20,7 @@ AM_INIT_AUTOMAKE
>> - m4_rename([_AC_ARG_VAR_PRECIOUS],[real_PRECIOUS])
>> - m4_define([_AC_ARG_VAR_PRECIOUS],[])
>> - AC_PROG_CC
>> -+m4_undefine([_AC_ARG_VAR_PRECIOUS])
>> - m4_rename([real_PRECIOUS],[_AC_ARG_VAR_PRECIOUS])
>> -
>> - AC_SUBST(CFLAGS)
>> ---
>> -1.6.4
>> -
>> diff --git a/recipes/libffi/libffi_2.0+gcc3.4.1.bb b/recipes/libffi/libf=
fi_2.0+gcc3.4.1.bb
>> deleted file mode 100644
>> index ceb46b1..0000000
>> --- a/recipes/libffi/libffi_2.0+gcc3.4.1.bb
>> +++ /dev/null
>> @@ -1,68 +0,0 @@
>> -SECTION =3D "libs"
>> -DESCRIPTION =3D "Foreign Function Interface library"
>> -LICENSE =3D "libffi"
>> -PRIORITY =3D "optional"
>> -PR =3D "r1"
>> -
>> -inherit autotools gettext
>> -
>> -PACKAGES =3D "${PN}-dbg ${PN} ${PN}-dev"
>> -
>> -FILES_${PN} =3D "${libdir}/libffi.so.*"
>> -
>> -FILES_${PN}-dev =3D "${includedir}/ffi* \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${libdir}/libffi.a \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${libdir}/libffi.la \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${libdir}/libffi.so"
>> -
>> -GCC_VER =3D "${@bb.data.getVar('PV',d,1).split('gcc')[1]}"
>> -
>> -SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${GCC_VER}/gcc-${GCC_VER}.tar.bz2 \
>> - =A0 =A0 =A0 =A0file://soname.patch"
>> -
>> -MIRRORS_prepend () {
>> -${GNU_MIRROR}/gcc/ =A0 http://gcc.get-software.com/releases/
>> -${GNU_MIRROR}/gcc/ =A0 http://mirrors.rcn.net/pub/sourceware/gcc/releas=
es/
>> -}
>> -
>> -S =3D "${WORKDIR}/gcc-${GCC_VER}/libffi"
>> -B =3D "${S}/build.${HOST_SYS}.${TARGET_SYS}"
>> -
>> -EXTRA_OECONF =3D "--with-gnu-ld \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--enable-shared \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--enable-target-optspace \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--enable-languages=3Dc,c++,f77 \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--enable-threads=3Dposix \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--enable-multilib \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--enable-c99 \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--enable-long-long \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--enable-symvers=3Dgnu \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--program-prefix=3D${TARGET_PREFIX} \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${EXTRA_OECONF_PATHS}"
>> -
>> -EXTRA_OECONF_PATHS =3D "--with-local-prefix=3D${prefix}/local \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--with-gxx-include-dir=3D${=
includedir}/c++/${PV}"
>> -
>> -do_configure () {
>> - =A0 =A0 (cd ${S}/.. && gnu-configize) || die "failure running gnu-conf=
igize"
>> - =A0 =A0 oe_runconf
>> -}
>> -
>> -do_install_append() {
>> - =A0 =A0 # follow debian and move this to $includedir
>> - =A0 =A0 mv ${D}${libdir}/gcc/${TARGET_SYS}/${GCC_VER}/include/libffi/f=
fitarget.h ${D}${includedir}/
>> -}
>> -
>> -ffi_include =3D "ffi.h ffitarget.h"
>> -
>> -do_stage () {
>> - =A0 =A0 oe_libinstall -so -C .libs libffi ${STAGING_LIBDIR}
>> -
>> - =A0 =A0 mkdir -p ${STAGING_INCDIR}/
>> - =A0 =A0 for i in ${ffi_include}; do
>> - =A0 =A0 =A0 =A0 =A0 =A0 install -m 0644 include/$i ${STAGING_INCDIR}/
>> - =A0 =A0 done
>> -}
>> -
>> -SRC_URI[md5sum] =3D "31b459062499f9f68d451db9cbf3205c"
>> -SRC_URI[sha256sum] =3D "5f3685533f8dc4b42b926fe70bb371b31e1368223a0ad73=
98ba27ea3a20e8e7a"
>> diff --git a/recipes/libffi/libffi_2.0+gcc4.3.2.bb b/recipes/libffi/libf=
fi_2.0+gcc4.3.2.bb
>> deleted file mode 100644
>> index 1694ce4..0000000
>> --- a/recipes/libffi/libffi_2.0+gcc4.3.2.bb
>> +++ /dev/null
>> @@ -1,90 +0,0 @@
>> -require ../gcc/gcc-common.inc
>> -SECTION =3D "libs"
>> -DESCRIPTION =3D "Foreign Function Interface library"
>> -LICENSE =3D "libffi"
>> -PRIORITY =3D "optional"
>> -
>> -inherit autotools gettext
>> -
>> -PR =3D "r1"
>> -
>> -PACKAGES =3D "${PN}-dbg ${PN} ${PN}-dev"
>> -
>> -FILES_${PN} =3D "${libdir}/libffi.so.*"
>> -
>> -FILES_${PN}-dev =3D "${includedir}/${TARGET_SYS}/ffi* \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${libdir}/libffi.a \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${libdir}/libffi.la \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${libdir}/libffi.so"
>> -
>> -GCC_VER =3D "${@bb.data.getVar('PV',d,1).split('gcc')[1]}"
>> -
>> -SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${GCC_VER}/gcc-${GCC_VER}.tar.bz2 \
>> - =A0 =A0 =A0 =A0"
>> -
>> -MIRRORS_prepend () {
>> -${GNU_MIRROR}/gcc/ =A0 http://gcc.get-software.com/releases/
>> -${GNU_MIRROR}/gcc/ =A0 http://mirrors.rcn.net/pub/sourceware/gcc/releas=
es/
>> -}
>> -
>> -S =3D "${WORKDIR}/gcc-${GCC_VER}/libffi"
>> -B =3D "${S}/build.${HOST_SYS}.${TARGET_SYS}"
>> -
>> -EXTRA_OECONF =3D "--with-gnu-ld \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--enable-shared \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--enable-target-optspace \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--enable-languages=3Dc,c++,f77 \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--enable-threads=3Dposix \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--enable-multilib \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--enable-c99 \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--enable-long-long \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--enable-symvers=3Dgnu \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--program-prefix=3D${TARGET_PREFIX} \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${EXTRA_OECONF_FPU} \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${EXTRA_OECONF_PATHS}"
>> -
>> -EXTRA_OECONF_PATHS =3D "--with-local-prefix=3D${prefix}/local \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--with-gxx-include-dir=3D${=
includedir}/c++/${PV}"
>> -
>> -# Build uclibc compilers without cxa_atexit support
>> -EXTRA_OECONF_append_linux =A0 =A0 =A0 =A0 =A0 =A0 =A0 =3D " --enable-__=
cxa_atexit"
>> -EXTRA_OECONF_append_linux-gnueabi =A0 =A0 =A0 =3D " --enable-__cxa_atex=
it"
>> -EXTRA_OECONF_append_linux-uclibc =A0 =A0 =A0 =A0=3D " --disable-__cxa_a=
texit"
>> -EXTRA_OECONF_append_linux-uclibceabi =A0 =A0=3D " --disable-__cxa_atexi=
t"
>> -EXTRA_OECONF_FPU =3D "${@get_gcc_fpu_setting(bb, d)}"
>> -
>> -#Somehow gcc doesn't set __SOFTFP__ when passing -mfloatabi=3Dsoftp :(
>> -TARGET_CC_ARCH_append_armv6 =3D " -D__SOFTFP__"
>> -TARGET_CC_ARCH_append_armv7a =3D " -D__SOFTFP__"
>> -
>> -
>> -do_configure () {
>> - =A0 =A0 (cd ${S}/.. && gnu-configize) || die "failure running gnu-conf=
igize"
>> - =A0 =A0 oe_runconf
>> -}
>> -
>> -do_install_append() {
>> - =A0 =A0 install_libffi_headers
>> -}
>> -
>> -# Separate function which can be disabled in the -native recipe.
>> -install_libffi_headers() {
>> - =A0 =A0 # follow Debian and move this to $includedir/${TARGET_SYS}
>> - =A0 =A0 install -d ${D}${includedir}/${TARGET_SYS}
>> - =A0 =A0 mv ${D}${libdir}/gcc/${TARGET_SYS}/${GCC_VER}/include/ffitarge=
t.h ${D}${includedir}/${TARGET_SYS}
>> - =A0 =A0 mv ${D}${libdir}/gcc/${TARGET_SYS}/${GCC_VER}/include/ffi.h ${=
D}${includedir}/${TARGET_SYS}
>> -}
>> -
>> -ffi_include =3D "ffi.h ffitarget.h"
>> -
>> -do_stage () {
>> - =A0 =A0 oe_libinstall -so -C .libs libffi ${STAGING_LIBDIR}
>> -
>> - =A0 =A0 mkdir -p ${STAGING_INCDIR}/
>> - =A0 =A0 for i in ${ffi_include}; do
>> - =A0 =A0 =A0 =A0 =A0 =A0 install -m 0644 include/$i ${STAGING_INCDIR}/
>> - =A0 =A0 done
>> -}
>> -
>> -SRC_URI[md5sum] =3D "5dfac5da961ecd5f227c3175859a486d"
>> -SRC_URI[sha256sum] =3D "bfbf487731ad5dca37efe480a837417de071bd67e685d5c=
1df6a290707575165"
>> diff --git a/recipes/libffi/libffi_3.0.8.bb b/recipes/libffi/libffi_3.0.=
8.bb
>> deleted file mode 100644
>> index b31d9ee..0000000
>> --- a/recipes/libffi/libffi_3.0.8.bb
>> +++ /dev/null
>> @@ -1,85 +0,0 @@
>> -require ../gcc/gcc-common.inc
>> -
>> -SECTION =3D "libs"
>> -DESCRIPTION =3D "Foreign Function Interface library"
>> -LICENSE =3D "libffi"
>> -PRIORITY =3D "optional"
>> -
>> -inherit autotools gettext pkgconfig
>> -
>> -PR =3D "r0"
>> -
>> -S =3D "${WORKDIR}/${P}"
>> -
>> -B =3D "${S}/build.${HOST_SYS}.${TARGET_SYS}"
>> -
>> -PACKAGES =3D "${PN}-dbg ${PN} ${PN}-dev ${PN}-doc"
>> -
>> -FILES_${PN} =3D "${libdir}/libffi.so.*"
>> -
>> -FILES_${PN}-dev =3D "${includedir}/${TARGET_SYS}/ffi* \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${libdir}/libffi.a \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${libdir}/libffi.la \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${libdir}/libffi.so \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${libdir}/pkgconfig \
>> -"
>> -
>> -SRC_URI =3D "ftp://sourceware.org/pub/libffi/${P}.tar.gz \
>> - =A0 =A0 =A0 =A0 =A0 file://autoconf-2.64.patch"
>> -
>> -EXTRA_OECONF =3D "--with-gnu-ld \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--enable-shared \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--enable-target-optspace \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--enable-languages=3Dc,c++,f77 \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--enable-threads=3Dposix \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--enable-multilib \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--enable-c99 \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--enable-long-long \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--enable-symvers=3Dgnu \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--program-prefix=3D${TARGET_PREFIX} \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${EXTRA_OECONF_FPU} \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${EXTRA_OECONF_PATHS}"
>> -
>> -EXTRA_OECONF_PATHS =3D "--with-local-prefix=3D${prefix}/local \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--with-gxx-include-dir=3D${=
includedir}/c++/${PV}"
>> -
>> -# Build uclibc compilers without cxa_atexit support
>> -EXTRA_OECONF_append_linux =A0 =A0 =A0 =A0 =A0 =A0 =A0 =3D " --enable-__=
cxa_atexit"
>> -EXTRA_OECONF_append_linux-gnueabi =A0 =A0 =A0 =3D " --enable-__cxa_atex=
it"
>> -EXTRA_OECONF_append_linux-uclibc =A0 =A0 =A0 =A0=3D " --disable-__cxa_a=
texit"
>> -EXTRA_OECONF_append_linux-uclibceabi =3D " --disable-__cxa_atexit"
>> -EXTRA_OECONF_FPU =3D "${@get_gcc_fpu_setting(bb, d)}"
>> -
>> -#Somehow gcc doesn't set __SOFTFP__ when passing -mfloatabi=3Dsoftp :(
>> -TARGET_CC_ARCH_append_armv6 =3D " -D__SOFTFP__"
>> -TARGET_CC_ARCH_append_armv7a =3D " -D__SOFTFP__"
>> -
>> -do_compile_append() {
>> - =A0 =A0 sed -i -e"s|\\${libdir}/${P}/include|\\${includedir}/${TARGET_=
SYS}/|" libffi.pc
>> -}
>> -
>> -do_install_append() {
>> - =A0 =A0 install_libffi_headers
>> -}
>> -
>> -# Separate function which can be disabled in the -native recipe.
>> -install_libffi_headers() {
>> - =A0 =A0 # follow Debian and move this to $includedir/${TARGET_SYS}
>> - =A0 =A0 install -d ${D}${includedir}/${TARGET_SYS}
>> - =A0 =A0 mv ${D}${libdir}/${P}/include/ffitarget.h ${D}${includedir}/${=
TARGET_SYS}
>> - =A0 =A0 mv ${D}${libdir}/${P}/include/ffi.h ${D}${includedir}/${TARGET=
_SYS}
>> -}
>> -
>> -ffi_include =3D "ffi.h ffitarget.h"
>> -
>> -do_stage () {
>> - =A0 =A0 oe_libinstall -so -C .libs libffi ${STAGING_LIBDIR}
>> -
>> - =A0 =A0 mkdir -p ${STAGING_INCDIR}/
>> - =A0 =A0 for i in ${ffi_include}; do
>> - =A0 =A0 =A0 =A0 =A0 =A0 install -m 0644 include/$i ${STAGING_INCDIR}/
>> - =A0 =A0 done
>> -}
>> -
>> -SRC_URI[md5sum] =3D "188a4f79fdac2310044b44b7d3918ef9"
>> -SRC_URI[sha256sum] =3D "2c7c5b88a68fb362262889ba25ef25dc27864b7bbf03547=
a8a36b8d567569406"
>> diff --git a/recipes/libffi/libffi_3.0.9.bb b/recipes/libffi/libffi_3.0.=
9.bb
>> new file mode 100644
>> index 0000000..9f7dbc3
>> --- /dev/null
>> +++ b/recipes/libffi/libffi_3.0.9.bb
>> @@ -0,0 +1,15 @@
>> +SRC_URI =3D "ftp://sourceware.org/pub/libffi/${BPN}-${PV}.tar.gz"
>> +LICENSE =3D "MIT"
>> +
>> +SRC_URI[md5sum] =3D "1f300a7a7f975d4046f51c3022fa5ff1"
>> +SRC_URI[sha256sum] =3D "589d25152318bc780cd8919b14670793f4971d9838dab46=
ed38c32b3ee92c452"
>> +
>> +inherit autotools
>> +
>> +do_install_append() {
>> + =A0 =A0 install -d ${D}${includedir}
>> + =A0 =A0 mv ${D}${libdir}/libffi-${PV}/include/* ${D}${includedir}/ || =
true
>> +}
>> +
>> +BBCLASSEXTEND =3D "native"
>> +
>> --
>> 1.7.3.2
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


