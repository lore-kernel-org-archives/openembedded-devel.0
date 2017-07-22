Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id ABDE57844B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jul 2017 16:51:02 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id c23so7123503pfe.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jul 2017 09:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=S8lWL0GVMgAvw49Q5rIhjES267baGFG+M6ex3Soo5Gk=;
	b=Vx9tDPzQOdDEIpV2KRKwuHkWtTfWvayDN5WnMyi9ztM+QgqQfWpWy24erxyHrsRTx/
	q7zLTviFMYaho14Mg1hdh7QM33PUY9knb6ZglDJaapsXOKvsi1PF2dgfpcx15P0bjCRm
	+G3f0Aw48bSpgkjMcGRPWDRpvsn8xI3C0gHP/mN57SdNYl6ZZkAwDEKDXdFLBQvyjua1
	cp7Wz6EyKCeNAp20lq8iON0iDtliRt18l/uuUUeXXg4CXJAzJAMzhOpeXs/AqviarY/3
	lnGFg9b72SOoS3eX8MDJ4WjquuA33WmWYBu1j/D2LNCohD5T7IVPpT/lxuSM0id8KCFt
	j1hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=S8lWL0GVMgAvw49Q5rIhjES267baGFG+M6ex3Soo5Gk=;
	b=myM39WOKNADlL//2YT7NCDxhRam4P1/HTM+mBMajxcjX/yp+EXLqxqQ2ckXRZhGxZ0
	I0Ur6qaB3pN2CuJHjqRe6DlORrDtSgYMCFo7oRqnlHF4pYXLHD+bO3QplrQtI+lxWsN7
	ryRVV9/WYx5m5cEJ4oCL7H8o9lKSTB6Wbsr9vgHW8gDMWq/nd0tf3x2734hLexqQDww/
	A9s53LLNqfNazmDY77j5XV9EQVRei8bN9LQ9x69DH4pZZI4ZuNp+9sUbyADG7QmLlmgD
	b+vAAcrlgMW6671rHEZ20ZxTvYeacQmzR2V1kaLhjL6wAaCN+9PCYByc8cIXc3laC4rl
	hR7w==
X-Gm-Message-State: AIVw112jTnEEVad6w9fG93dQRIoyHDsPMWCLV28fC3yyOSDhRgGxrKEa
	+Kl0GeBg+TiWZR8F
X-Received: by 10.84.241.207 with SMTP id t15mr12064160plm.338.1500742263783; 
	Sat, 22 Jul 2017 09:51:03 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	o10sm15628924pgc.81.2017.07.22.09.51.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 22 Jul 2017 09:51:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 22 Jul 2017 09:50:44 -0700
Message-Id: <20170722165045.44735-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170722165045.44735-1-raj.khem@gmail.com>
References: <20170722165045.44735-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 3/4] xl2tpd: Update to 1.3.9
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
X-List-Received-Date: Sat, 22 Jul 2017 16:51:02 -0000

License changes are cosmetic

https://github.com/xelerance/xl2tpd/commit/1611d6f028fe30da4cee5b026fd1de81d97cba48

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-protocols/xl2tpd/xl2tpd.inc            |   5 +-
 .../fix-inline-functions-errors-with-gcc-5.x.patch | 134 ---------------------
 .../recipes-protocols/xl2tpd/xl2tpd_git.bb         |   4 +-
 3 files changed, 3 insertions(+), 140 deletions(-)
 delete mode 100644 meta-networking/recipes-protocols/xl2tpd/xl2tpd/fix-inline-functions-errors-with-gcc-5.x.patch

diff --git a/meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc b/meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc
index 6f7f69330..d037c7cfc 100644
--- a/meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc
+++ b/meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc
@@ -6,12 +6,9 @@ DEPENDS = "ppp virtual/kernel"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0636e73ff0215e8d672dc4c32c317bb3"
-
-INC_PR = "r0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/xelerance/xl2tpd.git \
-    file://fix-inline-functions-errors-with-gcc-5.x.patch \
 "
 
 S = "${WORKDIR}/git"
