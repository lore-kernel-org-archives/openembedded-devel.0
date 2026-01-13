Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4D81D29DE7
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 19:53:04 +0000 (UTC)
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.68402.1768333976830728900
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jan 2026 11:52:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gum9xl/9;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2ad70765db9so455450eec.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 11:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768333976; x=1768938776; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0TBTr1O8aw97MvVf6QnmHSFzB1atP0XJVPqRZHKG5iI=;
        b=gum9xl/95qnB+ETLnCo69hqEZTWJ+pcXbs0d7GHVBvJ1uDrVkTqvDuaS0/v+wX4kvf
         mcqYU6k03U9U0L1zdXAG09yY9OfgM87uDIvhLgyJddkFoeU2sl/4EKHyDHXOWjEoWMkE
         uLdbJf300XgkCahj5hk2U5EsprNfwlXY9K5C3gj4T1HahQiz6ElfNm4hpHNVdKFh5qcG
         ap+3Xr7jO4Q9ysqXd+lCbhqWmEwQ/ZI1wp7uoRAqv0oVMLFIFn0QRh+1zYRXDidgRiBR
         8USNV5RZz6PEf4rScovcGFqQznmojRh0AT+iwA3FBfxtV4HyumOXcMmNYvLWIBtFoEVf
         Unzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768333976; x=1768938776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0TBTr1O8aw97MvVf6QnmHSFzB1atP0XJVPqRZHKG5iI=;
        b=qWZGa5YsZVY14vd8btM8imQapvxx5IFauzjMkFzyPWFT/qAm4CCngFgOKftL3gWR4K
         MrDCIJVvmVnc53MGhRFR7k1BBbGx4rhUxbfgLxJAR1Uf9JGEaes+tEsUU/EIBS+QNo0y
         QhUxGPk4bcZFdchQZOuGnyJRwDsTNX1uXhzpEAsqYNLndW5NPLPE85jiqWv7TEPOs67d
         DlTARHq2Jb/vHdDVZmfeClaLAY2LilW89nEVyDJ6/0oKv1uITNdgeNjVvV3jEOHSyWS9
         AUx3/fO2kIiCzhD8uw0GcnKCbRj+GboecdjT4XH2MqrtEoTv46Zu3YmLNjqC5gXCUxeg
         vZRQ==
X-Gm-Message-State: AOJu0Yxik5CmX2oGfmF+j474fDtOPW0wzMToCIjBEPPtd4NgZXnjtZrz
	RsDxue+Gx+pPCM2e8SVFdW+hYTy0rppKd+T7CVoE1O2jMLP0dsUYqFSs0uBMtw==
X-Gm-Gg: AY/fxX5SgxdYCq/QFEIBEj7+yfrU2XaFu7dhfMpHVEjUgAG2o97yZk3zLAk5VWfKtWy
	6PeKjUyvt8E0TMT1moyo585CnMy/jLZPHPn0JWK+PCBMfFw6WqP/ARLHJweNiub9nXJxnAftPT8
	5WoSxG9BQOERQjypVI7Tct8TI7dprpMuVWfEvKNsF0R6SDzOGvw2lpnyZ+1LL+QOT5Lwc5yLLR2
	wt7uf+dsSaEFfX58rcmrNwpIbtlkvuHMaTbUvYADx6gIIxhROG7KWrr7u4IZNp04lJQM1j+BsPY
	jpdhB7Q1/T9iB7poIWKhrmdsINSDj2U+DPsEAgdkYT5DSXRsbqzGOGJuxdoHR25e+TnmFPHPLtt
	59APhGstSIiJpXBA4Zdab2qUIdyZETd8diH4FfZ31MiibdkJ7k2Rw72lwA2bsGRjsguAhxTSoqQ
	UT3AHcR+5mKfnAUlvZTu4nilHobl/3waAZfv1VbJxpPAZQcxiy6vXBaF3yFB3RaUDY21O/paXXb
	HMMF7+pkY+PPwWvIyqXwk1pX8MhCZU=
X-Received: by 2002:a05:7301:650c:b0:2ae:56dc:eb18 with SMTP id 5a478bee46e88-2b4870bd51cmr175235eec.21.1768333975909;
        Tue, 13 Jan 2026 11:52:55 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::28b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b170673bc0sm19095381eec.5.2026.01.13.11.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 11:52:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] re2: Upgrade to 2025.11.05 release
Date: Tue, 13 Jan 2026 11:52:52 -0800
Message-ID: <20260113195252.4150384-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 19:53:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123441

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../re2/{re2_2024.03.01.bb => re2_2025.11.05.bb}            | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/re2/{re2_2024.03.01.bb => re2_2025.11.05.bb} (94%)

diff --git a/meta-oe/recipes-support/re2/re2_2024.03.01.bb b/meta-oe/recipes-support/re2/re2_2025.11.05.bb
similarity index 94%
rename from meta-oe/recipes-support/re2/re2_2024.03.01.bb
rename to meta-oe/recipes-support/re2/re2_2025.11.05.bb
index a510545bab..91306b3621 100644
--- a/meta-oe/recipes-support/re2/re2_2024.03.01.bb
+++ b/meta-oe/recipes-support/re2/re2_2025.11.05.bb
@@ -3,10 +3,10 @@ HOMEPAGE = "https://github.com/google/re2/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b5c31eb512bdf3cb11ffd5713963760"

-# tag 2024-03-01
-SRCREV = "2d866a3d0753f4f4fce93cccc6c59c4b052d7db4"
+# tag 2025-11-05
+SRCREV = "927f5d53caf8111721e734cf24724686bb745f55"

-SRC_URI = "git://github.com/google/re2.git;branch=main;protocol=https \
+SRC_URI = "git://github.com/google/re2.git;branch=main;protocol=https;tag=2025-11-05 \
            ${@bb.utils.contains('PTEST_ENABLED', '1', 'file://run-ptest', '', d)} \
           "


