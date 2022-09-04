Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98E56C6FA82
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:35:04 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web12.11495.1662276897659262362
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qEVjrEfb;
 spf=pass (domain: gmail.com, ip: 209.85.210.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id 199so5900792pfz.2
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=+1vskST9arACyAf9JpXF8lVwr+P/vpipTIgP+pCpDGI=;
        b=qEVjrEfbIKT7xI1HX+rg2iIG9KW3ynqaJk0GRDhrEqLkBVrD+vEEfs5PkdhH1gOCdz
         ALxyP7pU3VbHtYXkEuC66tWUadqtndF53MtE81YquA23qecX4JPEypsHNAUGJvtvsdwf
         41ANOavyFKyXBJ89uBXFiLRv70hKinYrT7l4QzPeMbfN4vM8wkOUH9lFRfzVQH1Fcj5W
         ce+32FjAyJLuDcipJpeZtRLYiiMUxHblwzNTiwXHmCi/8LIhkZzcbdN2yAlkQFvPlL2g
         h9fyvCYYgYlkkt75C+qqbctq/sGnsruiyHOKJWAT+0UmgbD8aguYZ/1bejGJ2sY10oUP
         TeGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=+1vskST9arACyAf9JpXF8lVwr+P/vpipTIgP+pCpDGI=;
        b=7CkLOyOo8iDBXTne5mB1xoqdNr1csbkqeqpoP7KmTNkMd0GK8BQipjyeEWT8fO5Gkx
         b29341a4L7nKUUVRLBZpZpcRDJhDTlC6sznGKQEh+FLFGyx6ezhdY4yplPjv0b9mwN2y
         ImIWZYtitfLj3rcAxFNdeaaTpUBPTwLIEC5U29y/ku8jaPiRXAwTyZV8j4GHaScg6SX7
         BBKh9YFp59OVzDV0Z+34vsjM7tJA+B04voE1mWG9yh+ucJ9qLkjmsEv5pbeItED1ipvS
         FrNtDJIu0NmFVyC0DDVT0VnzQLlElk+oHCTeBGCrnNlNldczvJouVBwKaAQ2jBMwfp4x
         ohIw==
X-Gm-Message-State: ACgBeo05cCFLGkFCB2V7j9xRFXSD3e5Rj999RIRt9lvynW1s8Cgig6LN
	1BDOvvdcxWwTKTAARWmkDywKNmfLBrx1Tw==
X-Google-Smtp-Source: 
 AA6agR4STCYVeIyh9Yc4p/yxhxGjV30efnZMlKtt+AbKmhiJjcVQ53GO/FSRFBWjcqbHWILqfJGCew==
X-Received: by 2002:a63:4d47:0:b0:42c:2def:6ffc with SMTP id
 n7-20020a634d47000000b0042c2def6ffcmr26167894pgl.142.1662276896585;
        Sun, 04 Sep 2022 00:34:56 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::48c3])
        by smtp.gmail.com with ESMTPSA id
 w11-20020a62820b000000b00537a38ec2c6sm5089800pfd.164.2022.09.04.00.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:34:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 35/63] sblim-sfcc: Fix build with clang
Date: Sun,  4 Sep 2022 00:33:49 -0700
Message-Id: <20220904073417.3251865-35-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220904073417.3251865-1-raj.khem@gmail.com>
References: <20220904073417.3251865-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Sep 2022 07:35:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98629

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Fix-function-declararions.patch      | 80 +++++++++++++++++++
 .../sblim-sfcc/sblim-sfcc_2.2.8.bb            |  1 +
 2 files changed, 81 insertions(+)
 create mode 100644 meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc/0001-Fix-function-declararions.patch

