Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E397C4828F
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 14:20:42 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.16372.1706797234251096384
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Feb 2024 06:20:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eFA4GZtr;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-50eac018059so1199407e87.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Feb 2024 06:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706797232; x=1707402032; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CdfdbX3m5IXBB2w0gspHCySFd5AEoE6crVgybHsAEl8=;
        b=eFA4GZtrq+x+1e3K/jJf30oRO2TC/hM5ys+z+pV+L84GByAawDTX1htpr+qrEk2+Wu
         yxSdOM6Lh0wVbFetuiFaqXLF0LcGQ/vrXLn1eMMuegqRl8IaBxilrdl8k2Sa1HoaQpD6
         9WKmTOaykW3xthZQZQKD87x2UwBNMxqfyanwc5HjsPjbaTVcpv4RgR4+PNkkuGMCkamU
         kS0G+0TCZTY3j/Na+Ru7gXqf+w0Thj39zPZZLJ8cZL6mBpxdbDMWEcREEy94JuvNDLs0
         ii79A2P9NMMys9KMIPF5/qcFMbLVmXeIGLF232UV4TcpAmoCXlV4rdol+KaebGluwkq3
         TvmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706797232; x=1707402032;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CdfdbX3m5IXBB2w0gspHCySFd5AEoE6crVgybHsAEl8=;
        b=wCd5QpOdpaULrL3tMtReO/7Ogbe2oV6fFb5s1gSr8UGpLNiY9wMD0dKvDSTtDrpHPZ
         A25OI74pTe94CwHrpLwe5LbUbR26l8P/Hvh9XbGTDTpjdTQaYRCizqed2opPLS0JZ+ux
         iTBsDefGqwrPkj6SzdAAoJiJPLnSA4pK4GsKTOWdy+9kFdrge5i4MW0VMSgmAvxxrKxJ
         fqfmNZXvnI7pUJis4nGt2o9l7HR7trmuPF6Q09YD9FZXZ5idCd17zhqiWvrqbxZDvfRQ
         ue4Dv1NQmQy4vgptxAh3wOlV379tObXm+13N6FD6uPGp6vgcE6vXXLuLZbYzn15UNIj+
         6/tQ==
X-Gm-Message-State: AOJu0YzZx+RBRFkrLuwyiIe/6GmsogTgas5z7ST+Z4O/spNPmfcv0DzB
	jetCkJjDr5bFCbasS3ZrwE+wEc58AccxPG5JUgg7wcda41sNUl/CX8hntbLS
X-Google-Smtp-Source: AGHT+IG7s8R4EI2jURvg+6+m0OAouejlCLahS34CFTwWllbSO7Y42hCIRgcDcUieLHpzlDgMQ9F4Gg==
X-Received: by 2002:ac2:4105:0:b0:510:1b44:36dc with SMTP id b5-20020ac24105000000b005101b4436dcmr1982956lfi.69.1706797231946;
        Thu, 01 Feb 2024 06:20:31 -0800 (PST)
Received: from localhost.localdomain ([5.148.102.211])
        by smtp.gmail.com with ESMTPSA id j4-20020ac253a4000000b0050e7d22a9b8sm2203606lfh.89.2024.02.01.06.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 06:20:31 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-oe][PATCH] mdns: Fix SIGSEGV during DumpStateLog()
Date: Thu,  1 Feb 2024 14:20:28 +0000
Message-Id: <20240201142028.8480-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Feb 2024 14:20:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108518

DumpStateLog() calls LogMsgWithLevelv() with category == NULL, avoid
crashing in this case.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 ...0001-Fix-SIGSEGV-during-DumpStateLog.patch | 30 +++++++++++++++++++
 .../mdns/mdns_2200.60.25.0.4.bb               |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/mdns/mdns/0001-Fix-SIGSEGV-during-DumpStateLog.patch

diff --git a/meta-networking/recipes-protocols/mdns/mdns/0001-Fix-SIGSEGV-during-DumpStateLog.patch b/meta-networking/recipes-protocols/mdns/mdns/0001-Fix-SIGSEGV-during-DumpStateLog.patch
new file mode 100644
index 000000000000..4b0227f1dc38
--- /dev/null
+++ b/meta-networking/recipes-protocols/mdns/mdns/0001-Fix-SIGSEGV-during-DumpStateLog.patch
@@ -0,0 +1,30 @@
+From 14cc53bb09a3d8adf301f3842c765598467e63e1 Mon Sep 17 00:00:00 2001
+From: Alex Kiernan <alex.kiernan@gmail.com>
+Date: Thu, 1 Feb 2024 14:07:03 +0000
+Subject: [PATCH] Fix SIGSEGV during DumpStateLog()
+
+DumpStateLog() calls LogMsgWithLevelv() with category == NULL, avoid
+crashing in this case.
+
+Upstream-Status: Inactive-Upstream [Upstream does not take patches]
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+---
+ mDNSShared/mDNSDebug.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mDNSShared/mDNSDebug.c b/mDNSShared/mDNSDebug.c
+index 7a4ca19eff6d..d449dde320f6 100644
+--- a/mDNSShared/mDNSDebug.c
++++ b/mDNSShared/mDNSDebug.c
+@@ -71,7 +71,7 @@ mDNSlocal void LogMsgWithLevelv(os_log_t category, os_log_type_t level, const ch
+ mDNSlocal void LogMsgWithLevelv(const char *category, mDNSLogLevel_t level, const char *format, va_list args)
+ {
+     // Do not print the logs if the log category is MDNS_LOG_CATEGORY_DISABLED.
+-    if (strcmp(category, MDNS_LOG_CATEGORY_DISABLED) == 0)
++    if (category && strcmp(category, MDNS_LOG_CATEGORY_DISABLED) == 0)
+     {
+         return;
+     }
+-- 
+2.39.0
+
diff --git a/meta-networking/recipes-protocols/mdns/mdns_2200.60.25.0.4.bb b/meta-networking/recipes-protocols/mdns/mdns_2200.60.25.0.4.bb
index a009ae0c6e5c..09af3d5ae36e 100644
--- a/meta-networking/recipes-protocols/mdns/mdns_2200.60.25.0.4.bb
+++ b/meta-networking/recipes-protocols/mdns/mdns_2200.60.25.0.4.bb
@@ -24,6 +24,7 @@ SRC_URI = "git://github.com/apple-oss-distributions/mDNSResponder;protocol=https
            file://mdns.service \
            file://0015-Add-missing-limits.h.patch \
            file://0001-Handle-interface-without-ifa_addr.patch \
+           file://0001-Fix-SIGSEGV-during-DumpStateLog.patch \
            "
 SRCREV = "8acabead9ae56551011172d6835822a89c5298d6"
 
-- 
2.39.0


