Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D948C624DA
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 09:50:45 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4059.1788429035784033241
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Sep 2026 02:50:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rDLv4pOc;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8568e3ed034so1810256b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 02:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788429035; x=1789033835; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hw4M/Nd9JH/lA2s5Ub9G1Ehe6QW2hftbwiOq1xq7c6c=;
        b=rDLv4pOcRd38V74Thgac87veU4iN0clagwQHkqmAcbGrJjw5l0CsBa4ecTliUX1aE0
         RwSOlvC8xFga+jeTf4u/HGLKEEsMuQGbnyyba9j8ZDq62k/fcq172TqqcE8qyzB9UVJO
         1qTAouFlnRG5beFDtzt+1irs/WiYqkpfd41S3yKQIM+9RmDCFqeDI4gWBpxdOEmnzR4t
         Dl8J0sgSDNng1T5Vk2T3XLnT9cLupP1wc0B0QXokMncoy1jws1ikPGCioxU2uJ9OfuTY
         eMtS4qk8eRZYnd0zkhoQrc7ga23WhNzzLNY8LsDe1okHV0wozeYcXDW/23L80DddFEIU
         bGoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788429035; x=1789033835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hw4M/Nd9JH/lA2s5Ub9G1Ehe6QW2hftbwiOq1xq7c6c=;
        b=Ox80Xs4kAi3jt6ryNOtTEt5460xsvRd0rjeba0DYACdD4Sum4pmK9zkSLulQYr/AjR
         J3f67xngA1dn6BFdW+9Z5Gl8l51r3wzUgd690alYJnS2OU67+p+M1fgVy6ZX+mZSmHnJ
         tgaaigfLzfpWYAb7SIyKN4P85WwUFgXdJCuRZ7czK7NQkl0RSpHHBzV2Phv2aPHM49/w
         OG6rDy9+njLtF9Xd8FHsua8C27FpJec3/+SuWBMQeZA825aCdEnHz17Ny6WYQBF0M6XA
         9QENknDH2YyCbh3SLpJ817/sOiG1AZM8QGwtYSVORnvc+fnAwMkJlyF6YVccE1kOSGOt
         GDhg==
X-Gm-Message-State: AFuF++kwfSj0oB/+ZecxfUHCkiXoRDBaKnNR+82/bxNfotSScPI1E1ju
	GBcWL5wzu2gAvxI9edWYrnvpT9ZJ59N7acN/tvCm+QF44eFe9koKl0h+kGYoUBPR
X-Gm-Gg: AYBFou3H46ixGOLylvJYmFyzxGVxkZSUwzmJHwg7sEtjZd7CDk5C+Zdc9oMIeN/YyqP
	WSv11mVZRfwkdEbaWYKE8KI6Y0rYCsnC2PSsotChyK65Brd3G5ZluciZ0UHXjypGwuynyiF2IDV
	B411G/WQyGukcTgJDpvDMxppXeo8HB1K/pcQxuvI5aXsUOzxn54Kg/iUn9rushm9c8QyJZCp6NS
	cgOnDFPcXbTBwYb6LrGEYtB/t2eZdldMSAyKIbyWzrMPomIBNFS1tKBicNo54z3LkQOVqVpdCbw
	q+sDlNCm6pDNoNlWHy3HpNquYACfOITODbjzdN37DfJ3sYBfzVY+BXP8wyvhortET08U+6G/+zM
	OgKui4xW5yFf5c27JAH6cQxLQb9fVWjrMgVhL3INPxlkOQiaEcbT6BBFQZYLAnP7+ziZfRwQpe1
	FeE06qLyh7XndZMyOwQ5qWJsG484WC2d+9LW7MQ5ZwGnqavv6ADoItYePqtxi6TrpB+Yw7PySl
X-Received: by 2002:a05:6a00:4654:b0:85c:e16c:a1f6 with SMTP id d2e1a72fcca58-85ed4b20841mr14935802b3a.24.1788429035125;
        Thu, 03 Sep 2026 02:50:35 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85dc003aebdsm2581265b3a.39.2026.09.03.02.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 02:50:34 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 16/22] libiec61850: patch CVE-2026-18582
