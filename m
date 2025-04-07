Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 897F3C36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 10:10:50 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.53])
 by mx.groups.io with SMTP id smtpd.web11.43120.1744020642875966769
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 03:10:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.53, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgeamrelo01.lge.com) (156.147.1.125)
	by 156.147.23.53 with ESMTP; 7 Apr 2025 19:10:40 +0900
X-Original-SENDERIP: 156.147.1.125
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.121.109)
	by 156.147.1.125 with ESMTP; 7 Apr 2025 19:10:40 +0900
X-Original-SENDERIP: 10.177.121.109
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-devel@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [meta-oe][PATCH] libsmi: fix build failure with gcc-15.0.1
Date: Mon,  7 Apr 2025 19:10:37 +0900
Message-Id: <20250407101037.1354725-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 10:10:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116662

From: "mark.yang" <mark.yang@lge.com>

* see more details: http://errors.yoctoproject.org/Errors/Details/851179/

yang-data.c:594:9: error: too many arguments to function 'yangparse'; expected 0, have 1
  594 |         yangparse(parser);
      |         ^~~~~~~~~ ~~~~~~
In file included from scanner-yang.h:19,
                 from yang-data.c:47:
parser-yang.h:16:12: note: declared here
   16 | extern int yangparse();
      |            ^~~~~~~~~
In file included from parser-yang.c:346:
parser-yang.tab.h:170:5: error: conflicting types for 'yangparse'; have 'int(struct Parser *)'
  170 | int yangparse (struct Parser *parserPtr);
      |     ^~~~~~~~~
In file included from parser-yang.y:40:
parser-yang.h:16:12: note: previous declaration of 'yangparse' with type 'int(void)'
   16 | extern int yangparse();
      |            ^~~~~~~~~
make[2]: *** [Makefile:573: yang-data.lo] Error 1
make[2]: *** Waiting for unfinished jobs....
smi-data.c: In function 'loadModule':
smi-data.c:4658:9: error: too many arguments to function 'smiparse'; expected 0, have 1
 4658 |         smiparse((void *)&parser);
      |         ^~~~~~~~ ~~~~~~~~~~~~~~~
smi-data.c:42:12: note: declared here
   42 | extern int smiparse();
      |            ^~~~~~~~
parser-smi.c:1515:5: error: conflicting types for 'smiparse'; have 'int(struct Parser *)'
 1515 | int smiparse (struct Parser *parserPtr);
      |     ^~~~~~~~
In file included from parser-smi.y:37:
parser-smi.h:27:12: note: previous declaration of 'smiparse' with type 'int(void)'
   27 | extern int smiparse();
      |            ^~~~~~~~
parser-smi.c:63:25: error: conflicting types for 'smiparse'; have 'int(struct Parser *)'
   63 | #define yyparse         smiparse
      |                         ^~~~~~~~
parser-smi.c:3207:1: note: in expansion of macro 'yyparse'
 3207 | yyparse (struct Parser *parserPtr)
      | ^~~~~~~
parser-smi.h:27:12: note: previous declaration of 'smiparse' with type 'int(void)'
   27 | extern int smiparse();
      |            ^~~~~~~~
parser-yang.c:68:25: error: conflicting types for 'yangparse'; have 'int(struct Parser *)'
   68 | #define yyparse         yangparse
      |                         ^~~~~~~~~
parser-yang.c:2312:1: note: in expansion of macro 'yyparse'
 2312 | yyparse (struct Parser *parserPtr)
      | ^~~~~~~
parser-yang.h:16:12: note: previous declaration of 'yangparse' with type 'int(void)'
   16 | extern int yangparse();
      |            ^~~~~~~~~
In file included from scanner-yang.l:31:
parser-yang.tab.h:170:5: error: conflicting types for 'yangparse'; have 'int(struct Parser *)'
  170 | int yangparse (struct Parser *parserPtr);
      |     ^~~~~~~~~
In file included from scanner-yang.l:30:
parser-yang.h:16:12: note: previous declaration of 'yangparse' with type 'int(void)'
   16 | extern int yangparse();
      |            ^~~~~~~~~
scanner-yang.l: In function 'yangEnterLexRecursion':
scanner-yang.l:79:1: warning: old-style function definition [-Wold-style-definition]
   79 |
      | ^
make[2]: *** [Makefile:573: smi-data.lo] Error 1
In file included from parser-smi.y:36:
parser-smi.c: In function 'smiparse':
parser-smi.c:10265:29: warning: passing argument 1 of 'smiyyerror' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
10265 |         yyerror (parserPtr, yymsgp);
      |                             ^~~~~~
error.h:25:44: note: in definition of macro 'yyerror'
   25 | #define yyerror(parserPtr, msg) smiyyerror(msg, parserPtr)
      |                                            ^~~
In file included from parser-smi.y:40:
smi-check.h:71:30: note: expected 'char *' but argument is of type 'const char *'
   71 | extern void smiyyerror(char *msg, Parser *parserPtr);
      |                        ~~~~~~^~~
