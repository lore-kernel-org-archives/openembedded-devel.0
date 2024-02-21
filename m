Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1F2DC5475B
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 04:00:44 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.5743.1708488044448175937
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Feb 2024 20:00:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JTwSiqBV;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1dc29f1956cso1001895ad.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 20:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708488043; x=1709092843; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9IkJwB7us0yDlcwXldIT/PPluwUh5hpPj6FzMwLpXb4=;
        b=JTwSiqBVzsGpHUVk/AWBNZ9E9YY0EVcofhqkQGMjdbPfu21S6gIbXL4cZ+0jfNL/L2
         rTZpC361KnJRK/lL6loqaDeR1vXVbXGFEqymP1AMyVUMpHLWpNJh8XAhAL4f1X4G5Mzk
         qi6k9eqM8n7F15VIMlnjpmmc8a0CrZRCCp9EHWm5Q/ZmMedrhSsVfUldd4vgPahSdV/T
         HjpyIefexNnytbi9w6gimHhFHGPiwehaYnEWQRi2VmvhVenKtKKEEo5VHr3vrLmLDn6S
         D1U5Hivux1XqetcNYkgQB0QR7erT8rdAMNQyQNLkpfI6L/mK8ksg62wO5SQBBOjJtYam
         bqjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708488043; x=1709092843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9IkJwB7us0yDlcwXldIT/PPluwUh5hpPj6FzMwLpXb4=;
        b=Bi+w6sugX8aVxw7OG5i/v88qwPS20SbxgIoug6E5RhsZ1IHsgFP2xMHtC8qeTfBrBX
         mYc57Yr+ea4Z3QRFWo12dVZ4dALIXmylTr8NexmUuqiVaEgBwVXILXhGPmE+SIVtnEB4
         pz9ZwAXFY/0nRevH/tIMQDKt8RiRO6tgPP8E6iJ9kgEWjatQtrhKQh0VWbP2IsJTDKbU
         X/VwB8pxW49TZg20dk6UaVJUT6dyTDlvCBjQGmJ806jZJU09CsjiIXxDunLvWXT1jspz
         1YOijC+QbDur68WKlnRvktYWCDNrLF8E93FPQCFUB3uXwpsLDVzTwu31Xo/z2DBaBQVZ
         thyg==
X-Gm-Message-State: AOJu0YwHctm1fxGyy3lfc+N2XEFO7+Icnfl09BjxRVnRyuNl6iw6bCr8
	4XA1eneJmLu3nvpBR910MEx1EMrknQ+vUV2uW0wfFA4ewdbmayZe6Idb9py1e9M=
X-Google-Smtp-Source: AGHT+IFzVl1GiKrH0aWhF5o80HNqtRRTNMRhUxbgGOWCKSAe6xsOXL7ulSsfQNIHxeZRHqIzoEOAVQ==
X-Received: by 2002:a17:903:110d:b0:1d8:b51c:6b79 with SMTP id n13-20020a170903110d00b001d8b51c6b79mr20426148plh.7.1708488043560;
        Tue, 20 Feb 2024 20:00:43 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::696f])
        by smtp.gmail.com with ESMTPSA id mq6-20020a170902fd4600b001d96a0cddccsm7034621plb.296.2024.02.20.20.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 20:00:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] webkitgtk3: Fix build on 32bit x86
Date: Tue, 20 Feb 2024 20:00:40 -0800
Message-ID: <20240221040040.2451617-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Feb 2024 04:00:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108957

Backport a patch to fix the compile problems seen on 32bit x86

Fixes
TOPDIR/build/tmp/work/core2-32-yoe-linux/webkitgtk3/2.42.5/webkitgtk-2.42.5/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp:339:21: error: use of undeclared identifier 't6'
  339 |     UNUSED_VARIABLE(t6);
      |                     ^
TOPDIR/build/tmp/work/core2-32-yoe-linux/webkitgtk3/2.42.5/webkitgtk-2.42.5/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp:340:21: error: use of undeclared identifier 't7'
  340 |     UNUSED_VARIABLE(t7);
      |                     ^
2 errors generated.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ter.cpp-339-21-error-t6-was-not-decl.patch | 38 +++++++++++++++++++
 .../webkitgtk/webkitgtk3_2.42.5.bb            |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-LowLevelInterpreter.cpp-339-21-error-t6-was-not-decl.patch

diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-LowLevelInterpreter.cpp-339-21-error-t6-was-not-decl.patch b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-LowLevelInterpreter.cpp-339-21-error-t6-was-not-decl.patch
new file mode 100644
index 0000000000..8909263fe4
--- /dev/null
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-LowLevelInterpreter.cpp-339-21-error-t6-was-not-decl.patch
@@ -0,0 +1,38 @@
+From 6c4ff2210c36d6410ec287737d6a49f20c412332 Mon Sep 17 00:00:00 2001
+From: Michael Catanzaro <mcatanzaro@redhat.com>
+Date: Mon, 5 Feb 2024 11:00:49 -0600
+Subject: [PATCH] =?UTF-8?q?LowLevelInterpreter.cpp:339:21:=20error:=20?=
+ =?UTF-8?q?=E2=80=98t6=E2=80=99=20was=20not=20declared=20in=20this=20scope?=
+ =?UTF-8?q?=20https://bugs.webkit.org/show=5Fbug.cgi=3Fid=3D268739?=
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Unreviewed build fix. Seems a backport went badly, and we didn't notice
+because the code is architecture-specific.
+
+* Source/JavaScriptCore/llint/LowLevelInterpreter.cpp:
+(JSC::CLoop::execute):
+
+Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/3d5373575695b293b8559155431d0079a6153aff]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Source/JavaScriptCore/llint/LowLevelInterpreter.cpp | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp b/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
+index 5064ead6..9a2e2653 100644
+--- a/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
++++ b/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
+@@ -336,8 +336,6 @@ JSValue CLoop::execute(OpcodeID entryOpcodeID, void* executableAddress, VM* vm,
+     UNUSED_VARIABLE(t2);
+     UNUSED_VARIABLE(t3);
+     UNUSED_VARIABLE(t5);
+-    UNUSED_VARIABLE(t6);
+-    UNUSED_VARIABLE(t7);
+ 
+     struct StackPointerScope {
+         StackPointerScope(CLoopStack& stack)
+-- 
+2.43.2
+
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.5.bb b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.5.bb
index d12ae2819c..234ecfae0c 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.5.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.5.bb
@@ -14,6 +14,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz \
            file://reproducibility.patch \
            file://0d3344e17d258106617b0e6d783d073b188a2548.patch \
            file://no-musttail-arm.patch \
+           file://0001-LowLevelInterpreter.cpp-339-21-error-t6-was-not-decl.patch \
            "
 SRC_URI[sha256sum] = "b64278c1f20b8cfdbfb5ff573c37d871aba74a1db26d9b39f74e8953fe61e749"
 
-- 
2.43.2