Date: Thu,  3 Sep 2026 21:49:47 +1200
Message-ID: <20260903094954.3240723-16-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903094954.3240723-1-ankur.tyagi85@gmail.com>
References: <20260903094954.3240723-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 09:50:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129732

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-18582

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libiec61850/files/CVE-2026-18582.patch    | 51 +++++++++++++++++++
 .../libiec61850/libiec61850_1.6.1.bb          |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/libiec61850/files/CVE-2026-18582.patch

diff --git a/meta-networking/recipes-connectivity/libiec61850/files/CVE-2026-18582.patch b/meta-networking/recipes-connectivity/libiec61850/files/CVE-2026-18582.patch
new file mode 100644
index 0000000000..6fcd1662b9
--- /dev/null
+++ b/meta-networking/recipes-connectivity/libiec61850/files/CVE-2026-18582.patch
@@ -0,0 +1,51 @@
+From 43aa106301639f2afddf11302d25e84c5482e26c Mon Sep 17 00:00:00 2001
+From: Michael Zillgith <michael.zillgith@mz-automation.de>
+Date: Tue, 16 Jun 2026 19:24:12 +0100
+Subject: [PATCH] - MMS server: fixed - oversized RptID written to RCB can
+ trigger invalid free when reports are sent later
+ (LIB61850-561)(GHSA-7qg8-hm25-rv5v)
+
+(cherry picked from commit 5b2a69f44256b8548927d8afdd7ac5f5381abe1e)
+
+CVE: CVE-2026-18582
+Upstream-Status: Backport [https://github.com/mz-automation/libiec61850/commit/5b2a69f44256b8548927d8afdd7ac5f5381abe1e]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/iec61850/server/mms_mapping/reporting.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/src/iec61850/server/mms_mapping/reporting.c b/src/iec61850/server/mms_mapping/reporting.c
+index 2a230c28..a44f0583 100644
+--- a/src/iec61850/server/mms_mapping/reporting.c
++++ b/src/iec61850/server/mms_mapping/reporting.c
+@@ -557,7 +557,6 @@ updateSingleTrackingValue(MmsMapping* self, ReportControl* rc, const char* name,
+                 attributeToUpdate = trkInst->resv;
+             else if (!strcmp(name, "DatSet"))
+             {
+-
+                 char datSet[130];
+                 const char* datSetStr = MmsValue_toString(newValue);
+ 
+@@ -2664,6 +2663,12 @@ Reporting_RCBWriteAccessHandler(MmsMapping* self, ReportControl* rc, const char*
+                 goto exit_function;
+             }
+ 
++            if (MmsValue_getStringSize(value) > 129)
++            {
++                retVal = DATA_ACCESS_ERROR_OBJECT_VALUE_INVALID;
++                goto exit_function;
++            }
++
+ #if (CONFIG_MMS_THREADLESS_STACK != 1)
+             Semaphore_wait(rc->rcbValuesLock);
+ #endif
+@@ -3677,7 +3682,7 @@ sendNextReportEntrySegment(ReportControl* self)
+ 
+     const char* rptIdStr = MmsValue_toString(rptIdFromRcb);
+ 
+-    if (rptIdStr[0] == 0)
++    if (rptIdStr[0] == 0 || MmsValue_getStringSize(rptIdFromRcb) > 129)
+     {
+         /* use default rptId when RptID is empty in RCB */
+         updateWithDefaultRptId(self, &rptId);
diff --git a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.1.bb b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.1.bb
index 5a76ba5330..b22d8a09c9 100644
--- a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.1.bb
+++ b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.1.bb
@@ -17,6 +17,7 @@ SRCREV = "a13961110b8238d2d8ea577c1fb7592ba3017ad8"
 
 SRC_URI = "git://github.com/mz-automation/${BPN}.git;branch=v1.6;protocol=https;tag=v${PV} \
            file://0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch \
+           file://CVE-2026-18582.patch \
 "
 
 

