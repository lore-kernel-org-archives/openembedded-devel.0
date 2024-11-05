Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1130D2B939
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:36:49 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web10.19584.1730817405037400999
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:36:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c4rqlFRw;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6ea7c26e195so36629297b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817404; x=1731422204; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m5HmB3zBwqhMqiO/eSLAtnhXesnnIzYkAiYp3kLF0ZU=;
        b=c4rqlFRwxgfjknHryS5yZqsMAnVR/ADctwvoprs5Lbh8tRCx2AfCJjhF/6FWr+l2Tl
         CL1DNE9+iAE2mp0fQoMHnCLfNoaTzHKrBib1vGoAqjK07RDFNu7OSwaHoTAsQhEe829F
         uxuMCYnACSzpOWImvumKj0HHcGr5SQk5JFEqOBHz0WT2aKIOJ995OoRsWJiTr1AwyI16
         XSKs1/P5/pDVAyoi7Rjy11o1Iyecj/49lzrwn1TMZHPjhoHKjXZeZ11/Df+VUJhKC4fL
         uDpfYHTGixIJpQRdOz5EkGnPLrmZEpPXE7hLO5eYc41fD7DI6hvR0Oe15Cu8i0EyKuWa
         cJRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817404; x=1731422204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m5HmB3zBwqhMqiO/eSLAtnhXesnnIzYkAiYp3kLF0ZU=;
        b=Ce0QShz0uyZGRTdL/KI1FoyzIdbVH3Oml/gJ7piGHCq8KJ0mUDV6foZKHD7C2xwPJv
         BJBA0btuOiAA+2lZS/2dfAFfJKPFbNy2Btlkyq4BFe6PU5sZkakFB4nQDtRK9tNSUPl9
         xnfSOeyG+s3IqLfKmYqqx78t3OhPHlqYZ+LXfYMu8vXNvspcSEWFMNCNUtFHADKy10Gj
         RvdS4rEfivdy6E/mL+H9zlq+dDEZHS0HVP9gUM2DCnzqFlB1We2rSmKPhKkNrnUcg1aT
         M9L+khVzY7fA5gIV1GZpDduIPiSQU2H7qZPYZAEvyd1b0uEWH2sCwMWANscYKlQjSQcv
         NaHw==
X-Gm-Message-State: AOJu0YxUYiNMu3aZspWdzJN0x0QFVQrsNFc0sj/ZZlYPY4r3uuP7vX+R
	h5gitY4iE/Ze1d0gK+dQ39RXVRb9kFvAoBXimrtMCBEOdE9yH/wtB7Y23Q==
X-Google-Smtp-Source: AGHT+IGHFEKWFDhzkBab6GQcd4MZj18NHrlKiZ7Fteo+iFMY9UBPAeXWzF9L841AcxN7ZJjTtAs7EA==
X-Received: by 2002:a05:690c:6905:b0:6e5:9d3c:f9d3 with SMTP id 00721157ae682-6ea52551d82mr207921327b3.41.1730817404105;
        Tue, 05 Nov 2024 06:36:44 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:36:43 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 11/90] python3-greenlet: upgrade 3.0.3 -> 3.1.0
Date: Tue,  5 Nov 2024 09:34:36 -0500
Message-ID: <20241105143638.2301245-12-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:36:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113429

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Adds support for Python 3.13.
- Greatly reduce the chances for crashes during interpreter shutdown.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-greenlet_3.0.3.bb => python3-greenlet_3.1.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-greenlet_3.0.3.bb => python3-greenlet_3.1.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-greenlet_3.0.3.bb b/meta-python/recipes-devtools/python/python3-greenlet_3.1.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-greenlet_3.0.3.bb
rename to meta-python/recipes-devtools/python/python3-greenlet_3.1.0.bb
index a79db00492..11e8a76c8d 100644
--- a/meta-python/recipes-devtools/python/python3-greenlet_3.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-greenlet_3.1.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT & PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e95668d68e4329085c7ab3535e6a7aee \
                     file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
 
-SRC_URI[sha256sum] = "43374442353259554ce33599da8b692d5aa96f8976d567d4badf263371fbe491"
+SRC_URI[sha256sum] = "b395121e9bbe8d02a750886f108d540abe66075e61e22f7353d9acb0b81be0f0"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


