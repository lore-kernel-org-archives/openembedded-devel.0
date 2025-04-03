Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EF43C3601B
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 09:19:00 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by mx.groups.io with SMTP id smtpd.web10.9008.1743671936743665559
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Apr 2025 02:18:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.51, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgeamrelo04.lge.com) (156.147.1.127)
	by 156.147.23.51 with ESMTP; 3 Apr 2025 18:17:55 +0900
X-Original-SENDERIP: 156.147.1.127
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.121.109)
	by 156.147.1.127 with ESMTP; 3 Apr 2025 18:17:55 +0900
X-Original-SENDERIP: 10.177.121.109
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-devel@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [meta-oe][PATCH] libiodbc: fix build with gcc-15.0.1
Date: Thu,  3 Apr 2025 18:17:53 +0900
Message-Id: <20250403091753.1542471-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Apr 2025 09:19:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116537

From: "mark.yang" <mark.yang@lge.com>

* GCC 15 considers it an error to pass arguments to a function pointer
  defined to take no arguments. This results in a 'too many arguments to function' error.

  At the problematic function pointer call sites, the pointer is cast to a variadic function pointer type (SQLRETURN (*)(...)) to avoid the error.

* see more details in http://errors.yoctoproject.org/Errors/Details/850317
../../libiodbc-3.52.16/iodbc/hdbc.c: In function '_iodbcdm_SetConnectOption':
../../libiodbc-3.52.16/iodbc/hdbc.c:567:49: error: too many arguments to function 'hproc3'; expected 0, have 4
  567 |               CALL_DRIVER (hdbc, pdbc, retcode, hproc3,
      |                                                 ^~~~~~
  568 |                   (pdbc->dhdbc, fOption, vParam, 0));
      |                    ~~~~~~~~~~~
../../libiodbc-3.52.16/iodbc/itrace.h:113:15: note: in definition of macro 'CALL_DRIVER'
  113 |         ret = proc plist; \
      |               ^~~~
../../libiodbc-3.52.16/iodbc/hdbc.c:583:49: error: too many arguments to function 'hproc3'; expected 0, have 4
  583 |               CALL_DRIVER (hdbc, pdbc, retcode, hproc3,
      |                                                 ^~~~~~
  584 |                   (pdbc->dhdbc, fOption, vParam, SQL_NTS));
      |                    ~~~~~~~~~~~
../../libiodbc-3.52.16/iodbc/itrace.h:113:15: note: in definition of macro 'CALL_DRIVER'
  113 |         ret = proc plist; \
      |               ^~~~
../../libiodbc-3.52.16/iodbc/hdbc.c:597:45: error: too many arguments to function 'hproc2'; expected 0, have 3
  597 |           CALL_DRIVER (hdbc, pdbc, retcode, hproc2,
      |                                             ^~~~~~
  598 |               (pdbc->dhdbc, fOption, vParam));
      |                ~~~~~~~~~~~
....

