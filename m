Received: from ey-out-1920.google.com ([74.125.78.147])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1NHPsR-0000cG-92
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Dec 2009 23:46:55 +0100
Received: by ey-out-1920.google.com with SMTP id 5so985082eyb.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Dec 2009 14:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=FGNxhJ205nycXozJq/KBW4wmvDjLHrRp4rudkGbvXek=;
	b=sk2+Fh0Z5iYKVYc/sz11GL70fdYpKfZ4ILAAyvMwnnH2iQZKBVoRAPnzsBTFWx6Cpe
	rIE9dSBAml8WtDnyZdJ7lcK7kQOad14t5bgYys4mlLgfIfV5ff5n1Ruq2DCO6qI6Flal
	6VQ5tiaVGmnXqIioxt+9HIc4OLYWFIp5yBtWs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Xqy9TpLmrEW7umkJ9j66H5zwVBZTJrBA8eXjYUNR9GToDwH3LBi6c7oe5leCqID51q
	DagEtZowzOIjj+vGu1uoCWstOezY/KcuKpIQOr0CYgOP/1Iw9SiLP1z05hdJcRLk6zgd
	lkamWrLjApvGLtIk6kMla7mbH3imK8b/xbpsI=
Received: by 10.213.97.22 with SMTP id j22mr6129766ebn.53.1260139514561;
	Sun, 06 Dec 2009 14:45:14 -0800 (PST)
Received: from localhost.localdomain (82-171-51-231.ip.telfort.nl
	[82.171.51.231])
	by mx.google.com with ESMTPS id 15sm3113864ewy.12.2009.12.06.14.45.13
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 06 Dec 2009 14:45:14 -0800 (PST)
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Dec 2009 23:44:51 +0100
Message-Id: <1260139496-21442-16-git-send-email-leon@sidebranch.com>
X-Mailer: git-send-email 1.6.0.4
In-Reply-To: <1260139496-21442-15-git-send-email-leon@sidebranch.com>
References: <1260139496-21442-1-git-send-email-leon@sidebranch.com>
	<1260139496-21442-2-git-send-email-leon@sidebranch.com>
	<1260139496-21442-3-git-send-email-leon@sidebranch.com>
	<1260139496-21442-4-git-send-email-leon@sidebranch.com>
	<1260139496-21442-5-git-send-email-leon@sidebranch.com>
	<1260139496-21442-6-git-send-email-leon@sidebranch.com>
	<1260139496-21442-7-git-send-email-leon@sidebranch.com>
	<1260139496-21442-8-git-send-email-leon@sidebranch.com>
	<1260139496-21442-9-git-send-email-leon@sidebranch.com>
	<1260139496-21442-10-git-send-email-leon@sidebranch.com>
	<1260139496-21442-11-git-send-email-leon@sidebranch.com>
	<1260139496-21442-12-git-send-email-leon@sidebranch.com>
	<1260139496-21442-13-git-send-email-leon@sidebranch.com>
	<1260139496-21442-14-git-send-email-leon@sidebranch.com>
	<1260139496-21442-15-git-send-email-leon@sidebranch.com>
X-SA-Exim-Connect-IP: 74.125.78.147
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Leon Woestenberg <leon@sidebranch.com>
Subject: [PATCH] uclibc-initial-nios2-0.9.29: For nios2, go to 0.9.29.
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
X-List-Received-Date: Sun, 06 Dec 2009 22:47:01 -0000

Signed-off-by: Leon Woestenberg <leon@sidebranch.com>
---
 conf/machine/include/nios2.inc                     |    2 +-
 recipes/uclibc/uclibc-initial_nios2-0.9.27.bb      |   32 ----
 recipes/uclibc/uclibc-initial_nios2-0.9.29.bb      |   32 ++++
 .../uclibc/uclibc-nios2-0.9.27/nios2/uClibc.config |  186 --------------------
 4 files changed, 33 insertions(+), 219 deletions(-)
 delete mode 100644 recipes/uclibc/uclibc-initial_nios2-0.9.27.bb
 create mode 100644 recipes/uclibc/uclibc-initial_nios2-0.9.29.bb
 delete mode 100644 recipes/uclibc/uclibc-nios2-0.9.27/nios2/uClibc.config

