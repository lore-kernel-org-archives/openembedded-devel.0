Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48048.1795411882598859690
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:31:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=h7CITv7/;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-385d8a00598so3934729eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411882; x=1796016682; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9WRM2VGV19+G+tg/ZmXnZHsp85VzuO4bMidPCmMmv5w=;
        b=h7CITv7/qBKJw1ubfWy7JMO9U28Yj8SyWYbAJxN68UcrorMqGyjGtsRAPkNBR+MMLj
         RJSrMQgUEUlM4eMAeiz8M3XIu1RcD10hDHyN6k3DeG8xdP7gK40TaDtP9h3FzmQuKNJZ
         gdlL3LmxTdyxvri5cqYez6OPzRLJLzsilSTPHFo1WUu+ZutuyCBYgdhBE41taHNt50yK
         zU3QS2PxlhDEQdArcCQAe/S3OknM6/cUN6SwGSlcidERCQgbuiTud5RKHxemAg8gT3GF
         PnDUDGdGYvsUjffUFb7hN9xlypvC9Y/KWmDvN5T+y/Pr6CHj7uiGxQgxA7SI6L+17M6t
         t7ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411882; x=1796016682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9WRM2VGV19+G+tg/ZmXnZHsp85VzuO4bMidPCmMmv5w=;
        b=N2v2HZvQdM5NQlGVBouQ/QcBwwBbOwXg8x9iPOMT0pvI/nX6TiZKRNUKAHZZJPgDZB
         YCd5h+WW+KaN0EsJhc+nTofWPiVCnJMCK8tf9cyHrUy+sOMEArTAO856TxkBGgEPfWbz
         FhubKE4VT9zyA8/sFzPvxFvWwq91FE+Xk2+NjV8bknWzl0MzJhIlIPoQQMd7wn9QN9J6
         7v7VhYCBHNoYEeEfraaWah8PSu/BRGirspI+Yao6WqueY5B2RFDMi9S0LMc3nDuTcQUS
         qO1p4PcLUGAH6h7NGWpLYA9Ve5MolGzr9kSjCCqGR3uVyPLkDYDmk9cgwkG+D4R/LjnC
         ey9A==
X-Gm-Message-State: APuU4Z/QfxNdl5RYR/reGohoTrbsYSiQbB3WNNbEpsj7tq/AdCEgWEcb
	Md4uVj1e+3kUcoo0Pl5DBmFlMTcXRxebNesRZTpv2t73QmQK/FBjDvrw5lIw9BnlOxw=
X-Gm-Gg: AZFdTZcXtBrO4gkNUlph3cZ+PORhybYp2SeMBF20zNORXMo2AnuFaLO4OYUhaMo5heb
	YBq45xgZUvVfKdLxYGvFU9jqUOMAtmrKuBAjQPYZQDP58lyrSClRmkCyXIrfgXlumWMBktECIhw
	17W6flSdz14gKD1PXjzJxULC2rCspyAILStbIMkEWjuh3WMhMksttKoXniX0qjKudYNiKX+T15+
	TN59YJ6RHsCw6ith/sfL8bIf/oDqPgYxjI1Rc1J1Li6Gvlvk+SdN+XV0xWuvWoWq1UcnuTzVZkM
	5TtkJK8olrJ5UEp2ZNTyfT6+KnC3JVH/rxHmEzoJ4fDJ8CVZPJ+xb4Lf/7nLJGFIXkQv/Jsaq15
	ZxW5Bek7BQ3/bYE0jEWtnTVx/Dtia45/rQ+XIangTd/s0Z5T9u3YPizCxNJV8zgudU2PJb9Lh1b
	DamRYM+VJJiueUyoHChvYtXvKxymOPDzLOeJ0HidG5Msw4OjXTWSrc4pEvlHgCqdbMtlUf37bnW
	5K/UcY4he7w0rXp3y6OU+yiH9/qZ+ezO0APo6GUjypmjsKFw6+M9e2IeaDKdlK174NidF3t93TQ
	XUN3j4u/97gdUBftgde1FzFL+rS2cS+CZGNh5BfmMkd5ruF+yunFrtV4AjCSJeKXV0/kH7nNmRn
	8w2+jnPCnpObohoJQge742rTiJGrq7UiMBm00DQuF4ziYcBe3VJ2UXbfOlOTnnK+iz3G/pySXLS
	zs1gGb6XBaBjV7101XRVUHjT5lfZk9TSFJoxlXHX6KxSyeV5lD631XkD/Zgs9ZQntRpjD0KmBus
	VftP+Ekebtq+adR19s41XJQE+i7zPCU5CocGekKeNbFCAAZb1Yt9I9O5EY45AGh2DZCpBaAgfh3
	8Ka0
X-Received: by 2002:a05:7301:4704:b0:383:729:cabe with SMTP id 5a478bee46e88-3856f8519ecmr11645178eec.19.1795411881648;
        Sun, 22 Nov 2026 21:31:21 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:31:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 42/42] libsmi: upgrade 0.5.0 -> 0.6.0
Date: Sun, 22 Nov 2026 21:29:26 -0800
Message-ID: <20261123052953.3658549-70-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:31:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132857
Content-Type: text/plain; charset="utf-8"

