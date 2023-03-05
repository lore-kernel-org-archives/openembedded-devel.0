Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03576C6FA8E
	for <webhook@archiver.kernel.org>; Sun,  5 Mar 2023 22:34:30 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.19942.1678055665709336105
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Mar 2023 14:34:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OodyZwSA;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id x20-20020a17090a8a9400b00233ba727724so9557790pjn.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Mar 2023 14:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678055665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k03lNkgjHiNqHfALS/GTrSYLaU1lKAFXGExCLEnWqJs=;
        b=OodyZwSASuQLc4tlo0PsZWI401Cj/RmnF1nmed9VjK8QqBDkoltWA1wFcI2ePj8wLy
         wcpREdkeQoEUvoY/eFortTAdYbC7i6L2L8jyFNMxkefD5l1ONAyVKjARBfX0Nz1/lUxP
         DnsW6iMXGmvpvXkztZpuz38K8cegCVthz5igqg0dyKWv1cuGsN7A4FaCniMNtDMthXvq
         TEbicnNMlVevoVUVSMZWvyd9QYl9FdBLNy9GAzbMNjkZ/fEYGBRQ524Du+5CCSLMF8DJ
         ypJeYmjXdJ0WnolMCAouSiPgJ/xA2CR8NVpgXIskchEd/4dAAcTprrI+PtUE10AFtX8V
         qOHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678055665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k03lNkgjHiNqHfALS/GTrSYLaU1lKAFXGExCLEnWqJs=;
        b=4AVXz1KtqxkU0r22NcadHIHvs08gTxHK5N5DdtvztfhlYeUdcLrEldVWJ+ZTY6xhG2
         ggz/+REhsZye0mlC1AYFK2Xm9J0V0ifUVzRmG1Sm2O6UgdVXhH/DmZsYm/k0cZbWX2Qk
         0zhoPGpTDSp5j3XdZwh6Trc19k1mwXxKA+yx7cek5cyms6qbQxqpfUj4tXdDRWqV8A0g
         +i419vdF2wFSfcCYS/nWPoCh/lh+rfOPnCRd16sYR57lhynu8Om8ZyA4jbZz7vpvnuvw
         IOujGzrvmDLkF26UOQKdxIyoNwDewKXhEdJbrS9HGUDGqry1GiXaFo/RymOeSWVzrYVE
         I1iQ==
X-Gm-Message-State: AO0yUKXcznoVKT4NGKfEKiQfph7217BTVei0exwOUdO+omt1lrNDgyK+
	JTr2cWigzHl2BS6vameMZS3gA1H/CgY=
X-Google-Smtp-Source: AK7set+u8krAHnf3No3Fes0Ly+zX+NlgNJC7mXq3x/JawXkU/ezMIe+002S25GuDYJB+VjJDrfBVag==
X-Received: by 2002:a17:902:d509:b0:19c:65bd:d44b with SMTP id b9-20020a170902d50900b0019c65bdd44bmr11495089plg.60.1678055664794;
        Sun, 05 Mar 2023 14:34:24 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::c80d])
        by smtp.gmail.com with ESMTPSA id ks3-20020a170903084300b0019c901c207dsm5207269plb.177.2023.03.05.14.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Mar 2023 14:34:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 2/2] vlc: Upgrade to 3.0.18
Date: Sun,  5 Mar 2023 14:34:20 -0800
Message-Id: <20230305223420.2324783-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230305223420.2324783-1-raj.khem@gmail.com>
References: <20230305223420.2324783-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Mar 2023 22:34:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101389

Drop 64-bit time_t patch, its already fixed in 3.0.18
Add patches to fix buld with clang16 and musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../vlc/vlc/0001-include-limits-header.patch  | 43 -----------------
 .../vlc/0001-make-opencv-configurable.patch   |  8 ++--
 .../vlc/vlc/0002-use-vorbisidec.patch         |  8 ++--
 ...packageconfig-to-detect-mmal-support.patch |  7 +--
 ...ave-same-signature-between-glibc-and.patch | 47 +++++++++++++++++++
 ...-Use-SYS_futex-instead-of-__NR_futex.patch | 46 ------------------
 ...e-incompatible-function-pointer-type.patch | 31 ++++++++++++
 .../vlc/{vlc_3.0.17-1.bb => vlc_3.0.18.bb}    |  5 +-
 8 files changed, 88 insertions(+), 107 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc/0001-include-limits-header.patch
 create mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc/0005-ioctl-does-not-have-same-signature-between-glibc-and.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc/0005-linux-thread-Use-SYS_futex-instead-of-__NR_futex.patch
 create mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc/0006-configure-Disable-incompatible-function-pointer-type.patch
 rename meta-multimedia/recipes-multimedia/vlc/{vlc_3.0.17-1.bb => vlc_3.0.18.bb} (96%)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/0001-include-limits-header.patch b/meta-multimedia/recipes-multimedia/vlc/vlc/0001-include-limits-header.patch
