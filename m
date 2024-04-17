Return-Path: <nikhilar2410@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28A2DC4345F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 05:55:41 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.5971.1713333332642953200
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 22:55:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PckEAsmP;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: nikhilar2410@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1e5715a9ebdso42019375ad.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Apr 2024 22:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713333331; x=1713938131; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GFEArMgjntqkwBsQ8Jqp7knuVJcH0gTLIC6dZnr7v9U=;
        b=PckEAsmP3mE0ifmX/5SYs7j1IGXf7BliA+KePsRbQ05rJ/HbeSlMUOyDmCqU4TFi18
         tGUaHB5bt00UZqTD5+Qamq2d9Rx7+9xOoN/ud1S4MT4Asrr1pY7HJwABWHFtmQd0EV+l
         BD8BrHMOFyc0tZU10z+iMSbZ35h3jbhIrBS4bDlIrO/p/uOBt0TWrgkxrXZBBYJFYSCc
         6UAioJvP/nMD6V3vcFGKn/8eJc6MW0kGtKpPy7mgHi43eDDFWijXoAz3W/wdK24XuTAs
         eqHLps4WKGCAtyGrCh7c/kAp3cTrpmonCtpk+zDggsTSkkHXttzMAZaHbqMjAzRhVTIZ
         lL4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713333331; x=1713938131;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GFEArMgjntqkwBsQ8Jqp7knuVJcH0gTLIC6dZnr7v9U=;
        b=cATOYZLmHiWOMeWvApp6gQY1wuVbvANbyY86K+matAvrhRy09GuUIIT7+LsvaGa9Qs
         2rIxe+p7/WtY0o1jZAG3oriJwSTmwoROvVYd9hpOx2pcSw4hbMWWhzgNVC7Cn+6Bvs4m
         wi5AvOqldR7tOXZZ/ZagvflNOv7W9j4pmlf55L+XpNTETSSiuvO+SbEka7e2HXRTBwp/
         YCHvVgMETjv8vgI9ET8qYCK7LW5oIT731sXeQXo7PIRXj85BfecZtZuZ0xwZLwraNj6U
         NGh8Bni9IFmOHV3oYFhgO+ko8P7vfYm3FMStTLLLtIFf4Nc0apvA9wNENA6VnSvj0+Mq
         0r6A==
X-Gm-Message-State: AOJu0YziisxPuCTUMRFuS1JM1g9ZTU/NnQwT+lAZA4bQZvIlaevoNLtR
	HkHB4vSxfvfFscSeachtVCu42sp07Trapp18d+iJx8s5Rn862ULbqIjL9m9nNQ==
X-Google-Smtp-Source: AGHT+IGuCw1TjN2wmY0lZgLOR+O8S8fqDpJUSd9iTunZ9+Y9MdNOxiV/S+Hn2L9VhtUHOuw5NxBobQ==
X-Received: by 2002:a17:903:1105:b0:1e7:8d21:7fd7 with SMTP id n5-20020a170903110500b001e78d217fd7mr7878383plh.28.1713333331107;
        Tue, 16 Apr 2024 22:55:31 -0700 (PDT)
Received: from L-17494.kpit.com ([103.189.135.30])
        by smtp.gmail.com with ESMTPSA id x9-20020a170902ec8900b001e426094bbasm10692308plg.289.2024.04.16.22.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 22:55:30 -0700 (PDT)
From: Nikhil R <nikhilar2410@gmail.com>
X-Google-Original-From: Nikhil R <nikhil.r@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	nikhilar2410@gmail.com
Cc: ranjitsinh.rathod@kpit.com,
	Nikhil R <nikhil.r@kpit.com>
Subject: [oe][meta-oe][kirkstone][PATCH] giflib: Fix CVE CVE-2022-28506
Date: Wed, 17 Apr 2024 11:25:23 +0530
Message-Id: <20240417055523.237264-1-nikhil.r@kpit.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 05:55:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110036

