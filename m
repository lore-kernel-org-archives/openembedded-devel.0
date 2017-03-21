Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1874972F3C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Mar 2017 06:32:42 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id g2so23643744pge.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Mar 2017 23:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Kar35ytUPAEcTxqWjxQBg/QR/z6Kja6F2qEVOv99I3E=;
	b=LBK9X+VgTreCJtEXnOuAG1kPhz0U5zKuKn0dR/cCDaSRhV1aDSrbcXtDYsA+aguUkw
	6Z6O4NGkAsy5lYLnTD6K7tfCBqogBIY6XhoW5OifpsJZasZ77nO0edxHhkkhTU57KpdW
	h4aqbCCawXnkD9iscWl8PcmE0JbRHKwhIvAS6ragqdI0PEq7bu+VfCu41Kb1VzhJC9Ru
	nmUg0p6XPAlM3+0BOl0vHcE1OW9CDOngz2qXceNSYJ2JqMjZMnVO/nsKHxGvWKWWRtfx
	jC8e+IUuL5tLbl/9uc6Rp9GyfVQT3bjkcC5/dJzlv5z3Pgd6b4CxDVAqfnDUGCKonShX
	8A0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Kar35ytUPAEcTxqWjxQBg/QR/z6Kja6F2qEVOv99I3E=;
	b=fYAiJAG9vYXGI5Os4tX1mTjFU7zYNNhX0zVfJi9VivOFVPWHOcO/xza3xerz4LcDX2
	/C0o5yD+6Gq8ka1Mr1+OoJqfRab4vErp5bbZCwYlgl2QJC1EnOxDXj06gwtiH2xss6xP
	8PM3g2kN7KTNGM1YcLf+arPpWn2DgIZx1kPsRpgWRGVv/Mq0s0o4cquxvBddwVZAeSMc
	vkae2XGGsQn4rvLglaQ596FptA7AJWenSsQ6lqUZfyZKIC55Ez9T6SrfablSCWeMxC9r
	iu3+fvh9EVuwnWh9T836Kc5OT9KbtMMHisMUt4/0Lwk8AaKrd1kBPR8efbs/jSQBRdQc
	/EpA==
X-Gm-Message-State: AFeK/H1hsJGe952ZOAL0AQUI5czE3CkZDVd8tapzJ15x/rh1LtrwjcUOntjqgq/musK9+A==
X-Received: by 10.99.45.2 with SMTP id t2mr35992189pgt.209.1490077963239;
	Mon, 20 Mar 2017 23:32:43 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	23sm36902528pfz.127.2017.03.20.23.32.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Mar 2017 23:32:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Mar 2017 23:32:24 -0700
Message-Id: <20170321063227.11565-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170321063227.11565-1-raj.khem@gmail.com>
References: <20170321063227.11565-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 5/8] ipsec-tools: Fix build with musl
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
X-List-Received-Date: Tue, 21 Mar 2017 06:32:42 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...01-Fix-header-issues-found-with-musl-libc.patch | 249 +++++++++++++++++++++
 .../ipsec-tools/ipsec-tools_0.8.2.bb               |   3 +-
 2 files changed, 251 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/ipsec-tools/ipsec-tools/0001-Fix-header-issues-found-with-musl-libc.patch

diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools/0001-Fix-header-issues-found-with-musl-libc.patch b/meta-networking/recipes-support/ipsec-tools/ipsec-tools/0001-Fix-header-issues-found-with-musl-libc.patch
new file mode 100644
index 000000000..630ecdb5f
--- /dev/null
+++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools/0001-Fix-header-issues-found-with-musl-libc.patch
@@ -0,0 +1,249 @@
+From 7d9585be093c9cb2428b373c0b0088bb778942d0 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 20 Mar 2017 21:37:47 -0700
+Subject: [PATCH] Fix header issues found with musl libc
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/libipsec/ipsec_strerror.h         | 3 +++
+ src/libipsec/libpfkey.h               | 4 +++-
+ src/racoon/admin.c                    | 2 +-
+ src/racoon/backupsa.c                 | 6 +++---
+ src/racoon/cftoken.l                  | 4 ++++
+ src/racoon/logger.h                   | 3 +++
+ src/racoon/misc.h                     | 3 +++
+ src/racoon/missing/crypto/sha2/sha2.h | 3 +++
+ src/racoon/netdb_dnssec.h             | 3 +++
+ src/racoon/pfkey.c                    | 1 -
+ src/racoon/plog.h                     | 2 ++
+ src/racoon/str2val.h                  | 3 +++
+ src/racoon/vmbuf.h                    | 3 +++
+ src/setkey/extern.h                   | 3 ++-
+ src/setkey/setkey.c                   | 1 -
+ 15 files changed, 36 insertions(+), 8 deletions(-)
+
+diff --git a/src/libipsec/ipsec_strerror.h b/src/libipsec/ipsec_strerror.h
+index 2b4264f..dac66a1 100644
+--- a/src/libipsec/ipsec_strerror.h
++++ b/src/libipsec/ipsec_strerror.h
+@@ -34,6 +34,9 @@
+ #ifndef _IPSEC_STRERROR_H
+ #define _IPSEC_STRERROR_H
+ 
++#undef __P
++#define __P(protos)     protos          /* ANSI C prototypes */
++
+ extern int __ipsec_errcode;
+ extern void __ipsec_set_strerror __P((const char *));
+ 
+diff --git a/src/libipsec/libpfkey.h b/src/libipsec/libpfkey.h
+index 61d2f2a..f7991b7 100644
+--- a/src/libipsec/libpfkey.h
++++ b/src/libipsec/libpfkey.h
+@@ -34,6 +34,9 @@
+ #ifndef _LIBPFKEY_H
+ #define _LIBPFKEY_H
+ 
++#undef __P
++#define __P(protos)     protos          /* ANSI C prototypes */
++
+ #ifndef KAME_LIBPFKEY_H
+ #define KAME_LIBPFKEY_H
+ 
+@@ -43,7 +46,6 @@
+ 
+ #define PRIORITY_OFFSET_POSITIVE_MAX	0x3fffffff
+ #define PRIORITY_OFFSET_NEGATIVE_MAX	0x40000000
+-
+ struct sadb_msg;
+ extern void pfkey_sadump __P((struct sadb_msg *));
+ extern void pfkey_sadump_withports __P((struct sadb_msg *));
+diff --git a/src/racoon/admin.c b/src/racoon/admin.c
+index 4b1875b..03ea3f8 100644
+--- a/src/racoon/admin.c
++++ b/src/racoon/admin.c
+@@ -36,7 +36,6 @@
+ #include <sys/types.h>
+ #include <sys/param.h>
+ #include <sys/socket.h>
+-#include <sys/signal.h>
+ #include <sys/stat.h>
+ #include <sys/un.h>
+ 
+@@ -46,6 +45,7 @@
+ #include PATH_IPSEC_H
+ 
+ 
++#include <signal.h>
+ #include <stdlib.h>
+ #include <stdio.h>
+ #include <string.h>
+diff --git a/src/racoon/backupsa.c b/src/racoon/backupsa.c
+index 82d74ca..95307ca 100644
+--- a/src/racoon/backupsa.c
++++ b/src/racoon/backupsa.c
+@@ -276,9 +276,9 @@ do { 								\
+ 		GETNEXTNUM(sa_args.a_keylen, strtoul);
+ 		GETNEXTNUM(sa_args.flags, strtoul);
+ 		GETNEXTNUM(sa_args.l_alloc, strtoul);
+-		GETNEXTNUM(sa_args.l_bytes, strtouq);
+-		GETNEXTNUM(sa_args.l_addtime, strtouq);
+-		GETNEXTNUM(sa_args.l_usetime, strtouq);
++		GETNEXTNUM(sa_args.l_bytes, strtoull);
++		GETNEXTNUM(sa_args.l_addtime, strtoull);
++		GETNEXTNUM(sa_args.l_usetime, strtoull);
+ 		GETNEXTNUM(sa_args.seq, strtoul);
+ 
+ #undef GETNEXTNUM
+diff --git a/src/racoon/cftoken.l b/src/racoon/cftoken.l
+index 1701922..787f4a9 100644
+--- a/src/racoon/cftoken.l
++++ b/src/racoon/cftoken.l
+@@ -77,6 +77,10 @@
+ 
+ #include "cfparse.h"
+ 
++#ifndef GLOB_TILDE
++#define GLOB_TILDE 0
++#endif
++
+ int yyerrorcount = 0;
+ 
+ #if defined(YIPS_DEBUG)
+diff --git a/src/racoon/logger.h b/src/racoon/logger.h
+index 3fd3e94..67af5f0 100644
+--- a/src/racoon/logger.h
++++ b/src/racoon/logger.h
+@@ -34,6 +34,9 @@
+ #ifndef _LOGGER_H
+ #define _LOGGER_H
+ 
++#undef __P
++#define __P(protos)     protos          /* ANSI C prototypes */
++
+ struct log {
+ 	int head;
+ 	int siz;
+diff --git a/src/racoon/misc.h b/src/racoon/misc.h
+index 3e758d9..30d9825 100644
+--- a/src/racoon/misc.h
++++ b/src/racoon/misc.h
+@@ -34,6 +34,9 @@
+ #ifndef _MISC_H
+ #define _MISC_H
+ 
++#undef __P
++#define __P(protos)     protos          /* ANSI C prototypes */
++
+ #define BIT2STR(b) bit2str(b, sizeof(b)<<3)
+ 
+ #ifdef HAVE_FUNC_MACRO
+diff --git a/src/racoon/missing/crypto/sha2/sha2.h b/src/racoon/missing/crypto/sha2/sha2.h
+index 42bcc2a..c043dfe 100644
+--- a/src/racoon/missing/crypto/sha2/sha2.h
++++ b/src/racoon/missing/crypto/sha2/sha2.h
+@@ -40,6 +40,9 @@
+ #ifndef __SHA2_H__
+ #define __SHA2_H__
+ 
++#undef __P
++#define __P(protos)     protos          /* ANSI C prototypes */
++
+ #ifdef __cplusplus
+ extern "C" {
+ #endif
+diff --git a/src/racoon/netdb_dnssec.h b/src/racoon/netdb_dnssec.h
+index a11209d..98fd813 100644
+--- a/src/racoon/netdb_dnssec.h
++++ b/src/racoon/netdb_dnssec.h
+@@ -34,6 +34,9 @@
+ #ifndef _NETDB_DNSSEC_H
+ #define _NETDB_DNSSEC_H
+ 
++#undef __P
++#define __P(protos)     protos          /* ANSI C prototypes */
++
+ #ifndef T_CERT
+ #define T_CERT	37		/* defined by RFC2538 section 2 */
+ #endif
+diff --git a/src/racoon/pfkey.c b/src/racoon/pfkey.c
+index 8f26c19..a06c30e 100644
+--- a/src/racoon/pfkey.c
++++ b/src/racoon/pfkey.c
+@@ -59,7 +59,6 @@
+ #include <sys/param.h>
+ #include <sys/socket.h>
+ #include <sys/queue.h>
+-#include <sys/sysctl.h>
+ 
+ #include <net/route.h>
+ #include <net/pfkeyv2.h>
+diff --git a/src/racoon/plog.h b/src/racoon/plog.h
+index ed43c8b..920c850 100644
+--- a/src/racoon/plog.h
++++ b/src/racoon/plog.h
+@@ -34,6 +34,8 @@
+ #ifndef _PLOG_H
+ #define _PLOG_H
+ 
++#undef __P
++#define __P(protos)     protos          /* ANSI C prototypes */
+ #ifdef HAVE_STDARG_H
+ #include <stdarg.h>
+ #else
+diff --git a/src/racoon/str2val.h b/src/racoon/str2val.h
+index 4a7cec1..d3d698e 100644
+--- a/src/racoon/str2val.h
++++ b/src/racoon/str2val.h
+@@ -34,6 +34,9 @@
+ #ifndef _STR2VAL_H
+ #define _STR2VAL_H
+ 
++#undef __P
++#define __P(protos)     protos          /* ANSI C prototypes */
++
+ extern caddr_t val2str __P((const char *, size_t));
+ extern char *str2val __P((const char *, int, size_t *));
+ 
+diff --git a/src/racoon/vmbuf.h b/src/racoon/vmbuf.h
+index 3f2f4ea..8287a00 100644
+--- a/src/racoon/vmbuf.h
++++ b/src/racoon/vmbuf.h
+@@ -34,6 +34,9 @@
+ #ifndef _VMBUF_H
+ #define _VMBUF_H
+ 
++#undef __P
++#define __P(protos)     protos          /* ANSI C prototypes */
++
+ /*
+  *	bp      v
+  *	v       v
+diff --git a/src/setkey/extern.h b/src/setkey/extern.h
+index 6f439fa..a1d9d14 100644
+--- a/src/setkey/extern.h
++++ b/src/setkey/extern.h
+@@ -1,6 +1,7 @@
+ /*	$NetBSD: extern.h,v 1.5 2009/03/06 11:45:03 tteras Exp $	*/
+ 
+-
++#undef __P
++#define __P(protos)     protos          /* ANSI C prototypes */
+ 
+ void parse_init __P((void));
+ int parse __P((FILE **));
+diff --git a/src/setkey/setkey.c b/src/setkey/setkey.c
+index c400faa..51f8b75 100644
+--- a/src/setkey/setkey.c
++++ b/src/setkey/setkey.c
+@@ -40,7 +40,6 @@
+ #include <sys/socket.h>
+ #include <sys/time.h>
+ #include <sys/stat.h>
+-#include <sys/sysctl.h>
+ #include <err.h>
+ #include <netinet/in.h>
+ #include <net/pfkeyv2.h>
+-- 
+2.12.0
+
diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
index bf8992752..8f98b6c5c 100644
--- a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
+++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
@@ -22,7 +22,8 @@ SRC_URI = "http://ftp.netbsd.org/pub/NetBSD/misc/ipsec-tools/0.8/ipsec-tools-${P
            file://racoon.service \
            file://fix-CVE-2015-4047.patch \
            file://0001-Fix-build-with-clang.patch \
-          "
+           file://0001-Fix-header-issues-found-with-musl-libc.patch \
+           "
 SRC_URI[md5sum] = "d53ec14a0a3ece64e09e5e34b3350b41"
 SRC_URI[sha256sum] = "8eb6b38716e2f3a8a72f1f549c9444c2bc28d52c9536792690564c74fe722f2d"
 
-- 
2.12.0