diff --git a/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc/0001-Fix-function-declararions.patch b/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc/0001-Fix-function-declararions.patch
new file mode 100644
index 0000000000..c498c55692
--- /dev/null
+++ b/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc/0001-Fix-function-declararions.patch
@@ -0,0 +1,80 @@
+From f97c26f5effd4372f7e03f9e4178d42a9ad8d4b3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 2 Sep 2022 13:33:16 -0700
+Subject: [PATCH] Fix function declararions
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ TEST/v2test_ec.c              | 2 ++
+ TEST/v2test_ein.c             | 1 +
+ backend/cimxml/cimXmlParser.c | 6 +++++-
+ backend/cimxml/grammar.c      | 2 ++
+ 4 files changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/TEST/v2test_ec.c b/TEST/v2test_ec.c
+index ad34dcc..d3e566d 100644
+--- a/TEST/v2test_ec.c
++++ b/TEST/v2test_ec.c
+@@ -6,6 +6,8 @@
+ #include "cmcimacs.h"
+ 
+ extern char *value2Chars(CMPIType type, CMPIValue * value);
++extern void showClass( CMPIConstClass * in_class );
++
+ /*
+  * comment out this define to use v2 http XML interface
+  */
+diff --git a/TEST/v2test_ein.c b/TEST/v2test_ein.c
+index c1b4692..5d5ef5d 100644
+--- a/TEST/v2test_ein.c
++++ b/TEST/v2test_ein.c
+@@ -6,6 +6,7 @@
+ #include "cmcimacs.h"
+ 
+ extern char *value2Chars(CMPIType type, CMPIValue * value);
++extern void showObjectPath( CMPIObjectPath * objectpath );
+ void showProperty( CMPIData , char * );
+ void showInstance( CMPIInstance * );
+ static char * CMPIState_str(CMPIValueState);
+diff --git a/backend/cimxml/cimXmlParser.c b/backend/cimxml/cimXmlParser.c
+index d1ab86e..9f5d1ca 100644
+--- a/backend/cimxml/cimXmlParser.c
++++ b/backend/cimxml/cimXmlParser.c
+@@ -34,6 +34,8 @@
+ 
+ #include <pthread.h>
+ 
++void startParsing(ParserControl *parm);
++
+ static int attrsOk(XmlBuffer * xb, const XmlElement * e, XmlAttr * r,
+                    const char *tag, int etag);
+ static char *getValue(XmlBuffer * xb, const char *v);
+@@ -1350,7 +1352,9 @@ ResponseHdr scanCimXmlResponse(const char *xmlData, CMPIObjectPath *cop)
+ 
+    control.heap = parser_heap_init();
+ 
+-   control.respHdr.rc = startParsing(&control);
++   control.respHdr.rc = 0;
++
++   startParsing(&control);
+ 
+    parser_heap_term(control.heap);
+ 
+diff --git a/backend/cimxml/grammar.c b/backend/cimxml/grammar.c
+index 6a0a969..a3dcdea 100644
+--- a/backend/cimxml/grammar.c
++++ b/backend/cimxml/grammar.c
+@@ -23,6 +23,8 @@
+ #include "sfcUtil/utilft.h"
+ #include "parserUtil.h"
+ 
++CMPIType guessType(char *val);
++void setClassMethods(CMPIConstClass *cls, XtokMethods *ms);
+ 
+ static int ct = 0;
+ static int dontLex = 0;
+-- 
+2.37.3
+
diff --git a/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc_2.2.8.bb b/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc_2.2.8.bb
index df55a67996..20bd2b6fc1 100644
--- a/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc_2.2.8.bb
+++ b/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc_2.2.8.bb
@@ -4,6 +4,7 @@ HOMEPAGE = "http://www.sblim.org"
 
 SRC_URI = "http://netcologne.dl.sourceforge.net/project/sblim/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0001-cimxml-Include-sys-select.h-for-fd_set.patch \
+           file://0001-Fix-function-declararions.patch \
            "
 
 SRC_URI[md5sum] = "0bac0dec19f17ec065b6c332a56d7bae"
-- 
2.37.3


