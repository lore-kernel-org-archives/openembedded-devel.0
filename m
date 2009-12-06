Received: from ey-out-1920.google.com ([74.125.78.148])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1NHPsM-0000us-DS
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Dec 2009 23:46:49 +0100
Received: by ey-out-1920.google.com with SMTP id 5so985089eyb.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Dec 2009 14:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=fvt3NGH22YQEB688Ox5CHvkyEG2sw3rSWwTg8S3woZ8=;
	b=Fdxr22MR5X4RVaVlWzWfU2UNRBIxcKzWnHurPz6CzYxfUa6F5e2jEh9daGceoI0+2M
	dll5Ustvx2xd+x9SrHUJXI1BQhjoT7o3sJXSjlC3/R4PKiK8DXca1zf86aC3e15qQVc9
	z9Il3TRx7ZSvYA2ylMEkvzYjQzXHD6AYawIj0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=o0ZZQ/gJ3qKsNQ0BkIuQrFTjtMddkJm23T0yesEYq+HWkq8Q5tjf7WmPVqhUC+MVG4
	ttdDUm/ZTxKm+V/80j9Jwx39osjwB6d7KCoW8Pf3Mp3DCOl2MBfWPUll63WOivbSZofG
	zTYvCp/BErEbSzVFSgHLwuQZBDPtT5cA/vyzY=
Received: by 10.213.100.11 with SMTP id w11mr6307023ebn.34.1260139509462;
	Sun, 06 Dec 2009 14:45:09 -0800 (PST)
Received: from localhost.localdomain (82-171-51-231.ip.telfort.nl
	[82.171.51.231])
	by mx.google.com with ESMTPS id 15sm3113864ewy.12.2009.12.06.14.45.08
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 06 Dec 2009 14:45:08 -0800 (PST)
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Dec 2009 23:44:45 +0100
Message-Id: <1260139496-21442-10-git-send-email-leon@sidebranch.com>
X-Mailer: git-send-email 1.6.0.4
In-Reply-To: <1260139496-21442-9-git-send-email-leon@sidebranch.com>
References: <1260139496-21442-1-git-send-email-leon@sidebranch.com>
	<1260139496-21442-2-git-send-email-leon@sidebranch.com>
	<1260139496-21442-3-git-send-email-leon@sidebranch.com>
	<1260139496-21442-4-git-send-email-leon@sidebranch.com>
	<1260139496-21442-5-git-send-email-leon@sidebranch.com>
	<1260139496-21442-6-git-send-email-leon@sidebranch.com>
	<1260139496-21442-7-git-send-email-leon@sidebranch.com>
	<1260139496-21442-8-git-send-email-leon@sidebranch.com>
	<1260139496-21442-9-git-send-email-leon@sidebranch.com>
X-SA-Exim-Connect-IP: 74.125.78.148
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Leon Woestenberg <leon@sidebranch.com>
Subject: [PATCH] uclibc{, -cross}{, -initial}_nios2-0.9.2{7, 9}.bb: nios2 fork.
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
X-List-Received-Date: Sun, 06 Dec 2009 22:46:51 -0000

uclibc with nios2 support from a community maintained fork in GIT.

This fork might actually be pushed back upstream by this community
(TODO: check this and switch to upstream uclibc if so).

Tested-by: Walter Goossens <walter.goossens@axon.tv>
Tested-by: Leon Woestenberg <leon@sidebranch.com>
Signed-off-by: Leon Woestenberg <leon@sidebranch.com>
---
 recipes/uclibc/uclibc-initial_nios2-0.9.27.bb      |   32 ++++
 .../uclibc/uclibc-nios2-0.9.27/nios2/uClibc.config |  186 ++++++++++++++++++++
 .../uclibc/uclibc-nios2-0.9.29/nios2/uClibc.config |  186 ++++++++++++++++++++
 recipes/uclibc/uclibc.inc                          |    8 +-
 recipes/uclibc/uclibc_nios2-0.9.27.bb              |   19 ++
 recipes/uclibc/uclibc_nios2-0.9.29.bb              |   28 +++
 6 files changed, 456 insertions(+), 3 deletions(-)
 create mode 100644 recipes/uclibc/uclibc-initial_nios2-0.9.27.bb
 create mode 100644 recipes/uclibc/uclibc-nios2-0.9.27/nios2/uClibc.config
 create mode 100644 recipes/uclibc/uclibc-nios2-0.9.29/nios2/uClibc.config
 create mode 100644 recipes/uclibc/uclibc_nios2-0.9.27.bb
 create mode 100644 recipes/uclibc/uclibc_nios2-0.9.29.bb

