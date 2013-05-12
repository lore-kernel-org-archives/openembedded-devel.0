Received: from mail-ee0-f53.google.com ([74.125.83.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Ubft0-0007hp-RZ
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 May 2013 01:41:03 +0200
Received: by mail-ee0-f53.google.com with SMTP id d49so3259583eek.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 May 2013 16:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=RYJpydLYlcUYxx7/F/mwynaEM9w4NjCRUp6TURIADW4=;
	b=VGA+QSdSb2qiBR4tRYbxAS0e2ns/WpgjGQUKBR2qrCUOZw3srTx0JH3DBga1uRG0g8
	sAuAwq/ByLMZtxoJJdDHNI4e1tpDsZMPmwDUlwto0XGTJ+43ls8ZFpN7rDSfMufq5yUJ
	ic+0hAawQrzj3oAX95nLcyIMtRfmORKs0OwZlDF+5gajJfRL2hniVYeW9RNBndHYFLDt
	ZLpLI7fqFshtpnYyqqWw+1/A6tIXB5qPatpMQRX6Z8md8VLyjRoCYIXH6nSulqO7WSka
	Cq+TWQmFmcgF+pLeTpup4h1ae42aRLVCqeS0a6jSApUmdmlFjXOGRHrd2qAxKEXvzVfR
	8G8g==
X-Received: by 10.14.100.1 with SMTP id y1mr72099251eef.9.1368400974234;
	Sun, 12 May 2013 16:22:54 -0700 (PDT)
Received: from mizar.localdomain
	(host170-249-dynamic.17-79-r.retail.telecomitalia.it.
	[79.17.249.170]) by mx.google.com with ESMTPSA id
	w43sm19120109eeg.14.2013.05.12.16.22.52 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 12 May 2013 16:22:53 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 May 2013 01:22:23 +0200
Message-Id: <edc9e1415db71f905a4a6b1c66dfae246556eeaa.1368400320.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <cover.1368400320.git.andrea.adami@gmail.com>
References: <cover.1368400320.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1368400320.git.andrea.adami@gmail.com>
References: <cover.1368400320.git.andrea.adami@gmail.com>
Subject: [meta-initramfs][PATCH 4/4] kexec-tools-klibc_2.0.2: refactor and extend patches for building
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
X-List-Received-Date: Sun, 12 May 2013 23:41:07 -0000

* some old patches apparently unneeded have been removed
* patches are now better split
* fix build for x86 and x86-64
* tested with qemuarm, qemuppc, qemumips, qemux86, qemux86-64

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../kexec-tools-klibc-2.0.2/arm_crashdump.patch    | 12 +++
 .../kexec-tools-klibc-2.0.2/cflags_static.patch    | 11 +++
 .../kexec/kexec-tools-klibc-2.0.2/elf.patch        | 94 ---------------------
 .../kexec/kexec-tools-klibc-2.0.2/errno.patch      | 13 ---
 .../kexec-tools-klibc-2.0.2/ifdown_errno.patch     | 11 +++
 .../kexec-tools-klibc-2.0.2/kexec-elf-rel.patch    | 61 ++++++++++++++
 .../kexec-tools-klibc-2.0.2/kexec-syscall.patch    | 44 ++++++++++
 .../kexec/kexec-tools-klibc-2.0.2/other.patch      | 97 ----------------------
 .../kexec-tools-klibc-2.0.2/ppc__lshrdi3.patch     | 18 ++++
 .../kexec-tools-klibc-2.0.2/purgatory_flags.patch  | 21 +++++
 .../kexec-tools-klibc-2.0.2/purgatory_string.patch |  9 ++
 .../kexec/kexec-tools-klibc-2.0.2/sha256.patch     | 13 +++
 .../kexec/kexec-tools-klibc-2.0.2/string.patch     | 11 ---
 .../kexec/kexec-tools-klibc-2.0.2/syscall.patch    | 46 ----------
 .../sysconf_nrprocessors.patch                     | 13 +++
 .../kexec-tools-klibc-2.0.2/x86_basename.patch     | 14 ++++
 .../kexec-tools-klibc-2.0.2/x86_kexec_test.patch   | 13 +++
 .../kexec/kexec-tools-klibc-2.0.2/x86_sys_io.patch | 21 +++++
 .../kexec-tools-klibc-2.0.2/x86_vfscanf.patch      | 27 ++++++
 .../kexec/kexec-tools-klibc_2.0.2.bb               | 28 +++++--
 20 files changed, 307 insertions(+), 270 deletions(-)
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/arm_crashdump.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/cflags_static.patch
 delete mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/elf.patch
 delete mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/errno.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/ifdown_errno.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/kexec-elf-rel.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/kexec-syscall.patch
 delete mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/other.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/ppc__lshrdi3.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/purgatory_flags.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/purgatory_string.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/sha256.patch
 delete mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/string.patch
 delete mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/syscall.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/sysconf_nrprocessors.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/x86_basename.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/x86_kexec_test.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/x86_sys_io.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/x86_vfscanf.patch

diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/arm_crashdump.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/arm_crashdump.patch
new file mode 100644
index 0000000..0ff61e5
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/arm_crashdump.patch
@@ -0,0 +1,12 @@
+--- a/kexec/arch/arm/crashdump-arm.c
++++ b/kexec/arch/arm/crashdump-arm.c
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
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/cflags_static.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/cflags_static.patch
new file mode 100644
index 0000000..35100a3
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/cflags_static.patch
@@ -0,0 +1,11 @@
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -46,7 +46,7 @@
+ # where necessary.
+ CPPFLAGS	= @CPPFLAGS@ -I$(srcdir)/include -I$(srcdir)/util_lib/include \
+			-Iinclude/
+-CFLAGS		= @CFLAGS@ -fno-strict-aliasing -Wall -Wstrict-prototypes
++CFLAGS		= @CFLAGS@ -static -fno-strict-aliasing -Wall -Wstrict-prototypes
+ PURGATORY_EXTRA_CFLAGS = @PURGATORY_EXTRA_CFLAGS@
+ ASFLAGS		= @ASFLAGS@
+ LDFLAGS		= @LDFLAGS@
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/elf.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/elf.patch
deleted file mode 100644
index 0eef4b4..0000000
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/elf.patch
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
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/errno.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/errno.patch
deleted file mode 100644
index c56b5a9..0000000
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/errno.patch
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
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/ifdown_errno.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/ifdown_errno.patch
new file mode 100644
index 0000000..7f8cddd
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/ifdown_errno.patch
@@ -0,0 +1,11 @@
+--- a/kexec/ifdown.c
++++ b/kexec/ifdown.c
+@@ -14,7 +14,7 @@
+ #include <sys/ioctl.h>
+ #include <sys/socket.h>
+ #include <sys/time.h>
+-#include <sys/errno.h>
++#include <errno.h>
+ 
+ #include <net/if.h>
+ #include <netinet/in.h>
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/kexec-elf-rel.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/kexec-elf-rel.patch
new file mode 100644
index 0000000..c666afc
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/kexec-elf-rel.patch
@@ -0,0 +1,61 @@
+--- a/kexec/kexec-elf-rel.c
++++ b/kexec/kexec-elf-rel.c
+@@ -4,7 +4,7 @@
+ #include <stdio.h>
+ #include <errno.h>
+ #include <stdlib.h>
+-#include "elf.h"
++#include "../include/elf.h"
+ #include <boot/elf_boot.h>
+ #include "kexec.h"
+ #include "kexec-elf.h"
+
+--- a/kexec/arch/arm/kexec-elf-rel-arm.c
++++ b/kexec/arch/arm/kexec-elf-rel-arm.c
+@@ -1,5 +1,5 @@
+ #include <stdio.h>
+-#include <elf.h>
++#include "../../../include/elf.h"
+ #include "../../kexec.h"
+ #include "../../kexec-elf.h"
+ 
+
+--- a/kexec/arch/i386/kexec-elf-rel-x86.c
++++ b/kexec/arch/i386/kexec-elf-rel-x86.c
+@@ -1,5 +1,5 @@
+ #include <stdio.h>
+-#include <elf.h>
++#include "../../../include/elf.h"
+ #include "../../kexec.h"
+ #include "../../kexec-elf.h"
+ 
+
+--- a/kexec/arch/ppc/kexec-elf-rel-ppc.c
++++ b/kexec/arch/ppc/kexec-elf-rel-ppc.c
+@@ -1,5 +1,5 @@
+ #include <stdio.h>
+-#include <elf.h>
++#include "../../../include/elf.h"
+ #include "../../kexec.h"
+ #include "../../kexec-elf.h"
+ 
+
+--- a/kexec/arch/ppc64/kexec-elf-rel-ppc64.c
++++ b/kexec/arch/ppc64/kexec-elf-rel-ppc64.c
+@@ -1,5 +1,5 @@
+ #include <stdio.h>
+-#include <elf.h>
++#include "../../../include/elf.h"
+ #include <string.h>
+ #include "../../kexec.h"
+ #include "../../kexec-elf.h"
+
+--- a/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
++++ b/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
+@@ -1,5 +1,5 @@
+ #include <stdio.h>
+-#include <elf.h>
++#include "../../../include/elf.h"
+ #include "../../kexec.h"
+ #include "../../kexec-elf.h"
+ 
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/kexec-syscall.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/kexec-syscall.patch
new file mode 100644
index 0000000..081de1b
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/kexec-syscall.patch
@@ -0,0 +1,44 @@
+--- a/kexec/kexec-syscall.h
++++ b/kexec/kexec-syscall.h
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
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/other.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/other.patch
deleted file mode 100644
index f6efaeb..0000000
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/other.patch
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
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/ppc__lshrdi3.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/ppc__lshrdi3.patch
new file mode 100644
index 0000000..56cdfb0
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/ppc__lshrdi3.patch
@@ -0,0 +1,18 @@
+--- a/purgatory/arch/ppc/crt.S
++++ b/purgatory/arch/ppc/crt.S
+@@ -249,6 +249,7 @@
+  *
+  */
+ 
++/* already defined in misc.S
+ _GLOBAL(__lshrdi3)
+ 	subfic	6,5,32
+ 	srw	4,4,5	# LSW = count > 31 ? 0 : LSW >> count
+@@ -259,5 +260,7 @@
+ 	srw	3,3,5	# MSW = MSW >> count
+ 	or	4,4,7	# LSW |= t2
+ 	blr
++*/
++
+ #endif
+ #endif
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/purgatory_flags.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/purgatory_flags.patch
new file mode 100644
index 0000000..41fc116
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/purgatory_flags.patch
@@ -0,0 +1,21 @@
+--- a/purgatory/Makefile
++++ b/purgatory/Makefile
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
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/purgatory_string.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/purgatory_string.patch
new file mode 100644
index 0000000..5710561
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/purgatory_string.patch
@@ -0,0 +1,9 @@
+--- a/purgatory/string.c
++++ b/purgatory/string.c
+@@ -1,5 +1,5 @@
+ #include <stddef.h>
+-#include <string.h>
++/* #include <string.h> */
+ 
+ size_t strnlen(const char *s, size_t max)
+ {
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/sha256.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/sha256.patch
new file mode 100644
index 0000000..85bf7aa
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/sha256.patch
@@ -0,0 +1,13 @@
+--- a/util_lib/include/sha256.h
++++ b/util_lib/include/sha256.h
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
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/string.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/string.patch
deleted file mode 100644
index 7d27e39..0000000
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/string.patch
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
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/syscall.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/syscall.patch
deleted file mode 100644
index ae2e3f6..0000000
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/syscall.patch
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
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/sysconf_nrprocessors.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/sysconf_nrprocessors.patch
new file mode 100644
index 0000000..04a97e6
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/sysconf_nrprocessors.patch
@@ -0,0 +1,13 @@
+--- a/kexec/crashdump-elf.c
++++ b/kexec/crashdump-elf.c
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
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/x86_basename.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/x86_basename.patch
new file mode 100644
index 0000000..200fb1d
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/x86_basename.patch
@@ -0,0 +1,14 @@
+--- a/kexec/arch/i386/x86-linux-setup.c
++++ b/kexec/arch/i386/x86-linux-setup.c
+@@ -280,9 +280,9 @@ static int add_edd_entry(struct x86_linu
+	memset(edd_info, 0, sizeof(struct edd_info));
+ 
+ 	/* extract the device number */
+-	if (sscanf(basename(sysfs_name), "int13_dev%hhx", &devnum) != 1) {
++	if (sscanf(strrchr(sysfs_name,'/') + 1, "int13_dev%hhx", &devnum) != 1) {
+ 		fprintf(stderr, "Invalid format of int13_dev dir "
+-				"entry: %s\n", basename(sysfs_name));
++				"entry: %s\n", strrchr(sysfs_name,'/') + 1);
+ 		return -1;
+ 	}
+ 
\ No newline at end of file
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/x86_kexec_test.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/x86_kexec_test.patch
new file mode 100644
index 0000000..9500bd6
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/x86_kexec_test.patch
@@ -0,0 +1,13 @@
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -106,8 +106,8 @@
+ 
+ MAN_PAGES:= kexec/kexec.8
+ MAN_PAGES+= kdump/kdump.8
+-BINARIES_i386:=  $(SBINDIR)/kexec $(PKGLIBDIR)/kexec_test
+-BINARIES_x86_64:=$(SBINDIR)/kexec $(PKGLIBDIR)/kexec_test
++BINARIES_i386:=  $(SBINDIR)/kexec
++BINARIES_x86_64:=$(SBINDIR)/kexec
+ BINARIES:=$(SBINDIR)/kexec $(SBINDIR)/kdump $(BINARIES_$(ARCH))
+ 
+ TARGETS:=$(BINARIES) $(MAN_PAGES)
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/x86_sys_io.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/x86_sys_io.patch
new file mode 100644
index 0000000..a497c9a
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/x86_sys_io.patch
@@ -0,0 +1,21 @@
+--- a/purgatory/arch/i386/pic.c
++++ b/purgatory/arch/i386/pic.c
+@@ -16,7 +16,7 @@
+  * along with this program; if not, write to the Free Software
+  * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+  */
+-#include <sys/io.h>
++#include "include/arch/io.h"
+ #include <purgatory.h>
+ #include "purgatory-x86.h"
+ 
+
+--- a/purgatory/arch/i386/vga.c
++++ b/purgatory/arch/i386/vga.c
+@@ -1,4 +1,4 @@
+-#include <sys/io.h>
++#include "include/arch/io.h"
+ #include <purgatory.h>
+ #include "purgatory-x86.h"
+ 
+
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/x86_vfscanf.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/x86_vfscanf.patch
new file mode 100644
index 0000000..14f4d2a
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/x86_vfscanf.patch
@@ -0,0 +1,27 @@
+--- a/kexec/arch/i386/x86-linux-setup.c
++++ b/kexec/arch/i386/x86-linux-setup.c
+@@ -176,6 +176,8 @@ static int file_scanf(const char *dir, c
+ 	FILE *fp;
+ 	int retno;
+ 	char filename[PATH_MAX];
++	long line_size = MAX_LINE;
++	char *line;
+ 
+ 	snprintf(filename, PATH_MAX, "%s/%s", dir, file);
+ 	filename[PATH_MAX-1] = 0;
+@@ -186,7 +188,14 @@ static int file_scanf(const char *dir, c
+ 	}
+ 
+ 	va_start(argptr, scanf_line);
+-	retno = vfscanf(fp, scanf_line, argptr);
++
++	line = xmalloc(sizeof(line) * line_size);
++	while(fgets(line, sizeof(line), fp) != 0 ) {
++		line_size += MAX_LINE;
++		line = xrealloc(line,line_size);
++	}
++	retno = vsscanf(line, scanf_line, argptr);
++
+ 	va_end(argptr);
+ 
+ 	fclose(fp);
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb
index 90b876c..eedcaa5 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb
@@ -7,20 +7,30 @@ inherit klibc
 
 FILESPATH =. "${FILE_DIRNAME}/kexec-tools-${PV}:"
 
-SRC_URI += "file://elf.patch \
-            file://errno.patch \
-            file://string.patch \
-            file://syscall.patch \
-            file://other.patch \
-"
+SRC_URI += " \
+            file://kexec-elf-rel.patch \
+            file://kexec-syscall.patch \
+            file://cflags_static.patch  \
+            file://ifdown_errno.patch  \
+            file://purgatory_flags.patch \
+            file://purgatory_string.patch \
+            file://sha256.patch \
+            file://sysconf_nrprocessors.patch \
+            "
+
+SRC_URI_append_arm = " file://arm_crashdump.patch"
+SRC_URI_append_powerpc = " file://ppc__lshrdi3.patch"
+SRC_URI_append_x86 = " file://x86_sys_io.patch file://x86_basename.patch file://x86_vfscanf.patch file://x86_kexec_test.patch"
+SRC_URI_append_x86-64 = " file://x86_sys_io.patch file://x86_basename.patch file://x86_vfscanf.patch file://x86_kexec_test.patch"
 
 S = "${WORKDIR}/kexec-tools-${PV}"
 
-EXTRA_OECONF += "--without-zlib"
-
-PACKAGES =+ "kexec-klibc kdump-klibc"
+EXTRA_OECONF += "--without-zlib --without-lzma --without-xen"
 
 CFLAGS += "-I${STAGING_DIR_HOST}${base_libdir}/klibc/include -I${STAGING_DIR_HOST}${base_libdir}/klibc/include/bits32"
+CFLAGS_x86-64 += "-I${STAGING_DIR_HOST}${base_libdir}/klibc/include -I${STAGING_DIR_HOST}${base_libdir}/klibc/include/bits64"
+
+PACKAGES =+ "kexec-klibc kdump-klibc"
 
 FILES_kexec-klibc = "${sbindir}/kexec"
 FILES_kdump-klibc = "${sbindir}/kdump"
-- 
1.8.1.5



