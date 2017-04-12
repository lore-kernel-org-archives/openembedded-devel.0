Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 052926E668
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 03:36:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v3C3asDR013690
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Apr 2017 20:36:54 -0700 (PDT)
Received: from [128.224.162.189] (128.224.162.189) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Tue, 11 Apr 2017 20:36:53 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <1491962624-152617-1-git-send-email-dengke.du@windriver.com>
From: Dengke Du <dengke.du@windriver.com>
Message-ID: <0f0d1e28-d0b2-ef82-53b7-868c3d1dc534@windriver.com>
Date: Wed, 12 Apr 2017 11:36:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1491962624-152617-1-git-send-email-dengke.du@windriver.com>
X-Originating-IP: [128.224.162.189]
Subject: Re: [PATCH] crash: 7.1.5 -> 7.1.8
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Apr 2017 03:36:55 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

This patch need to add the "id cc" to HOSTTOOLS in bitbake.conf in 
oe-core, I will send the patch to oe-core later.


On 2017年04月12日 10:03, Dengke Du wrote:
> Upgrade crash to fix build failure with glibc 2.25.
>
> Signed-off-by: Dengke Du <dengke.du@windriver.com>
> ---
>   ...ompilation-error-if-glibc-2.25-or-later-h.patch | 112 +++++++++++++++++++++
>   ...uild-error-unknown-type-name-gdb_fpregset.patch |  36 +++++++
>   ...sh-detect-the-sysroot-s-glibc-header-file.patch |  33 ++++++
>   .../crash/{crash_7.1.5.bb => crash_7.1.8.bb}       |  11 +-
>   4 files changed, 187 insertions(+), 5 deletions(-)
>   create mode 100644 meta-oe/recipes-kernel/crash/crash/0001-Fix-for-a-compilation-error-if-glibc-2.25-or-later-h.patch
>   create mode 100644 meta-oe/recipes-kernel/crash/crash/0002-crash-fix-build-error-unknown-type-name-gdb_fpregset.patch
>   create mode 100644 meta-oe/recipes-kernel/crash/crash/0003-crash-detect-the-sysroot-s-glibc-header-file.patch
>   rename meta-oe/recipes-kernel/crash/{crash_7.1.5.bb => crash_7.1.8.bb} (91%)
>
> diff --git a/meta-oe/recipes-kernel/crash/crash/0001-Fix-for-a-compilation-error-if-glibc-2.25-or-later-h.patch b/meta-oe/recipes-kernel/crash/crash/0001-Fix-for-a-compilation-error-if-glibc-2.25-or-later-h.patch
> new file mode 100644
> index 0000000..9434815
> --- /dev/null
> +++ b/meta-oe/recipes-kernel/crash/crash/0001-Fix-for-a-compilation-error-if-glibc-2.25-or-later-h.patch
> @@ -0,0 +1,112 @@
> +From b8c8fbe0a2481e97fc57dd596346827a692a5768 Mon Sep 17 00:00:00 2001
> +From: Dave Anderson <anderson@redhat.com>
> +Date: Tue, 28 Mar 2017 15:44:40 -0400
> +Subject: [PATCH 1/3] Fix for a compilation error if glibc-2.25 or later has
> + been installed on the host build machine.  Without the patch, the build fails
> + with the error message "amd64-linux-nat.c:496:1: error: conflicting types for
> + 'ps_get_thread_area'". (anderson@redhat.com)
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Dengke Du <dengke.du@windriver.com>
> +---
> + Makefile                     |  6 +++++
> + configure.c                  |  2 +-
> + gdb-7.6-proc_service.h.patch | 55 ++++++++++++++++++++++++++++++++++++++++++++
> + 3 files changed, 62 insertions(+), 1 deletion(-)
> + create mode 100644 gdb-7.6-proc_service.h.patch
> +
> +diff --git a/Makefile b/Makefile
> +index 202ef8b..b6b7e80 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -264,6 +264,12 @@ gdb_patch:
> + 	if [ "${ARCH}" = "x86_64" ] && [ "${TARGET}" = "PPC64" ] && [ -f ${GDB}-ppc64le-support.patch ]; then \
> + 		patch -d ${GDB} -p1 -F0 < ${GDB}-ppc64le-support.patch ; \
> + 	fi
> ++	if [ -f /usr/include/proc_service.h ]; then \
> ++		grep 'extern ps_err_e ps_get_thread_area (struct' /usr/include/proc_service.h; \
> ++		if [ $$? -eq 0 ]; then \
> ++			patch -p0 < ${GDB}-proc_service.h.patch; \
> ++		fi; \
> ++	fi
> +
> + library: make_build_data ${OBJECT_FILES}
> + 	ar -rs ${PROGRAM}lib.a ${OBJECT_FILES}
> +diff --git a/configure.c b/configure.c
> +index d63cdd7..776defe 100644
> +--- a/configure.c
> ++++ b/configure.c
> +@@ -240,7 +240,7 @@ struct supported_gdb_version {
> + 	    "7.6",
> + 	    "GDB_FILES=${GDB_7.6_FILES}",
> + 	    "GDB_OFILES=${GDB_7.6_OFILES}",
> +-	    "GDB_PATCH_FILES=gdb-7.6.patch gdb-7.6-ppc64le-support.patch",
> ++	    "GDB_PATCH_FILES=gdb-7.6.patch gdb-7.6-ppc64le-support.patch gdb-7.6-proc_service.h.patch",
> + 	    "GDB_FLAGS=-DGDB_7_6",
> + 	    "GPLv3"
> + 	},
> +diff --git a/gdb-7.6-proc_service.h.patch b/gdb-7.6-proc_service.h.patch
> +new file mode 100644
> +index 0000000..49d18bb
> +--- /dev/null
> ++++ b/gdb-7.6-proc_service.h.patch
> +@@ -0,0 +1,55 @@
> ++--- gdb-7.6/gdb/gdb_proc_service.h.orig
> +++++ gdb-7.6/gdb/gdb_proc_service.h
> ++@@ -115,7 +115,7 @@ extern pid_t ps_getpid (struct ps_procha
> ++ /* Fetch the special per-thread address associated with the given LWP.
> ++    This call is only used on a few platforms (most use a normal register).
> ++    The meaning of the `int' parameter is machine-dependent.  */
> ++-extern ps_err_e ps_get_thread_area (const struct ps_prochandle *,
> +++extern ps_err_e ps_get_thread_area (struct ps_prochandle *,
> ++ 				    lwpid_t, int, psaddr_t *);
> ++
> ++
> ++--- gdb-7.6/gdb/amd64-linux-nat.c.orig
> +++++ gdb-7.6/gdb/amd64-linux-nat.c
> ++@@ -493,7 +493,7 @@ amd64_linux_new_fork (struct lwp_info *p
> ++    a request for a thread's local storage address.  */
> ++
> ++ ps_err_e
> ++-ps_get_thread_area (const struct ps_prochandle *ph,
> +++ps_get_thread_area (struct ps_prochandle *ph,
> ++                     lwpid_t lwpid, int idx, void **base)
> ++ {
> ++   if (gdbarch_bfd_arch_info (target_gdbarch ())->bits_per_word == 32)
> ++--- gdb-7.6/gdb/aarch64-linux-nat.c.orig
> +++++ gdb-7.6/gdb/aarch64-linux-nat.c
> ++@@ -750,7 +750,7 @@ aarch64_linux_new_fork (struct lwp_info
> ++    storage (or its descriptor).  */
> ++
> ++ ps_err_e
> ++-ps_get_thread_area (const struct ps_prochandle *ph,
> +++ps_get_thread_area (struct ps_prochandle *ph,
> ++ 		    lwpid_t lwpid, int idx, void **base)
> ++ {
> ++   struct iovec iovec;
> ++--- gdb-7.6/gdb/arm-linux-nat.c.orig
> +++++ gdb-7.6/gdb/arm-linux-nat.c
> ++@@ -613,7 +613,7 @@ supply_fpregset (struct regcache *regcac
> ++ /* Fetch the thread-local storage pointer for libthread_db.  */
> ++
> ++ ps_err_e
> ++-ps_get_thread_area (const struct ps_prochandle *ph,
> +++ps_get_thread_area (struct ps_prochandle *ph,
> ++                     lwpid_t lwpid, int idx, void **base)
> ++ {
> ++   if (ptrace (PTRACE_GET_THREAD_AREA, lwpid, NULL, base) != 0)
> ++--- gdb-7.6/gdb/i386-linux-nat.c.orig
> +++++ gdb-7.6/gdb/i386-linux-nat.c
> ++@@ -849,7 +849,7 @@ i386_linux_new_fork (struct lwp_info *pa
> ++    storage (or its descriptor).  */
> ++
> ++ ps_err_e
> ++-ps_get_thread_area (const struct ps_prochandle *ph,
> +++ps_get_thread_area (struct ps_prochandle *ph,
> ++ 		    lwpid_t lwpid, int idx, void **base)
> ++ {
> ++   /* NOTE: cagney/2003-08-26: The definition of this buffer is found
> +--
> +2.8.1
> +
> diff --git a/meta-oe/recipes-kernel/crash/crash/0002-crash-fix-build-error-unknown-type-name-gdb_fpregset.patch b/meta-oe/recipes-kernel/crash/crash/0002-crash-fix-build-error-unknown-type-name-gdb_fpregset.patch
> new file mode 100644
> index 0000000..8355fe4
> --- /dev/null
> +++ b/meta-oe/recipes-kernel/crash/crash/0002-crash-fix-build-error-unknown-type-name-gdb_fpregset.patch
> @@ -0,0 +1,36 @@
> +From 52fc1a7c17768fd52c3577d21dad84e8babb94b5 Mon Sep 17 00:00:00 2001
> +From: Dengke Du <dengke.du@windriver.com>
> +Date: Thu, 6 Apr 2017 23:01:14 -0400
> +Subject: [PATCH 2/3] crash: fix build error unknown type name 'gdb_fpregset_t'
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Dengke Du <dengke.du@windriver.com>
> +---
> + gdb-7.6/gdb/gdb_proc_service.h | 3 +--
> + 1 file changed, 1 insertion(+), 2 deletions(-)
> +
> +diff --git a/gdb-7.6/gdb/gdb_proc_service.h b/gdb-7.6/gdb/gdb_proc_service.h
> +index 8bc6088..99c6496 100644
> +--- a/gdb-7.6/gdb/gdb_proc_service.h
> ++++ b/gdb-7.6/gdb/gdb_proc_service.h
> +@@ -20,6 +20,7 @@
> + #define GDB_PROC_SERVICE_H
> +
> + #include <sys/types.h>
> ++#include "gregset.h"
> +
> + #ifdef HAVE_PROC_SERVICE_H
> + #include <proc_service.h>
> +@@ -53,8 +54,6 @@
> + #include <sys/procfs.h>
> + #endif
> +
> +-#include "gregset.h"
> +-
> + /* Functions in this interface return one of these status codes.  */
> + typedef enum
> + {
> +--
> +2.8.1
> +
> diff --git a/meta-oe/recipes-kernel/crash/crash/0003-crash-detect-the-sysroot-s-glibc-header-file.patch b/meta-oe/recipes-kernel/crash/crash/0003-crash-detect-the-sysroot-s-glibc-header-file.patch
> new file mode 100644
> index 0000000..1f4bd01
> --- /dev/null
> +++ b/meta-oe/recipes-kernel/crash/crash/0003-crash-detect-the-sysroot-s-glibc-header-file.patch
> @@ -0,0 +1,33 @@
> +From c7950ef5228adc52a500b4fc67d7e48c3c09c1df Mon Sep 17 00:00:00 2001
> +From: Dengke Du <dengke.du@windriver.com>
> +Date: Thu, 6 Apr 2017 23:02:44 -0400
> +Subject: [PATCH 3/3] crash: detect the sysroot's glibc header file
> +
> +This is cross compile, so let the Makefile detect the sysroot's glibc
> +header file, not the host's glibc header file.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Dengke Du <dengke.du@windriver.com>
> +---
> + Makefile | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index b6b7e80..94f21a5 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -264,8 +264,8 @@ gdb_patch:
> + 	if [ "${ARCH}" = "x86_64" ] && [ "${TARGET}" = "PPC64" ] && [ -f ${GDB}-ppc64le-support.patch ]; then \
> + 		patch -d ${GDB} -p1 -F0 < ${GDB}-ppc64le-support.patch ; \
> + 	fi
> +-	if [ -f /usr/include/proc_service.h ]; then \
> +-		grep 'extern ps_err_e ps_get_thread_area (struct' /usr/include/proc_service.h; \
> ++	if [ -f ${RECIPE_SYSROOT}/usr/include/proc_service.h ]; then \
> ++		grep 'extern ps_err_e ps_get_thread_area (struct' ${RECIPE_SYSROOT}/usr/include/proc_service.h; \
> + 		if [ $$? -eq 0 ]; then \
> + 			patch -p0 < ${GDB}-proc_service.h.patch; \
> + 		fi; \
> +--
> +2.8.1
> +
> diff --git a/meta-oe/recipes-kernel/crash/crash_7.1.5.bb b/meta-oe/recipes-kernel/crash/crash_7.1.8.bb
> similarity index 91%
> rename from meta-oe/recipes-kernel/crash/crash_7.1.5.bb
> rename to meta-oe/recipes-kernel/crash/crash_7.1.8.bb
> index fbd89c3..012ef1a 100644
> --- a/meta-oe/recipes-kernel/crash/crash_7.1.5.bb
> +++ b/meta-oe/recipes-kernel/crash/crash_7.1.8.bb
> @@ -22,10 +22,13 @@ SRC_URI = "https://github.com/crash-utility/${BPN}/archive/${PV}.tar.gz;download
>              file://donnot-extract-gdb-during-do-compile.patch \
>              file://gdb_build_jobs_and_not_write_crash_target.patch \
>              file://remove-unrecognized-gcc-option-m32-for-mips.patch \
> +           file://0001-Fix-for-a-compilation-error-if-glibc-2.25-or-later-h.patch \
> +           file://0002-crash-fix-build-error-unknown-type-name-gdb_fpregset.patch \
> +           file://0003-crash-detect-the-sysroot-s-glibc-header-file.patch \
>              "
>   
> -SRC_URI[md5sum] = "7bd06eaec6827d4fac636b2b592d3056"
> -SRC_URI[sha256sum] = "c3954412c8557614a0d50092c007aa96b4e3e6e97453dfbb60241ab680caf7b2"
> +SRC_URI[md5sum] = "31787074f267a3536eebff008a0652ec"
> +SRC_URI[sha256sum] = "9965dee9199d7e39764fbee7f21c7c45b1f7b6d17c8e92ad62f468f062876478"
>   
>   SRC_URI[gdb.md5sum] = "a9836707337e5f7bf76a009a8904f470"
>   SRC_URI[gdb.sha256sum] = "8070389a5dcc104eb0be483d582729f98ed4d761ad19cedd3f17b5d2502faa36"
> @@ -80,7 +83,7 @@ do_compile_prepend() {
>   }
>   
>   do_compile() {
> -    oe_runmake ${EXTRA_OEMAKE}
> +    oe_runmake ${EXTRA_OEMAKE} RECIPE_SYSROOT=${RECIPE_SYSROOT}
>   }
>   
>   do_install_prepend () {
> @@ -111,5 +114,3 @@ RDEPENDS_${PN}_class-cross = ""
>   # Causes gcc to get stuck and eat all available memory in qemuarm builds
>   # jenkins  15161  100 12.5 10389596 10321284 ?   R    11:40  28:17 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.2/cc1 -quiet -I . -I . -I ./common -I ./config -I ./../include/opcode -I ./../opcodes/.. -I ./../readline/.. -I ../bfd -I ./../bfd -I ./../include -I ../libdecnumber -I ./../libdecnumber -I ./gnulib/import -I build-gnulib/import -isysroot /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm -MMD eval.d -MF .deps/eval.Tpo -MP -MT eval.o -D LOCALEDIR="/usr/local/share/locale" -D CRASH_MERGE -D HAVE_CONFIG_H -D TUI=1 eval.c -quiet -dumpbase eval.c -march=armv5te -mthumb -mthumb-interwork -mtls-dialect=gnu -auxbase-strip eval.o -g -O2 -Wall -Wpointer-arith -Wformat-nonliteral -Wno-pointer-sign -Wno-unused -Wunused-value -Wunused-function -Wno-switch -Wno-char-subscripts -Wmissing-prototypes -Wdeclaration-after-statement -Wempty-body -feliminate-unused-debug-types -o -
>   ARM_INSTRUCTION_SET = "arm"
> -
> -PNBLACKLIST[crash] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130678/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"