deleted file mode 100644
index e1383c826c..0000000000
--- a/meta-multimedia/recipes-multimedia/vlc/vlc/0001-include-limits-header.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 1068c7451855c3f9acde9af265b5a790073b1641 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 2 Mar 2021 14:28:27 -0800
-Subject: [PATCH] include <limits> header
-
-Fixes
-SegmentInformation.cpp:397:49: error: '::max' has not been declared; d
-id you mean 'std::max'?
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- modules/demux/adaptive/playlist/SegmentInformation.cpp | 1 +
- modules/demux/hls/playlist/Parser.cpp                  | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/modules/demux/adaptive/playlist/SegmentInformation.cpp b/modules/demux/adaptive/playlist/SegmentInformation.cpp
-index 344e155..8eeb054 100644
---- a/modules/demux/adaptive/playlist/SegmentInformation.cpp
-+++ b/modules/demux/adaptive/playlist/SegmentInformation.cpp
-@@ -34,6 +34,7 @@
- 
- #include <algorithm>
- #include <cassert>
-+#include <limits>
- 
- using namespace adaptive::playlist;
- 
-diff --git a/modules/demux/hls/playlist/Parser.cpp b/modules/demux/hls/playlist/Parser.cpp
-index 67110e4..7439699 100644
---- a/modules/demux/hls/playlist/Parser.cpp
-+++ b/modules/demux/hls/playlist/Parser.cpp
-@@ -42,6 +42,7 @@
- #include <map>
- #include <cctype>
- #include <algorithm>
-+#include <limits>
- 
- using namespace adaptive;
- using namespace adaptive::playlist;
--- 
-2.30.1
-
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/0001-make-opencv-configurable.patch b/meta-multimedia/recipes-multimedia/vlc/vlc/0001-make-opencv-configurable.patch
index 950c09b8ae..cc65af009b 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc/0001-make-opencv-configurable.patch
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc/0001-make-opencv-configurable.patch
@@ -5,11 +5,9 @@ Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Tim Orling <TicoTimo@gmail.com>
 
