Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id AFD1279559
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Oct 2018 17:34:03 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id 185-v6so3029359wmt.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Oct 2018 10:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=i6k0+H4b3gk09oVmHvOT2xY4cGWdJuDM8kX3L/XwSfA=;
	b=XXe7CGpbCirjopGszlPgDUXV9fyGLtOMDTCymapVSjI4LV3LE8QgSF9Xnku/PicA2W
	HlWI/3VbITmtzsurXirNoDjcCpRhJPlY1YoWWLW2u6LfQ16wnybn1v8KW5Xp+pGJ7Nyb
	YPaJwGH5R2MWlYNBHoq2kAM/kNguXGfDsz9CWZ6OQ/oD13SycK8PKIw85CaTzehnIyQb
	mBlh8e00Tqp2G//BYEXafNh6vLvVxaRHC5ijCPuLmhZfP4VHKgrruUhgjKH6kREVrGKi
	hYwdwzNxNUU+USr1pvtqyXxXbvpRmF4VaOV9c338dgaI2Izh7vbP8lpvXGo+3gV3kz2b
	Nngw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=i6k0+H4b3gk09oVmHvOT2xY4cGWdJuDM8kX3L/XwSfA=;
	b=EWvNTT8Ye1p3MUhG4vHT5i1Jlmj56xE0GYeCQpepKvPOCt2fCvLIG9bwpBDAjFL4Hz
	qYH5DsmOKfbIc+zLGHR3Z4YNW6/SfeLk7pCcl/Zi7vQIcIqsVOwskag7hFfxFUJa8yLb
	+Bh/Nqx+Tocuor0Fs8lsnQ40qK1HCH6enoB31RAVi0o6fn72Eu4GtE6FMvoVwvtsM/QY
	b4Zxz4YSmiaE+FWQ0Z9TQk20rYWy39Dhxb1+rAjV+H8Mc8Oa/7VewgKreiHNzfDg1tJW
	SeZpLj4+vjZYANS963/2pdCCxNmFhm4blyDCrvyqHv3xerRI6qvGq+YWWb/f23c8OcDL
	ckAA==
X-Gm-Message-State: ABuFfojApYfd4RGiT/vG3BiTSgs8pF7v7Tr2mRejSg4cxblGpv6Xo4dI
	RZqevyaF0BZVpIUM20f2Urgyo36r
X-Google-Smtp-Source: ACcGV60daHxrnQdrr7YG2T5Qr7XqNVWfV5HyvUJRPAZ9aEQQOoG/IsxEjK5GZqrciO6B7UorVDNCsA==
X-Received: by 2002:a1c:9b91:: with SMTP id
	d139-v6mr2582759wme.50.1538501643617; 
	Tue, 02 Oct 2018 10:34:03 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	p11-v6sm17663839wrd.74.2018.10.02.10.34.02
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 02 Oct 2018 10:34:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  2 Oct 2018 17:33:58 +0000
Message-Id: <20181002173359.25493-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181002173359.25493-1-Martin.Jansa@gmail.com>
References: <20181002173359.25493-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/4] android-tools: use patchdir parameter to apply patches
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
X-List-Received-Date: Tue, 02 Oct 2018 17:34:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* helps to apply the patches for correct git repo
* split remove-selinux-android.patch into 2, because devtool modify fails to apply
  it across 2 different git repositories:
ERROR: Command Error: 'sh -c 'PATCHFILE="remove-selinux-android.patch" git -c user.name="OpenEmbedded" -c user.email="oe.patch@oe" commit -F /tmp/tmpvn7yf20j --author="Sergio Schvezov <sergio.schvezov@canonical.com>" --date="Wed, 7 Sep 2016 12:58:47 +0300"'' exited with 0  Output:
On branch devtool
Changes not staged for commit:
        modified:   system/core (modified content)
        modified:   system/extras (modified content)

no changes added to commit
ERROR: Function failed: patch_do_patch
ERROR: Logfile of failure stored in: /OE/build/owpb/webos-ports/tmp-glibc/work/aarch64-webos-linux/android-tools/5.1.1.r37-r0/devtooltmp-7qrccor9/temp/log.do_patch.8643
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
ERROR: Extracting source for android-tools failed

