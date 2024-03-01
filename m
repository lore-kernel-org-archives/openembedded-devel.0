Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C75D3C5475B
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 17:45:55 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
 by mx.groups.io with SMTP id smtpd.web10.29967.1709315147227849298
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Mar 2024 09:45:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WieUSj8O;
 spf=pass (domain: gmail.com, ip: 209.85.166.179, mailfrom: raj.khem@gmail.com)
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3651edae0a1so9470055ab.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 01 Mar 2024 09:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709315146; x=1709919946; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dl1CyCJKCbX7unOLBgmRSI4JelO9gPA1HL51uwC6s6E=;
        b=WieUSj8OPy87vwI7cmHksRoqkLwapzQeK3OXxusvX74jUfCfWLYGzjJmbidF0LvvNn
         ZY7KM2LONlodoT2lsfE2xJYgdGWmzEnzgwHD5xu6kHkHfjhQVemf8vdX6zmeJIb3jjBR
         co0W9+oO9aiJuB8gxojr+V7r4MLpsKCx2cOCNFNJ7jmIfyBE0cQN3mGxjwsknf/ZrGfr
         RvqtDxYjItlq+/MCSyf7abhJ4asRDrgUhgQvR7MMPomSE7MXHNeOAjZu7crK6HuHBXbA
         l+KgdvMny3ti3shAeGfAA+Ih+Mkhqo9faxfltnS/u5prZ/dNHN7as0HovlZ2cdDnQ5/7
         ak3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709315146; x=1709919946;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dl1CyCJKCbX7unOLBgmRSI4JelO9gPA1HL51uwC6s6E=;
        b=U0LosA/SP3juaUil1eFbqO3rZ9lcloWvLu5OrrU3cCtIZIrQjkR1wSYreRBjjncYQS
         A1ruvWfa+nlhjZki4NeCvVnSUh+tLz2HZJnOKV3aDsMRW37uPInl92SQcwXzlVkn1b0E
         KobMjQsp6VF0qiANq01CvkqYSSCGT+Gl7HWiA0xhVVmxSVi/J8ykcSg5eq2U7R/Gfuol
         iXlJ86O5/k+HLXKUiAQ64f5mGHfGev6OdyQbSGW5mK91Z5dU2HQFY/rZJ3dvJEGpezAD
         gZ4S1yCvdQ700cW+Pm3yPhfNN0oSr6kHqdHGfcaDSeGVQ2ZFYy0SV7oYSEGg3CtjfosP
         V8pg==
X-Gm-Message-State: AOJu0Yz/YQAmlzmOQ75FqzbBaFabhDwnjyRAe9cz7FV/BpdDVtl4HV+6
	mNTsWB95dguR9y2uK0AmR+5djdQjqdIWPfBZlqBjSDreLpJmJYtmFRzjWzUz
X-Google-Smtp-Source: AGHT+IEhp/TW67bn6dTa0gCO0hO9U+oH/skx6EMpVqiiiUmCYfxZABO0svaHixP1EOwn37iN22KxLA==
X-Received: by 2002:a05:6e02:1c03:b0:365:ca35:6ca9 with SMTP id l3-20020a056e021c0300b00365ca356ca9mr2820169ilh.0.1709315146133;
        Fri, 01 Mar 2024 09:45:46 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::8bcd])
        by smtp.gmail.com with ESMTPSA id 30-20020a63195e000000b005d67862799asm3247340pgz.44.2024.03.01.09.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 09:45:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [[meta-filesystems]PATCH] fuse3: Make kmod as a recommendation instead of rdep for ptests
Date: Fri,  1 Mar 2024 09:45:44 -0800
Message-ID: <20240301174544.2064606-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Mar 2024 17:45:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109081

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-filesystems/recipes-support/fuse/fuse3_3.16.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-support/fuse/fuse3_3.16.2.bb b/meta-filesystems/recipes-support/fuse/fuse3_3.16.2.bb
index 7964621b58..2b0797a6f5 100644
--- a/meta-filesystems/recipes-support/fuse/fuse3_3.16.2.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse3_3.16.2.bb
@@ -33,9 +33,9 @@ SRC_URI += " \
 RDEPENDS:${PN}-ptest += " \
     python3-pytest \
     python3-looseversion \
-    kernel-module-cuse \
     bash \
 "
+RRECOMMENDS:${PN}-ptest += " kernel-module-cuse"
 
 do_install_ptest() {
     install -d ${D}${PTEST_PATH}/test
-- 
2.44.0