make[2]: *** [Makefile:573: parser-yang.lo] Error 1
make[2]: *** [Makefile:573: parser-smi.lo] Error 1
make[2]: *** [Makefile:573: scanner-yang.lo] Error 1
In file included from scanner-smi.l:34:
parser-smi.tab.h:192:5: error: conflicting types for 'smiparse'; have 'int(struct Parser *)'
  192 | int smiparse (struct Parser *parserPtr);
      |     ^~~~~~~~
In file included from util.h:22,
                 from scanner-smi.l:32:
parser-smi.h:27:12: note: previous declaration of 'smiparse' with type 'int(void)'
   27 | extern int smiparse();
      |            ^~~~~~~~
scanner-smi.l: In function 'smiEnterLexRecursion':
scanner-smi.l:76:1: warning: old-style function definition [-Wold-style-definition]
   76 | smiEnterLexRecursion(file)
      | ^~~~~~~~~~~~~~~~~~~~

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 .../0001-Fix-build-failure-with-gcc-15.patch  | 154 ++++++++++++++++++
 .../recipes-support/libsmi/libsmi_0.5.0.bb    |   1 +
 2 files changed, 155 insertions(+)
 create mode 100644 meta-oe/recipes-support/libsmi/libsmi/0001-Fix-build-failure-with-gcc-15.patch

