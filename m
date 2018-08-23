Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1E07A794AA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2018 22:07:16 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id z25-v6so3311527pgu.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2018 15:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=1diDjb3QJLcQKVgmsu4hcXHSTYkdbSEZpxSrx2+LLIc=;
	b=AWYff6coeDkX2zrcHH3Pe2bAAlAH9AdCrxCLLQlxkfyVKZSc7oHAJGOBrlKdYcXo9x
	HlMFJRVlq6dZ+wQC/R77bhTwiPvRXMZiJnAsdsWuCrDAqHfTBXu8h39f9YPznhlJ6bUv
	zjetQDkRjvtUtvOFAu8vQDQ9EIiPwzBGWVRbUBVDAKqGN4ETBkiXPFbVD9X4uy6lm8LX
	5/ngitZuePEcLUECUzWfbjwJ7QcMesqRUoSx6c0JkSLM/VWnNbyGHhv98rR85oJt89DG
	Cx7GgKzsOzwELwFt3DulSnSfoO+8KMfs1/3iUfGn4niYsOtS6szCYWagGrYDTUmTxvJ7
	FRCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1diDjb3QJLcQKVgmsu4hcXHSTYkdbSEZpxSrx2+LLIc=;
	b=BNiddYqXgS9Zwmi3yHHkbiNk0F8vcoaIGMO9IGfOVijXFnRZxtRYpYHkV0dp2O7FsP
	03UBHgRmbZg9lu0IhYiyiL2HiJxSEc3UKg822JTo6onCIvEKn5z+C38ucKxOAPEryE/N
	QsTBJ0dGxyGFQdbRkNznRTC0PDl0OgYCZIiK2AEJTppcZ5KRq/iXYxBWejlKdKTTcqyV
	dwg4//QnIlDvITNkZpniBAgPn02xXESuWaZyOFfWBaxRIaf54askTcPCzTGv6EqKxL2/
	aqlipq4N0xl3R2l6Vn+sI7eFf6/dw2HwIel2YuBvMsw3vQAkxvqPPQGJwzdl5d5nwSlO
	Qd1g==
X-Gm-Message-State: AOUpUlFA2L18fYo7FOtbRDxum7o4YP5c9k6psWl1i25RIdqJNxXnQ5Nm
	BN1LJ9tQRJc6xIe+bScysHSVON3y
X-Google-Smtp-Source: AA+uWPwQQQajCr9KWT9nPE0x/F/yf0JKQe/QNNCWVJB53WJ3sbODSOFETtkZfl4HsRG1OtSZwekOFw==
X-Received: by 2002:a62:d74f:: with SMTP id
	v15-v6mr32751509pfl.257.1535062036739; 
	Thu, 23 Aug 2018 15:07:16 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::4add])
	by smtp.gmail.com with ESMTPSA id
	j195-v6sm8862346pgc.25.2018.08.23.15.07.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Aug 2018 15:07:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Aug 2018 15:07:06 -0700
Message-Id: <20180823220708.44582-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH 1/3] xfsprogs: Fix build on mips
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
X-List-Received-Date: Thu, 23 Aug 2018 22:07:16 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...001-Check-for-MAP_SYNC-in-sys-mman.h.patch | 52 +++++++++++++++++++
 ...include-xfs-linux.h-after-sys-mman.h.patch | 33 ++++++++++++
 .../recipes-utils/xfsprogs/xfsprogs_4.17.0.bb |  5 +-
 3 files changed, 89 insertions(+), 1 deletion(-)
 create mode 100644 meta-filesystems/recipes-utils/xfsprogs/files/0001-Check-for-MAP_SYNC-in-sys-mman.h.patch
 create mode 100644 meta-filesystems/recipes-utils/xfsprogs/files/0002-include-include-xfs-linux.h-after-sys-mman.h.patch

