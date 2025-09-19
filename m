Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8973DCAC59A
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 13:59:47 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.17305.1758290377660546197
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Sep 2025 06:59:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ibUZd6bv;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b264afcc5c5so89216066b.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Sep 2025 06:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758290376; x=1758895176; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yNX49QwzuXR9REpl5oMeEtT7//XMs6L/4A1+xqijXBs=;
        b=ibUZd6bvRbLtjqcOWyrfOCa5UGWinpXcJmFWOS5pUIig5qULDaTFXUV4j7q6BjQJ/x
         g/nkAs4MFLuFYaWvrdGRr1O5BcR6wcyK7J4cOPfChF+n+R+ehEJZmti7Wf5Q2V9IKjeN
         2z9z/1Pa9eL68q9IcBwDPz/fiFxxnRMi/HCtIKw4Zs/Rfg+pAN1LYwjrEsk3vOuR78Dy
         ufsDCebuSCyH3b9h1pqrTzRIBCQciWbafv8TdJT/3u+o4rby4c/OcPJeVMiMrmu6UP/V
         dfCkwHZEQA6JVLlpaz89CUSO869ZGijmTyzfGeaAZIiWjXMZoYYToar4bEIv0eHkskGr
         lxlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758290376; x=1758895176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yNX49QwzuXR9REpl5oMeEtT7//XMs6L/4A1+xqijXBs=;
        b=ieJnoaqBjaG6KWde51+xNSps8tlduNR7olhMHrtQ+701YH+iCxvQlXiedbsMBEsYAz
         fPcnqfBNuj+81t+kot2xT522hk5niazE6mfEGlHOx4HTEW89f3ojK32FUrhv82d/4V0h
         03T/BhJJoeJQ/P5TatQdrdaMpKdjgRuY5UfBCvcBHl37i0XFsLjmdIVHPFO1ZQmu3lU7
         R2qSZRBSjiq09r+9dtaiXsP7a/GdnKenbP+RrqLfps5MFpMJwqxIp277ZlCY0lgpw7zu
         GPrLrb+Q3lSRjiG6t0crqK4Q+hCn6y9cYMBrluZc5xcsCismOZ1Ztlg97LfXRlayhe35
         TD+Q==
X-Gm-Message-State: AOJu0YxQ7vscStW7M4XtG6oGi5Youfs2DrT++d9IMjNbcPtPz/YEeD3E
	spyjVPslfe5jCvncxQybox/yzQ0xXXCXwvQO+ErHxJhDudpNGI1kZAv/FyCqqQ==
X-Gm-Gg: ASbGncslD+07sOOYJpxPMBrDsv/x5neFUS3dvadLauNlaQ5nwW/BIluHltWsXKVsoMm
	HhmmQaprkbNHtRp8FHbDJML7eZA34cA35obOJ4uDWFgX1lrsDxWSjxiuujfC1RCTnSF97GsNcGJ
	/LVtB/Vs6LF7xnx3RsOFOsjJfkYQdG0O10qg5uPj/u9HRuvH/g3ceNS5RM3IfPSzhuvGWBXiSs0
	6fnRxTcZW7T2jJjkCBkWR/4vxZenm1VolYNo2rhXlwDq23Hg9V8UfUCsH52zz/+icc2YdxxkOKq
	PzxnD8ohK7XdWo/jlF6N5CVjJMTbAluNL4u7pfmDKlWlp8gCimQnnGAP74G+VILznP3d7PFEIk/
	44V+e5/CJSHEd8wAe8Y7+GtQ2wwBh1Hs=
X-Google-Smtp-Source: AGHT+IHIUyTPQbTvGrs28x+eF0UHmFOUBLeWCKkVFwiZf9zBtAgxc/gjf8tgXS+YPoiEt6OC9blQow==
X-Received: by 2002:a17:907:97c2:b0:b21:6dce:785 with SMTP id a640c23a62f3a-b24edd52400mr315826566b.1.1758290375887;
        Fri, 19 Sep 2025 06:59:35 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fd262993asm442209166b.94.2025.09.19.06.59.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 06:59:35 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 3/9] colord-native: upgrade 1.4.6 -> 1.4.7
