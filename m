Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 962696B6F5
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Dec 2015 05:01:28 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tB351RpJ001739
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 2 Dec 2015 21:01:27 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 2 Dec 2015 21:01:26 -0800
From: <kai.kang@windriver.com>
To: <Joe_MacDonald@mentor.com>
Date: Thu, 3 Dec 2015 12:49:29 +0800
Message-ID: <1449118169-25444-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] xl2tpd: fix warnings with gcc 5
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 03 Dec 2015 05:01:30 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

When compile with gcc 5.x, xl2tpd complains warnings:

| misc.h:68:20: warning: inline function 'swaps' declared but never
defined
|  extern inline void swaps (void *, int);
|                      ^

Backport patch to fix it.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../recipes-protocols/xl2tpd/xl2tpd.inc            |   4 +-
 .../fix-inline-functions-errors-with-gcc-5.x.patch | 134 +++++++++++++++++++++
 .../recipes-protocols/xl2tpd/xl2tpd_1.3.6.bb       |   4 +-
 3 files changed, 140 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-protocols/xl2tpd/xl2tpd/fix-inline-functions-errors-with-gcc-5.x.patch

diff --git a/meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc b/meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc
index ffec167..6f7f693 100644
--- a/meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc
+++ b/meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc
@@ -10,7 +10,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 INC_PR = "r0"
 
-SRC_URI = "git://github.com/xelerance/xl2tpd.git"
+SRC_URI = "git://github.com/xelerance/xl2tpd.git \
+    file://fix-inline-functions-errors-with-gcc-5.x.patch \
+"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-networking/recipes-protocols/xl2tpd/xl2tpd/fix-inline-functions-errors-with-gcc-5.x.patch b/meta-networking/recipes-protocols/xl2tpd/xl2tpd/fix-inline-functions-errors-with-gcc-5.x.patch
new file mode 100644
index 0000000..b75c912
--- /dev/null
+++ b/meta-networking/recipes-protocols/xl2tpd/xl2tpd/fix-inline-functions-errors-with-gcc-5.x.patch
@@ -0,0 +1,134 @@
+Upstream-Status: Backport
+
+Backport from https://github.com/xelerance/xl2tpd/commit/9098f64950eb22cf049058d40f647bafdb822174
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+From 9098f64950eb22cf049058d40f647bafdb822174 Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Wed, 23 Sep 2015 10:41:05 +0800
+Subject: [PATCH] Fix build errors caused by inline function with gcc 5
+
+GCC 5 defaults to -std=gnu11 instead of -std=gnu89. And -std=gnu89
+employs the GNU89 inline semantics, -std=gnu11 uses the C99 inline
+semantics.
+
+For 'inline' fuction, it is NOT exported by C99. So error messages such as:
+
+| control.c:1717: undefined reference to `check_control'
+
+For these functions which is not referred by other compile units, make
+them 'static inline'.
+
+For 'extern inline' function, it fails such as:
+
+| misc.h:68:20: warning: inline function 'swaps' declared but never defined
+|  extern inline void swaps (void *, int);
+|                      ^
+
+Because function swaps() is referred by other compile units, it must be
+exported. The semantics of 'extern inline' are not same between GNU89
+and C99, so remove 'inline' attribute for compatible with GNU89.
+
+Ref:
+https://gcc.gnu.org/gcc-5/porting_to.html
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ control.c | 8 ++++----
+ misc.c    | 2 +-
+ misc.h    | 2 +-
+ network.c | 4 ++--
+ 4 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/control.c b/control.c
+index b2891a9..c4a39b5 100644
+--- a/control.c
++++ b/control.c
+@@ -1140,7 +1140,7 @@ int control_finish (struct tunnel *t, struct call *c)
+     return 0;
+ }
+ 
+-inline int check_control (const struct buffer *buf, struct tunnel *t,
++static inline int check_control (const struct buffer *buf, struct tunnel *t,
+                           struct call *c)
+ {
+     /*
+@@ -1276,7 +1276,7 @@ inline int check_control (const struct buffer *buf, struct tunnel *t,
+     return 0;
+ }
+ 
+-inline int check_payload (struct buffer *buf, struct tunnel *t,
++static inline int check_payload (struct buffer *buf, struct tunnel *t,
+                           struct call *c)
+ {
+     /*
+@@ -1382,7 +1382,7 @@ inline int check_payload (struct buffer *buf, struct tunnel *t,
+ #endif
+     return 0;
+ }
+-inline int expand_payload (struct buffer *buf, struct tunnel *t,
++static inline int expand_payload (struct buffer *buf, struct tunnel *t,
+                            struct call *c)
+ {
+     /*
+@@ -1562,7 +1562,7 @@ void send_zlb (void *data)
+     toss (buf);
+ }
+ 
+-inline int write_packet (struct buffer *buf, struct tunnel *t, struct call *c,
++static inline int write_packet (struct buffer *buf, struct tunnel *t, struct call *c,
+                          int convert)
+ {
+     /*
+diff --git a/misc.c b/misc.c
+index 3092401..af90dbf 100644
+--- a/misc.c
++++ b/misc.c
+@@ -170,7 +170,7 @@ void do_packet_dump (struct buffer *buf)
+     printf ("}\n");
+ }
+ 
+-inline void swaps (void *buf_v, int len)
++void swaps (void *buf_v, int len)
+ {
+ #ifdef __alpha
+     /* Reverse byte order alpha is little endian so lest save a step.
+diff --git a/misc.h b/misc.h
+index aafdc62..caab7a1 100644
+--- a/misc.h
++++ b/misc.h
+@@ -65,7 +65,7 @@ extern void l2tp_log (int level, const char *fmt, ...);
+ extern struct buffer *new_buf (int);
+ extern void udppush_handler (int);
+ extern int addfcs (struct buffer *buf);
+-extern inline void swaps (void *, int);
++extern void swaps (void *, int);
+ extern void do_packet_dump (struct buffer *);
+ extern void status (const char *fmt, ...);
+ extern void status_handler (int signal);
+diff --git a/network.c b/network.c
+index b1268c6..d324a71 100644
+--- a/network.c
++++ b/network.c
+@@ -135,7 +135,7 @@ int init_network (void)
+     return 0;
+ }
+ 
+-inline void extract (void *buf, int *tunnel, int *call)
++static inline void extract (void *buf, int *tunnel, int *call)
+ {
+     /*
+      * Extract the tunnel and call #'s, and fix the order of the 
+@@ -155,7 +155,7 @@ inline void extract (void *buf, int *tunnel, int *call)
+     }
+ }
+ 
+-inline void fix_hdr (void *buf)
++static inline void fix_hdr (void *buf)
+ {
+     /*
+      * Fix the byte order of the header
+-- 
+2.6.1
+
diff --git a/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.6.bb b/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.6.bb
index eba0cf5..515553f 100644
--- a/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.6.bb
+++ b/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.6.bb
@@ -1,3 +1,5 @@
 require xl2tpd.inc
 
-SRC_URI = "git://github.com/xelerance/xl2tpd.git;protocol=git;tag=v${PV}"
+SRC_URI = "git://github.com/xelerance/xl2tpd.git;protocol=git;tag=v${PV} \
+    file://fix-inline-functions-errors-with-gcc-5.x.patch \
+"
-- 
2.6.1


