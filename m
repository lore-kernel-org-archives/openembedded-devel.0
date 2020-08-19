Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web12.90114.1597851398791391809
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2020 08:36:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=R1ehNdhR;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: rehsack@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id d6so26824088ejr.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2020 08:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6q2+5tJNqCvqD2OAb0QXkeealaBHGYHBAiQ2QCD400Y=;
        b=R1ehNdhR8jFmvHGpjqRg2VmuBROKt11TNHB5VrU8nuaktFAEx2iEN4EWkbH+e+mQCL
         TnGdf+3CJ5/8YNSG62bKgGZ1wZ3Eog1+TOWV1ljvWe5r7rbUDy+iVTm8lXeeeZUhTgxE
         32Nfur5NEoT0CvgKCj5MrW9zcH3jcuuVTX59ZwCw5HJtnexIx9UtxULB4ks+WzY34l8j
         9ww3vSVC2ke9iFR3HwhPmU08Y3G9wnXdY1r85uVgOrZhuKPGpILUcZzOO/8PR5n16CIH
         wryfmbCvwhLtKUrecw2FcvoMz77RW/y2ID8R+/0RKjpdUKErL7mx6A7IE+zgpf0Lbhsi
         GSEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=6q2+5tJNqCvqD2OAb0QXkeealaBHGYHBAiQ2QCD400Y=;
        b=DAUEv2cyO/U8QI+471RgwYrojKGVWHAr7n+EEYy556z602l5uJTB1+Lt4YbUBCMl3J
         c0ymfcT6uPdzs9u2MRiLCdxLb1PmaFImcPQlT4rwJQGXRoMj/h0uiN0EH8G8UwgCquoJ
         sV4PG+u6/dWaaOwyVd2gNvLVAz6EGThqzkziaKNojPnauhkik1SFrHGYVEiHMqiv68Q/
         pYK/S++qDS38fdDdLxVJNucLmnEhRxYqTJrAY1MYXFuBmvEM7suwhdGoqnFEh36sndrl
         8RnwPyd/ASdvGadePVPELDHYw3TAHyS0v72TtUHeZ1qb9PAwt3x0H4sY8YrhSTCvT/CE
         wiqw==
X-Gm-Message-State: AOAM532/uNl9E82KPxi2W3/B8AGJ619WYKdaSEaO89JUyBw+bz3nBRPc
	7vU+JM7Rov0+lfKhxPl0EZJXCA5Fzw4=
X-Google-Smtp-Source: ABdhPJyvEvQJVhAi+MfkXn1kV/5tPl+Q+/4RizA1qB4NoTk27tODjnWSdEkuR/+9034Ewmsry5vzxg==
X-Received: by 2002:a17:906:36d7:: with SMTP id b23mr25379239ejc.149.1597851396754;
        Wed, 19 Aug 2020 08:36:36 -0700 (PDT)
Return-Path: <rehsack@gmail.com>
Received: from beaker.muppets.liwing.de (p5b25b03a.dip0.t-ipconnect.de. [91.37.176.58])
        by smtp.gmail.com with ESMTPSA id d25sm18096978edr.78.2020.08.19.08.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2020 08:36:35 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: "Jens Rehsack" <rehsack@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Jens Rehsack <sno@netbsd.org>
Subject: [meta-networking][PATCH v2] bearssl: add new recipe
Date: Wed, 19 Aug 2020 17:36:27 +0200
Message-Id: <20200819153627.22166-1-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add recipe for BearSSL - an an implementation of the SSL/TLS protocol with
the approach of:
* Be correct and secure.
* Be small
* Be highly portable
* Be feature-rich and extensible

See https://bearssl.org for more details.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 ....mk-remove-fixed-command-definitions.patch | 57 +++++++++++++++++++
 ..._x509.c-fix-potential-overflow-issue.patch | 41 +++++++++++++
 .../bearssl/bearssl_0.6.bb                    | 35 ++++++++++++
 3 files changed, 133 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/bearssl/bearssl/0001-conf-Unix.mk-remove-fixed-command-definitions.patch
 create mode 100644 meta-networking/recipes-connectivity/bearssl/bearssl/0002-test-test_x509.c-fix-potential-overflow-issue.patch
 create mode 100644 meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb

