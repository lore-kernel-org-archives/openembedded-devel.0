Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5662879727
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Sep 2018 01:04:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8712oFK010240
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 6 Sep 2018 18:04:23 -0700
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Thu, 6 Sep 2018 18:03:37 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 7 Sep 2018 09:03:35 +0800
Message-ID: <1536282215-3208-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-filesystems][PATCH] xfsprogs: upgrade 4.17 -> 4.18
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
X-List-Received-Date: Fri, 07 Sep 2018 01:04:32 -0000
Content-Type: text/plain

License-Update: Removed doc/COPYING and up-to-date license files in
LICENSE/. This does not change the license of any of the code.

Rebase patches:
  0001-build-Check-for-sync_file_range-libc-function.patch
  0002-include-include-xfs-linux.h-after-sys-mman.h.patch

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...d-Check-for-sync_file_range-libc-function.patch | 29 ++++++++++------------
 ...lude-include-xfs-linux.h-after-sys-mman.h.patch |  8 +++---
 .../{xfsprogs_4.17.0.bb => xfsprogs_4.18.0.bb}     |  7 +++---
 3 files changed, 21 insertions(+), 23 deletions(-)
 rename meta-filesystems/recipes-utils/xfsprogs/{xfsprogs_4.17.0.bb => xfsprogs_4.18.0.bb} (86%)

diff --git a/meta-filesystems/recipes-utils/xfsprogs/files/0001-build-Check-for-sync_file_range-libc-function.patch b/meta-filesystems/recipes-utils/xfsprogs/files/0001-build-Check-for-sync_file_range-libc-function.patch
index d8ff555..231da80 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/files/0001-build-Check-for-sync_file_range-libc-function.patch
+++ b/meta-filesystems/recipes-utils/xfsprogs/files/0001-build-Check-for-sync_file_range-libc-function.patch
@@ -1,14 +1,14 @@
-From ae7172194d3fbb563ff8bbe7c02d34f1bd0e5ec9 Mon Sep 17 00:00:00 2001
+From f8a22f16c03e51d3c779b12f37d362faaa0ecf31 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 31 Jan 2018 21:28:53 -0800
 Subject: [PATCH] build: Check for sync_file_range libc function
 
 glibc 2.27 now has sync_file_range()
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
 Upstream-Status: Pending
 
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
  include/builddefs.in | 1 +
  io/Makefile          | 5 ++++-
  io/io.h              | 2 +-
@@ -16,10 +16,10 @@ Upstream-Status: Pending
  4 files changed, 9 insertions(+), 2 deletions(-)
 
 diff --git a/include/builddefs.in b/include/builddefs.in
-index 92d5076..504225a 100644
+index b895949..a388c83 100644
 --- a/include/builddefs.in
 +++ b/include/builddefs.in
-@@ -105,6 +105,7 @@ HAVE_FIEMAP = @have_fiemap@
+@@ -95,6 +95,7 @@ HAVE_FIEMAP = @have_fiemap@
  HAVE_PREADV = @have_preadv@
  HAVE_PWRITEV2 = @have_pwritev2@
  HAVE_COPY_FILE_RANGE = @have_copy_file_range@
@@ -28,10 +28,10 @@ index 92d5076..504225a 100644
  HAVE_SYNCFS = @have_syncfs@
  HAVE_READDIR = @have_readdir@
 diff --git a/io/Makefile b/io/Makefile
-index 6725936..1876e95 100644
+index 00ede48..dd001b0 100644
 --- a/io/Makefile
 +++ b/io/Makefile
-@@ -59,10 +59,13 @@ CFILES += inject.c resblks.c
+@@ -60,10 +60,13 @@ CFILES += inject.c resblks.c
  LCFLAGS += -DHAVE_INJECT -DHAVE_RESBLKS
  endif
  
@@ -47,10 +47,10 @@ index 6725936..1876e95 100644
  ifeq ($(HAVE_SYNC_FILE_RANGE),yes)
  CFILES += sync_file_range.c
 diff --git a/io/io.h b/io/io.h
-index 3862985..79ddc7b 100644
+index e1f3d95..fe2e6a2 100644
 --- a/io/io.h
 +++ b/io/io.h
