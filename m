Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2A6EC4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 13:13:27 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.31171.1701868403394751626
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Dec 2023 05:13:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jvWVvnBV;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ca208940b3so9469611fa.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 05:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701868401; x=1702473201; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vnnSyf31ycZqdqLK4B3fGdGTzCVRfxsgdK3XUW1ndXc=;
        b=jvWVvnBV7WIhqeWIQaB5xVElCi7eZT6OCxUlBFzh+11fq35vzAuLv9oAlvoRX2RMMU
         3gq6u8fEYTfTJLC7Xl0J6xm65fyxAbh+4ihbGhLihgorR2WgmQPW/WZWy4fHyCZY0tXM
         qz6tgD5KLiF9CLFxRCxfzJXkcsvT2nB4WWSMfHtvdy7cFhqGrGsISyz7ejqS9vtkxLnI
         kMnULby2CHqUQhrNUdJd75cRyciTL88rBq0FuBXHhzMleIVKObuYKCClUbVJCYl6BOBZ
         uFBp2ZfKkx7n6FVfZrMVMGvisLjOQiCMeT9Pz3koZDmaKre2pfd+5It7f5EsZsE7FhBo
         HjTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701868401; x=1702473201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vnnSyf31ycZqdqLK4B3fGdGTzCVRfxsgdK3XUW1ndXc=;
        b=piBJROlknKrwfurXhgQdvX/wqefLShSKSF58JBe88iss1ve427FqQw1fJ2ojDGh2G3
         /igO7KnEXCy5cjeHRTgHoUhDBqGIbgnrEiARPVa3inhArpw40F0bduZEUS9LA4BYe0n1
         7rIEfdUMOEDrMf14zYn9he2zhaPNXDFDEjFRPUHXI7qvSaW6h2eZtZoQHxYPXCo2twOq
         GfgB0PbSLX0IselfT7tYaL4O2op62qO4KtuTHJlTZpzuftRzuSCY+hlKYWGonr3Q9igt
         SMvrp9Qz6dObY+QdejLaKleO5FJzdiNtYPo5kUWMoI4Q6T6B/QI+IVtrKm9NB4umcHsh
         GtMg==
X-Gm-Message-State: AOJu0YwAsLaXfR+koM5nOLfli41Ri9QziWU5dXwxRkhwQnAY2KD2lCwN
	oErxNJWyQ9kLaHhKHYyfFzBWApY1z63ysQ==
X-Google-Smtp-Source: AGHT+IHZBql+9YSRb/RvPVWJIfkOZCCNWfnATY/7JGMygwHmsaBHqGHauk9pPptTAJB8HyBA6gxC7Q==
X-Received: by 2002:a2e:9d89:0:b0:2c9:f962:48f0 with SMTP id c9-20020a2e9d89000000b002c9f96248f0mr549241ljj.25.1701868400902;
        Wed, 06 Dec 2023 05:13:20 -0800 (PST)
Received: from localhost.localdomain ([176.33.71.251])
        by smtp.gmail.com with ESMTPSA id kj24-20020a170907765800b00a1c6e3e454fsm2428010ejc.166.2023.12.06.05.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 05:13:20 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCHv2] xstdcmap: upgrade 1.0.4 -> 1.0.5
Date: Wed,  6 Dec 2023 16:13:14 +0300
Message-Id: <20231206131314.303185-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 13:13:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107248

Changelog:

* Remove unneeded variable initializations
* Remove unnecessary cast of XFree() argument
* Use C99 loop variable declarations
* gitlab CI: stop requiring Signed-off -by in commits
* Build xz tarballs instead of bzip2
* gitlab CI: add a basic build test

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 I accidentally used gz instead of xz, I sent v2 to fix it.

 .../xorg-app/{xstdcmap_1.0.4.bb => xstdcmap_1.0.5.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xstdcmap_1.0.4.bb => xstdcmap_1.0.5.bb} (74%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xstdcmap_1.0.4.bb b/meta-oe/recipes-graphics/xorg-app/xstdcmap_1.0.5.bb
similarity index 74%
rename from meta-oe/recipes-graphics/xorg-app/xstdcmap_1.0.4.bb
rename to meta-oe/recipes-graphics/xorg-app/xstdcmap_1.0.5.bb
index 9d523bd7b..7d3aab501 100644
--- a/meta-oe/recipes-graphics/xorg-app/xstdcmap_1.0.4.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xstdcmap_1.0.5.bb
@@ -11,6 +11,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2b08d9e2e718ac83e6fe2b974d4b5fd8"
 DEPENDS += "libxmu"
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "da67142c128d18386ff145882e0afc66"
-SRC_URI[sha256sum] = "06898b3f1eaad0b205ff3c75bdefa3207868b889d4cb37b32b8267b2bbfe6f8b"
+SRC_URI_EXT = "xz"
+SRC_URI[sha256sum] = "365847e379398499ec9ad9a299cc47a0d6e7feba9546dfd4e5b422204b5ac180"
 
-- 
2.25.1


