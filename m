Return-Path: <emailaddress.ashish@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D91B2CD5BAB
	for <webhook@archiver.kernel.org>; Sun, 24 May 2026 06:54:28 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4002.1779605662919012957
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 May 2026 23:54:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=EwqoyoZU;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: emailaddress.ashish@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c8173b2af32so6808765a12.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 23 May 2026 23:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779605662; x=1780210462; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FyQ/2Ul+ULOlhiXSUyjS8CSFD6+TBInkS0IxqIlHYR0=;
        b=EwqoyoZUkPcXWDYNJ3gwNH1p+RdqhzNvmVRn28GpYgOF7On1ElNHTtob/9IvIKK+1A
         cEfUEnjASgHA427fhNLCVfmTpTGR/B8vOfm3R8tm8Kthn0/9ohYGSzXW8G10zSUimxF5
         JmZ6mUolaCDck0HqEoVJ49ooeifiACf4Uc94ledU43zs99MXDbRc0SxaJBhUaqSNfEJY
         0Qb7uBhrUM7LNJZ9iMwt2+ClNrz5DVLGBHlzzjbYsz1+19blp9n1GS8ofACoHy0ukWZb
         7co9p+wURCVE1HGbBemtjQfoP1sgMWUyuPmnzCDemtToYW0PXmdyKDcYWD0Udj5q7Pth
         AS0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779605662; x=1780210462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FyQ/2Ul+ULOlhiXSUyjS8CSFD6+TBInkS0IxqIlHYR0=;
        b=cl0J0JqqBYamNGhkSXjV0thVJ7yRs4B9JejD8RhoExGGAz2ipDHzKKd8k9U8Qh9SmI
         xWyaxPxpe/DAMF3ee7lB0+caDi+gN1A54qwwrpcbbuB9vg4NHtCF+dnu9y6z+syGOAX8
         okSOnbe0nXpqHKCF4y8Hgbpq4CRzMbX564g/n7t76aGvF8qNCnd14Savm7AAVjc+ErZ0
         SaNcrbDPZM5xCN/NlUN1n7441PF5Fi1QCZqro1Y5EPbLgQWVTV2W7yTMLeI2aVsr5wqR
         DDecK5Blv0KRWhZGbQAPBZHglKSzFI2CCp0dMpZgcgC+dM+pDitum8SElDmCYG9xuqmx
         q7rg==
X-Gm-Message-State: AOJu0Yx0/6waoAVTBvo2OslnwBbjMqV+d576jFhHQgPS4bkzgFzrY2mb
	l8uTZ607xLdBWpMHeOwWzU7ZXYp5/wX1Jov5eaZQtenLSVQAITpMi+yPMGIBlQ==
X-Gm-Gg: Acq92OF4NFNU1TdZ9OuP5aKbcJFo49Dr07R++MiNdbbG8UIWvbprFru7pB2kStWm1hW
	L/riUCEkUTw+ghWzbenST5Zxg1UaMIJ9+3EFVhfhuulIoVEme1D+J4V+L3SeRX29uDa/GvbOw6u
	+p6ZjGXWfjMrZKOufCmbtxccEbs8q45pB8ZWzb8P61R649yxnEBmXC3jvbwvJ1ELLdLdMWCqBsN
	ym5F9t7lEWWL2wTpz5xFZh7mhWFfGH94XMEAp/7Ln/sW8rY6VlPPCpI3VhPIYGkeBQHNEz9+gL3
	SZCjsBsJvwaTyxgo7iwRIjBOkopt7P4psVvLFoFUWR6fdr8r4UPIxUF8S+oDB4uSilYa9HXecoj
	6MwNngOXYqVHe0n1FL1eJNTEfjRYhYFiXcj6wkKd/CJJ3cNFJtkEA1xp2dh+r7PiRUxvBUUR23j
	7C
X-Received: by 2002:a05:6a00:1826:b0:839:44c5:c321 with SMTP id d2e1a72fcca58-8415f3a9457mr9345569b3a.44.1779605662201;
        Sat, 23 May 2026 23:54:22 -0700 (PDT)
Received: from ashishkumar.. ([2406:7400:94:3c8a:db68:70f9:93df:9353])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84165010d60sm7053411b3a.61.2026.05.23.23.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 23:54:21 -0700 (PDT)
From: AshishKumar Mishra <emailaddress.ashish@gmail.com>
X-Google-Original-From: AshishKumar Mishra
To: openembedded-devel@lists.openembedded.org
Cc: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
Subject: [meta-oe][PATCH v4 4/4] android-tools: fix deprecated header warning from clang
Date: Sun, 24 May 2026 12:23:40 +0530
Message-ID: <20260524065341.82660-5-emailaddress.ashish@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260524065341.82660-1-emailaddress.ashish@gmail.com>
References: <20260524065341.82660-1-emailaddress.ashish@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 24 May 2026 06:54:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127183

From: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>

Remove .h header files from the SOURCES compilation list inside adbd.mk
to resolve a Clang warning regarding treating 'c-header' input as 'c++-header'

Moved the header files into a separate HEADERS variable to act purely as a
GNU Make dependency trigger, keeping them off the direct compiler
execution string.

Signed-off-by: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
---
 .../android-tools/android-tools/adbd.mk           | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/adbd.mk b/meta-oe/recipes-devtools/android-tools/android-tools/adbd.mk
index 3282216b8e..709a166887 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools/adbd.mk
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/adbd.mk
@@ -5,16 +5,12 @@ SOURCES = \
 	adb/adbconnection/adbconnection_server.cpp \
 	adb/daemon/auth.cpp \
 	adb/daemon/file_sync_service.cpp \
-	adb/daemon/file_sync_service.h \
 	adb/daemon/framebuffer_service.cpp \
-	adb/daemon/framebuffer_service.h \
 	adb/daemon/jdwp_service.cpp \
 	adb/daemon/main.cpp \
 	adb/daemon/restart_service.cpp \
-	adb/daemon/restart_service.h \
 	adb/daemon/services.cpp \
 	adb/daemon/shell_service.cpp \
-	adb/daemon/shell_service.h \
 	adb/daemon/usb_ffs.cpp \
 	adb/daemon/usb_legacy.cpp \
 	adb/daemon/usb.cpp \
@@ -41,7 +37,14 @@ SOURCES = \
 	diagnose_usb/diagnose_usb.cpp \
 	libasyncio/AsyncIO.cpp \
 
+HEADERS = \
+        adb/daemon/file_sync_service.h \
+        adb/daemon/framebuffer_service.h \
+        adb/daemon/restart_service.h \
+        adb/daemon/shell_service.h
+
 SOURCES := $(foreach source, $(SOURCES), system/core/$(source))
+HEADERS := $(foreach header, $(HEADERS), system/core/$(header))
 
 SOURCES += \
     frameworks/native/libs/adbd_auth/adbd_auth.cpp
@@ -79,9 +82,9 @@ ifneq ($(filter armel mipsel,$(DEB_HOST_ARCH)),)
   LDFLAGS += -latomic
 endif
 
-build: $(SOURCES)
+build: $(SOURCES) $(HEADERS)
 	mkdir --parents debian/out/system/core
-	$(CXX) $^ -o debian/out/system/core/adbd $(CXXFLAGS) $(CPPFLAGS) $(LDFLAGS)
+	$(CXX) $(SOURCES) -o debian/out/system/core/adbd $(CXXFLAGS) $(CPPFLAGS) $(LDFLAGS)
 
 clean:
 	$(RM) debian/out/system/core/adbd
-- 
2.43.0