../../libiodbc-3.52.16/iodbc/connect.c:2970:19: error: too many arguments to function 'dialproc'; expected 0, have 6
 2970 |         retcode = dialproc (hwnd,       /* window or display handle */
      |                   ^~~~~~~~  ~~~~
---
 ...cc-15.0.1-too-many-arguments-to-func.patch | 73 +++++++++++++++++++
 .../libiodbc/libiodbc_3.52.16.bb              |  5 +-
 2 files changed, 77 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/libiodbc/libiodbc/0001-fix-build-with-gcc-15.0.1-too-many-arguments-to-func.patch

diff --git a/meta-oe/recipes-support/libiodbc/libiodbc/0001-fix-build-with-gcc-15.0.1-too-many-arguments-to-func.patch b/meta-oe/recipes-support/libiodbc/libiodbc/0001-fix-build-with-gcc-15.0.1-too-many-arguments-to-func.patch
new file mode 100644
index 0000000000..54b966dca1
--- /dev/null
+++ b/meta-oe/recipes-support/libiodbc/libiodbc/0001-fix-build-with-gcc-15.0.1-too-many-arguments-to-func.patch
@@ -0,0 +1,73 @@
+From f7529bffc8648a192bd98da0883b94ba86e7d2b6 Mon Sep 17 00:00:00 2001
+From: "mark.yang" <mark.yang@lge.com>
+Date: Thu, 3 Apr 2025 17:45:26 +0900
+Subject: [PATCH] fix build with gcc-15.0.1 too many arguments to function
+ error
+
+* GCC 15 considers it an error to pass arguments to a function pointer
+  defined to take no arguments. This results in a 'too many arguments to function' error.
+
+  At the problematic function pointer call sites, the pointer is cast to a variadic function pointer type (SQLRETURN (*)(...)) to avoid the error.
+
+* see more details in http://errors.yoctoproject.org/Errors/Details/850317
+../../libiodbc-3.52.16/iodbc/hdbc.c: In function '_iodbcdm_SetConnectOption':
+../../libiodbc-3.52.16/iodbc/hdbc.c:567:49: error: too many arguments to function 'hproc3'; expected 0, have 4
+  567 |               CALL_DRIVER (hdbc, pdbc, retcode, hproc3,
+      |                                                 ^~~~~~
+  568 |                   (pdbc->dhdbc, fOption, vParam, 0));
+      |                    ~~~~~~~~~~~
+../../libiodbc-3.52.16/iodbc/itrace.h:113:15: note: in definition of macro 'CALL_DRIVER'
+  113 |         ret = proc plist; \
+      |               ^~~~
+../../libiodbc-3.52.16/iodbc/hdbc.c:583:49: error: too many arguments to function 'hproc3'; expected 0, have 4
+  583 |               CALL_DRIVER (hdbc, pdbc, retcode, hproc3,
+      |                                                 ^~~~~~
+  584 |                   (pdbc->dhdbc, fOption, vParam, SQL_NTS));
+      |                    ~~~~~~~~~~~
+../../libiodbc-3.52.16/iodbc/itrace.h:113:15: note: in definition of macro 'CALL_DRIVER'
+  113 |         ret = proc plist; \
+      |               ^~~~
+../../libiodbc-3.52.16/iodbc/hdbc.c:597:45: error: too many arguments to function 'hproc2'; expected 0, have 3
+  597 |           CALL_DRIVER (hdbc, pdbc, retcode, hproc2,
+      |                                             ^~~~~~
+  598 |               (pdbc->dhdbc, fOption, vParam));
+      |                ~~~~~~~~~~~
+....
+
+../../libiodbc-3.52.16/iodbc/connect.c:2970:19: error: too many arguments to function 'dialproc'; expected 0, have 6
+ 2970 |         retcode = dialproc (hwnd,       /* window or display handle */
+      |                   ^~~~~~~~  ~~~~
+
+Upstream-Status: Submitted [https://github.com/openlink/iODBC/pull/111]
+Signed-off-by: mark.yang <mark.yang@lge.com>
+---
+ iodbc/connect.c | 2 +-
+ iodbc/itrace.h  | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/iodbc/connect.c b/iodbc/connect.c
+index 632827f..1259516 100644
+--- a/iodbc/connect.c
++++ b/iodbc/connect.c
+@@ -2967,7 +2967,7 @@ SQLDriverConnect_Internal (
+             prov[size/sizeof(SQLWCHAR)] = L'\0';
+           }
+ 
+-        retcode = dialproc (hwnd,	/* window or display handle */
++        retcode = ((SQLRETURN (*)(...))dialproc) (hwnd,	/* window or display handle */
+           prov,		        /* input/output dsn buf */
+           sizeof (prov) / (waMode == 'A' ? 1 : sizeof (SQLWCHAR)), /* buf size */
+           &sqlstat,		/* error code */
+diff --git a/iodbc/itrace.h b/iodbc/itrace.h
+index 508359d..f3e6926 100644
+--- a/iodbc/itrace.h
++++ b/iodbc/itrace.h
+@@ -110,7 +110,7 @@ extern int ODBCSharedTraceFlag;
+ \
+ 	if (!t_penv->thread_safe) MUTEX_LOCK (t_penv->drv_lock); \
+ \
+-	ret = proc plist; \
++	ret = ((SQLRETURN (*)(...))proc) plist; \
+ 	if (errHandle) ((GENV_t *)(errHandle))->rc = ret; \
+ \
+ 	if (!t_penv->thread_safe) MUTEX_UNLOCK (t_penv->drv_lock); \
diff --git a/meta-oe/recipes-support/libiodbc/libiodbc_3.52.16.bb b/meta-oe/recipes-support/libiodbc/libiodbc_3.52.16.bb
index 644c3ba07b..0d2d9d5f97 100644
--- a/meta-oe/recipes-support/libiodbc/libiodbc_3.52.16.bb
+++ b/meta-oe/recipes-support/libiodbc/libiodbc_3.52.16.bb
@@ -12,7 +12,10 @@ LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=8c0138a8701f0e1282f5c8b2c7d39114 \
                     file://LICENSE.BSD;md5=5b36348a404e1d65b57df8d33fd6e414 \
                     "
 
-SRC_URI = "https://github.com/openlink/iODBC/releases/download/v${PV}/${BP}.tar.gz"
+SRC_URI = " \
+	https://github.com/openlink/iODBC/releases/download/v${PV}/${BP}.tar.gz \
+	file://0001-fix-build-with-gcc-15.0.1-too-many-arguments-to-func.patch \
+"
 SRC_URI[sha256sum] = "3898b32d07961360f6f2cf36db36036b719a230e476469258a80f32243e845fa"
 
 UPSTREAM_CHECK_URI = "https://github.com/openlink/iODBC/releases"

