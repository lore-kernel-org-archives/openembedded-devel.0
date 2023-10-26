Return-Path: <akash.hadke27@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B09AC25B48
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 14:18:57 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.71894.1698329934520475873
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Oct 2023 07:18:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OY/wuRu6;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: akash.hadke27@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6ba8eb7e581so211848b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 07:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698329933; x=1698934733; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ui52rn4RQ4KL3Z7+wiwz/efAsa//cKsiCFzYbUENCu0=;
        b=OY/wuRu6r4aJ2kcDqtdYcpYQ5yVNZMpdk8kzcgJJTMXmCrnr1ObPFp91/47xmfLA3e
         P6selTCm31RywEegroLVGSgp7c77rzFppyeF/olYv79Q1t4R23aG4BVTr4zirP99Hdu3
         90FrZI/WzGi9X714qg/hP9pLU0LOqakh4sOL4sVs/SLubXgbMvSIDHQg8c4pnCnajTmr
         Zctl1EUv4s77/AJwht2/YsP21H6A7HuRhfMgNydP2gee1jsuPJWvI9ed93N2PAVfNlNs
         bIbLooX1dOKr6t01a2x5vsjsOC5lvWdCnNyoq+ZgPiIQRlpOcHkLsgq8O02xLUxfh5/t
         2tkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698329933; x=1698934733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ui52rn4RQ4KL3Z7+wiwz/efAsa//cKsiCFzYbUENCu0=;
        b=ciHSluRQfUhlDkyBH5jewAF/UPuVdO4h9EPU186KIU6U/PzEc6Nyfm5Ie/o9BJSkuw
         9WSt0sDKyMJVP1N9RShxxEd+Xi6gxwb59pFI4uibATFpsh43M77K/YNZ7kHM+MZ1Wo92
         WIGVeSNMffKN0gAzjcq0xMLV+xRRIXDitnblDBBNLPfY3ew5YkmXe2BkkIWGd8ENUGnX
         0XCiCpdV+cC2bunlJc9MImT3/99MSvw5Yhr6DcDuUWerHpa8hf4hhIO4q4qX0H3pgGdP
         +4b4Fh8FIdIUyqbQESeJSvJww4bvJNY5KUsnbqsYHJNXiymnxZMc45A63AsLcuiSnMEN
         7cRQ==
X-Gm-Message-State: AOJu0Yy4l9YrA+APqr1WGCxVbqjUOy39AFMUDVJUxYl2SQLjJ1TSFDXS
	Xz+SJxb8WYCl0s50WiXa+WZitJRIYps=
X-Google-Smtp-Source: AGHT+IHUoluBmOdxy3k34CKdOw7Mc4twm8Q/ce268JyIZwnyY+yfaOXPehboPlSFXrXUUFXwVj2U+g==
X-Received: by 2002:a05:6a20:42a8:b0:163:d382:ba84 with SMTP id o40-20020a056a2042a800b00163d382ba84mr22238411pzj.5.1698329933402;
        Thu, 26 Oct 2023 07:18:53 -0700 (PDT)
Received: from L-18010.kpit.com ([203.192.207.62])
        by smtp.gmail.com with ESMTPSA id e6-20020a056a0000c600b006b58af8aae3sm11238643pfj.77.2023.10.26.07.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 07:18:52 -0700 (PDT)
From: Akash Hadke <akash.hadke27@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: ranjitsinh.rathod@kpit.com
Subject: [meta-java][master][PATCH] cacao: Update LICENSE to GPL-2.0-or-later
Date: Thu, 26 Oct 2023 19:48:16 +0530
Message-Id: <20231026141816.20520-1-akash.hadke27@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 14:18:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105753

As per the below test from
https://bitbucket.org/cacaovm/cacao/src/master/COPYING file
LICENSE of cacao should be 'GPL-2.0-or-later'

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

Signed-off-by: Akash Hadke <akash.hadke27@gmail.com>
---
 recipes-core/cacao/cacao_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/cacao/cacao_git.bb b/recipes-core/cacao/cacao_git.bb
index fef7f34..6b08a0a 100644
--- a/recipes-core/cacao/cacao_git.bb
+++ b/recipes-core/cacao/cacao_git.bb
@@ -1,6 +1,6 @@
 SUMMARY = "CacaoVM for use as OpenEmbedded's Java VM"
 HOMEPAGE = "http://www.cacaojvm.org/"
-LICENSE  = "GPL-2.0"
+LICENSE  = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 SECTION  = "interpreters"
 
-- 
2.25.1


