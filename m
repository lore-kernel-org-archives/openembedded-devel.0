Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.13287.1630869676737406266
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Sep 2021 12:21:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lW/YPdEj;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id g13-20020a17090a3c8d00b00196286963b9so2959167pjc.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Sep 2021 12:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oKoxf3OocSC+eeQ6ws3+N4/v3YkpQOjtDs7iPlkOC+o=;
        b=lW/YPdEjQa73c2eCv6sa3Uh/pfhGXW85VDvd/1b/D0tashlF4KYORm93xTNVtXN8a7
         Vitu+star+OktQTjFW4wOsx13UHG9sKKbjwQ6Qhg4uJ//xJO+EkmkuFGFd5uCC2FfFno
         aEm0+M4A+QIdL48Na8UlxllL+I9JelD4cYzRV3dX0Y1ZRHHANnddXqhJNFKtjP8DUjSZ
         m4AHD1V5h2bUSfXbf2emjklP11Hkiao9WUob/p6buizb1tkvivRNzgzFQPIgnwbORj3S
         qhNxcy8lo+hAcv1XQbdN4c2eqBRIKUf01lsrq1mXOiKd2K4pbufIRX3Lfp77HaheMAYL
         Yh0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oKoxf3OocSC+eeQ6ws3+N4/v3YkpQOjtDs7iPlkOC+o=;
        b=BaBRqeTNVYKlnh2UU7wpgAYABA3I02RKmoVjJvSPUQ+EHTUjClVVitLcXG5IqwCSW8
         oju1W2x91Qhk7+pIz57l2hqPTw3MVq2otJyR9sL6kIlAEOJM+9VL6EHsAV0/JohvMYWy
         NIK4kl87jNgG/2QPVzUwHw99AsIMMCAxDGjyI2rNk3zKrltAjYQgUGiYQXQVBs02Qwco
         BK4dd2CbegryH4JI0hPUbZVOclsfequDNMS5xdukzFvsHmWLhUpJ5i05gRgTVpQtWZ8f
         9zdcP2OJdncgtRHnwf0/JKPfOyohe1fSHC6LDdm0nAV+yJVZ1Dx4CXIRlgkSZ4Na++Ii
         MGvg==
X-Gm-Message-State: AOAM530MzxuzchN1FIVrLYW981p9ualHJEc5A3qiKegdM1s5OufXj06+
	CTHE1WdkT9pwTKpWvB3cFb5Jg1hv2eM=
X-Google-Smtp-Source: ABdhPJxQAik+fYJQ/NTSSSBlj9bBpnA5ZYYE0n/iVD38qTzkPlGOfuIAQ2G8i8DaIwQR7yIaZf+OTA==
X-Received: by 2002:a17:90a:8912:: with SMTP id u18mr9953565pjn.69.1630869676158;
        Sun, 05 Sep 2021 12:21:16 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:741f:21b:dc9f:801])
        by smtp.gmail.com with ESMTPSA id b17sm6207128pgl.61.2021.09.05.12.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Sep 2021 12:21:15 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>,
	Khem Raj <raj.khem@gmail.com>,
	Scott Murray <scott.murray@konsulko.com>
Subject: [PATCH 4/8] dlt-daemon: superseed upstream pr #238 patch with pr #245 due to unexpected behaviour
Date: Sun,  5 Sep 2021 12:21:07 -0700
Message-Id: <20210905192112.2081037-4-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210905192112.2081037-1-akuster808@gmail.com>
References: <20210905192112.2081037-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>

Upstream commented to use the second one

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c32d2eb448ce343463dc75cc6120f395e32f0177)
[Fixup for Dunfell context]
Signed-off-by: Scott Murray <scott.murray@konsulko.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../dlt-daemon/{238.patch => 245.patch}       | 53 ++++++++++++++++---
 .../dlt-daemon/dlt-daemon_2.18.5.bb           |  2 +-
 2 files changed, 47 insertions(+), 8 deletions(-)
 rename meta-oe/recipes-extended/dlt-daemon/dlt-daemon/{238.patch => 245.patch} (65%)

diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/238.patch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/245.patch
similarity index 65%
rename from meta-oe/recipes-extended/dlt-daemon/dlt-daemon/238.patch
rename to meta-oe/recipes-extended/dlt-daemon/dlt-daemon/245.patch
index 14c44e6edd..43057489c9 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/238.patch
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/245.patch
@@ -1,6 +1,6 @@
-From 214f8c71552fc096077f0b916dad75b31eefea3d Mon Sep 17 00:00:00 2001
+From 57fd61ea5c58a4f9fcd7140b53ac6cd6e971ef47 Mon Sep 17 00:00:00 2001
 From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