There is a heap buffer overflow in DumpScreen2RGB() in gif2rgb.c.  This
occurs when a crafted gif file, where size of color table is < 256 but
image data contains pixels with color code highier than size of color
table. This causes oferflow of ColorMap->Colors array.

Fix the issue by checking if value of each pixel is within bounds of
given color table. If the value is out of color table, print error
message and exit.

Signed-off-by: Nikhil R <nikhil.r@kpit.com>
---
 .../giflib/files/CVE-2022-28506.patch         | 40 +++++++++++++++++++
 .../recipes-devtools/giflib/giflib_5.2.1.bb   |  4 +-
 2 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/giflib/files/CVE-2022-28506.patch

diff --git a/meta-oe/recipes-devtools/giflib/files/CVE-2022-28506.patch b/meta-oe/recipes-devtools/giflib/files/CVE-2022-28506.patch
new file mode 100644
index 000000000..221e10811
--- /dev/null
+++ b/meta-oe/recipes-devtools/giflib/files/CVE-2022-28506.patch
@@ -0,0 +1,40 @@
+From 368f28c0034ecfb6dd4b3412af4cc589a56e0611 Mon Sep 17 00:00:00 2001
+From: Matej Muzila <mmuzila@redhat.com>
+Date: Mon, 30 May 2022 09:04:27 +0200
+Subject: [PATCH] Fix heap-buffer overflow (CVE-2022-28506)
+
+There is a heap buffer overflow in DumpScreen2RGB() in gif2rgb.c.  This
+occurs when a crafted gif file, where size of color table is < 256 but
+image data contains pixels with color code highier than size of color
+table. This causes oferflow of ColorMap->Colors array.
+
+Fix the issue by checking if value of each pixel is within bounds of
+given color table. If the value is out of color table, print error
+message and exit.
+
+Fixes: #159
+
+Upstream-Status: Backport [https://sourceforge.net/p/giflib/code/ci/5b74cdd9c1285514eaa4675347ba3eea81d32c65/]
+Signed-off-by: nikhil r <nikhil.r@kpit.com>
+---
+ gif2rgb.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/gif2rgb.c b/gif2rgb.c
+index 8d7c0ff..d9a469f 100644
+--- a/gif2rgb.c
++++ b/gif2rgb.c
+@@ -294,6 +294,11 @@ static void DumpScreen2RGB(char *FileName, int OneFileFlag,
+             GifRow = ScreenBuffer[i];
+             GifQprintf("\b\b\b\b%-4d", ScreenHeight - i);
+             for (j = 0, BufferP = Buffer; j < ScreenWidth; j++) {
++                /* Check if color is within color palete */
++                if (GifRow[j] >= ColorMap->ColorCount)
++                {
++                   GIF_EXIT(GifErrorString(D_GIF_ERR_IMAGE_DEFECT));
++                }
+                 ColorMapEntry = &ColorMap->Colors[GifRow[j]];
+                 *BufferP++ = ColorMapEntry->Red;
+                 *BufferP++ = ColorMapEntry->Green;
+-- 
+2.25.1
diff --git a/meta-oe/recipes-devtools/giflib/giflib_5.2.1.bb b/meta-oe/recipes-devtools/giflib/giflib_5.2.1.bb
index 79afe9a70..011ca1ffb 100644
--- a/meta-oe/recipes-devtools/giflib/giflib_5.2.1.bb
+++ b/meta-oe/recipes-devtools/giflib/giflib_5.2.1.bb
@@ -7,7 +7,9 @@ CVE_PRODUCT = "giflib_project:giflib"
 
 DEPENDS = "xmlto-native"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/giflib/${BP}.tar.gz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/giflib/${BP}.tar.gz \
+           file://CVE-2022-28506.patch"
+
 SRC_URI[sha256sum] = "31da5562f44c5f15d63340a09a4fd62b48c45620cd302f77a6d9acf0077879bd"
 
 do_install() {
-- 
2.25.1


