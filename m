Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id F3B09783FC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jul 2017 11:16:12 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id d18so4633101pfe.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jul 2017 04:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=S8lWL0GVMgAvw49Q5rIhjES267baGFG+M6ex3Soo5Gk=;
	b=CQM1ihcvLM6l7lYCSBqna+HE05dCnwIdE5/zvNCfU78Nb7Hcp1Cd3vxEl6BewOub0C
	JyIO8x5RrGUL/mHHO/QrxRjnGBE23my96hUOisvPdsaEjvWh/OLLNIhm+LdejEB7b9FT
	4leymiyMv8OMNDOY/riTWeRDN+CsSQUSPsd4RGSA7u+pixDyGbTyNv0ZLOF2dKak30J5
	Nm38B6FnIrzIhd8msKboI+cb7NLhrae9AS8xYK1FA3HR4I05LqVqfkSV2+p8IDRa0LHS
	IpDHyy72PS/zb/WWUF7OKfOkKK27cDxjubLphju2lpgFPWBGaXxeHsoG+30bYD9hv3Oj
	rksQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=S8lWL0GVMgAvw49Q5rIhjES267baGFG+M6ex3Soo5Gk=;
	b=CiswT0Rw/N8AVTjLCm1U7QJ7R6GnQymW7YJJt1WyI9DQNeHWMMthlJwA1HrtxCUzlT
	Fs/VjzGt59NTccYrUIdb7U2E22gTLNwANLMbuE4bUiwxhZ0LZNqz12qKtzYd/wP20xrt
	ZfQ4GomF6WJBdLTyv6Cvjt60N8sl0GwW8Ssr4gWl/ww8/AjbiX3wNKN+sGn1JbvXjw9b
	BPdXkkfF78A8EoNA5aq35rc1QZh8xpVTucNIZXYeDbHXTTyCsy/qW/whCB1qjmVKvcBZ
	ZuNBuEm7A5sxGGfCn4wE1sx4/xRTOVCpAYwuidKCcBFMCkXyt/x+ecH0o71ouZTKrI9S
	Bt9g==
X-Gm-Message-State: AIVw110KzAlmiJNEuF6CV/WdmM4E1jDrUkJdxqalXsnPE5eFbts0cEWA
	Tm0t13fMUJWVVECW
X-Received: by 10.99.36.5 with SMTP id k5mr7019819pgk.328.1500635773696;
	Fri, 21 Jul 2017 04:16:13 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	b16sm9129223pfm.84.2017.07.21.04.16.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Jul 2017 04:16:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Jul 2017 04:16:01 -0700
Message-Id: <20170721111602.2547-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170721111602.2547-1-raj.khem@gmail.com>
References: <20170721111602.2547-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/3] xl2tpd: Update to 1.3.9
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
X-List-Received-Date: Fri, 21 Jul 2017 11:16:13 -0000

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


