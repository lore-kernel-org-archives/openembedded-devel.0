Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEB20C369AB
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 09:04:35 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.52])
 by mx.groups.io with SMTP id smtpd.web10.7682.1744967068549873225
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Apr 2025 02:04:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.52, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
	by 156.147.23.52 with ESMTP; 18 Apr 2025 18:04:25 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.120.37)
	by 156.147.1.121 with ESMTP; 18 Apr 2025 18:04:25 +0900
X-Original-SENDERIP: 10.177.120.37
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-devel@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [meta-networking][PATCH] libowfat: fix error with gcc-15
Date: Fri, 18 Apr 2025 18:04:24 +0900
Message-Id: <20250418090424.2656673-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Apr 2025 09:04:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116946

From: "mark.yang" <mark.yang@lge.com>

  * fix following errors:
  ./select.h:13:12: error: conflicting types for 'select'; have 'int(void)'
   13 | extern int select();
      |            ^~~~~~
   In file included from TOPDIR/tmp/work/core2-64-oe-linux/libowfat/0.32/recipe-sysroot/usr/include/sys/types.h:179,
                 from ./select.h:6:
   ./buffer.h:40:65: error: initialization of 'ssize_t (*)(void)' {aka 'long int (*)(void)'} from incompatible pointer type 'ssize_t (*)(int,  char *, size_t)' {aka 'long int (*)(int,  char *, long unsigned int)'} [-Wincompatible-pointer-types]
   40 | #define BUFFER_INIT(op,fd,buf,len) { (char*)(buf), 0, 0, (len), (op), NULL, NULL, (fd) }

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 ...-incompatible-type-error-with-gcc-15.patch | 100 ++++++++++++++++++
 .../recipes-support/ncp/libowfat_0.32.bb      |   1 +
 2 files changed, 101 insertions(+)
 create mode 100644 meta-networking/recipes-support/ncp/libowfat/0001-fix-incompatible-type-error-with-gcc-15.patch

