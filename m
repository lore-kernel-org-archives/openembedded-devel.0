Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3596C28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 06:38:27 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by mx.groups.io with SMTP id smtpd.web10.1858.1743575902604455479
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Apr 2025 23:38:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.51, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgeamrelo04.lge.com) (156.147.1.127)
	by 156.147.23.51 with ESMTP; 2 Apr 2025 15:38:19 +0900
X-Original-SENDERIP: 156.147.1.127
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.121.109)
	by 156.147.1.127 with ESMTP; 2 Apr 2025 15:38:19 +0900
X-Original-SENDERIP: 10.177.121.109
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-devel@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [meta-networking][PATCH] unbound: fix build with gcc-15.0.1
Date: Wed,  2 Apr 2025 15:38:17 +0900
Message-Id: <20250402063817.1401061-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Apr 2025 06:38:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116505

From: "mark.yang" <mark.yang@lge.com>

* fix following error:
  http://errors.yoctoproject.org/Errors/Details/850313/
  ../git/compat/malloc.c:9:7: warning: conflicting types for built-in function 'malloc'; expected 'void *(long unsigned int)' [-Wbuiltin-declaration-mismatch]
    9 | void *malloc ();
      |       ^~~~~~
  ../git/compat/malloc.c:5:1: note: 'malloc' is declared in header '<stdlib.h>'
    4 | #include "config.h"
  +++ |+#include <stdlib.h>
    5 | #undef malloc
  ../git/compat/malloc.c: In function 'rpl_malloc_unbound':
  ../git/compat/malloc.c:23:10: error: too many arguments to function 'malloc'; expected 0, have 1
   23 |   return malloc (n);
      |          ^~~~~~  ~
  ../git/compat/malloc.c:9:7: note: declared here
    9 | void *malloc ();
      |       ^~~~~~

* Seeing that there is '#undef malloc', it appears they don't want to
  use the malloc from stdlib.h.
  Therefore, we need to correctly define the parameters for malloc.

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 ...cc-15-Wbuiltin-declaration-mismatch-.patch | 44 +++++++++++++++++++
 .../recipes-support/unbound/unbound_1.22.0.bb |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta-networking/recipes-support/unbound/unbound/0001-fix-build-with-gcc-15-Wbuiltin-declaration-mismatch-.patch

diff --git a/meta-networking/recipes-support/unbound/unbound/0001-fix-build-with-gcc-15-Wbuiltin-declaration-mismatch-.patch b/meta-networking/recipes-support/unbound/unbound/0001-fix-build-with-gcc-15-Wbuiltin-declaration-mismatch-.patch
new file mode 100644
index 0000000000..70a41f7e37
--- /dev/null
+++ b/meta-networking/recipes-support/unbound/unbound/0001-fix-build-with-gcc-15-Wbuiltin-declaration-mismatch-.patch
@@ -0,0 +1,44 @@
+From 1c58ce07919c36e6a11eead67bd6d14cc22acaec Mon Sep 17 00:00:00 2001
+From: "mark.yang" <mark.yang@lge.com>
+Date: Wed, 2 Apr 2025 15:25:42 +0900
+Subject: [PATCH] fix build with gcc-15 -Wbuiltin-declaration-mismatch error
+
+See more details: http://errors.yoctoproject.org/Errors/Details/850313
+../git/compat/malloc.c:9:7: warning: conflicting types for built-in function 'malloc'; expected 'void *(long unsigned int)' [-Wbuiltin-declaration-mismatch]
+    9 | void *malloc ();
+      |       ^~~~~~
+../git/compat/malloc.c:5:1: note: 'malloc' is declared in header '<stdlib.h>'
+    4 | #include "config.h"
+  +++ |+#include <stdlib.h>
+    5 | #undef malloc
+../git/compat/malloc.c: In function 'rpl_malloc_unbound':
+../git/compat/malloc.c:23:10: error: too many arguments to function 'malloc'; expected 0, have 1
+   23 |   return malloc (n);
+      |          ^~~~~~  ~
+../git/compat/malloc.c:9:7: note: declared here
+    9 | void *malloc ();
+      |       ^~~~~~
+
+* Seeing that there is '#undef malloc', it appears they don't want to
+  use the malloc from stdlib.h.
+  Therefore, we need to correctly define the parameters for malloc.
+
+Upstream-Status: Submitted [https://github.com/NLnetLabs/unbound/pull/1262]
+Signed-off-by: mark.yang <mark.yang@lge.com>
+---
+ compat/malloc.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/compat/malloc.c b/compat/malloc.c
+index d8097b13e..af9dcf134 100644
+--- a/compat/malloc.c
++++ b/compat/malloc.c
+@@ -6,7 +6,7 @@
+ #include <sys/types.h>
+ 
+ #ifndef USE_WINSOCK
+-void *malloc ();
++void *malloc (size_t n);
+ #else
+ /* provide a prototype */
+ void *malloc (size_t n);
diff --git a/meta-networking/recipes-support/unbound/unbound_1.22.0.bb b/meta-networking/recipes-support/unbound/unbound_1.22.0.bb
index 2f0c92dd9f..c434ca181f 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.22.0.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.22.0.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5308494bc0590c0cb036afd781d78f06"
 
 SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=master \
            file://run-ptest \
+           file://0001-fix-build-with-gcc-15-Wbuiltin-declaration-mismatch-.patch \
            "
 
 # 17 commits after 1.22.0 tag:

