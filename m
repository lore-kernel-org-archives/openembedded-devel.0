Received: from mail-px0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QQrfX-0008C0-Pa
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 May 2011 03:53:24 +0200
Received: by pxj25 with SMTP id 25so979381pxj.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 May 2011 18:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:subject:from:to:in-reply-to:references
	:content-type:date:message-id:mime-version:x-mailer
	:content-transfer-encoding;
	bh=AWjijExXTNN66PjWUqlTDTP/6tF9uDdYQEOqgPzQs40=;
	b=Do1LrPTMKHg/5e830+CrEDuc4mn2ngbuoePlT0lQ0VNlmJeLYqYjvsQkDR6nvmpopd
	m7YIJ2LvOUXLWSanos9UTn9X1aiAuDCTvHjhj0+110gwXt7QszIf49FgISdhQhwA6q3f
	d/NL25T+eImgYLdUyyPQa8nugnaCsA2dZhbLc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=subject:from:to:in-reply-to:references:content-type:date:message-id
	:mime-version:x-mailer:content-transfer-encoding;
	b=E58bSYvPeQn3L2ViZCs12ExgfAG6MiR5GhcaSN9gWOvvqyhSaiYpefqXJJQlQtw39x
	oy+it1r6GjC8wcxHWpT6SBHIkMR4M8NXFB+9N5Sn9TD0DYYPb8y35x/Tm3muGGRC+tyb
	HZMR4rr/Rb399wO6rz+n7Nyo69BoQRlVsMwxQ=
Received: by 10.68.50.163 with SMTP id d3mr1585000pbo.446.1306720215239;
	Sun, 29 May 2011 18:50:15 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id w5sm2439194pbh.45.2011.05.29.18.50.13
	(version=SSLv3 cipher=OTHER); Sun, 29 May 2011 18:50:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <d2ba873c63d3ab95c7b9cef09006f1e0d4da6351.1306706130.git.Martin.Jansa@gmail.com>
References: <355a220b55867ef7a2fd485fbc1fcb76c06ef5d1.1306706130.git.Martin.Jansa@gmail.com>
	<d2ba873c63d3ab95c7b9cef09006f1e0d4da6351.1306706130.git.Martin.Jansa@gmail.com>
Date: Sun, 29 May 2011 18:50:10 -0700
Message-ID: <1306720210.5979.2.camel@perseus>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [meta-oe][PATCH 08/14] ltrace: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
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
X-List-Received-Date: Mon, 30 May 2011 01:53:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-05-29 at 23:56 +0200, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

ltrace belongs to recipes-devtools IMO

