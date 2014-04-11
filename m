Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 0412D65DDE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Apr 2014 16:58:59 +0000 (UTC)
Received: by mail-ig0-f169.google.com with SMTP id h18so2263945igc.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Apr 2014 09:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=l412WuwDO+MQ6sHfZzOgjFJnmGNSEH86jgwIjcxHHao=;
	b=aiRZvJeBKNNFTGlxJ4vAndtopIyoD5RwvXf8HuPp2NQW7hXBNVCgFhDAhZ6h5v6jBE
	0TyM5c09z4nDloxEJ8kDuwV2Maxs+FRPLAELWy5viOjsRYfWrHdgdOP7Udw7OgJZkSl6
	JyxJ2zdlStqIAcmbEKNDVDPbi1KYcgodGDvnvAybSWh1yZUI1ZReRBDidL7Twe9NZPVO
	ldljPqlZUs5zKE7mOk9wJgtNykTCh0cZ/29qSg8rFXQM93HIDbprCPGvWWbFsoH6qsAU
	u2MFvRDj7xpmGqXj1SPr/y8SYNq5xN0DoHMQjrPB9+hJ3D4oVRUxZvqmRBji3XLdToMm
	eDkQ==
MIME-Version: 1.0
X-Received: by 10.50.143.76 with SMTP id sc12mr5239142igb.2.1397235539945;
	Fri, 11 Apr 2014 09:58:59 -0700 (PDT)
Received: by 10.50.229.14 with HTTP; Fri, 11 Apr 2014 09:58:59 -0700 (PDT)
In-Reply-To: <1397207685-2414-1-git-send-email-Chong.Lu@windriver.com>
References: <1397207685-2414-1-git-send-email-Chong.Lu@windriver.com>
Date: Fri, 11 Apr 2014 09:58:59 -0700
Message-ID: <CAMKF1so0kmc6u5rCh_h=T646V8g8F4yahbw5-QUVhYCLPS5dew@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH] ltrace: update to version 0.7.90
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Apr 2014 16:59:02 -0000
Content-Type: text/plain; charset=UTF-8

On Thursday, April 10, 2014, Chong Lu <Chong.Lu@windriver.com> wrote:

> Upgrade ltrace to 0.7.90.
>
> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> ---
>  .../recipes-devtools/ltrace/files/add-sysdep.patch |   13 ----
>  .../ltrace/files/ltrace-compile.patch              |   80
> -------------------
>  .../files/ltrace-fix-sysdep_h-dependency.patch     |   33 --------
>  .../ltrace/files/ltrace-mips-remove-CP.patch       |   12 ---
>  .../ltrace/files/ltrace-mips.patch                 |   36 ---------
>  .../recipes-devtools/ltrace/files/ltrace-ppc.patch |   11 ---
>  .../ltrace-git/ltrace-0.7.2-unused-typedef.patch   |   49 ++++++++++++
>  meta-oe/recipes-devtools/ltrace/ltrace_0.5.3.bb    |   81
> --------------------
>  meta-oe/recipes-devtools/ltrace/ltrace_git.bb      |   25 ++++++
>  9 files changed, 74 insertions(+), 266 deletions(-)
>  delete mode 100644 meta-oe/recipes-devtools/ltrace/files/add-sysdep.patch
>  delete mode 100644
> meta-oe/recipes-devtools/ltrace/files/ltrace-compile.patch
>  delete mode 100644
> meta-oe/recipes-devtools/ltrace/files/ltrace-fix-sysdep_h-dependency.patch
>  delete mode 100644
> meta-oe/recipes-devtools/ltrace/files/ltrace-mips-remove-CP.patch
>  delete mode 100644 meta-oe/recipes-devtools/ltrace/files/ltrace-mips.patch
>  delete mode 100644 meta-oe/recipes-devtools/ltrace/files/ltrace-ppc.patch
>  create mode 100644
> meta-oe/recipes-devtools/ltrace/ltrace-git/ltrace-0.7.2-unused-typedef.patch
>  delete mode 100644 meta-oe/recipes-devtools/ltrace/ltrace_0.5.3.bb
>  create mode 100644 meta-oe/recipes-devtools/ltrace/ltrace_git.bb
>
>
Please mention details in commit message about patches removed and added as
well as what kind of testing was done


