Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA874C46CD4
	for <webhook@archiver.kernel.org>; Mon,  1 Jan 2024 03:34:08 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
 by mx.groups.io with SMTP id smtpd.web11.236245.1704080043431376970
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Dec 2023 19:34:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GjV6eOoD;
 spf=pass (domain: gmail.com, ip: 209.85.166.180, mailfrom: raj.khem@gmail.com)
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-35ff6de2068so35439545ab.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 19:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704080042; x=1704684842; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=33MGf2QK0jwc/UPaHghdbmU9EAH6+15AurOR4mR7ffo=;
        b=GjV6eOoDE9g00TbFndoseoZEnBcQjcFLIIiZN4eQdOswzwNWYLYrQnTMKxJOmGr1Og
         AM5te/XJFRhuBIcoXtUpXaRnGN8PvokGrzEVid0GLzFLZe+F/VvTd1kXMnkCGukhAfsr
         Uqd2Q5HAVFxhACNyc7lh43aGkwEptlCc8VetiNU/Xys/T/hUc1azhcq6sAijTwDkjpbw
         3Dl6eMI3T5jKhtWm0FRKh0RmGawj40r6zzcV+U95i4HyAKweKW0NqHjSEfPyP1+YrswE
         20ryw5cvENIkWbRVBp2/lbjRktpMXhfcOvtzlNugAijrkGFpjUBET2/jLphmQOSWi4W/
         7J/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704080042; x=1704684842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=33MGf2QK0jwc/UPaHghdbmU9EAH6+15AurOR4mR7ffo=;
        b=KZt+a16qrDMlgOEviWnRTM2BqYEgpQbE1sO1jP3oz1r/yz9jIXVrIKiM+bzfVrVJKr
         94jmz6shY/w7PItMHeS7HFx+CQongqLQAvf/pE1bjnT8zTBKjhXKbq9GGkR3OhWCPwn5
         WBUZLmZJsQx+sRZbkBtNLBTuJbciq8fbjwagnRzkdNQooxbICnd+vM138BO0+XRVWfkI
         OxmWU5y/UX++TyHHpegMH3RDade0vgY6O0omB4/nYTShQNz3qh1Rjp8BoqyGta0WrJTg
         E/Jp6JrSgS0K4uWjM6KIQso+EHTtBZEAgnEIO7u5385u8cg+4j4B75j/0/cr9pArGPXe
         S7zw==
X-Gm-Message-State: AOJu0Yyv+vAxO4ExJznbB9HGOv5VmQ/Knoa9ydLSDygqJCPjOiYrXI4p
	wIAYSfDSTx3Yg+fOIHR3WNnPkMpcys8=
X-Google-Smtp-Source: AGHT+IE/9XXuH+ajjkv2MnStVQ+LfjPN06JmUHTXssPe58vD4TyS650ioU0sJUL/ULc3AKNh6Q+GcQ==
X-Received: by 2002:a05:6e02:1bc9:b0:35d:6798:1734 with SMTP id x9-20020a056e021bc900b0035d67981734mr28142395ilv.27.1704080042169;
        Sun, 31 Dec 2023 19:34:02 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k24-20020a170902761800b001d497c8eb92sm2806479pll.109.2023.12.31.19.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Dec 2023 19:34:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] mraa: Update to latest tip of trunk
Date: Sun, 31 Dec 2023 19:33:59 -0800
Message-ID: <20240101033359.3389139-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Jan 2024 03:34:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107977

Drop already applied patch.
Fix build with latest musl while here.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...lar-expression-to-match-x86-architec.patch |  2 +-
 ...de-Declare-gVERSION-global-as-extern.patch | 31 -------------
 .../mraa/0001-mraa-Use-posix-basename.patch   | 46 +++++++++++++++++++
 ...2-gpio-Include-limits.h-for-PATH_MAX.patch | 30 ++++++++++++
 meta-oe/recipes-extended/mraa/mraa_git.bb     |  5 +-
 5 files changed, 80 insertions(+), 34 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/mraa/mraa/0001-include-Declare-gVERSION-global-as-extern.patch
 create mode 100644 meta-oe/recipes-extended/mraa/mraa/0001-mraa-Use-posix-basename.patch
 create mode 100644 meta-oe/recipes-extended/mraa/mraa/0002-gpio-Include-limits.h-for-PATH_MAX.patch

diff --git a/meta-oe/recipes-extended/mraa/mraa/0001-cmake-Use-a-regular-expression-to-match-x86-architec.patch b/meta-oe/recipes-extended/mraa/mraa/0001-cmake-Use-a-regular-expression-to-match-x86-architec.patch
index dedb4adf9b..bd8f5be05d 100644
--- a/meta-oe/recipes-extended/mraa/mraa/0001-cmake-Use-a-regular-expression-to-match-x86-architec.patch
+++ b/meta-oe/recipes-extended/mraa/mraa/0001-cmake-Use-a-regular-expression-to-match-x86-architec.patch
@@ -13,7 +13,7 @@ So using a wildcard helps in using any x86 arch
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/eclipse/mraa/pull/1125]
 
  CMakeLists.txt | 3 +--
  1 file changed, 1 insertion(+), 2 deletions(-)
