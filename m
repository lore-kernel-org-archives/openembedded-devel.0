Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95E88C5B572
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 05:37:41 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.924.1787117853216944095
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2026 22:37:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UdzC3adZ;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ced3386430so5358235ad.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 22:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787117852; x=1787722652; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=px4Gq2ZfA6UAnG4FSjAoI8WEbLkkpX6+W02bCofDgI4=;
        b=UdzC3adZVlf3JfSw098yqqsM5+614oDC9Y7roYOlwEuA4hIoGLs1byJu20Bmv1nYKP
         IYq3SOLE9j05Gxj/ljM4tfVxOQgiw+AEIyNE+gXS871WHpNNI5F+GWSd0fD4rsg9CJjf
         fTjo75C5i/W3ndCEpH+mKnouwq0gulVFvFMCjAkP18N4K5UqlpUBgDxXNc2oFaCs/fNV
         TA3dd+YxOeuu4aoCioY1IAkFsM6fKksxVkH3nE7jhGd5HysXSZGQ5Gnt/O970SfxTLbn
         i3aTcML9Zd4yVYi7puPTz5PybWE9O2psbZwySms4dUZsy6Ae+vgLX0iJ4hV4FKz7Ikz/
         +q0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787117852; x=1787722652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=px4Gq2ZfA6UAnG4FSjAoI8WEbLkkpX6+W02bCofDgI4=;
        b=fWG1phJv1ClLfe50V6XeHJ3r/+w6Cehpsl6FKm/mk/HV5mP8LyWXnf6EC38olBpFKj
         t3T8GzQlSBeinAn35ryCUABIjZiq0N+mAdeUrAEuCpoKd7o7/NSBF68wSxnvpzx0hAHZ
         sM2tutAo2705z9MjbD8solRbr9uCwxGM5/ue2/jkYkaoNxaoIBmgiJwEzcftiEpFwv77
         fQikMDvlri6WM3yJ19gGmDT3IIAvSjeZuPyADCsmt47umVXtZ8em+7wthiwdf8bYFfY7
         gY/TS854svF71SAFdpVFv3nuW0oghYF4VWYTy77YoKZiAT6sTlF63VLswLgzxpp6Xvb9
         1jCA==
X-Gm-Message-State: AOJu0YwgmRzRXoUhpXPoX69fAFel0cw3jzem2k8It8GOvsumcpIOPEh5
	JNwUwalsX5GYlFvPXVUFxUGx+LY6rdXARRTiRWmvH8mFm1nE3Llrfr5l2od8Z7Sv
X-Gm-Gg: AR+sD12JRE06gAtOCkMmbxSO4PyF01BFumxtd5N+wBz+9j8dDX8aLWXZeLqYrUZr2ky
	6IW9CeVOFUQF44cE3AxRsTpyuaSHa39E4//qqTXKhM9AWkUNpI0ifQPaWPUTbXdaL70+1zMM4kO
	+p7WCfZQ7dL2BIgwQzCWZpnmCOUOcGLDf+kNzOym5oFjiFqGysF/gUsYiddz9k4VMZcY9IjoKCh
	1BigPPQ1y73ceJjfr6iiAkGVdFM/Jn3e1oMvQgxjTKC+91rzGkxlMbktvkCxGohL0JKeGkEFs4K
	3I3ZgxVfEzbolsCVNo6N5iud6rpF1SZ1t+kcDrf6vZHKu7tafsnN0knTg8G609HUh94xQ9XkrH9
	rhlnrJasT5Q/zc72qu04GEBKsQg/XjgfhekDrPibHTmLQPO/pyXnSdoj7MXkrCJdSza+Vz4ELKV
	xYAfnQiKf8i+qkfnL7HKyUC+z4ssgI/ZVSDfa2MTOHPefdd7VPkrTJS0F6Blrq3ryEN9dRuEGxq
	w==
X-Received: by 2002:a17:90b:5684:b0:395:5eec:b932 with SMTP id 98e67ed59e1d1-39580f6b704mr4319448a91.11.1787117852502;
        Tue, 18 Aug 2026 22:37:32 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416aea2429sm2830814c88.15.2026.08.18.22.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 22:37:31 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 22/25] mercurial: upgrade 7.2.3 -> 7.2.4
Date: Wed, 19 Aug 2026 17:36:26 +1200
Message-ID: <20260819053629.391864-22-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819053629.391864-1-ankur.tyagi85@gmail.com>
References: <20260819053629.391864-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 05:37:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129266

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Release Notes:
https://www.mercurial-scm.org/relnotes/7.2#mercurial-7-2-4-2026-08-11

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../mercurial/{mercurial_7.2.3.bb => mercurial_7.2.4.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/mercurial/{mercurial_7.2.3.bb => mercurial_7.2.4.bb} (96%)

diff --git a/meta-oe/recipes-devtools/mercurial/mercurial_7.2.3.bb b/meta-oe/recipes-devtools/mercurial/mercurial_7.2.4.bb
similarity index 96%
rename from meta-oe/recipes-devtools/mercurial/mercurial_7.2.3.bb
rename to meta-oe/recipes-devtools/mercurial/mercurial_7.2.4.bb
index 8559d2e40d..a517b3aa5e 100644
--- a/meta-oe/recipes-devtools/mercurial/mercurial_7.2.3.bb
+++ b/meta-oe/recipes-devtools/mercurial/mercurial_7.2.4.bb
@@ -10,7 +10,7 @@ RDEPENDS:${PN} = "python3 python3-modules"
 inherit python3native python3targetconfig
 
 SRC_URI = "https://www.mercurial-scm.org/release/${BP}.tar.gz"
-SRC_URI[sha256sum] = "1cb74ca95da021666b5a94a9bdc62f16255a6452f5a84cc2ae71bda8c7dbe36b"
+SRC_URI[sha256sum] = "85839e0f39e6cb893a88932aa36ef661759f3c5c5de4551ad26bd9df53cb71a2"
 
 # Constrain the version to digits-and-dots, otherwise the auto-derived regex
 # also matches the X.Yrc0 pre-releases in the same directory and picks those.

