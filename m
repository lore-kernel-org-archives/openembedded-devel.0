Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FA60ECD98C
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 17:07:32 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26084.1770311251154144212
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Feb 2026 09:07:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bKS2a8Rc;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-482f2599980so13862315e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 09:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770311249; x=1770916049; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YdaocE1PVl8b1+1q37xJtnYedM+1D1QGY2gLwMpPOxU=;
        b=bKS2a8RcbLijQAHf4YMLe6ksFWIKpmP6wCdSj1oZbcOg1vCMmm4tKRAqkdvNrxRKo7
         BUhozO1NVYBboqRymXso0GwppZo8+WGHaWdjfxgIm+FcQVQk+vtxLMeD3Vvx3qS/ANaI
         Qv98+ngt8zjtGJAD6rsdJj57+MroqJe28oUDxBC0CKt68/kokL0Aw8xCO/ySHqS+0vid
         8ux71SMhu/D0ScK85WxrnG/t/+pLGcNm3fQkGPLdrOD7hhjxtLeDp5lV/cpzNIM269gS
         n6Hqr7moekQ13DOHnYCsIfGGzTtS2rIVqlpcejU2M4gGk2C7iEkCo9shZW7R/49nLLJf
         0BcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770311249; x=1770916049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YdaocE1PVl8b1+1q37xJtnYedM+1D1QGY2gLwMpPOxU=;
        b=jO99ot1tXZflE5bapMS7vl+wj2lOTaYvBoDPiht7a2KebMBWC77O50hHoVn2TP+sZv
         Lb/OvH7ZmwvwCqaUY7x6zGa3sA2qmwQEMqd6nOfet2hoSyifbAqcmnJUNqV9eyIsaOUA
         MzQzW60V7hUPM/T6K57rEDrJxSckKE8bvAehGTse2fDHID3qQg7maBOl2fH81HsM++Dm
         A1HhBsyXMf65wieN1wKQ55ksxLK7U8Nx6go/sDPV/JW/8cgcCRW0eetMYAGTUFkeHHV/
         QbEkclg+RGRYfp9jBKk7yZDGfQDxOPjdXcI5EPOAEXLSMO4RSBZtKO88zV5JH1+fiWLs
         68Ow==
X-Gm-Message-State: AOJu0YyCMTLdwfOXWYp1WxBRmDUcxfywTlfjbS9RgbSq6lVhyAAW474Y
	sUQ9YEL1bXs0GvC+gO0FdaWaOMs63eHe5nknGSxmKfo5ZrMy4NZsDkWCuP+TvA==
X-Gm-Gg: AZuq6aItYuNRVJiScHiJNjzwjsuIRasV8AUbN4lG92dUT6uGs5830adAbWzLUCW5px0
	VzLR1/KA1Odwx1JnVlOn8eIrjcmYjO9OUn5PcLncY1F4NMJcYv9JoU45m3laOx7FkB9mJ65Tw0g
	QadFtw62bfCwWeMef1LBX8ciXokIvoMiszRmPeK37VUuGDm0ZiE5Rmf2/2iEOdMHjL+enUfXTjY
	FHcImmA0tP7tTePbo9e5SjLKdma369RpuLpKzTnyhGkhwg45mj9377kqMn5OlCEFktvR3Fd3aJA
	p7vR9Er2XYnuXfrotgx++FQCllKDriAEMsFasJiiNVY88HThVZIHmjRxiNQIePAeYSbyrRTWAuM
	XE3/ISG6wFPVRSLPSbtgvc17l0UDym4T1GMGUT5hRpdbhdPVMhvlQO5/sr/k8kPUCRDlO4nUxFu
	kS+vCgk85U
X-Received: by 2002:a05:600c:5020:b0:479:1b0f:dfff with SMTP id 5b1f17b1804b1-483201e72f5mr1314575e9.10.1770311249301;
        Thu, 05 Feb 2026 09:07:29 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d4d030sm102237375e9.13.2026.02.05.09.07.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 09:07:28 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/3] media-types: fix RPROVIDES
Date: Thu,  5 Feb 2026 18:07:25 +0100
Message-ID: <20260205170726.2389904-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260205170726.2389904-1-skandigraun@gmail.com>
References: <20260205170726.2389904-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 17:07:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124216

Instead of PROVIDING mime-support, it should RPROVIDE the same package.
It allows adding "mime-support" to IMAGE_INSTALL to get a similar
behavior than before mime-support recipe was split into two differently
named recipes.

Also, rename the recipe's folder to match the recipe name.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{mime-support => media-types}/media-types_14.0.0.bb     | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/{mime-support => media-types}/media-types_14.0.0.bb (89%)

diff --git a/meta-oe/recipes-support/mime-support/media-types_14.0.0.bb b/meta-oe/recipes-support/media-types/media-types_14.0.0.bb
similarity index 89%
rename from meta-oe/recipes-support/mime-support/media-types_14.0.0.bb
rename to meta-oe/recipes-support/media-types/media-types_14.0.0.bb
index 137d508ebe..af91a584bd 100644
--- a/meta-oe/recipes-support/mime-support/media-types_14.0.0.bb
+++ b/meta-oe/recipes-support/media-types/media-types_14.0.0.bb
@@ -35,5 +35,7 @@ INHIBIT_DEFAULT_DEPS = "1"
 
 # Debian used to have mime-support package which was media-types and
 # mailcap recipes in one.
-PROVIDES += "mime-support"
-RDEPENDS:mime-support = "mailcap"
+PACKAGES += "mime-support"
+RPROVIDES:${PN} += "mime-support"
+RDEPENDS:mime-support += "${PN} mailcap"
+ALLOW_EMPTY:mime-support = "1"

