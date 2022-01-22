Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 501DCC433EF
	for <webhook@archiver.kernel.org>; Sat, 22 Jan 2022 21:47:00 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.2050.1642888019532317684
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Jan 2022 13:46:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=F2bssAdn;
 spf=pass (domain: gmail.com, ip: 209.85.221.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id u15so6440247wrt.3
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Jan 2022 13:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VYTKsNllLbbZrbSUk3080Rf9RU5BNb6QHRhsJT+11dI=;
        b=F2bssAdn6G51Tk2O6fliZASMWsV3bMo1iy2o9UKl5T5IOz7RxuMJpWpwoTmCuBERFD
         bescEY6x4P8u7oI3FbnBRNqSCqGerY72OFS1Jyj/H3s+9x0TyBn6GsmhXVklE+auvYcG
         cujNZG4EU3W9K1ApK95zUyk8BkAn1f+8uKvZ8Qu70x04uCIpQwjfG/7UiCj3SJl3p9UM
         SfB28WrE3cHiw0/nJBS++GC+TvoY0r13Uk7H54d6OdT3JagauwS1Y9YWfHA/hQhW+f5C
         AayCr5pmaCdIIVBPoarMM3TbVzC1gzAaAszXTUGSWZlZ7u6ivyRv5evzRoCSqtJQUJhC
         U0Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VYTKsNllLbbZrbSUk3080Rf9RU5BNb6QHRhsJT+11dI=;
        b=GgbMD2K/wcgVT+gA6r6asAXafgtHD32Wa6hA9+7Ju5haTLfsb+xiZQTF4E4rs1zN1m
         QCZJHWe0UCUlSMUv6BqdfkNam7aFL7KCAKAewld5U4XE+mnmTLR+tLXVdIZufnJs96jl
         F44WoggaruYjmqQpNmmZxTgR+m502wiOoBSo0hvA1rJK4werO2oozjrp6FsmjghTC0ZM
         quBoGsQIkKsCUrqNhgpPqNHCx6IgoJ2Gw+a9e7NGA1flouUmb/wofWPglUG9H2FJnLNd
         lyEbIv+PvtRLEE8gNmWiCWkuK9r4OdANIrw/T89wkWwBrpBD9EMtETDCkbIAHQdKRd8B
         EixQ==
X-Gm-Message-State: AOAM532lLu9uyDgk1G2g7sL8MxYRWEvqPtX4G8dLRc0BL5QU7IFKsgUI
	2i2JAWlb12Sy8eDgaZahxRGTSAcQwtw=
X-Google-Smtp-Source: 
 ABdhPJyEh45lFtCODIxtNZeD3shbmCzlxxMpVVM/TKPe33sNoOEyP8mzztCbLoxah8XEegA9HhBLJQ==
X-Received: by 2002:a5d:6d8a:: with SMTP id l10mr8975272wrs.490.1642888017991;
        Sat, 22 Jan 2022 13:46:57 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 h11sm14491343wmb.12.2022.01.22.13.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jan 2022 13:46:57 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/4] minidlna: update 1.2.1 -> 1.3.0
Date: Sat, 22 Jan 2022 22:46:49 +0100
Message-Id: <20220122214652.929263-1-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Jan 2022 21:47:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95008

Drop unneeded patch.

This addresses build failures with ffmpeg 5.0

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../recipes-multimedia/minidlna/minidlna.inc  |  2 +-
 ...ark-setjmp_buffer-extern-declaration.patch | 29 ---------------
 ...for-clock_gettime-seprately-from-__N.patch | 19 ++++------
 ...onfigure.ac-drop-non-standard-checks.patch | 37 +++++++++++++++++++
 .../{minidlna_1.2.1.bb => minidlna_1.3.0.bb}  |  2 +-
 5 files changed, 46 insertions(+), 43 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/minidlna/minidlna/0001-Mark-setjmp_buffer-extern-declaration.patch
 create mode 100644 meta-multimedia/recipes-multimedia/minidlna/minidlna/0001-configure.ac-drop-non-standard-checks.patch
 rename meta-multimedia/recipes-multimedia/minidlna/{minidlna_1.2.1.bb => minidlna_1.3.0.bb} (66%)