diff --git a/recipes/uclibc/uclibc-initial_nios2-0.9.27.bb b/recipes/uclibc/uclibc-initial_nios2-0.9.27.bb
new file mode 100644
index 0000000..83c69a8
--- /dev/null
+++ b/recipes/uclibc/uclibc-initial_nios2-0.9.27.bb
@@ -0,0 +1,32 @@
+SECTION = "base"
+require uclibc_${PV}.bb
+
+FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-${PV}', '${FILE_DIRNAME}/uclibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
+
+DEPENDS = "linux-libc-headers  ncurses-native virtual/${TARGET_PREFIX}gcc-initial"
+PROVIDES = "virtual/${TARGET_PREFIX}libc-initial"
+PACKAGES = ""
+
+do_install() {
+	# Install initial headers into the cross dir
+	make V=1 CC="${CC}" PREFIX=${D} DEVEL_PREFIX=${prefix}/ RUNTIME_PREFIX=/ \
+		install_headers #pregen install_dev
+	#ln -sf include ${CROSS_DIR}/${TARGET_SYS}/sys-include
+
+	# This conflicts with the c++ version of this header
+	rm -f ${D}${includedir}/bits/atomicity.h
+	install -d ${D}${libdir}/
+	install -m 644 lib/crt[1in].o ${D}${libdir}/
+	install -d ${D}${libdir}/
+	install -m 644 lib/libc.so ${D}${libdir}/
+}
+
+do_compile () {
+	make -j1 V=1 CC="${CC}" PREFIX=${D} DEVEL_PREFIX=${prefix}/ RUNTIME_PREFIX=/ \
+		lib/crt1.o lib/crti.o lib/crtn.o
+#               libc/sysdeps/linux/${TARGET_ARCH}/crt1.o \
+#               libc/sysdeps/linux/${TARGET_ARCH}/crti.o \
+#               libc/sysdeps/linux/${TARGET_ARCH}/crtn.o
+	${CC} -nostdlib -nostartfiles -shared -x c /dev/null \
+		-o lib/libc.so
+}
diff --git a/recipes/uclibc/uclibc-nios2-0.9.27/nios2/uClibc.config b/recipes/uclibc/uclibc-nios2-0.9.27/nios2/uClibc.config
new file mode 100644
index 0000000..d180532
--- /dev/null
+++ b/recipes/uclibc/uclibc-nios2-0.9.27/nios2/uClibc.config
@@ -0,0 +1,186 @@
+#
+# Automatically generated make config: don't edit
+# Wed Feb  4 08:55:49 2009
+#
+# TARGET_alpha is not set
+# TARGET_arm is not set
+# TARGET_bfin is not set
+# TARGET_cris is not set
+# TARGET_e1 is not set
+# TARGET_frv is not set
+# TARGET_h8300 is not set
+# TARGET_hppa is not set
+# TARGET_i386 is not set
+# TARGET_i960 is not set
+# TARGET_ia64 is not set
+# TARGET_m68k is not set
+# TARGET_microblaze is not set
+# TARGET_mips is not set
+# TARGET_nios is not set
+TARGET_nios2=y
+# TARGET_powerpc is not set
+# TARGET_sh is not set
+# TARGET_sh64 is not set
+# TARGET_sparc is not set
+# TARGET_v850 is not set
+# TARGET_vax is not set
+# TARGET_x86_64 is not set
+
+#
+# Target Architecture Features and Options
+#
+TARGET_ARCH="nios2"
+FORCE_OPTIONS_FOR_ARCH=y
+TARGET_SUBARCH=""
+# UCLIBC_FORMAT_ELF is not set
+# UCLIBC_FORMAT_FDPIC_ELF is not set
+UCLIBC_FORMAT_FLAT=y
+# UCLIBC_FORMAT_FLAT_SEP_DATA is not set
+# UCLIBC_FORMAT_SHARED_FLAT is not set
+ARCH_LITTLE_ENDIAN=y
+
+#
+# Using Little Endian
+#
+ARCH_HAS_NO_MMU=y
+
+#
+# Target CPU lacks a memory management unit (MMU)
+#
+UCLIBC_HAS_FLOATS=y
+# UCLIBC_HAS_FPU is not set
+UCLIBC_HAS_SOFT_FLOAT=y
+DO_C99_MATH=y
+KERNEL_HEADERS=""
+UCLIBC_UCLINUX_BROKEN_MUNMAP=y
+EXCLUDE_BRK=y
+HAVE_DOT_CONFIG=y
+
+#
+# General Library Settings
+#
+HAVE_NO_PIC=y
+HAVE_NO_SHARED=y
+ARCH_HAS_NO_LDSO=y
+UCLIBC_CTOR_DTOR=y
+# HAS_NO_THREADS is not set
+UCLIBC_HAS_THREADS=y
+# PTHREADS_DEBUG_SUPPORT is not set
+LINUXTHREADS_OLD=y
+UCLIBC_HAS_LFS=y
+MALLOC=y
+# MALLOC_SIMPLE is not set
+# MALLOC_STANDARD is not set
+MALLOC_GLIBC_COMPAT=y
+UCLIBC_DYNAMIC_ATEXIT=y
+# COMPAT_ATEXIT is not set
+# UCLIBC_SUSV3_LEGACY is not set
+# UCLIBC_SUSV3_LEGACY_MACROS is not set
+UCLIBC_HAS_SHADOW=y
+# UCLIBC_HAS_PROGRAM_INVOCATION_NAME is not set
+UCLIBC_HAS___PROGNAME=y
+# UNIX98PTY_ONLY is not set
+ASSUME_DEVPTS=y
+UCLIBC_HAS_TM_EXTENSIONS=y
+UCLIBC_HAS_TZ_CACHING=y
+UCLIBC_HAS_TZ_FILE=y
+UCLIBC_HAS_TZ_FILE_READ_MANY=y
+UCLIBC_TZ_FILE_PATH="/etc/TZ"
+
+#
+# Advanced Library Settings
+#
+UCLIBC_PWD_BUFFER_SIZE=256
+UCLIBC_GRP_BUFFER_SIZE=256
+
+#
+# Networking Support
+#
+# UCLIBC_HAS_IPV6 is not set
+UCLIBC_HAS_RPC=y
+UCLIBC_HAS_FULL_RPC=y
+UCLIBC_HAS_REENTRANT_RPC=y
+# UCLIBC_USE_NETLINK is not set
+# UCLIBC_HAS_BSD_RES_CLOSE is not set
+
+#
+# String and Stdio Support
+#
+UCLIBC_HAS_STRING_GENERIC_OPT=y
+UCLIBC_HAS_STRING_ARCH_OPT=y
+UCLIBC_HAS_CTYPE_TABLES=y
+UCLIBC_HAS_CTYPE_SIGNED=y
+# UCLIBC_HAS_CTYPE_UNSAFE is not set
+UCLIBC_HAS_CTYPE_CHECKED=y
+# UCLIBC_HAS_CTYPE_ENFORCED is not set
+UCLIBC_HAS_WCHAR=y
+# UCLIBC_HAS_LOCALE is not set
+UCLIBC_HAS_HEXADECIMAL_FLOATS=y
+UCLIBC_HAS_GLIBC_CUSTOM_PRINTF=y
+UCLIBC_PRINTF_SCANF_POSITIONAL_ARGS=9
+UCLIBC_HAS_SCANF_GLIBC_A_FLAG=y
+# UCLIBC_HAS_STDIO_BUFSIZ_NONE is not set
+# UCLIBC_HAS_STDIO_BUFSIZ_256 is not set
+# UCLIBC_HAS_STDIO_BUFSIZ_512 is not set
+# UCLIBC_HAS_STDIO_BUFSIZ_1024 is not set
+# UCLIBC_HAS_STDIO_BUFSIZ_2048 is not set
+UCLIBC_HAS_STDIO_BUFSIZ_4096=y
+# UCLIBC_HAS_STDIO_BUFSIZ_8192 is not set
+UCLIBC_HAS_STDIO_BUILTIN_BUFFER_NONE=y
+# UCLIBC_HAS_STDIO_BUILTIN_BUFFER_4 is not set
+# UCLIBC_HAS_STDIO_BUILTIN_BUFFER_8 is not set
+# UCLIBC_HAS_STDIO_SHUTDOWN_ON_ABORT is not set
+UCLIBC_HAS_STDIO_GETC_MACRO=y
+UCLIBC_HAS_STDIO_PUTC_MACRO=y
+UCLIBC_HAS_STDIO_AUTO_RW_TRANSITION=y
+# UCLIBC_HAS_FOPEN_LARGEFILE_MODE is not set
+UCLIBC_HAS_FOPEN_EXCLUSIVE_MODE=y
+UCLIBC_HAS_GLIBC_CUSTOM_STREAMS=y
+UCLIBC_HAS_PRINTF_M_SPEC=y
+UCLIBC_HAS_ERRNO_MESSAGES=y
+# UCLIBC_HAS_SYS_ERRLIST is not set
+UCLIBC_HAS_SIGNUM_MESSAGES=y
+# UCLIBC_HAS_SYS_SIGLIST is not set
+UCLIBC_HAS_GNU_GETOPT=y
+UCLIBC_HAS_GNU_GETSUBOPT=y
+
+#
+# Big and Tall
+#
+UCLIBC_HAS_REGEX=y
+UCLIBC_HAS_REGEX_OLD=y
+UCLIBC_HAS_FNMATCH=y
+UCLIBC_HAS_FNMATCH_OLD=y
+# UCLIBC_HAS_WORDEXP is not set
+UCLIBC_HAS_FTW=y
+UCLIBC_HAS_GLOB=y
+UCLIBC_HAS_GNU_GLOB=y
+
+#
+# Library Installation Options
+#
+RUNTIME_PREFIX="/"
+DEVEL_PREFIX="/usr/"
+
+#
+# Security options
+#
+# UCLIBC_HAS_ARC4RANDOM is not set
+# HAVE_NO_SSP is not set
+# UCLIBC_HAS_SSP is not set
+# UCLIBC_BUILD_NOEXECSTACK is not set
+
+#
+# uClibc development/debugging options
+#
+CROSS_COMPILER_PREFIX=""
+UCLIBC_EXTRA_CFLAGS=""
+# DODEBUG is not set
+# DODEBUG_PT is not set
+DOSTRIP=y
+# DOASSERTS is not set
+# UCLIBC_MALLOC_DEBUGGING is not set
+WARNINGS="-Wall"
+# EXTRA_WARNINGS is not set
+# DOMULTI is not set
+# UCLIBC_MJN3_ONLY is not set
diff --git a/recipes/uclibc/uclibc-nios2-0.9.29/nios2/uClibc.config b/recipes/uclibc/uclibc-nios2-0.9.29/nios2/uClibc.config
new file mode 100644
index 0000000..d180532
--- /dev/null
+++ b/recipes/uclibc/uclibc-nios2-0.9.29/nios2/uClibc.config
@@ -0,0 +1,186 @@
+#
+# Automatically generated make config: don't edit
+# Wed Feb  4 08:55:49 2009
+#
+# TARGET_alpha is not set
+# TARGET_arm is not set
+# TARGET_bfin is not set
+# TARGET_cris is not set
+# TARGET_e1 is not set
+# TARGET_frv is not set
+# TARGET_h8300 is not set
+# TARGET_hppa is not set
+# TARGET_i386 is not set
+# TARGET_i960 is not set
+# TARGET_ia64 is not set
+# TARGET_m68k is not set
+# TARGET_microblaze is not set
+# TARGET_mips is not set
+# TARGET_nios is not set
+TARGET_nios2=y
+# TARGET_powerpc is not set
+# TARGET_sh is not set
+# TARGET_sh64 is not set
+# TARGET_sparc is not set
+# TARGET_v850 is not set
+# TARGET_vax is not set
+# TARGET_x86_64 is not set
+
+#
+# Target Architecture Features and Options
+#
+TARGET_ARCH="nios2"
+FORCE_OPTIONS_FOR_ARCH=y
+TARGET_SUBARCH=""
+# UCLIBC_FORMAT_ELF is not set
+# UCLIBC_FORMAT_FDPIC_ELF is not set
+UCLIBC_FORMAT_FLAT=y
+# UCLIBC_FORMAT_FLAT_SEP_DATA is not set
+# UCLIBC_FORMAT_SHARED_FLAT is not set
+ARCH_LITTLE_ENDIAN=y
+
+#
+# Using Little Endian
+#
+ARCH_HAS_NO_MMU=y
+
+#
+# Target CPU lacks a memory management unit (MMU)
+#
+UCLIBC_HAS_FLOATS=y
+# UCLIBC_HAS_FPU is not set
+UCLIBC_HAS_SOFT_FLOAT=y
+DO_C99_MATH=y
+KERNEL_HEADERS=""
+UCLIBC_UCLINUX_BROKEN_MUNMAP=y
+EXCLUDE_BRK=y
+HAVE_DOT_CONFIG=y
+
+#
+# General Library Settings
+#
+HAVE_NO_PIC=y
+HAVE_NO_SHARED=y
+ARCH_HAS_NO_LDSO=y
+UCLIBC_CTOR_DTOR=y
+# HAS_NO_THREADS is not set
+UCLIBC_HAS_THREADS=y
+# PTHREADS_DEBUG_SUPPORT is not set
+LINUXTHREADS_OLD=y
+UCLIBC_HAS_LFS=y
+MALLOC=y
+# MALLOC_SIMPLE is not set
+# MALLOC_STANDARD is not set
+MALLOC_GLIBC_COMPAT=y
+UCLIBC_DYNAMIC_ATEXIT=y
+# COMPAT_ATEXIT is not set
+# UCLIBC_SUSV3_LEGACY is not set
+# UCLIBC_SUSV3_LEGACY_MACROS is not set
+UCLIBC_HAS_SHADOW=y
+# UCLIBC_HAS_PROGRAM_INVOCATION_NAME is not set
+UCLIBC_HAS___PROGNAME=y
+# UNIX98PTY_ONLY is not set
+ASSUME_DEVPTS=y
+UCLIBC_HAS_TM_EXTENSIONS=y
+UCLIBC_HAS_TZ_CACHING=y
+UCLIBC_HAS_TZ_FILE=y
+UCLIBC_HAS_TZ_FILE_READ_MANY=y
+UCLIBC_TZ_FILE_PATH="/etc/TZ"
+
+#
+# Advanced Library Settings
+#
+UCLIBC_PWD_BUFFER_SIZE=256
+UCLIBC_GRP_BUFFER_SIZE=256
+
+#
+# Networking Support
+#
+# UCLIBC_HAS_IPV6 is not set
+UCLIBC_HAS_RPC=y
+UCLIBC_HAS_FULL_RPC=y
+UCLIBC_HAS_REENTRANT_RPC=y
+# UCLIBC_USE_NETLINK is not set
+# UCLIBC_HAS_BSD_RES_CLOSE is not set
+
+#
+# String and Stdio Support
+#
+UCLIBC_HAS_STRING_GENERIC_OPT=y
+UCLIBC_HAS_STRING_ARCH_OPT=y
+UCLIBC_HAS_CTYPE_TABLES=y
+UCLIBC_HAS_CTYPE_SIGNED=y
+# UCLIBC_HAS_CTYPE_UNSAFE is not set
+UCLIBC_HAS_CTYPE_CHECKED=y
+# UCLIBC_HAS_CTYPE_ENFORCED is not set
+UCLIBC_HAS_WCHAR=y
+# UCLIBC_HAS_LOCALE is not set
+UCLIBC_HAS_HEXADECIMAL_FLOATS=y
+UCLIBC_HAS_GLIBC_CUSTOM_PRINTF=y
+UCLIBC_PRINTF_SCANF_POSITIONAL_ARGS=9
+UCLIBC_HAS_SCANF_GLIBC_A_FLAG=y
+# UCLIBC_HAS_STDIO_BUFSIZ_NONE is not set
+# UCLIBC_HAS_STDIO_BUFSIZ_256 is not set
+# UCLIBC_HAS_STDIO_BUFSIZ_512 is not set
+# UCLIBC_HAS_STDIO_BUFSIZ_1024 is not set
+# UCLIBC_HAS_STDIO_BUFSIZ_2048 is not set
+UCLIBC_HAS_STDIO_BUFSIZ_4096=y
+# UCLIBC_HAS_STDIO_BUFSIZ_8192 is not set
+UCLIBC_HAS_STDIO_BUILTIN_BUFFER_NONE=y
+# UCLIBC_HAS_STDIO_BUILTIN_BUFFER_4 is not set
+# UCLIBC_HAS_STDIO_BUILTIN_BUFFER_8 is not set
+# UCLIBC_HAS_STDIO_SHUTDOWN_ON_ABORT is not set
+UCLIBC_HAS_STDIO_GETC_MACRO=y
+UCLIBC_HAS_STDIO_PUTC_MACRO=y
+UCLIBC_HAS_STDIO_AUTO_RW_TRANSITION=y
+# UCLIBC_HAS_FOPEN_LARGEFILE_MODE is not set
+UCLIBC_HAS_FOPEN_EXCLUSIVE_MODE=y
+UCLIBC_HAS_GLIBC_CUSTOM_STREAMS=y
+UCLIBC_HAS_PRINTF_M_SPEC=y
+UCLIBC_HAS_ERRNO_MESSAGES=y
+# UCLIBC_HAS_SYS_ERRLIST is not set
+UCLIBC_HAS_SIGNUM_MESSAGES=y
+# UCLIBC_HAS_SYS_SIGLIST is not set
+UCLIBC_HAS_GNU_GETOPT=y
+UCLIBC_HAS_GNU_GETSUBOPT=y
+
+#
+# Big and Tall
+#
+UCLIBC_HAS_REGEX=y
+UCLIBC_HAS_REGEX_OLD=y
+UCLIBC_HAS_FNMATCH=y
+UCLIBC_HAS_FNMATCH_OLD=y
+# UCLIBC_HAS_WORDEXP is not set
+UCLIBC_HAS_FTW=y
+UCLIBC_HAS_GLOB=y
+UCLIBC_HAS_GNU_GLOB=y
+
+#
+# Library Installation Options
+#
+RUNTIME_PREFIX="/"
+DEVEL_PREFIX="/usr/"
+
+#
+# Security options
+#
+# UCLIBC_HAS_ARC4RANDOM is not set
+# HAVE_NO_SSP is not set
+# UCLIBC_HAS_SSP is not set
+# UCLIBC_BUILD_NOEXECSTACK is not set
+
+#
+# uClibc development/debugging options
+#
+CROSS_COMPILER_PREFIX=""
+UCLIBC_EXTRA_CFLAGS=""
+# DODEBUG is not set
+# DODEBUG_PT is not set
+DOSTRIP=y
+# DOASSERTS is not set
+# UCLIBC_MALLOC_DEBUGGING is not set
+WARNINGS="-Wall"
+# EXTRA_WARNINGS is not set
+# DOMULTI is not set
+# UCLIBC_MJN3_ONLY is not set
diff --git a/recipes/uclibc/uclibc.inc b/recipes/uclibc/uclibc.inc
index 903aea2..f63efd7 100644
--- a/recipes/uclibc/uclibc.inc
+++ b/recipes/uclibc/uclibc.inc
@@ -176,8 +176,10 @@ do_install() {
         oe_runmake "SSP_ALL_CFLAGS=${TARGET_LINK_HASH_STYLE}" utils
         oe_runmake STRIPTOOL=true PREFIX=${D} DEVEL_PREFIX=${prefix}/ RUNTIME_PREFIX=/ \
                 install_utils
-	
-	# oe_runstrip needs +x on files	
-	chmod +x ${D}/${base_libdir}/*
+	# see gcc/gcc-configure-common.inc for SHARED_LIBRARIES
+	if [ "x$SHARED_LIBRARIESy" != "xnoy"; then
+		# oe_runstrip needs +x on files	
+		chmod +x ${D}/${base_libdir}/*
+	fi
 }
 
diff --git a/recipes/uclibc/uclibc_nios2-0.9.27.bb b/recipes/uclibc/uclibc_nios2-0.9.27.bb
new file mode 100644
index 0000000..1fd729d
--- /dev/null
+++ b/recipes/uclibc/uclibc_nios2-0.9.27.bb
@@ -0,0 +1,19 @@
+DEFAULT_PREFERENCE = "1"
+
+require uclibc.inc
+PR = "${INC_PR}.0"
+
+PROVIDES += "virtual/${TARGET_PREFIX}libc-for-gcc"
+
+SRC_URI += "http://127.0.0.1/uClibc-${PV}.tar.bz2"
+S = "${WORKDIR}/uClibc"
+
+#recent versions uclibc require real kernel headers
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+#as stated above, uclibc needs real kernel-headers
+#however: we can't depend on virtual/kernel when nptl hits due to depends deadlocking ....
+KERNEL_SOURCE = "${STAGING_DIR_HOST}/${exec_prefix}"
+
+#SRC_URI += "http://127.0.0.1/uClibc-${PV}.tar.bz2"
+#S = "${WORKDIR}/git"
diff --git a/recipes/uclibc/uclibc_nios2-0.9.29.bb b/recipes/uclibc/uclibc_nios2-0.9.29.bb
new file mode 100644
index 0000000..414101f
--- /dev/null
+++ b/recipes/uclibc/uclibc_nios2-0.9.29.bb
@@ -0,0 +1,28 @@
+DEFAULT_PREFERENCE = "1"
+
+require uclibc.inc
+PR = "${INC_PR}.0"
+
+PROVIDES += "virtual/${TARGET_PREFIX}libc-for-gcc"
+
+# from GIT
+SRC_URI = "git://sopc.et.ntust.edu.tw/git/uClibc.git;protocol=http"
+S = "${WORKDIR}/git"
+SRCREV = "e355ed8763cb157ac865bc298478f6ef8c984a11"
+
+# or from an archive:
+#SRC_URI = "http://127.0.0.1/uClibc-${PV}.tar.bz2"
+#S = "${WORKDIR}/uClibc"
+
+SRC_URI += "${@['${UCLIBC_LOCALE_URI}', ''][bb.data.getVar('USE_NLS', d, 1) != 'yes']} \
+file://uClibc.config \
+"
+
+#recent versions uclibc require real kernel headers
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+#as stated above, uclibc needs real kernel-headers
+#however: we can't depend on virtual/kernel when nptl hits due to depends deadlocking ....
+KERNEL_SOURCE = "${STAGING_DIR_HOST}/${exec_prefix}"
+
+
-- 
1.6.0.4



