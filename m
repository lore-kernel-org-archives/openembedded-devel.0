Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A75C377024
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Sep 2015 09:20:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8I9KWxt024387
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Sep 2015 02:20:32 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Fri, 18 Sep 2015 02:20:32 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 18 Sep 2015 17:14:30 +0800
Message-ID: <1442567670-16066-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] xl2tpd: 1.3.0 -> 1.3.6
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Sep 2015 09:20:34 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Upgrade xl2tpd v1.3.0-46-gdf7e30e to 1.3.6.

* drop PR
* add patch to fix build failure with gcc 5.x

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../recipes-protocols/xl2tpd/xl2tpd.inc            |   2 -
 .../fix-inline-functions-errors-with-gcc-5.x.patch | 116 +++++++++++++++++++++
 .../recipes-protocols/xl2tpd/xl2tpd_1.3.6.bb       |   5 +
 .../recipes-protocols/xl2tpd/xl2tpd_git.bb         |   5 -
 4 files changed, 121 insertions(+), 7 deletions(-)
 create mode 100644 meta-networking/recipes-protocols/xl2tpd/xl2tpd/fix-inline-functions-errors-with-gcc-5.x.patch
 create mode 100644 meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.6.bb
 delete mode 100644 meta-networking/recipes-protocols/xl2tpd/xl2tpd_git.bb

diff --git a/meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc b/meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc
index 1a72fd1..03a1a0b 100644
--- a/meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc
+++ b/meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc
@@ -6,8 +6,6 @@ DEPENDS = "ppp virtual/kernel"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
-INC_PR = "r0"
-
 SRC_URI = "git://github.com/xelerance/xl2tpd.git"
 
 S = "${WORKDIR}/git"
diff --git a/meta-networking/recipes-protocols/xl2tpd/xl2tpd/fix-inline-functions-errors-with-gcc-5.x.patch b/meta-networking/recipes-protocols/xl2tpd/xl2tpd/fix-inline-functions-errors-with-gcc-5.x.patch
new file mode 100644
index 0000000..dc78f02
--- /dev/null
+++ b/meta-networking/recipes-protocols/xl2tpd/xl2tpd/fix-inline-functions-errors-with-gcc-5.x.patch
@@ -0,0 +1,116 @@
+Upstream-Status: Pending
+
+GCC 5.x defaults to -std=gnu11 instead of -std=gnu89. The semantics for
+inline functions changes which causes build failures such as:
+
+| misc.h:68:20: warning: inline function 'swaps' declared but never defined
+|  extern inline void swaps (void *, int);
+|                      ^
+
+and
+
+| control.c:1717: undefined reference to `check_control'
+
+Fix them by:
+1 drop 'inline' attribute for function swap()
+2 replace 'inline' with 'static inline' for other functions
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
+index 134a7bf..0ef505b 100644
+--- a/control.c
++++ b/control.c
+@@ -1139,7 +1139,7 @@ int control_finish (struct tunnel *t, struct call *c)
+     return 0;
+ }
+ 
+-inline int check_control (const struct buffer *buf, struct tunnel *t,
++static inline int check_control (const struct buffer *buf, struct tunnel *t,
+                           struct call *c)
+ {
+     /*
+@@ -1275,7 +1275,7 @@ inline int check_control (const struct buffer *buf, struct tunnel *t,
+     return 0;
+ }
+ 
+-inline int check_payload (struct buffer *buf, struct tunnel *t,
++static inline int check_payload (struct buffer *buf, struct tunnel *t,
+                           struct call *c)
+ {
+     /*
+@@ -1381,7 +1381,7 @@ inline int check_payload (struct buffer *buf, struct tunnel *t,
+ #endif
+     return 0;
+ }
+-inline int expand_payload (struct buffer *buf, struct tunnel *t,
++static inline int expand_payload (struct buffer *buf, struct tunnel *t,
+                            struct call *c)
+ {
+     /*
+@@ -1561,7 +1561,7 @@ void send_zlb (void *data)
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
+index 5e5b8b2..b019c2c 100644
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
+1.9.1
+
diff --git a/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.6.bb b/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.6.bb
new file mode 100644
index 0000000..aac11b7
--- /dev/null
+++ b/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.6.bb
@@ -0,0 +1,5 @@
+require xl2tpd.inc
+
+SRCREV = "5619e1771048e74b729804e8602f409af0f3faea"
+
+SRC_URI += "file://fix-inline-functions-errors-with-gcc-5.x.patch"
diff --git a/meta-networking/recipes-protocols/xl2tpd/xl2tpd_git.bb b/meta-networking/recipes-protocols/xl2tpd/xl2tpd_git.bb
deleted file mode 100644
index bd084aa..0000000
--- a/meta-networking/recipes-protocols/xl2tpd/xl2tpd_git.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require xl2tpd.inc
-PR = "${INC_PR}.0"
-
-SRCREV = "df7e30eb199fc5710faa83866381aea18b66e60c"
-
-- 
1.9.1