diff --git a/meta-filesystems/recipes-utils/xfsprogs/files/0001-Check-for-MAP_SYNC-in-sys-mman.h.patch b/meta-filesystems/recipes-utils/xfsprogs/files/0001-Check-for-MAP_SYNC-in-sys-mman.h.patch
new file mode 100644
index 0000000000..75b227ac19
--- /dev/null
+++ b/meta-filesystems/recipes-utils/xfsprogs/files/0001-Check-for-MAP_SYNC-in-sys-mman.h.patch
@@ -0,0 +1,52 @@
+From f41ef1f06d428c81fcdef73d896dfc7ceda1809c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 23 Aug 2018 04:59:39 +0000
+Subject: [PATCH] Check for MAP_SYNC in sys/mman.h
+
+Not all arches have wired MAP_SYNC e.g. mips
+which have conflicts with definition, so checking
+a generic file is going to mis-configure xfsprogs
+for such arches.
+
+libc now has added the relevant macros to
+sys/mman.h, and returns the right values for arches
+where its implemented and nothing for others
+unlike asm-generic/mman.h which only checks
+for kernel headers and ignored arches
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ include/linux.h       | 3 +--
+ m4/package_libcdev.m4 | 3 +--
+ 2 files changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/include/linux.h b/include/linux.h
+index 1998941..7e5c9ab 100644
+--- a/include/linux.h
++++ b/include/linux.h
+@@ -331,8 +331,7 @@ fsmap_advance(
+ #define MAP_SYNC 0
+ #define MAP_SHARED_VALIDATE 0
+ #else
+-#include <asm-generic/mman.h>
+-#include <asm-generic/mman-common.h>
++#include <sys/mman.h>
+ #endif /* HAVE_MAP_SYNC */
+ 
+ #endif	/* __XFS_LINUX_H__ */
+diff --git a/m4/package_libcdev.m4 b/m4/package_libcdev.m4
+index 0a6b514..2b47d2f 100644
+--- a/m4/package_libcdev.m4
++++ b/m4/package_libcdev.m4
+@@ -335,8 +335,7 @@ AC_DEFUN([AC_HAVE_STATFS_FLAGS],
+ AC_DEFUN([AC_HAVE_MAP_SYNC],
+   [ AC_MSG_CHECKING([for MAP_SYNC])
+     AC_TRY_COMPILE([
+-#include <asm-generic/mman.h>
+-#include <asm-generic/mman-common.h>
++#include <sys/mman.h>
+     ], [
+         int flags = MAP_SYNC | MAP_SHARED_VALIDATE;
+     ], have_map_sync=yes
diff --git a/meta-filesystems/recipes-utils/xfsprogs/files/0002-include-include-xfs-linux.h-after-sys-mman.h.patch b/meta-filesystems/recipes-utils/xfsprogs/files/0002-include-include-xfs-linux.h-after-sys-mman.h.patch
new file mode 100644
index 0000000000..89447fd92e
--- /dev/null
+++ b/meta-filesystems/recipes-utils/xfsprogs/files/0002-include-include-xfs-linux.h-after-sys-mman.h.patch
@@ -0,0 +1,33 @@
+From 18298d7c028cd5fbd2c68fa428dc2384344aeb91 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 23 Aug 2018 05:33:57 +0000
+Subject: [PATCH] include include/xfs/linux.h after <sys/mman.h>
+
+This helps compiling with musl which goes ahead and undefines MAP_SYNC
+for mips and other architectures where its not wired in kernel
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ io/mmap.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/io/mmap.c b/io/mmap.c
+index 106be49..34fadf4 100644
+--- a/io/mmap.c
++++ b/io/mmap.c
+@@ -16,10 +16,11 @@
+  * Inc.,  51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
+  */
+ 
+-#include "command.h"
+-#include "input.h"
+ #include <sys/mman.h>
+ #include <signal.h>
++
++#include "command.h"
++#include "input.h"
+ #include "init.h"
+ #include "io.h"
+ 
diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.17.0.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.17.0.bb
index 06f774d875..ee571ce863 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.17.0.bb
+++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.17.0.bb
@@ -9,6 +9,8 @@ SRC_URI = "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/${BP}.tar.xz \
            file://remove_flags_from_build_flags.patch \
            file://0001-build-Check-for-sync_file_range-libc-function.patch \
            file://disable-xfs_scrub-build.patch \
+           file://0001-Check-for-MAP_SYNC-in-sys-mman.h.patch \
+           file://0002-include-include-xfs-linux.h-after-sys-mman.h.patch \
            "
 SRC_URI[md5sum] = "b935b693dfac0264e232c3c4e52d5569"
 SRC_URI[sha256sum] = "f53f5169cb98cfca471ddea30092738c427ba284c5356e01b45dd1ae3b297e0d"
@@ -48,13 +50,14 @@ export tagname="CC"
 
 EXTRA_OEMAKE = "DIST_ROOT='${D}'"
 
-do_configure_prepend () {
+do_configure () {
     export BUILD_CC="${BUILD_CC} ${BUILD_CFLAGS}"
     # Prevent Makefile from calling configure without arguments,
     # when do_configure gets called for a second time.
     rm -f ${B}/include/builddefs ${B}/include/platform_defs.h ${B}/configure
     # Recreate configure script.
     oe_runmake configure
+    oe_runconf
 }
 
 do_install_append() {
-- 
2.18.0


