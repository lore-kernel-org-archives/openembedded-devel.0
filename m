Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 035897E8EE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jun 2019 01:27:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5E1QY6I007295
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jun 2019 18:26:57 -0700
Received: from localhost (128.224.162.195) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Thu, 13 Jun 2019 18:26:47 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 14 Jun 2019 09:26:18 +0800
Message-ID: <1560475578-28568-3-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560475578-28568-1-git-send-email-yi.zhao@windriver.com>
References: <1560475578-28568-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.195]
Subject: [meta-filesystems][PATCH 3/3] xfsprogs: upgrade 4.18.0 -> 5.0.0
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
X-List-Received-Date: Fri, 14 Jun 2019 01:27:06 -0000
Content-Type: text/plain

Rebase 0001-build-Check-for-sync_file_range-libc-function.patch.
Remove disable-xfs_scrub-build.patch as the xfs_scrub build is
config-optional now. Add option '--enable-scrub=no' to EXTRA_OECONF to
disable build the experimental xfs_scrub utility.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...d-Check-for-sync_file_range-libc-function.patch | 16 ++++++------
 .../xfsprogs/files/disable-xfs_scrub-build.patch   | 30 ----------------------
 .../{xfsprogs_4.18.0.bb => xfsprogs_5.0.0.bb}      |  6 ++---
 3 files changed, 11 insertions(+), 41 deletions(-)
 delete mode 100644 meta-filesystems/recipes-utils/xfsprogs/files/disable-xfs_scrub-build.patch
 rename meta-filesystems/recipes-utils/xfsprogs/{xfsprogs_4.18.0.bb => xfsprogs_5.0.0.bb} (92%)

diff --git a/meta-filesystems/recipes-utils/xfsprogs/files/0001-build-Check-for-sync_file_range-libc-function.patch b/meta-filesystems/recipes-utils/xfsprogs/files/0001-build-Check-for-sync_file_range-libc-function.patch
index 231da80..b5071ae 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/files/0001-build-Check-for-sync_file_range-libc-function.patch
+++ b/meta-filesystems/recipes-utils/xfsprogs/files/0001-build-Check-for-sync_file_range-libc-function.patch
@@ -1,4 +1,4 @@
-From f8a22f16c03e51d3c779b12f37d362faaa0ecf31 Mon Sep 17 00:00:00 2001
+From 1a4c9ebbb8731f2e3631d77b7eeaf3c373141d88 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 31 Jan 2018 21:28:53 -0800
 Subject: [PATCH] build: Check for sync_file_range libc function
@@ -16,10 +16,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  4 files changed, 9 insertions(+), 2 deletions(-)
 
 diff --git a/include/builddefs.in b/include/builddefs.in
-index b895949..a388c83 100644
+index d38dc7e..706eca6 100644
 --- a/include/builddefs.in
 +++ b/include/builddefs.in
-@@ -95,6 +95,7 @@ HAVE_FIEMAP = @have_fiemap@
+@@ -94,6 +94,7 @@ HAVE_FIEMAP = @have_fiemap@
  HAVE_PREADV = @have_preadv@
  HAVE_PWRITEV2 = @have_pwritev2@
  HAVE_COPY_FILE_RANGE = @have_copy_file_range@
@@ -28,11 +28,11 @@ index b895949..a388c83 100644
  HAVE_SYNCFS = @have_syncfs@
  HAVE_READDIR = @have_readdir@
 diff --git a/io/Makefile b/io/Makefile
-index 00ede48..dd001b0 100644
+index 484e2b5..2751dcb 100644
 --- a/io/Makefile
 +++ b/io/Makefile
-@@ -60,10 +60,13 @@ CFILES += inject.c resblks.c
- LCFLAGS += -DHAVE_INJECT -DHAVE_RESBLKS
+@@ -53,10 +53,13 @@ else
+ LSRCFILES += fiemap.c
  endif
  
 -ifeq ($(HAVE_COPY_FILE_RANGE),yes)
@@ -47,10 +47,10 @@ index 00ede48..dd001b0 100644
  ifeq ($(HAVE_SYNC_FILE_RANGE),yes)
  CFILES += sync_file_range.c
 diff --git a/io/io.h b/io/io.h
-index e1f3d95..fe2e6a2 100644
+index 6469179..678b3d7 100644
 --- a/io/io.h
 +++ b/io/io.h
-@@ -151,7 +151,7 @@ extern void		fiemap_init(void);
+@@ -146,7 +146,7 @@ extern void		fiemap_init(void);
  #define fiemap_init()	do { } while (0)
  #endif
  
diff --git a/meta-filesystems/recipes-utils/xfsprogs/files/disable-xfs_scrub-build.patch b/meta-filesystems/recipes-utils/xfsprogs/files/disable-xfs_scrub-build.patch
deleted file mode 100644
index c07b4b5..0000000
--- a/meta-filesystems/recipes-utils/xfsprogs/files/disable-xfs_scrub-build.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 2bd40e5ed4df0b0a42beff8806b1ec5daa372c48 Mon Sep 17 00:00:00 2001
-From: Yi Zhao <yi.zhao@windriver.com>
-Date: Thu, 19 Jul 2018 16:49:41 +0800
-Subject: [PATCH] Disable xfs_scrub build
-
-Disable xfs_scrub build since it is experimental.
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 7ddfa31..cd60319 100644
---- a/Makefile
-+++ b/Makefile
-@@ -48,7 +48,7 @@ LIBFROG_SUBDIR = libfrog
- DLIB_SUBDIRS = libxlog libxcmd libhandle
- LIB_SUBDIRS = libxfs $(DLIB_SUBDIRS)
- TOOL_SUBDIRS = copy db estimate fsck growfs io logprint mkfs quota \
--		mdrestore repair rtcp m4 man doc debian spaceman scrub
-+		mdrestore repair rtcp m4 man doc debian spaceman
- 
- ifneq ("$(PKG_PLATFORM)","darwin")
- TOOL_SUBDIRS += fsr
--- 
-2.7.4
-
diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.18.0.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.0.0.bb
similarity index 92%
rename from meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.18.0.bb
rename to meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.0.0.bb
index 88603db..c952d04 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.18.0.bb
+++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.0.0.bb
@@ -9,12 +9,11 @@ DEPENDS = "util-linux util-linux-native"
 SRC_URI = "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/${BP}.tar.xz \
            file://remove_flags_from_build_flags.patch \
            file://0001-build-Check-for-sync_file_range-libc-function.patch \
-           file://disable-xfs_scrub-build.patch \
            file://0001-Check-for-MAP_SYNC-in-sys-mman.h.patch \
            file://0002-include-include-xfs-linux.h-after-sys-mman.h.patch \
            "
-SRC_URI[md5sum] = "5f80b631b68df89a8b9283307e96d2e8"
-SRC_URI[sha256sum] = "397dc96f51aeeff73d021d3418d3172377b2685f2740ca60525096c070aa3df1"
+SRC_URI[md5sum] = "b6acc4aa93a952595fc8f2e7447be6f2"
+SRC_URI[sha256sum] = "fcc2e6478aed55408a341567c0459f514e575296d8827d9004cae8aa0367dc4a"
 
 inherit autotools-brokensep
 
@@ -31,6 +30,7 @@ FILES_${PN}-repair = "${base_sbindir}/xfs_repair"
 FILES_libhandle = "${base_libdir}/libhandle${SOLIBS}"
 
 EXTRA_OECONF = "--enable-gettext=no \
+                --enable-scrub=no \
                 INSTALL_USER=root \
                 INSTALL_GROUP=root \
                 ac_cv_header_aio_h=yes \
-- 
2.7.4


