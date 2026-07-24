Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A28E7C53213
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 02:14:56 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11436.1784859290176827737
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jul 2026 19:14:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VAUTT9Ob;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38e69bdb0fcso1000177a91.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Jul 2026 19:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784859289; x=1785464089; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lrvWDDX588htD7ZZv3cnGKqJx0FOUBmDjSQrmEQtwRo=;
        b=VAUTT9ObwYxQInDxMptFxJN/Dool2uGmaIPXbgL6pq/m+IWUiACihXAMBe2kFboAU5
         3xgMIdXjGitfpcnoAnFsQqrbxLuQPNZJzW+VZGpdw0F/GCOj32sw+qZFoMp4qZXCY6+E
         vk/C+huEqjjRAJiJsBfsbzoMCnHmXow9jupG0nk49ljdTYQMnE7nxe9jPN+qa8Zk/ZFf
         5sEZH437l1bkYrd5keruZYTTtVE/z5s3p55VqoZQwkWQ2QtEWXXijZT0Sc0zr9BeXYP9
         b6SsabHcm6ysDYdEzqIbSZtdW+u4Yqq6oZWhm4QeJuL22gvr8KG3dOciOeG22pViHRGO
         7GBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784859289; x=1785464089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lrvWDDX588htD7ZZv3cnGKqJx0FOUBmDjSQrmEQtwRo=;
        b=V0t3xFkHawESujaTdARQqhItrPxzNyN9C9ubCbYCbzJNR/VCs/UJWQ59IavhfdZY1g
         OI+xPbbZdb1aP7aFnw80JYM5VyD7hTRp18QnN78ztzXZmeYVTsnVT0J/nrgrHxca4ZJU
         HD6iEQhM4ybL+4iUTsb3+1N/9C1/JEU1kJ8blp9MOsu2W7zQWY7ISm+pPKVKiuZOiBIR
         xxMk3Ww9caSwT+02CDoML6w5hwj1HDRHDFCSPhN3JlIXcegTujrTafkTgBEznJrF3WZb
         9JQhR0/do+G88b+pn4yO000o5Gaafwi2nXHqwWS8qLgvYe4LN54xah1KoFsfMmlJtGcr
         lRDQ==
X-Gm-Message-State: AOJu0YwMmDY+SCasImuk1/59+er8GY6B8DgLDxUDh8j4Fms3JWqx2pEQ
	CCVjJzvAjWyOFPzROqyd0/NN/gRBWHA8+jvMEJSZu1f7QmuQH+fSM55kRoccDFtm
X-Gm-Gg: AR+sD109r8kTe8kVfHEprEBbj04p6FxRKU46i1rzVtR8H6fZBYs7lvLzwGy3/ux/CQ7
	2TraVs+GmqlAxowe750hBKF/+0kC1/Pa7cadx9ZbVQtosIuh2oVTdR1aoK+muvhte+P2QSffTS5
	p6qU0H6djnIK9MBSoTJZGLKxHMqKCsRuSunbU4kBuu9pe8kSluuZnZtBhLlrpDTdvy4FO1IqknA
	LJUtJFqhC3pgBDLjPJiHM7SrqCXvvdVA6wocrxDiZUCHxcoanH/lqtc3W+ALFcTGalvsmCDhK/F
	ZCOT2uinIjj9JlQNYIloAhll3MGSbTvo4db7dW3bqcIRnpWT8KTVu9vhr7X7SOxi/Zhmmotw4R6
	eOO3XBHN/WpgEmO9PBieIgiaYSoNWED4A6iHKZvV5sXZ6GWbfsnWTb09n9W5BiLOf08LmvB3zbd
	BKlOHakzMV8fmG19Q=
X-Received: by 2002:a17:90b:3888:b0:368:ed26:15b2 with SMTP id 98e67ed59e1d1-38ec69574e6mr5610676a91.8.1784859289495;
        Thu, 23 Jul 2026 19:14:49 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d1300401fsm26824794c88.3.2026.07.23.19.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 19:14:48 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 11/13] libraw: upgrade 0.22.1 -> 0.22.2
Date: Fri, 24 Jul 2026 14:14:05 +1200
Message-ID: <20260724021407.2840261-11-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724021407.2840261-1-ankur.tyagi85@gmail.com>
References: <20260724021407.2840261-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Jul 2026 02:14:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128433

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/LibRaw/LibRaw/releases/tag/0.22.2

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libraw/{libraw_0.22.1.bb => libraw_0.22.2.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libraw/{libraw_0.22.1.bb => libraw_0.22.2.bb} (92%)

diff --git a/meta-oe/recipes-support/libraw/libraw_0.22.1.bb b/meta-oe/recipes-support/libraw/libraw_0.22.2.bb
similarity index 92%
rename from meta-oe/recipes-support/libraw/libraw_0.22.1.bb
rename to meta-oe/recipes-support/libraw/libraw_0.22.2.bb
index e134d93cbd..2db0c14a61 100644
--- a/meta-oe/recipes-support/libraw/libraw_0.22.1.bb
+++ b/meta-oe/recipes-support/libraw/libraw_0.22.2.bb
@@ -3,7 +3,7 @@ LICENSE = "CDDL-1.0 OR LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=1d66195044cfbe4327c055d1c9c1a229"
 
 SRC_URI = "git://github.com/LibRaw/LibRaw.git;branch=0.22-stable;protocol=https;tag=${PV}"
-SRCREV = "b860248a89d9082b8e0a1e202e516f46af9adb29"
+SRCREV = "b93f6e45c194f5df9b02a43b1af9a54b4f41f33f"
 
 inherit autotools pkgconfig
 