diff --git a/meta-networking/recipes-connectivity/bearssl/bearssl/0001-conf-Unix.mk-remove-fixed-command-definitions.patch b/meta-networking/recipes-connectivity/bearssl/bearssl/0001-conf-Unix.mk-remove-fixed-command-definitions.patch
new file mode 100644
index 000000000..00be22499
--- /dev/null
+++ b/meta-networking/recipes-connectivity/bearssl/bearssl/0001-conf-Unix.mk-remove-fixed-command-definitions.patch
@@ -0,0 +1,57 @@
+From 4ba61c59d3488c263d106d486b656854a57ad79f Mon Sep 17 00:00:00 2001
+From: Jens Rehsack <sno@netbsd.org>
+Date: Thu, 13 Aug 2020 15:26:30 +0200
+Subject: [PATCH 1/2] conf/Unix.mk: remove fixed command definitions
+
+For cross compiling in Yocto or with appropriate SDKs, commands like
+`$CC` are reasonably predefined.
+
+Upstream-Status: Inappropriate
+
+Signed-off-by: Jens Rehsack <sno@netbsd.org>
+---
+ conf/Unix.mk | 10 +++-------
+ 1 file changed, 3 insertions(+), 7 deletions(-)
+
+diff --git a/conf/Unix.mk b/conf/Unix.mk
+index 02f2b2b..05979fc 100644
+--- a/conf/Unix.mk
++++ b/conf/Unix.mk
+@@ -37,23 +37,19 @@ RM = rm -f
+ MKDIR = mkdir -p
+ 
+ # C compiler and flags.
+-CC = cc
+-CFLAGS = -W -Wall -Os -fPIC
+ CCOUT = -c -o 
+ 
+ # Static library building tool.
+-AR = ar
+ ARFLAGS = -rcs
+ AROUT =
+ 
+ # DLL building tool.
+-LDDLL = cc
++LDDLL = $(CCLD)
+ LDDLLFLAGS = -shared
+ LDDLLOUT = -o 
+ 
+ # Static linker.
+-LD = cc
+-LDFLAGS = 
++LD = $(CCLD)
+ LDOUT = -o 
+ 
+ # C# compiler; we assume usage of Mono.
+@@ -63,7 +59,7 @@ RUNT0COMP = mono T0Comp.exe
+ # Set the values to 'no' to disable building of the corresponding element
+ # by default. Building can still be invoked with an explicit target call
+ # (e.g. 'make dll' to force build the DLL).
+-#STATICLIB = no
++STATICLIB = no
+ #DLL = no
+ #TOOLS = no
+ #TESTS = no
+-- 
+2.17.1
+
diff --git a/meta-networking/recipes-connectivity/bearssl/bearssl/0002-test-test_x509.c-fix-potential-overflow-issue.patch b/meta-networking/recipes-connectivity/bearssl/bearssl/0002-test-test_x509.c-fix-potential-overflow-issue.patch
new file mode 100644
index 000000000..94abd27fa
--- /dev/null
+++ b/meta-networking/recipes-connectivity/bearssl/bearssl/0002-test-test_x509.c-fix-potential-overflow-issue.patch
@@ -0,0 +1,41 @@
+From 542380a13f178d97851751b57054a6b5be555d1c Mon Sep 17 00:00:00 2001
+From: Jens Rehsack <sno@netbsd.org>
+Date: Thu, 13 Aug 2020 16:16:44 +0200
+Subject: [PATCH 2/2] test/test_x509.c: fix potential overflow issue
+
+Instead of doing a memcpy() which does static overflow checking, use
+snprintf() for string copying which does the check dynamically.
+
+Fixes:
+| In file included from .../recipe-sysroot/usr/include/string.h:519,
+|                  from test/test_x509.c:27:
+| In function 'memcpy',
+|     inlined from 'parse_keyvalue' at test/test_x509.c:845:2,
+|     inlined from 'process_conf_file' at test/test_x509.c:1360:7,
+|     inlined from 'main' at test/test_x509.c:2038:2:
+| .../recipe-sysroot/usr/include/bits/string_fortified.h:34:10: warning: '__builtin_memcpy' specified bound 4294967295 exceeds maximum object size 2147483647 [-Wstringop-overflow=]
+|    34 |   return __builtin___memcpy_chk (__dest, __src, __len, __bos0 (__dest));
+|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Signed-off-by: Jens Rehsack <sno@netbsd.org>
+---
+ test/test_x509.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/test/test_x509.c b/test/test_x509.c
+index 2c61cf5..76f6ab9 100644
+--- a/test/test_x509.c
++++ b/test/test_x509.c
+@@ -842,8 +842,7 @@ parse_keyvalue(HT *d)
+ 		return -1;
+ 	}
+ 	name = xmalloc(u + 1);
+-	memcpy(name, buf, u);
+-	name[u] = 0;
++	snprintf(name, u, "%s", buf);
+ 	if (HT_get(d, name) != NULL) {
+ 		xfree(name);
+ 		return -1;
+-- 
+2.17.1
+
diff --git a/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb b/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb
new file mode 100644
index 000000000..a0f64e933
--- /dev/null
+++ b/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb
@@ -0,0 +1,35 @@
+SUMMARY = "BearSSL is an implementation of the SSL/TLS protocol (RFC 5246) written in C"
+DESCRIPTION = "BearSSL is an implementation of the SSL/TLS protocol (RFC \
+5246) written in C. It aims at offering the following features: \
+  * Be correct and secure. In particular, insecure protocol versions and \
+    choices of algorithms are not supported, by design; cryptographic \
+    algorithm implementations are constant-time by default. \
+  * Be small, both in RAM and code footprint. For instance, a minimal \
+    server implementation may fit in about 20 kilobytes of compiled code \
+    and 25 kilobytes of RAM. \
+  * Be highly portable. BearSSL targets not only “big” operating systems \
+    like Linux and Windows, but also small embedded systems and even special \
+    contexts like bootstrap code. \
+  * Be feature-rich and extensible. SSL/TLS has many defined cipher suites \
+    and extensions; BearSSL should implement most of them, and allow extra \
+    algorithm implementations to be added afterwards, possibly from third \
+    parties."
+HOMEPAGE = "https://bearssl.org"
+
+SECTION = "libs"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1fc37e1037ae673975fbcb96a98f7191"
+
+SRCREV = "8ef7680081c61b486622f2d983c0d3d21e83caad"
+SRC_URI = "git://www.bearssl.org/git/BearSSL;protocol=https;nobranch=1 \
+	   file://0001-conf-Unix.mk-remove-fixed-command-definitions.patch \
+	   file://0002-test-test_x509.c-fix-potential-overflow-issue.patch \
+	   "
+
+# without compile errors like 
+# <..>/ld: build/obj/ghash_pclmul.o: warning: relocation against `br_ghash_pclmul' in read-only section `.text'
+CFLAGS += "-fPIC"
+
+S = "${WORKDIR}/git"
+B = "${S}"
-- 
2.17.1

