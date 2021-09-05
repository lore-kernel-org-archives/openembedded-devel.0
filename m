Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.13397.1630869677726484575
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Sep 2021 12:21:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OrV+BAqd;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id j10-20020a17090a94ca00b00181f17b7ef7so2965750pjw.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Sep 2021 12:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h4KHczurFrrBMVUCG7QBvj1gE1bl3IUYeBIiPPabI6I=;
        b=OrV+BAqddab51+akgPWUy2tDwLYmVCVCWDqm/s5A7S9uWv20itDD/XoCBBdqaMImVP
         CDfYe+T0cd6HHR+eenJ1laTqsQlVKheGZzjX1vTdl3h3F+/ojCxJxfk+1MEdK4x+Ieyc
         9qIKa1XsUCPgoW5wUhUXSIbyNiUJ5BBl5/F6M1oWk0HSMshgiMUmt2WU1nRkQlCGMYoj
         OEIJumsiyurhRinzdyXUKn84Du4oddK3X4dGIlowN8xTNsZodSm5y4POOFXyL56wdfyw
         JfB0prlgs5146lwf7Ju+/E9p8bCzU/Ffl/gBMVl9FfHobEk7iqESx6IoNj/VKJu2AYd7
         4PHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h4KHczurFrrBMVUCG7QBvj1gE1bl3IUYeBIiPPabI6I=;
        b=LtG8EkF5EFjjGd6faCkggR8Fn1bpIJuX+6h9RFaRiNrJxxNjM8+8KpF7/JmhP63rbX
         p5GYy78LZgcdP+PLCosjLhTfg/R25dUn9pf+nXdiqBkwt8Bl2OTgNAyawsA1m6r/eayb
         qJMLqiFyA1ckTR4q1DsfVnG7u8hR4R/Oa7vOkV6gn9BUYpGC55xrPB3xgaaBqdZtw3xN
         oK3/gw4RoYJ9kSWxqS+ya8oGvUtV5tGeq3RZecebB/VVcDB7buYjoq+cgZSp9XKMAKuQ
         uTTmlKL+8/FlAkAcQnXEepgzGwJgso2a6TY0MAdWWOT7fLwFrHHyQLNBtRYxKhu5uesy
         vgig==
X-Gm-Message-State: AOAM532inmfLOJmmVd4hrVZHNHW+jkwhrHeLJU2kG8FjdbW7OYuFAUlJ
	0QWQ1/mu4Odw55ZgLOFIpdXVga3f8EQ=
X-Google-Smtp-Source: ABdhPJyzzPssZIxRxLVABW1Q6ZB94zjbSVCm5OVLLzaBCPcBgGN6mopkQu3q9jTQgVEVdSLJcWXcXQ==
X-Received: by 2002:a17:90a:ca11:: with SMTP id x17mr10016961pjt.166.1630869677061;
        Sun, 05 Sep 2021 12:21:17 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:741f:21b:dc9f:801])
        by smtp.gmail.com with ESMTPSA id b17sm6207128pgl.61.2021.09.05.12.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Sep 2021 12:21:16 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>,
	Khem Raj <raj.khem@gmail.com>,
	Scott Murray <scott.murray@konsulko.com>
Subject: [PATCH 5/8] dlt-daemon: update to new release 2.18.6
Date: Sun,  5 Sep 2021 12:21:08 -0700
Message-Id: <20210905192112.2081037-5-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210905192112.2081037-1-akuster808@gmail.com>
References: <20210905192112.2081037-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>

- drop patches 241 245 275: upstream

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Stable version, bug fix only]
(cherry picked from commit 8c17cac68473f98e663f05bc08b7505c0529e495)
[ Stable version, bug fix only
Fixup for Dunfell context]
Signed-off-by: Scott Murray <scott.murray@konsulko.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../dlt-daemon/dlt-daemon/241.patch           | 30 --------
 .../dlt-daemon/dlt-daemon/245.patch           | 74 -------------------
 .../dlt-daemon/dlt-daemon/275.patch           | 38 ----------
 ...-daemon_2.18.5.bb => dlt-daemon_2.18.6.bb} |  5 +-
 4 files changed, 1 insertion(+), 146 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/241.patch
 delete mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/245.patch
 delete mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/275.patch
 rename meta-oe/recipes-extended/dlt-daemon/{dlt-daemon_2.18.5.bb => dlt-daemon_2.18.6.bb} (95%)

diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/241.patch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/241.patch
deleted file mode 100644
index 7d8f22ec78..0000000000
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
index 43057489c9..0000000000
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
index 75065eb054..0000000000
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
similarity index 95%
rename from meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
rename to meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.6.bb
index c0b1750e0b..b7a6cdaa29 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.6.bb
@@ -17,11 +17,8 @@ DEPENDS = "zlib gzip-native"
 SRC_URI = "git://github.com/GENIVI/${BPN}.git;protocol=https \
     file://0002-Don-t-execute-processes-as-a-specific-user.patch \
     file://0004-Modify-systemd-config-directory.patch \
-    file://275.patch \
-    file://241.patch \
-    file://245.patch \
 "
-SRCREV = "f1ac087c766827b1d0ed9c3a814b3cc052e948f2"
+SRCREV = "22715aeceaa81ace2c832312529bde3a42d0814f"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

