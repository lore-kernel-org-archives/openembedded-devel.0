Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCFE7C64EC4
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 04:22:23 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.15856.1677817338736531970
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Mar 2023 20:22:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OkhhNz/V;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id me6-20020a17090b17c600b0023816b0c7ceso4946693pjb.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Mar 2023 20:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677817338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g9DuSb19hOQGIwNMpy8HxE6hwRt/yGLo0AdK2xPFJEA=;
        b=OkhhNz/VRQVSER41yRe6DuNioQVs/NjKtj3veKsuTJtE8gvnFwfOTfm2bTGNToJpME
         IQPy1ec8vtCS03ybYaKSkdUuEHh8PRCaqycc7xDzFXB8okxk8o1ptc4Ty57+E4YDO3wr
         D1mD/Dq9vVbxu4ngvUJR0OAuaHGEUkTleGLmXFck8ysXxJ9IQ7T49VKakMyUYhef0zhg
         xT4uLRizQv9p2f8CqH06/tXtCnxltb2bfoop1n4Qr8BXLctGzWEg4KqiSvficYB5jagn
         zrULDeZJxLWNaVOfCCACDxmXyxLPgWSuUukK0y/gjI31iGfHDlxZe1/k+CqORvNQ0Xtd
         A4wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677817338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g9DuSb19hOQGIwNMpy8HxE6hwRt/yGLo0AdK2xPFJEA=;
        b=5xxfq/dWte+dFLBja52OCSd7ivy9MsqSIL0fjY+W+cMEoacMr4j0sk3pyskZ25T0rW
         hgq4ozFDSBTlXOSlRXT6veLTXwNiK9Odl0tg2lxPyUZHz4hl4/wNYaNuzhyTBuXC+1qU
         ItvkyTELRriXRqYF0DZ1glypA4n2lM44yuSyQ+FJrmQU2iUhp100LY2vI1LN/pEzXJKQ
         v1yR0T15cZhZX8XqxviSDcSUPi5lxMc/SgqEqIb5mZYApVv86LvYyzofxJwrAHfcE/4w
         y0hqQrniNhWObPpKsJ7EEGBSRdCT50/6PG/p2gRrC96XRjj9cqQbRVgdHHKBEJKmcPdc
         HiyA==
X-Gm-Message-State: AO0yUKVbbhPvnLTc9fFCShx2e09ms4ryzfQo1BO5QpZyRsB5ZL1gp5Wv
	PzkFFDzmWL4Mdp2Sr9aaFDwaaWyOPIw=
X-Google-Smtp-Source: AK7set8BQimdsQcn2KlhFehuP5Ry+9j9Nnu1cVPi1MpswHFnC1I3E4FONgbDUKGxDCvIkOcvMyU7Cg==
X-Received: by 2002:a05:6a21:6d9f:b0:cc:4db0:f2c7 with SMTP id wl31-20020a056a216d9f00b000cc4db0f2c7mr291817pzb.23.1677817337552;
        Thu, 02 Mar 2023 20:22:17 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::1ac4])
        by smtp.gmail.com with ESMTPSA id u4-20020aa78484000000b005809d382016sm496016pfn.74.2023.03.02.20.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 20:22:17 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] libx86-1: Fix build with clang16
Date: Thu,  2 Mar 2023 20:22:14 -0800
Message-Id: <20230303042215.817853-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Mar 2023 04:22:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101343

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...efine-CARD32-as-uint-as-it-is-32-bit.patch | 34 +++++++++++++++++++
 .../recipes-extended/libx86-1/libx86-1_1.1.bb |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-extended/libx86-1/libx86-1.1/0001-Define-CARD32-as-uint-as-it-is-32-bit.patch

diff --git a/meta-oe/recipes-extended/libx86-1/libx86-1.1/0001-Define-CARD32-as-uint-as-it-is-32-bit.patch b/meta-oe/recipes-extended/libx86-1/libx86-1.1/0001-Define-CARD32-as-uint-as-it-is-32-bit.patch
new file mode 100644
index 0000000000..cc4ee7eefb
--- /dev/null
+++ b/meta-oe/recipes-extended/libx86-1/libx86-1.1/0001-Define-CARD32-as-uint-as-it-is-32-bit.patch
@@ -0,0 +1,34 @@
+From 592c915df252932961a4151c891da58c48a8db90 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 2 Mar 2023 18:47:40 -0800
+Subject: [PATCH] Define CARD32 as uint as it is 32-bit
+
+long can be 64bit on LP64 systems
+
+Fixes build with clang-16
+thunk.c:147:3: error: incompatible function pointer types initializing 'x86emuu32 (*)(X86EMU_pioAddr)' (aka 'unsigned int (*)(unsigned short)') with an expression of type 'unsigned long (*)(unsigned short)' [-Wincompatible-function-pointer-types]
+                (&x_inl),
+                ^~~~~~~~
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ x86emu/include/xf86int10.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/x86emu/include/xf86int10.h b/x86emu/include/xf86int10.h
+index 9c131dd..acd5114 100644
+--- a/x86emu/include/xf86int10.h
++++ b/x86emu/include/xf86int10.h
+@@ -18,7 +18,7 @@
+ 
+ #define CARD8  unsigned char
+ #define CARD16 unsigned short
+-#define CARD32 unsigned long
++#define CARD32 unsigned int
+ #define pointer void *
+ #define IOADDRESS void *
+ #define Bool int
+-- 
+2.39.2
+
diff --git a/meta-oe/recipes-extended/libx86-1/libx86-1_1.1.bb b/meta-oe/recipes-extended/libx86-1/libx86-1_1.1.bb
index 9dc91f3f6f..b646162c26 100644
--- a/meta-oe/recipes-extended/libx86-1/libx86-1_1.1.bb
+++ b/meta-oe/recipes-extended/libx86-1/libx86-1_1.1.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://www.codon.org.uk/~mjg59/libx86/downloads/${BPN}-${PV}.tar.gz \
            file://0001-assume-zero-is-valid-address.patch \
            file://makefile-add-ldflags.patch \
            file://0001-Fix-type-of-the-void-pointer-assignment.patch \
+           file://0001-Define-CARD32-as-uint-as-it-is-32-bit.patch \
 "
 
 SRC_URI[md5sum] = "41bee1f8e22b82d82b5f7d7ba51abc2a"
-- 
2.39.2