diff --git a/meta-networking/recipes-protocols/xl2tpd/xl2tpd/fix-inline-functions-errors-with-gcc-5.x.patch b/meta-networking/recipes-protocols/xl2tpd/xl2tpd/fix-inline-functions-errors-with-gcc-5.x.patch
deleted file mode 100644
index b75c9129d..000000000
--- a/meta-networking/recipes-protocols/xl2tpd/xl2tpd/fix-inline-functions-errors-with-gcc-5.x.patch
+++ /dev/null
@@ -1,134 +0,0 @@
-Upstream-Status: Backport
-
-Backport from https://github.com/xelerance/xl2tpd/commit/9098f64950eb22cf049058d40f647bafdb822174
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
-From 9098f64950eb22cf049058d40f647bafdb822174 Mon Sep 17 00:00:00 2001
-From: Kai Kang <kai.kang@windriver.com>
-Date: Wed, 23 Sep 2015 10:41:05 +0800
-Subject: [PATCH] Fix build errors caused by inline function with gcc 5
-
-GCC 5 defaults to -std=gnu11 instead of -std=gnu89. And -std=gnu89
-employs the GNU89 inline semantics, -std=gnu11 uses the C99 inline
-semantics.
-
-For 'inline' fuction, it is NOT exported by C99. So error messages such as:
-
-| control.c:1717: undefined reference to `check_control'
-
-For these functions which is not referred by other compile units, make
-them 'static inline'.
-
-For 'extern inline' function, it fails such as:
-
-| misc.h:68:20: warning: inline function 'swaps' declared but never defined
-|  extern inline void swaps (void *, int);
-|                      ^
-
-Because function swaps() is referred by other compile units, it must be
-exported. The semantics of 'extern inline' are not same between GNU89
-and C99, so remove 'inline' attribute for compatible with GNU89.
-
-Ref:
-https://gcc.gnu.org/gcc-5/porting_to.html
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
- control.c | 8 ++++----
- misc.c    | 2 +-
- misc.h    | 2 +-
- network.c | 4 ++--
- 4 files changed, 8 insertions(+), 8 deletions(-)
-
-diff --git a/control.c b/control.c
-index b2891a9..c4a39b5 100644
---- a/control.c
-+++ b/control.c
-@@ -1140,7 +1140,7 @@ int control_finish (struct tunnel *t, struct call *c)
-     return 0;
- }
- 
--inline int check_control (const struct buffer *buf, struct tunnel *t,
-+static inline int check_control (const struct buffer *buf, struct tunnel *t,
-                           struct call *c)
- {
-     /*
-@@ -1276,7 +1276,7 @@ inline int check_control (const struct buffer *buf, struct tunnel *t,
-     return 0;
- }
- 
--inline int check_payload (struct buffer *buf, struct tunnel *t,
-+static inline int check_payload (struct buffer *buf, struct tunnel *t,
-                           struct call *c)
- {
-     /*
-@@ -1382,7 +1382,7 @@ inline int check_payload (struct buffer *buf, struct tunnel *t,
- #endif
-     return 0;
- }
--inline int expand_payload (struct buffer *buf, struct tunnel *t,
-+static inline int expand_payload (struct buffer *buf, struct tunnel *t,
-                            struct call *c)
- {
-     /*
-@@ -1562,7 +1562,7 @@ void send_zlb (void *data)
-     toss (buf);
- }
- 
--inline int write_packet (struct buffer *buf, struct tunnel *t, struct call *c,
-+static inline int write_packet (struct buffer *buf, struct tunnel *t, struct call *c,
-                          int convert)
- {
-     /*
-diff --git a/misc.c b/misc.c
-index 3092401..af90dbf 100644
---- a/misc.c
-+++ b/misc.c
-@@ -170,7 +170,7 @@ void do_packet_dump (struct buffer *buf)
-     printf ("}\n");
- }
- 
--inline void swaps (void *buf_v, int len)
-+void swaps (void *buf_v, int len)
- {
- #ifdef __alpha
-     /* Reverse byte order alpha is little endian so lest save a step.
-diff --git a/misc.h b/misc.h
-index aafdc62..caab7a1 100644
---- a/misc.h
-+++ b/misc.h
-@@ -65,7 +65,7 @@ extern void l2tp_log (int level, const char *fmt, ...);
- extern struct buffer *new_buf (int);
- extern void udppush_handler (int);
- extern int addfcs (struct buffer *buf);
--extern inline void swaps (void *, int);
-+extern void swaps (void *, int);
- extern void do_packet_dump (struct buffer *);
- extern void status (const char *fmt, ...);
- extern void status_handler (int signal);
-diff --git a/network.c b/network.c
-index b1268c6..d324a71 100644
---- a/network.c
-+++ b/network.c
-@@ -135,7 +135,7 @@ int init_network (void)
-     return 0;
- }
- 
--inline void extract (void *buf, int *tunnel, int *call)
-+static inline void extract (void *buf, int *tunnel, int *call)
- {
-     /*
-      * Extract the tunnel and call #'s, and fix the order of the 
-@@ -155,7 +155,7 @@ inline void extract (void *buf, int *tunnel, int *call)
-     }
- }
- 
--inline void fix_hdr (void *buf)
-+static inline void fix_hdr (void *buf)
- {
-     /*
-      * Fix the byte order of the header
--- 
-2.6.1
-
diff --git a/meta-networking/recipes-protocols/xl2tpd/xl2tpd_git.bb b/meta-networking/recipes-protocols/xl2tpd/xl2tpd_git.bb
index 42bc398a1..88ae5d6f8 100644
--- a/meta-networking/recipes-protocols/xl2tpd/xl2tpd_git.bb
+++ b/meta-networking/recipes-protocols/xl2tpd/xl2tpd_git.bb
@@ -2,7 +2,7 @@ require xl2tpd.inc
 
 # This is v1.3.6 plus some commits.  There is no tag for this commit.
 #
-PV = "1.3.6+git${SRCPV}"
+PV = "1.3.9+git${SRCPV}"
 
-SRCREV = "a96b345962622ea58490924130675df6db062d11"
+SRCREV = "f114c10ac532051badeca0132b144a2f1596f047"
 
-- 
2.13.3