> ---
>  .../recipes-support/ltrace/files/add-sysdep.patch  |   13 +++
>  .../ltrace/files/ltrace-compile.patch              |   80 +++++++++++++++++++
>  .../files/ltrace-fix-sysdep_h-dependency.patch     |   33 ++++++++
>  .../ltrace/files/ltrace-mips-remove-CP.patch       |   12 +++
>  .../recipes-support/ltrace/files/ltrace-mips.patch |   36 +++++++++
>  .../recipes-support/ltrace/files/ltrace-ppc.patch  |   11 +++
>  meta-oe/recipes-support/ltrace/ltrace_0.5.3.bb     |   81 ++++++++++++++++++++
>  7 files changed, 266 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-support/ltrace/files/add-sysdep.patch
>  create mode 100644 meta-oe/recipes-support/ltrace/files/ltrace-compile.patch
>  create mode 100644 meta-oe/recipes-support/ltrace/files/ltrace-fix-sysdep_h-dependency.patch
>  create mode 100644 meta-oe/recipes-support/ltrace/files/ltrace-mips-remove-CP.patch
>  create mode 100644 meta-oe/recipes-support/ltrace/files/ltrace-mips.patch
>  create mode 100644 meta-oe/recipes-support/ltrace/files/ltrace-ppc.patch
>  create mode 100644 meta-oe/recipes-support/ltrace/ltrace_0.5.3.bb
> 
> diff --git a/meta-oe/recipes-support/ltrace/files/add-sysdep.patch b/meta-oe/recipes-support/ltrace/files/add-sysdep.patch
> new file mode 100644
> index 0000000..1d0432f
> --- /dev/null
> +++ b/meta-oe/recipes-support/ltrace/files/add-sysdep.patch
> @@ -0,0 +1,13 @@
> +Index: ltrace-0.5.3/Makefile.in
> +===================================================================
> +--- ltrace-0.5.3.orig/Makefile.in	2009-10-23 22:06:08.130304691 -0700
> ++++ ltrace-0.5.3/Makefile.in	2009-10-23 22:06:53.160369614 -0700
> +@@ -39,6 +39,8 @@ ltrace:		main.o libltrace.a
> + libltrace.a: 	sysdeps/sysdep.o $(OBJ)
> + 		$(AR) rcv $@ $^
> + 
> ++$(OBJ):		sysdeps/sysdep.o
> ++
> + sysdeps/sysdep.o: dummy
> + 		$(MAKE) -C sysdeps/$(OS)
> + 
> diff --git a/meta-oe/recipes-support/ltrace/files/ltrace-compile.patch b/meta-oe/recipes-support/ltrace/files/ltrace-compile.patch
> new file mode 100644
> index 0000000..4784deb
> --- /dev/null
> +++ b/meta-oe/recipes-support/ltrace/files/ltrace-compile.patch
> @@ -0,0 +1,80 @@
> +Index: ltrace-0.5.3/common.h
> +===================================================================
> +--- ltrace-0.5.3.orig/common.h	2009-10-23 23:13:45.700282578 -0700
> ++++ ltrace-0.5.3/common.h	2009-10-23 23:14:13.550371553 -0700
> +@@ -1,3 +1,5 @@
> ++#ifndef COMMON_H
> ++#define COMMON_H
> + #include <sys/types.h>
> + #include <sys/time.h>
> + #include <stdio.h>
> +@@ -251,3 +253,5 @@ extern void * sym2addr(Process *, struct
> + #if 0				/* not yet */
> + extern int umoven(Process * proc, void * addr, int len, void * laddr);
> + #endif
> ++#endif
> ++
> +Index: ltrace-0.5.3/configure
> +===================================================================
> +--- ltrace-0.5.3.orig/configure	2009-10-23 23:13:45.630316494 -0700
> ++++ ltrace-0.5.3/configure	2009-10-23 23:13:59.672869527 -0700
> +@@ -30,7 +30,7 @@ int main () {
> +   return cplus_demangle();
> + }
> + EOF
> +-if gcc conftest.c -liberty 2>/dev/null
> ++if $CC conftest.c -liberty 2>/dev/null
> + then
> +   HAVE_LIBIBERTY=1
> +   echo "yes"
> +@@ -48,7 +48,7 @@ int main () {
> +   return __cxa_demangle();
> + }
> + EOF
> +-if gcc conftest.c -lsupc++ 2>/dev/null
> ++if $CC conftest.c -lsupc++ 2>/dev/null
> + then
> +   HAVE_LIBSUPC__=1
> +   echo "yes"
> +@@ -67,7 +67,7 @@ int main () {
> +   return 0;
> + }
> + EOF
> +-if gcc conftest.c 2>/dev/null
> ++if $CC conftest.c 2>/dev/null
> + then
> +   HAVE_ELF_C_READ_MMAP=1
> +   echo "yes"
> +@@ -77,15 +77,12 @@ else
> + fi
> + rm -f conftest.c a.out
> + 
> +-CC=gcc
> +-CPPFLAGS=' -I /usr/include/libelf'
> + CFLAGS='-g -O2'
> + LIBS='-lelf -lsupc++ -liberty '
> +-INSTALL='/usr/bin/install -c'
> ++INSTALL='install -c'
> + iquote='-iquote '
> + iquoteend=''
> + 
> +-prefix=/usr/local
> + sysconfdir='${prefix}/etc'
> + bindir='${prefix}/bin'
> + mandir='${prefix}/share/man'
> +Index: ltrace-0.5.3/debug.h
> +===================================================================
> +--- ltrace-0.5.3.orig/debug.h	2009-10-23 23:13:45.670276809 -0700
> ++++ ltrace-0.5.3/debug.h	2009-10-23 23:14:26.440319785 -0700
> +@@ -1,3 +1,5 @@
> ++#ifndef DEBUG_H
> ++#define DEBUG_H
> + #include <features.h>
> + 
> + /* debug levels:
> +@@ -14,4 +16,4 @@ void debug_(int level, const char *file,
> + int xinfdump(long, void *, int);
> + 
> + # define debug(level, expr...) debug_(level, __FILE__, __LINE__, expr)
> +-
> ++#endif
> diff --git a/meta-oe/recipes-support/ltrace/files/ltrace-fix-sysdep_h-dependency.patch b/meta-oe/recipes-support/ltrace/files/ltrace-fix-sysdep_h-dependency.patch
> new file mode 100644
> index 0000000..b9e5f7f
> --- /dev/null
> +++ b/meta-oe/recipes-support/ltrace/files/ltrace-fix-sysdep_h-dependency.patch
> @@ -0,0 +1,33 @@
> +Index: ltrace-0.5.3/sysdeps/linux-gnu/Makefile
> +===================================================================
> +--- ltrace-0.5.3.orig/sysdeps/linux-gnu/Makefile
> ++++ ltrace-0.5.3/sysdeps/linux-gnu/Makefile
> +@@ -12,7 +12,10 @@ CPPFLAGS	+=	-I$(TOPDIR)/sysdeps/linux-gn
> + 
> + OBJ		=	events.o trace.o proc.o breakpoint.o
> + 
> +-all:		sysdep.h signalent.h syscallent.h arch_syscallent.h signalent1.h syscallent1.h ../sysdep.o
> ++HDRS		=	sysdep.h signalent.h syscallent.h arch_syscallent.h \
> ++			signalent1.h syscallent1.h
> ++
> ++all:		../sysdep.o
> + 
> + sysdep.h:	$(ARCH)/arch.h
> + 		cat $(ARCH)/arch.h > sysdep.h
> +@@ -49,12 +52,14 @@ arch_syscallent.h:
> + os.o:		$(OBJ)
> + 		$(CC) -nostdlib -r -o os.o $(OBJ)
> + 
> ++$(OBJ):		$(HDRS)
> ++
> + $(ARCH)/arch.o:	dummy
> + 		$(MAKE) -C $(ARCH)
> + 
> + clean:
> + 		$(MAKE) -C $(ARCH) clean
> +-		rm -f $(OBJ) sysdep.h signalent.h signalent1.h syscallent.h arch_syscallent.h
> +-		rm -f syscallent1.h os.o sysdep.o ../sysdep.o
> ++		rm -f $(HDRS)
> ++		rm -f $(OBJ) os.o sysdep.o ../sysdep.o
> + 
> + dummy:
> diff --git a/meta-oe/recipes-support/ltrace/files/ltrace-mips-remove-CP.patch b/meta-oe/recipes-support/ltrace/files/ltrace-mips-remove-CP.patch
> new file mode 100644
> index 0000000..2af193d
> --- /dev/null
> +++ b/meta-oe/recipes-support/ltrace/files/ltrace-mips-remove-CP.patch
> @@ -0,0 +1,12 @@
> +Index: ltrace-0.5.3/sysdeps/linux-gnu/mipsel/trace.c
> +===================================================================
> +--- ltrace-0.5.3.orig/sysdeps/linux-gnu/mipsel/trace.c	2009-10-23 23:15:59.822783128 -0700
> ++++ ltrace-0.5.3/sysdeps/linux-gnu/mipsel/trace.c	2009-10-23 23:16:10.441268788 -0700
> +@@ -127,7 +127,6 @@ gimme_arg(enum tof type, Process *proc, 
> + 			return ret;
> + 		} else {
> + 			// If we need this, I think we can look at [sp+16] for arg_num==4.
> +-			CP;
> + 			return 0;
> + 		}
> + 	}
> diff --git a/meta-oe/recipes-support/ltrace/files/ltrace-mips.patch b/meta-oe/recipes-support/ltrace/files/ltrace-mips.patch
> new file mode 100644
> index 0000000..6df5e21
> --- /dev/null
> +++ b/meta-oe/recipes-support/ltrace/files/ltrace-mips.patch
> @@ -0,0 +1,36 @@
> +Index: ltrace-0.5.3/sysdeps/linux-gnu/mipsel/plt.c
> +===================================================================
> +--- ltrace-0.5.3.orig/sysdeps/linux-gnu/mipsel/plt.c	2009-10-23 23:25:59.292780574 -0700
> ++++ ltrace-0.5.3/sysdeps/linux-gnu/mipsel/plt.c	2009-10-23 23:26:22.671522220 -0700
> +@@ -1,4 +1,4 @@
> +-#include <debug.h>
> ++#include "debug.h"
> + #include <gelf.h>
> + #include <sys/ptrace.h>
> + #include "common.h"
> +Index: ltrace-0.5.3/sysdeps/linux-gnu/mipsel/regs.c
> +===================================================================
> +--- ltrace-0.5.3.orig/sysdeps/linux-gnu/mipsel/regs.c	2009-10-23 23:25:59.312777529 -0700
> ++++ ltrace-0.5.3/sysdeps/linux-gnu/mipsel/regs.c	2009-10-23 23:26:08.190311896 -0700
> +@@ -4,7 +4,6 @@
> + #include <sys/types.h>
> + #include <sys/ptrace.h>
> + #include <asm/ptrace.h>
> +-#include <linux/user.h>
> + 
> + #include "common.h"
> + #include "mipsel.h"
> +Index: ltrace-0.5.3/handle_event.c
> +===================================================================
> +--- ltrace-0.5.3.orig/handle_event.c	2009-10-23 23:29:48.780274445 -0700
> ++++ ltrace-0.5.3/handle_event.c	2009-10-23 23:37:32.260284055 -0700
> +@@ -573,7 +573,8 @@ handle_breakpoint(Event *event) {
> + 			void *old_addr;
> + 			struct library_symbol *sym= event->proc->callstack[i].c_un.libfunc;
> + 			assert(sym);
> +-			old_addr = dict_find_entry(event->proc->breakpoints, sym2addr(event->proc, sym))->addr;
> ++			struct Breakpoint *tbp = dict_find_entry(event->proc->breakpoints, sym2addr(event->proc, sym));
> ++			old_addr = tbp->addr;
> + 			addr=sym2addr(event->proc,sym);
> + 			assert(old_addr !=0 && addr !=0);
> + 			if(addr != old_addr){
> diff --git a/meta-oe/recipes-support/ltrace/files/ltrace-ppc.patch b/meta-oe/recipes-support/ltrace/files/ltrace-ppc.patch
> new file mode 100644
> index 0000000..d5ea0f0
> --- /dev/null
> +++ b/meta-oe/recipes-support/ltrace/files/ltrace-ppc.patch
> @@ -0,0 +1,11 @@
> +Index: ltrace-0.5.3/sysdeps/linux-gnu/ppc/plt.c
> +===================================================================
> +--- ltrace-0.5.3.orig/sysdeps/linux-gnu/ppc/plt.c	2009-11-15 03:46:14.459233772 +0300
> ++++ ltrace-0.5.3/sysdeps/linux-gnu/ppc/plt.c	2009-11-15 03:46:25.299232646 +0300
> +@@ -1,5 +1,6 @@
> + #include <gelf.h>
> + #include "common.h"
> ++#include "ptrace.h"
> + 
> + GElf_Addr
> + arch_plt_sym_val(struct ltelf *lte, size_t ndx, GElf_Rela * rela) {
> diff --git a/meta-oe/recipes-support/ltrace/ltrace_0.5.3.bb b/meta-oe/recipes-support/ltrace/ltrace_0.5.3.bb
> new file mode 100644
> index 0000000..b2f5574
> --- /dev/null
> +++ b/meta-oe/recipes-support/ltrace/ltrace_0.5.3.bb
> @@ -0,0 +1,81 @@
> +DESCRIPTION = "ltrace shows runtime library call information for dynamically linked executables."
> +HOMEPAGE = "http://ltrace.alioth.debian.org"
> +SECTION = "devel"
> +DEPENDS = "libelf binutils"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
> +
> +PR = "r3"
> +
> +# ltrace is not ported to sh3/sh4 targets at this time
> +COMPATIBLE_TARGET_SYS = (?!sh[34])
> +
> +SRC_URI = "\
> +  ${DEBIAN_MIRROR}/main/l/ltrace/ltrace_${PV}.orig.tar.gz;name=archive \
> +  ${DEBIAN_MIRROR}/main/l/ltrace/ltrace_${PV}-2.diff.gz;name=patch \
> +  file://add-sysdep.patch \
> +  file://ltrace-compile.patch \
> +  file://ltrace-mips-remove-CP.patch \
> +  file://ltrace-mips.patch \
> +  file://ltrace-ppc.patch \
> +  file://ltrace-fix-sysdep_h-dependency.patch \
> +"
> +inherit autotools
> +
> +export TARGET_CFLAGS = "${SELECTED_OPTIMIZATION} -isystem ${STAGING_INCDIR}"
> +TARGET_CC_ARCH += "${LDFLAGS}"
> +
> +do_configure_prepend() {
> +	case ${TARGET_ARCH} in
> +		arm*)  ln -sf ./linux-gnu sysdeps/linux-gnueabi ;;
> +		mips*)  ln -sf ./mipsel sysdeps/linux-gnu/mips ;;
> +	esac
> +	sed -e 's:uname -m:echo @HOST_CPU@:' \
> +		sysdeps/linux-gnu/Makefile > sysdeps/linux-gnu/Makefile.in
> +
> +}
> +
> +do_compile() {
> +	case ${TARGET_ARCH} in
> +		alpha*)   LTRACE_ARCH=alpha ;;
> +		arm*)     LTRACE_ARCH=arm ;;
> +		cris*)    LTRACE_ARCH=cris ;;
> +		hppa*)    LTRACE_ARCH=parisc ;;
> +		i*86*)    LTRACE_ARCH=i386 ;;
> +		ia64*)    LTRACE_ARCH=ia64 ;;
> +		mips*)    LTRACE_ARCH=mips ;;
> +		m68k*)    LTRACE_ARCH=m68k ;;
> +		powerpc*) LTRACE_ARCH=ppc ;;
> +		s390*)    LTRACE_ARCH=s390 ;;
> +		sh*)      LTRACE_ARCH=sh ;;
> +		sparc64*) LTRACE_ARCH=sparc64 ;;
> +		sparc*)   LTRACE_ARCH=sparc ;;
> +		x86_64*)  LTRACE_ARCH=x86_64 ;;
> +	esac
> +	oe_runmake LDFLAGS=${TARGET_LDFLAGS} LIBS="-lsupc++ -liberty -Wl,-Bstatic -lelf -Wl,-Bdynamic" ${EXTRA_OEMAKE} ARCH=${LTRACE_ARCH}
> +}
> +
> +do_install() {
> +	case ${TARGET_ARCH} in
> +		alpha*)   LTRACE_ARCH=alpha ;;
> +		arm*)     LTRACE_ARCH=arm ;;
> +		cris*)    LTRACE_ARCH=cris ;;
> +		hppa*)    LTRACE_ARCH=parisc ;;
> +		i*86*)    LTRACE_ARCH=i386 ;;
> +		ia64*)    LTRACE_ARCH=ia64 ;;
> +		mips*)    LTRACE_ARCH=mips ;;
> +		m68k*)    LTRACE_ARCH=m68k ;;
> +		powerpc*) LTRACE_ARCH=ppc ;;
> +		s390*)    LTRACE_ARCH=s390 ;;
> +		sh*)      LTRACE_ARCH=sh ;;
> +		sparc64*) LTRACE_ARCH=sparc64 ;;
> +		sparc*)   LTRACE_ARCH=sparc ;;
> +		x86_64*)  LTRACE_ARCH=x86_64 ;;
> +	esac
> +	oe_runmake install ${EXTRA_OEMAKE} ARCH=${LTRACE_ARCH} DESTDIR=${D}
> +}
> +
> +SRC_URI[archive.md5sum] = "3fa7fe715ab879db08bd06d1d59fd90f"
> +SRC_URI[archive.sha256sum] = "5c6627d6d5a98a92ca4661cfc16378b182cc46a9ec479ebf7e6121ee3fe2be32"
> +SRC_URI[patch.md5sum] = "969baa0900646c0262b2d505b9fef154"
> +SRC_URI[patch.sha256sum] = "f647d7c2f2b0d1dbddd632f3a17fef670aed3ebf5fbe6c1633337acac1eba8e3"





