Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86E26C25B74
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 20:34:13 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.2049.1717101245841005114
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 May 2024 13:34:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m/rA77ZY;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-57a32b0211aso152373a12.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 May 2024 13:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717101244; x=1717706044; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tQeBgh50BaFP+MepI+zr2wepqcBlbKj5ptHVncYUpxY=;
        b=m/rA77ZYey4qllp+5uuoyvdspQxCpIOKMOUWy06hlOuc94coOVQIsCvVojUKdy/N1u
         ijcKyjMoHAnA5nEOIXy1Xgj0Uz36T5MSS007D9NLIhomoCPQtNdz3wte62OSkisTEJla
         zMGyqtQkMXqA3SjuQEOTBvxEaV37V7JUVXwACahCaPT8tHZq3BcWpLL3CCMM0ExjcftP
         2VSDnye/J7N7uThliQbYKLII50ds0mNhan3Q9iBl76LcgN77EipTfAkBBYsaVgT1hGwT
         aHAndVhIsEiX6jyIivQnCeNEMlYIPP+tM+sJR4Dkq27UbJaPbw8dGNInJrE1hql2AXpU
         V0gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717101244; x=1717706044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tQeBgh50BaFP+MepI+zr2wepqcBlbKj5ptHVncYUpxY=;
        b=QYUpdrkZljtpEL95B83/iy09aIne8hHdQqWWyrLlvsQIJo0YYgr6d0tzleXzrMHxKK
         ljcUfAC6Qv89QQrahlKJtMlOIoVz22mExuKWSL5FfjuHbw+I0hFZJYqB0Yw8fQGc2TFW
         xGs6iZbXO9eeiEu5TS2Lp8H2/00carDnMyuVzOTtQ7MtUzRlRdPxRLDED9rLpqV8ZtYl
         YN9ranSIPK/tmGSMUbRAj1Lawq6G5hqOti/H9n1lRBZS18x13iGlThBtVYHWUq7MEY0O
         tSuTdYGViiJsFCs3Ju2b14Jm2IozfUMAPTZkcqcyI3ll5czwB2Fse3B0dXejqqw+u00H
         5cIA==
X-Gm-Message-State: AOJu0YwTbLowcbA5mfOgr/VKqzTTVPfrgCmOVY6v1wvp65/atrv3WDdc
	P92LKbbca+4ACteI9IhZL/C74rtwzYTZk4wBOERIQhL2/ms2cgK5jQuvuA==
X-Google-Smtp-Source: AGHT+IHSfS4aICAOlB9BdZ4pDsxXqyUIq1ckhxTif6wr0sCR/Ple3yUG9pcfjItiocljshm0aUVyaA==
X-Received: by 2002:a50:d498:0:b0:57a:31a3:f4e6 with SMTP id 4fb4d7f45d1cf-57a363c0bc8mr40631a12.2.1717101243797;
        Thu, 30 May 2024 13:34:03 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a31c9c17asm186493a12.92.2024.05.30.13.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 13:34:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] lvm2: restore Upstream-Status
Date: Thu, 30 May 2024 22:33:49 +0200
Message-ID: <20240530203349.641537-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 May 2024 20:34:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110648

* accidentally removed in:
  https://git.openembedded.org/meta-openembedded/diff/meta-oe/recipes-support/lvm2/files/0001-implement-libc-specific-reopen_stream.patch?id=cc4e9fbd823a9af1f6b8f622ce86d62172ee9ade

* fixes:
  ERROR: QA Issue: Missing Upstream-Status in patch
  TOPDIR/meta-oe/meta-oe/recipes-support/lvm2/files/0001-implement-libc-specific-reopen_stream.patch
  Please add according to https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-status . [patch-status]

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../lvm2/files/0001-implement-libc-specific-reopen_stream.patch | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/lvm2/files/0001-implement-libc-specific-reopen_stream.patch b/meta-oe/recipes-support/lvm2/files/0001-implement-libc-specific-reopen_stream.patch
index a064516e32..e11ac5ac08 100644
--- a/meta-oe/recipes-support/lvm2/files/0001-implement-libc-specific-reopen_stream.patch
+++ b/meta-oe/recipes-support/lvm2/files/0001-implement-libc-specific-reopen_stream.patch
@@ -13,6 +13,8 @@ http://git.alpinelinux.org/cgit/aports/tree/main/lvm2/fix-stdio-usage.patch
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Dengke Du <dengke.du@windriver.com>
+
+Upstream-Status: Pending
 ---
  lib/log/log.c      | 6 ++++++
  tools/lvmcmdline.c | 6 +++---
-- 
2.45.1


