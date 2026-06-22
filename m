Return-Path: <emailaddress.ashish@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF93ECDB471
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 07:02:08 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37642.1782111728652549438
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jun 2026 00:02:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cYl4cbf9;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: emailaddress.ashish@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2c77d52bec4so4539915ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Jun 2026 00:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782111728; x=1782716528; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rwpqwqV/pVbSp8BrDToNQfmUpidokusocn0mTlPIjNw=;
        b=cYl4cbf9T21krNgkyBkjxh/rXvjMZtIc++vYsNiHMTLPOrm1MmkcpcPmG/OflDjqMb
         s4CrHZcwjxVTsNGQZ0EK/AVhBVY6rQQJHzgv9Rkge1JjCOkj/Kw2m3oX6lBUDT12JxRx
         UIXqt18Gzz1xRSsuMnYaAKsTlLBZFT7tJfAgm8Wtc9YJJgil3Vfwxot56HJanoxk8pVL
         sLieqTc0sUdcvs0h+PRpYycVLS4ZoVMnLdWGgX6iC13xwS0u0Qxpo+dD36+bGamW41OG
         5ssXlSX7zI6JjsabB2Sp4xO0kd3hdq53veHGdO/STmkMQLOTjcEPRGG9m4JKKmb9vSjF
         zkLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782111728; x=1782716528;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rwpqwqV/pVbSp8BrDToNQfmUpidokusocn0mTlPIjNw=;
        b=gALjWcM00Ca165FAsoMMdfBLhroibVyMM61lIa4h1ZhykzDyYLcKhUHs0qmpZGgjbS
         MLDHcc+nj0H/7fynaW3/ypDOi3aTKYzyEfGlPm4SaIsUyqVcnh/mfsRQoYjfJaTeqAlC
         TtfnOkqbSjc//nPFgY1L2/YPYSixwY3d6y7LHMXFNjA21KbXG+zmyRazK7UULZHUANRY
         En9hpUlex7Av9R7OZh0l122CtaRjWzwZt6REwaMsoQ9SMMZCgd09tLoKN33AQ1Kmr4kk
         VY7vvtnc3GbwDwuPcv4BCUorrGOvnM4iDYhC8bEQramqTZYD7Ro+j+LZ+NAhYVOTiD6f
         85Mg==
X-Gm-Message-State: AOJu0Yx/pM/5IdNnDuuTfhHUcS9nrfPDIsXEJMskB3AOBJM96rb7pCaz
	CCODuqKoKNdA6SXeSP4lQBhy9CXfI0CJeklQbgktTMCkf2ccIh9Uxlga9rr8yA==
X-Gm-Gg: AfdE7cmiCEAi1dt+PxE05NNMJF2mASq1oFBBjrtfI/nY0S039lci5WHReeV8ZV6h7Ec
	WDQ6Pz8sSoNmHKJRfEQeKyxQjGMj4YplxjXDnTJPOzReKie34tH9TCBT3czuGh16MnNN9S89uMz
	5Mvz0bxYCLlZCSkyxOA5+UrquaDwJL7MMb6keAa5Nq8n3x0LcmjK2fZ1lASjxk1RerTA2G+bkNc
	OY66xsaUA1c++pFlpBh2zm470x3KeaxYjmNt56SHoCk7enneuIpwOD20KLNqHOfUJB1LXTPTC67
	Xlz83YBaEa39/u3rc2fEtAjoHkaJFebCUVPciJHk56ganMA0yLko4EHxtvWQy3Vk0lq3YqOwlnV
	5jJbEeaMUhOe+8uMBBfxBvLLkAr37k6ldU7qGr3qqOt7ycIITTzvvz/021XxsaZkCnA==
X-Received: by 2002:a17:902:cec5:b0:2c7:14ec:8ccc with SMTP id d9443c01a7336-2c71952da57mr120620595ad.8.1782111727962;
        Mon, 22 Jun 2026 00:02:07 -0700 (PDT)
Received: from ashishkumar.. ([2406:7400:94:3c8a:7ad5:cc83:3bb9:2d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7436d5bd6sm78523735ad.22.2026.06.22.00.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 00:02:07 -0700 (PDT)
From: AshishKumar Mishra <emailaddress.ashish@gmail.com>
X-Google-Original-From: AshishKumar Mishra
To: openembedded-devel@lists.openembedded.org
Cc: AshishKumar Mishra <emailaddress.ashish@gmail.com>
Subject: [meta-oe][PATCH] android-tools: switch DEPENDS from libpcre to libpcre2
Date: Mon, 22 Jun 2026 12:31:13 +0530
Message-ID: <20260622070114.170139-1-emailaddress.ashish@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Jun 2026 07:02:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127687

From: AshishKumar Mishra <emailaddress.ashish@gmail.com>

libpcre was removed from oe-core in commit-057cccd957

Migrate the DEPENDS to libpcre2, which provides the required
functionality and is actively maintained.

Signed-off-by: AshishKumar Mishra <emailaddress.ashish@gmail.com>
---
 .../recipes-devtools/android-tools/android-tools_29.0.6.r14.bb  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_29.0.6.r14.bb b/meta-oe/recipes-devtools/android-tools/android-tools_29.0.6.r14.bb
index b3a3f78254..9d76fab08d 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_29.0.6.r14.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_29.0.6.r14.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = " \
     file://${COMMON_LICENSE_DIR}/BSD-2-Clause;md5=cb641bc04cda31daea161b1bc15da69f \
     file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9 \
 "
-DEPENDS = "libbsd libpcre zlib libcap libusb squashfs-tools 7zip googletest"
+DEPENDS = "libbsd libpcre2 zlib libcap libusb squashfs-tools 7zip googletest"
 
 SRCREV_core = "abfd66fafcbb691d7860df059f1df1c9b1ef29da"
 
-- 
2.43.0