Date: Fri, 19 Sep 2025 15:59:25 +0200
Message-ID: <20250919135933.916848-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250919135933.916848-1-skandigraun@gmail.com>
References: <20250919135933.916848-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Sep 2025 13:59:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119600

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Move-the-function-cd_icc_create_from_edid-to-avoid-u.patch
refreshed for 1.4.7

Changelog:
===========
- Add various hardenings to the systemd service
- Always close the ICC profile when loading fails
- Avoid destructing LCMS plugin twice with lcms 2.14
- Do not make state files executable in tmpfiles.d/colord.conf
- Fix a double free spotted by Coverity
- Fix an error check when parsing the DTP94 data
- Fix a -Wincompatible-pointer-types warning
- Fix potential crash when reading from broken Huey hardware
- Set FILE_OFFSET_BITS explicitly
- Use a 64-bit time_t
- Use thread context for Gamut Alarm codes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f016f77796504de03a4148a13383fd9fd5754a73)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...the-function-cd_icc_create_from_edid-to-avoid-u.patch | 9 +++------
 meta-oe/recipes-support/colord/colord.inc                | 4 ++--
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-support/colord/colord-native/0001-Move-the-function-cd_icc_create_from_edid-to-avoid-u.patch b/meta-oe/recipes-support/colord/colord-native/0001-Move-the-function-cd_icc_create_from_edid-to-avoid-u.patch
index aae2be8c1e..a120b73114 100644
--- a/meta-oe/recipes-support/colord/colord-native/0001-Move-the-function-cd_icc_create_from_edid-to-avoid-u.patch
+++ b/meta-oe/recipes-support/colord/colord-native/0001-Move-the-function-cd_icc_create_from_edid-to-avoid-u.patch
@@ -1,4 +1,4 @@
-From cbb8f5c05fce1d56ae2e5fa9f57fc49c47bed5ab Mon Sep 17 00:00:00 2001
+From d16aed3118bee1e0a7d0bc9e0f34c427a405a6d8 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
 Date: Sun, 12 May 2019 21:58:02 +0200
 Subject: [PATCH] Move the function cd_icc_create_from_edid to avoid udev
@@ -89,10 +89,10 @@ index a5e2328..dec509a 100644
 +}
 +
 diff --git a/lib/colord/cd-icc.c b/lib/colord/cd-icc.c
-index 8beec43..398ff7a 100644
+index 3937d8a..daf6f4d 100644
 --- a/lib/colord/cd-icc.c
 +++ b/lib/colord/cd-icc.c
-@@ -3114,68 +3114,6 @@ cd_icc_create_default (CdIcc *icc, GError **error)
+@@ -3117,68 +3117,6 @@ cd_icc_create_default (CdIcc *icc, GError **error)
  	return cd_icc_create_default_full (icc, CD_ICC_LOAD_FLAGS_NONE, error);
  }
  
@@ -161,6 +161,3 @@ index 8beec43..398ff7a 100644
  /**
   * cd_icc_create_from_edid:
   * @icc: A valid #CdIcc
--- 
-2.20.1
-
diff --git a/meta-oe/recipes-support/colord/colord.inc b/meta-oe/recipes-support/colord/colord.inc
index 0ae1a30fe6..cafbaaa696 100644
--- a/meta-oe/recipes-support/colord/colord.inc
+++ b/meta-oe/recipes-support/colord/colord.inc
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = " \
     file://meson.build;beginline=3;endline=3;md5=f42198707d793be58b274d34fd5238c3 \
 "
 
-PV = "1.4.6"
+PV = "1.4.7"
 SRC_URI = "https://www.freedesktop.org/software/colord/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "7407631a27bfe5d1b672e7ae42777001c105d860b7b7392283c8c6300de88e6f"
+SRC_URI[sha256sum] = "de02d9910634ae159547585cec414e450f711c27235453b4f9b38a9f2361a653"
 

