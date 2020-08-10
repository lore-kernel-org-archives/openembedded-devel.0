Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web10.39912.1597042004105331636
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Aug 2020 23:46:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dSQG65T+;
 spf=pass (domain: gmail.com, ip: 209.85.221.67, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wr1-f67.google.com with SMTP id a5so7065732wrm.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Aug 2020 23:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=AiAiCs+0weBKs41vIfFq1InhLfIbMC9l5swGGRH3bxM=;
        b=dSQG65T+Ca6MdW6b7lN5jOAUx4n7NHXZXUBf0BXLMU+UFL+WAWcKijwkiNGWJHvv5s
         LGkiCZ4Q8YO0xGdmMIsmBCRwvfCcXERli3VttTpvNT/Mz94DP98QtbOEaFTHqlI4JrrU
         yDOW/gk/Q0CHp4J0HHOr26nl3EjWkeRGdeNv6swSoW4v9CgHGEQtyW8McPVTjvSI+cVH
         5PP90ybQFEZtB+I+1eJX3YOD85JDqMxyLmi/hOXGIdotSnNAGHfEQ3H7ZMr/r8lRe/6F
         5aKtlgZDQza85sDj+YaWvQ4HrN4f2rZmOMV/9GDmU7kI96f03qhsqaCDd1wF7kFJIGsD
         Ht0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=AiAiCs+0weBKs41vIfFq1InhLfIbMC9l5swGGRH3bxM=;
        b=g/faXizgYHYz6i3qQhfL87zU8Aw30KjI+v4cbo3svluU1Pq78FXCTqhiGNSNuSUQnn
         Udmqoq0tQvnyVTVg5+/SzepHpVRJUdcM52WY27+jUXcQu7vs6id3R/noHasFsT/R6rvP
         b/30nfcxIwBQsIDXszfBqsYNLCZ+Y3JKKQyfZ4uAiha1xuQ84Cy2EpFr+OaGHJ6eooHV
         zj/sWvDqGnRb3Jstq3DKN2SQR4aiIzOCdDPqdqg6LrImFxXZV0K2niya/6LrX4szOO0k
         8lpmZknGVTsD/LRVbFAM1MXSHyFS51iX7cN72WIC8Mo4XwOyejQPpm5H70RGNjyHDejN
         1H0w==
X-Gm-Message-State: AOAM530KauVZ283ynBi6MpC5SyBavsPSw4i52yb11JSISlhpQ7zZ83GL
	oFEasZCvQjVDj7YI/TdOyUQmnHCk
X-Google-Smtp-Source: ABdhPJyEpKF92DCXE1A4AkSpToDxACdimCykz/ztClHvZcGFOdzAHe1bjDSA0AsoHAip0ERTeXQWbw==
X-Received: by 2002:a05:6000:1152:: with SMTP id d18mr24713002wrx.357.1597042001522;
        Sun, 09 Aug 2020 23:46:41 -0700 (PDT)
Return-Path: <costamagna.gianfranco@gmail.com>
Received: from localhost.localdomain ([5.170.82.145])
        by smtp.gmail.com with ESMTPSA id e16sm19410479wrx.30.2020.08.09.23.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2020 23:46:40 -0700 (PDT)
From: "Gianfranco" <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco <costamagna.gianfranco@gmail.com>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH 1/5] dlt-daemon: update to 2.18.5
Date: Mon, 10 Aug 2020 08:46:29 +0200
Message-Id: <20200810064633.20079-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1

From: Gianfranco <costamagna.gianfranco@gmail.com>

 - drop patch 204: upstream
 - add gcc-10 build fix proposed upstream 238.patch

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 .../dlt-daemon/dlt-daemon/204.patch           | 148 ------------------
 .../dlt-daemon/dlt-daemon/238.patch           |  35 +++++
 ...-daemon_2.18.4.bb => dlt-daemon_2.18.5.bb} |   4 +-
 3 files changed, 37 insertions(+), 150 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/204.patch
 create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/238.patch
 rename meta-oe/recipes-extended/dlt-daemon/{dlt-daemon_2.18.4.bb => dlt-daemon_2.18.5.bb} (97%)

diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/204.patch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/204.patch
deleted file mode 100644
index f0fc0bcb2..000000000
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/204.patch
+++ /dev/null
@@ -1,148 +0,0 @@
-Upstream-Status: Submitted [https://github.com/GENIVI/dlt-daemon/pull/204]
-From 92830aff6e91041f574753d78da758c62981d9a4 Mon Sep 17 00:00:00 2001
-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
-Date: Sat, 25 Jan 2020 09:08:07 +0100
-Subject: [PATCH 1/3] dlt_user.h: fix build when musl is the libc
- implementation, by adding a missing include for pthread_t reference:
-
-see https://errors.yoctoproject.org/Errors/Details/308000/ for details
-
-Thanks Khem Raj <raj.khem@gmail.com> for the report
-
-Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
-Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
----
- include/dlt/dlt_user.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/include/dlt/dlt_user.h b/include/dlt/dlt_user.h
-index 69cb854..766d349 100644
---- a/include/dlt/dlt_user.h
-+++ b/include/dlt/dlt_user.h
-@@ -74,6 +74,7 @@
-  \{
-  */
- #   include <mqueue.h>
-+#   include <pthread.h>
- 
- #   if !defined (__WIN32__)
- #      include <semaphore.h>
-
-From 5f67aba02c12b7446e63ccc86285c13bc5c7a432 Mon Sep 17 00:00:00 2001
-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
-Date: Sat, 25 Jan 2020 09:16:14 +0100
-Subject: [PATCH 2/3] dlt-test-init-free: fix build failure with strict
- compiler flags, due to uint being undefined. This is actually an "int" type,
- looking at the test implementation
-
-Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
-Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
----
- src/tests/dlt-test-init-free.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/tests/dlt-test-init-free.c b/src/tests/dlt-test-init-free.c
-index 96b5245..35b8803 100644
---- a/src/tests/dlt-test-init-free.c
-+++ b/src/tests/dlt-test-init-free.c
-@@ -32,7 +32,7 @@
- 
- void exec(const char *cmd, char *buffer, size_t length);
- void printMemoryUsage();
--char *occupyMemory(uint size);
-+char *occupyMemory(int size);
- void do_example_test();
- void do_dlt_test();
- 
-@@ -131,7 +131,7 @@ void printMemoryUsage()
-     printf("%s", result);
- }
- 
--char *occupyMemory(uint size)
-+char *occupyMemory(int size)
- {
-     char *buf = (char *)malloc(size * sizeof(char));
- 
-
-From c790d61fad382e5d3e648ee99904087eb9bc4a77 Mon Sep 17 00:00:00 2001
-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
-Date: Sat, 25 Jan 2020 09:20:48 +0100
-Subject: [PATCH 3/3] sys/poll.h: deprecate old sys/poll.h include header, now
- glibc/musl wants poll.h being included directly. This fixes a build failure
- on musl systems with strict c hardening flags
-
-Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
-Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
----
- src/console/logstorage/dlt-logstorage-ctrl.c | 2 +-
- src/daemon/dlt_daemon_event_handler.c        | 2 +-
- src/daemon/dlt_daemon_event_handler.h        | 2 +-
- src/daemon/dlt_daemon_event_handler_types.h  | 2 +-
- src/lib/dlt_user.c                           | 2 +-
- 5 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/src/console/logstorage/dlt-logstorage-ctrl.c b/src/console/logstorage/dlt-logstorage-ctrl.c
-index 525c137..6614f44 100644
---- a/src/console/logstorage/dlt-logstorage-ctrl.c
-+++ b/src/console/logstorage/dlt-logstorage-ctrl.c
-@@ -61,7 +61,7 @@
- #include <string.h>
- #include <getopt.h>
- 
--#include <sys/poll.h>
-+#include <poll.h>
- 
- #if defined(__linux__)
- #   include "sd-daemon.h"
-diff --git a/src/daemon/dlt_daemon_event_handler.c b/src/daemon/dlt_daemon_event_handler.c
-index 1611f7b..0d463da 100644
---- a/src/daemon/dlt_daemon_event_handler.c
-+++ b/src/daemon/dlt_daemon_event_handler.c
-@@ -30,7 +30,7 @@
- #include <string.h>
- #include <errno.h>
- 
--#include <sys/poll.h>
-+#include <poll.h>
- #include <syslog.h>
- 
- #include "dlt_common.h"
-diff --git a/src/daemon/dlt_daemon_event_handler.h b/src/daemon/dlt_daemon_event_handler.h
-index eb96101..bd550d3 100644
---- a/src/daemon/dlt_daemon_event_handler.h
-+++ b/src/daemon/dlt_daemon_event_handler.h
-@@ -25,7 +25,7 @@
-  * \file dlt_daemon_event_handler.h
-  */
- 
--#include <sys/poll.h>
-+#include <poll.h>
- 
- #include "dlt_daemon_connection_types.h"
- #include "dlt_daemon_event_handler_types.h"
-diff --git a/src/daemon/dlt_daemon_event_handler_types.h b/src/daemon/dlt_daemon_event_handler_types.h
-index 370e503..0b16d08 100644
---- a/src/daemon/dlt_daemon_event_handler_types.h
-+++ b/src/daemon/dlt_daemon_event_handler_types.h
-@@ -25,7 +25,7 @@
-  * \file dlt_daemon_event_handler_types.h
-  */
- 
--#include <sys/poll.h>
-+#include <poll.h>
- 
- #include "dlt_daemon_connection_types.h"
- 
-#diff --git a/src/lib/dlt_user.c b/src/lib/dlt_user.c
-#index ffa9b09..511f991 100644
-#--- a/src/lib/dlt_user.c
-#+++ b/src/lib/dlt_user.c
-#@@ -43,7 +43,7 @@
-# #include <errno.h>
-# 
-# #include <sys/uio.h> /* writev() */
-#-#include <sys/poll.h>
-#+#include <poll.h>
-# 
-# #include <limits.h>
-# #ifdef linux
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/238.patch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/238.patch
new file mode 100644
index 000000000..14c44e6ed
--- /dev/null
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/238.patch
@@ -0,0 +1,35 @@
+From 214f8c71552fc096077f0b916dad75b31eefea3d Mon Sep 17 00:00:00 2001
+From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
+Date: Fri, 31 Jul 2020 15:26:35 +0200
+Subject: [PATCH] dlt_offline: fix build failures with gcc-10
+
+see bug report: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=957140
+
+/usr/bin/ld: CMakeFiles/dlt-daemon.dir/dlt_daemon_client.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:116: multiple definition of `g_logstorage_cache_max'; CMakeFiles/dlt-daemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:116: first defined here
+/usr/bin/ld: CMakeFiles/dlt-daemon.dir/dlt_daemon_common.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:118: multiple definition of `g_logstorage_cache_size'; CMakeFiles/dlt-daemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:118: first defined here
+/usr/bin/ld: CMakeFiles/dlt-daemon.dir/dlt_daemon_common.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:116: multiple definition of `g_logstorage_cache_max'; CMakeFiles/dlt-daemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:116: first defined here
+/usr/bin/ld: CMakeFiles/dlt-daemon.dir/dlt_daemon_connection.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:118: multiple definition of `g_logstorage_cache_size'; CMakeFiles/dlt-daemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:118: first defined here
+/usr/bin/ld: CMakeFiles/dlt-daemon.dir/dlt_daemon_connection.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:116: multiple definition of `g_logstorage_cache_max'; CMakeFiles/dlt-daemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:116: first defined here
+/usr/bin/ld: CMakeFiles/dlt-daemon.dir/dlt_daemon_event_handler.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:118: multiple definition of `g_logstorage_cache_size'; CMakeFiles/dlt-daemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:118: first defined here
+/usr/bin/ld: CMakeFiles/dlt-daemon.dir/dlt_daemon_event_handler.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:116: multiple definition of `g_logstorage_cache_max'; CMakeFiles/dlt-daemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:116: first defined here
+/usr/bin/ld: CMakeFiles/dlt-daemon.dir/dlt_daemon_offline_logstorage.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:116: multiple definition of `g_logstorage_cache_max'; CMakeFiles/dlt-daemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:116: first defined here
+---
+ src/offlinelogstorage/dlt_offline_logstorage.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/offlinelogstorage/dlt_offline_logstorage.h b/src/offlinelogstorage/dlt_offline_logstorage.h
+index b58da70..8ad84b8 100644
+--- a/src/offlinelogstorage/dlt_offline_logstorage.h
++++ b/src/offlinelogstorage/dlt_offline_logstorage.h
+@@ -114,9 +114,9 @@
+ #define DLT_OFFLINE_LOGSTORAGE_IS_STRATEGY_SET(S, s) ((S)&(s))
+ 
+ /* logstorage max cache */
+-unsigned int g_logstorage_cache_max;
++static unsigned int g_logstorage_cache_max;
+ /* current logstorage cache size */
+-unsigned int g_logstorage_cache_size;
++static unsigned int g_logstorage_cache_size;
+ 
+ typedef struct
+ {
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.4.bb b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
similarity index 97%
rename from meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.4.bb
rename to meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
index 35c638bc7..3f5089672 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.4.bb
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
@@ -17,9 +17,9 @@ DEPENDS = "zlib gzip-native"
 SRC_URI = "git://github.com/GENIVI/${BPN}.git;protocol=https \
     file://0002-Don-t-execute-processes-as-a-specific-user.patch \
     file://0004-Modify-systemd-config-directory.patch \
-    file://204.patch \
+    file://238.patch \
 "
-SRCREV = "14ea971be7e808b9c5099c7f404ed3cf341873c4"
+SRCREV = "f1ac087c766827b1d0ed9c3a814b3cc052e948f2"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1

