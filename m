Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web12.7519.1598688044629623133
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Aug 2020 01:00:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=D8yXoaW1;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id bo3so2051660ejb.11
        for <openembedded-devel@lists.openembedded.org>; Sat, 29 Aug 2020 01:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=RvQ92IKIJjODH+aUby2+kktXh8sZrYiThDM0u7rGeW4=;
        b=D8yXoaW14AsAXnfQStTPKQxKfajcdX5OV+JVMfBtbziC8UFXvk9u7MdA0hWF7xH3xR
         LKopLgIN6ACywO8bBUq92zIZBTdQu1Iqym/LBOv2iWoEtqA89a5Ec9V3gzeM9cOnHIx4
         2QD0XOMFH5HiZd+/VYXRvf/wco+cfBhXWXKie5gdPbvIMd4NwlgM0UiUvsBRX4A19OWx
         WFpkqvU7L+hicZAm+5T3hR1cZqrbW08bZtQOS49wSHGGxMjuHB7P1XG90MhtSSHXqqPe
         xBdwdyEc0cCpYD3evZvvkASwznJXZCaEVVX4ISAul4aOMIkWs32KiXjEigXRTBc285iM
         xRJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=RvQ92IKIJjODH+aUby2+kktXh8sZrYiThDM0u7rGeW4=;
        b=CFK4v1fZVBAFLl6Q++HpEOoKw8wKR/m687G5t67zXZqBhwyRMCM18Ro6zegpvQfVMs
         aG5kDq820MENMwe6mWQYRszE5LMXm1YvpMB7jW246JCNmVF0smvK6gTQd9fO13WyFkib
         cf9R8eF1OVM7gUNiWcUl9ERi04V1vuJh38rXjAokNzWIY1RPCpp4mEC2XMKaIUpgPeZq
         tjclZ2jwxCkOdpwt0kklKQmGaw82+CoUP0I0tE8smHwj7sVS+wX7vdIX0h0tcU2Ky4Mg
         /mXdh4PDxQfGy5yDOz1C+E9fmIkgBiNnWikCEmZwtn4mmzQjEzc1VujVIJ6NZqCsdAun
         csyw==
X-Gm-Message-State: AOAM531t6Nnj2WURjCTzulFZuu44NuPatt82CY/iP/50raRzfFTID5e1
	1J17l0xs/9Vh+nBpnCEE7m+TxEuOBHE=
X-Google-Smtp-Source: ABdhPJzWavXuuvurHPSB5sZ8dWsOKgrdp9FzxUMgzXAsbs6lQynwyygnO6Yf++jwTjZNJ4aawoYtUw==
X-Received: by 2002:a17:906:5f90:: with SMTP id a16mr2469923eju.189.1598688041243;
        Sat, 29 Aug 2020 01:00:41 -0700 (PDT)
Return-Path: <costamagna.gianfranco@gmail.com>
Received: from localhost.localdomain (mob-2-43-97-65.net.vodafone.it. [2.43.97.65])
        by smtp.gmail.com with ESMTPSA id v4sm1534334eje.39.2020.08.29.01.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2020 01:00:40 -0700 (PDT)
From: "Gianfranco" <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH] dlt-daemon: superseed upstream pr #238 patch with pr #245 due to unexpected behaviour
Date: Sat, 29 Aug 2020 10:00:38 +0200
Message-Id: <20200829080038.21440-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1

Upstream commented to use the second one

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 .../dlt-daemon/{238.patch => 245.patch}       | 53 ++++++++++++++++---
 .../dlt-daemon/dlt-daemon_2.18.5.bb           |  2 +-
 2 files changed, 47 insertions(+), 8 deletions(-)
 rename meta-oe/recipes-extended/dlt-daemon/dlt-daemon/{238.patch => 245.patch} (65%)

diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/238.patch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/245.patch
similarity index 65%
rename from meta-oe/recipes-extended/dlt-daemon/dlt-daemon/238.patch
rename to meta-oe/recipes-extended/dlt-daemon/dlt-daemon/245.patch
index 14c44e6ed..43057489c 100644
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
index 3a2b40515..f3fcee4d2 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
@@ -17,8 +17,8 @@ DEPENDS = "zlib gzip-native"
 SRC_URI = "git://github.com/GENIVI/${BPN}.git;protocol=https \
     file://0002-Don-t-execute-processes-as-a-specific-user.patch \
     file://0004-Modify-systemd-config-directory.patch \
-    file://238.patch \
     file://241.patch \
+    file://245.patch \
 "
 SRCREV = "f1ac087c766827b1d0ed9c3a814b3cc052e948f2"
 
-- 
2.17.1