-Index: vlc-2.1.4/configure.ac
-===================================================================
---- vlc-2.1.4.orig/configure.ac
-+++ vlc-2.1.4/configure.ac
-@@ -1693,7 +1693,16 @@ PKG_ENABLE_MODULES_VLC([BLURAY], [libblu
+--- a/configure.ac
++++ b/configure.ac
+@@ -1892,7 +1892,16 @@ PKG_ENABLE_MODULES_VLC([BLURAY], [libblu
  dnl
  dnl  OpenCV wrapper and example filters
  dnl
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/0002-use-vorbisidec.patch b/meta-multimedia/recipes-multimedia/vlc/vlc/0002-use-vorbisidec.patch
index b174ec127e..8ecddd33c6 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc/0002-use-vorbisidec.patch
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc/0002-use-vorbisidec.patch
@@ -4,11 +4,9 @@ Upstream-Status: Pending
 
 Signed-off-by: Tim Orling <TicoTimo@gmail.com>
 
-Index: vlc-2.2.1/modules/codec/Makefile.am
-===================================================================
---- vlc-2.2.1.orig/modules/codec/Makefile.am
-+++ vlc-2.2.1/modules/codec/Makefile.am
-@@ -234,7 +234,7 @@ codec_LTLIBRARIES += $(LTLIBtheora)
+--- a/modules/codec/Makefile.am
++++ b/modules/codec/Makefile.am
+@@ -321,7 +321,7 @@ codec_LTLIBRARIES += $(LTLIBdaala)
  libtremor_plugin_la_SOURCES = codec/vorbis.c
  libtremor_plugin_la_CPPFLAGS = $(AM_CPPFLAGS) -DMODULE_NAME_IS_tremor
  libtremor_plugin_la_LDFLAGS = $(AM_LDFLAGS) -rpath '$(codecdir)'
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/0004-Use-packageconfig-to-detect-mmal-support.patch b/meta-multimedia/recipes-multimedia/vlc/vlc/0004-Use-packageconfig-to-detect-mmal-support.patch
index 424aaa2815..078ac41ca5 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc/0004-Use-packageconfig-to-detect-mmal-support.patch
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc/0004-Use-packageconfig-to-detect-mmal-support.patch
@@ -13,11 +13,9 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  configure.ac | 31 +++++++++++--------------------
  1 file changed, 11 insertions(+), 20 deletions(-)
 
-diff --git a/configure.ac b/configure.ac
-index d7cf692..f81b99d 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3427,27 +3427,18 @@ AC_ARG_ENABLE(mmal,
+@@ -3461,27 +3461,18 @@ AC_ARG_ENABLE(mmal,
    AS_HELP_STRING([--enable-mmal],
      [Multi-Media Abstraction Layer (MMAL) hardware plugin (default enable)]))
  if test "${enable_mmal}" != "no"; then
@@ -56,6 +54,3 @@ index d7cf692..f81b99d 100644
  
  dnl
  dnl evas plugin
--- 
-2.26.1
-
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/0005-ioctl-does-not-have-same-signature-between-glibc-and.patch b/meta-multimedia/recipes-multimedia/vlc/vlc/0005-ioctl-does-not-have-same-signature-between-glibc-and.patch
new file mode 100644
index 0000000000..cbf4f2b911
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc/0005-ioctl-does-not-have-same-signature-between-glibc-and.patch
@@ -0,0 +1,47 @@
+From a46cee56d05884b8020ace6f67ef8389ac1845da Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 5 Mar 2023 13:50:40 -0800
+Subject: [PATCH 1/3] ioctl does not have same signature between glibc and musl
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ modules/access/v4l2/lib.c  | 4 ++++
+ modules/access/v4l2/v4l2.h | 4 ++++
+ 2 files changed, 8 insertions(+)
+
+diff --git a/modules/access/v4l2/lib.c b/modules/access/v4l2/lib.c
+index b212e1bc5f..ff7c66bf35 100644
+--- a/modules/access/v4l2/lib.c
++++ b/modules/access/v4l2/lib.c
+@@ -43,7 +43,11 @@ int (*v4l2_fd_open) (int, int) = fd_open;
+ //int (*v4l2_open) (const char *, int, ...) = open;
+ //int (*v4l2_dup) (const char *, int, ...) = dup;
+ int (*v4l2_close) (int) = close;
++#ifdef __GLIBC__
+ int (*v4l2_ioctl) (int, unsigned long int, ...) = ioctl;
++#else
++int (*v4l2_ioctl) (int, int, ...) = ioctl;
++#endif
+ ssize_t (*v4l2_read) (int, void *, size_t) = read;
+ //ssize_t (*v4l2_write) (int, const void *, size_t) = write;
+ void * (*v4l2_mmap) (void *, size_t, int, int, int, int64_t) = mmap;
+diff --git a/modules/access/v4l2/v4l2.h b/modules/access/v4l2/v4l2.h
+index ac4562e269..727e83e9b1 100644
+--- a/modules/access/v4l2/v4l2.h
++++ b/modules/access/v4l2/v4l2.h
+@@ -23,7 +23,11 @@
+ /* libv4l2 functions */
+ extern int (*v4l2_fd_open) (int, int);
+ extern int (*v4l2_close) (int);
++#ifdef __GLIBC__
+ extern int (*v4l2_ioctl) (int, unsigned long int, ...);
++#else
++extern int (*v4l2_ioctl) (int, int, ...);
++#endif
+ extern ssize_t (*v4l2_read) (int, void *, size_t);
+ extern void * (*v4l2_mmap) (void *, size_t, int, int, int, int64_t);
+ extern int (*v4l2_munmap) (void *, size_t);
+-- 
+2.39.2
+
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/0005-linux-thread-Use-SYS_futex-instead-of-__NR_futex.patch b/meta-multimedia/recipes-multimedia/vlc/vlc/0005-linux-thread-Use-SYS_futex-instead-of-__NR_futex.patch
deleted file mode 100644
index 405490dcfc..0000000000
--- a/meta-multimedia/recipes-multimedia/vlc/vlc/0005-linux-thread-Use-SYS_futex-instead-of-__NR_futex.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From f7957c35654222e5bd1038341612bbb40a88e98b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 16 Nov 2020 12:08:43 -0800
-Subject: [PATCH] linux/thread: Use SYS_futex instead of __NR_futex
-
-SYS_futex it expected from system C library.
-in glibc (/usr/include/bits/syscall.h defines it in terms of of NR_futex)
-some newer 32bit architectures e.g. riscv32 are using 64bit time_t from
-get go unlike other 32bit architectures in glibc, therefore it wont have
-NR_futex defined but just NR_futex_time64 this aliases it to NR_futex so
-that SYS_futex is then defined for rv32
-
-Upstream-Status: Submitted [https://github.com/videolan/vlc/pull/117]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/linux/thread.c | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/src/linux/thread.c b/src/linux/thread.c
-index 20da296..30639a3 100644
---- a/src/linux/thread.c
-+++ b/src/linux/thread.c
-@@ -30,6 +30,11 @@
- #include <sys/syscall.h>
- #include <linux/futex.h>
- 
-+/* 32bit architectures with 64bit time_t do not define __NR_futex syscall */
-+#if !defined(SYS_futex) && defined(SYS_futex_time64)
-+#define SYS_futex SYS_futex_time64
-+#endif
-+
- #ifndef FUTEX_PRIVATE_FLAG
- #define FUTEX_WAKE_PRIVATE FUTEX_WAKE
- #define FUTEX_WAIT_PRIVATE FUTEX_WAIT
-@@ -50,7 +55,7 @@ unsigned long vlc_thread_id(void)
- static int sys_futex(void *addr, int op, unsigned val,
-                      const struct timespec *to, void *addr2, int val3)
- {
--    return syscall(__NR_futex, addr, op, val, to, addr2, val3);
-+    return syscall(SYS_futex, addr, op, val, to, addr2, val3);
- }
- 
- static int vlc_futex_wake(void *addr, int nr)
--- 
-2.29.2
-
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/0006-configure-Disable-incompatible-function-pointer-type.patch b/meta-multimedia/recipes-multimedia/vlc/vlc/0006-configure-Disable-incompatible-function-pointer-type.patch
new file mode 100644
index 0000000000..4128db1aea
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc/0006-configure-Disable-incompatible-function-pointer-type.patch
@@ -0,0 +1,31 @@
+From 048e4fdd08ac588feb27b03e3ec1824e24f77d62 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 5 Mar 2023 14:13:25 -0800
+Subject: [PATCH 3/3] configure: Disable incompatible-function-pointer-types
+ warning
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 9f1c099e13..8e45a05808 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -98,6 +98,11 @@ AS_IF([test -n "${with_binary_version}"],[
+ dnl Prevent clang from accepting unknown flags with a mere warning
+ AX_APPEND_COMPILE_FLAGS([-Werror=unknown-warning-option -Werror=invalid-command-line-argument], [CFLAGS])
+ AX_APPEND_COMPILE_FLAGS([-Werror=unknown-warning-option -Werror=invalid-command-line-argument], [CXXFLAGS])
++dnl disable clang from erroring on function pointer protype mismatch, vlc seems to rely on that
++dnl especially in  modules/video_filter/deinterlace/algo_yadif.c how it interpolates 'filter` variable
++dnl between different functions yadif_filter_line_c_16bit() and yadif_filter_line_c()
++AX_APPEND_COMPILE_FLAGS([-Wno-error=incompatible-function-pointer-types -Wno-error=incompatible-function-pointer-types], [CFLAGS])
++AX_APPEND_COMPILE_FLAGS([-Wno-error=incompatible-function-pointer-types -Wno-error=incompatible-function-pointer-types], [CXXFLAGS])
+ 
+ dnl
+ dnl  Check the operating system
+-- 
+2.39.2
+
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.17-1.bb b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.18.bb
similarity index 96%
rename from meta-multimedia/recipes-multimedia/vlc/vlc_3.0.17-1.bb
rename to meta-multimedia/recipes-multimedia/vlc/vlc_3.0.18.bb
index 9b85cb5374..dd6eceae51 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.17-1.bb
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.18.bb
@@ -21,9 +21,10 @@ SRC_URI = "git://github.com/videolan/vlc.git;protocol=https;branch=3.0.x \
            file://0002-use-vorbisidec.patch \
            file://0003-fix-luaL-checkint.patch \
            file://0004-Use-packageconfig-to-detect-mmal-support.patch \
-           file://0005-linux-thread-Use-SYS_futex-instead-of-__NR_futex.patch \
+           file://0005-ioctl-does-not-have-same-signature-between-glibc-and.patch \
+           file://0006-configure-Disable-incompatible-function-pointer-type.patch \
 "
-SRCREV = "aa76328c572d93f1d99c867a94ecad1dc3259733"
+SRCREV = "e9eceaed4d838dbd84638bfb2e4bdd08294163b1"
 S = "${WORKDIR}/git"
 
 inherit autotools-brokensep features_check gettext pkgconfig mime-xdg
-- 
2.39.2