diff --git a/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc b/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc
index da2607fcf..7f916b2be 100644
--- a/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc
+++ b/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc
@@ -13,7 +13,7 @@ SRC_URI = "git://git.code.sf.net/p/minidlna/git;branch=master;module=git \
            file://minidlna.service \
            file://0001-Update-Gettext-version.patch \
            file://0001-configure-Check-for-clock_gettime-seprately-from-__N.patch \
-           file://0001-Mark-setjmp_buffer-extern-declaration.patch \
+           file://0001-configure.ac-drop-non-standard-checks.patch \
            "
 
 S = "${WORKDIR}/git"
diff --git a/meta-multimedia/recipes-multimedia/minidlna/minidlna/0001-Mark-setjmp_buffer-extern-declaration.patch b/meta-multimedia/recipes-multimedia/minidlna/minidlna/0001-Mark-setjmp_buffer-extern-declaration.patch
deleted file mode 100644
index 0a1e800c8..000000000
--- a/meta-multimedia/recipes-multimedia/minidlna/minidlna/0001-Mark-setjmp_buffer-extern-declaration.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 1c6028f5f8bbfd3fd7327a43e1bb762c2c166167 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 12 Aug 2020 18:10:54 -0700
-Subject: [PATCH] Mark setjmp_buffer extern declaration
-
-Fixes build with -fno-common
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- metadata.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/metadata.c b/metadata.c
-index 8a10c77..c114091 100644
---- a/metadata.c
-+++ b/metadata.c
-@@ -484,7 +484,7 @@ GetAudioMetadata(const char *path, const char *name)
- }
- 
- /* For libjpeg error handling */
--jmp_buf setjmp_buffer;
-+extern jmp_buf setjmp_buffer;
- static void
- libjpeg_error_handler(j_common_ptr cinfo)
- {
--- 
-2.28.0
-
diff --git a/meta-multimedia/recipes-multimedia/minidlna/minidlna/0001-configure-Check-for-clock_gettime-seprately-from-__N.patch b/meta-multimedia/recipes-multimedia/minidlna/minidlna/0001-configure-Check-for-clock_gettime-seprately-from-__N.patch
index 24a307db1..dd29797a6 100644
--- a/meta-multimedia/recipes-multimedia/minidlna/minidlna/0001-configure-Check-for-clock_gettime-seprately-from-__N.patch
+++ b/meta-multimedia/recipes-multimedia/minidlna/minidlna/0001-configure-Check-for-clock_gettime-seprately-from-__N.patch
@@ -1,4 +1,4 @@
-From 1118b1912916924bbfa3fd4dced9dfed01fbf0e0 Mon Sep 17 00:00:00 2001
+From 93e7e25a10c890b8c8cd06cbfd78175c30999d31 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 9 Mar 2020 09:44:33 -0700
 Subject: [PATCH] configure: Check for clock_gettime seprately from
@@ -9,13 +9,16 @@ since direct use of __NR_clock_gettime is not time64-safe
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
- configure.ac | 10 +++++++---
- 1 file changed, 7 insertions(+), 3 deletions(-)
+ configure.ac | 4 ++++
+ 1 file changed, 4 insertions(+)
 
+diff --git a/configure.ac b/configure.ac
+index 3d218ea..aa7dd1c 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -125,6 +125,10 @@ case $host in
+@@ -127,6 +127,10 @@ case $host in
  esac
  
  AC_CHECK_HEADERS(syscall.h sys/syscall.h mach/mach_time.h)
@@ -26,11 +29,3 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  AC_MSG_CHECKING([for __NR_clock_gettime syscall])
  AC_COMPILE_IFELSE(
      [AC_LANG_PROGRAM(
-@@ -143,7 +147,6 @@ AC_COMPILE_IFELSE(
-     ],
-     [
-         AC_MSG_RESULT([no])
--        AC_SEARCH_LIBS([clock_gettime], [rt], [AC_DEFINE([HAVE_CLOCK_GETTIME], [1], [use clock_gettime])],)
-     ])
- 
- AC_CHECK_HEADER(linux/netlink.h,
diff --git a/meta-multimedia/recipes-multimedia/minidlna/minidlna/0001-configure.ac-drop-non-standard-checks.patch b/meta-multimedia/recipes-multimedia/minidlna/minidlna/0001-configure.ac-drop-non-standard-checks.patch
new file mode 100644
index 000000000..93334b7da
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/minidlna/minidlna/0001-configure.ac-drop-non-standard-checks.patch
@@ -0,0 +1,37 @@
+From 83425344b2d7339e8f5b0ad230c51278d330d613 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Sat, 22 Jan 2022 11:41:50 +0100
+Subject: [PATCH] configure.ac: drop non-standard checks
+
+Not sure what upstream is trying to do here but it does not work
+with the latest autoconf.
+
+Upstream-Status: Inactive-Upstream
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ configure.ac | 5 -----
+ 1 file changed, 5 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index aa7dd1c..858db52 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -418,7 +418,6 @@ for dir in "" /usr/local $SEARCH_DIR; do
+     AC_CHECK_LIB([id3tag -lz], [id3_file_open], [LIBID3TAG_LIBS="-lid3tag -lz"], [unset ac_cv_lib_id3tag_id3_file_open; LDFLAGS="$LDFLAGS_SAVE"; continue])
+     break
+ done
+-test x"$ac_cv_lib_id3tag__lz___id3_file_open" = x"yes" || AC_MSG_ERROR([Could not find libid3tag])
+ AC_SUBST(LIBID3TAG_LIBS)
+ 
+ LDFLAGS_SAVE="$LDFLAGS"
+@@ -444,10 +443,6 @@ for dir in "" /usr/local $SEARCH_DIR; do
+ 		  [unset ac_cv_lib_avformat_av_open_input_file; unset ac_cv_lib_avformat_avformat_open_input; LDFLAGS="$LDFLAGS_SAVE"; continue])])
+     break
+ done
+-if test x"$ac_cv_lib_avformat__lavcodec__lavutil__lz___av_open_input_file" != x"yes" &&
+-   test x"$ac_cv_lib_avformat__lavcodec__lavutil__lz___avformat_open_input" != x"yes"; then
+-   AC_MSG_ERROR([Could not find libavformat - part of ffmpeg])
+-fi
+ AC_SUBST(LIBAVFORMAT_LIBS)
+ 
+ AC_CHECK_LIB(pthread, pthread_create)
diff --git a/meta-multimedia/recipes-multimedia/minidlna/minidlna_1.2.1.bb b/meta-multimedia/recipes-multimedia/minidlna/minidlna_1.3.0.bb
similarity index 66%
rename from meta-multimedia/recipes-multimedia/minidlna/minidlna_1.2.1.bb
rename to meta-multimedia/recipes-multimedia/minidlna/minidlna_1.3.0.bb
index 999d85ce7..4238918c9 100644
--- a/meta-multimedia/recipes-multimedia/minidlna/minidlna_1.2.1.bb
+++ b/meta-multimedia/recipes-multimedia/minidlna/minidlna_1.3.0.bb
@@ -1,4 +1,4 @@
 require ${BPN}.inc
 
-SRCREV = "c760a338e07ebd11d62fef701e3de824a91f8625"
+SRCREV = "109d63cb11ac207c18a784556834eb054b34b00b"
 LIC_FILES_CHKSUM = "file://LICENCE.miniupnpd;md5=b0dabf9d8e0f871554e309d62ead8d2b"
-- 
2.20.1