diff --git a/conf/machine/include/nios2.inc b/conf/machine/include/nios2.inc
index f5263a6..e23c72d 100644
--- a/conf/machine/include/nios2.inc
+++ b/conf/machine/include/nios2.inc
@@ -21,7 +21,7 @@ PREFERRED_VERSION_gcc-cross = "nios2-3.4.6"
 PREFERRED_VERSION_gcc-cross-initial = "nios2-3.4.6"
 PREFERRED_VERSION_gcc-cross-intermediate = "nios2-3.4.6"
 PREFERRED_VERSION_uclibc = "nios2-0.9.29"
-PREFERRED_VERSION_uclibc-initial = "nios2-0.9.27"
+PREFERRED_VERSION_uclibc-initial = "nios2-0.9.29"
 
 # Set default for 16MB machines - can be overridden for more or less flash.
 ROOT_FLASH_SIZE ?= "12"
diff --git a/recipes/uclibc/uclibc-initial_nios2-0.9.27.bb b/recipes/uclibc/uclibc-initial_nios2-0.9.27.bb
deleted file mode 100644
index 83c69a8..0000000
--- a/recipes/uclibc/uclibc-initial_nios2-0.9.27.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-SECTION = "base"
-require uclibc_${PV}.bb
-
-FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-${PV}', '${FILE_DIRNAME}/uclibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
-
-DEPENDS = "linux-libc-headers  ncurses-native virtual/${TARGET_PREFIX}gcc-initial"
-PROVIDES = "virtual/${TARGET_PREFIX}libc-initial"
-PACKAGES = ""
-
-do_install() {
-	# Install initial headers into the cross dir
-	make V=1 CC="${CC}" PREFIX=${D} DEVEL_PREFIX=${prefix}/ RUNTIME_PREFIX=/ \
-		install_headers #pregen install_dev
-	#ln -sf include ${CROSS_DIR}/${TARGET_SYS}/sys-include
-
-	# This conflicts with the c++ version of this header
-	rm -f ${D}${includedir}/bits/atomicity.h
-	install -d ${D}${libdir}/
-	install -m 644 lib/crt[1in].o ${D}${libdir}/
-	install -d ${D}${libdir}/
-	install -m 644 lib/libc.so ${D}${libdir}/
-}
-
-do_compile () {
-	make -j1 V=1 CC="${CC}" PREFIX=${D} DEVEL_PREFIX=${prefix}/ RUNTIME_PREFIX=/ \
-		lib/crt1.o lib/crti.o lib/crtn.o
-#               libc/sysdeps/linux/${TARGET_ARCH}/crt1.o \
-#               libc/sysdeps/linux/${TARGET_ARCH}/crti.o \
-#               libc/sysdeps/linux/${TARGET_ARCH}/crtn.o
-	${CC} -nostdlib -nostartfiles -shared -x c /dev/null \
-		-o lib/libc.so
-}
diff --git a/recipes/uclibc/uclibc-initial_nios2-0.9.29.bb b/recipes/uclibc/uclibc-initial_nios2-0.9.29.bb
new file mode 100644
index 0000000..83c69a8
--- /dev/null
+++ b/recipes/uclibc/uclibc-initial_nios2-0.9.29.bb
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
deleted file mode 100644
index d180532..0000000
--- a/recipes/uclibc/uclibc-nios2-0.9.27/nios2/uClibc.config
+++ /dev/null
@@ -1,186 +0,0 @@
-#
-# Automatically generated make config: don't edit
-# Wed Feb  4 08:55:49 2009
-#
-# TARGET_alpha is not set
-# TARGET_arm is not set
-# TARGET_bfin is not set
-# TARGET_cris is not set
-# TARGET_e1 is not set
-# TARGET_frv is not set
-# TARGET_h8300 is not set
-# TARGET_hppa is not set
-# TARGET_i386 is not set
-# TARGET_i960 is not set
-# TARGET_ia64 is not set
-# TARGET_m68k is not set
-# TARGET_microblaze is not set
-# TARGET_mips is not set
-# TARGET_nios is not set
-TARGET_nios2=y
-# TARGET_powerpc is not set
-# TARGET_sh is not set
-# TARGET_sh64 is not set
-# TARGET_sparc is not set
-# TARGET_v850 is not set
-# TARGET_vax is not set
-# TARGET_x86_64 is not set
-
-#
-# Target Architecture Features and Options
-#
-TARGET_ARCH="nios2"
-FORCE_OPTIONS_FOR_ARCH=y
-TARGET_SUBARCH=""
-# UCLIBC_FORMAT_ELF is not set
-# UCLIBC_FORMAT_FDPIC_ELF is not set
-UCLIBC_FORMAT_FLAT=y
-# UCLIBC_FORMAT_FLAT_SEP_DATA is not set
-# UCLIBC_FORMAT_SHARED_FLAT is not set
-ARCH_LITTLE_ENDIAN=y
-
-#
-# Using Little Endian
-#
-ARCH_HAS_NO_MMU=y
-
-#
-# Target CPU lacks a memory management unit (MMU)
-#
-UCLIBC_HAS_FLOATS=y
-# UCLIBC_HAS_FPU is not set
-UCLIBC_HAS_SOFT_FLOAT=y
-DO_C99_MATH=y
-KERNEL_HEADERS=""
-UCLIBC_UCLINUX_BROKEN_MUNMAP=y
-EXCLUDE_BRK=y
-HAVE_DOT_CONFIG=y
-
-#
-# General Library Settings
-#
-HAVE_NO_PIC=y
-HAVE_NO_SHARED=y
-ARCH_HAS_NO_LDSO=y
-UCLIBC_CTOR_DTOR=y
-# HAS_NO_THREADS is not set
-UCLIBC_HAS_THREADS=y
-# PTHREADS_DEBUG_SUPPORT is not set
-LINUXTHREADS_OLD=y
-UCLIBC_HAS_LFS=y
-MALLOC=y
-# MALLOC_SIMPLE is not set
-# MALLOC_STANDARD is not set
-MALLOC_GLIBC_COMPAT=y
-UCLIBC_DYNAMIC_ATEXIT=y
-# COMPAT_ATEXIT is not set
-# UCLIBC_SUSV3_LEGACY is not set
-# UCLIBC_SUSV3_LEGACY_MACROS is not set
-UCLIBC_HAS_SHADOW=y
-# UCLIBC_HAS_PROGRAM_INVOCATION_NAME is not set
-UCLIBC_HAS___PROGNAME=y
-# UNIX98PTY_ONLY is not set
-ASSUME_DEVPTS=y
-UCLIBC_HAS_TM_EXTENSIONS=y
-UCLIBC_HAS_TZ_CACHING=y
-UCLIBC_HAS_TZ_FILE=y
-UCLIBC_HAS_TZ_FILE_READ_MANY=y
-UCLIBC_TZ_FILE_PATH="/etc/TZ"
-
-#
-# Advanced Library Settings
-#
-UCLIBC_PWD_BUFFER_SIZE=256
-UCLIBC_GRP_BUFFER_SIZE=256
-
-#
-# Networking Support
-#
-# UCLIBC_HAS_IPV6 is not set
-UCLIBC_HAS_RPC=y
-UCLIBC_HAS_FULL_RPC=y
-UCLIBC_HAS_REENTRANT_RPC=y
-# UCLIBC_USE_NETLINK is not set
-# UCLIBC_HAS_BSD_RES_CLOSE is not set
-
-#
-# String and Stdio Support
-#
-UCLIBC_HAS_STRING_GENERIC_OPT=y
-UCLIBC_HAS_STRING_ARCH_OPT=y
-UCLIBC_HAS_CTYPE_TABLES=y
-UCLIBC_HAS_CTYPE_SIGNED=y
-# UCLIBC_HAS_CTYPE_UNSAFE is not set
-UCLIBC_HAS_CTYPE_CHECKED=y
-# UCLIBC_HAS_CTYPE_ENFORCED is not set
-UCLIBC_HAS_WCHAR=y
-# UCLIBC_HAS_LOCALE is not set
-UCLIBC_HAS_HEXADECIMAL_FLOATS=y
-UCLIBC_HAS_GLIBC_CUSTOM_PRINTF=y
-UCLIBC_PRINTF_SCANF_POSITIONAL_ARGS=9
-UCLIBC_HAS_SCANF_GLIBC_A_FLAG=y
-# UCLIBC_HAS_STDIO_BUFSIZ_NONE is not set
-# UCLIBC_HAS_STDIO_BUFSIZ_256 is not set
-# UCLIBC_HAS_STDIO_BUFSIZ_512 is not set
-# UCLIBC_HAS_STDIO_BUFSIZ_1024 is not set
-# UCLIBC_HAS_STDIO_BUFSIZ_2048 is not set
-UCLIBC_HAS_STDIO_BUFSIZ_4096=y
-# UCLIBC_HAS_STDIO_BUFSIZ_8192 is not set
-UCLIBC_HAS_STDIO_BUILTIN_BUFFER_NONE=y
-# UCLIBC_HAS_STDIO_BUILTIN_BUFFER_4 is not set
-# UCLIBC_HAS_STDIO_BUILTIN_BUFFER_8 is not set
-# UCLIBC_HAS_STDIO_SHUTDOWN_ON_ABORT is not set
-UCLIBC_HAS_STDIO_GETC_MACRO=y
-UCLIBC_HAS_STDIO_PUTC_MACRO=y
-UCLIBC_HAS_STDIO_AUTO_RW_TRANSITION=y
-# UCLIBC_HAS_FOPEN_LARGEFILE_MODE is not set
-UCLIBC_HAS_FOPEN_EXCLUSIVE_MODE=y
-UCLIBC_HAS_GLIBC_CUSTOM_STREAMS=y
-UCLIBC_HAS_PRINTF_M_SPEC=y
-UCLIBC_HAS_ERRNO_MESSAGES=y
-# UCLIBC_HAS_SYS_ERRLIST is not set
-UCLIBC_HAS_SIGNUM_MESSAGES=y
-# UCLIBC_HAS_SYS_SIGLIST is not set
-UCLIBC_HAS_GNU_GETOPT=y
-UCLIBC_HAS_GNU_GETSUBOPT=y
-
-#
-# Big and Tall
-#
-UCLIBC_HAS_REGEX=y
-UCLIBC_HAS_REGEX_OLD=y
-UCLIBC_HAS_FNMATCH=y
-UCLIBC_HAS_FNMATCH_OLD=y
-# UCLIBC_HAS_WORDEXP is not set
-UCLIBC_HAS_FTW=y
-UCLIBC_HAS_GLOB=y
-UCLIBC_HAS_GNU_GLOB=y
-
-#
-# Library Installation Options
-#
-RUNTIME_PREFIX="/"
-DEVEL_PREFIX="/usr/"
-
-#
-# Security options
-#
-# UCLIBC_HAS_ARC4RANDOM is not set
-# HAVE_NO_SSP is not set
-# UCLIBC_HAS_SSP is not set
-# UCLIBC_BUILD_NOEXECSTACK is not set
-
-#
-# uClibc development/debugging options
-#
-CROSS_COMPILER_PREFIX=""
-UCLIBC_EXTRA_CFLAGS=""
-# DODEBUG is not set
-# DODEBUG_PT is not set
-DOSTRIP=y
-# DOASSERTS is not set
-# UCLIBC_MALLOC_DEBUGGING is not set
-WARNINGS="-Wall"
-# EXTRA_WARNINGS is not set
-# DOMULTI is not set
-# UCLIBC_MJN3_ONLY is not set
-- 
1.6.0.4



