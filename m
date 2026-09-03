Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EA8DC624A4
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 09:50:45 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4060.1788429037895723363
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Sep 2026 02:50:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jSKC1JOB;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-853c07a76adso2545317b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 02:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788429037; x=1789033837; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1WrVKKfN5QIJiVct7dJpYjEv+abhijZq+Ytu/4uqyvI=;
        b=jSKC1JOB92Zhj5KOAvC7wUyT6UzYm9hvPaSXnXc7mNhbSxB2P7CIoDnQADsQBp5VfJ
         C7aHhmYxw54KELJkNF+6nqfCUPDbzrE3sZbRwqdx4xtBAkO/ZkzZ6/Ts8GdcXcLNNnj5
         0YSJQVP1CctJcd5iMYxH/MoXetO2fDtwDIgir9rDYHfYvrjAnf9Vr5tZ26MJAFHOYbEv
         Vx12oHVn+m/aKLPlqOtGCTRuPxO7NMSSUiEzK8ng33a2QX2hIYLM7qnMo3Nw0yZsN3LI
         Rrd+nATdrnjPI2IRE/VbbNbI+G8vMK92IWFLCB73tgyxjk0Ca/OtxMmncT7QMK+j6i7O
         v4uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788429037; x=1789033837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1WrVKKfN5QIJiVct7dJpYjEv+abhijZq+Ytu/4uqyvI=;
        b=inp16VWAaSXEfeKFbSlZBH+siLOf0u7rXpiOguE7gZLnySD3kuqmBWuvp0e0UwpKom
         B8MVkrHJ1xYKf+M3b3f22L8v9ZlDmWjARE2u1NqbP1RcEZaUW/Bz8+4reTX2yeFsO42P
         QscWdV+18UAP/fPBvPm3/nvK2r4MSaj2cYxwsOsxnwzEv59pmIBTGy8Gt9YNPI3yuysZ
         8ZEXk8ZhJGgpDj3PVJBDoxjD9m94fAW5iPvHQSqtGCs6ZBIuPA59AxsqaQa/dcFUv8Tz
         YsqhD+LpbkU5JUc3VYPPR55BEj9lXyL/XWXZSuZD4b18g4XLEqRcaVkw+F/liOMNJvyM
         frcw==
X-Gm-Message-State: AFuF++njNzRGaobPriPLEAPybXwDuGnVCy8BAW+HdHV92+CmZyRUnqex
	2Z8NjBTCTVZGToxQ0jUaWDTpXYVbVTCFvYDm0HNtZf9WZe9rILtdRA170h/bqG6n
X-Gm-Gg: AYBFou00POj60yRcyOCF1cbkGYYsS+ro6q3LBibF5G0HnynKEWbOoD50+ld5iUFDlQC
	aLaDiberwQQMui8r4q1hNpXBuLS2+6m6KOUNKJyhWSgeTZ280KaxoZ7SefR8D6/yO+Fkd1ERQOC
	2HFwIM25HoK1B1bSW8fVNn3WHtTNqRJkv4tYGybGcfuXf4rhCQVOMZWAClQWpEuz1S4dogb1Gj+
	/5sA4g79fd16BewT93JcDOTzPq25uOlxzLtGYMjxL8jjefxt0PPw8M2TsZL5gia66RSxgza2/sq
	bbkil7AYFzIgf9i+Utrs4uZHBpNj5mE1qRyiKOZpmKcTLhw/Bt4i3SaiJlMcmQI3YVNTv80lyev
	IJe1Szy2ce8dm29dxF59iTyLAkr5YQyDBmZ0a+sQq/qv5U4mkCC2V+Hs+EDrN8WJp6wXvzX9I4r
	IBSDSAU+FjLcMiE6N2mwOuekAvghOW00IY3nP4j9eTX6KlQwHpkLktmUMvm2C8NyycpF3hdeem
X-Received: by 2002:a05:6a00:3c8d:b0:857:72f8:dc98 with SMTP id d2e1a72fcca58-85ed8beb35bmr15107996b3a.25.1788429037213;
        Thu, 03 Sep 2026 02:50:37 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85dc003aebdsm2581265b3a.39.2026.09.03.02.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 02:50:36 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 17/22] libiec61850: patch CVE-2026-18583
Date: Thu,  3 Sep 2026 21:49:48 +1200
Message-ID: <20260903094954.3240723-17-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903094954.3240723-1-ankur.tyagi85@gmail.com>
References: <20260903094954.3240723-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 09:50:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129733

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-18583

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libiec61850/files/CVE-2026-18583.patch    | 35 +++++++++++++++++++
 .../libiec61850/libiec61850_1.6.1.bb          |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/libiec61850/files/CVE-2026-18583.patch

diff --git a/meta-networking/recipes-connectivity/libiec61850/files/CVE-2026-18583.patch b/meta-networking/recipes-connectivity/libiec61850/files/CVE-2026-18583.patch
new file mode 100644
index 0000000000..8acf7e1465
--- /dev/null
+++ b/meta-networking/recipes-connectivity/libiec61850/files/CVE-2026-18583.patch
@@ -0,0 +1,35 @@
+From c8baade187e1c31ac9e9ca71dced5a46765d97b2 Mon Sep 17 00:00:00 2001
+From: Michael Zillgith <michael.zillgith@mz-automation.de>
+Date: Tue, 16 Jun 2026 18:23:52 +0100
+Subject: [PATCH] - MMS server: fixed - potential crash in access control check
+ handler for association and vmd specific data sets
+ (LIB61850-560)(GHSA-7v2x-39mw-2979)
+
+(cherry picked from commit 062062daf4cb50c7aa76e01d6fb4d58fc9278a7d)
+
+CVE: CVE-2026-18583
+Upstream-Status: Backport [https://github.com/mz-automation/libiec61850/commit/062062daf4cb50c7aa76e01d6fb4d58fc9278a7d]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/iec61850/server/mms_mapping/mms_mapping.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/iec61850/server/mms_mapping/mms_mapping.c b/src/iec61850/server/mms_mapping/mms_mapping.c
+index e5e6b034..5620f63f 100644
+--- a/src/iec61850/server/mms_mapping/mms_mapping.c
++++ b/src/iec61850/server/mms_mapping/mms_mapping.c
+@@ -3807,11 +3807,11 @@ checkDataSetAccess(MmsMapping* self, MmsServerConnection connection, MmsVariable
+         if (listType == MMS_ASSOCIATION_SPECIFIC)
+         {
+             dataSetRef[0] = '@';
+-            StringUtils_copyStringToBuffer(dataSetRef + 1, listName);
++            StringUtils_copyStringMax(dataSetRef + 1, 129, listName);
+         }
+         else if (listType == MMS_VMD_SPECIFIC)
+         {
+-            StringUtils_copyStringToBuffer(dataSetRef, listName);
++            StringUtils_copyStringMax(dataSetRef, 129, listName);
+         }
+         else if (listType == MMS_DOMAIN_SPECIFIC)
+         {
diff --git a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.1.bb b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.1.bb
index b22d8a09c9..408b4d2d11 100644
--- a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.1.bb
+++ b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.1.bb
@@ -18,6 +18,7 @@ SRCREV = "a13961110b8238d2d8ea577c1fb7592ba3017ad8"
 SRC_URI = "git://github.com/mz-automation/${BPN}.git;branch=v1.6;protocol=https;tag=v${PV} \
            file://0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch \
            file://CVE-2026-18582.patch \
+           file://CVE-2026-18583.patch \
 "
 
 