diff --git a/meta-oe/recipes-extended/mraa/mraa/0001-include-Declare-gVERSION-global-as-extern.patch b/meta-oe/recipes-extended/mraa/mraa/0001-include-Declare-gVERSION-global-as-extern.patch
deleted file mode 100644
index d1152ed641..0000000000
--- a/meta-oe/recipes-extended/mraa/mraa/0001-include-Declare-gVERSION-global-as-extern.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From dbb5961f106ec42cd70689d933674c9c37aedfe1 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Bj=C3=B6rn=20Esser?= <besser82@fedoraproject.org>
-Date: Mon, 13 Apr 2020 20:12:11 +0200
-Subject: include: Declare gVERSION global as 'extern'.
-
-Fixes build with '-fno-common'.
-
-Upstream-Status: Submitted [https://github.com/eclipse/mraa/pull/1012]
-Signed-off-by: Adrian Bunk <bunk@stusta.de>
----
- include/version.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/include/version.h b/include/version.h
-index 47366ef..3a567a1 100644
---- a/include/version.h
-+++ b/include/version.h
-@@ -11,8 +11,8 @@
- extern "C" {
- #endif
- 
--const char* gVERSION;
--const char* gVERSION_SHORT;
-+extern const char* gVERSION;
-+extern const char* gVERSION_SHORT;
- 
- #ifdef __cplusplus
- }
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-extended/mraa/mraa/0001-mraa-Use-posix-basename.patch b/meta-oe/recipes-extended/mraa/mraa/0001-mraa-Use-posix-basename.patch
new file mode 100644
index 0000000000..4f07eae631
--- /dev/null
+++ b/meta-oe/recipes-extended/mraa/mraa/0001-mraa-Use-posix-basename.patch
@@ -0,0 +1,46 @@
+From 30f78cb2775358dacd10b02c0ba2ec0c3ba2945d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 31 Dec 2023 19:16:35 -0800
+Subject: [PATCH 1/2] mraa: Use posix basename
+
+Musl has removed the declaration from string.h [1] which exposes the
+problem especially with clang-17+ compiler where implicit function
+declaration is flagged as error. Use posix basename and make a copy of
+string to operate on to emulate GNU basename behaviour.
+
+[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted [https://github.com/eclipse/mraa/pull/1125]
+ src/mraa.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/src/mraa.c b/src/mraa.c
+index 653ea1fa..b556d045 100644
+--- a/src/mraa.c
++++ b/src/mraa.c
+@@ -12,6 +12,7 @@
+ #endif
+ 
+ #include <dlfcn.h>
++#include <libgen.h>
+ #include <pwd.h>
+ #include <sched.h>
+ #include <stddef.h>
+@@ -341,9 +342,11 @@ static int
+ mraa_count_iio_devices(const char* path, const struct stat* sb, int flag, struct FTW* ftwb)
+ {
+     // we are only interested in files with specific names
+-    if (fnmatch(IIO_DEVICE_WILDCARD, basename(path), 0) == 0) {
++    char* tmp = strdup(path);
++    if (fnmatch(IIO_DEVICE_WILDCARD, basename(tmp), 0) == 0) {
+         num_iio_devices++;
+     }
++    free(tmp);
+     return 0;
+ }
+ 
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-extended/mraa/mraa/0002-gpio-Include-limits.h-for-PATH_MAX.patch b/meta-oe/recipes-extended/mraa/mraa/0002-gpio-Include-limits.h-for-PATH_MAX.patch
new file mode 100644
index 0000000000..0e472255a9
--- /dev/null
+++ b/meta-oe/recipes-extended/mraa/mraa/0002-gpio-Include-limits.h-for-PATH_MAX.patch
@@ -0,0 +1,30 @@
+From ffa6f1254066b1d5d99192002043be945ff64297 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 31 Dec 2023 19:18:42 -0800
+Subject: [PATCH 2/2] gpio: Include limits.h for PATH_MAX
+
+Musl exposes this problem where PATH_MAX is used but limits.h is not
+included, it works with glibc perhaps due to limits.h being indirectly
+included by another system header.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted [https://github.com/eclipse/mraa/pull/1125]
+ src/gpio/gpio_chardev.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/gpio/gpio_chardev.c b/src/gpio/gpio_chardev.c
+index 2cd15968..9f727de7 100644
+--- a/src/gpio/gpio_chardev.c
++++ b/src/gpio/gpio_chardev.c
+@@ -12,6 +12,7 @@
+ #include <dirent.h>
+ #include <errno.h>
+ #include <fcntl.h>
++#include <limits.h>
+ #include <poll.h>
+ #include <pthread.h>
+ #include <signal.h>
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-extended/mraa/mraa_git.bb b/meta-oe/recipes-extended/mraa/mraa_git.bb
index f1cdf66fc2..61f36d724d 100644
--- a/meta-oe/recipes-extended/mraa/mraa_git.bb
+++ b/meta-oe/recipes-extended/mraa/mraa_git.bb
@@ -5,12 +5,13 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=91e7de50a8d3cf01057f318d72460acd"
 
-SRCREV = "7786c7ded5c9ce7773890d0e3dc27632898fc6b1"
+SRCREV = "3c288a09109969eef9c2da7d92d3c62f92a015cc"
 PV = "2.2.0+git${SRCPV}"
 
 SRC_URI = "git://github.com/eclipse/${BPN}.git;protocol=https;branch=master \
            file://0001-cmake-Use-a-regular-expression-to-match-x86-architec.patch \
-           file://0001-include-Declare-gVERSION-global-as-extern.patch \
+           file://0001-mraa-Use-posix-basename.patch \
+           file://0002-gpio-Include-limits.h-for-PATH_MAX.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.43.0


