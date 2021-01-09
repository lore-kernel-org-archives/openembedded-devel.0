Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web09.6161.1610212552214019216
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 Jan 2021 09:15:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=N2k4++lf;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 3so11105320wmg.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 09 Jan 2021 09:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TAVYjZPmf5ie3XXuPd1DbJIhPn+Lnm9gXKGutjfn+es=;
        b=N2k4++lfa1W7DRfjRVxMLgQVyJLQTUSLYRAbMcUQXudBxdxVd2GGgixnscj/RDeFPZ
         bKMEbSJ6BVgh0NMv97qdhzhAR/jTSxgZJVkwOSMWvrXVfd2q7i2LCAfBZpnWOChv2X3T
         /syHN51SRNv2ddfarxOCKv8nhMbFj25G5dMQwImJCQfSjRvEo0aSJaUYxmzWP/5wez1b
         jHICAYscRyU/P2Qr0WGP5u1FMLu3zymh/Hwq+ZDku4foKr4sNUdApxtIAEf9fGc4Bt2V
         u7R3BtANJ8yamCOOT+4oku8nlRLHY9cpkf1FyfgT5ZhuwrWMvexUBmWSniIWtrulNp3W
         4Liw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TAVYjZPmf5ie3XXuPd1DbJIhPn+Lnm9gXKGutjfn+es=;
        b=mrbwikAxPxjCwCG/m6wji/+AzbrV6dWXENhZiG+ma/wVA1ztwx/S8/IhOQK3O6u3i1
         WpIqsfcKRAZi/8YqnuTO5qtooZuvWat6t0uqq4EANb992qFnCSyKx2vq9iCtPnh5ggT3
         2K+E4zOfJelr6jNQ1Lr4m5rdx3RM6oNi9rnt68EDWTHhednybsgMVt7VHNgqU7mx8KgM
         9xo39cNe3qOBkceHSH9jGZ2aZuXhV3R5Jv3L35oyHVVN38KKOPFtbes9HUd+oKO6JD85
         OcfMijDiqtd/LZv/vtiwipl11RQyMY2pWoGCxYA+Dy0GRwCnT3++CMxT2R65r+ZVUJPg
         58/w==
X-Gm-Message-State: AOAM53010Ne2nW9rgCGPg6xuIvVYTfwPlKq1eXZFT4WnTXOXs0jqVulK
	la2QQbaITU/hpAmUlC0DOGtRCOIEW2E=
X-Google-Smtp-Source: ABdhPJwqOASzo4AiQxZsLHlYEzMs64GRbtXwNY+Ov4+wY7TH0qQ1jgfUCQ1HgrOnTnEIPFRH7RhE8A==
X-Received: by 2002:a05:600c:4152:: with SMTP id h18mr7984979wmm.110.1610212550214;
        Sat, 09 Jan 2021 09:15:50 -0800 (PST)
Return-Path: <costamagna.gianfranco@gmail.com>
Received: from Unimatrix08-Focal.lan ([5.170.141.245])
        by smtp.gmail.com with ESMTPSA id u6sm19626098wrm.90.2021.01.09.09.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Jan 2021 09:15:49 -0800 (PST)
From: "Gianfranco" <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH] dlt-daemon: update to new release 2.18.6
Date: Sat,  9 Jan 2021 18:15:46 +0100
Message-Id: <20210109171546.3367628-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- drop patches 241 245 275: upstream

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 .../dlt-daemon/dlt-daemon/241.patch           | 30 --------
 .../dlt-daemon/dlt-daemon/245.patch           | 74 -------------------
 .../dlt-daemon/dlt-daemon/275.patch           | 38 ----------
 ...-daemon_2.18.5.bb => dlt-daemon_2.18.6.bb} |  5 +-
 4 files changed, 1 insertion(+), 146 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/241.patch
 delete mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/245.patch
 delete mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/275.patch
 rename meta-oe/recipes-extended/dlt-daemon/{dlt-daemon_2.18.5.bb => dlt-daemon_2.18.6.bb} (96%)

diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/241.patch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/241.patch
deleted file mode 100644
index 7d8f22ec7..000000000
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/241.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From b8f9919f000e642fc8970d0a42c1bdadf5a9d720 Mon Sep 17 00:00:00 2001
-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
-Date: Mon, 10 Aug 2020 08:30:34 +0200
-Subject: [PATCH] sd-daemon.c: Fix build with newer glibc and musl libc
-
-Reported by Khem Raj on meta-oe list
-
-TOPDIR/build/tmp/work/armv7vet2hf-neon-yoe-linux-musleabi/dlt-daemon/2.18.5-r0/recipe-sysroot/usr/include/sys/fcntl.h:1:2: error: redirecting incorrect #include <sys/fcntl.h> to <fcntl.h> [-Werror,-W#warnings]
- ^
-1 error generated.
-
-Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
-Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
----
- systemd/3rdparty/sd-daemon.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/systemd/3rdparty/sd-daemon.c b/systemd/3rdparty/sd-daemon.c
-index 88936d2..de3f985 100644
---- a/systemd/3rdparty/sd-daemon.c
-+++ b/systemd/3rdparty/sd-daemon.c
-@@ -35,7 +35,7 @@
- #ifdef __BIONIC__
- #include <linux/fcntl.h>
- #else
--#include <sys/fcntl.h>
-+#include <fcntl.h>
- #endif
- #include <netinet/in.h>
- #include <stdlib.h>
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/245.patch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/245.patch
deleted file mode 100644
index 43057489c..000000000
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/245.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From 57fd61ea5c58a4f9fcd7140b53ac6cd6e971ef47 Mon Sep 17 00:00:00 2001
-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
-Date: Fri, 31 Jul 2020 15:16:02 +0200
-Subject: [PATCH] dlt_offline: fix build failures with gcc-10
-
-see bug report: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=957140
-
-/usr/bin/ld: CMakeFiles/dlt-daemon.dir/dlt_daemon_client.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:116: multiple definition of `g_logstorage_cache_max'; CMakeFiles/dlt-daemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:116: first defined here
-/usr/bin/ld: CMakeFiles/dlt-daemon.dir/dlt_daemon_common.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:118: multiple definition of `g_logstorage_cache_size'; CMakeFiles/dlt-daemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:118: first defined here
-/usr/bin/ld: CMakeFiles/dlt-daemon.dir/dlt_daemon_common.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:116: multiple definition of `g_logstorage_cache_max'; CMakeFiles/dlt-daemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:116: first defined here
-/usr/bin/ld: CMakeFiles/dlt-daemon.dir/dlt_daemon_connection.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:118: multiple definition of `g_logstorage_cache_size'; CMakeFiles/dlt-daemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:118: first defined here
-/usr/bin/ld: CMakeFiles/dlt-daemon.dir/dlt_daemon_connection.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:116: multiple definition of `g_logstorage_cache_max'; CMakeFiles/dlt-daemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:116: first defined here
-/usr/bin/ld: CMakeFiles/dlt-daemon.dir/dlt_daemon_event_handler.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:118: multiple definition of `g_logstorage_cache_size'; CMakeFiles/dlt-daemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:118: first defined here
-/usr/bin/ld: CMakeFiles/dlt-daemon.dir/dlt_daemon_event_handler.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:116: multiple definition of `g_logstorage_cache_max'; CMakeFiles/dlt-daemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:116: first defined here
-/usr/bin/ld: CMakeFiles/dlt-daemon.dir/dlt_daemon_offline_logstorage.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:116: multiple definition of `g_logstorage_cache_max'; CMakeFiles/dlt-daemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:116: first defined here
----
- src/daemon/dlt_daemon_offline_logstorage.c              | 1 +
- src/offlinelogstorage/dlt_offline_logstorage.h          | 4 ++--
- src/offlinelogstorage/dlt_offline_logstorage_behavior.c | 1 +
- tests/gtest_dlt_daemon_offline_log.cpp                  | 1 +
- 4 files changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/src/daemon/dlt_daemon_offline_logstorage.c b/src/daemon/dlt_daemon_offline_logstorage.c
-index 0b3c14f..db9637e 100644
---- a/src/daemon/dlt_daemon_offline_logstorage.c
-+++ b/src/daemon/dlt_daemon_offline_logstorage.c
-@@ -56,6 +56,7 @@ DLT_STATIC DltReturnValue dlt_logstorage_split_ecuid(char *key,
-     return DLT_RETURN_OK;
- }
- 
-+unsigned int g_logstorage_cache_max;
- /**
-  * dlt_logstorage_split_ctid
-  *
-diff --git a/src/offlinelogstorage/dlt_offline_logstorage.h b/src/offlinelogstorage/dlt_offline_logstorage.h
-index b58da70..c9bc93b 100644
---- a/src/offlinelogstorage/dlt_offline_logstorage.h
-+++ b/src/offlinelogstorage/dlt_offline_logstorage.h
-@@ -114,9 +114,9 @@
- #define DLT_OFFLINE_LOGSTORAGE_IS_STRATEGY_SET(S, s) ((S)&(s))
- 
- /* logstorage max cache */
--unsigned int g_logstorage_cache_max;
-+extern unsigned int g_logstorage_cache_max;
- /* current logstorage cache size */
--unsigned int g_logstorage_cache_size;
-+extern unsigned int g_logstorage_cache_size;
- 
- typedef struct
- {
-diff --git a/src/offlinelogstorage/dlt_offline_logstorage_behavior.c b/src/offlinelogstorage/dlt_offline_logstorage_behavior.c
-index afbf8c4..edef482 100644
---- a/src/offlinelogstorage/dlt_offline_logstorage_behavior.c
-+++ b/src/offlinelogstorage/dlt_offline_logstorage_behavior.c
-@@ -32,6 +32,7 @@
- #include "dlt_offline_logstorage_behavior.h"
- #include "dlt_offline_logstorage_behavior_internal.h"
- 
-+unsigned int g_logstorage_cache_size;
- /**
-  * dlt_logstorage_log_file_name
-  *
-diff --git a/tests/gtest_dlt_daemon_offline_log.cpp b/tests/gtest_dlt_daemon_offline_log.cpp
-index b8965de..0bd4d5e 100644
---- a/tests/gtest_dlt_daemon_offline_log.cpp
-+++ b/tests/gtest_dlt_daemon_offline_log.cpp
-@@ -29,6 +29,7 @@ extern "C"
- #include <fcntl.h>
- }
- 
-+unsigned int g_logstorage_cache_max;
- /* Begin Method: dlt_logstorage::t_dlt_logstorage_list_add*/
- TEST(t_dlt_logstorage_list_add, normal)
- {
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/275.patch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/275.patch
deleted file mode 100644
index 75065eb05..000000000
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/275.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-Upstream-status: Backport
-CVE: CVE-2020-29394
-From 7f5cd5404a03fa330e192084f6bdafb2dc9bdcb7 Mon Sep 17 00:00:00 2001
-From: GwanYeong Kim <gy741.kim@gmail.com>
-Date: Sat, 28 Nov 2020 12:24:46 +0900
-Subject: [PATCH] dlt_common: Fix buffer overflow in dlt_filter_load
-
-A buffer overflow in the dlt_filter_load function in dlt_common.c in dlt-daemon allows arbitrary code execution via an unsafe usage of fscanf, because it does not limit the number of characters to be read in a format argument.
-
-Fixed: #274
-
-Signed-off-by: GwanYeong Kim <gy741.kim@gmail.com>
----
- src/shared/dlt_common.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/shared/dlt_common.c b/src/shared/dlt_common.c
-index 254f4ce4..d15b1cec 100644
---- a/src/shared/dlt_common.c
-+++ b/src/shared/dlt_common.c
-@@ -404,7 +404,7 @@ DltReturnValue dlt_filter_load(DltFilter *filter, const char *filename, int verb
-     while (!feof(handle)) {
-         str1[0] = 0;
- 
--        if (fscanf(handle, "%s", str1) != 1)
-+        if (fscanf(handle, "%254s", str1) != 1)
-             break;
- 
-         if (str1[0] == 0)
-@@ -419,7 +419,7 @@ DltReturnValue dlt_filter_load(DltFilter *filter, const char *filename, int verb
- 
-         str1[0] = 0;
- 
--        if (fscanf(handle, "%s", str1) != 1)
-+        if (fscanf(handle, "%254s", str1) != 1)
-             break;
- 
-         if (str1[0] == 0)
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.6.bb
similarity index 96%
rename from meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
rename to meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.6.bb
index 5066e76d3..b3cfb4709 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.6.bb
@@ -17,11 +17,8 @@ DEPENDS = "zlib gzip-native"
 SRC_URI = "git://github.com/GENIVI/${BPN}.git;protocol=https \
     file://0002-Don-t-execute-processes-as-a-specific-user.patch \
     file://0004-Modify-systemd-config-directory.patch \
-    file://241.patch \
-    file://245.patch \
-    file://275.patch \
 "
-SRCREV = "f1ac087c766827b1d0ed9c3a814b3cc052e948f2"
+SRCREV = "22715aeceaa81ace2c832312529bde3a42d0814f"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

