Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78A6CC3DA78
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 16:29:25 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.201308.1673972959854166206
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Jan 2023 08:29:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ADTCACxd;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id k18so10041804pll.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 08:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mBeS+73pMM+cqj0vOLnfIZLFCk0L9/CsQP4Ub1g0OaM=;
        b=ADTCACxdJ/JJfwRaN7eQLeru5xPmOija9ooOoT4BZ5RQJpdM61rNv4l5v8xL9VuQue
         1hCPj4TZT0nfnumuPjaYVPLK3KPkAemh/wzp9uiBby6zjPCPIA7m+vqwDYXKSUUtNaTF
         YmXPO4JexTWsv+ucKNUazxXGwv2++CbYqsGhi6y19SaCt2U2doCnN6JlsEHpa6g2Jhg0
         2DKlkn2IevtAHMFqapQCa2j/64j6Btkmam1wkm0rieQKgxehHRq2wYp6RaBDXNIwOytG
         tthHXCAki8xqM4xx4Kd3siDEG1hx/LIkEf+ZLZs0ahOYNu5YxyZX5ZXdQzEfD/wzdvpL
         e+iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mBeS+73pMM+cqj0vOLnfIZLFCk0L9/CsQP4Ub1g0OaM=;
        b=daGBd+sDif6dooDTwzGVMxJC6YjRz6QPng8ctI2WxJl5yHTt+UbXxMFcwW/9VSdY6e
         S1j6MsdtWtTERcWTs9JVRKbrZK/Nh7vSulODVK97g9QLYcMJLBDteSfkSwKr2+9W1c5C
         h5vK+lCgZ5j3oADyU74i6tn58V28ZvRY4kbzwGUdn6wUbBO/LFFsEM8vOveOlyEmDMNU
         BcIWI3sxfgPUQeSyLY1xSohB6iOzCkbD0Wdb+5q+P133KGyGxmntwzabSgHyR1b+bIPp
         Qqe9hkqUOkpcwFLREXdfIO7hMPT/dP6pfC1x0U6EhFjQCc8e4dsA8Qf0/gFhK5EQzvlV
         eubQ==
X-Gm-Message-State: AFqh2kooUX1OWtKg3zaeKz+egA8XbjnmFYtdNX3fD80guksdnV5EKUei
	9Ogxl1JHSh5eDZd+ELDjpbhNbE5sztrDwQ==
X-Google-Smtp-Source: AMrXdXsfdWLNMQ5Xgw+2lpjNRXpu2lbQ4EtZDueaRWVRON5euULVOedFxsPfQ/fpBzJwysvDGt5VnA==
X-Received: by 2002:a17:903:278d:b0:192:7a02:31a7 with SMTP id jw13-20020a170903278d00b001927a0231a7mr3063164plb.49.1673972958912;
        Tue, 17 Jan 2023 08:29:18 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::b940])
        by smtp.gmail.com with ESMTPSA id w14-20020a170902e88e00b00194a7b146d5sm1744639plg.27.2023.01.17.08.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 08:29:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-greenlet: Drop using register keyword
Date: Tue, 17 Jan 2023 08:29:16 -0800
Message-Id: <20230117162916.3917024-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 16:29:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100638

Its gone in modern C/C++ since c++17

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...using-register-storage-class-keyword.patch | 31 +++++++++++++++++++
 .../python/python3-greenlet_2.0.1.bb          |  2 ++
 2 files changed, 33 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-greenlet/0001-greenlet-Drop-using-register-storage-class-keyword.patch

diff --git a/meta-python/recipes-devtools/python/python3-greenlet/0001-greenlet-Drop-using-register-storage-class-keyword.patch b/meta-python/recipes-devtools/python/python3-greenlet/0001-greenlet-Drop-using-register-storage-class-keyword.patch
new file mode 100644
index 0000000000..5abe59279f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-greenlet/0001-greenlet-Drop-using-register-storage-class-keyword.patch
@@ -0,0 +1,31 @@
+From aa505359a3bb5a954fe3c7fbd853c75802bf3533 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 16 Jan 2023 21:37:26 -0800
+Subject: [PATCH] greenlet: Drop using 'register' storage class keyword
+
+This has been dropped in c++17 and newer
+
+Upstream-Status: Submitted [https://github.com/python-greenlet/greenlet/pull/336]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/greenlet/platform/switch_riscv_unix.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/greenlet/platform/switch_riscv_unix.h b/src/greenlet/platform/switch_riscv_unix.h
+index 5b5ea98..24df9db 100644
+--- a/src/greenlet/platform/switch_riscv_unix.h
++++ b/src/greenlet/platform/switch_riscv_unix.h
+@@ -11,8 +11,8 @@
+ static int
+ slp_switch(void)
+ {
+-  register int ret;
+-  register long *stackref, stsizediff;
++  int ret;
++  long *stackref, stsizediff;
+   __asm__ volatile ("" : : : REGS_TO_SAVE);
+   __asm__ volatile ("mv %0, sp" : "=r" (stackref) : );
+   {
+-- 
+2.39.0
+
diff --git a/meta-python/recipes-devtools/python/python3-greenlet_2.0.1.bb b/meta-python/recipes-devtools/python/python3-greenlet_2.0.1.bb
index 629d9d359f..4a50a24184 100644
--- a/meta-python/recipes-devtools/python/python3-greenlet_2.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-greenlet_2.0.1.bb
@@ -4,6 +4,8 @@ LICENSE = "MIT & PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e95668d68e4329085c7ab3535e6a7aee \
                     file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
 
+SRC_URI += "file://0001-greenlet-Drop-using-register-storage-class-keyword.patch"
+
 SRC_URI[sha256sum] = "42e602564460da0e8ee67cb6d7236363ee5e131aa15943b6670e44e5c2ed0f67"
 
 inherit pypi setuptools3
-- 
2.39.0


