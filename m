Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5EC8F7E6E8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jun 2019 16:26:42 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id k11so3287329wrl.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jun 2019 09:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=RHWePknIimRVeetWiil6x913XUM5xh/BBHmQhRxtvpU=;
	b=izDaWOf41WbvaQCekzWSNEQuZZ2TJE+TICNNSq1fDSuuxLyI2CU9duGb55EkIuguor
	wsmnXNPy93IOPqcO2H13HaFoIqoO7/VBnA+kGvfj/bLKYMV57Up+IRo0fKQeM1T8VL7N
	YN6h6dCGkXIFVbi8oIVlAIv6wn8DFij4vuXRW8x6fISXI4oVw+OMC8wmDiA8/t7hWpaB
	uLlpkxnizfMTp5ofxMtqnKLBqNEj/KwJ8ujVv7lXYbdPn6nj4GQ8rMVDPUb955X7GkWy
	8TM1+cYLppiL75Qt+qqYJVgplbwK2GigbmADDLwUXgLwLrRYMvlj059ci1+nMhl8aew4
	BCMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=RHWePknIimRVeetWiil6x913XUM5xh/BBHmQhRxtvpU=;
	b=h9IVcdZOiMcs71cME8OFk9l8r79c9WTbWKZbae7X0edCrIiwEV8Jxxxoz9/1POacD0
	mBpabCFqGiM0A/4U/s6NXsA6VXRVzTxLaC3tHt59hvl0vb9B5i+nkPjvpg+Iv2577LGp
	kitU3sFsMToMlkGm/+cl9CSfH9WOgqVkpub8gRQK22G+VGW9xzOc5Qt/fsclm4uk5fbK
	h5skEhSuMb2CM8LiVvJonlmidLz6vG/8wVjTUt7e5Di0V3T1fQubyxxdxVuAISB42csl
	hDONr7NFV5qftuuX5jxeNxWSsXDK/WkFtgGDdNcBn8TW7c8MuFO/2yZ6a1sFFYmTZzF0
	IeOA==
X-Gm-Message-State: APjAAAWhvJ4mHVQYBa0bL/4XjUAnxH+UfTLGcPT7oMEtwx8a89N+WlIA
	XBj7eyD7/aNX9tYgxodIm4iWmC1/
X-Google-Smtp-Source: APXvYqzD02DBeWqzzE9C8RpX3Qw0G5M4PR9N+xJn/mI+Yh0CMAKXGCIxHS8rbOKi0XF6G/WglJLd/A==
X-Received: by 2002:adf:e8c8:: with SMTP id k8mr32275787wrn.285.1560443202431; 
	Thu, 13 Jun 2019 09:26:42 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id y2sm171487wra.58.2019.06.13.09.26.41
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 13 Jun 2019 09:26:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Jun 2019 16:26:43 +0000
Message-Id: <20190613162644.877-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH 1/2] open-vm-tools: refresh the patches so that they can be easily applied with devtool or git am
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
X-List-Received-Date: Thu, 13 Jun 2019 16:26:43 -0000

* in preparation for a fix for gcc9 in following commit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...1-configure.ac-don-t-use-dnet-config.patch | 16 +++---
 .../0002-add-include-sys-sysmacros.h.patch    | 17 +++---
 ...-configure-test-for-struct-timespec.patch} | 22 ++++----
 ...inition-of-ALLPERMS-and-ACCESSPERMS.patch} | 26 ++++-----
 ...test-for-feature-instead-of-platfor.patch} | 38 ++++++-------
 ...nfigure-test-for-sys-stat.h-include.patch} | 12 ++---
 ...7-Fix-subdir-objects-configure-error.patch | 24 +++++++++
 ...nclude-poll.h-instead-of-sys-poll.h.patch} | 10 ++--
 ... => 0009-Rename-poll.h-to-vm_poll.h.patch} | 54 +++++++++----------
 ...trerror_r-unless-on-gnu-libc-system.patch} |  8 +--
 ...1-Use-uintmax_t-for-handling-rlim_t.patch} | 10 ++--
 ...12-Use-off64_t-instead-of-__off64_t.patch} | 10 ++--
 ...-Do-not-print-NULL-string-into-logs.patch} |  8 +--
 .../fix-subdir-objects-configure-error.patch  | 12 -----
 .../open-vm-tools/open-vm-tools_10.3.5.bb     | 34 ++++++------
 15 files changed, 155 insertions(+), 146 deletions(-)
 rename meta-oe/recipes-support/open-vm-tools/open-vm-tools/{0005-Use-configure-test-for-struct-timespec.patch => 0003-Use-configure-test-for-struct-timespec.patch} (65%)
 rename meta-oe/recipes-support/open-vm-tools/open-vm-tools/{0006-Fix-definition-of-ALLPERMS-and-ACCESSPERMS.patch => 0004-Fix-definition-of-ALLPERMS-and-ACCESSPERMS.patch} (63%)
 rename meta-oe/recipes-support/open-vm-tools/open-vm-tools/{0007-Use-configure-to-test-for-feature-instead-of-platfor.patch => 0005-Use-configure-to-test-for-feature-instead-of-platfor.patch} (77%)
 rename meta-oe/recipes-support/open-vm-tools/open-vm-tools/{0011-Use-configure-test-for-sys-stat.h-include.patch => 0006-Use-configure-test-for-sys-stat.h-include.patch} (55%)
 create mode 100644 meta-oe/recipes-support/open-vm-tools/open-vm-tools/0007-Fix-subdir-objects-configure-error.patch
 rename meta-oe/recipes-support/open-vm-tools/open-vm-tools/{0001-include-poll.h-instead-of-sys-poll.h.patch => 0008-include-poll.h-instead-of-sys-poll.h.patch} (63%)
 rename meta-oe/recipes-support/open-vm-tools/open-vm-tools/{0002-Rename-poll.h-to-vm_poll.h.patch => 0009-Rename-poll.h-to-vm_poll.h.patch} (62%)
 rename meta-oe/recipes-support/open-vm-tools/open-vm-tools/{0003-use-posix-strerror_r-unless-on-gnu-libc-system.patch => 0010-use-posix-strerror_r-unless-on-gnu-libc-system.patch} (80%)
 rename meta-oe/recipes-support/open-vm-tools/open-vm-tools/{0004-Use-uintmax_t-for-handling-rlim_t.patch => 0011-Use-uintmax_t-for-handling-rlim_t.patch} (73%)
 rename meta-oe/recipes-support/open-vm-tools/open-vm-tools/{0001-Use-off64_t-instead-of-__off64_t.patch => 0012-Use-off64_t-instead-of-__off64_t.patch} (77%)
 rename meta-oe/recipes-support/open-vm-tools/open-vm-tools/{0001-misc-Do-not-print-NULL-string-into-logs.patch => 0013-misc-Do-not-print-NULL-string-into-logs.patch} (81%)
 delete mode 100644 meta-oe/recipes-support/open-vm-tools/open-vm-tools/fix-subdir-objects-configure-error.patch

diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-configure.ac-don-t-use-dnet-config.patch b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-configure.ac-don-t-use-dnet-config.patch
index b7a4058352..0736572b3e 100644
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-configure.ac-don-t-use-dnet-config.patch
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-configure.ac-don-t-use-dnet-config.patch
@@ -1,4 +1,4 @@
-From 929150608c16644695f19cd2e0cc8a06a41cd497 Mon Sep 17 00:00:00 2001
+From fc9bf1ce9f1a21150b10736a1c968d4ca6d4eaa3 Mon Sep 17 00:00:00 2001
 From: Martin Kelly <mkelly@xevo.com>
 Date: Fri, 7 Apr 2017 15:20:30 -0700
 Subject: [PATCH] configure.ac: don't use dnet-config
@@ -11,14 +11,14 @@ Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Martin Kelly <mkelly@xevo.com>
 ---
- configure.ac | 4 ++--
+ open-vm-tools/configure.ac | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-Index: open-vm-tools/configure.ac
-===================================================================
---- open-vm-tools.orig/configure.ac
-+++ open-vm-tools/configure.ac
-@@ -944,7 +944,7 @@ if test "$with_dnet" = "yes"; then
+diff --git a/open-vm-tools/configure.ac b/open-vm-tools/configure.ac
+index 325a39f5..713ea683 100644
+--- a/open-vm-tools/configure.ac
++++ b/open-vm-tools/configure.ac
+@@ -949,7 +949,7 @@ if test "$with_dnet" = "yes"; then
        AC_VMW_CHECK_LIB([dnet],
                         [DNET],
                         [],
@@ -27,7 +27,7 @@ Index: open-vm-tools/configure.ac
                         [],
                         [dnet.h],
                         [intf_open],
-@@ -954,7 +954,7 @@ if test "$with_dnet" = "yes"; then
+@@ -959,7 +959,7 @@ if test "$with_dnet" = "yes"; then
  
     if test $have_dnet = "no"; then
  		AC_MSG_ERROR(
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0002-add-include-sys-sysmacros.h.patch b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0002-add-include-sys-sysmacros.h.patch
index f905601d52..34628ffbef 100644
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0002-add-include-sys-sysmacros.h.patch
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0002-add-include-sys-sysmacros.h.patch
@@ -1,7 +1,7 @@
-From 5818acc8032e3247257730376e947330340a07b3 Mon Sep 17 00:00:00 2001
+From 3fa237b3afabc293e563292b8d89265a871626ad Mon Sep 17 00:00:00 2001
 From: Martin Kelly <mkelly@xevo.com>
 Date: Mon, 22 May 2017 17:00:05 -0700
-Subject: [PATCH 2/2] add #include <sys/sysmacros.h>
+Subject: [PATCH] add #include <sys/sysmacros.h>
 
 In newer glibc versions, the definition for major() has been moved to
 sys/sysmacros.h, and using the older version in <sys/types.h> has been
@@ -11,14 +11,14 @@ Upstream-Status: Pending
 
 Signed-off-by: Martin Kelly <mkelly@xevo.com>
 ---
- lib/wiper/wiperPosix.c | 3 +++
+ open-vm-tools/lib/wiper/wiperPosix.c | 3 +++
  1 file changed, 3 insertions(+)
 
 diff --git a/open-vm-tools/lib/wiper/wiperPosix.c b/open-vm-tools/lib/wiper/wiperPosix.c
-index d389eee..1f221fc 100644
---- a/lib/wiper/wiperPosix.c
-+++ b/lib/wiper/wiperPosix.c
-@@ -40,6 +40,9 @@
+index bd542410..ccf06293 100644
+--- a/open-vm-tools/lib/wiper/wiperPosix.c
++++ b/open-vm-tools/lib/wiper/wiperPosix.c
+@@ -43,6 +43,9 @@
  #  include <libgen.h>
  # endif /* __FreeBSD_version >= 500000 */
  #endif
@@ -28,6 +28,3 @@ index d389eee..1f221fc 100644
  #include <unistd.h>
  
  #include "vmware.h"
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0005-Use-configure-test-for-struct-timespec.patch b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0003-Use-configure-test-for-struct-timespec.patch
similarity index 65%
rename from meta-oe/recipes-support/open-vm-tools/open-vm-tools/0005-Use-configure-test-for-struct-timespec.patch
rename to meta-oe/recipes-support/open-vm-tools/open-vm-tools/0003-Use-configure-test-for-struct-timespec.patch
index f02d00f841..6d2e498141 100644
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0005-Use-configure-test-for-struct-timespec.patch
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0003-Use-configure-test-for-struct-timespec.patch
@@ -1,7 +1,7 @@
-From bf1eafb07297711baf9320b1edcca8a3376f117d Mon Sep 17 00:00:00 2001
+From bf9292ff9bd25467a014d6c2070805d163daa4c9 Mon Sep 17 00:00:00 2001
 From: Natanael Copa <ncopa@alpinelinux.org>
 Date: Wed, 18 Nov 2015 09:03:00 +0000
-Subject: [PATCH 05/11] Use configure test for struct timespec
+Subject: [PATCH] Use configure test for struct timespec
 
 Use the configure script to test for struct time spec instead of trying
 to keep track of what platforms has it.
@@ -12,11 +12,11 @@ Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
  open-vm-tools/lib/include/hgfsUtil.h | 8 +-------
  2 files changed, 2 insertions(+), 7 deletions(-)
 
-Index: open-vm-tools/configure.ac
-===================================================================
---- open-vm-tools.orig/configure.ac
-+++ open-vm-tools/configure.ac
-@@ -1127,6 +1127,7 @@ AC_TYPE_OFF_T
+diff --git a/open-vm-tools/configure.ac b/open-vm-tools/configure.ac
+index 713ea683..48ff1ef3 100644
+--- a/open-vm-tools/configure.ac
++++ b/open-vm-tools/configure.ac
+@@ -1208,6 +1208,7 @@ AC_TYPE_OFF_T
  AC_TYPE_PID_T
  AC_TYPE_SIZE_T
  AC_CHECK_MEMBERS([struct stat.st_rdev])
@@ -24,10 +24,10 @@ Index: open-vm-tools/configure.ac
  AC_HEADER_TIME
  AC_STRUCT_TM
  AC_C_VOLATILE
-Index: open-vm-tools/lib/include/hgfsUtil.h
-===================================================================
---- open-vm-tools.orig/lib/include/hgfsUtil.h
-+++ open-vm-tools/lib/include/hgfsUtil.h
+diff --git a/open-vm-tools/lib/include/hgfsUtil.h b/open-vm-tools/lib/include/hgfsUtil.h
+index 609f4c00..a3a022d4 100644
+--- a/open-vm-tools/lib/include/hgfsUtil.h
++++ b/open-vm-tools/lib/include/hgfsUtil.h
 @@ -53,13 +53,7 @@
  #      include <time.h>
  #   endif
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0006-Fix-definition-of-ALLPERMS-and-ACCESSPERMS.patch b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0004-Fix-definition-of-ALLPERMS-and-ACCESSPERMS.patch
similarity index 63%
rename from meta-oe/recipes-support/open-vm-tools/open-vm-tools/0006-Fix-definition-of-ALLPERMS-and-ACCESSPERMS.patch
rename to meta-oe/recipes-support/open-vm-tools/open-vm-tools/0004-Fix-definition-of-ALLPERMS-and-ACCESSPERMS.patch
index d1f4eff9be..e107ecf235 100644
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0006-Fix-definition-of-ALLPERMS-and-ACCESSPERMS.patch
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0004-Fix-definition-of-ALLPERMS-and-ACCESSPERMS.patch
@@ -1,7 +1,7 @@
-From 31ae6f42458f90d4994a4ad8e2b7673691612c36 Mon Sep 17 00:00:00 2001
+From 5a795b234c617150915a607776c76377948870a6 Mon Sep 17 00:00:00 2001
 From: Natanael Copa <ncopa@alpinelinux.org>
 Date: Wed, 18 Nov 2015 09:10:14 +0000
-Subject: [PATCH 06/11] Fix definition of ALLPERMS and ACCESSPERMS
+Subject: [PATCH] Fix definition of ALLPERMS and ACCESSPERMS
 
 The ALLPERMS and ACCESSPERMS defines are not specified in POSIX so
 assume it is not there instead of testing for specific implementations.
@@ -14,11 +14,11 @@ Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
  open-vm-tools/services/plugins/dndcp/dnd/dndLinux.c | 3 +--
  2 files changed, 6 insertions(+), 5 deletions(-)
 
-Index: open-vm-tools/lib/hgfsServer/hgfsServerLinux.c
-===================================================================
---- open-vm-tools.orig/lib/hgfsServer/hgfsServerLinux.c
-+++ open-vm-tools/lib/hgfsServer/hgfsServerLinux.c
-@@ -107,11 +107,13 @@ typedef struct DirectoryEntry {
+diff --git a/open-vm-tools/lib/hgfsServer/hgfsServerLinux.c b/open-vm-tools/lib/hgfsServer/hgfsServerLinux.c
+index f2b7ce67..0e6351a9 100644
+--- a/open-vm-tools/lib/hgfsServer/hgfsServerLinux.c
++++ b/open-vm-tools/lib/hgfsServer/hgfsServerLinux.c
+@@ -105,11 +105,13 @@ typedef struct DirectoryEntry {
  #endif
  
  /*
@@ -35,11 +35,11 @@ Index: open-vm-tools/lib/hgfsServer/hgfsServerLinux.c
  #   define ALLPERMS (S_ISUID|S_ISGID|S_ISVTX|S_IRWXU|S_IRWXG|S_IRWXO)
  #endif
  
-Index: open-vm-tools/services/plugins/dndcp/dnd/dndLinux.c
-===================================================================
---- open-vm-tools.orig/services/plugins/dndcp/dnd/dndLinux.c
-+++ open-vm-tools/services/plugins/dndcp/dnd/dndLinux.c
-@@ -51,7 +51,7 @@
+diff --git a/open-vm-tools/services/plugins/dndcp/dnd/dndLinux.c b/open-vm-tools/services/plugins/dndcp/dnd/dndLinux.c
+index 89133652..7e9c3a91 100644
+--- a/open-vm-tools/services/plugins/dndcp/dnd/dndLinux.c
++++ b/open-vm-tools/services/plugins/dndcp/dnd/dndLinux.c
+@@ -52,7 +52,7 @@
  
  #define DND_ROOTDIR_PERMS     (S_IRWXU | S_IRWXG | S_IRWXO)
  #define DND_STAGINGDIR_PERMS  (S_IRWXU | S_IRGRP | S_IXGRP | S_IROTH | S_IXOTH)
@@ -48,7 +48,7 @@ Index: open-vm-tools/services/plugins/dndcp/dnd/dndLinux.c
  #define ACCESSPERMS           (S_IRWXU | S_IRWXG | S_IRWXO)
  #endif
  #ifdef __ANDROID__
-@@ -60,7 +60,6 @@
+@@ -61,7 +61,6 @@
   */
  #define NO_SETMNTENT
  #define NO_ENDMNTENT
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0007-Use-configure-to-test-for-feature-instead-of-platfor.patch b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0005-Use-configure-to-test-for-feature-instead-of-platfor.patch
similarity index 77%
rename from meta-oe/recipes-support/open-vm-tools/open-vm-tools/0007-Use-configure-to-test-for-feature-instead-of-platfor.patch
rename to meta-oe/recipes-support/open-vm-tools/open-vm-tools/0005-Use-configure-to-test-for-feature-instead-of-platfor.patch
index ad19fb24b9..c6378b8086 100644
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0007-Use-configure-to-test-for-feature-instead-of-platfor.patch
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0005-Use-configure-to-test-for-feature-instead-of-platfor.patch
@@ -1,7 +1,7 @@
-From 6cc1c22cc30320f56da552a76bd956db8f255b6a Mon Sep 17 00:00:00 2001
+From 719d60978f979cf2e03771a9b8a62e36c92639f9 Mon Sep 17 00:00:00 2001
 From: Natanael Copa <ncopa@alpinelinux.org>
 Date: Wed, 18 Nov 2015 10:05:07 +0000
-Subject: [PATCH 07/11] Use configure to test for feature instead of platform
+Subject: [PATCH] Use configure to test for feature instead of platform
 
 Test for various functions instead of trying to keep track of what
 platform and what version of the given platform has support for what.
@@ -21,15 +21,15 @@ This is needed for musl libc.
 Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
 ---
  open-vm-tools/configure.ac               |  4 ++++
- open-vm-tools/lib/misc/idLinux.c         | 30 ++++++++++++++----------------
- open-vm-tools/lib/nicInfo/nicInfoPosix.c |  8 ++++++--
- 3 files changed, 24 insertions(+), 18 deletions(-)
+ open-vm-tools/lib/misc/idLinux.c         | 30 +++++++++++-------------
+ open-vm-tools/lib/nicInfo/nicInfoPosix.c |  6 ++++-
+ 3 files changed, 23 insertions(+), 17 deletions(-)
 
-Index: open-vm-tools/configure.ac
-===================================================================
---- open-vm-tools.orig/configure.ac
-+++ open-vm-tools/configure.ac
-@@ -892,6 +892,7 @@ AC_CHECK_FUNCS(
+diff --git a/open-vm-tools/configure.ac b/open-vm-tools/configure.ac
+index 48ff1ef3..71e684bb 100644
+--- a/open-vm-tools/configure.ac
++++ b/open-vm-tools/configure.ac
+@@ -897,6 +897,7 @@ AC_CHECK_FUNCS(
  
  AC_CHECK_FUNCS([ecvt])
  AC_CHECK_FUNCS([fcvt])
@@ -37,7 +37,7 @@ Index: open-vm-tools/configure.ac
  
  AC_CHECK_FUNC([mkdtemp], [have_mkdtemp=yes])
  
-@@ -1076,10 +1077,13 @@ AC_PATH_PROG(
+@@ -1145,10 +1146,13 @@ fi
  ###
  
  AC_CHECK_HEADERS([crypt.h])
@@ -51,10 +51,10 @@ Index: open-vm-tools/configure.ac
  AC_CHECK_HEADERS([sys/inttypes.h])
  AC_CHECK_HEADERS([sys/io.h])
  AC_CHECK_HEADERS([sys/param.h]) # Required to make the sys/user.h check work correctly on FreeBSD
-Index: open-vm-tools/lib/misc/idLinux.c
-===================================================================
---- open-vm-tools.orig/lib/misc/idLinux.c
-+++ open-vm-tools/lib/misc/idLinux.c
+diff --git a/open-vm-tools/lib/misc/idLinux.c b/open-vm-tools/lib/misc/idLinux.c
+index b950cf84..1dcfb508 100644
+--- a/open-vm-tools/lib/misc/idLinux.c
++++ b/open-vm-tools/lib/misc/idLinux.c
 @@ -27,12 +27,9 @@
  #include <sys/syscall.h>
  #include <string.h>
@@ -114,10 +114,10 @@ Index: open-vm-tools/lib/misc/idLinux.c
  #endif
  }
  #endif
-Index: open-vm-tools/lib/nicInfo/nicInfoPosix.c
-===================================================================
---- open-vm-tools.orig/lib/nicInfo/nicInfoPosix.c
-+++ open-vm-tools/lib/nicInfo/nicInfoPosix.c
+diff --git a/open-vm-tools/lib/nicInfo/nicInfoPosix.c b/open-vm-tools/lib/nicInfo/nicInfoPosix.c
+index a22981d5..b4e08681 100644
+--- a/open-vm-tools/lib/nicInfo/nicInfoPosix.c
++++ b/open-vm-tools/lib/nicInfo/nicInfoPosix.c
 @@ -34,9 +34,13 @@
  #include <sys/socket.h>
  #include <sys/stat.h>
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0011-Use-configure-test-for-sys-stat.h-include.patch b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0006-Use-configure-test-for-sys-stat.h-include.patch
similarity index 55%
rename from meta-oe/recipes-support/open-vm-tools/open-vm-tools/0011-Use-configure-test-for-sys-stat.h-include.patch
rename to meta-oe/recipes-support/open-vm-tools/open-vm-tools/0006-Use-configure-test-for-sys-stat.h-include.patch
index 78722390e8..9a227f9ec7 100644
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0011-Use-configure-test-for-sys-stat.h-include.patch
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0006-Use-configure-test-for-sys-stat.h-include.patch
@@ -1,7 +1,7 @@
-From 95c6184d9ff70a47c41768850923a96de9e544aa Mon Sep 17 00:00:00 2001
+From 11adcf43a1e7aa39ee4d82fa567f37e5b0c6ca81 Mon Sep 17 00:00:00 2001
 From: Natanael Copa <ncopa@alpinelinux.org>
 Date: Wed, 18 Nov 2015 10:41:01 +0000
-Subject: [PATCH 11/11] Use configure test for sys/stat.h include
+Subject: [PATCH] Use configure test for sys/stat.h include
 
 This is needed for musl libc.
 
@@ -10,10 +10,10 @@ Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
  open-vm-tools/services/plugins/vix/vixTools.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: open-vm-tools/services/plugins/vix/vixTools.c
-===================================================================
---- open-vm-tools.orig/services/plugins/vix/vixTools.c
-+++ open-vm-tools/services/plugins/vix/vixTools.c
+diff --git a/open-vm-tools/services/plugins/vix/vixTools.c b/open-vm-tools/services/plugins/vix/vixTools.c
+index e5273786..cabc4137 100644
+--- a/open-vm-tools/services/plugins/vix/vixTools.c
++++ b/open-vm-tools/services/plugins/vix/vixTools.c
 @@ -66,7 +66,7 @@
  #include <unistd.h>
  #endif
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0007-Fix-subdir-objects-configure-error.patch b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0007-Fix-subdir-objects-configure-error.patch
new file mode 100644
index 0000000000..11be2d4a07
--- /dev/null
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0007-Fix-subdir-objects-configure-error.patch
@@ -0,0 +1,24 @@
+From cf1284fda8fb22a2b27cb2ce7962f166166e74c3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 13 Jun 2018 23:48:04 -0700
+Subject: [PATCH] Fix subdir objects configure error
+
+Fix build on musl while here
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ open-vm-tools/configure.ac | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/open-vm-tools/configure.ac b/open-vm-tools/configure.ac
+index 71e684bb..b76a7966 100644
+--- a/open-vm-tools/configure.ac
++++ b/open-vm-tools/configure.ac
+@@ -303,6 +303,7 @@ AC_ARG_ENABLE(
+    [],
+    [enable_resolutionkms="auto"])
+ 
++AM_INIT_AUTOMAKE([subdir-objects])
+ AM_INIT_AUTOMAKE
+ 
+ ###
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-include-poll.h-instead-of-sys-poll.h.patch b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0008-include-poll.h-instead-of-sys-poll.h.patch
similarity index 63%
rename from meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-include-poll.h-instead-of-sys-poll.h.patch
rename to meta-oe/recipes-support/open-vm-tools/open-vm-tools/0008-include-poll.h-instead-of-sys-poll.h.patch
index 8820581198..814b9e3b25 100644
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-include-poll.h-instead-of-sys-poll.h.patch
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0008-include-poll.h-instead-of-sys-poll.h.patch
@@ -1,4 +1,4 @@
-From 4981bb3013d7f1e40e44618076d99af3484eedea Mon Sep 17 00:00:00 2001
+From e4f0b99d90e26b15106f634caad1c3dea9e09cb8 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 13 Jun 2018 23:02:50 -0700
 Subject: [PATCH] include poll.h instead of sys/poll.h
@@ -10,10 +10,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  open-vm-tools/lib/asyncsocket/asyncsocket.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/lib/asyncsocket/asyncsocket.c b/lib/asyncsocket/asyncsocket.c
-index 13908679..e0a68e7e 100644
---- a/lib/asyncsocket/asyncsocket.c
-+++ b/lib/asyncsocket/asyncsocket.c
+diff --git a/open-vm-tools/lib/asyncsocket/asyncsocket.c b/open-vm-tools/lib/asyncsocket/asyncsocket.c
+index 65b07109..b41aa29d 100644
+--- a/open-vm-tools/lib/asyncsocket/asyncsocket.c
++++ b/open-vm-tools/lib/asyncsocket/asyncsocket.c
 @@ -69,8 +69,8 @@
  #else
  #include <stddef.h>
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0002-Rename-poll.h-to-vm_poll.h.patch b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0009-Rename-poll.h-to-vm_poll.h.patch
similarity index 62%
rename from meta-oe/recipes-support/open-vm-tools/open-vm-tools/0002-Rename-poll.h-to-vm_poll.h.patch
rename to meta-oe/recipes-support/open-vm-tools/open-vm-tools/0009-Rename-poll.h-to-vm_poll.h.patch
index 4d6a0fd6ad..5c1aa7c40f 100644
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0002-Rename-poll.h-to-vm_poll.h.patch
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0009-Rename-poll.h-to-vm_poll.h.patch
@@ -1,4 +1,4 @@
-From 92955b3a6180b4285d11ef79766df01b9ab60dbd Mon Sep 17 00:00:00 2001
+From 8793466326dd10b0d2dbb83c64beff5cc8c0fc7d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 13 Jun 2018 23:11:58 -0700
 Subject: [PATCH] Rename poll.h to vm_poll.h
@@ -19,10 +19,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  7 files changed, 7 insertions(+), 7 deletions(-)
  rename open-vm-tools/lib/include/{poll.h => vm_poll.h} (99%)
 
-diff --git a/lib/asyncsocket/asyncsocket.c b/lib/asyncsocket/asyncsocket.c
-index e0a68e7e..b9675674 100644
---- a/lib/asyncsocket/asyncsocket.c
-+++ b/lib/asyncsocket/asyncsocket.c
+diff --git a/open-vm-tools/lib/asyncsocket/asyncsocket.c b/open-vm-tools/lib/asyncsocket/asyncsocket.c
+index b41aa29d..8691309d 100644
+--- a/open-vm-tools/lib/asyncsocket/asyncsocket.c
++++ b/open-vm-tools/lib/asyncsocket/asyncsocket.c
 @@ -86,7 +86,7 @@
  #include "random.h"
  #include "asyncsocket.h"
@@ -32,10 +32,10 @@ index e0a68e7e..b9675674 100644
  #include "log.h"
  #include "err.h"
  #include "hostinfo.h"
-diff --git a/lib/hgfsServer/hgfsServer.c b/lib/hgfsServer/hgfsServer.c
-index 991a7941..ed0c09f9 100644
---- a/lib/hgfsServer/hgfsServer.c
-+++ b/lib/hgfsServer/hgfsServer.c
+diff --git a/open-vm-tools/lib/hgfsServer/hgfsServer.c b/open-vm-tools/lib/hgfsServer/hgfsServer.c
+index 7ea3b7f4..740c4fed 100644
+--- a/open-vm-tools/lib/hgfsServer/hgfsServer.c
++++ b/open-vm-tools/lib/hgfsServer/hgfsServer.c
 @@ -48,7 +48,7 @@
  #include "hgfsServerOplock.h"
  #include "hgfsDirNotify.h"
@@ -45,10 +45,10 @@ index 991a7941..ed0c09f9 100644
  #include "mutexRankLib.h"
  #include "vm_basic_asm.h"
  #include "unicodeOperations.h"
-diff --git a/lib/include/asyncsocket.h b/lib/include/asyncsocket.h
-index 524147ea..103f944f 100644
---- a/lib/include/asyncsocket.h
-+++ b/lib/include/asyncsocket.h
+diff --git a/open-vm-tools/lib/include/asyncsocket.h b/open-vm-tools/lib/include/asyncsocket.h
+index ec9b45aa..dc91e738 100644
+--- a/open-vm-tools/lib/include/asyncsocket.h
++++ b/open-vm-tools/lib/include/asyncsocket.h
 @@ -164,7 +164,7 @@ typedef struct AsyncSocket AsyncSocket;
   * Or the client can specify its favorite poll class and locking behavior.
   * Use of IVmdbPoll is only supported for regular sockets and for Attach.
@@ -58,10 +58,10 @@ index 524147ea..103f944f 100644
  struct IVmdbPoll;
  typedef struct AsyncSocketPollParams {
     int flags;               /* Default 0, only POLL_FLAG_NO_BULL is valid */
-diff --git a/lib/include/pollImpl.h b/lib/include/pollImpl.h
+diff --git a/open-vm-tools/lib/include/pollImpl.h b/open-vm-tools/lib/include/pollImpl.h
 index 46442e55..8bc66997 100644
---- a/lib/include/pollImpl.h
-+++ b/lib/include/pollImpl.h
+--- a/open-vm-tools/lib/include/pollImpl.h
++++ b/open-vm-tools/lib/include/pollImpl.h
 @@ -44,7 +44,7 @@
  #define INCLUDE_ALLOW_USERLEVEL
  #include "includeCheck.h"
@@ -71,13 +71,13 @@ index 46442e55..8bc66997 100644
  #include "vm_basic_asm.h"
  
  #if defined(__cplusplus)
-diff --git a/lib/include/poll.h b/lib/include/vm_poll.h
+diff --git a/open-vm-tools/lib/include/poll.h b/open-vm-tools/lib/include/vm_poll.h
 similarity index 99%
 rename from open-vm-tools/lib/include/poll.h
 rename to open-vm-tools/lib/include/vm_poll.h
-index 988fe6d0..e9e74fb5 100644
---- a/lib/include/poll.h
-+++ b/lib/include/vm_poll.h
+index 6acd4f35..fbc88494 100644
+--- a/open-vm-tools/lib/include/poll.h
++++ b/open-vm-tools/lib/include/vm_poll.h
 @@ -60,7 +60,7 @@ extern "C" {
  #if !defined(TARGET_OS_IPHONE) || TARGET_OS_IPHONE == 0
  #include <sys/kernel.h>
@@ -87,10 +87,10 @@ index 988fe6d0..e9e74fb5 100644
  #define HZ 100
  #endif
  #ifdef __ANDROID__
-diff --git a/lib/rpcIn/rpcin.c b/lib/rpcIn/rpcin.c
-index c2c51583..d6c62f10 100644
---- a/lib/rpcIn/rpcin.c
-+++ b/lib/rpcIn/rpcin.c
+diff --git a/open-vm-tools/lib/rpcIn/rpcin.c b/open-vm-tools/lib/rpcIn/rpcin.c
+index 8eea7d86..c48f5be2 100644
+--- a/open-vm-tools/lib/rpcIn/rpcin.c
++++ b/open-vm-tools/lib/rpcIn/rpcin.c
 @@ -57,7 +57,7 @@
  
  #if defined(VMTOOLS_USE_VSOCKET)
@@ -100,10 +100,10 @@ index c2c51583..d6c62f10 100644
  #  include "asyncsocket.h"
  #  include "vmci_defs.h"
  #include "dataMap.h"
-diff --git a/services/plugins/grabbitmqProxy/grabbitmqProxyPlugin.c b/services/plugins/grabbitmqProxy/grabbitmqProxyPlugin.c
+diff --git a/open-vm-tools/services/plugins/grabbitmqProxy/grabbitmqProxyPlugin.c b/open-vm-tools/services/plugins/grabbitmqProxy/grabbitmqProxyPlugin.c
 index 03700937..f0b49ad7 100644
---- a/services/plugins/grabbitmqProxy/grabbitmqProxyPlugin.c
-+++ b/services/plugins/grabbitmqProxy/grabbitmqProxyPlugin.c
+--- a/open-vm-tools/services/plugins/grabbitmqProxy/grabbitmqProxyPlugin.c
++++ b/open-vm-tools/services/plugins/grabbitmqProxy/grabbitmqProxyPlugin.c
 @@ -48,7 +48,7 @@
  #include "rpcout.h"
  #include "rabbitmqProxyConst.h"
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0003-use-posix-strerror_r-unless-on-gnu-libc-system.patch b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0010-use-posix-strerror_r-unless-on-gnu-libc-system.patch
similarity index 80%
rename from meta-oe/recipes-support/open-vm-tools/open-vm-tools/0003-use-posix-strerror_r-unless-on-gnu-libc-system.patch
rename to meta-oe/recipes-support/open-vm-tools/open-vm-tools/0010-use-posix-strerror_r-unless-on-gnu-libc-system.patch
index c7d34c5cfa..784b4fc6c5 100644
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0003-use-posix-strerror_r-unless-on-gnu-libc-system.patch
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0010-use-posix-strerror_r-unless-on-gnu-libc-system.patch
@@ -1,4 +1,4 @@
-From a2e7d9273261c5c5cbc33796900f415097f5455e Mon Sep 17 00:00:00 2001
+From e86a259e1ce19c70ecfdece69ab53a07c63a34e1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 13 Jun 2018 23:16:53 -0700
 Subject: [PATCH] use posix strerror_r unless on gnu libc system
@@ -8,10 +8,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  open-vm-tools/lib/err/errPosix.c | 9 ++++++---
  1 file changed, 6 insertions(+), 3 deletions(-)
 
-diff --git a/lib/err/errPosix.c b/lib/err/errPosix.c
+diff --git a/open-vm-tools/lib/err/errPosix.c b/open-vm-tools/lib/err/errPosix.c
 index c81b4c13..7a403640 100644
---- a/lib/err/errPosix.c
-+++ b/lib/err/errPosix.c
+--- a/open-vm-tools/lib/err/errPosix.c
++++ b/open-vm-tools/lib/err/errPosix.c
 @@ -31,6 +31,7 @@
  #include <errno.h>
  #include <string.h>
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0004-Use-uintmax_t-for-handling-rlim_t.patch b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0011-Use-uintmax_t-for-handling-rlim_t.patch
similarity index 73%
rename from meta-oe/recipes-support/open-vm-tools/open-vm-tools/0004-Use-uintmax_t-for-handling-rlim_t.patch
rename to meta-oe/recipes-support/open-vm-tools/open-vm-tools/0011-Use-uintmax_t-for-handling-rlim_t.patch
index e802dca4eb..0a1d008733 100644
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0004-Use-uintmax_t-for-handling-rlim_t.patch
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0011-Use-uintmax_t-for-handling-rlim_t.patch
@@ -1,4 +1,4 @@
-From e694a122c1ff32d8b951ae55756796f9576d23ed Mon Sep 17 00:00:00 2001
+From 18eea61a7a768c6c3b57c6683c7bef7049f0f6ab Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 13 Jun 2018 23:37:09 -0700
 Subject: [PATCH] Use uintmax_t for handling rlim_t
@@ -12,10 +12,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  open-vm-tools/lib/hgfsServer/hgfsServerLinux.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/lib/hgfsServer/hgfsServerLinux.c b/lib/hgfsServer/hgfsServerLinux.c
-index 2e73707d..a2fdb850 100644
---- a/lib/hgfsServer/hgfsServerLinux.c
-+++ b/lib/hgfsServer/hgfsServerLinux.c
+diff --git a/open-vm-tools/lib/hgfsServer/hgfsServerLinux.c b/open-vm-tools/lib/hgfsServer/hgfsServerLinux.c
+index 0e6351a9..a2ee1740 100644
+--- a/open-vm-tools/lib/hgfsServer/hgfsServerLinux.c
++++ b/open-vm-tools/lib/hgfsServer/hgfsServerLinux.c
 @@ -5294,8 +5294,8 @@ HgfsWriteCheckIORange(off_t offset,         // IN:
        goto exit;
     }
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-Use-off64_t-instead-of-__off64_t.patch b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0012-Use-off64_t-instead-of-__off64_t.patch
similarity index 77%
rename from meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-Use-off64_t-instead-of-__off64_t.patch
rename to meta-oe/recipes-support/open-vm-tools/open-vm-tools/0012-Use-off64_t-instead-of-__off64_t.patch
index 432496f27f..d69b74e23a 100644
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-Use-off64_t-instead-of-__off64_t.patch
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0012-Use-off64_t-instead-of-__off64_t.patch
@@ -1,4 +1,4 @@
-From 43d859f9d5eecdc0fdc1a6bf539bcde4a152e6f5 Mon Sep 17 00:00:00 2001
+From 123c690f12f560022305b0cf19499e7f81a690ae Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 27 Aug 2018 23:22:21 -0700
 Subject: [PATCH] Use off64_t instead of __off64_t
@@ -9,13 +9,13 @@ unknown type name '__off64_t'
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- lib/file/fileIOPosix.c | 4 ++--
+ open-vm-tools/lib/file/fileIOPosix.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/lib/file/fileIOPosix.c b/lib/file/fileIOPosix.c
+diff --git a/open-vm-tools/lib/file/fileIOPosix.c b/open-vm-tools/lib/file/fileIOPosix.c
 index 23108279..bcd2ddc5 100644
---- a/lib/file/fileIOPosix.c
-+++ b/lib/file/fileIOPosix.c
+--- a/open-vm-tools/lib/file/fileIOPosix.c
++++ b/open-vm-tools/lib/file/fileIOPosix.c
 @@ -206,10 +206,10 @@ static AlignedPool alignedPool;
         * the symbols (and anyone building XOPEN<700 gets nothing).
         */
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-misc-Do-not-print-NULL-string-into-logs.patch b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0013-misc-Do-not-print-NULL-string-into-logs.patch
similarity index 81%
rename from meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-misc-Do-not-print-NULL-string-into-logs.patch
rename to meta-oe/recipes-support/open-vm-tools/open-vm-tools/0013-misc-Do-not-print-NULL-string-into-logs.patch
index 7af265a999..88f4f694c9 100644
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-misc-Do-not-print-NULL-string-into-logs.patch
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0013-misc-Do-not-print-NULL-string-into-logs.patch
@@ -1,4 +1,4 @@
-From e25d00d8297cba044c3a4d2e38749e54adac66c1 Mon Sep 17 00:00:00 2001
+From cfc6839362bd96bf2f42954160f16a60bf1de377 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 22 Dec 2018 19:59:02 -0800
 Subject: [PATCH] misc: Do not print NULL string into logs
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  open-vm-tools/lib/misc/util_misc.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff --git open-vm-tools/lib/misc/util_misc.c b/open-vm-tools/lib/misc/util_misc.c
+diff --git a/open-vm-tools/lib/misc/util_misc.c b/open-vm-tools/lib/misc/util_misc.c
 index 198c23d2..0ac0a335 100644
---- open-vm-tools/lib/misc/util_misc.c
-+++ open-vm-tools/lib/misc/util_misc.c
+--- a/open-vm-tools/lib/misc/util_misc.c
++++ b/open-vm-tools/lib/misc/util_misc.c
 @@ -719,8 +719,8 @@ Util_ExpandString(const char *fileName) // IN  file path to expand
        ASSERT(!freeChunk[i]);
        chunks[i] = expand;
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/fix-subdir-objects-configure-error.patch b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/fix-subdir-objects-configure-error.patch
deleted file mode 100644
index 1a6bfdb09b..0000000000
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/fix-subdir-objects-configure-error.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-Index: open-vm-tools/configure.ac
-===================================================================
---- open-vm-tools.orig/configure.ac
-+++ open-vm-tools/configure.ac
-@@ -303,6 +303,7 @@ AC_ARG_ENABLE(
-    [],
-    [enable_resolutionkms="auto"])
- 
-+AM_INIT_AUTOMAKE([subdir-objects])
- AM_INIT_AUTOMAKE
- 
- ###
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.3.5.bb b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.3.5.bb
index 7ed6593727..cea18c6c4e 100644
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.3.5.bb
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.3.5.bb
@@ -22,23 +22,23 @@ LICENSE_modules/linux = "GPL-2.0"
 LICENSE_modules/solaris = "CDDL-1.0"
 
 SRC_URI = "git://github.com/vmware/open-vm-tools.git;protocol=https \
-           file://tools.conf \
-           file://vmtoolsd.service \
-           file://vmtoolsd.init \
-           file://0001-configure.ac-don-t-use-dnet-config.patch \
-           file://0002-add-include-sys-sysmacros.h.patch \
-           file://0005-Use-configure-test-for-struct-timespec.patch \
-           file://0006-Fix-definition-of-ALLPERMS-and-ACCESSPERMS.patch \
-           file://0007-Use-configure-to-test-for-feature-instead-of-platfor.patch \
-           file://0011-Use-configure-test-for-sys-stat.h-include.patch \
-           file://fix-subdir-objects-configure-error.patch \
-           file://0001-include-poll.h-instead-of-sys-poll.h.patch \
-           file://0002-Rename-poll.h-to-vm_poll.h.patch \
-           file://0003-use-posix-strerror_r-unless-on-gnu-libc-system.patch \
-           file://0004-Use-uintmax_t-for-handling-rlim_t.patch \
-           file://0001-Use-off64_t-instead-of-__off64_t.patch \
-           file://0001-misc-Do-not-print-NULL-string-into-logs.patch \
-           "
+    file://tools.conf \
+    file://vmtoolsd.service \
+    file://vmtoolsd.init \
+    file://0001-configure.ac-don-t-use-dnet-config.patch;patchdir=.. \
+    file://0002-add-include-sys-sysmacros.h.patch;patchdir=.. \
+    file://0003-Use-configure-test-for-struct-timespec.patch;patchdir=.. \
+    file://0004-Fix-definition-of-ALLPERMS-and-ACCESSPERMS.patch;patchdir=.. \
+    file://0005-Use-configure-to-test-for-feature-instead-of-platfor.patch;patchdir=.. \
+    file://0006-Use-configure-test-for-sys-stat.h-include.patch;patchdir=.. \
+    file://0007-Fix-subdir-objects-configure-error.patch;patchdir=.. \
+    file://0008-include-poll.h-instead-of-sys-poll.h.patch;patchdir=.. \
+    file://0009-Rename-poll.h-to-vm_poll.h.patch;patchdir=.. \
+    file://0010-use-posix-strerror_r-unless-on-gnu-libc-system.patch;patchdir=.. \
+    file://0011-Use-uintmax_t-for-handling-rlim_t.patch;patchdir=.. \
+    file://0012-Use-off64_t-instead-of-__off64_t.patch;patchdir=.. \
+    file://0013-misc-Do-not-print-NULL-string-into-logs.patch;patchdir=.. \
+"
 # stable-10.3.5
 SRCREV = "f2ff192717375b95a6b7e278fb47dbb3d3bc56d1"
 
-- 
2.17.1


