Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 67AAE60616
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Nov 2015 07:50:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tAU7oGhq000066
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Nov 2015 23:50:16 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sun, 29 Nov 2015 23:50:15 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 30 Nov 2015 15:38:51 +0800
Message-ID: <1448869131-24453-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] xl2tpd: 1.3.0 -> 1.3.6
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
X-List-Received-Date: Mon, 30 Nov 2015 07:50:18 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Upgrade xl2tpd v1.3.0-46-gdf7e30e to 1.3.6.

* drop PR
* add patch to fix build warnings with gcc 5.x:

| misc.h:68:20: warning: inline function 'swaps' declared but never defined

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../recipes-protocols/xl2tpd/xl2tpd.inc            |   2 -
 .../fix-inline-functions-errors-with-gcc-5.x.patch | 134 +++++++++++++++++++++
 .../xl2tpd/{xl2tpd_git.bb => xl2tpd_1.3.6.bb}      |   4 +-
 3 files changed, 136 insertions(+), 4 deletions(-)
 create mode 100644 meta-networking/recipes-protocols/xl2tpd/xl2tpd/fix-inline-functions-errors-with-gcc-5.x.patch
 rename meta-networking/recipes-protocols/xl2tpd/{xl2tpd_git.bb => xl2tpd_1.3.6.bb} (15%)

diff --git a/meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc b/meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc
index ffec167..d2402c5 100644
--- a/meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc
+++ b/meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc
@@ -8,8 +8,6 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
-INC_PR = "r0"
-
 SRC_URI = "git://github.com/xelerance/xl2tpd.git"
 
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
diff --git a/meta-networking/recipes-protocols/xl2tpd/xl2tpd_git.bb b/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.6.bb
similarity index 15%
rename from meta-networking/recipes-protocols/xl2tpd/xl2tpd_git.bb
rename to meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.6.bb
index bd084aa..aac11b7 100644
--- a/meta-networking/recipes-protocols/xl2tpd/xl2tpd_git.bb
+++ b/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.6.bb
@@ -1,5 +1,5 @@
 require xl2tpd.inc
-PR = "${INC_PR}.0"
 
-SRCREV = "df7e30eb199fc5710faa83866381aea18b66e60c"
+SRCREV = "5619e1771048e74b729804e8602f409af0f3faea"
 
+SRC_URI += "file://fix-inline-functions-errors-with-gcc-5.x.patch"
-- 
2.6.1


