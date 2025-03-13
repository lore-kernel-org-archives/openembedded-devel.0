Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB736C282DE
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 18:38:42 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.22719.1741891117496523950
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Mar 2025 11:38:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CPbE0Uzh;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2fecba90cc3so2858187a91.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Mar 2025 11:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741891117; x=1742495917; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xnjvr8mPrSGLWQ2aHm/WecMjmdMN6cC6tTEVgH/E7X8=;
        b=CPbE0UzhZ/mRRfL7MmzouJzIQj7iwqT53Iy+Wx/Q1zTTFUOTi9uuhAwX44+QL88+ZP
         TIQPXBlf9sYEklv7Y5+lLkvK54eJ1pcnFsXpoKE0lPgOa5J6bKXrxRuwtHs146IQkrmi
         uHoj3ClcKQOlmTjn25M7RfUGT1uB4fVKh7zSkYsLHoYl/6MFzWuho8WWy4uUDSRPUSy1
         AfW5T8uRr3mn+rpILiRknUOCIDaBIY86yZTDmPRaIcFVP0eEqLbHgMHI+JEMeeQu3wWj
         5O0T/UQXWsM38aQc5F2tt6MgtGAuAy7F2Md+BkOSbXPCy2ZfY9F75hjt9DxH1BfvuVI2
         Nkbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741891117; x=1742495917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xnjvr8mPrSGLWQ2aHm/WecMjmdMN6cC6tTEVgH/E7X8=;
        b=uMqLWtReg4dqeh+5i+qB9F0gqRbJ82b7XLVGlf8C3cPNBPybXKPQ5qSg2DwhcomFUN
         cPrR95AD6EZyR7nhYJj2BJXi1r5iHZ7tb+8xhdA/O8VtjvlHY+w7xUg4FulImQu6CKx2
         hQPVhIa/keepMJWVA6pZ5yt8pWuV+PPP34l6xisLgpOXp1jTbuTVgVjkvxzlNYBTnWXN
         JwXBIyWZOFR3ST2VDOM7lH6a9cyeToirx4g4WK1z3H6qhCeSSu59T+1RYYXR97AmxZDM
         KpyhFnWoR5CGNIAh+jH0IOMECaU6NdrRCzl+4mWtoU/phJ5QIlkBNsGp5+yewEo42kDJ
         OnPg==
X-Gm-Message-State: AOJu0YyoTOUVScva4Us3E9ksuLFXc6599Prq5dOJpYGZlvMBtRnJv91V
	1Z/edPKA+Y4K+JIePvT7AIPnJ0erM3dSewuWrFmKMjlSpioD8/+Zh30rZJ26
X-Gm-Gg: ASbGnctHaQB+UTPIq8JWKRj6RsUn88NI/FHjhnarKSSrtjV+/oAw18Zy+SmqptuhHVw
	P35jlND9SL7Wi86kjAtM/1WimhefK+qRNAJp4U4aAUOCI7Y5BoROpP2QsseYfbpqMc0n7ulzgnH
	LcQWfiiFmOZNrFua5sDes5SY6MLqz7nwL4Kng0UfSzzeRhffY1quzsio+RwiKw/L1ATq3NCDfI5
	e6zelmPMHhTN906R9745DvRMDjxSgJjltrZZkvAnBhfFMWcmLed9HTNQdGvam1gNKplf4OkWaWs
	wZmw0woqIzjMP1VlKAG728GnUIyGSngQwTKE
X-Google-Smtp-Source: AGHT+IF/+9NCaddXzLYpRu+r3viCq6/2PrAtQ58ypVZNKrbpGLDO+cxiv7sCEBVKX22MfN9mLG5hGA==
X-Received: by 2002:a17:90b:51d1:b0:2ee:74a1:fba2 with SMTP id 98e67ed59e1d1-3014e85a4abmr670007a91.20.1741891116471;
        Thu, 13 Mar 2025 11:38:36 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::df1f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301027087b3sm2917686a91.0.2025.03.13.11.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 11:38:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] flashrom: Fix build with clang
