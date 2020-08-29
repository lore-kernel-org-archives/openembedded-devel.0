Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web11.6755.1598684097130702577
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Aug 2020 23:54:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JBc8taQB;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id oz20so1979708ejb.5
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Aug 2020 23:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=4pQwWEf8ysoXt4gqxCDOmZfjABM6qGilBbdhEkL97x8=;
        b=JBc8taQBHhTIJwhlQuZttRLStRCK2AGnDMg4SnTAtKfdyPFpWzh++hDZTbv3Pzy9f2
         lrp+4DyneT5E47fQwIC7eYXlZKRxlKfW93m9SvyF+WE31PmltlODPOs/wzgh0cfrGisK
         hwNnLf6i9GNiFZl8g4EUoeI4bOGsF5tZ/8zr/mjGk6OixobbesJT2oxpiLYzboJ81LYY
         0k6ScXlngbRwIkBQSf/ch1MQhyV1qTllyAhivND3o+EBA0bJGME8l6lg2VWK8VOFUrkc
         ix/yQzpQdVR0f0S99LHZiavWYH1Mr1HAOW/OHoU/gB4jrrr6Go7zB/esavcuiWHEqTT3
         Xm8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=4pQwWEf8ysoXt4gqxCDOmZfjABM6qGilBbdhEkL97x8=;
        b=oAJraFIhYSfAgth1G6pcgIgaShK/Ga/CpOzHljj7gxGnpl5gj1MZF3M4QrTUpyLBPj
         EmX7DGNgF1Vcf8FMhQLzbShJc26Ot+82hrydl24g1kQdhUCRjmS66WWB9rVZBNa33Xa2
         wlb3g4MzBpi9wN1q27GvUCiu/GISthPPrjV2Fnk3MtXNiN5RK9UWSX8OCiWogQyoKzrE
         ZS1eROnUl5GDtQmcZf5Qo0pUhLlpTYWiCO6wWYwmQw42Q9HeojxyWVL1V6in0qa2bIZi
         hlHezL3jmHZGPjLm8RaQgjMqi0ieK2r9+kf/xBvpY2kD7o9eybpTumqC6mxQqnyy3iDD
         4nTg==
X-Gm-Message-State: AOAM533+3qZWRZnDbnc6IDEj+ZGc1MTeZMtY2fcoLJPMaiPtjnY/6ov5
	vZ801vfmi+Ckcw+J9iXO3z4i6LoEXi0=
X-Google-Smtp-Source: ABdhPJzwsE4sDRpVOroNZX63CAAD5WOBYJI/2V/WnQa2rmBEt6hKqhOloQDZqrR+RDMTNhrRzYdIQg==
X-Received: by 2002:a17:906:f6c9:: with SMTP id jo9mr2336117ejb.152.1598684094777;
        Fri, 28 Aug 2020 23:54:54 -0700 (PDT)
Return-Path: <costamagna.gianfranco@gmail.com>
Received: from localhost.localdomain (mob-2-43-97-65.net.vodafone.it. [2.43.97.65])
        by smtp.gmail.com with ESMTPSA id w12sm1334907edv.55.2020.08.28.23.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2020 23:54:53 -0700 (PDT)
From: "Gianfranco" <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH] dlt-daemon: superseed upstream pr #238 patch with pr #245 due to unexpected behaviour
Date: Sat, 29 Aug 2020 08:54:45 +0200
Message-Id: <20200829065445.1952-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1

Upstream commented to use the second one

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 .../wvdial/wvstreams/ftbfs-gcc-10.patch       | 27 ++++++++++
 .../wvdial/wvstreams_4.6.1.bb                 |  1 +
 .../dlt-daemon/{238.patch => 245.patch}       | 53 ++++++++++++++++---
 .../dlt-daemon/dlt-daemon_2.18.5.bb           |  2 +-
 4 files changed, 75 insertions(+), 8 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/wvdial/wvstreams/ftbfs-gcc-10.patch
 rename meta-oe/recipes-extended/dlt-daemon/dlt-daemon/{238.patch => 245.patch} (65%)

diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams/ftbfs-gcc-10.patch b/meta-oe/recipes-connectivity/wvdial/wvstreams/ftbfs-gcc-10.patch
new file mode 100644
index 000000000..03d2889f1
--- /dev/null
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams/ftbfs-gcc-10.patch
@@ -0,0 +1,27 @@
+Description: Fix a build failure with gcc-10.
+ version_major is declared as unsigned int, so "-1" value makes no sense here.
+ Also, we don't want to change the variable to a public interface, better just ignore this
+ debug use-case nobody probably ever used.
+Author: Gianfranco Costamagna <locutusofborg@debian.org>
+Bug-Debian: https://bugs.debian.org/957964
+Last-Update: 2020-08-15
+
+--- wvstreams-4.6.1.orig/xplc/moduleloader.cc
++++ wvstreams-4.6.1/xplc/moduleloader.cc
+@@ -63,11 +63,11 @@ Module* Module::loadModule(const char* m
+   }
+ 
+   switch(moduleinfo->version_major) {
+-#ifdef UNSTABLE
+-  case -1:
+-    /* nothing to do */
+-    break;
+-#endif
++//#ifdef UNSTABLE
++//  case -1:
++//    /* nothing to do */
++//    break;
++//#endif
+   default:
+     loaderClose(dlh);
+     return NULL;
diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
index 20becaf57..15c0a59ee 100644
--- a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
@@ -23,6 +23,7 @@ SRC_URI = "http://${BPN}.googlecode.com/files/${BP}.tar.gz \
            file://openssl-buildfix.patch \
            file://0001-Forward-port-to-OpenSSL-1.1.x.patch \
            file://0001-Fix-narrowing-conversion-error.patch \
+           file://ftbfs-gcc-10.patch \
            "
 
 SRC_URI[md5sum] = "2760dac31a43d452a19a3147bfde571c"
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

