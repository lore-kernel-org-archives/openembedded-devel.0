Received: from smtp207.alice.it ([82.57.200.103])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Rzdci-0004Pd-76
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Feb 2012 01:30:28 +0100
Received: from mizar.localdomain (87.5.51.74) by smtp207.alice.it (8.6.023.02)
	id 4F05A6650581A857; Tue, 21 Feb 2012 01:22:11 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 21 Feb 2012 01:21:54 +0100
Message-Id: <1329783724-10816-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1329780628.git.andrea.adami@gmail.com>
References: <cover.1329780628.git.andrea.adami@gmail.com>
Subject: [meta-oe][PATCH 3/3] meta-initramfs: add kexec-tools-klibc from meta-oe
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
X-List-Received-Date: Tue, 21 Feb 2012 00:30:28 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../kexec/kexec-tools-klibc-2.0.2/elf.patch        |   94 +++++++++++++++++++
 .../kexec/kexec-tools-klibc-2.0.2/errno.patch      |   13 +++
 .../kexec/kexec-tools-klibc-2.0.2/other.patch      |   97 ++++++++++++++++++++
 .../kexec/kexec-tools-klibc-2.0.2/string.patch     |   11 ++
 .../kexec/kexec-tools-klibc-2.0.2/syscall.patch    |   46 +++++++++
 .../kexec/kexec-tools-klibc_2.0.2.bb               |   26 +++++
 .../kexec/kexec-tools-klibc-2.0.2/elf.patch        |   94 -------------------
 .../kexec/kexec-tools-klibc-2.0.2/errno.patch      |   13 ---
 .../kexec/kexec-tools-klibc-2.0.2/other.patch      |   97 --------------------
 .../kexec/kexec-tools-klibc-2.0.2/string.patch     |   11 --
 .../kexec/kexec-tools-klibc-2.0.2/syscall.patch    |   46 ---------
 .../kexec/kexec-tools-klibc_2.0.2.bb               |   26 -----
 12 files changed, 287 insertions(+), 287 deletions(-)
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/elf.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/errno.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/other.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/string.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/syscall.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb
 delete mode 100644 meta-oe/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/elf.patch
 delete mode 100644 meta-oe/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/errno.patch
 delete mode 100644 meta-oe/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/other.patch
 delete mode 100644 meta-oe/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/string.patch
 delete mode 100644 meta-oe/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/syscall.patch
 delete mode 100644 meta-oe/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb

diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/elf.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/elf.patch
new file mode 100644
index 0000000..0eef4b4
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/elf.patch
@@ -0,0 +1,94 @@
+Index: kexec-tools-2.0.2/kexec/kexec-elf-rel.c
+===================================================================
+--- kexec-tools-2.0.2.orig/kexec/kexec-elf-rel.c	2009-09-24 14:15:34.025828340 +0100
++++ kexec-tools-2.0.2/kexec/kexec-elf-rel.c	2009-09-24 14:15:47.030825302 +0100
+@@ -4,7 +4,7 @@
+ #include <stdio.h>
+ #include <errno.h>
+ #include <stdlib.h>
+-#include "elf.h"
++#include "../include/elf.h"
+ #include <boot/elf_boot.h>
+ #include "kexec.h"
+ #include "kexec-elf.h"
+Index: kexec-tools-2.0.2/kexec/crashdump.c
+===================================================================
+--- kexec-tools-2.0.2.orig/kexec/crashdump.c	2008-10-31 03:00:38.000000000 +0100
++++ kexec-tools-2.0.2/kexec/crashdump.c	2009-09-26 11:16:27.000000000 +0200
+@@ -26,7 +26,7 @@
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ #include <unistd.h>
+-#include <elf.h>
++#include "../../../include/elf.h"
+ #include "kexec.h"
+ #include "crashdump.h"
+ #include "kexec-syscall.h"
+
+Index: kexec-tools-2.0.2/kexec/crashdump-xen.c
+===================================================================
+--- kexec-tools-2.0.2.orig/kexec/crashdump-xen.c	2008-07-15 02:46:43.000000000 +0200
++++ kexec-tools-2.0.2/kexec/crashdump-xen.c	2009-09-26 11:16:41.000000000 +0200
+@@ -3,7 +3,7 @@
+ #include <stdarg.h>
+ #include <string.h>
+ #include <stdlib.h>
+-#include <elf.h>
++#include "../../../include/elf.h"
+ #include <errno.h>
+ #include <limits.h>
+ #include <sys/types.h>
+
+Index: kexec-tools-2.0.2/kexec/arch/arm/kexec-elf-rel-arm.c
+===================================================================
+--- kexec-tools-2.0.2.orig/kexec/arch/arm/kexec-elf-rel-arm.c	2009-04-24 14:15:46.934825202 +0100
++++ kexec-tools-2.0.2/kexec/arch/arm/kexec-elf-rel-arm.c	2009-09-24 14:15:47.014827381 +0100
+@@ -1,5 +1,5 @@
+ #include <stdio.h>
+-#include <elf.h>
++#include "../../../include/elf.h"
+ #include "../../kexec.h"
+ #include "../../kexec-elf.h"
+
+Index: kexec-tools-2.0.2/kexec/kexec-elf-boot.c
+===================================================================
+--- kexec-tools-2.0.2.orig/kexec/kexec-elf-boot.c	2009-05-16 13:28:19.000000000 +0200
++++ kexec-tools-2.0.2/kexec/kexec-elf-boot.c	2009-09-16 11:13:28.000000000 +0200
+@@ -22,7 +22,7 @@
+ #include <string.h>
+ #include <stdlib.h>
+ #include <errno.h>
+-#include <elf.h>
++#include "../include/elf.h"
+ #include <boot/elf_boot.h>
+ #include <ip_checksum.h>
+ #include <x86/x86-linux.h>
+
+Index: kexec-tools-2.0.2/kdump/kdump.c
+===================================================================
+--- kexec-tools-2.0.2.orig/kdump/kdump.c	2009-05-16 13:28:19.000000000 +0200
++++ kexec-tools-2.0.2/kdump/kdump.c	2009-09-16 11:13:08.000000000 +0200
+@@ -8,7 +8,7 @@
+ #include <sys/stat.h>
+ #include <fcntl.h>
+ #include <endian.h>
+-#include <elf.h>
++#include "../include/elf.h"
+
+ #if !defined(__BYTE_ORDER) || !defined(__LITTLE_ENDIAN) || !defined(__BIG_ENDIAN)
+ #error Endian defines missing
+
+Index: kexec-tools-2.0.2/kexec/arch/arm/crashdump-arm.c
+===================================================================
+--- kexec-tools-2.0.2.old/kexec/arch/arm/crashdump-arm.c	2010-08-01 15:07:47.000000000 +0200
++++ kexec-tools-2.0.2/kexec/arch/arm/crashdump-arm.c	2010-07-29 06:19:59.000000000 +0200
+@@ -20,7 +20,7 @@
+  * along with this program; if not, write to the Free Software
+  * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+  */
+-#include <elf.h>
++#include "../../../include/elf.h"
+ #include <errno.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/errno.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/errno.patch
new file mode 100644
index 0000000..c56b5a9
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/errno.patch
@@ -0,0 +1,13 @@
+Index: kexec-tools-2.0.2/kexec/ifdown.c
+===================================================================
+--- kexec-tools-2.0.2.orig/kexec/ifdown.c	2009-09-24 14:15:34.025828340 +0100
++++ kexec-tools-2.0.2/kexec/ifdown.c	2009-09-24 14:15:47.014827381 +0100
+@@ -14,7 +14,7 @@
+ #include <sys/ioctl.h>
+ #include <sys/socket.h>
+ #include <sys/time.h>
+-#include <sys/errno.h>
++#include <errno.h>
+
+ #include <net/if.h>
+ #include <netinet/in.h>
\ No newline at end of file
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/other.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/other.patch
new file mode 100644
index 0000000..f6efaeb
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/other.patch
@@ -0,0 +1,97 @@
+Index: kexec-tools-2.0.2/kexec/crashdump-elf.c
+===================================================================
+--- kexec-tools-2.0.2.orig/kexec/crashdump-elf.c	2008-10-31 03:00:38.000000000 +0100
++++ kexec-tools-2.0.2/kexec/crashdump-elf.c	2009-09-26 11:17:57.000000000 +0200
+@@ -47,7 +47,8 @@
+	if (xen_present())
+		nr_cpus = xen_get_nr_phys_cpus();
+	else
+-		nr_cpus = sysconf(_SC_NPROCESSORS_CONF);
++		/*nr_cpus = sysconf(_SC_NPROCESSORS_CONF);*/
++		nr_cpus = 1;
+
+	if (nr_cpus < 0) {
+		return -1;
+
+Index: kexec-tools-2.0.2/kexec/arch/arm/kexec-zImage-arm.c
+===================================================================
+--- kexec-tools-2.0.2.orig/kexec/arch/arm/kexec-zImage-arm.c	2009-04-24 14:15:46.982825391 +0100
++++ kexec-tools-2.0.2/kexec/arch/arm/kexec-zImage-arm.c	2009-09-26 01:58:20.838624318 +0200
+@@ -2,6 +2,10 @@
+  * - 08/21/2007 ATAG support added by Uli Luckas <u.luckas@road.de>
+  *
+  */
++
++/* work around for linux header files */
++#define __deprecated
++
+ #define _GNU_SOURCE
+ #define _XOPEN_SOURCE
+ #include <stdio.h>
+
+Index: kexec-tools-2.0.2/kexec/kexec.h
+===================================================================
+--- kexec-tools-2.0.2.orig/kexec/kexec.h	2008-05-16 13:28:19.000000000 +0200
++++ kexec-tools-2.0.2/kexec/kexec.h	2009-09-16 17:32:15.000000000 +0200
+@@ -204,7 +204,7 @@
+ extern char *slurp_file(const char *filename, off_t *r_size);
+ extern char *slurp_file_len(const char *filename, off_t size);
+ extern char *slurp_decompress_file(const char *filename, off_t *r_size);
+-extern unsigned long virt_to_phys(unsigned long addr);
++/* extern unsigned long virt_to_phys(unsigned long addr); */
+ extern void add_segment(struct kexec_info *info,
+	const void *buf, size_t bufsz, unsigned long base, size_t memsz);
+ extern void add_segment_phys_virt(struct kexec_info *info,
+
+Index: kexec-tools-2.0.2/Makefile.in
+===================================================================
+--- kexec-tools-2.0.2.orig/Makefile.in	2009-09-29 23:49:47.000000000 +0200
++++ kexec-tools-2.0.2/Makefile.in	2009-09-29 23:49:09.000000000 +0200
+@@ -46,7 +46,7 @@
+ # where necessary.
+ CPPFLAGS	= @CPPFLAGS@ -I$(srcdir)/include -I$(srcdir)/util_lib/include \
+			-Iinclude/
+-CFLAGS		= @CFLAGS@ -fno-strict-aliasing -Wall -Wstrict-prototypes
++CFLAGS		= @CFLAGS@ -static -fno-strict-aliasing -Wall -Wstrict-prototypes
+ PURGATORY_EXTRA_CFLAGS = @PURGATORY_EXTRA_CFLAGS@
+ ASFLAGS		= @ASFLAGS@
+ LDFLAGS		= @LDFLAGS@
+
+Index: kexec-tools-2.0.2/util_lib/include/sha256.h
+===================================================================
+--- kexec-tools-2.0.2.orig/util_lib/include/sha256.h	2008-07-15 02:46:43.000000000 +0200
++++ kexec-tools-2.0.2/util_lib/include/sha256.h		2009-10-02 18:28:45.000000000 +0200
+@@ -1,7 +1,8 @@
+ #ifndef SHA256_H
+ #define SHA256_H
+
+-#include <sys/types.h>
++//#include <sys/types.h>
++#include <stddef.h>
+ #include <stdint.h>
+
+ typedef struct
+
+Index: kexec-tools-2.0.2/purgatory/Makefile
+===================================================================
+--- kexec-tools-2.0.2.orig/purgatory/Makefile	2008-10-09 00:32:14.000000000 +0200
++++ kexec-tools-2.0.2.orig/purgatory/Makefile	2009-10-03 00:28:45.000000000 +0200
+@@ -47,7 +47,7 @@
+ $(PURGATORY): CC=$(TARGET_CC)
+ $(PURGATORY): CFLAGS+=$(PURGATORY_EXTRA_CFLAGS) \
+		      $($(ARCH)_PURGATORY_EXTRA_CFLAGS) \
+-		      -Os -fno-builtin -ffreestanding
++		      -Os -fno-builtin -ffreestanding -nostdinc
+
+ $(PURGATORY): CPPFLAGS=$($(ARCH)_PURGATORY_EXTRA_CFLAGS) \
+			-I$(srcdir)/purgatory/include \
+@@ -61,7 +61,8 @@
+
+ $(PURGATORY): $(PURGATORY_OBJS)
+	$(MKDIR) -p $(@D)
+-	$(CC) $(LDFLAGS) -o $@ $^
++#	$(CC) $(LDFLAGS) -o $@ $^
++	$(LD) $(LDFLAGS) -o $@ $^
+
+ #	$(LD) $(LDFLAGS) $(EXTRA_LDFLAGS) --no-undefined -e purgatory_start -r -o $@ $(PURGATORY_OBJS) $(UTIL_LIB)
+
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/string.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/string.patch
new file mode 100644
index 0000000..7d27e39
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/string.patch
@@ -0,0 +1,11 @@
+Index: kexec-tools-2.0.2/purgatory/string.c
+===================================================================
+--- kexec-tools-2.0.2.orig/purgatory/string.c	2008-05-16 13:28:19.000000000 +0200
++++ kexec-tools-2.0.2/purgatory/string.c	2009-09-16 17:49:04.000000000 +0200
+@@ -1,5 +1,5 @@
+ #include <stddef.h>
+-#include <string.h>
++/* #include <string.h> */
+
+ size_t strnlen(const char *s, size_t max)
+ {
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/syscall.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/syscall.patch
new file mode 100644
index 0000000..ae2e3f6
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/syscall.patch
@@ -0,0 +1,46 @@
+Index: kexec-tools-2.0.2/kexec/kexec-syscall.h
+===================================================================
+--- kexec-tools-2.0.2.orig/kexec/kexec-syscall.h	2010-07-29 06:19:59.000000000 +0200
++++ kexec-tools-2.0.2/kexec/kexec-syscall.h	2010-08-02 00:13:39.000000000 +0200
+@@ -2,7 +2,7 @@
+ #define KEXEC_SYSCALL_H
+ 
+ #define __LIBRARY__
+-#include <syscall.h>
++/*#include <syscall.h>*/
+ #include <sys/syscall.h>
+ #include <unistd.h>
+ 
+@@ -23,6 +23,7 @@
+ #define LINUX_REBOOT_CMD_KEXEC		0x45584543
+ 
+ #ifndef __NR_kexec_load
++/*
+ #ifdef __i386__
+ #define __NR_kexec_load		283
+ #endif
+@@ -61,19 +62,21 @@
+ #ifndef __NR_kexec_load
+ #error Unknown processor architecture.  Needs a kexec_load syscall number.
+ #endif
++*/
+ #endif /*ifndef __NR_kexec_load*/
+ 
+ struct kexec_segment;
+-
++/*
+ static inline long kexec_load(void *entry, unsigned long nr_segments,
+ 			struct kexec_segment *segments, unsigned long flags)
+ {
+ 	return (long) syscall(__NR_kexec_load, entry, nr_segments, segments, flags);
+ }
+-
++*/
+ static inline long kexec_reboot(void)
+ {
+-	return (long) syscall(__NR_reboot, LINUX_REBOOT_MAGIC1, LINUX_REBOOT_MAGIC2, LINUX_REBOOT_CMD_KEXEC, 0);
++	//return (long) syscall(__NR_reboot, LINUX_REBOOT_MAGIC1, LINUX_REBOOT_MAGIC2, LINUX_REBOOT_CMD_KEXEC, 0);
++	return __reboot(LINUX_REBOOT_MAGIC1, LINUX_REBOOT_MAGIC2, LINUX_REBOOT_CMD_KEXEC, 0);
+ }
+ 
+ 
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb
new file mode 100644
index 0000000..9c35330
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb
@@ -0,0 +1,26 @@
+# the binaries are statically linked against klibc
+require recipes-kernel/kexec/kexec-tools.inc
+SRC_URI[md5sum] = "bc401cf3262b25ff7c9a51fc76c8ab91"
+SRC_URI[sha256sum] = "549ab65c18a2229b6bf21b6875ca6bbe0e579bca08c3543ce6aaf8287a0b4188"
+
+inherit klibc
+
+FILESPATH =. "${FILE_DIRNAME}/kexec-tools-${PV}:"
+
+SRC_URI += "file://elf.patch \
+            file://errno.patch \
+            file://string.patch \
+            file://syscall.patch \
+            file://other.patch \
+            "
+
+S = "${WORKDIR}/kexec-tools-${PV}"
+
+EXTRA_OECONF += "--without-zlib"
+
+PACKAGES =+ "kexec-klibc kdump-klibc"
+
+CFLAGS += "-I${STAGING_DIR_HOST}${base_libdir}/klibc/include -I${STAGING_DIR_HOST}${base_libdir}/klibc/include/bits32"
+
+FILES_kexec-klibc = "${sbindir}/kexec"
+FILES_kdump-klibc = "${sbindir}/kdump"
diff --git a/meta-oe/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/elf.patch b/meta-oe/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/elf.patch
deleted file mode 100644
index 0eef4b4..0000000
--- a/meta-oe/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/elf.patch
+++ /dev/null
@@ -1,94 +0,0 @@
-Index: kexec-tools-2.0.2/kexec/kexec-elf-rel.c
-===================================================================
---- kexec-tools-2.0.2.orig/kexec/kexec-elf-rel.c	2009-09-24 14:15:34.025828340 +0100
-+++ kexec-tools-2.0.2/kexec/kexec-elf-rel.c	2009-09-24 14:15:47.030825302 +0100
-@@ -4,7 +4,7 @@
- #include <stdio.h>
- #include <errno.h>
- #include <stdlib.h>
--#include "elf.h"
-+#include "../include/elf.h"
- #include <boot/elf_boot.h>
- #include "kexec.h"
- #include "kexec-elf.h"
-Index: kexec-tools-2.0.2/kexec/crashdump.c
-===================================================================
---- kexec-tools-2.0.2.orig/kexec/crashdump.c	2008-10-31 03:00:38.000000000 +0100
-+++ kexec-tools-2.0.2/kexec/crashdump.c	2009-09-26 11:16:27.000000000 +0200
-@@ -26,7 +26,7 @@
- #include <sys/types.h>
- #include <sys/stat.h>
- #include <unistd.h>
--#include <elf.h>
-+#include "../../../include/elf.h"
- #include "kexec.h"
- #include "crashdump.h"
- #include "kexec-syscall.h"
-
-Index: kexec-tools-2.0.2/kexec/crashdump-xen.c
-===================================================================
---- kexec-tools-2.0.2.orig/kexec/crashdump-xen.c	2008-07-15 02:46:43.000000000 +0200
-+++ kexec-tools-2.0.2/kexec/crashdump-xen.c	2009-09-26 11:16:41.000000000 +0200
-@@ -3,7 +3,7 @@
- #include <stdarg.h>
- #include <string.h>
- #include <stdlib.h>
--#include <elf.h>
-+#include "../../../include/elf.h"
- #include <errno.h>
- #include <limits.h>
- #include <sys/types.h>
-
-Index: kexec-tools-2.0.2/kexec/arch/arm/kexec-elf-rel-arm.c
-===================================================================
---- kexec-tools-2.0.2.orig/kexec/arch/arm/kexec-elf-rel-arm.c	2009-04-24 14:15:46.934825202 +0100
-+++ kexec-tools-2.0.2/kexec/arch/arm/kexec-elf-rel-arm.c	2009-09-24 14:15:47.014827381 +0100
-@@ -1,5 +1,5 @@
- #include <stdio.h>
--#include <elf.h>
-+#include "../../../include/elf.h"
- #include "../../kexec.h"
- #include "../../kexec-elf.h"
-
-Index: kexec-tools-2.0.2/kexec/kexec-elf-boot.c
-===================================================================
---- kexec-tools-2.0.2.orig/kexec/kexec-elf-boot.c	2009-05-16 13:28:19.000000000 +0200
-+++ kexec-tools-2.0.2/kexec/kexec-elf-boot.c	2009-09-16 11:13:28.000000000 +0200
-@@ -22,7 +22,7 @@
- #include <string.h>
- #include <stdlib.h>
- #include <errno.h>
--#include <elf.h>
-+#include "../include/elf.h"
- #include <boot/elf_boot.h>
- #include <ip_checksum.h>
- #include <x86/x86-linux.h>
-
-Index: kexec-tools-2.0.2/kdump/kdump.c
-===================================================================
---- kexec-tools-2.0.2.orig/kdump/kdump.c	2009-05-16 13:28:19.000000000 +0200
-+++ kexec-tools-2.0.2/kdump/kdump.c	2009-09-16 11:13:08.000000000 +0200
-@@ -8,7 +8,7 @@
- #include <sys/stat.h>
- #include <fcntl.h>
- #include <endian.h>
--#include <elf.h>
-+#include "../include/elf.h"
-
- #if !defined(__BYTE_ORDER) || !defined(__LITTLE_ENDIAN) || !defined(__BIG_ENDIAN)
- #error Endian defines missing
-
-Index: kexec-tools-2.0.2/kexec/arch/arm/crashdump-arm.c
-===================================================================
---- kexec-tools-2.0.2.old/kexec/arch/arm/crashdump-arm.c	2010-08-01 15:07:47.000000000 +0200
-+++ kexec-tools-2.0.2/kexec/arch/arm/crashdump-arm.c	2010-07-29 06:19:59.000000000 +0200
-@@ -20,7 +20,7 @@
-  * along with this program; if not, write to the Free Software
-  * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
-  */
--#include <elf.h>
-+#include "../../../include/elf.h"
- #include <errno.h>
- #include <stdio.h>
- #include <stdlib.h>
-
diff --git a/meta-oe/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/errno.patch b/meta-oe/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/errno.patch
deleted file mode 100644
index c56b5a9..0000000
--- a/meta-oe/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/errno.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: kexec-tools-2.0.2/kexec/ifdown.c
-===================================================================
---- kexec-tools-2.0.2.orig/kexec/ifdown.c	2009-09-24 14:15:34.025828340 +0100
-+++ kexec-tools-2.0.2/kexec/ifdown.c	2009-09-24 14:15:47.014827381 +0100
-@@ -14,7 +14,7 @@
- #include <sys/ioctl.h>
- #include <sys/socket.h>
- #include <sys/time.h>
--#include <sys/errno.h>
-+#include <errno.h>
-
- #include <net/if.h>
- #include <netinet/in.h>
\ No newline at end of file
diff --git a/meta-oe/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/other.patch b/meta-oe/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/other.patch
deleted file mode 100644
index f6efaeb..0000000
--- a/meta-oe/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/other.patch
+++ /dev/null
@@ -1,97 +0,0 @@
-Index: kexec-tools-2.0.2/kexec/crashdump-elf.c
-===================================================================
---- kexec-tools-2.0.2.orig/kexec/crashdump-elf.c	2008-10-31 03:00:38.000000000 +0100
-+++ kexec-tools-2.0.2/kexec/crashdump-elf.c	2009-09-26 11:17:57.000000000 +0200
-@@ -47,7 +47,8 @@
-	if (xen_present())
-		nr_cpus = xen_get_nr_phys_cpus();
-	else
--		nr_cpus = sysconf(_SC_NPROCESSORS_CONF);
-+		/*nr_cpus = sysconf(_SC_NPROCESSORS_CONF);*/
-+		nr_cpus = 1;
-
-	if (nr_cpus < 0) {
-		return -1;
-
-Index: kexec-tools-2.0.2/kexec/arch/arm/kexec-zImage-arm.c
-===================================================================
---- kexec-tools-2.0.2.orig/kexec/arch/arm/kexec-zImage-arm.c	2009-04-24 14:15:46.982825391 +0100
-+++ kexec-tools-2.0.2/kexec/arch/arm/kexec-zImage-arm.c	2009-09-26 01:58:20.838624318 +0200
-@@ -2,6 +2,10 @@
-  * - 08/21/2007 ATAG support added by Uli Luckas <u.luckas@road.de>
-  *
-  */
-+
-+/* work around for linux header files */
-+#define __deprecated
-+
- #define _GNU_SOURCE
- #define _XOPEN_SOURCE
- #include <stdio.h>
-
-Index: kexec-tools-2.0.2/kexec/kexec.h
-===================================================================
---- kexec-tools-2.0.2.orig/kexec/kexec.h	2008-05-16 13:28:19.000000000 +0200
-+++ kexec-tools-2.0.2/kexec/kexec.h	2009-09-16 17:32:15.000000000 +0200
-@@ -204,7 +204,7 @@
- extern char *slurp_file(const char *filename, off_t *r_size);
- extern char *slurp_file_len(const char *filename, off_t size);
- extern char *slurp_decompress_file(const char *filename, off_t *r_size);
--extern unsigned long virt_to_phys(unsigned long addr);
-+/* extern unsigned long virt_to_phys(unsigned long addr); */
- extern void add_segment(struct kexec_info *info,
-	const void *buf, size_t bufsz, unsigned long base, size_t memsz);
- extern void add_segment_phys_virt(struct kexec_info *info,
-
-Index: kexec-tools-2.0.2/Makefile.in
-===================================================================
---- kexec-tools-2.0.2.orig/Makefile.in	2009-09-29 23:49:47.000000000 +0200
-+++ kexec-tools-2.0.2/Makefile.in	2009-09-29 23:49:09.000000000 +0200
-@@ -46,7 +46,7 @@
- # where necessary.
- CPPFLAGS	= @CPPFLAGS@ -I$(srcdir)/include -I$(srcdir)/util_lib/include \
-			-Iinclude/
--CFLAGS		= @CFLAGS@ -fno-strict-aliasing -Wall -Wstrict-prototypes
-+CFLAGS		= @CFLAGS@ -static -fno-strict-aliasing -Wall -Wstrict-prototypes
- PURGATORY_EXTRA_CFLAGS = @PURGATORY_EXTRA_CFLAGS@
- ASFLAGS		= @ASFLAGS@
- LDFLAGS		= @LDFLAGS@
-
-Index: kexec-tools-2.0.2/util_lib/include/sha256.h
-===================================================================
---- kexec-tools-2.0.2.orig/util_lib/include/sha256.h	2008-07-15 02:46:43.000000000 +0200
-+++ kexec-tools-2.0.2/util_lib/include/sha256.h		2009-10-02 18:28:45.000000000 +0200
-@@ -1,7 +1,8 @@
- #ifndef SHA256_H
- #define SHA256_H
-
--#include <sys/types.h>
-+//#include <sys/types.h>
-+#include <stddef.h>
- #include <stdint.h>
-
- typedef struct
-
-Index: kexec-tools-2.0.2/purgatory/Makefile
-===================================================================
---- kexec-tools-2.0.2.orig/purgatory/Makefile	2008-10-09 00:32:14.000000000 +0200
-+++ kexec-tools-2.0.2.orig/purgatory/Makefile	2009-10-03 00:28:45.000000000 +0200
-@@ -47,7 +47,7 @@
- $(PURGATORY): CC=$(TARGET_CC)
- $(PURGATORY): CFLAGS+=$(PURGATORY_EXTRA_CFLAGS) \
-		      $($(ARCH)_PURGATORY_EXTRA_CFLAGS) \
--		      -Os -fno-builtin -ffreestanding
-+		      -Os -fno-builtin -ffreestanding -nostdinc
-
- $(PURGATORY): CPPFLAGS=$($(ARCH)_PURGATORY_EXTRA_CFLAGS) \
-			-I$(srcdir)/purgatory/include \
-@@ -61,7 +61,8 @@
-
- $(PURGATORY): $(PURGATORY_OBJS)
-	$(MKDIR) -p $(@D)
--	$(CC) $(LDFLAGS) -o $@ $^
-+#	$(CC) $(LDFLAGS) -o $@ $^
-+	$(LD) $(LDFLAGS) -o $@ $^
-
- #	$(LD) $(LDFLAGS) $(EXTRA_LDFLAGS) --no-undefined -e purgatory_start -r -o $@ $(PURGATORY_OBJS) $(UTIL_LIB)
-
diff --git a/meta-oe/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/string.patch b/meta-oe/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/string.patch
deleted file mode 100644
index 7d27e39..0000000
--- a/meta-oe/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/string.patch
+++ /dev/null
@@ -1,11 +0,0 @@
-Index: kexec-tools-2.0.2/purgatory/string.c
-===================================================================
---- kexec-tools-2.0.2.orig/purgatory/string.c	2008-05-16 13:28:19.000000000 +0200
-+++ kexec-tools-2.0.2/purgatory/string.c	2009-09-16 17:49:04.000000000 +0200
-@@ -1,5 +1,5 @@
- #include <stddef.h>
--#include <string.h>
-+/* #include <string.h> */
-
- size_t strnlen(const char *s, size_t max)
- {
diff --git a/meta-oe/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/syscall.patch b/meta-oe/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/syscall.patch
deleted file mode 100644
index ae2e3f6..0000000
--- a/meta-oe/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/syscall.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-Index: kexec-tools-2.0.2/kexec/kexec-syscall.h
-===================================================================
---- kexec-tools-2.0.2.orig/kexec/kexec-syscall.h	2010-07-29 06:19:59.000000000 +0200
-+++ kexec-tools-2.0.2/kexec/kexec-syscall.h	2010-08-02 00:13:39.000000000 +0200
-@@ -2,7 +2,7 @@
- #define KEXEC_SYSCALL_H
- 
- #define __LIBRARY__
--#include <syscall.h>
-+/*#include <syscall.h>*/
- #include <sys/syscall.h>
- #include <unistd.h>
- 
-@@ -23,6 +23,7 @@
- #define LINUX_REBOOT_CMD_KEXEC		0x45584543
- 
- #ifndef __NR_kexec_load
-+/*
- #ifdef __i386__
- #define __NR_kexec_load		283
- #endif
-@@ -61,19 +62,21 @@
- #ifndef __NR_kexec_load
- #error Unknown processor architecture.  Needs a kexec_load syscall number.
- #endif
-+*/
- #endif /*ifndef __NR_kexec_load*/
- 
- struct kexec_segment;
--
-+/*
- static inline long kexec_load(void *entry, unsigned long nr_segments,
- 			struct kexec_segment *segments, unsigned long flags)
- {
- 	return (long) syscall(__NR_kexec_load, entry, nr_segments, segments, flags);
- }
--
-+*/
- static inline long kexec_reboot(void)
- {
--	return (long) syscall(__NR_reboot, LINUX_REBOOT_MAGIC1, LINUX_REBOOT_MAGIC2, LINUX_REBOOT_CMD_KEXEC, 0);
-+	//return (long) syscall(__NR_reboot, LINUX_REBOOT_MAGIC1, LINUX_REBOOT_MAGIC2, LINUX_REBOOT_CMD_KEXEC, 0);
-+	return __reboot(LINUX_REBOOT_MAGIC1, LINUX_REBOOT_MAGIC2, LINUX_REBOOT_CMD_KEXEC, 0);
- }
- 
- 
diff --git a/meta-oe/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb b/meta-oe/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb
deleted file mode 100644
index 9c35330..0000000
--- a/meta-oe/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-# the binaries are statically linked against klibc
-require recipes-kernel/kexec/kexec-tools.inc
-SRC_URI[md5sum] = "bc401cf3262b25ff7c9a51fc76c8ab91"
-SRC_URI[sha256sum] = "549ab65c18a2229b6bf21b6875ca6bbe0e579bca08c3543ce6aaf8287a0b4188"
-
-inherit klibc
-
-FILESPATH =. "${FILE_DIRNAME}/kexec-tools-${PV}:"
-
-SRC_URI += "file://elf.patch \
-            file://errno.patch \
-            file://string.patch \
-            file://syscall.patch \
-            file://other.patch \
-            "
-
-S = "${WORKDIR}/kexec-tools-${PV}"
-
-EXTRA_OECONF += "--without-zlib"
-
-PACKAGES =+ "kexec-klibc kdump-klibc"
-
-CFLAGS += "-I${STAGING_DIR_HOST}${base_libdir}/klibc/include -I${STAGING_DIR_HOST}${base_libdir}/klibc/include/bits32"
-
-FILES_kexec-klibc = "${sbindir}/kexec"
-FILES_kdump-klibc = "${sbindir}/kdump"
-- 
1.7.3.4



