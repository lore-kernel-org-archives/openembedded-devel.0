Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F03FC71136
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 13:56:22 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.18766.1750166850418951023
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Jun 2025 06:27:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=bSMHA+pK;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.128.41, mailfrom: dario.binacchi@amarulasolutions.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4531e146a24so35169775e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jun 2025 06:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1750166849; x=1750771649; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RGzqlUzGyBchGq4Pbj9h+pBJRk4rwy0LNzjA9eRbLtA=;
        b=bSMHA+pKXXum8fL38z/gXOnoKH9nWMzavB5OXRnva/d0+6RI12+IPXuT8gX/tCoW65
         VvN1kwpbYqrgM4wGLmGB+AcGbFkdvzzzs/XLpdDa6fDfhTBqUiVBH/m732ieyaexpGhU
         NSTyV5x2rn8jYK63LoQQQioTM6SgA69IcKr+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750166849; x=1750771649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RGzqlUzGyBchGq4Pbj9h+pBJRk4rwy0LNzjA9eRbLtA=;
        b=bbZsIDc1ODkEaT0XHZl0W7gkwbaWdvpI7Be8qdWvA+orfX7dl/jcxxcoDl6k/p0rf/
         4Raaincb0YOXmYOpDbmOSvKUBRYFVizWYUGQIhvjsMS5178Yq4GqD0Oir2mKlXWczB+c
         Wyhub5MbTBp8tXfTb4lCj80s7aqN49PMiVzjoir1oIn/66RsWcUYFNq7H4LFlh1yHXVD
         6xorucSmPCKGDADRmzQ6ro4yEFXGJNNrODcrEvKRtY3938kV/tkyLQvMpIVUTKoPzu85
         1k0HFKyf/ilvHIT32sVuYYd1OXL8Ws6lKT4Lsb1msypzTfoII0GeqcBu47g2eF5x5ET/
         ToLw==
X-Gm-Message-State: AOJu0Yxne5uxLQdN8U8fRjp3inr+CJ/BdVjGpk3PgINjtP6MX726N1NV
	pxXXkvOYM4wd4xkS3mg7TllXNXyN4efaY5yNKYDEqLTgSLK9qNEQnl+p8Qd1M7MGBy8lQWTcwoU
	d8Pg5
X-Gm-Gg: ASbGncsBbwMDXnk8y60QEO2A0rq/8i1WwfsQg0+E+Qg5HWIn/EOdy7bI76G6QHXNuwQ
	ejGBN+DNJ5J7ZM0+uaO3giMyI2+RnFlQSVphWzPP+HcMjFvjGbnBh/fmXdMryI3ZBJp8GhF1HAZ
	SX+y1VY5YvPARzIZtp4ZFzMl/nFUWwI5+NlB6horPQYv6nef2DDeMW6pQmIExbReAzR+QqrzH7l
	rHvrmJdbOp9cAvYkjA8VkLqayv0FmgTmtR0VcULKd3hZPlNoFxVd49MmTCRXH4u6ycqsQo4XgWV
	pPUFWUuggTmF+gbe7/L0Nv5k3OD/B02F4fCHlZGVNzDzRPWSjyiAyZ9fgBlNQF3hyF3vjbyRx8o
	uNLGE3hEJkzDW2w7mB302NJljcA==
X-Google-Smtp-Source: AGHT+IGxMJfGSu/DOF2KYuLlAL5l4679g8sJFIRFqzhJ1AwuyK2HsenEH3sDiAmVb7rwLUNs/WquKA==
X-Received: by 2002:a05:600c:a02:b0:450:c210:a01b with SMTP id 5b1f17b1804b1-4533caa641emr131585635e9.17.1750166848696;
        Tue, 17 Jun 2025 06:27:28 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.93])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4534394c90fsm98926135e9.3.2025.06.17.06.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 06:27:28 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: openembedded-devel@lists.openembedded.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: [meta-filesystems][PATCH 1/1] ufs-utils: upgrade 6.13.11 -> 6.14.11
Date: Tue, 17 Jun 2025 15:27:24 +0200
Message-ID: <20250617132724.1048900-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jun 2025 13:56:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117925

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../ufs-utils/{ufs-utils_6.13.11.bb => ufs-utils_6.14.11.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-utils/ufs-utils/{ufs-utils_6.13.11.bb => ufs-utils_6.14.11.bb} (93%)

diff --git a/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_6.13.11.bb b/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_6.14.11.bb
similarity index 93%
rename from meta-filesystems/recipes-utils/ufs-utils/ufs-utils_6.13.11.bb
rename to meta-filesystems/recipes-utils/ufs-utils/ufs-utils_6.14.11.bb
index a6cacdc3c082..d57b5be1468a 100644
--- a/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_6.13.11.bb
+++ b/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_6.14.11.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 BRANCH ?= "dev"
 
-SRCREV = "538b147481ee0995afa3dc57443efd4366acdeab"
+SRCREV = "5539a8ad8e1a9b7ea8b62213ed72eb939c5381b7"
 
 SRC_URI = "git://github.com/westerndigitalcorporation/ufs-utils.git;protocol=https;branch=${BRANCH} \
           "
-- 
2.43.0