First release since 2008, a one-time modernization:
- Modernized autotools (cross compilation works, --with-cc and
  --with-cflags removed); new alternative CMake build
- YANG 1.1 (RFC 7950) support and RFC 6020 conformance fixes
- All MIB/PIB/YANG modules refreshed from RFC Editor and IANA
- Dozens of crash and memory-safety fixes found by sanitizers and
  fuzzing; fix shell command injection via the cache directive
- ABI compatible with 0.5 (soname libsmi.so.2), new YangDecl values
- SMIng parser deprecated; ChangeLog file and old CGI script removed

libsmi is maintained again on gitlab.ibr.cs.tu-bs.de; fetch the v0.6.0
tag from git. All patches are fixed upstream: the yangparse and
createIdentifierRef prototypes, timegm via AC_USE_SYSTEM_EXTENSIONS, the
bison header ordering and the test dumps. The build supports out-of-tree
builds now, and the C23 configure workaround is no longer needed.

The license texts moved from COPYING to LICENSE and LICENSES/, with
per-file information in REUSE.toml. Besides the libsmi license (TCL)
and BSD-3-Clause, declare the shhopt notice of the tools and the
Simplified BSD terms of the IETF modules, which were already shipped.
The installed scripts now take their shell from SH, which defaults to
/bin/sh, and awk from AC_PROG_AWK.

The YANG modules are installed below yang/ietf and yang/iana now, so
they no longer clash with the copies frr installs directly in yang/;
drop the update-alternatives for them.

License-Update: license texts moved from COPYING to LICENSE and LICENSES/; shhopt and IETF module licenses declared
AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ntifierRef-prototype-in-yang-complex.patch |  53 ----
 .../0001-Fix-build-failure-with-gcc-15.patch  | 154 ----------
 ...the-scanners-after-the-bison-headers.patch |  41 ---
 ...1-parser-yang-Define-_DEFAULT_SOURCE.patch |  28 --
 .../libsmi-fix-the-test-dump-files.patch      | 277 ------------------
 .../recipes-support/libsmi/libsmi_0.5.0.bb    |  53 ----
 .../recipes-support/libsmi/libsmi_0.6.0.bb    |  42 +++
 7 files changed, 42 insertions(+), 606 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libsmi/libsmi/0001-Define-createIdentifierRef-prototype-in-yang-complex.patch
 delete mode 100644 meta-oe/recipes-support/libsmi/libsmi/0001-Fix-build-failure-with-gcc-15.patch
 delete mode 100644 meta-oe/recipes-support/libsmi/libsmi/0001-lib-Makefile.am-order-the-scanners-after-the-bison-headers.patch
 delete mode 100644 meta-oe/recipes-support/libsmi/libsmi/0001-parser-yang-Define-_DEFAULT_SOURCE.patch
 delete mode 100644 meta-oe/recipes-support/libsmi/libsmi/libsmi-fix-the-test-dump-files.patch
 delete mode 100644 meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
 create mode 100644 meta-oe/recipes-support/libsmi/libsmi_0.6.0.bb

