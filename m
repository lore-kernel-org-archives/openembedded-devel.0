Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87940EB64DD
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 17:28:51 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web11.30836.1688664521302074783
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jul 2023 10:28:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Qq3kLa0s;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-39eab4bbe8aso862474b6e.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 06 Jul 2023 10:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688664520; x=1691256520;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AsQAztKrMkB8fvi/NQX8/rwAaL+gJ3h5lzhPOJy2H/k=;
        b=Qq3kLa0stOE5hV79OhNgdvIXiAemco/2S6i17KpRvkXbSGY+O1L3psFf4r8edpLlXd
         AMswPIRIHb+9Ahs2eS9U30AOhCiJBkLYHtSL02pwKxlwG224MHc7qHBAD0uumUU85BAe
         KCxokG5YB9PX6tfBUxoVOtzXpbXz0CI2iZlKjfoEQ/JnSExcKQQM0SK0oxZsXcZEfD7R
         qr+ot8bpM3FL7vRTDcIQmzu8OOF2eBjyB7jgXwPmhiku4eNv2PlRHiiLbMJ5OTPg++ps
         EWaqfABp379TzI2ZryJtEg2IgX+tl7k/m4YKBIPd3a6WuBxCXkBYEq+yuC21DsK9deiQ
         0vUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688664520; x=1691256520;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AsQAztKrMkB8fvi/NQX8/rwAaL+gJ3h5lzhPOJy2H/k=;
        b=UtNK1c3eGwxDkKU34QtdvGUXhlQi24Bv7vGHUjywX4gw5gXaknEn0jIbMpuO9CPW4m
         IdW77yObW0Z/0pryyW/vSz/kkadEGGSwVSaOdWTXgJNhKwfGvdlbjbhvQYwEHk244YZR
         L5bLZALgrI4GljjTUSDu2EVpCLipo+5LO1A8coEwcc4zDfwCpRdrqN+HWAjPRoGR8heH
         0PzOpF0JpdsOOsE9NoeVY4hCkVAC4NWKEBzic2hdSnvxh5DSp8BleuWbuDuuLOTwBqY/
         U98+N2leDZHdlSwxlkaLWz7m95N3tWipd9f3qUJZsTk8KVr5a4dp0DIjIRzcKtIeV7lt
         o91Q==
X-Gm-Message-State: ABy/qLb7wjeVjDSWLznfrGHW/PSois7a6yVUo10BpApTQ6p/948qOVXm
	o+3AOVY1XSHPKv5wigbVHJBTimKdZGY=
X-Google-Smtp-Source: APBJJlHXirZB5GEwLcK8CC1HnQ/eqB3/7kayE7rdZAV/w+l0PiFIcTYu3uGT7P+GnIS+3X0I6t+VwQ==
X-Received: by 2002:a05:6808:e8a:b0:3a1:f1b7:75b0 with SMTP id k10-20020a0568080e8a00b003a1f1b775b0mr2599793oil.19.1688664520267;
        Thu, 06 Jul 2023 10:28:40 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::81d4])
        by smtp.gmail.com with ESMTPSA id ff5-20020a056a002f4500b006815fbe3240sm1598700pfb.11.2023.07.06.10.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 10:28:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] sblim-sfcc: Fix build with clang17
Date: Thu,  6 Jul 2023 10:28:37 -0700
Message-ID: <20230706172837.750990-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Jul 2023 17:28:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103683

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Fix-function-declararions.patch      | 80 -------------------
 ...1-Fix-implicit-function-declarations.patch | 80 +++++++++++++++++++
 .../sblim-sfcc/sblim-sfcc_2.2.8.bb            |  2 +-
 3 files changed, 81 insertions(+), 81 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc/0001-Fix-function-declararions.patch
 create mode 100644 meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc/0001-Fix-implicit-function-declarations.patch

