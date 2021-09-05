Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web09.13444.1630869674330301657
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Sep 2021 12:21:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZrdndlIx;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id x7so2999126pfa.8
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Sep 2021 12:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ml8Kknid2YIx08Zta2Zm1qPqa3lNTRb2ZLR5lPU9qPc=;
        b=ZrdndlIx2EPm2ETPnCdseBjACiKqJfdDsfY3YrLSvyCF4HPIwZl1aHsMIjpNxJWctk
         pOBgN8whk7na6bWompH0btMfhGyoweZdPwr5uitR3Va1//iL0L5y7kGNJZiSe/GwQont
         PlW601GnqZpWqMxBkYDSsqJvCbf2bCFw+7plafCSeKgWF7fL7gZaPgdsFNakFF8G2zhQ
         xeJnBsrKE5BtWngE2t3LT4700i7DvCpkYfQXThEoutms/A/77BxHTeUi6JV79iAfJNuY
         i5LTerl4lKXIY/q3unpq/kNL8luCKoxXwmPjOyZH1sJC/8pZLgpBmDX4YF28a7Phqcb8
         arBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ml8Kknid2YIx08Zta2Zm1qPqa3lNTRb2ZLR5lPU9qPc=;
        b=bCMwh92DKM/ydaLgvoecFpt+SS06aGJKGUw89GetJUaattfNNqQp6z3yjQ8RvrcH4H
         xH8lr5mwp7hgwqVHzGz5REjsn/Sx7yVZ3zQr1er7NKsot4eUZvXe+0V4fjiHX2ef8s92
         xxHthOu7YU9p1+5dM7F/xcnRLIn5XG37rIgIdG0Dv9LXQuatlDk/e/FCqVJPq+kB7FRN
         nHQ1DkB6k8IeaCivoQRp5ietF/dlAmw578+Hfk7NJ/euZRk3iVv6rpNPVN1dmcqLivYS
         0ZStVkuc0qw30SAtnKn4S/RcEwAsEVQH1mtAlJY4HAeHqkfgcOV+wwCuO+CWsRXpelXE
         X3YQ==
X-Gm-Message-State: AOAM532vDRnTqMYsfJ5VE0O2n1iKfm31lSOok4axnn2czgvKFFkm/P/Z
	RchwYh8CmGb4jl0T6yHPGbeVdt74xWo=
X-Google-Smtp-Source: ABdhPJyExufzYeQio0Aspka9MQHN8pYRR3iVx+S6kx+5k822OfD9rj2tVvwNtsDcVjQXim/7RqvlsA==
X-Received: by 2002:a05:6a00:d4f:b0:407:8c1c:76c2 with SMTP id n15-20020a056a000d4f00b004078c1c76c2mr8468954pfv.31.1630869673618;
        Sun, 05 Sep 2021 12:21:13 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:741f:21b:dc9f:801])
        by smtp.gmail.com with ESMTPSA id b17sm6207128pgl.61.2021.09.05.12.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Sep 2021 12:21:13 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco <costamagna.gianfranco@gmail.com>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>,
	Khem Raj <raj.khem@gmail.com>,
	Scott Murray <scott.murray@konsulko.com>
Subject: [PATCH 1/8] dlt-daemon: update to 2.18.5
Date: Sun,  5 Sep 2021 12:21:04 -0700
Message-Id: <20210905192112.2081037-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gianfranco <costamagna.gianfranco@gmail.com>

 - drop patch 204: upstream
 - add gcc-10 build fix proposed upstream 238.patch

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 97092276dd453a4ef67aaec7bdcb0fb3cf1a5ca5)
[Stable version, bug fix only]
Signed-off-by: Scott Murray <scott.murray@konsulko.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
index f0fc0bcb2c..0000000000
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
index 0000000000..14c44e6edd
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
index 45724e98ac..33d5c696f3 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.4.bb
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
@@ -17,10 +17,10 @@ DEPENDS = "zlib gzip-native"
 SRC_URI = "git://github.com/GENIVI/${BPN}.git;protocol=https \
     file://0002-Don-t-execute-processes-as-a-specific-user.patch \
     file://0004-Modify-systemd-config-directory.patch \
-    file://204.patch \
     file://275.patch \
+    file://238.patch \
 "
-SRCREV = "14ea971be7e808b9c5099c7f404ed3cf341873c4"
+SRCREV = "f1ac087c766827b1d0ed9c3a814b3cc052e948f2"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