diff --git a/meta-oe/recipes-support/libsmi/libsmi/0001-Define-createIdentifierRef-prototype-in-yang-complex.patch b/meta-oe/recipes-support/libsmi/libsmi/0001-Define-createIdentifierRef-prototype-in-yang-complex.patch
deleted file mode 100644
index 3374f8484e..0000000000
--- a/meta-oe/recipes-support/libsmi/libsmi/0001-Define-createIdentifierRef-prototype-in-yang-complex.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 77b520a8ee193b6d9f12e049f505d8d98204c11c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 31 Aug 2022 17:13:32 -0700
-Subject: [PATCH] Define createIdentifierRef prototype in yang-complex-types.c
-
-Provide needed prototype to make compiler happy
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/parser-yang.y        | 3 ++-
- lib/yang-complex-types.c | 3 ++-
- 2 files changed, 4 insertions(+), 2 deletions(-)
-
---- a/lib/parser-yang.y
-+++ b/lib/parser-yang.y
-@@ -41,7 +41,8 @@
- #include "yang-complex-types.h"
- #include "util.h"
- #include "error.h"
--    
-+#include "yang-check.h"
-+
- #ifdef HAVE_DMALLOC_H
- #include <dmalloc.h>
- #endif
-@@ -61,7 +62,8 @@
- #define debug
- #endif
- 
--    
-+extern void createIdentifierRef(struct _YangNode *node, char* prefix, char* ident);
-+extern void smiyyerror(char *msg, Parser *parserPtr);
- /*
-  * NOTE: The argument lvalp ist not really a void pointer. Unfortunately,
-  * we don't know it better at this point. bison generated C code declares
---- a/lib/yang-complex-types.c
-+++ b/lib/yang-complex-types.c
-@@ -35,12 +35,13 @@
- #include "yang-data.h"
- #include "yang-check.h"
- #include "yang-complex-types.h"
--
- /*
-  * Current parser defined in parser-yang. Workaround - can't include data.h
-  */
- extern Parser *currentParser;
- 
-+extern void createIdentifierRef(struct _YangNode *node, char* prefix, char* ident);
-+
- static const int parents_complex_type[] = {
-     YANG_DECL_MODULE, YANG_DECL_SUBMODULE, YANG_DECL_CONTAINER,
-     YANG_DECL_LIST, YANG_DECL_RPC, YANG_DECL_INPUT,
diff --git a/meta-oe/recipes-support/libsmi/libsmi/0001-Fix-build-failure-with-gcc-15.patch b/meta-oe/recipes-support/libsmi/libsmi/0001-Fix-build-failure-with-gcc-15.patch
deleted file mode 100644
index 69af5f5141..0000000000
--- a/meta-oe/recipes-support/libsmi/libsmi/0001-Fix-build-failure-with-gcc-15.patch
+++ /dev/null
@@ -1,154 +0,0 @@
-From ea4bc4aad22455f8f37030f5915c4a94d76fd5e7 Mon Sep 17 00:00:00 2001
-From: "mark.yang" <mark.yang@lge.com>
-Date: Mon, 7 Apr 2025 18:57:26 +0900
-Subject: [PATCH] Fix build failure with gcc-15
-
-* see more details: http://errors.yoctoproject.org/Errors/Details/851179/
-
-yang-data.c:594:9: error: too many arguments to function 'yangparse'; expected 0, have 1
-  594 |         yangparse(parser);
-      |         ^~~~~~~~~ ~~~~~~
-In file included from scanner-yang.h:19,
-                 from yang-data.c:47:
-parser-yang.h:16:12: note: declared here
-   16 | extern int yangparse();
-      |            ^~~~~~~~~
-In file included from parser-yang.c:346:
-parser-yang.tab.h:170:5: error: conflicting types for 'yangparse'; have 'int(struct Parser *)'
-  170 | int yangparse (struct Parser *parserPtr);
-      |     ^~~~~~~~~
-In file included from parser-yang.y:40:
-parser-yang.h:16:12: note: previous declaration of 'yangparse' with type 'int(void)'
-   16 | extern int yangparse();
-      |            ^~~~~~~~~
-make[2]: *** [Makefile:573: yang-data.lo] Error 1
-make[2]: *** Waiting for unfinished jobs....
-smi-data.c: In function 'loadModule':
-smi-data.c:4658:9: error: too many arguments to function 'smiparse'; expected 0, have 1
- 4658 |         smiparse((void *)&parser);
-      |         ^~~~~~~~ ~~~~~~~~~~~~~~~
-smi-data.c:42:12: note: declared here
-   42 | extern int smiparse();
-      |            ^~~~~~~~
-parser-smi.c:1515:5: error: conflicting types for 'smiparse'; have 'int(struct Parser *)'
- 1515 | int smiparse (struct Parser *parserPtr);
-      |     ^~~~~~~~
-In file included from parser-smi.y:37:
-parser-smi.h:27:12: note: previous declaration of 'smiparse' with type 'int(void)'
-   27 | extern int smiparse();
-      |            ^~~~~~~~
-parser-smi.c:63:25: error: conflicting types for 'smiparse'; have 'int(struct Parser *)'
-   63 | #define yyparse         smiparse
-      |                         ^~~~~~~~
-parser-smi.c:3207:1: note: in expansion of macro 'yyparse'
- 3207 | yyparse (struct Parser *parserPtr)
-      | ^~~~~~~
-parser-smi.h:27:12: note: previous declaration of 'smiparse' with type 'int(void)'
-   27 | extern int smiparse();
-      |            ^~~~~~~~
-parser-yang.c:68:25: error: conflicting types for 'yangparse'; have 'int(struct Parser *)'
-   68 | #define yyparse         yangparse
-      |                         ^~~~~~~~~
-parser-yang.c:2312:1: note: in expansion of macro 'yyparse'
- 2312 | yyparse (struct Parser *parserPtr)
-      | ^~~~~~~
-parser-yang.h:16:12: note: previous declaration of 'yangparse' with type 'int(void)'
-   16 | extern int yangparse();
-      |            ^~~~~~~~~
-In file included from scanner-yang.l:31:
-parser-yang.tab.h:170:5: error: conflicting types for 'yangparse'; have 'int(struct Parser *)'
-  170 | int yangparse (struct Parser *parserPtr);
-      |     ^~~~~~~~~
-In file included from scanner-yang.l:30:
-parser-yang.h:16:12: note: previous declaration of 'yangparse' with type 'int(void)'
-   16 | extern int yangparse();
-      |            ^~~~~~~~~
-scanner-yang.l: In function 'yangEnterLexRecursion':
-scanner-yang.l:79:1: warning: old-style function definition [-Wold-style-definition]
-   79 |
-      | ^
-make[2]: *** [Makefile:573: smi-data.lo] Error 1
-In file included from parser-smi.y:36:
-parser-smi.c: In function 'smiparse':
-parser-smi.c:10265:29: warning: passing argument 1 of 'smiyyerror' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
-10265 |         yyerror (parserPtr, yymsgp);
-      |                             ^~~~~~
-error.h:25:44: note: in definition of macro 'yyerror'
-   25 | #define yyerror(parserPtr, msg) smiyyerror(msg, parserPtr)
-      |                                            ^~~
-In file included from parser-smi.y:40:
-smi-check.h:71:30: note: expected 'char *' but argument is of type 'const char *'
-   71 | extern void smiyyerror(char *msg, Parser *parserPtr);
-      |                        ~~~~~~^~~
-make[2]: *** [Makefile:573: parser-yang.lo] Error 1
-make[2]: *** [Makefile:573: parser-smi.lo] Error 1
-make[2]: *** [Makefile:573: scanner-yang.lo] Error 1
-In file included from scanner-smi.l:34:
-parser-smi.tab.h:192:5: error: conflicting types for 'smiparse'; have 'int(struct Parser *)'
-  192 | int smiparse (struct Parser *parserPtr);
-      |     ^~~~~~~~
-In file included from util.h:22,
-                 from scanner-smi.l:32:
-parser-smi.h:27:12: note: previous declaration of 'smiparse' with type 'int(void)'
-   27 | extern int smiparse();
-      |            ^~~~~~~~
-scanner-smi.l: In function 'smiEnterLexRecursion':
-scanner-smi.l:76:1: warning: old-style function definition [-Wold-style-definition]
-   76 | smiEnterLexRecursion(file)
-      | ^~~~~~~~~~~~~~~~~~~~
-
-Upstream-Status: Submitted [https://lists.ibr.cs.tu-bs.de/hyperkitty/list/libsmi@ibr.cs.tu-bs.de/thread/XUW4E575ALYHCAM33OEMU5V2LKUOYAVA/]
-Signed-off-by: mark.yang <mark.yang@lge.com>
----
- lib/parser-smi.h  | 2 +-
- lib/parser-yang.h | 4 ++--
- lib/smi-data.c    | 2 +-
- 3 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/lib/parser-smi.h b/lib/parser-smi.h
-index 90d7ec2..c2a3d1f 100644
---- a/lib/parser-smi.h
-+++ b/lib/parser-smi.h
-@@ -24,7 +24,7 @@
- 
- 
- 
--extern int smiparse();
-+extern int smiparse(struct Parser *parserPtr);
- 
- 
- 
-diff --git a/lib/parser-yang.h b/lib/parser-yang.h
-index dbfec46..f008cd6 100644
---- a/lib/parser-yang.h
-+++ b/lib/parser-yang.h
-@@ -6,14 +6,14 @@
- #include <stdio.h>
- 
- #include "yang-data.h"
--
-+#include "smi-data.h"
- 
- 
- #define YYERROR_VERBOSE
- 
- 
- 
--extern int yangparse();
-+extern int yangparse(struct Parser *parserPtr);
- 
- 
- 
-diff --git a/lib/smi-data.c b/lib/smi-data.c
-index c9d95a4..773bc01 100644
---- a/lib/smi-data.c
-+++ b/lib/smi-data.c
-@@ -39,7 +39,7 @@
- 
- #ifdef BACKEND_SMI
- #include "scanner-smi.h"
--extern int smiparse();
-+extern int smiparse(struct Parser *parserPtr);
- #endif
- 
- #ifdef BACKEND_SMING
diff --git a/meta-oe/recipes-support/libsmi/libsmi/0001-lib-Makefile.am-order-the-scanners-after-the-bison-headers.patch b/meta-oe/recipes-support/libsmi/libsmi/0001-lib-Makefile.am-order-the-scanners-after-the-bison-headers.patch
deleted file mode 100644
index 2c86975617..0000000000
--- a/meta-oe/recipes-support/libsmi/libsmi/0001-lib-Makefile.am-order-the-scanners-after-the-bison-headers.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
-From: Khem Raj <khem.raj@oss.qualcomm.com>
-Date: Sun, 22 Nov 2026 00:00:00 -0800
-Subject: [PATCH] lib/Makefile.am: order the scanners after the bison headers
-
-bison writes parser-*.tab.h together with parser-*.c, but only the smi
-rule names the header as an output, and that one as a second independent
-target, which can run bison twice. For sming and yang make has no rule
-for the header at all, so a scanner that includes it can be generated and
-compiled while bison is still rewriting it. Under parallel make this
-fails with errors such as "unknown type name 'YYSTYPE'" in
-scanner-yang.c.
-
-Make each header depend on its parser with no recipe of its own, so
-everything that needs a header waits for bison to finish.
-
-Upstream-Status: Pending
-AI-Generated: Uses Claude Code
-Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
----
- lib/Makefile.am | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
---- a/lib/Makefile.am
-+++ b/lib/Makefile.am
-@@ -45,9 +45,14 @@
- 		  	  parser-yang.c scanner-yang.c
- libsmi_la_LDFLAGS	= -version-info @VERSION_LIBTOOL@
- 
--parser-smi.c parser-smi.tab.h: parser-smi.y scanner-smi.h parser-smi.h error.h
-+parser-smi.c: parser-smi.y scanner-smi.h parser-smi.h error.h
- 	$(BISON) --defines=parser-smi.tab.h -t -psmi -o parser-smi.c parser-smi.y
- 
-+# bison writes the .tab.h headers together with the parsers
-+parser-smi.tab.h: parser-smi.c
-+parser-sming.tab.h: parser-sming.c
-+parser-yang.tab.h: parser-yang.c
-+
- parser-sming.c: parser-sming.y scanner-sming.h parser-sming.h error.h
- 	$(BISON) --defines=parser-sming.tab.h -t -psming -o parser-sming.c parser-sming.y
- 
diff --git a/meta-oe/recipes-support/libsmi/libsmi/0001-parser-yang-Define-_DEFAULT_SOURCE.patch b/meta-oe/recipes-support/libsmi/libsmi/0001-parser-yang-Define-_DEFAULT_SOURCE.patch
deleted file mode 100644
index 9354a889a0..0000000000
--- a/meta-oe/recipes-support/libsmi/libsmi/0001-parser-yang-Define-_DEFAULT_SOURCE.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 86b706f694b822d8028fd36320147767056d2ffa Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 6 Sep 2022 12:09:00 -0700
-Subject: [PATCH] parser-yang: Define _DEFAULT_SOURCE
-
-This is needed for timegm API
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/parser-yang.y | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/lib/parser-yang.y b/lib/parser-yang.y
-index b111607..0ded9d2 100644
---- a/lib/parser-yang.y
-+++ b/lib/parser-yang.y
-@@ -21,6 +21,7 @@
- #ifdef BACKEND_YANG
- 
- #define _ISOC99_SOURCE
-+#define _DEFAULT_SOURCE
- #include <stdio.h>
- #include <errno.h>
- #include <stdlib.h>
--- 
-2.37.3
-
diff --git a/meta-oe/recipes-support/libsmi/libsmi/libsmi-fix-the-test-dump-files.patch b/meta-oe/recipes-support/libsmi/libsmi/libsmi-fix-the-test-dump-files.patch
deleted file mode 100644
index 134a8bb410..0000000000
--- a/meta-oe/recipes-support/libsmi/libsmi/libsmi-fix-the-test-dump-files.patch
+++ /dev/null
@@ -1,277 +0,0 @@
-From 460d3a5ef450c30b34a663a073ee53329441ef6e Mon Sep 17 00:00:00 2001
-From: Jackie Huang <jackie.huang@windriver.com>
-Date: Tue, 23 Feb 2016 16:34:38 +0800
-Subject: [PATCH] libsmi: fix the test dump files
-
-These test dump files were generated by smidump 0.4.5
-which would not match with the ones generated by 0.4.8,
-so update them with the ones for 0.4.8.
-
-Upstream-Status: Pending
-
-Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
----
- test/dumps/cm/MAU-MIB       |  8 ++++----
- test/dumps/cm/RMON2-MIB     |  6 +++---
- test/dumps/sming/IF-MIB     | 22 +++++++++++++---------
- test/dumps/sming/MAU-MIB    | 19 +++++++++++--------
- test/dumps/sming/RMON2-MIB  | 40 ++++++++++++++++++++++++----------------
- test/dumps/sming/SNMPv2-MIB | 11 +++++++----
- 6 files changed, 62 insertions(+), 44 deletions(-)
-
-diff --git a/test/dumps/cm/MAU-MIB b/test/dumps/cm/MAU-MIB
-index 0d97284..0cfd4e1 100644
---- a/test/dumps/cm/MAU-MIB
-+++ b/test/dumps/cm/MAU-MIB
-@@ -53,7 +53,7 @@
-   <attribute name="text">
-     <composite type="text">
-       <attribute name="string">
--        <string>#Conceptual model of MAU-MIB - generated by smidump 0.4.5#</string>
-+        <string>#Conceptual model of MAU-MIB - generated by smidump 0.4.8#</string>
-       </attribute>
-       <attribute name="font">
-         <font name="Courier"/>
-@@ -1294,7 +1294,7 @@
-         <point val="29.52,49.18"/>
-      </attribute>
-       <attribute name="obj_bb">
--       <rectangle val="28.67,32.93;30.37,34.63"/>
-+       <rectangle val="28.67,32.93;30.37,34.62"/>
-      </attribute>
-      <attribute name="orth_points">
-        <point val="29.52,49.18"/>
-@@ -1678,7 +1678,7 @@
-         <point val="37.68,49.18"/>
-      </attribute>
-       <attribute name="obj_bb">
--       <rectangle val="28.67,32.93;30.37,34.63"/>
-+       <rectangle val="28.67,32.93;30.37,34.62"/>
-      </attribute>
-      <attribute name="orth_points">
-        <point val="37.68,49.18"/>
-@@ -1737,7 +1737,7 @@
-         <point val="29.52,35.78"/>
-      </attribute>
-       <attribute name="obj_bb">
--       <rectangle val="28.67,32.93;30.37,34.63"/>
-+       <rectangle val="28.67,32.93;30.37,34.62"/>
-      </attribute>
-      <attribute name="orth_points">
-        <point val="29.52,35.78"/>
-diff --git a/test/dumps/cm/RMON2-MIB b/test/dumps/cm/RMON2-MIB
-index 30ae8dd..1b9d268 100644
---- a/test/dumps/cm/RMON2-MIB
-+++ b/test/dumps/cm/RMON2-MIB
-@@ -53,7 +53,7 @@
-   <attribute name="text">
-     <composite type="text">
-       <attribute name="string">
--        <string>#Conceptual model of RMON2-MIB - generated by smidump 0.4.5#</string>
-+        <string>#Conceptual model of RMON2-MIB - generated by smidump 0.4.8#</string>
-       </attribute>
-       <attribute name="font">
-         <font name="Courier"/>
-@@ -2841,8 +2841,8 @@
-      </attribute>
-      <attribute name="orth_points">
-        <point val="18.80,55.45"/>
--       <point val="18.80,68.63"/>
--       <point val="22.80,68.63"/>
-+       <point val="18.80,68.62"/>
-+       <point val="22.80,68.62"/>
-        <point val="22.80,81.80"/>
-      </attribute>
-       <attribute name="orth_orient">
-diff --git a/test/dumps/sming/IF-MIB b/test/dumps/sming/IF-MIB
-index 21432cb..c2ffc06 100644
---- a/test/dumps/sming/IF-MIB
-+++ b/test/dumps/sming/IF-MIB
-@@ -1,16 +1,18 @@
- //
--// This module has been generated by smidump 0.4.5. Do not edit.
-+// This module has been generated by smidump 0.4.8. Do not edit.
- //
- module IF-MIB {
- 
--  import IANAifType-MIB       (IANAifType);
--  import IRTF-NMRG-SMING      (Counter32, Counter64, 
--                               DisplayString255, Gauge32, 
--                               PhysAddress, TimeStamp, TimeTicks, 
--                               TruthValue);
--  import IRTF-NMRG-SMING-SNMP (AutonomousType, RowStatus, 
--                               TestAndIncr, mib-2);
--  import SNMPv2-MIB           (snmpTraps);
-+  import SNMPv2-SMI     (MODULE-IDENTITY, OBJECT-TYPE, Counter32, 
-+                         Gauge32, Counter64, Integer32, TimeTicks, 
-+                         mib-2, NOTIFICATION-TYPE);
-+  import SNMPv2-TC      (TEXTUAL-CONVENTION, DisplayString, 
-+                         PhysAddress, TruthValue, RowStatus, 
-+                         TimeStamp, AutonomousType, TestAndIncr);
-+  import SNMPv2-CONF    (MODULE-COMPLIANCE, OBJECT-GROUP, 
-+                         NOTIFICATION-GROUP);
-+  import SNMPv2-MIB     (snmpTraps);
-+  import IANAifType-MIB (IANAifType);
- 
- //
- // MODULE META INFORMATION
-@@ -79,6 +81,7 @@ module IF-MIB {
-   typedef InterfaceIndex {
-     type            Integer32 (1..2147483647);
-     format          "d";
-+    status          current;
-     description     
-        "A unique value, greater than zero, for each interface or
-         interface sub-layer in the managed system.  It is
-@@ -91,6 +94,7 @@ module IF-MIB {
-   typedef InterfaceIndexOrZero {
-     type            Integer32 (0..2147483647);
-     format          "d";
-+    status          current;
-     description     
-        "This textual convention is an extension of the
-         InterfaceIndex convention.  The latter defines a greater
-diff --git a/test/dumps/sming/MAU-MIB b/test/dumps/sming/MAU-MIB
-index 2cffd99..64cf714 100644
---- a/test/dumps/sming/MAU-MIB
-+++ b/test/dumps/sming/MAU-MIB
-@@ -1,15 +1,18 @@
- //
--// This module has been generated by smidump 0.4.5. Do not edit.
-+// This module has been generated by smidump 0.4.8. Do not edit.
- //
- module MAU-MIB {
- 
--  import IANA-MAU-MIB         (IANAifJackType, 
--                               IANAifMauAutoNegCapBits, 
--                               IANAifMauMediaAvailable, 
--                               IANAifMauTypeListBits);
--  import IF-MIB               (InterfaceIndex);
--  import IRTF-NMRG-SMING      (Counter32, Counter64, TruthValue);
--  import IRTF-NMRG-SMING-SNMP (AutonomousType, mib-2);
-+  import SNMPv2-SMI   (Counter32, Integer32, Counter64, OBJECT-TYPE, 
-+                       MODULE-IDENTITY, NOTIFICATION-TYPE, mib-2);
-+  import SNMPv2-TC    (TruthValue, AutonomousType, 
-+                       TEXTUAL-CONVENTION);
-+  import SNMPv2-CONF  (OBJECT-GROUP, MODULE-COMPLIANCE, 
-+                       NOTIFICATION-GROUP);
-+  import IF-MIB       (InterfaceIndex);
-+  import IANA-MAU-MIB (IANAifMauTypeListBits, 
-+                       IANAifMauMediaAvailable, 
-+                       IANAifMauAutoNegCapBits, IANAifJackType);
- 
- //
- // MODULE META INFORMATION
-diff --git a/test/dumps/sming/RMON2-MIB b/test/dumps/sming/RMON2-MIB
-index 423b9bc..04763e5 100644
---- a/test/dumps/sming/RMON2-MIB
-+++ b/test/dumps/sming/RMON2-MIB
-@@ -1,23 +1,26 @@
- //
--// This module has been generated by smidump 0.4.5. Do not edit.
-+// This module has been generated by smidump 0.4.8. Do not edit.
- //
- module RMON2-MIB {
- 
--  import IF-MIB               (ifIndex);
--  import IRTF-NMRG-SMING      (Counter32, DisplayString255, 
--                               Gauge32, IpAddress, TimeStamp, 
--                               TimeTicks);
--  import IRTF-NMRG-SMING-SNMP (RowStatus, mib-2);
--  import RMON-MIB             (OwnerString, channelEntry, 
--                               etherStatsEntry, filter, 
--                               filterEntry, history, 
--                               historyControlEntry, 
--                               hostControlEntry, hosts, matrix, 
--                               matrixControlEntry, statistics);
--  import TOKEN-RING-RMON-MIB  (ringStationControlEntry, 
--                               sourceRoutingStatsEntry, 
--                               tokenRing, tokenRingMLStatsEntry, 
--                               tokenRingPStatsEntry);
-+  import SNMPv2-SMI          (MODULE-IDENTITY, OBJECT-TYPE, 
-+                              Counter32, Integer32, Gauge32, 
-+                              IpAddress, TimeTicks, mib-2);
-+  import SNMPv2-TC           (TEXTUAL-CONVENTION, RowStatus, 
-+                              DisplayString, TimeStamp);
-+  import SNMPv2-CONF         (MODULE-COMPLIANCE, OBJECT-GROUP);
-+  import IF-MIB              (ifIndex);
-+  import RMON-MIB            (OwnerString, statistics, history, 
-+                              hosts, matrix, filter, 
-+                              etherStatsEntry, 
-+                              historyControlEntry, 
-+                              hostControlEntry, 
-+                              matrixControlEntry, filterEntry, 
-+                              channelEntry);
-+  import TOKEN-RING-RMON-MIB (tokenRing, tokenRingMLStatsEntry, 
-+                              tokenRingPStatsEntry, 
-+                              ringStationControlEntry, 
-+                              sourceRoutingStatsEntry);
- 
- //
- // MODULE META INFORMATION
-@@ -167,6 +170,7 @@ module RMON2-MIB {
- 
-   typedef ZeroBasedCounter32 {
-     type            Gauge32;
-+    status          current;
-     description     
-        "This TC describes an object that counts events with the
-         following semantics: objects of this type will be set to
-@@ -188,6 +192,7 @@ module RMON2-MIB {
- 
-   typedef LastCreateTime {
-     type            TimeTicks;
-+    status          current;
-     description     
-        "This TC describes an object that stores the value of the
-         sysUpTime object at the last time its entry was created.
-@@ -208,6 +213,7 @@ module RMON2-MIB {
- 
-   typedef TimeFilter {
-     type            TimeTicks;
-+    status          current;
-     description     
-        "To be used for the index to a table.  Allows an application
-         to download only those rows changed since a particular time.
-@@ -424,6 +430,7 @@ module RMON2-MIB {
- 
-   typedef DataSource {
-     type            ObjectIdentifier;
-+    status          current;
-     description     
-        "Identifies the source of the data that the associated
-         function is configured to analyze.  This source can be any
-@@ -439,6 +446,7 @@ module RMON2-MIB {
- 
-   typedef ControlString {
-     type            OctetString (0..255);
-+    status          current;
-     description     
-        "This data type is used to communicate with a modem or a
-         
-diff --git a/test/dumps/sming/SNMPv2-MIB b/test/dumps/sming/SNMPv2-MIB
-index ca355c8..0c88939 100644
---- a/test/dumps/sming/SNMPv2-MIB
-+++ b/test/dumps/sming/SNMPv2-MIB
-@@ -1,11 +1,14 @@
- //
--// This module has been generated by smidump 0.4.5. Do not edit.
-+// This module has been generated by smidump 0.4.8. Do not edit.
- //
- module SNMPv2-MIB {
- 
--  import IRTF-NMRG-SMING      (Counter32, DisplayString255, 
--                               TimeStamp, TimeTicks, snmpModules);
--  import IRTF-NMRG-SMING-SNMP (TestAndIncr, mib-2);
-+  import SNMPv2-SMI  (MODULE-IDENTITY, OBJECT-TYPE, 
-+                      NOTIFICATION-TYPE, TimeTicks, Counter32, 
-+                      snmpModules, mib-2);
-+  import SNMPv2-TC   (DisplayString, TestAndIncr, TimeStamp);
-+  import SNMPv2-CONF (MODULE-COMPLIANCE, OBJECT-GROUP, 
-+                      NOTIFICATION-GROUP);
- 
- //
- // MODULE META INFORMATION
--- 
-1.9.1
-
diff --git a/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb b/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
deleted file mode 100644
index d5b49aaf59..0000000000
--- a/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
+++ /dev/null
@@ -1,53 +0,0 @@
-SUMMARY = "A Library to Access SMI MIB Information"
-HOMEPAGE = "https://www.ibr.cs.tu-bs.de/projects/libsmi"
-
-LICENSE = "BSD-3-Clause AND TCL"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3ad3076f9332343a21636cfd351f05b7"
-
-SRC_URI = "https://www.ibr.cs.tu-bs.de/projects/${BPN}/download/${BP}.tar.gz \
-           file://smi.conf \
-           file://libsmi-fix-the-test-dump-files.patch \
-           file://0001-Define-createIdentifierRef-prototype-in-yang-complex.patch \
-           file://0001-parser-yang-Define-_DEFAULT_SOURCE.patch \
-           file://0001-Fix-build-failure-with-gcc-15.patch \
-           file://0001-lib-Makefile.am-order-the-scanners-after-the-bison-headers.patch \
-          "
-
-SRC_URI[sha256sum] = "f21accdadb1bb328ea3f8a13fc34d715baac6e2db66065898346322c725754d3"
-# Upstream download dir (ibr.cs.tu-bs.de) forbids scripted access and its newest
-# tarball is 0.4.8, below this recipe's 0.5.0 snapshot; no other release channel.
-UPSTREAM_VERSION_UNKNOWN = "1"
-
-UPSTREAM_CHECK_URI = "https://repology.org/project/libsmi/information"
-UPSTREAM_CHECK_REGEX = "${BPN}-(?P<pver>\d+(\.\d+)+)"
-
-DEPENDS += "bison-native flex-native wget-native gawk-native"
-
-inherit autotools-brokensep update-alternatives
-
-CACHED_CONFIGUREVARS += "ac_cv_prog_cc_c23=no"
-
-ALTERNATIVE_PRIORITY = "50"
-ALTERNATIVE:${PN}-yang = " ietf-interfaces ietf-netconf-acm ietf-netconf-with-defaults ietf-netconf"
-ALTERNATIVE_LINK_NAME[ietf-interfaces] = "${datadir}/yang/ietf-interfaces.yang"
-ALTERNATIVE_LINK_NAME[ietf-netconf-acm] = "${datadir}/yang/ietf-netconf-acm.yang"
-ALTERNATIVE_LINK_NAME[ietf-netconf-with-defaults] = "${datadir}/yang/ietf-netconf-with-defaults.yang"
-ALTERNATIVE_LINK_NAME[ietf-netconf] = "${datadir}/yang/ietf-netconf.yang"
-
-EXTRA_OECONF:class-native = "ac_cv_path_SH=/bin/sh"
-EXTRA_OECONF:class-target = "ac_cv_path_SH=/bin/sh ac_cv_path_WGET=${bindir}/wget ac_cv_path_AWK=${bindir}/awk"
-
-do_install:append () {
-    install -d ${D}${sysconfdir}
-    install -m 0644 ${UNPACKDIR}/smi.conf ${D}${sysconfdir}/smi.conf
-}
-
-PACKAGES += "${PN}-mibs ${PN}-pibs ${PN}-yang"
-
-FILES:${PN}-mibs += "${datadir}/mibs"
-FILES:${PN}-pibs += "${datadir}/pibs"
-FILES:${PN}-yang += "${datadir}/yang"
-
-RRECOMMENDS:${PN} = "${BPN}-mibs"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-support/libsmi/libsmi_0.6.0.bb b/meta-oe/recipes-support/libsmi/libsmi_0.6.0.bb
new file mode 100644
index 0000000000..cb17a64f42
--- /dev/null
+++ b/meta-oe/recipes-support/libsmi/libsmi_0.6.0.bb
@@ -0,0 +1,42 @@
+SUMMARY = "A Library to Access SMI MIB Information"
+HOMEPAGE = "https://www.ibr.cs.tu-bs.de/projects/libsmi"
+
+# Per REUSE.toml: libsmi license (TCL), snprintf BSD-3-Clause, shhopt notice, IETF modules BSD-2-Clause
+LICENSE = "TCL AND BSD-3-Clause AND BSD-2-Clause AND LicenseRef-shhopt"
+LICENSE:${PN}-mibs = "TCL AND BSD-2-Clause"
+LICENSE:${PN}-pibs = "TCL AND BSD-2-Clause"
+LICENSE:${PN}-yang = "TCL AND BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5c05af6b3935c81a2358608b0c5acf98 \
+                    file://LICENSES/BSD-3-Clause.txt;md5=2524f8052574e48a807f7d7dc43be505 \
+                    file://LICENSES/LicenseRef-IETF-Trust.txt;md5=6edd3f52ac05da3698b5b87d022e60c0 \
+                    file://LICENSES/LicenseRef-shhopt.txt;md5=c1d5556736f40d903ed610df3922545d \
+                    "
+NO_GENERIC_LICENSE[shhopt] = "LICENSES/LicenseRef-shhopt.txt"
+
+SRC_URI = "git://gitlab.ibr.cs.tu-bs.de/nm/libsmi.git;protocol=https;branch=main;tag=v${PV} \
+           file://smi.conf \
+          "
+SRCREV = "5e88c72eb68924263ccb180ba89e5ed66feb86a6"
+
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)$"
+
+DEPENDS += "bison-native flex-native wget-native gawk-native"
+
+inherit autotools
+
+EXTRA_OECONF:class-target = "ac_cv_path_WGET=${bindir}/wget ac_cv_prog_AWK=awk"
+
+do_install:append () {
+    install -d ${D}${sysconfdir}
+    install -m 0644 ${UNPACKDIR}/smi.conf ${D}${sysconfdir}/smi.conf
+}
+
+PACKAGES += "${PN}-mibs ${PN}-pibs ${PN}-yang"
+
+FILES:${PN}-mibs += "${datadir}/mibs"
+FILES:${PN}-pibs += "${datadir}/pibs"
+FILES:${PN}-yang += "${datadir}/yang"
+
+RRECOMMENDS:${PN} = "${BPN}-mibs"
+
+BBCLASSEXTEND = "native nativesdk"