> diff --git a/meta-oe/recipes-devtools/ltrace/files/add-sysdep.patch
> b/meta-oe/recipes-devtools/ltrace/files/add-sysdep.patch
> deleted file mode 100644
> index 1d0432f..0000000
> --- a/meta-oe/recipes-devtools/ltrace/files/add-sysdep.patch
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -Index: ltrace-0.5.3/Makefile.in
> -===================================================================
> ---- ltrace-0.5.3.orig/Makefile.in      2009-10-23 22:06:08.130304691 -0700
> -+++ ltrace-0.5.3/Makefile.in   2009-10-23 22:06:53.160369614 -0700
> -@@ -39,6 +39,8 @@ ltrace:              main.o libltrace.a
> - libltrace.a:  sysdeps/sysdep.o $(OBJ)
> -               $(AR) rcv $@ $^
> -
> -+$(OBJ):               sysdeps/sysdep.o
> -+
> - sysdeps/sysdep.o: dummy
> -               $(MAKE) -C sysdeps/$(OS)
> -
> diff --git a/meta-oe/recipes-devtools/ltrace/files/ltrace-compile.patch
> b/meta-oe/recipes-devtools/ltrace/files/ltrace-compile.patch
> deleted file mode 100644
> index 4784deb..0000000
> --- a/meta-oe/recipes-devtools/ltrace/files/ltrace-compile.patch
> +++ /dev/null
> @@ -1,80 +0,0 @@
> -Index: ltrace-0.5.3/common.h
> -===================================================================
> ---- ltrace-0.5.3.orig/common.h 2009-10-23 23:13:45.700282578 -0700
> -+++ ltrace-0.5.3/common.h      2009-10-23 23:14:13.550371553 -0700
> -@@ -1,3 +1,5 @@
> -+#ifndef COMMON_H
> -+#define COMMON_H
> - #include <sys/types.h>
> - #include <sys/time.h>
> - #include <stdio.h>
> -@@ -251,3 +253,5 @@ extern void * sym2addr(Process *, struct
> - #if 0                         /* not yet */
> - extern int umoven(Process * proc, void * addr, int len, void * laddr);
> - #endif
> -+#endif
> -+
> -Index: ltrace-0.5.3/configure
> -===================================================================
> ---- ltrace-0.5.3.orig/configure        2009-10-23 23:13:45.630316494 -0700
> -+++ ltrace-0.5.3/configure     2009-10-23 23:13:59.672869527 -0700
> -@@ -30,7 +30,7 @@ int main () {
> -   return cplus_demangle();
> - }
> - EOF
> --if gcc conftest.c -liberty 2>/dev/null
> -+if $CC conftest.c -liberty 2>/dev/null
> - then
> -   HAVE_LIBIBERTY=1
> -   echo "yes"
> -@@ -48,7 +48,7 @@ int main () {
> -   return __cxa_demangle();
> - }
> - EOF
> --if gcc conftest.c -lsupc++ 2>/dev/null
> -+if $CC conftest.c -lsupc++ 2>/dev/null
> - then
> -   HAVE_LIBSUPC__=1
> -   echo "yes"
> -@@ -67,7 +67,7 @@ int main () {
> -   return 0;
> - }
> - EOF
> --if gcc conftest.c 2>/dev/null
> -+if $CC conftest.c 2>/dev/null
> - then
> -   HAVE_ELF_C_READ_MMAP=1
> -   echo "yes"
> -@@ -77,15 +77,12 @@ else
> - fi
> - rm -f conftest.c a.out
> -
> --CC=gcc
> --CPPFLAGS=' -I /usr/include/libelf'
> - CFLAGS='-g -O2'
> - LIBS='-lelf -lsupc++ -liberty '
> --INSTALL='/usr/bin/install -c'
> -+INSTALL='install -c'
> - iquote='-iquote '
> - iquoteend=''
> -
> --prefix=/usr/local
> - sysconfdir='${prefix}/etc'
> - bindir='${prefix}/bin'
> - mandir='${prefix}/share/man'
> -Index: ltrace-0.5.3/debug.h
> -===================================================================
> ---- ltrace-0.5.3.orig/debug.h  2009-10-23 23:13:45.670276809 -0700
> -+++ ltrace-0.5.3/debug.h       2009-10-23 23:14:26.440319785 -0700
> -@@ -1,3 +1,5 @@
> -+#ifndef DEBUG_H
> -+#define DEBUG_H
> - #include <features.h>
> -
> - /* debug levels:
> -@@ -14,4 +16,4 @@ void debug_(int level, const char *file,
> - int xinfdump(long, void *, int);
> -
> - # define debug(level, expr...) debug_(level, __FILE__, __LINE__, expr)
> --
> -+#endif
> diff --git
> a/meta-oe/recipes-devtools/ltrace/files/ltrace-fix-sysdep_h-dependency.patch
> b/meta-oe/recipes-devtools/ltrace/files/ltrace-fix-sysdep_h-dependency.patch
> deleted file mode 100644
> index b9e5f7f..0000000
> ---
> a/meta-oe/recipes-devtools/ltrace/files/ltrace-fix-sysdep_h-dependency.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -Index: ltrace-0.5.3/sysdeps/linux-gnu/Makefile
> -===================================================================
> ---- ltrace-0.5.3.orig/sysdeps/linux-gnu/Makefile
> -+++ ltrace-0.5.3/sysdeps/linux-gnu/Makefile
> -@@ -12,7 +12,10 @@ CPPFLAGS    +=      -I$(TOPDIR)/sysdeps/linux-gn
> -
> - OBJ           =       events.o trace.o proc.o breakpoint.o
> -
> --all:          sysdep.h signalent.h syscallent.h arch_syscallent.h
> signalent1.h syscallent1.h ../sysdep.o
> -+HDRS          =       sysdep.h signalent.h syscallent.h
> arch_syscallent.h \
> -+                      signalent1.h syscallent1.h
> -+
> -+all:          ../sysdep.o
> -
> - sysdep.h:     $(ARCH)/arch.h
> -               cat $(ARCH)/arch.h > sysdep.h
> -@@ -49,12 +52,14 @@ arch_syscallent.h:
> - os.o:         $(OBJ)
> -               $(CC) -nostdlib -r -o os.o $(OBJ)
> -
> -+$(OBJ):               $(HDRS)
> -+
> - $(ARCH)/arch.o:       dummy
> -               $(MAKE) -C $(ARCH)
> -
> - clean:
> -               $(MAKE) -C $(ARCH) clean
> --              rm -f $(OBJ) sysdep.h signalent.h signalent1.h
> syscallent.h arch_syscallent.h
> --              rm -f syscallent1.h os.o sysdep.o ../sysdep.o
> -+              rm -f $(HDRS)
> -+              rm -f $(OBJ) os.o sysdep.o ../sysdep.o
> -
> - dummy:
> diff --git
> a/meta-oe/recipes-devtools/ltrace/files/ltrace-mips-remove-CP.patch
> b/meta-oe/recipes-devtools/ltrace/files/ltrace-mips-remove-CP.patch
> deleted file mode 100644
> index 2af193d..0000000
> --- a/meta-oe/recipes-devtools/ltrace/files/ltrace-mips-remove-CP.patch
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -Index: ltrace-0.5.3/sysdeps/linux-gnu/mipsel/trace.c
> -===================================================================
> ---- ltrace-0.5.3.orig/sysdeps/linux-gnu/mipsel/trace.c 2009-10-23
> 23:15:59.822783128 -0700
> -+++ ltrace-0.5.3/sysdeps/linux-gnu/mipsel/trace.c      2009-10-23
> 23:16:10.441268788 -0700
> -@@ -127,7 +127,6 @@ gimme_arg(enum tof type, Process *proc,
> -                       return ret;
> -               } else {
> -                       // If we need this, I think we can look at [sp+16]
> for arg_num==4.
> --                      CP;
> -                       return 0;
> -               }
> -       }
> diff --git a/meta-oe/recipes-devtools/ltrace/files/ltrace-mips.patch
> b/meta-oe/recipes-devtools/ltrace/files/ltrace-mips.patch
> deleted file mode 100644
> index 6df5e21..0000000
> --- a/meta-oe/recipes-devtools/ltrace/files/ltrace-mips.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -Index: ltrace-0.5.3/sysdeps/linux-gnu/mipsel/plt.c
> -===================================================================
> ---- ltrace-0.5.3.orig/sysdeps/linux-gnu/mipsel/plt.c   2009-10-23
> 23:25:59.292780574 -0700
> -+++ ltrace-0.5.3/sysdeps/linux-gnu/mipsel/plt.c        2009-10-23
> 23:26:22.671522220 -0700
> -@@ -1,4 +1,4 @@
> --#include <debug.h>
> -+#include "debug.h"
> - #include <gelf.h>
> - #include <sys/ptrace.h>
> - #include "common.h"
> -Index: ltrace-0.5.3/sysdeps/linux-gnu/mipsel/regs.c
> -===================================================================
> ---- ltrace-0.5.3.orig/sysdeps/linux-gnu/mipsel/regs.c  2009-10-23
> 23:25:59.312777529 -0700
> -+++ ltrace-0.5.3/sysdeps/linux-gnu/mipsel/regs.c       2009-10-23
> 23:26:08.190311896 -0700
> -@@ -4,7 +4,6 @@
> - #include <sys/types.h>
> - #include <sys/ptrace.h>
> - #include <asm/ptrace.h>
> --#include <linux/user.h>
> -
> - #include "common.h"
> - #include "mipsel.h"
> -Index: ltrace-0.5.3/handle_event.c
> -===================================================================
> ---- ltrace-0.5.3.orig/handle_event.c   2009-10-23 23:29:48.780274445 -0700
> -+++ ltrace-0.5.3/handle_event.c        2009-10-23 23:37:32.260284055 -0700
> -@@ -573,7 +573,8 @@ handle_breakpoint(Event *event) {
> -                       void *old_addr;
> -                       struct library_symbol *sym=
> event->proc->callstack[i].c_un.libfunc;
> -                       assert(sym);
> --                      old_addr =
> dict_find_entry(event->proc->breakpoints, sym2addr(event->proc, sym))->addr;
> -+                      struct Breakpoint *tbp =
> dict_find_entry(event->proc->breakpoints, sym2addr(event->proc, sym));
> -+                      old_addr = tbp->addr;
> -                       addr=sym2addr(event->proc,sym);
> -                       assert(old_addr !=0 && addr !=0);
> -                       if(addr != old_addr){
> diff --git a/meta-oe/recipes-devtools/ltrace/files/ltrace-ppc.patch
> b/meta-oe/recipes-devtools/ltrace/files/ltrace-ppc.patch
> deleted file mode 100644
> index d5ea0f0..0000000
> --- a/meta-oe/recipes-devtools/ltrace/files/ltrace-ppc.patch
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -Index: ltrace-0.5.3/sysdeps/linux-gnu/ppc/plt.c
> -===================================================================
> ---- ltrace-0.5.3.orig/sysdeps/linux-gnu/ppc/plt.c      2009-11-15
> 03:46:14.459233772 +0300
> -+++ ltrace-0.5.3/sysdeps/linux-gnu/ppc/plt.c   2009-11-15
> 03:46:25.299232646 +0300
> -@@ -1,5 +1,6 @@
> - #include <gelf.h>
> - #include "common.h"
> -+#include "ptrace.h"
> -
> - GElf_Addr
> - arch_plt_sym_val(struct ltelf *lte, size_t ndx, GElf_Rela * rela) {
> diff --git
> a/meta-oe/recipes-devtools/ltrace/ltrace-git/ltrace-0.7.2-unused-typedef.patch
> b/meta-oe/recipes-devtools/ltrace/ltrace-git/ltrace-0.7.2-unused-typedef.patch
> new file mode 100644
> index 0000000..8f3c0ec
> --- /dev/null
> +++
> b/meta-oe/recipes-devtools/ltrace/ltrace-git/ltrace-0.7.2-unused-typedef.patch
> @@ -0,0 +1,49 @@
> +diff --git a/value.c b/value.c
> +index d18db17..b98298e 100644
> +--- a/value.c
> ++++ b/value.c
> +@@ -1,6 +1,6 @@
> + /*
> +  * This file is part of ltrace.
> +- * Copyright (C) 2011,2012 Petr Machata, Red Hat Inc.
> ++ * Copyright (C) 2011,2012,2013 Petr Machata, Red Hat Inc.
> +  *
> +  * This program is free software; you can redistribute it and/or
> +  * modify it under the terms of the GNU General Public License as
> +@@ -282,9 +282,9 @@ value_init_deref(struct value *ret_val, struct value
> *valp)
> +       if (value_extract_word(valp, &l, NULL) < 0)
> +               return -1;
> +
> +-      /* We need "long" to be long enough to hold platform
> ++      /* We need "long" to be long enough to hold target
> +        * pointers.  */
> +-      typedef char assert__long_enough_long[-(sizeof(l) < sizeof(void
> *))];
> ++      assert(sizeof(l) >= sizeof(arch_addr_t));
> +
> +       value_common_init(ret_val, valp->inferior, valp,
> +                         valp->type->u.ptr_info.info, 0);
> +diff --git a/lens_default.c b/lens_default.c
> +index ed3d0e1..5d00814 100644
> +--- a/lens_default.c
> ++++ b/lens_default.c
> +@@ -1,6 +1,6 @@
> + /*
> +  * This file is part of ltrace.
> +- * Copyright (C) 2011,2012 Petr Machata, Red Hat Inc.
> ++ * Copyright (C) 2011,2012,2013 Petr Machata, Red Hat Inc.
> +  * Copyright (C) 1998,2004,2007,2008,2009 Juan Cespedes
> +  * Copyright (C) 2006 Ian Wienand
> +  * Copyright (C) 2006 Steve Fink
> +@@ -342,9 +342,9 @@ format_array(FILE *stream, struct value *value,
> struct value_dict *arguments,
> +            struct expr_node *length, size_t maxlen, int before,
> +            const char *open, const char *close, const char *delim)
> + {
> +-      /* We need "long" to be long enough to cover the whole address
> +-       * space.  */
> +-      typedef char assert__long_enough_long[-(sizeof(long) < sizeof(void
> *))];
> ++      /* We need "long" to be long enough to cover the whole target
> ++       * address space.  */
> ++      assert(sizeof(long) >= sizeof(arch_addr_t));
> +       long l;
> +       if (expr_eval_word(length, value, arguments, &l) < 0)
> +               return -1;
> diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_0.5.3.bbb/meta-oe/recipes-devtools/ltrace/
> ltrace_0.5.3.bb
> deleted file mode 100644
> index 7cefa76..0000000
> --- a/meta-oe/recipes-devtools/ltrace/ltrace_0.5.3.bb
> +++ /dev/null
> @@ -1,81 +0,0 @@
> -DESCRIPTION = "ltrace shows runtime library call information for
> dynamically linked executables."
> -HOMEPAGE = "http://ltrace.alioth.debian.org"
> -SECTION = "devel"
> -DEPENDS = "elfutils binutils"
> -LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
> -
> -PR = "r5"
> -
> -# ltrace is not ported to sh3/sh4 targets at this time
> -COMPATIBLE_TARGET_SYS = "(?!sh[34])"
> -
> -SRC_URI = "\
> -    ${DEBIAN_MIRROR}/main/l/ltrace/ltrace_${PV}.orig.tar.gz;name=archive \
> -    ${DEBIAN_MIRROR}/main/l/ltrace/ltrace_${PV}-2.1.diff.gz;name=patch \
> -    file://add-sysdep.patch \
> -    file://ltrace-compile.patch \
> -    file://ltrace-mips-remove-CP.patch \
> -    file://ltrace-mips.patch \
> -    file://ltrace-ppc.patch \
> -    file://ltrace-fix-sysdep_h-dependency.patch \
> -"
> -inherit autotools
> -
> -export TARGET_CFLAGS = "${SELECTED_OPTIMIZATION} -isystem
> ${STAGING_INCDIR}"
> -TARGET_CC_ARCH += "${LDFLAGS}"
> -
> -do_configure_prepend() {
> -    case ${TARGET_ARCH} in
> -        arm*)  ln -sf ./linux-gnu sysdeps/linux-gnueabi ;;
> -        mips*)  ln -sf ./mipsel sysdeps/linux-gnu/mips ;;
> -    esac
> -    sed -e 's:uname -m:echo @HOST_CPU@:' \
> -        sysdeps/linux-gnu/Makefile > sysdeps/linux-gnu/Makefile.in
> -
> -}
> -
> -do_compile() {
> -    case ${TARGET_ARCH} in
> -       --
> 1.7.9.5
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org <javascript:;>
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