diff --git a/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc/0001-Fix-function-declararions.patch b/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc/0001-Fix-function-declararions.patch
deleted file mode 100644
index c498c55692..0000000000
--- a/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc/0001-Fix-function-declararions.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-From f97c26f5effd4372f7e03f9e4178d42a9ad8d4b3 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 2 Sep 2022 13:33:16 -0700
-Subject: [PATCH] Fix function declararions
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- TEST/v2test_ec.c              | 2 ++
- TEST/v2test_ein.c             | 1 +
- backend/cimxml/cimXmlParser.c | 6 +++++-
- backend/cimxml/grammar.c      | 2 ++
- 4 files changed, 10 insertions(+), 1 deletion(-)
-
-diff --git a/TEST/v2test_ec.c b/TEST/v2test_ec.c
-index ad34dcc..d3e566d 100644
---- a/TEST/v2test_ec.c
-+++ b/TEST/v2test_ec.c
-@@ -6,6 +6,8 @@
- #include "cmcimacs.h"
- 
- extern char *value2Chars(CMPIType type, CMPIValue * value);
-+extern void showClass( CMPIConstClass * in_class );
-+
- /*
-  * comment out this define to use v2 http XML interface
-  */
-diff --git a/TEST/v2test_ein.c b/TEST/v2test_ein.c
-index c1b4692..5d5ef5d 100644
---- a/TEST/v2test_ein.c
-+++ b/TEST/v2test_ein.c
-@@ -6,6 +6,7 @@
- #include "cmcimacs.h"
- 
- extern char *value2Chars(CMPIType type, CMPIValue * value);
-+extern void showObjectPath( CMPIObjectPath * objectpath );
- void showProperty( CMPIData , char * );
- void showInstance( CMPIInstance * );
- static char * CMPIState_str(CMPIValueState);
-diff --git a/backend/cimxml/cimXmlParser.c b/backend/cimxml/cimXmlParser.c
-index d1ab86e..9f5d1ca 100644
---- a/backend/cimxml/cimXmlParser.c
-+++ b/backend/cimxml/cimXmlParser.c
-@@ -34,6 +34,8 @@
- 
- #include <pthread.h>
- 
-+void startParsing(ParserControl *parm);
-+
- static int attrsOk(XmlBuffer * xb, const XmlElement * e, XmlAttr * r,
-                    const char *tag, int etag);
- static char *getValue(XmlBuffer * xb, const char *v);
-@@ -1350,7 +1352,9 @@ ResponseHdr scanCimXmlResponse(const char *xmlData, CMPIObjectPath *cop)
- 
-    control.heap = parser_heap_init();
- 
--   control.respHdr.rc = startParsing(&control);
-+   control.respHdr.rc = 0;
-+
-+   startParsing(&control);
- 
-    parser_heap_term(control.heap);
- 
-diff --git a/backend/cimxml/grammar.c b/backend/cimxml/grammar.c
-index 6a0a969..a3dcdea 100644
---- a/backend/cimxml/grammar.c
-+++ b/backend/cimxml/grammar.c
-@@ -23,6 +23,8 @@
- #include "sfcUtil/utilft.h"
- #include "parserUtil.h"
- 
-+CMPIType guessType(char *val);
-+void setClassMethods(CMPIConstClass *cls, XtokMethods *ms);
- 
- static int ct = 0;
- static int dontLex = 0;
--- 
-2.37.3
-
diff --git a/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc/0001-Fix-implicit-function-declarations.patch b/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc/0001-Fix-implicit-function-declarations.patch
new file mode 100644
index 0000000000..08cd15ab0c
--- /dev/null
+++ b/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc/0001-Fix-implicit-function-declarations.patch
@@ -0,0 +1,80 @@
+From 1e1ed4d58909360997648ca9524ab16441f5474b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 6 Jul 2023 10:15:41 -0700
+Subject: [PATCH] Fix implicit function declarations
+
+Clang 17+ has been finding these errors since its enforcing C99
+more than other compilers
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ TEST/v2test_ec.c              | 1 +
+ TEST/v2test_ein.c             | 1 +
+ backend/cimxml/cimXmlParser.c | 2 +-
+ backend/cimxml/grammar.c      | 2 ++
+ backend/cimxml/grammar.h      | 1 +
+ 5 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/TEST/v2test_ec.c b/TEST/v2test_ec.c
+index ad34dcc..940ca57 100644
+--- a/TEST/v2test_ec.c
++++ b/TEST/v2test_ec.c
+@@ -4,6 +4,7 @@
+ #include <unistd.h>
+ #include <stdlib.h>
+ #include "cmcimacs.h"
++#include "show.h"
+ 
+ extern char *value2Chars(CMPIType type, CMPIValue * value);
+ /*
+diff --git a/TEST/v2test_ein.c b/TEST/v2test_ein.c
+index c1b4692..ede95c1 100644
+--- a/TEST/v2test_ein.c
++++ b/TEST/v2test_ein.c
+@@ -4,6 +4,7 @@
+ #include <unistd.h>
+ #include <stdlib.h>
+ #include "cmcimacs.h"
++#include "show.h"
+ 
+ extern char *value2Chars(CMPIType type, CMPIValue * value);
+ void showProperty( CMPIData , char * );
+diff --git a/backend/cimxml/cimXmlParser.c b/backend/cimxml/cimXmlParser.c
+index d1ab86e..14f5f5c 100644
+--- a/backend/cimxml/cimXmlParser.c
++++ b/backend/cimxml/cimXmlParser.c
+@@ -1350,7 +1350,7 @@ ResponseHdr scanCimXmlResponse(const char *xmlData, CMPIObjectPath *cop)
+ 
+    control.heap = parser_heap_init();
+ 
+-   control.respHdr.rc = startParsing(&control);
++   startParsing(&control);
+ 
+    parser_heap_term(control.heap);
+ 
+diff --git a/backend/cimxml/grammar.c b/backend/cimxml/grammar.c
+index 6a0a969..522ca9e 100644
+--- a/backend/cimxml/grammar.c
++++ b/backend/cimxml/grammar.c
+@@ -23,6 +23,8 @@
+ #include "sfcUtil/utilft.h"
+ #include "parserUtil.h"
+ 
++extern CMPIType guessType(char *val);
++extern void setClassMethods(CMPIConstClass *cls, XtokMethods *ms);
+ 
+ static int ct = 0;
+ static int dontLex = 0;
+diff --git a/backend/cimxml/grammar.h b/backend/cimxml/grammar.h
+index 00d364f..bafdd42 100644
+--- a/backend/cimxml/grammar.h
++++ b/backend/cimxml/grammar.h
+@@ -79,3 +79,4 @@ static void valueRefArray(ParserControl *parm, parseUnion *stateUnion);
+ static void valueReference(ParserControl *parm, parseUnion *stateUnion);
+ static void valueReferenceData(ParserControl *parm, parseUnion *stateUnion);
+ 
++void startParsing(ParserControl *parm);
+-- 
+2.41.0
+
diff --git a/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc_2.2.8.bb b/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc_2.2.8.bb
index 20bd2b6fc1..c9d3ddd6b2 100644
--- a/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc_2.2.8.bb
+++ b/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc_2.2.8.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sblim.org"
 
 SRC_URI = "http://netcologne.dl.sourceforge.net/project/sblim/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0001-cimxml-Include-sys-select.h-for-fd_set.patch \
-           file://0001-Fix-function-declararions.patch \
+           file://0001-Fix-implicit-function-declarations.patch \
            "
 
 SRC_URI[md5sum] = "0bac0dec19f17ec065b6c332a56d7bae"
-- 
2.41.0