-Date: Fri, 31 Jul 2020 15:26:35 +0200
+Date: Fri, 31 Jul 2020 15:16:02 +0200
 Subject: [PATCH] dlt_offline: fix build failures with gcc-10
 
 see bug report: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=957140
@@ -14,11 +14,26 @@ see bug report: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=957140
 /usr/bin/ld: CMakeFiles/dlt-daemon.dir/dlt_daemon_event_handler.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:116: multiple definition of `g_logstorage_cache_max'; CMakeFiles/dlt-daemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:116: first defined here
 /usr/bin/ld: CMakeFiles/dlt-daemon.dir/dlt_daemon_offline_logstorage.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:116: multiple definition of `g_logstorage_cache_max'; CMakeFiles/dlt-daemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:116: first defined here
 ---
- src/offlinelogstorage/dlt_offline_logstorage.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
+ src/daemon/dlt_daemon_offline_logstorage.c              | 1 +
+ src/offlinelogstorage/dlt_offline_logstorage.h          | 4 ++--
+ src/offlinelogstorage/dlt_offline_logstorage_behavior.c | 1 +
+ tests/gtest_dlt_daemon_offline_log.cpp                  | 1 +
+ 4 files changed, 5 insertions(+), 2 deletions(-)
 
+diff --git a/src/daemon/dlt_daemon_offline_logstorage.c b/src/daemon/dlt_daemon_offline_logstorage.c
+index 0b3c14f..db9637e 100644
+--- a/src/daemon/dlt_daemon_offline_logstorage.c
++++ b/src/daemon/dlt_daemon_offline_logstorage.c
+@@ -56,6 +56,7 @@ DLT_STATIC DltReturnValue dlt_logstorage_split_ecuid(char *key,
+     return DLT_RETURN_OK;
+ }
+ 
++unsigned int g_logstorage_cache_max;
+ /**
+  * dlt_logstorage_split_ctid
+  *
 diff --git a/src/offlinelogstorage/dlt_offline_logstorage.h b/src/offlinelogstorage/dlt_offline_logstorage.h
-index b58da70..8ad84b8 100644
+index b58da70..c9bc93b 100644
 --- a/src/offlinelogstorage/dlt_offline_logstorage.h
 +++ b/src/offlinelogstorage/dlt_offline_logstorage.h
 @@ -114,9 +114,9 @@
@@ -26,10 +41,34 @@ index b58da70..8ad84b8 100644
  
  /* logstorage max cache */
 -unsigned int g_logstorage_cache_max;
-+static unsigned int g_logstorage_cache_max;
++extern unsigned int g_logstorage_cache_max;
  /* current logstorage cache size */
 -unsigned int g_logstorage_cache_size;
-+static unsigned int g_logstorage_cache_size;
++extern unsigned int g_logstorage_cache_size;
  
  typedef struct
  {
+diff --git a/src/offlinelogstorage/dlt_offline_logstorage_behavior.c b/src/offlinelogstorage/dlt_offline_logstorage_behavior.c
+index afbf8c4..edef482 100644
+--- a/src/offlinelogstorage/dlt_offline_logstorage_behavior.c
++++ b/src/offlinelogstorage/dlt_offline_logstorage_behavior.c
+@@ -32,6 +32,7 @@
+ #include "dlt_offline_logstorage_behavior.h"
+ #include "dlt_offline_logstorage_behavior_internal.h"
+ 
++unsigned int g_logstorage_cache_size;
+ /**
+  * dlt_logstorage_log_file_name
+  *
+diff --git a/tests/gtest_dlt_daemon_offline_log.cpp b/tests/gtest_dlt_daemon_offline_log.cpp
+index b8965de..0bd4d5e 100644
+--- a/tests/gtest_dlt_daemon_offline_log.cpp
++++ b/tests/gtest_dlt_daemon_offline_log.cpp
+@@ -29,6 +29,7 @@ extern "C"
+ #include <fcntl.h>
+ }
+ 
++unsigned int g_logstorage_cache_max;
+ /* Begin Method: dlt_logstorage::t_dlt_logstorage_list_add*/
+ TEST(t_dlt_logstorage_list_add, normal)
+ {
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
index af8d9fddd7..c0b1750e0b 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
@@ -18,8 +18,8 @@ SRC_URI = "git://github.com/GENIVI/${BPN}.git;protocol=https \
     file://0002-Don-t-execute-processes-as-a-specific-user.patch \
     file://0004-Modify-systemd-config-directory.patch \
     file://275.patch \
-    file://238.patch \
     file://241.patch \
+    file://245.patch \
 "
 SRCREV = "f1ac087c766827b1d0ed9c3a814b3cc052e948f2"
 
-- 
2.25.1

