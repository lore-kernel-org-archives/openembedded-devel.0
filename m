Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DACDC54E4A
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 19:24:52 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.2364.1709839490741756332
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Mar 2024 11:24:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NJ+Uswfc;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6e09143c7bdso1055197b3a.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 Mar 2024 11:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709839490; x=1710444290; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OsDC5u5d4983tt8pfLca+2X75j8scDuYXIGarsi2Leo=;
        b=NJ+Uswfcn0wjNLyfuJL0fX/SzJ28Ds+fidJ4I/e1tCBpuksEi2jcS/pxjOEOJUlnWm
         ayAAjZdN4hb2QqRG9+TTsDdf/eVuNNtgclntp3EU3qnQmFUEZGLKKfFmDSKZS7KIcqOD
         dBRS8y5J1bbD2X+5LKCmZyZdgo3SEJ9iboKFzFKEcWeVPyD8Hu7897Du+ObkKDhaQN8b
         bzYCQSAcUjgqoYIAS2+0I0K65ghUiBHRVFx1l8bVPMf/2K9kXGduBApZ8PZJtyD6u4r+
         xou6qUDtMIDY2did45AclorD8um0nDx/2q6xW6H7Drld16/yh8y+VwAColEweL9etXct
         3m8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709839490; x=1710444290;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OsDC5u5d4983tt8pfLca+2X75j8scDuYXIGarsi2Leo=;
        b=NcoWO+M46WC/fnEz98i4D5CorB/0ubnVCRPzfM610MUqisp6wNp3eCPqWn1EOJ0Y2u
         WAqBveg/ZMGYlcc8+oViStHZtlRRwKStru/R83gGydjvo69Nu+f963SHE5AWnhbu6YXX
         IeRE2cO9yd6rIP8vikUDiUJ9wDqHWcjYPwOSx7bFYATACvLRP1PNDrrlii9Ac6yKUWLl
         Lt+vpzI0bPGYDBTYyYguMFI9GP30zuJFzgn3U7dbJMxMqeNu95SFzkrKX7ZawcodUitV
         pZKRwvrRInSffu+KgEyjnDTWfVVFl4HXae2A4Ueef0Q7xjXiaERFWY7/gtS/S3MdC8EI
         wtGA==
X-Gm-Message-State: AOJu0YwCeb3wTvdWCS9WfyG0Y2H64LbyIX2JRETlKGJpx6Dgetfp8NPA
	rRZGM8i0JyUJ0gwnUV9NPtUugwqM5sI0TsmOJj4WaVp6dBwOxY7mElE2uGMQ
X-Google-Smtp-Source: AGHT+IFIRmIB1yR86Li++toAaaxriB5K4kw2gog/8e+UfhD/CRYw3ldgyd46zRb7k1loCGsBdyUhHA==
X-Received: by 2002:a05:6a00:3d44:b0:6e6:46f2:d4c8 with SMTP id lp4-20020a056a003d4400b006e646f2d4c8mr8755074pfb.23.1709839489882;
        Thu, 07 Mar 2024 11:24:49 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::682a])
        by smtp.gmail.com with ESMTPSA id r19-20020aa78453000000b006e4dad633e1sm13273727pfn.177.2024.03.07.11.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 11:24:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Alexander Kanavin <alex@linutronix.de>
Subject: [meta-oe][PATCH] libosinfo: Fix build with libxml2 v2.12
Date: Thu,  7 Mar 2024 11:24:47 -0800
Message-ID: <20240307192447.1772513-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Mar 2024 19:24:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109206

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex@linutronix.de>
---
 ...rror-struct-constant-in-propagate_li.patch | 32 +++++++++++++++++++
 .../libosinfo/libosinfo_1.11.0.bb             |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-oe/recipes-support/libosinfo/libosinfo/0001-osinfo-Make-xmlError-struct-constant-in-propagate_li.patch

diff --git a/meta-oe/recipes-support/libosinfo/libosinfo/0001-osinfo-Make-xmlError-struct-constant-in-propagate_li.patch b/meta-oe/recipes-support/libosinfo/libosinfo/0001-osinfo-Make-xmlError-struct-constant-in-propagate_li.patch
new file mode 100644
index 0000000000..467c6b4baf
--- /dev/null
+++ b/meta-oe/recipes-support/libosinfo/libosinfo/0001-osinfo-Make-xmlError-struct-constant-in-propagate_li.patch
@@ -0,0 +1,32 @@
+From 5bbdd06503456784c5ffa22409e8bab50470d673 Mon Sep 17 00:00:00 2001
+From: Michal Privoznik <mprivozn@redhat.com>
+Date: Mon, 27 Nov 2023 15:11:45 +0100
+Subject: [PATCH] osinfo: Make xmlError struct constant in
+ propagate_libxml_error()
+
+In libxml2 commit v2.12.0~14 the API changed so that
+xmlGetLastError() returns pointer to a constant xmlError struct.
+Reflect this change in our code.
+
+Upstream-Status: Backport [https://gitlab.com/libosinfo/libosinfo/-/merge_requests/155]
+Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
+---
+ osinfo/osinfo_install_script.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/osinfo/osinfo_install_script.c b/osinfo/osinfo_install_script.c
+index 5800f37..303245a 100644
+--- a/osinfo/osinfo_install_script.c
++++ b/osinfo/osinfo_install_script.c
+@@ -769,7 +769,7 @@ static void propagate_libxml_error(GError **error, const char *format, ...) G_GN
+ 
+ static void propagate_libxml_error(GError **error, const char *format, ...)
+ {
+-    xmlErrorPtr err = xmlGetLastError();
++    const xmlError *err = xmlGetLastError();
+     char *prefix;
+     va_list ap;
+ 
+-- 
+2.44.0
+
diff --git a/meta-oe/recipes-support/libosinfo/libosinfo_1.11.0.bb b/meta-oe/recipes-support/libosinfo/libosinfo_1.11.0.bb
index 68d917ffe9..8ef7ac3df0 100644
--- a/meta-oe/recipes-support/libosinfo/libosinfo_1.11.0.bb
+++ b/meta-oe/recipes-support/libosinfo/libosinfo_1.11.0.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 SRC_URI = " \
 	git://gitlab.com/libosinfo/libosinfo.git;branch=main;protocol=https \
 	file://0001-meson.build-allow-crosscompiling-gir.patch \
+	file://0001-osinfo-Make-xmlError-struct-constant-in-propagate_li.patch \
 "
 
 SRCREV = "ca9dd5b810dc04ea38048ae9be491654c8596ef9"
-- 
2.44.0