* similarly with remove-bionic-android.patch

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../0001-add-base64-implementation.patch      | 16 +++++-----
 .../android-tools/0002-adb-Musl-fixes.patch   | 32 +++++++++----------
 .../android-tools/define-shell-command.patch  |  6 ++--
 .../android-tools/fix-big-endian-build.patch  |  6 ++--
 ...eclaration-function-strlcat-strlcopy.patch | 18 +++++------
 ...Add-dt-parameter-to-specify-DT-image.patch | 12 +++----
 .../remove-bionic-android-libselinux.patch    | 16 ++++++++++
 .../android-tools/remove-bionic-android.patch | 29 ++++++-----------
 .../remove-selinux-android-extras.patch       | 28 ++++++++++++++++
 .../remove-selinux-android.patch              | 29 ++---------------
 .../android-tools/use-capability.patch        |  6 ++--
 .../android-tools/use-local-socket.patch      | 18 +++++------
 .../android-tools/android-tools_5.1.1.r37.bb  | 26 ++++++++-------
 13 files changed, 127 insertions(+), 115 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/remove-bionic-android-libselinux.patch
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/remove-selinux-android-extras.patch

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/0001-add-base64-implementation.patch b/meta-oe/recipes-devtools/android-tools/android-tools/0001-add-base64-implementation.patch
index 680d21f3ac..fa7253a2b5 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools/0001-add-base64-implementation.patch
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/0001-add-base64-implementation.patch
@@ -7,15 +7,15 @@ musl needs it
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- system/core/adb/adb_auth_client.c |   2 +-
- system/core/adb/base64.c          | 315 ++++++++++++++++++++++++++++++++++++++
+ adb/adb_auth_client.c |   2 +-
+ adb/base64.c          | 315 ++++++++++++++++++++++++++++++++++++++
  2 files changed, 316 insertions(+), 1 deletion(-)
- create mode 100644 system/core/adb/base64.c
+ create mode 100644 adb/base64.c
 
-diff --git a/system/core/adb/adb_auth_client.c b/system/core/adb/adb_auth_client.c
+diff --git a/adb/adb_auth_client.c b/adb/adb_auth_client.c
 index 55e9dca..104b413 100644
---- a/system/core/adb/adb_auth_client.c
-+++ b/system/core/adb/adb_auth_client.c
+--- a/adb/adb_auth_client.c
++++ b/adb/adb_auth_client.c
 @@ -75,7 +75,7 @@ static void read_keys(const char *file, struct listnode *list)
          if (sep)
              *sep = '\0';
