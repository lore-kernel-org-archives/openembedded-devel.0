Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EA42C6FA8B
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:34:34 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.11310.1662276865171884035
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hmy611ka;
 spf=pass (domain: gmail.com, ip: 209.85.215.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id bh13so5607930pgb.4
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=pB5yPC1XkFbcTTbSlpJe/hY95xGbECzPjb4p5iMkwBg=;
        b=hmy611kafnt9pUWUDT8CDOFVfBl+C8NG4Otr4nQhnnaHyPRTqWPX2AhfKTico0jIdK
         xrN32gkK620qKLa4HoNp3TeRAmSEuNBmaAvcbExPC1P3zsxEG2DeW8qWXBdjQn11gaW4
         OPmHiZRgrXbxGBLGp1FaeEosxLoDrelMqv1tMaL/Y5/O7K//lcQq9s/3pIFa0WQYOfZw
         v2n0YAY9NRUwt9CF0JyIXbnOO18ad0aPnxJWJKFOvl3/+c0UOVHl/lXJFLXdOpqsUK/O
         fBkUnbSs62ftzyn+BPwGEMpJjsnlTrhGmuS+kd/la2YekyOUApsyJsoQbQijdhYR9EZu
         OPwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=pB5yPC1XkFbcTTbSlpJe/hY95xGbECzPjb4p5iMkwBg=;
        b=0xL+Yz/PmJcVSOqXCml+RmFpAwnTHeWscMkTQ+C7GdKm93UjweD63BYlWDLuZx2rhg
         8DXRBkJfJ7IjKDZ8x+WRLp2IY761fIc6GVNbbRDq9bNY2NMeq+LuCXYZfFu5QkdX1D02
         qqDGiu1LoQaZbaNDoiRNVKFxojuV2sHAPp3yG8K3CvrzPdgrJff2Pj/ay/xQBoSVyHrN
         AZMDm6ZeH5J2tJHq1KlrW4QsP/UuYvEXG4WbTmYgCUrRLxRSsWgxgbruNrkwgIDoS1Nn
         1PhB5A1NZVf8Y+oZLEraSmvem9PqNNLL4uCrjttMihcps6zTIHeMevWvKDdhr01jV4Hq
         j43A==
X-Gm-Message-State: ACgBeo2qkBpJDRCxCqD0N+zbm1DYCTEtWY7U8q/AUox7WP/Uf/5s00IG
	9DLYif5q4ShIFhCp2dLFGx/BXswfIXfvrA==
X-Google-Smtp-Source: 
 AA6agR5jgDw2z3lQOoyGfTqWRyoFhl7mKo+PliXX8dUi66rqSQw2G+yhJaiNfGo8NctXlDvHQS9H3A==
X-Received: by 2002:aa7:8d08:0:b0:538:105a:eb6a with SMTP id
 j8-20020aa78d08000000b00538105aeb6amr36139524pfe.42.1662276869224;
        Sun, 04 Sep 2022 00:34:29 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::48c3])
        by smtp.gmail.com with ESMTPSA id
 w11-20020a62820b000000b00537a38ec2c6sm5089800pfd.164.2022.09.04.00.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:34:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 08/63] libsmi: Fix build with clang 15
Date: Sun,  4 Sep 2022 00:33:22 -0700
Message-Id: <20220904073417.3251865-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220904073417.3251865-1-raj.khem@gmail.com>
References: <20220904073417.3251865-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Sep 2022 07:34:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98602

Add flex and bison dependencies to make deterministic builds

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ntifierRef-prototype-in-yang-complex.patch | 53 +++++++++++++++++++
 .../recipes-support/libsmi/libsmi_0.5.0.bb    |  5 +-
 2 files changed, 57 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/libsmi/libsmi/0001-Define-createIdentifierRef-prototype-in-yang-complex.patch

diff --git a/meta-oe/recipes-support/libsmi/libsmi/0001-Define-createIdentifierRef-prototype-in-yang-complex.patch b/meta-oe/recipes-support/libsmi/libsmi/0001-Define-createIdentifierRef-prototype-in-yang-complex.patch
new file mode 100644
index 0000000000..3374f8484e
--- /dev/null
+++ b/meta-oe/recipes-support/libsmi/libsmi/0001-Define-createIdentifierRef-prototype-in-yang-complex.patch
@@ -0,0 +1,53 @@
+From 77b520a8ee193b6d9f12e049f505d8d98204c11c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 31 Aug 2022 17:13:32 -0700
+Subject: [PATCH] Define createIdentifierRef prototype in yang-complex-types.c
+
+Provide needed prototype to make compiler happy
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/parser-yang.y        | 3 ++-
+ lib/yang-complex-types.c | 3 ++-
+ 2 files changed, 4 insertions(+), 2 deletions(-)
+
+--- a/lib/parser-yang.y
++++ b/lib/parser-yang.y
+@@ -41,7 +41,8 @@
+ #include "yang-complex-types.h"
+ #include "util.h"
+ #include "error.h"
+-    
++#include "yang-check.h"
++
+ #ifdef HAVE_DMALLOC_H
+ #include <dmalloc.h>
+ #endif
+@@ -61,7 +62,8 @@
+ #define debug
+ #endif
+ 
+-    
++extern void createIdentifierRef(struct _YangNode *node, char* prefix, char* ident);
++extern void smiyyerror(char *msg, Parser *parserPtr);
+ /*
+  * NOTE: The argument lvalp ist not really a void pointer. Unfortunately,
+  * we don't know it better at this point. bison generated C code declares
+--- a/lib/yang-complex-types.c
++++ b/lib/yang-complex-types.c
+@@ -35,12 +35,13 @@
+ #include "yang-data.h"
+ #include "yang-check.h"
+ #include "yang-complex-types.h"
+-
+ /*
+  * Current parser defined in parser-yang. Workaround - can't include data.h
+  */
+ extern Parser *currentParser;
+ 
++extern void createIdentifierRef(struct _YangNode *node, char* prefix, char* ident);
++
+ static const int parents_complex_type[] = {
+     YANG_DECL_MODULE, YANG_DECL_SUBMODULE, YANG_DECL_CONTAINER,
+     YANG_DECL_LIST, YANG_DECL_RPC, YANG_DECL_INPUT,
diff --git a/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb b/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
index b238671893..53c59de78a 100644
--- a/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
+++ b/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
@@ -7,14 +7,17 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3ad3076f9332343a21636cfd351f05b7"
 SRC_URI = "https://www.ibr.cs.tu-bs.de/projects/${BPN}/download/${BP}.tar.gz \
            file://smi.conf \
            file://libsmi-fix-the-test-dump-files.patch \
+           file://0001-Define-createIdentifierRef-prototype-in-yang-complex.patch \
           "
 
 SRC_URI[md5sum] = "4bf47483c06c9f07d1b10fbc74eddf11"
 SRC_URI[sha256sum] = "f21accdadb1bb328ea3f8a13fc34d715baac6e2db66065898346322c725754d3"
 
+DEPENDS += "bison-native flex-native"
+
 RDEPENDS:${PN} += "wget"
 
-inherit autotools
+inherit autotools-brokensep
 
 EXTRA_OECONF = "ac_cv_path_SH=/bin/sh ac_cv_path_WGET=${bindir}/wget ac_cv_path_AWK=${bindir}/awk"
 
-- 
2.37.3


