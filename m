Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE075C47072
	for <webhook@archiver.kernel.org>; Fri, 22 Dec 2023 15:11:36 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.24910.1703257888506017615
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Dec 2023 07:11:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I65SM8lY;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-55372c1338bso2110154a12.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Dec 2023 07:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703257887; x=1703862687; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ra2T8pZHXKx2HBPyaV+6rVIgy4oAoTRNICIado0EoiA=;
        b=I65SM8lYMmzB9f9YQIxx42MsTOeAL62VqhxrDUXBgviIniz8qrQm7bShxkAGs4+LGF
         cqjJgNKU9uyAVHLmqqwIdOCKc1Jh3qfgJKck5j8cBlngOmvXvUbF+B2qIFLYdQIdUSL2
         NbIAHKzmOfSDSpEau5bOUPIjVB1tBaDAgJ+UHby+/7sliOMkI6BpyYa6oxl35VHkxaOL
         /cLZete9tkaleP+OvaQq7Wsd6dzkK02Y3xR5g/FEx09DSx8bwY7ePvulIU80v1b/L/DF
         +K7AhJljL0KgvWhXgE8J4hqKRLG6AItvPXxlOgnMWi+LATS6wbPRz7z2+Ke/QIBxpXxj
         3UUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703257887; x=1703862687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ra2T8pZHXKx2HBPyaV+6rVIgy4oAoTRNICIado0EoiA=;
        b=HcG35ScL6jZXF+t8+wsYfEBLjVXVEBjb+e4zeI2B1ENp4tRMgcBMZenSM4L/q5GqDT
         KKcpYYn0kpIzNRGEZdw3ecBQbF6qURbVSY3hYF6/1YYn9M9xF2XuISys3OMvr4lf1WPB
         mCaG1c+aYO3yugVtGS6uGedDbWl5L/0a5KLLtQrRTtG17ezj2odO7S8bauy1PGNmvjYR
         6DOjtssZPc93Y9FYWD0WFP8Uxy35j0u7pgXg70ll1Ap7pUl9H3fOC/ANq+vhxjIEu+MR
         8N8xdbv072HJeeyXMfo1UvJ+FJli48Kkksp4SJKL4G/TfjsYDIxD6X6E5VjUXqurLtg1
         bjIg==
X-Gm-Message-State: AOJu0Yz0DzgD1T0GU4Rb9rv1Yp5sT/PpbV80neIE0uJ3umxtbQgTCtQm
	AJxcLpnrDScT3ByaA73KSrPbCmecdaXz7g==
X-Google-Smtp-Source: AGHT+IGyzvXrBbl+fBT0DB82R9un7Z/Sa0kmh8vyPczO0rCVH750IVja43zG5LxR29EvkiRudipTWQ==
X-Received: by 2002:a50:8e56:0:b0:553:29ef:4f86 with SMTP id 22-20020a508e56000000b0055329ef4f86mr745418edx.69.1703257886859;
        Fri, 22 Dec 2023 07:11:26 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m9-20020aa7c2c9000000b00552666f4745sm2650247edp.22.2023.12.22.07.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 07:11:26 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 4/9] polkit: update mozjs dependency 102 -> 115
Date: Fri, 22 Dec 2023 16:11:03 +0100
Message-Id: <20231222151108.645675-4-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231222151108.645675-1-alex@linutronix.de>
References: <20231222151108.645675-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Dec 2023 15:11:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107755

This will allow dropping mozjs-102 instead of attempting
to make it work with python 3.12.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-jsauthority-Bump-mozjs-to-115.patch  | 26 +++++++++++++++++++
 meta-oe/recipes-extended/polkit/polkit_123.bb | 10 +++----
 2 files changed, 31 insertions(+), 5 deletions(-)
 create mode 100644 meta-oe/recipes-extended/polkit/polkit/0001-jsauthority-Bump-mozjs-to-115.patch

diff --git a/meta-oe/recipes-extended/polkit/polkit/0001-jsauthority-Bump-mozjs-to-115.patch b/meta-oe/recipes-extended/polkit/polkit/0001-jsauthority-Bump-mozjs-to-115.patch
new file mode 100644
index 000000000..163a03cfc
--- /dev/null
+++ b/meta-oe/recipes-extended/polkit/polkit/0001-jsauthority-Bump-mozjs-to-115.patch
@@ -0,0 +1,26 @@
+From 2f0de2a831ab106fce210c1d65baef041256bc18 Mon Sep 17 00:00:00 2001
+From: Xi Ruoyao <xry111@xry111.site>
+Date: Mon, 18 Sep 2023 01:53:04 +0800
+Subject: [PATCH] jsauthority: Bump mozjs to 115
+
+No code change is needed!
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/polkit/polkit/-/commit/b340f50b7bb963863ede7c63f9a0b5c50c80c1e1]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 3b96562..92b68fd 100644
+--- a/meson.build
++++ b/meson.build
+@@ -153,7 +153,7 @@ if js_engine == 'duktape'
+   func = 'pthread_condattr_setclock'
+   config_h.set('HAVE_' + func.to_upper(), cc.has_function(func, prefix : '#include <pthread.h>'))
+ elif js_engine == 'mozjs'
+-  js_dep = dependency('mozjs-102')
++  js_dep = dependency('mozjs-115')
+ 
+   _system = host_machine.system().to_lower()
+   if _system.contains('freebsd')
diff --git a/meta-oe/recipes-extended/polkit/polkit_123.bb b/meta-oe/recipes-extended/polkit/polkit_123.bb
index 4fc23559f..670fd995f 100644
--- a/meta-oe/recipes-extended/polkit/polkit_123.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_123.bb
@@ -4,10 +4,10 @@ HOMEPAGE = "http://www.freedesktop.org/wiki/Software/polkit"
 LICENSE = "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=155db86cdbafa7532b41f390409283eb"
 
-SRC_URI = " \
-	git://gitlab.freedesktop.org/polkit/polkit.git;protocol=https;branch=master \
-	file://0001-polkit.service.in-disable-MemoryDenyWriteExecute.patch \
-"
+SRC_URI = "git://gitlab.freedesktop.org/polkit/polkit.git;protocol=https;branch=master \
+           file://0001-polkit.service.in-disable-MemoryDenyWriteExecute.patch \
+           file://0001-jsauthority-Bump-mozjs-to-115.patch \
+           "
 
 S = "${WORKDIR}/git"
 SRCREV = "fc8b07e71d99f88a29258cde99b913b44da1846d"
@@ -31,7 +31,7 @@ PACKAGECONFIG[systemd] = "-Dsession_tracking=libsystemd-login,-Dsession_tracking
 PACKAGECONFIG[consolekit] = ",,,consolekit"
 
 # Default to mozjs javascript library
-PACKAGECONFIG[mozjs] = "-Djs_engine=mozjs,,mozjs-102,,,duktape"
+PACKAGECONFIG[mozjs] = "-Djs_engine=mozjs,,mozjs-115,,,duktape"
 # duktape javascript engine is much smaller and faster but is not compatible with
 # same javascript standards as mozjs. For example array.includes() function is not
 # supported. Test rule compatibility when switching to duktape.
-- 
2.39.2