@@ -25,11 +25,11 @@ index 55e9dca..104b413 100644
          if (ret != sizeof(key->key)) {
              D("%s: Invalid base64 data ret=%d\n", file, ret);
              free(key);
-diff --git a/system/core/adb/base64.c b/system/core/adb/base64.c
+diff --git a/adb/base64.c b/adb/base64.c
 new file mode 100644
 index 0000000..95da284
 --- /dev/null
-+++ b/system/core/adb/base64.c
++++ b/adb/base64.c
 @@ -0,0 +1,315 @@
 +/*
 + * Copyright (c) 1996-1999 by Internet Software Consortium.
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/0002-adb-Musl-fixes.patch b/meta-oe/recipes-devtools/android-tools/android-tools/0002-adb-Musl-fixes.patch
index c7aebb6411..23feaba81e 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools/0002-adb-Musl-fixes.patch
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/0002-adb-Musl-fixes.patch
@@ -9,16 +9,16 @@ Do not redefine close() and lseek()
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- system/core/adb/adb.h                    |  2 ++
- system/core/adb/disable_verity_service.c | 13 ++++++++-----
- system/core/adb/framebuffer_service.c    |  7 ++++---
- system/core/adb/sysdeps.h                | 12 ++++++------
+ adb/adb.h                    |  2 ++
+ adb/disable_verity_service.c | 13 ++++++++-----
+ adb/framebuffer_service.c    |  7 ++++---
+ adb/sysdeps.h                | 12 ++++++------
  4 files changed, 20 insertions(+), 14 deletions(-)
 
-diff --git a/system/core/adb/adb.h b/system/core/adb/adb.h
+diff --git a/adb/adb.h b/adb/adb.h
 index 44e5981..bcdc49f 100644
---- a/system/core/adb/adb.h
-+++ b/system/core/adb/adb.h
+--- a/adb/adb.h
++++ b/adb/adb.h
 @@ -18,7 +18,9 @@
  #define __ADB_H
  
@@ -29,10 +29,10 @@ index 44e5981..bcdc49f 100644
  #include "adb_trace.h"
  #include "transport.h"  /* readx(), writex() */
  
-diff --git a/system/core/adb/disable_verity_service.c b/system/core/adb/disable_verity_service.c
+diff --git a/adb/disable_verity_service.c b/adb/disable_verity_service.c
 index ed3da52..29fa3d6 100644
---- a/system/core/adb/disable_verity_service.c
-+++ b/system/core/adb/disable_verity_service.c
+--- a/adb/disable_verity_service.c
++++ b/adb/disable_verity_service.c
 @@ -14,25 +14,28 @@
   * limitations under the License.
   */
@@ -67,10 +67,10 @@ index ed3da52..29fa3d6 100644
  static void write_console(int fd, const char* format, ...)
  {
      char buffer[256];
-diff --git a/system/core/adb/framebuffer_service.c b/system/core/adb/framebuffer_service.c
+diff --git a/adb/framebuffer_service.c b/adb/framebuffer_service.c
 index 8cbe840..8f0ccfb 100644
---- a/system/core/adb/framebuffer_service.c
-+++ b/system/core/adb/framebuffer_service.c
+--- a/adb/framebuffer_service.c
++++ b/adb/framebuffer_service.c
 @@ -14,6 +14,10 @@
   * limitations under the License.
   */
@@ -92,10 +92,10 @@ index 8cbe840..8f0ccfb 100644
  #include <linux/fb.h>
  #include <sys/ioctl.h>
  #include <sys/mman.h>
-diff --git a/system/core/adb/sysdeps.h b/system/core/adb/sysdeps.h
+diff --git a/adb/sysdeps.h b/adb/sysdeps.h
 index cc1f839..ea39ac3 100644
---- a/system/core/adb/sysdeps.h
-+++ b/system/core/adb/sysdeps.h
+--- a/adb/sysdeps.h
++++ b/adb/sysdeps.h
 @@ -123,8 +123,8 @@ static __inline__ int  unix_close(int fd)
  {
      return close(fd);
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/define-shell-command.patch b/meta-oe/recipes-devtools/android-tools/android-tools/define-shell-command.patch
index 8381967c44..64edd0d119 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools/define-shell-command.patch
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/define-shell-command.patch
@@ -4,11 +4,11 @@ Author: Fathi Boudra <fabo@debian.org>
 
 Upstream-Status: Inappropriate
 ---
- system/core/adb/services.c |    4 ----
+ adb/services.c |    4 ----
  1 file changed, 4 deletions(-)
 
---- a/system/core/adb/services.c
-+++ b/system/core/adb/services.c
+--- a/adb/services.c
++++ b/adb/services.c
 @@ -299,11 +299,7 @@ static int create_subproc_raw(const char
  }
  #endif  /* !ABD_HOST */
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/fix-big-endian-build.patch b/meta-oe/recipes-devtools/android-tools/android-tools/fix-big-endian-build.patch
index 8deaf3a3d7..2b91c3baf8 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools/fix-big-endian-build.patch
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/fix-big-endian-build.patch
@@ -15,10 +15,10 @@ them to be used when initializing structures.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 
-Index: b/system/core/adb/usb_linux_client.c
+Index: b/adb/usb_linux_client.c
 ===================================================================
---- a/system/core/adb/usb_linux_client.c
-+++ b/system/core/adb/usb_linux_client.c
+--- a/adb/usb_linux_client.c
++++ b/adb/usb_linux_client.c
 @@ -34,8 +34,15 @@
  #define MAX_PACKET_SIZE_FS	64
  #define MAX_PACKET_SIZE_HS	512
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/implicit-declaration-function-strlcat-strlcopy.patch b/meta-oe/recipes-devtools/android-tools/android-tools/implicit-declaration-function-strlcat-strlcopy.patch
index 64db6168c6..f26e5d0cfc 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools/implicit-declaration-function-strlcat-strlcopy.patch
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/implicit-declaration-function-strlcat-strlcopy.patch
@@ -3,13 +3,13 @@ Author: Fathi Boudra <fabo@debian.org>
 
 Upstream-Status: Inappropriate
 ---
- system/core/adb/adb.c                |    1 +
- system/core/fs_mgr/fs_mgr_fstab.c    |    2 +-
- system/core/include/cutils/sockets.h |    2 +-
+ adb/adb.c                |    1 +
+ fs_mgr/fs_mgr_fstab.c    |    2 +-
+ include/cutils/sockets.h |    2 +-
  3 files changed, 3 insertions(+), 2 deletions(-)
 
---- a/system/core/fs_mgr/fs_mgr_fstab.c
-+++ b/system/core/fs_mgr/fs_mgr_fstab.c
+--- a/fs_mgr/fs_mgr_fstab.c
++++ b/fs_mgr/fs_mgr_fstab.c
 @@ -17,7 +17,7 @@
  #include <ctype.h>
  #include <stdio.h>
@@ -19,8 +19,8 @@ Upstream-Status: Inappropriate
  #include <sys/mount.h>
  
  #include "fs_mgr_priv.h"
---- a/system/core/include/cutils/sockets.h
-+++ b/system/core/include/cutils/sockets.h
+--- a/include/cutils/sockets.h
++++ b/include/cutils/sockets.h
 @@ -19,7 +19,7 @@
  
  #include <errno.h>
@@ -30,8 +30,8 @@ Upstream-Status: Inappropriate
  #include <stdbool.h>
  
  #ifdef HAVE_WINSOCK
---- a/system/core/adb/adb.c
-+++ b/system/core/adb/adb.c
+--- a/adb/adb.c
++++ b/adb/adb.c
 @@ -41,6 +41,7 @@
  #include <sys/prctl.h>
  #include <getopt.h>
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/mkbootimg-Add-dt-parameter-to-specify-DT-image.patch b/meta-oe/recipes-devtools/android-tools/android-tools/mkbootimg-Add-dt-parameter-to-specify-DT-image.patch
index 35bb766a7f..76624d4060 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools/mkbootimg-Add-dt-parameter-to-specify-DT-image.patch
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/mkbootimg-Add-dt-parameter-to-specify-DT-image.patch
@@ -10,12 +10,12 @@ Change-Id: Ie29a11cbf4138426bfd19ae486d69a5fcbd8f442
 
 Upstream-Status: Inappropriate
 ---
- system/core/mkbootimg/bootimg.h   |    7 +++++--
- system/core/mkbootimg/mkbootimg.c |   21 +++++++++++++++++++++
+ mkbootimg/bootimg.h   |    7 +++++--
+ mkbootimg/mkbootimg.c |   21 +++++++++++++++++++++
  2 files changed, 26 insertions(+), 2 deletions(-)
 
---- a/system/core/mkbootimg/bootimg.h
-+++ b/system/core/mkbootimg/bootimg.h
+--- a/mkbootimg/bootimg.h
++++ b/mkbootimg/bootimg.h
 @@ -41,8 +41,8 @@ struct boot_img_hdr
  
      unsigned tags_addr;    /* physical addr for kernel tags */
@@ -41,8 +41,8 @@ Upstream-Status: Inappropriate
  **
  ** 0. all entities are page_size aligned in flash
  ** 1. kernel and ramdisk are required (size != 0)
---- a/system/core/mkbootimg/mkbootimg.c
-+++ b/system/core/mkbootimg/mkbootimg.c
+--- a/mkbootimg/mkbootimg.c
++++ b/mkbootimg/mkbootimg.c
 @@ -65,6 +65,7 @@ int usage(void)
              "       [ --board <boardname> ]\n"
              "       [ --base <address> ]\n"
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/remove-bionic-android-libselinux.patch b/meta-oe/recipes-devtools/android-tools/android-tools/remove-bionic-android-libselinux.patch
new file mode 100644
index 0000000000..7bfb98c44b
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/remove-bionic-android-libselinux.patch
@@ -0,0 +1,16 @@
+Description: remove bionic specific calls
+Author: Fathi Boudra <fabo@debian.org>
+
+Upstream-Status: Inappropriate
+---
+--- a/src/procattr.c
++++ b/src/procattr.c
+@@ -8,7 +8,7 @@
+ #include "selinux_internal.h"
+ #include "policy.h"
+ 
+-#ifdef HOST
++#ifndef __BIONIC__
+ static pid_t gettid(void)
+ {
+ 	return syscall(__NR_gettid);
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/remove-bionic-android.patch b/meta-oe/recipes-devtools/android-tools/android-tools/remove-bionic-android.patch
index e933724cfd..93b30cab68 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools/remove-bionic-android.patch
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/remove-bionic-android.patch
@@ -3,13 +3,13 @@ Author: Fathi Boudra <fabo@debian.org>
 
 Upstream-Status: Inappropriate
 ---
- system/core/include/cutils/properties.h |    1 -
- system/core/libcutils/properties.c      |    2 +-
- system/core/liblog/logd_write.c         |    5 +++++
+ include/cutils/properties.h |    1 -
+ libcutils/properties.c      |    2 +-
+ liblog/logd_write.c         |    5 +++++
  3 files changed, 6 insertions(+), 2 deletions(-)
 
---- a/system/core/include/cutils/properties.h
-+++ b/system/core/include/cutils/properties.h
+--- a/include/cutils/properties.h
++++ b/include/cutils/properties.h
 @@ -19,7 +19,6 @@
  
  #include <sys/cdefs.h>
@@ -18,8 +18,8 @@ Upstream-Status: Inappropriate
  #include <stdint.h>
  
  #ifdef __cplusplus
---- a/system/core/liblog/logd_write.c
-+++ b/system/core/liblog/logd_write.c
+--- a/liblog/logd_write.c
++++ b/liblog/logd_write.c
 @@ -23,6 +23,7 @@
  #include <stdlib.h>
  #include <string.h>
@@ -40,8 +40,8 @@ Upstream-Status: Inappropriate
  
      newVec[0].iov_base   = (unsigned char *) &log_id_buf;
      newVec[0].iov_len    = sizeof_log_id_t;
---- a/system/core/libcutils/properties.c
-+++ b/system/core/libcutils/properties.c
+--- a/libcutils/properties.c
++++ b/libcutils/properties.c
 @@ -104,10 +104,10 @@ int32_t property_get_int32(const char *k
      return (int32_t)property_get_imax(key, INT32_MIN, INT32_MAX, default_value);
  }
@@ -54,14 +54,3 @@ Upstream-Status: Inappropriate
  
  int property_set(const char *key, const char *value)
  {
---- a/external/libselinux/src/procattr.c
-+++ b/external/libselinux/src/procattr.c
-@@ -8,7 +8,7 @@
- #include "selinux_internal.h"
- #include "policy.h"
- 
--#ifdef HOST
-+#ifndef __BIONIC__
- static pid_t gettid(void)
- {
- 	return syscall(__NR_gettid);
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/remove-selinux-android-extras.patch b/meta-oe/recipes-devtools/android-tools/android-tools/remove-selinux-android-extras.patch
new file mode 100644
index 0000000000..c52d935f57
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/remove-selinux-android-extras.patch
@@ -0,0 +1,28 @@
+Subject: drop useless includes of Android SELINUX extensions; avoids having to clone another module; this should be sent upstream
+Author: Sergio Schvezov <sergio.schvezov@canonical.com>
+
+Upstream-Status: Inappropriate
+---
+ ext4_utils/make_ext4fs.c      |    1 -
+ ext4_utils/make_ext4fs_main.c |    1 -
+
+--- a/ext4_utils/make_ext4fs.c
++++ b/ext4_utils/make_ext4fs.c
+@@ -62,7 +62,6 @@
+ 
+ #include <selinux/selinux.h>
+ #include <selinux/label.h>
+-#include <selinux/android.h>
+ 
+ #define O_BINARY 0
+ 
+--- a/ext4_utils/make_ext4fs_main.c
++++ b/ext4_utils/make_ext4fs_main.c
+@@ -32,7 +32,6 @@
+ #ifndef USE_MINGW
+ #include <selinux/selinux.h>
+ #include <selinux/label.h>
+-#include <selinux/android.h>
+ #else
+ struct selabel_handle;
+ #endif
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/remove-selinux-android.patch b/meta-oe/recipes-devtools/android-tools/android-tools/remove-selinux-android.patch
index d4a37f82be..bc0dd4a2e9 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools/remove-selinux-android.patch
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/remove-selinux-android.patch
@@ -3,33 +3,10 @@ Author: Sergio Schvezov <sergio.schvezov@canonical.com>
 
 Upstream-Status: Inappropriate
 ---
- system/core/adb/file_sync_service.c         |    3 ---
- system/extras/ext4_utils/make_ext4fs.c      |    1 -
- system/extras/ext4_utils/make_ext4fs_main.c |    1 -
- 3 files changed, 5 deletions(-)
+ adb/file_sync_service.c         |    3 ---
 
---- a/system/extras/ext4_utils/make_ext4fs.c
-+++ b/system/extras/ext4_utils/make_ext4fs.c
-@@ -62,7 +62,6 @@
- 
- #include <selinux/selinux.h>
- #include <selinux/label.h>
--#include <selinux/android.h>
- 
- #define O_BINARY 0
- 
---- a/system/extras/ext4_utils/make_ext4fs_main.c
-+++ b/system/extras/ext4_utils/make_ext4fs_main.c
-@@ -32,7 +32,6 @@
- #ifndef USE_MINGW
- #include <selinux/selinux.h>
- #include <selinux/label.h>
--#include <selinux/android.h>
- #else
- struct selabel_handle;
- #endif
---- a/system/core/adb/file_sync_service.c
-+++ b/system/core/adb/file_sync_service.c
+--- a/adb/file_sync_service.c
++++ b/adb/file_sync_service.c
 @@ -26,7 +26,6 @@
  
  #include <errno.h>
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/use-capability.patch b/meta-oe/recipes-devtools/android-tools/android-tools/use-capability.patch
index b8ebe09dc0..aef2ac2c1c 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools/use-capability.patch
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/use-capability.patch
@@ -3,11 +3,11 @@ Author: Loïc Minier <loic.minier@ubuntu.com>
 
 Upstream-Status: Inappropriate
 ---
- system/core/include/private/android_filesystem_config.h |    2 +-
+ include/private/android_filesystem_config.h |    2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
---- a/system/core/include/private/android_filesystem_config.h
-+++ b/system/core/include/private/android_filesystem_config.h
+--- a/include/private/android_filesystem_config.h
++++ b/include/private/android_filesystem_config.h
 @@ -27,7 +27,7 @@
  #include <sys/types.h>
  #include <stdint.h>
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/use-local-socket.patch b/meta-oe/recipes-devtools/android-tools/android-tools/use-local-socket.patch
index 7facd61b90..0ff37e0380 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools/use-local-socket.patch
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/use-local-socket.patch
@@ -3,13 +3,13 @@ Author: Hilko Bengen <bengen@debian.org>
 
 Upstream-Status: Inappropriate
 ---
- system/core/adb/adb.c             |    6 +++++-
- system/core/adb/adb_client.c      |    5 +++--
- system/core/adb/transport_local.c |    3 ++-
+ adb/adb.c             |    6 +++++-
+ adb/adb_client.c      |    5 +++--
+ adb/transport_local.c |    3 ++-
  3 files changed, 10 insertions(+), 4 deletions(-)
 
---- a/system/core/adb/adb.c
-+++ b/system/core/adb/adb.c
+--- a/adb/adb.c
++++ b/adb/adb.c
 @@ -1230,7 +1230,11 @@ int launch_server(int server_port)
   */
  void build_local_name(char* target_str, size_t target_size, int server_port)
@@ -23,8 +23,8 @@ Upstream-Status: Inappropriate
  }
  
  #if !ADB_HOST
---- a/system/core/adb/adb_client.c
-+++ b/system/core/adb/adb_client.c
+--- a/adb/adb_client.c
++++ b/adb/adb_client.c
 @@ -185,12 +185,12 @@ int _adb_connect(const char *service)
          strcpy(__adb_error, "service name too long");
          return -1;
@@ -48,8 +48,8 @@ Upstream-Status: Inappropriate
      if(writex(fd, tmp, 4) || writex(fd, service, len)) {
          strcpy(__adb_error, "write failure during connection");
          adb_close(fd);
---- a/system/core/adb/transport_local.c
-+++ b/system/core/adb/transport_local.c
+--- a/adb/transport_local.c
++++ b/adb/transport_local.c
 @@ -121,7 +121,8 @@ int local_connect_arbitrary_ports(int co
      }
  #endif
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
index 74f2bf221e..1478c1205e 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
@@ -30,17 +30,21 @@ SRC_URI = " \
     git://${LIBHARDWARE_REPO};name=libhardware;protocol=https;nobranch=1;destsuffix=git/hardware/libhardware \
     git://${LIBSELINUX_REPO};name=libselinux;protocol=https;nobranch=1;destsuffix=git/external/libselinux \
     git://${BUILD_REPO};name=build;protocol=https;nobranch=1;destsuffix=git/build \
-    file://remove-selinux-android.patch \
-    file://use-capability.patch \
-    file://use-local-socket.patch \
+    file://remove-selinux-android.patch;patchdir=system/core \
+    file://use-capability.patch;patchdir=system/core \
+    file://use-local-socket.patch;patchdir=system/core \
+    file://mkbootimg-Add-dt-parameter-to-specify-DT-image.patch;patchdir=system/core \
+    file://remove-bionic-android.patch;patchdir=system/core \
+    file://define-shell-command.patch;patchdir=system/core \
+    file://implicit-declaration-function-strlcat-strlcopy.patch;patchdir=system/core \
+    file://fix-big-endian-build.patch;patchdir=system/core \
+    file://0001-add-base64-implementation.patch;patchdir=system/core \
+    file://0002-adb-Musl-fixes.patch;patchdir=system/core \
+    file://0001-usb_linux.c-fix-build-with-glibc-2.28.patch;patchdir=system/core \
+    file://0001-Allow-adbd-to-be-ran-as-root.patch;patchdir=system/core \
+    file://remove-selinux-android-extras.patch;patchdir=system/extras \
     file://preserve-ownership.patch;patchdir=system/extras \
-    file://mkbootimg-Add-dt-parameter-to-specify-DT-image.patch \
-    file://remove-bionic-android.patch \
-    file://define-shell-command.patch \
-    file://implicit-declaration-function-strlcat-strlcopy.patch \
-    file://fix-big-endian-build.patch \
-    file://0001-add-base64-implementation.patch \
-    file://0002-adb-Musl-fixes.patch \
+    file://remove-bionic-android-libselinux.patch;patchdir=external/libselinux \
     file://android-tools-adbd.service \
     file://.gitignore;subdir=git \
     file://adb.mk;subdir=${BPN} \
@@ -48,8 +52,6 @@ SRC_URI = " \
     file://ext4_utils.mk;subdir=${BPN} \
     file://fastboot.mk;subdir=${BPN} \
     file://mkbootimg.mk;subdir=${BPN} \
-    file://0001-usb_linux.c-fix-build-with-glibc-2.28.patch;patchdir=system/core \
-    file://0001-Allow-adbd-to-be-ran-as-root.patch;patchdir=system/core \
 "
 
 S = "${WORKDIR}/git"
-- 
2.17.1


