Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web12.63711.1595878058357644501
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2020 12:27:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=ljcbEKSG;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.182, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f182.google.com with SMTP id s16so3302569ljc.8
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Jul 2020 12:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JSsAm/h3H59TkuwYW5vP59cVwbrIn/vjMxhawYuNQ5o=;
        b=ljcbEKSGq3kgDDxEeXEnFanoG7pqQkqT/kN5eTdezTSyK96f+gRxsj72y7jMtP4yUR
         CpenMOacMaihWYLXAK+PXJxAmo9KTgc1H5ncWOTLb1a9784p/b/C+U9xYk0sbuMAU0OK
         ewYqGbRsyaAJcbPsXlb+L8GcTvK7MIndWNHWqZAljZNXmHVQcqHYMT0OltOLyjrH5UAQ
         +WdRRx5icf30+cLFXijTqtRJ6adhTj2GPekPRoQAtjCUNjuHA1BVmoD4tPRWUil1xOCC
         qQlJ4zwCBo9QexINSWw/R+6jcPBsqiv1Ks1R189wR+Bp/Nk0iPyf7D/SzTCRd6ffoWHx
         VdCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JSsAm/h3H59TkuwYW5vP59cVwbrIn/vjMxhawYuNQ5o=;
        b=Ym0NHlTsrsa5GgOgclpwmDCKI12IVnYHGn0ZogCKewALoOTq6ye5s9EALXezxUcdM3
         hjKLrL1cAs+1oHZjLU0iqHFjLfCWI/mgfzDF+hohH9DwTnWIM8Gy+agkDu6AiodJEMc4
         12sCuH5bW0KAI9/FZzgWNCrLcJ4Gig6wA8Yl5oL6CdJskauxvy7+XXAo3B7SJGePIo6H
         XrwnVq0TKSsMXp5RSBg5/02VhYO9/w+UzpuasyanEGivdX6LmTYqeFKqF0AunnNvHPSk
         G89PIYTKrDG8hZPJ9E807/cfBtRGbtBchUYWh3ZF8CmJzGRwgxi6rTi+/IdyGlrHhTdm
         7CSQ==
X-Gm-Message-State: AOAM5321nLu9e0q8GhDZTlaRBGFL7K/G6dCQN6MDSPDDUCZVtjtWigsX
	VaMC3rpK5M5SocKMXIEUZ3N42rc3HIM=
X-Google-Smtp-Source: ABdhPJxjJUFtUCTH8CIXU4mBzRG1QZpIPZjIFQ7x/lVrPuBzkvsx9k2jzyNo9fOROg3PmuEAvc8DJA==
X-Received: by 2002:a2e:9bc4:: with SMTP id w4mr11054991ljj.391.1595878055975;
        Mon, 27 Jul 2020 12:27:35 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id u19sm2910311ljk.0.2020.07.27.12.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 12:27:35 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH v2][meta-oe 1/5] libimobiledevice: update to 1.3.0
Date: Mon, 27 Jul 2020 21:27:18 +0200
Message-Id: <20200727192722.2488841-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patch was removed as the issue it was fixing was solved in this
version of the library.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../files/configure-fix-largefile.patch       | 38 -------------------
 ...evice_git.bb => libimobiledevice_1.3.0.bb} | 11 ++----
 2 files changed, 3 insertions(+), 46 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/libimobiledevice/files/configure-fix-largefile.patch
 rename meta-oe/recipes-connectivity/libimobiledevice/{libimobiledevice_git.bb => libimobiledevice_1.3.0.bb} (61%)

diff --git a/meta-oe/recipes-connectivity/libimobiledevice/files/configure-fix-largefile.patch b/meta-oe/recipes-connectivity/libimobiledevice/files/configure-fix-largefile.patch
deleted file mode 100644
index 679a8b597a..0000000000
--- a/meta-oe/recipes-connectivity/libimobiledevice/files/configure-fix-largefile.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-Fix configure error in large file checks on 64-bit architectures
-
- configure:17888: checking for native large file support
- configure:17891: error: in `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe-linux/libimobiledevice/1.1.4-r0/libimobiledevice-1.1.4':
- configure:17893: error: cannot run test program while cross compiling
-
-configure.ac was using AC_SYS_LARGEFILE macro as is typical, but then
-there was an extra runtime check added beyond that:
-check if off_t is 8 bytes (64 bits) long.
-If that runtime check passed, _FILE_OFFSET_BITS was defined as 64.
-
-Runtime checks need to go away for cross compiling, and luckily this extra
-check was not serving any useful purpose. Note that off_t was *already*
-64 bits, *without* setting _FILE_OFFSET_BITS, which makes _FILE_OFFSET_BITS
-unneeded for large file support. 
-
-If AC_SYS_LARGEFILE macro sets ac_cv_sys_file_offset_bits=no,
-just leave _FILE_OFFSET_BITS undefined!
-
---- libimobiledevice-1.1.4/configure.ac.old	2015-07-15 01:38:50.900143927 -0700
-+++ libimobiledevice-1.1.4/configure.ac	2015-07-15 01:39:13.300144430 -0700
-@@ -174,16 +174,6 @@
- if test "$enable_largefile" != no; then
-     if test "$ac_cv_sys_file_offset_bits" != 'no'; then
- 	LFS_CFLAGS="$LFS_CFLAGS -D_FILE_OFFSET_BITS=$ac_cv_sys_file_offset_bits"
--    else
--	AC_MSG_CHECKING(for native large file support)
--	AC_RUN_IFELSE([AC_LANG_SOURCE([#include <unistd.h>
--	  int main (int argc, char **argv)
--	  {
--	      exit(!(sizeof(off_t) == 8));
--	  }])],
--	[ac_cv_sys_file_offset_bits=64; AC_DEFINE(_FILE_OFFSET_BITS,64)
--	 AC_MSG_RESULT(yes)],
--	[AC_MSG_RESULT(no)])
-     fi
-     if test "$ac_cv_sys_large_files" != 'no'; then
- 	LFS_CFLAGS="$LFS_CFLAGS -D_LARGE_FILES=1"
diff --git a/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_git.bb b/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.3.0.bb
similarity index 61%
rename from meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_git.bb
rename to meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.3.0.bb
index 908b98d8c5..bcedd6297e 100644
--- a/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_git.bb
+++ b/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.3.0.bb
@@ -4,17 +4,12 @@ LIC_FILES_CHKSUM = "\
     file://COPYING;md5=ebb5c50ab7cab4baeffba14977030c07 \
     file://COPYING.LESSER;md5=6ab17b41640564434dda85c06b7124f7 \
 "
-
-HOMEPAGE ="http://www.libimobiledevice.org/"
+HOMEPAGE = "http://www.libimobiledevice.org/"
 
 DEPENDS = "libplist usbmuxd libusbmuxd libtasn1 gnutls libgcrypt"
 
-SRCREV = "fb71aeef10488ed7b0e60a1c8a553193301428c0"
-PV = "1.2.0+git${SRCPV}"
-SRC_URI = "\
-    git://github.com/libimobiledevice/libimobiledevice;protocol=https \
-    file://configure-fix-largefile.patch \
-"
+SRCREV = "15f8652126664e3a4b980e5d1c039b9053ce8566"
+SRC_URI = "git://github.com/libimobiledevice/libimobiledevice;protocol=https"
 
 S = "${WORKDIR}/git"
 inherit autotools pkgconfig
-- 
2.25.1