-@@ -158,7 +158,7 @@ extern void		fiemap_init(void);
+@@ -151,7 +151,7 @@ extern void		fiemap_init(void);
  #define fiemap_init()	do { } while (0)
  #endif
  
@@ -60,23 +60,20 @@ index 3862985..79ddc7b 100644
  #else
  #define copy_range_init()	do { } while (0)
 diff --git a/io/sync_file_range.c b/io/sync_file_range.c
-index 7e4f3e6..aafea01 100644
+index 30bbc93..6c49d73 100644
 --- a/io/sync_file_range.c
 +++ b/io/sync_file_range.c
-@@ -16,6 +16,7 @@
-  * Inc.,  51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
+@@ -4,6 +4,7 @@
+  * All Rights Reserved.
   */
  
 +#ifndef HAVE_COPY_FILE_RANGE
  #include "command.h"
  #include "input.h"
  #include "init.h"
-@@ -104,3 +105,5 @@ sync_range_init(void)
+@@ -92,3 +93,5 @@ sync_range_init(void)
  
  	add_command(&sync_range_cmd);
  }
 +
 +#endif
--- 
-2.16.1
-
diff --git a/meta-filesystems/recipes-utils/xfsprogs/files/0002-include-include-xfs-linux.h-after-sys-mman.h.patch b/meta-filesystems/recipes-utils/xfsprogs/files/0002-include-include-xfs-linux.h-after-sys-mman.h.patch
index 89447fd..f924cd1 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/files/0002-include-include-xfs-linux.h-after-sys-mman.h.patch
+++ b/meta-filesystems/recipes-utils/xfsprogs/files/0002-include-include-xfs-linux.h-after-sys-mman.h.patch
@@ -1,4 +1,4 @@
-From 18298d7c028cd5fbd2c68fa428dc2384344aeb91 Mon Sep 17 00:00:00 2001
+From 11a42df394de3dc520e72a016296dcc6dea02a7a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 23 Aug 2018 05:33:57 +0000
 Subject: [PATCH] include include/xfs/linux.h after <sys/mman.h>
@@ -14,11 +14,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/io/mmap.c b/io/mmap.c
-index 106be49..34fadf4 100644
+index dbfcca5..ca00df1 100644
 --- a/io/mmap.c
 +++ b/io/mmap.c
-@@ -16,10 +16,11 @@
-  * Inc.,  51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
+@@ -4,10 +4,11 @@
+  * All Rights Reserved.
   */
  
 -#include "command.h"
diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.17.0.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.18.0.bb
similarity index 86%
rename from meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.17.0.bb
rename to meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.18.0.bb
index ee571ce..0a1bacb 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.17.0.bb
+++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.18.0.bb
@@ -3,7 +3,8 @@ HOMEPAGE = "http://oss.sgi.com/projects/xfs"
 SECTION = "base"
 LICENSE = "GPLv2 & LGPLv2.1"
 LICENSE_libhandle = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://doc/COPYING;md5=102f7fec3d53c7c8f0b7baf9bf9d76a8"
+LIC_FILES_CHKSUM = "file://LICENSES/GPL-2.0;md5=74274e8a218423e49eefdea80bc55038 \
+                    file://LICENSES/LGPL-2.1;md5=b370887980db5dd40659b50909238dbd"
 DEPENDS = "util-linux util-linux-native"
 SRC_URI = "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/${BP}.tar.xz \
            file://remove_flags_from_build_flags.patch \
@@ -12,8 +13,8 @@ SRC_URI = "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/${BP}.tar.xz \
            file://0001-Check-for-MAP_SYNC-in-sys-mman.h.patch \
            file://0002-include-include-xfs-linux.h-after-sys-mman.h.patch \
            "
-SRC_URI[md5sum] = "b935b693dfac0264e232c3c4e52d5569"
-SRC_URI[sha256sum] = "f53f5169cb98cfca471ddea30092738c427ba284c5356e01b45dd1ae3b297e0d"
+SRC_URI[md5sum] = "5f80b631b68df89a8b9283307e96d2e8"
+SRC_URI[sha256sum] = "397dc96f51aeeff73d021d3418d3172377b2685f2740ca60525096c070aa3df1"
 
 inherit autotools-brokensep
 
-- 
2.7.4