diff --git a/meta-oe/recipes-support/libsmi/libsmi/0001-Fix-build-failure-with-gcc-15.patch b/meta-oe/recipes-support/libsmi/libsmi/0001-Fix-build-failure-with-gcc-15.patch
new file mode 100644
index 0000000000..69af5f5141
--- /dev/null
+++ b/meta-oe/recipes-support/libsmi/libsmi/0001-Fix-build-failure-with-gcc-15.patch
@@ -0,0 +1,154 @@
+From ea4bc4aad22455f8f37030f5915c4a94d76fd5e7 Mon Sep 17 00:00:00 2001
+From: "mark.yang" <mark.yang@lge.com>
+Date: Mon, 7 Apr 2025 18:57:26 +0900
+Subject: [PATCH] Fix build failure with gcc-15
+
+* see more details: http://errors.yoctoproject.org/Errors/Details/851179/
+
+yang-data.c:594:9: error: too many arguments to function 'yangparse'; expected 0, have 1
+  594 |         yangparse(parser);
+      |         ^~~~~~~~~ ~~~~~~
+In file included from scanner-yang.h:19,
+                 from yang-data.c:47:
+parser-yang.h:16:12: note: declared here
+   16 | extern int yangparse();
+      |            ^~~~~~~~~
+In file included from parser-yang.c:346:
+parser-yang.tab.h:170:5: error: conflicting types for 'yangparse'; have 'int(struct Parser *)'
+  170 | int yangparse (struct Parser *parserPtr);
+      |     ^~~~~~~~~
+In file included from parser-yang.y:40:
+parser-yang.h:16:12: note: previous declaration of 'yangparse' with type 'int(void)'
+   16 | extern int yangparse();
+      |            ^~~~~~~~~
+make[2]: *** [Makefile:573: yang-data.lo] Error 1
+make[2]: *** Waiting for unfinished jobs....
+smi-data.c: In function 'loadModule':
+smi-data.c:4658:9: error: too many arguments to function 'smiparse'; expected 0, have 1
+ 4658 |         smiparse((void *)&parser);
+      |         ^~~~~~~~ ~~~~~~~~~~~~~~~
+smi-data.c:42:12: note: declared here
+   42 | extern int smiparse();
+      |            ^~~~~~~~
+parser-smi.c:1515:5: error: conflicting types for 'smiparse'; have 'int(struct Parser *)'
+ 1515 | int smiparse (struct Parser *parserPtr);
+      |     ^~~~~~~~
+In file included from parser-smi.y:37:
+parser-smi.h:27:12: note: previous declaration of 'smiparse' with type 'int(void)'
+   27 | extern int smiparse();
+      |            ^~~~~~~~
+parser-smi.c:63:25: error: conflicting types for 'smiparse'; have 'int(struct Parser *)'
+   63 | #define yyparse         smiparse
+      |                         ^~~~~~~~
+parser-smi.c:3207:1: note: in expansion of macro 'yyparse'
+ 3207 | yyparse (struct Parser *parserPtr)
+      | ^~~~~~~
+parser-smi.h:27:12: note: previous declaration of 'smiparse' with type 'int(void)'
+   27 | extern int smiparse();
+      |            ^~~~~~~~
+parser-yang.c:68:25: error: conflicting types for 'yangparse'; have 'int(struct Parser *)'
+   68 | #define yyparse         yangparse
+      |                         ^~~~~~~~~
+parser-yang.c:2312:1: note: in expansion of macro 'yyparse'
+ 2312 | yyparse (struct Parser *parserPtr)
+      | ^~~~~~~
+parser-yang.h:16:12: note: previous declaration of 'yangparse' with type 'int(void)'
+   16 | extern int yangparse();
+      |            ^~~~~~~~~
+In file included from scanner-yang.l:31:
+parser-yang.tab.h:170:5: error: conflicting types for 'yangparse'; have 'int(struct Parser *)'
+  170 | int yangparse (struct Parser *parserPtr);
+      |     ^~~~~~~~~
+In file included from scanner-yang.l:30:
+parser-yang.h:16:12: note: previous declaration of 'yangparse' with type 'int(void)'
+   16 | extern int yangparse();
+      |            ^~~~~~~~~
+scanner-yang.l: In function 'yangEnterLexRecursion':
+scanner-yang.l:79:1: warning: old-style function definition [-Wold-style-definition]
+   79 |
+      | ^
+make[2]: *** [Makefile:573: smi-data.lo] Error 1
+In file included from parser-smi.y:36:
+parser-smi.c: In function 'smiparse':
+parser-smi.c:10265:29: warning: passing argument 1 of 'smiyyerror' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
+10265 |         yyerror (parserPtr, yymsgp);
+      |                             ^~~~~~
+error.h:25:44: note: in definition of macro 'yyerror'
+   25 | #define yyerror(parserPtr, msg) smiyyerror(msg, parserPtr)
+      |                                            ^~~
+In file included from parser-smi.y:40:
+smi-check.h:71:30: note: expected 'char *' but argument is of type 'const char *'
+   71 | extern void smiyyerror(char *msg, Parser *parserPtr);
+      |                        ~~~~~~^~~
+make[2]: *** [Makefile:573: parser-yang.lo] Error 1
+make[2]: *** [Makefile:573: parser-smi.lo] Error 1
+make[2]: *** [Makefile:573: scanner-yang.lo] Error 1
+In file included from scanner-smi.l:34:
+parser-smi.tab.h:192:5: error: conflicting types for 'smiparse'; have 'int(struct Parser *)'
+  192 | int smiparse (struct Parser *parserPtr);
+      |     ^~~~~~~~
+In file included from util.h:22,
+                 from scanner-smi.l:32:
+parser-smi.h:27:12: note: previous declaration of 'smiparse' with type 'int(void)'
+   27 | extern int smiparse();
+      |            ^~~~~~~~
+scanner-smi.l: In function 'smiEnterLexRecursion':
+scanner-smi.l:76:1: warning: old-style function definition [-Wold-style-definition]
+   76 | smiEnterLexRecursion(file)
+      | ^~~~~~~~~~~~~~~~~~~~
+
+Upstream-Status: Submitted [https://lists.ibr.cs.tu-bs.de/hyperkitty/list/libsmi@ibr.cs.tu-bs.de/thread/XUW4E575ALYHCAM33OEMU5V2LKUOYAVA/]
+Signed-off-by: mark.yang <mark.yang@lge.com>
+---
+ lib/parser-smi.h  | 2 +-
+ lib/parser-yang.h | 4 ++--
+ lib/smi-data.c    | 2 +-
+ 3 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/lib/parser-smi.h b/lib/parser-smi.h
+index 90d7ec2..c2a3d1f 100644
+--- a/lib/parser-smi.h
++++ b/lib/parser-smi.h
+@@ -24,7 +24,7 @@
+ 
+ 
+ 
+-extern int smiparse();
++extern int smiparse(struct Parser *parserPtr);
+ 
+ 
+ 
+diff --git a/lib/parser-yang.h b/lib/parser-yang.h
+index dbfec46..f008cd6 100644
+--- a/lib/parser-yang.h
++++ b/lib/parser-yang.h
+@@ -6,14 +6,14 @@
+ #include <stdio.h>
+ 
+ #include "yang-data.h"
+-
++#include "smi-data.h"
+ 
+ 
+ #define YYERROR_VERBOSE
+ 
+ 
+ 
+-extern int yangparse();
++extern int yangparse(struct Parser *parserPtr);
+ 
+ 
+ 
+diff --git a/lib/smi-data.c b/lib/smi-data.c
+index c9d95a4..773bc01 100644
+--- a/lib/smi-data.c
++++ b/lib/smi-data.c
+@@ -39,7 +39,7 @@
+ 
+ #ifdef BACKEND_SMI
+ #include "scanner-smi.h"
+-extern int smiparse();
++extern int smiparse(struct Parser *parserPtr);
+ #endif
+ 
+ #ifdef BACKEND_SMING
diff --git a/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb b/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
index 4c397bdf9a..85eac33369 100644
--- a/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
+++ b/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
@@ -9,6 +9,7 @@ SRC_URI = "https://www.ibr.cs.tu-bs.de/projects/${BPN}/download/${BP}.tar.gz \
            file://libsmi-fix-the-test-dump-files.patch \
            file://0001-Define-createIdentifierRef-prototype-in-yang-complex.patch \
            file://0001-parser-yang-Define-_DEFAULT_SOURCE.patch \
+           file://0001-Fix-build-failure-with-gcc-15.patch \
           "
 
 SRC_URI[sha256sum] = "f21accdadb1bb328ea3f8a13fc34d715baac6e2db66065898346322c725754d3"

