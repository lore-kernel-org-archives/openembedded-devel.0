Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B605C61DA4
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 02:36:28 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.74332.1675737384255873021
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Feb 2023 18:36:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=o2WizpZH;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id e19so6317305plc.9
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Feb 2023 18:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/0XNhKtZbP75qZUV8rgsCy9ZSKNRD7kdPg6YIIn8je8=;
        b=o2WizpZHAK0cChaOXPQ5NJJ/hB0U9aB1XFIrYRKsVriVp6YWzhtfwizXQxtUWElcmj
         V9rBTBzXDqoD+tkPQGsZxnil1wYAmB9414Qz7RUDWfK/6ub5kT/eWhZ7xW3c+2gYTWXA
         CMev6OBnwqvelAekaZvnWfhFQOyUPtbD15mWHpwrvHlHGx+C77g1UxRnE2I+/atTnGxu
         vNij63dMhbrv3pCndv2Qoy3FPkBA0UpYgsadDIalniSpQnBKt2O0QLSlVc/jTvmP9rPM
         0G6wHxdSWppbnvqJK4qMsNCONk3ZNS7m/MkNk2Ya0ODMuZx3J1LicCUK/CWaDDg44Lnu
         5DGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/0XNhKtZbP75qZUV8rgsCy9ZSKNRD7kdPg6YIIn8je8=;
        b=0whZWfNN5cXcwEmGrTqT3NI9kmdQRyF0YJ5I478a8cgjw0+FgSLRQq2pDJhZvsqmdT
         yOnPcHr2klMXm7udLJH/djNrv8lzPkUd4yMz632OoSvY5TSfvjzi9AQrM7P3paBSnASc
         czKq8HWf2mkQ3oJVdbHWAzeqCMWGA2GIhf08WkpbE3ZnVDuWSZWXc9Kd/F9cSnhMybVk
         4/o2I/K7uMu9WPVkkjrFI/H796bPlUEKCbjHf4REMSiyIS6/VH6FifrJ47rU12E1TTqp
         srW8NM4NI+/q/kcyl18foSRQHf9R4+kX58cFkq+qxWVo5/ue79w26kViMEPMhvUb1aZJ
         4H8w==
X-Gm-Message-State: AO0yUKUQsJtokvuPwmD49A4Ggq2nAHJiVat97GthpiUDahBaJG4+voFR
	XUgXizqJiN5eHWvy+kBPKjQ6Kg4nYPs=
X-Google-Smtp-Source: AK7set81ICVGPKGahVxhPkIOPzXqgikn7/sPbCwVIiAzVoE1Z+wNVXuSJrkpj14+SdPFL+mT+j3mHg==
X-Received: by 2002:a17:902:e84f:b0:196:88e0:ea1a with SMTP id t15-20020a170902e84f00b0019688e0ea1amr1264810plg.47.1675737383139;
        Mon, 06 Feb 2023 18:36:23 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::868f])
        by smtp.gmail.com with ESMTPSA id m12-20020a1709026bcc00b001931c37da2dsm7554959plt.20.2023.02.06.18.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 18:36:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] cups-filters: Fix build with clang16/c++17
Date: Mon,  6 Feb 2023 18:36:19 -0800
Message-Id: <20230207023620.2243785-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Feb 2023 02:36:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100949

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...se-instead-of-throw-from-c-17-onward.patch | 36 +++++++++++++++++++
 .../cups/cups-filters_1.28.11.bb              |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-oe/recipes-printing/cups/cups-filters/0001-use-noexcept-false-instead-of-throw-from-c-17-onward.patch

diff --git a/meta-oe/recipes-printing/cups/cups-filters/0001-use-noexcept-false-instead-of-throw-from-c-17-onward.patch b/meta-oe/recipes-printing/cups/cups-filters/0001-use-noexcept-false-instead-of-throw-from-c-17-onward.patch
new file mode 100644
index 0000000000..5de8dae006
--- /dev/null
+++ b/meta-oe/recipes-printing/cups/cups-filters/0001-use-noexcept-false-instead-of-throw-from-c-17-onward.patch
@@ -0,0 +1,36 @@
+From 104fba23b1c0c67c92777b3165c6dca99558a656 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 6 Feb 2023 18:13:52 -0800
+Subject: [PATCH] use noexcept(false) instead of throw() from c++17 onwards
+
+C++17 removed dynamic exception specifications [1]
+they had been deprecated since C++11, replace
+throw(whatever) with noexcept(false).
+
+[1] https://www.open-std.org/jtc1/sc22/wg21/docs/papers/2016/p0003r5.html
+
+Upstream-Status: Submitted [https://github.com/OpenPrinting/cups-filters/pull/505]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ filter/pdftoraster.cxx | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/filter/pdftoraster.cxx b/filter/pdftoraster.cxx
+index e8af184fb..e91e22459 100755
+--- a/filter/pdftoraster.cxx
++++ b/filter/pdftoraster.cxx
+@@ -2148,7 +2148,11 @@ int main(int argc, char *argv[]) {
+ /* For compatibility with g++ >= 4.7 compilers _GLIBCXX_THROW
+  *  should be used as a guard, otherwise use traditional definition */
+ #ifndef _GLIBCXX_THROW
++#if __cplusplus < 201703L
+ #define _GLIBCXX_THROW throw
++#else
++#define _GLIBCXX_THROW(x) noexcept(false)
++#endif
+ #endif
+ 
+ void * operator new(size_t size) _GLIBCXX_THROW (std::bad_alloc)
+-- 
+2.39.1
+
diff --git a/meta-oe/recipes-printing/cups/cups-filters_1.28.11.bb b/meta-oe/recipes-printing/cups/cups-filters_1.28.11.bb
index bfe5375b28..9a0a23671b 100644
--- a/meta-oe/recipes-printing/cups/cups-filters_1.28.11.bb
+++ b/meta-oe/recipes-printing/cups/cups-filters_1.28.11.bb
@@ -1,3 +1,4 @@
 include cups-filters.inc
 
+SRC_URI += "file://0001-use-noexcept-false-instead-of-throw-from-c-17-onward.patch"
 SRC_URI[sha256sum] = "472418f1a1e12c9ad91b01caa020eb668626776d85de9da488be38e6663102ca"
-- 
2.39.1


