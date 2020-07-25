Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.7483.1595673296182668818
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Jul 2020 03:34:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=B/t0zqYm;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.53, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f53.google.com with SMTP id i80so6492635lfi.13
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Jul 2020 03:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JSsAm/h3H59TkuwYW5vP59cVwbrIn/vjMxhawYuNQ5o=;
        b=B/t0zqYmC8dCh/OgpsWpEQFEZ2M8EknkD0MmB5PHeCTpuDK9wU4LxSIhbQ6R4/A0wg
         /fUUrjLt8QSO9arKmYIfsDeZiBSnXTiv0rnS8x3R0QMjRmnC+j+dMm6PhowMzCMPC5Dt
         oEZrAm7Gx4AUMAmvCZE3NK6b01eAdhWqo7KKxtwkeXsPv/uHyhXE+S8HxbqEg4w7Ye5T
         hcJ8P4OfmcNg2fgTAPOT1rX9llCorLMeHgYz0TdNe2scjzUF+fCSxdpaEnV/N/T3TNkC
         /fzPlr6lv8w90//2Yw0KLJDKz4z7LZibF/O61VAhR5b9OH6hxWAHP3CJ+aVIeMq0iiwl
         RIVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JSsAm/h3H59TkuwYW5vP59cVwbrIn/vjMxhawYuNQ5o=;
        b=DL+Sdw22Qq84VGJDWaATwTjcJ3pXjdOSBUlaUTcMKe4oFd79NAQtZxfu0+xNWX+EhB
         6tXyZ13mynCz+mtp3e/WHIk1IVjONYlduQglVrR6Ze8N+Jui8U8lZ1QcrETQivDtZtZO
         6EXLCvEhQMlu0lO0d1Al+227TzH9QGuVoYF1HUeg/1MuFK3KQbCprzWN6TxaMDU+dNZ3
         dXF9L294rwi7oSVpoCOgJbNwk5FYXhpgJsvoUKJvZUos73pRnXU44IANMLzmwzPJqgC9
         5uPq1c+kP1nxMIgpgiYmZvfGAIVjzHZn5o1QuhgGcdMezJZxd0zqOl1dify2kFcjmhuE
         3bBQ==
X-Gm-Message-State: AOAM533TRWyYquOILXZA55VO/iwpqfKaIPl/dCpftj68CiMrlBrXLojb
	Y4DW+hLSMc/lzIJC0XNTJub6PNqOQ+E=
X-Google-Smtp-Source: ABdhPJw7ZA4vGtRWrUd2ugiIx7LyT1WBh8dINMWeCMEhqJs/vcwAlRGMqjg2sZ5lIDzObMr3QIkjdA==
X-Received: by 2002:a05:6512:3317:: with SMTP id k23mr7200799lfe.111.1595673293795;
        Sat, 25 Jul 2020 03:34:53 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id b18sm1325859lfp.36.2020.07.25.03.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2020 03:34:53 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe 1/4] libimobiledevice: update to 1.3.0
Date: Sat, 25 Jul 2020 12:34:44 +0200
Message-Id: <20200725103447.2109015-1-open.source@oleksandr-kravchuk.com>
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