Date: Thu, 13 Mar 2025 11:38:34 -0700
Message-ID: <20250313183834.686464-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Mar 2025 18:38:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115980

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...01-linux_mtd-fix-build-with-clang-19.patch | 39 +++++++++++++++++++
 .../recipes-bsp/flashrom/flashrom_1.4.0.bb    |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta-oe/recipes-bsp/flashrom/flashrom/0001-linux_mtd-fix-build-with-clang-19.patch

diff --git a/meta-oe/recipes-bsp/flashrom/flashrom/0001-linux_mtd-fix-build-with-clang-19.patch b/meta-oe/recipes-bsp/flashrom/flashrom/0001-linux_mtd-fix-build-with-clang-19.patch
new file mode 100644
index 0000000000..46bd0bba44
--- /dev/null
+++ b/meta-oe/recipes-bsp/flashrom/flashrom/0001-linux_mtd-fix-build-with-clang-19.patch
@@ -0,0 +1,39 @@
+From 615fae91dafdb89f0f8418129918dbb7ff879cf6 Mon Sep 17 00:00:00 2001
+From: Arnaud Ferraris <arnaud.ferraris@collabora.com>
+Date: Thu, 24 Oct 2024 17:51:29 +0200
+Subject: [PATCH] linux_mtd: fix build with clang >= 19
+
+Starting with version 19, clang issues a warning when using `strlen()`
+for initializing a static array's size. This causes the build to fail as
+the project also sets `-Werror`.
+
+This is fixed by using `sizeof()` instead, which is guaranteed to be
+evaluated at compilation time and therefore not triggering the
+problematic warning.
+
+Upstream-Status: Backport [https://github.com/flashrom/flashrom/commit/34b1a6aa57e910c0b5a518e8a0cab6841c7efaee]
+
+Change-Id: If470a65702e9ae08e4303123a0014e53a1fee56e
+Signed-off-by: Arnaud Ferraris <arnaud.ferraris@collabora.com>
+Reviewed-on: https://review.coreboot.org/c/flashrom/+/84856
+Tested-by: build bot (Jenkins) <no-reply@coreboot.org>
+Reviewed-by: Maximilian Brune <maximilian.brune@9elements.com>
+Reviewed-by: Anastasia Klimchuk <aklm@chromium.org>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ linux_mtd.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/linux_mtd.c b/linux_mtd.c
+index eea0cf2..0cb2330 100644
+--- a/linux_mtd.c
++++ b/linux_mtd.c
+@@ -49,7 +49,7 @@ static int read_sysfs_string(const char *sysfs_path, const char *filename, char
+ 	int i;
+ 	size_t bytes_read;
+ 	FILE *fp;
+-	char path[strlen(LINUX_MTD_SYSFS_ROOT) + 32];
++	char path[sizeof(LINUX_MTD_SYSFS_ROOT) + 31];
+ 
+ 	snprintf(path, sizeof(path), "%s/%s", sysfs_path, filename);
+ 
diff --git a/meta-oe/recipes-bsp/flashrom/flashrom_1.4.0.bb b/meta-oe/recipes-bsp/flashrom/flashrom_1.4.0.bb
index 98447809cf..6c5d05f2d0 100644
--- a/meta-oe/recipes-bsp/flashrom/flashrom_1.4.0.bb
+++ b/meta-oe/recipes-bsp/flashrom/flashrom_1.4.0.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SRC_URI = "https://download.flashrom.org/releases/flashrom-v${PV}.tar.xz \
            file://0001-flashrom-Mark-RISCV-as-non-memory-mapped-I-O-archite.patch \
            file://0002-meson-Add-options-pciutils-ftdi-usb.patch \
+           file://0001-linux_mtd-fix-build-with-clang-19.patch \
            "
 
 SRC_URI[sha256sum] = "eb0eb3e61a57fd1926c66f08664cf04a96f92cee23b600cf563087c2178d70d8"