diff --git a/meta-networking/recipes-support/ncp/libowfat/0001-fix-incompatible-type-error-with-gcc-15.patch b/meta-networking/recipes-support/ncp/libowfat/0001-fix-incompatible-type-error-with-gcc-15.patch
new file mode 100644
index 0000000000..6f5f3e712e
--- /dev/null
+++ b/meta-networking/recipes-support/ncp/libowfat/0001-fix-incompatible-type-error-with-gcc-15.patch
@@ -0,0 +1,100 @@
+From 397d00cfd672f3782196e927d0a878ab1d800112 Mon Sep 17 00:00:00 2001
+From: "mark.yang" <mark.yang@lge.com>
+Date: Fri, 18 Apr 2025 17:30:48 +0900
+Subject: [PATCH] fix incompatible type error with gcc 15
+
+  * fix following errors:
+  ./select.h:13:12: error: conflicting types for 'select'; have 'int(void)'
+   13 | extern int select();
+      |            ^~~~~~
+   In file included from TOPDIR/tmp/work/core2-64-oe-linux/libowfat/0.32/recipe-sysroot/usr/include/sys/types.h:179,
+                 from ./select.h:6:
+   ./buffer.h:40:65: error: initialization of 'ssize_t (*)(void)' {aka 'long int (*)(void)'} from incompatible pointer type 'ssize_t (*)(int,  char *, size_t)' {aka 'long int (*)(int,  char *, long unsigned int)'} [-Wincompatible-pointer-types]
+   40 | #define BUFFER_INIT(op,fd,buf,len) { (char*)(buf), 0, 0, (len), (op), NULL, NULL, (fd) }
+      |                                                                 ^
+Upstream-Status: Submitted [felix-libowfat@fefe.de]
+Signed-off-by: mark.yang <mark.yang@lge.com>
+---
+ buffer.h                  | 2 +-
+ buffer/buffer_frombuf.c   | 2 +-
+ buffer/buffer_stubborn.c  | 2 +-
+ buffer/buffer_stubborn2.c | 2 +-
+ buffer/buffer_tosa.c      | 2 +-
+ select.h2                 | 2 --
+ 6 files changed, 5 insertions(+), 7 deletions(-)
+
+diff --git a/buffer.h b/buffer.h
+index 54bed5c..eaf7acb 100644
+--- a/buffer.h
++++ b/buffer.h
+@@ -24,7 +24,7 @@ typedef struct buffer {
+   int fd;		/* passed as first argument to op */
+ } buffer;
+ 
+-#define BUFFER_INIT(op,fd,buf,len) { (buf), 0, 0, (len), (op), NULL, NULL, (fd) }
++#define BUFFER_INIT(op,fd,buf,len) { (buf), 0, 0, (len), (void*)(op), NULL, NULL, (fd) }
+ #define BUFFER_INIT_FREE(op,fd,buf,len) { (buf), 0, 0, (len), (op), NULL, buffer_free, (fd) }
+ #define BUFFER_INIT_READ(op,fd,buf,len) BUFFER_INIT(op,fd,buf,len) /*obsolete*/
+ #define BUFFER_INSIZE 8192
+diff --git a/buffer/buffer_frombuf.c b/buffer/buffer_frombuf.c
+index 0c9d931..2aa27ca 100644
+--- a/buffer/buffer_frombuf.c
++++ b/buffer/buffer_frombuf.c
+@@ -14,6 +14,6 @@ void buffer_frombuf(buffer* b,const char* x,size_t l) {
+   b->n=l;
+   b->a=l;
+   b->fd=0;
+-  b->op=dummyreadwrite;
++  b->op=(void*)dummyreadwrite;
+   b->deinit=0;
+ }
+diff --git a/buffer/buffer_stubborn.c b/buffer/buffer_stubborn.c
+index 2e00418..8079000 100644
+--- a/buffer/buffer_stubborn.c
++++ b/buffer/buffer_stubborn.c
+@@ -1,7 +1,7 @@
+ #include <errno.h>
+ #include "buffer.h"
+ 
+-int buffer_stubborn(ssize_t (*op)(),int fd,const char* buf, size_t len,void* cookie) {
++int buffer_stubborn(ssize_t (*op)(int,char*,size_t,void*),int fd,const char* buf, size_t len,void* cookie) {
+   ssize_t w;
+   errno=0;
+   while (len) {
+diff --git a/buffer/buffer_stubborn2.c b/buffer/buffer_stubborn2.c
+index b9146e2..b47a245 100644
+--- a/buffer/buffer_stubborn2.c
++++ b/buffer/buffer_stubborn2.c
+@@ -1,7 +1,7 @@
+ #include <errno.h>
+ #include "buffer.h"
+ 
+-ssize_t buffer_stubborn_read(ssize_t (*op)(),int fd,const char* buf, size_t len,void* cookie) {
++ssize_t buffer_stubborn_read(ssize_t (*op)(int,char*,size_t,void*),int fd,const char* buf, size_t len,void* cookie) {
+   ssize_t w;
+   for (;;) {
+     if ((w=op(fd,buf,len,cookie))<0)
+diff --git a/buffer/buffer_tosa.c b/buffer/buffer_tosa.c
+index a10be4f..99111a9 100644
+--- a/buffer/buffer_tosa.c
++++ b/buffer/buffer_tosa.c
+@@ -21,7 +21,7 @@ int buffer_tosa(buffer* b,stralloc* sa) {
+   b->n=0;
+   b->a=1024;
+   b->fd=0;
+-  b->op=strallocwrite;
++  b->op=(void*)strallocwrite;
+   b->cookie=sa;
+   b->deinit=0;
+   return 0;
+diff --git a/select.h2 b/select.h2
+index 961c380..2a22543 100644
+--- a/select.h2
++++ b/select.h2
+@@ -10,6 +10,4 @@
+ /* braindead BSD uses bzero in FD_ZERO but doesn't #include string.h */
+ #include <string.h>
+ 
+-extern int select();
+-
+ #endif
diff --git a/meta-networking/recipes-support/ncp/libowfat_0.32.bb b/meta-networking/recipes-support/ncp/libowfat_0.32.bb
index 94f36f904a..cc67d9aefa 100644
--- a/meta-networking/recipes-support/ncp/libowfat_0.32.bb
+++ b/meta-networking/recipes-support/ncp/libowfat_0.32.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 SRC_URI = "https://www.fefe.de/${BPN}/${BP}.tar.xz \
            file://0001-Depend-on-haveuint128.h-for-umult64.c.patch \
            file://0001-replace-__pure__-with-compiler-attribute-pure.patch \
+           file://0001-fix-incompatible-type-error-with-gcc-15.patch \
           "
 SRC_URI[md5sum] = "ee015ccf45cb2bc61c942642038c2bdc"
 SRC_URI[sha256sum] = "f4b9b3d9922dc25bc93adedf9e9ff8ddbebaf623f14c8e7a5f2301bfef7998c1"

