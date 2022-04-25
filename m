Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B24B7C433EF
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 23:31:54 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.37556.1650929513834520050
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 16:31:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eM3v4YXw;
 spf=pass (domain: gmail.com, ip: 209.85.216.53,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id u5so3906630pjr.5
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 16:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=55ESAJMfilGKuLM0zOa64l77kaWA0NFTbFJoJhh+dlA=;
        b=eM3v4YXw5N1Al6RUdo1qp0BiNT2SN42C8zAY0Yk4wUImgQ1CAoj26mxZIHymtPIhuv
         my03pAUM6jsK3of3Ora1o16L8+kyZ2tlbROnqMMqmqv8vzMGsNKfxAvx0LmbojJJiiTM
         JNAG61tlBZF/TQxwKd/iQHPIyWAOJ8mkyj2oZrLhK25FN8aH0B9XOSBq+l5PD490vfdm
         95HLuEMVIShxHiH3mOI/gznNHnajIKjf/5B0Ihrf4U7Dk3TeBEsF4Vosv14tWooF7iiG
         R3eC5l5iQf0O+4FUY93RRQI94DZ0oZggiua5bbIampTXGzG8FpPT9bjsDa1wrCWfSuaI
         SEhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=55ESAJMfilGKuLM0zOa64l77kaWA0NFTbFJoJhh+dlA=;
        b=sUAtQe/41TfPxRICYMSA2NMkpDIk5B5ZmLYbdXPwxVGb0mz5h+WluemPgOCbVaSmrd
         DyjZGn3Smh1JNyP6/fflD8+Jtu3rYSjFyUfeWr73F/smT8Ofn7B1XGLhuhqHTs1MN8aw
         olJM6baCak/Rivoc7c5i8OcKxeBwp8o3LGeduEiSXBUZ2GaQxu30bdkFxol+osDmQi0b
         ialBp8oU7w2soJGUae7aBJDitF1R5/26gJP6Br2YbtyQ9oZPEV1Er4KyTue5cQ0M1KCe
         cBK9wWBDsPN88YL5mSSKcAfypcaggQAhDDYlMPXl6Vf3MRWVK9lFpFEHqmrqMv+4UgOK
         yKEg==
X-Gm-Message-State: AOAM533NedpPrXMGzjFl1J4HpEY/r+VfYE09DFg9UzPgOafGmJC/TFwy
	Jb8ITJPfTEIJ4JyTnCZeqRY=
X-Google-Smtp-Source: 
 ABdhPJwOapgVAMGdTiUCGPrWRc+oq/O01w07xgJ5SxshxIw2zC2VlIuUJxsovW8Pws1CqoKpax/w2w==
X-Received: by 2002:a17:902:6a8a:b0:156:8ff6:daf0 with SMTP id
 n10-20020a1709026a8a00b001568ff6daf0mr20516359plk.117.1650929513031;
        Mon, 25 Apr 2022 16:31:53 -0700 (PDT)
Received: from ?IPV6:2601:202:4180:a5c0:5a47:377:c988:edd?
 ([2601:202:4180:a5c0:5a47:377:c988:edd])
        by smtp.gmail.com with ESMTPSA id
 d18-20020a056a0010d200b004fa2e13ce80sm13442835pfu.76.2022.04.25.16.31.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Apr 2022 16:31:52 -0700 (PDT)
Message-ID: <f07a5c7a-40ac-177f-eaa9-bb0d3d23c922@gmail.com>
Date: Mon, 25 Apr 2022 16:31:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [oe] [meta-oe][PATCH] crash: Upgrade to 8.0.0
Content-Language: en-US
To: "Yu, Mingli" <mingli.yu@windriver.com>,
 openembedded-devel@lists.openembedded.org
References: <20220422030730.2556794-1-mingli.yu@windriver.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <20220422030730.2556794-1-mingli.yu@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Apr 2022 23:31:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96785



On 4/21/22 20:07, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
>
> The bundled gdb upgraded to 10.2 [1] and remove related patches
> against the previous gdb 7.6.

Do we need to be in-sync with the GDB in core?

- armin
>
> [1] https://github.com/crash-utility/crash/commit/ec568e2ea515b66343d3488d5d4b9a625d55b7ae
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>   ...error-unknown-type-name-gdb_fpregset.patch | 36 ---------
>   ...tect-the-sysroot-s-glibc-header-file.patch | 33 --------
>   ...unrecognized-gcc-option-m32-for-mips.patch | 33 --------
>   ...im-arange-fix-extern-inline-handling.patch | 79 -------------------
>   ...m-ppc-drop-LIBS-from-psim-dependency.patch | 37 ---------
>   .../crash/{crash_7.3.0.bb => crash_8.0.0.bb}  | 12 +--
>   6 files changed, 3 insertions(+), 227 deletions(-)
>   delete mode 100644 meta-oe/recipes-kernel/crash/crash/0002-crash-fix-build-error-unknown-type-name-gdb_fpregset.patch
>   delete mode 100644 meta-oe/recipes-kernel/crash/crash/0003-crash-detect-the-sysroot-s-glibc-header-file.patch
>   delete mode 100644 meta-oe/recipes-kernel/crash/crash/remove-unrecognized-gcc-option-m32-for-mips.patch
>   delete mode 100644 meta-oe/recipes-kernel/crash/crash/sim-common-sim-arange-fix-extern-inline-handling.patch
>   delete mode 100644 meta-oe/recipes-kernel/crash/crash/sim-ppc-drop-LIBS-from-psim-dependency.patch
>   rename meta-oe/recipes-kernel/crash/{crash_7.3.0.bb => crash_8.0.0.bb} (87%)
>
> diff --git a/meta-oe/recipes-kernel/crash/crash/0002-crash-fix-build-error-unknown-type-name-gdb_fpregset.patch b/meta-oe/recipes-kernel/crash/crash/0002-crash-fix-build-error-unknown-type-name-gdb_fpregset.patch
> deleted file mode 100644
> index 8355fe44e..000000000
> --- a/meta-oe/recipes-kernel/crash/crash/0002-crash-fix-build-error-unknown-type-name-gdb_fpregset.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -From 52fc1a7c17768fd52c3577d21dad84e8babb94b5 Mon Sep 17 00:00:00 2001
> -From: Dengke Du <dengke.du@windriver.com>
> -Date: Thu, 6 Apr 2017 23:01:14 -0400
> -Subject: [PATCH 2/3] crash: fix build error unknown type name 'gdb_fpregset_t'
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Dengke Du <dengke.du@windriver.com>
> ----
> - gdb-7.6/gdb/gdb_proc_service.h | 3 +--
> - 1 file changed, 1 insertion(+), 2 deletions(-)
> -
> -diff --git a/gdb-7.6/gdb/gdb_proc_service.h b/gdb-7.6/gdb/gdb_proc_service.h
> -index 8bc6088..99c6496 100644
> ---- a/gdb-7.6/gdb/gdb_proc_service.h
> -+++ b/gdb-7.6/gdb/gdb_proc_service.h
> -@@ -20,6 +20,7 @@
> - #define GDB_PROC_SERVICE_H
> -
> - #include <sys/types.h>
> -+#include "gregset.h"
> -
> - #ifdef HAVE_PROC_SERVICE_H
> - #include <proc_service.h>
> -@@ -53,8 +54,6 @@
> - #include <sys/procfs.h>
> - #endif
> -
> --#include "gregset.h"
> --
> - /* Functions in this interface return one of these status codes.  */
> - typedef enum
> - {
> ---
> -2.8.1
> -
> diff --git a/meta-oe/recipes-kernel/crash/crash/0003-crash-detect-the-sysroot-s-glibc-header-file.patch b/meta-oe/recipes-kernel/crash/crash/0003-crash-detect-the-sysroot-s-glibc-header-file.patch
> deleted file mode 100644
> index 1f4bd01da..000000000
> --- a/meta-oe/recipes-kernel/crash/crash/0003-crash-detect-the-sysroot-s-glibc-header-file.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From c7950ef5228adc52a500b4fc67d7e48c3c09c1df Mon Sep 17 00:00:00 2001
> -From: Dengke Du <dengke.du@windriver.com>
> -Date: Thu, 6 Apr 2017 23:02:44 -0400
> -Subject: [PATCH 3/3] crash: detect the sysroot's glibc header file
> -
> -This is cross compile, so let the Makefile detect the sysroot's glibc
> -header file, not the host's glibc header file.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Dengke Du <dengke.du@windriver.com>
> ----
> - Makefile | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/Makefile b/Makefile
> -index b6b7e80..94f21a5 100644
> ---- a/Makefile
> -+++ b/Makefile
> -@@ -264,8 +264,8 @@ gdb_patch:
> - 	if [ "${ARCH}" = "x86_64" ] && [ "${TARGET}" = "PPC64" ] && [ -f ${GDB}-ppc64le-support.patch ]; then \
> - 		patch -d ${GDB} -p1 -F0 < ${GDB}-ppc64le-support.patch ; \
> - 	fi
> --	if [ -f /usr/include/proc_service.h ]; then \
> --		grep 'extern ps_err_e ps_get_thread_area (struct' /usr/include/proc_service.h; \
> -+	if [ -f ${RECIPE_SYSROOT}/usr/include/proc_service.h ]; then \
> -+		grep 'extern ps_err_e ps_get_thread_area (struct' ${RECIPE_SYSROOT}/usr/include/proc_service.h; \
> - 		if [ $$? -eq 0 ]; then \
> - 			patch -p0 < ${GDB}-proc_service.h.patch; \
> - 		fi; \
> ---
> -2.8.1
> -
> diff --git a/meta-oe/recipes-kernel/crash/crash/remove-unrecognized-gcc-option-m32-for-mips.patch b/meta-oe/recipes-kernel/crash/crash/remove-unrecognized-gcc-option-m32-for-mips.patch
> deleted file mode 100644
> index 37d43b888..000000000
> --- a/meta-oe/recipes-kernel/crash/crash/remove-unrecognized-gcc-option-m32-for-mips.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -Upstream-Status: Pending
> -
> -It fails to build crash for mips with error:
> -
> -| mips-wrs-linux-gcc: error: unrecognized command line option '-m32'
> -| Makefile:291: recipe for target 'make_build_data' failed
> -
> -So remove the unrecognized option '-m32' for mips.
> -
> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ----
> -diff --git a/configure.c b/configure.c
> -index cf1973b..71e97b3 100644
> ---- a/configure.c
> -+++ b/configure.c
> -@@ -155,7 +155,7 @@ void add_extra_lib(char *);
> - #define TARGET_CFLAGS_PPC64_ON_X86_64  "TARGET_CFLAGS="
> - #define TARGET_CFLAGS_MIPS            "TARGET_CFLAGS=-D_FILE_OFFSET_BITS=64"
> - #define TARGET_CFLAGS_MIPS_ON_X86     "TARGET_CFLAGS=-D_FILE_OFFSET_BITS=64"
> --#define TARGET_CFLAGS_MIPS_ON_X86_64  "TARGET_CFLAGS=-m32 -D_FILE_OFFSET_BITS=64"
> -+#define TARGET_CFLAGS_MIPS_ON_X86_64  "TARGET_CFLAGS=-D_FILE_OFFSET_BITS=64"
> - #define TARGET_CFLAGS_MIPS64          "TARGET_CFLAGS="
> - #define TARGET_CFLAGS_SPARC64         "TARGET_CFLAGS="
> -
> -@@ -167,7 +167,7 @@ void add_extra_lib(char *);
> - #define GDB_TARGET_ARM64_ON_X86_64  "GDB_CONF_FLAGS=--target=aarch64-elf-linux"   /* TBD */
> - #define GDB_TARGET_PPC64_ON_X86_64  "GDB_CONF_FLAGS=--target=powerpc64le-unknown-linux-gnu"
> - #define GDB_TARGET_MIPS_ON_X86     "GDB_CONF_FLAGS=--target=mipsel-elf-linux"
> --#define GDB_TARGET_MIPS_ON_X86_64  "GDB_CONF_FLAGS=--target=mipsel-elf-linux CFLAGS=-m32"
> -+#define GDB_TARGET_MIPS_ON_X86_64  "GDB_CONF_FLAGS=--target=mipsel-elf-linux"
> -
> - /*
> -  *  The original plan was to allow the use of a particular version
> diff --git a/meta-oe/recipes-kernel/crash/crash/sim-common-sim-arange-fix-extern-inline-handling.patch b/meta-oe/recipes-kernel/crash/crash/sim-common-sim-arange-fix-extern-inline-handling.patch
> deleted file mode 100644
> index 0185b5704..000000000
> --- a/meta-oe/recipes-kernel/crash/crash/sim-common-sim-arange-fix-extern-inline-handling.patch
> +++ /dev/null
> @@ -1,79 +0,0 @@
> -Upstream-Status: Backport
> -
> -https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=92fc615
> -
> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
> -From 92fc6153a6fdf2a027d9780f5945712aafad4a9e Mon Sep 17 00:00:00 2001
> -From: Mike Frysinger <vapier@gentoo.org>
> -Date: Sun, 29 Mar 2015 15:59:01 -0400
> -Subject: [PATCH] sim: common: sim-arange: fix extern inline handling
> -
> -With newer versions of gcc (5.x), the extern inline we're using with the
> -sim-arange module no longer works.  Since this code really wants the gnu
> -inline semantics, use that attribute explicitly.
> -
> -Reported-by: DJ Delorie <dj@redhat.com>
> -Reported-by: Joel Sherrill <joel.sherrill@oarcorp.com>
> ----
> - gdb-7.6/sim/common/sim-arange.h | 20 ++++++++++++--------
> - gdb-7.6/sim/common/sim-inline.h |  4 +++-
> - 2 files changed, 15 insertions(+), 9 deletions(-)
> -
> -diff --git a/gdb-7.6/sim/common/sim-arange.h b/gdb-7.6/sim/common/sim-arange.h
> -index 73117f3..de842c9 100644
> ---- a/gdb-7.6/sim/common/sim-arange.h
> -+++ b/gdb-7.6/sim/common/sim-arange.h
> -@@ -60,22 +60,26 @@ extern void sim_addr_range_delete (ADDR_RANGE * /*ar*/,
> - 				   address_word /*start*/,
> - 				   address_word /*end*/);
> -
> -+/* TODO: This should get moved into sim-inline.h.  */
> -+#ifdef HAVE_INLINE
> -+#ifdef SIM_ARANGE_C
> -+#define SIM_ARANGE_INLINE INLINE
> -+#else
> -+#define SIM_ARANGE_INLINE EXTERN_INLINE
> -+#endif
> -+#else
> -+#define SIM_ARANGE_INLINE EXTERN
> -+#endif
> -+
> - /* Return non-zero if ADDR is in range AR, traversing the entire tree.
> -    If no range is specified, that is defined to mean "everything".  */
> --extern INLINE int
> -+SIM_ARANGE_INLINE int
> - sim_addr_range_hit_p (ADDR_RANGE * /*ar*/, address_word /*addr*/);
> - #define ADDR_RANGE_HIT_P(ar, addr) \
> -   ((ar)->range_tree == NULL || sim_addr_range_hit_p ((ar), (addr)))
> -
> - #ifdef HAVE_INLINE
> --#ifdef SIM_ARANGE_C
> --#define SIM_ARANGE_INLINE INLINE
> --#else
> --#define SIM_ARANGE_INLINE EXTERN_INLINE
> --#endif
> - #include "sim-arange.c"
> --#else
> --#define SIM_ARANGE_INLINE
> - #endif
> - #define SIM_ARANGE_C_INCLUDED
> -
> -diff --git a/gdb-7.6/sim/common/sim-inline.h b/gdb-7.6/sim/common/sim-inline.h
> -index af75562..8a9c286 100644
> ---- a/gdb-7.6/sim/common/sim-inline.h
> -+++ b/gdb-7.6/sim/common/sim-inline.h
> -@@ -303,7 +303,9 @@
> - /* ??? Temporary, pending decision to always use extern inline and do a vast
> -    cleanup of inline support.  */
> - #ifndef INLINE2
> --#if defined (__GNUC__)
> -+#if defined (__GNUC_GNU_INLINE__) || defined (__GNUC_STDC_INLINE__)
> -+#define INLINE2 __inline__ __attribute__ ((__gnu_inline__))
> -+#elif defined (__GNUC__)
> - #define INLINE2 __inline__
> - #else
> - #define INLINE2 /*inline*/
> ---
> -2.6.1
> -
> diff --git a/meta-oe/recipes-kernel/crash/crash/sim-ppc-drop-LIBS-from-psim-dependency.patch b/meta-oe/recipes-kernel/crash/crash/sim-ppc-drop-LIBS-from-psim-dependency.patch
> deleted file mode 100644
> index 77a287f14..000000000
> --- a/meta-oe/recipes-kernel/crash/crash/sim-ppc-drop-LIBS-from-psim-dependency.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -Upstream-Status: Backport
> -
> -https://sourceware.org/git/?p=binutils-gdb.git;h=0d8a6ab
> -
> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ----
> -From 0d8a6ab7d39d28fb1557e2a62e9e4b336341ab34 Mon Sep 17 00:00:00 2001
> -From: Aaro Koskinen <aaro.koskinen@iki.fi>
> -Date: Mon, 17 Feb 2014 17:12:59 -0500
> -Subject: [PATCH] sim: ppc: drop $(LIBS) from psim dependency
> -
> -When cross-compiling GDB for PPC, there's a prerequisite "-lz" for psim
> -that results in a build failure. With such prerequisite, GNU Make will
> -try to search the library from build machine's /usr/lib which is wrong.
> -On 64-bit Linux build machines the compilation will fail because of this.
> -
> -URL: https://sourceware.org/bugzilla/show_bug.cgi?id=12202
> ----
> - sim/ppc/Makefile.in | 2 +-
> - 1 files changed, 1 insertions(+), 1 deletions(-)
> -
> -diff --git a/gdb-7.6/sim/ppc/Makefile.in b/gdb-7.6/sim/ppc/Makefile.in
> -index b811f6f..740bdb0 100644
> ---- a/gdb-7.6/sim/ppc/Makefile.in
> -+++ b/gdb-7.6/sim/ppc/Makefile.in
> -@@ -552,7 +552,7 @@ PACKAGE_SRC = @sim_pk_src@
> - PACKAGE_OBJ = @sim_pk_obj@
> -
> -
> --psim: $(TARGETLIB) main.o $(LIBIBERTY_LIB) $(BFD_LIB) $(LIBS) $(LIBINTL_DEP)
> -+psim: $(TARGETLIB) main.o $(LIBIBERTY_LIB) $(BFD_LIB) $(LIBINTL_DEP)
> - 	$(CC) $(CFLAGS) $(SIM_CFLAGS) $(LDFLAGS) -o psim$(EXEEXT) main.o $(TARGETLIB) $(BFD_LIB) $(LIBINTL) $(LIBIBERTY_LIB) $(LIBS)
> -
> - run: psim
> ---
> -1.9.4
> -
> diff --git a/meta-oe/recipes-kernel/crash/crash_7.3.0.bb b/meta-oe/recipes-kernel/crash/crash_8.0.0.bb
> similarity index 87%
> rename from meta-oe/recipes-kernel/crash/crash_7.3.0.bb
> rename to meta-oe/recipes-kernel/crash/crash_8.0.0.bb
> index d4aa0d52b..4ea5b67de 100644
> --- a/meta-oe/recipes-kernel/crash/crash_7.3.0.bb
> +++ b/meta-oe/recipes-kernel/crash/crash_8.0.0.bb
> @@ -14,22 +14,16 @@ DEPENDS = "zlib readline coreutils-native ncurses-native"
>   
>   S = "${WORKDIR}/git"
>   SRC_URI = "git://github.com/crash-utility/${BPN}.git;branch=master;protocol=https \
> -           ${GNU_MIRROR}/gdb/gdb-7.6.tar.gz;name=gdb;subdir=git \
> +           ${GNU_MIRROR}/gdb/gdb-10.2.tar.gz;name=gdb;subdir=git \
>              file://7001force_define_architecture.patch \
>              file://7003cross_ranlib.patch \
>              file://0001-cross_add_configure_option.patch \
> -           file://sim-ppc-drop-LIBS-from-psim-dependency.patch \
> -           file://sim-common-sim-arange-fix-extern-inline-handling.patch \
>              file://donnot-extract-gdb-during-do-compile.patch \
>              file://gdb_build_jobs_and_not_write_crash_target.patch \
> -           file://remove-unrecognized-gcc-option-m32-for-mips.patch \
> -           file://0002-crash-fix-build-error-unknown-type-name-gdb_fpregset.patch \
> -           file://0003-crash-detect-the-sysroot-s-glibc-header-file.patch \
>              "
> -SRCREV = "2a3e546942ab560f050ab77e8c7828b06513b3f0"
> +SRCREV = "ec568e2ea515b66343d3488d5d4b9a625d55b7ae"
>   
> -SRC_URI[gdb.md5sum] = "a9836707337e5f7bf76a009a8904f470"
> -SRC_URI[gdb.sha256sum] = "8070389a5dcc104eb0be483d582729f98ed4d761ad19cedd3f17b5d2502faa36"
> +SRC_URI[gdb.sha256sum] = "b33ad58d687487a821ec8d878daab0f716be60d0936f2e3ac5cf08419ce70350"
>   
>   UPSTREAM_CHECK_URI = "https://github.com/crash-utility/crash/releases"
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#96730): https://lists.openembedded.org/g/openembedded-devel/message/96730
> Mute This Topic: https://lists.openembedded.org/mt/90620887/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


