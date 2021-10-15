Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD00EC433F5
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 23:01:52 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.4344.1634338909590384468
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 16:01:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=RXerA+LW;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.44, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f44.google.com with SMTP id u21so44600448lff.8
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 16:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OhBlYf+CMFPJZSOQ48KwAm2tgLED3TxFH9BKmY/xNVI=;
        b=RXerA+LWUjYH9mxGp6Y/u6fpb3WLo+26xnwN/u+ASdznhwYxRbs8G7SMs2xcKvqqxE
         ZOANL3ZFzz5LPiK7FVHaz8wautBH4LElqo9HKtQ2uOCCha4yFKfKvacILNVbcuEbaQ5J
         qmsle9jKtXS1xbFPQ6x9xF6I4BTBRnXBoaf1PcC0QRjwpyio2XUVpTO8C2XvFwtw6gzG
         Odqih5cRBRR5x8vmR59pxKar2lGYEYuV3Ui+RiXe0LezDKRFTzQLd0QyCEv3f6vYib87
         NAkGHY6VvQdTSNdMLhMA4GVh8BWs0elt087AwGnCxA9NXKAR4rJcWggbhn5DOTZutTd0
         Bvkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OhBlYf+CMFPJZSOQ48KwAm2tgLED3TxFH9BKmY/xNVI=;
        b=B9zUHND/Sn/ax5DvDOZs1Duzgdhw6s1tZ9wK6iEZGAbS9M/FE99tsCB5YIdmj+K/WO
         frHdZXW7+H3QWcBAr+bZbSAEg8bYA/tRQ5jgTgmDwX/e2UUcCXz7LPF4m4DWde+A0Lit
         c1BazmhjTG5S3UGhPk4XslEDbwsq2dpCfPpfiN3llDOgFGRKLFNMnQ69Hi1ncNv99Rbw
         5RJZsEUpgBNuHYkV77KCkqFhPvjJMXCs84Z17fb/q2dr9YGNiPOiEjMYZRqC5VOR8tqR
         B0oOjXORGGLKdUOVjQ0LnwDsG2ZvdNTtBDzVYY+ai0fnQyVwukW0M7EwSye6B9IaUt6k
         N9AQ==
X-Gm-Message-State: AOAM531BC1sVNu21x/RKYgfeIZW9HXroAWX3jWxKkahdBj9V1ZPNujm6
	AQyggW6nJ22Jl4vbU2jl3+h3rIS5QQrIqUzg
X-Google-Smtp-Source: 
 ABdhPJy0rYieoLvNh2VE+HVsFONkpicfCUDCB1kzk4ez09c89CYDErj7iSlSfi2k4fXe9XjrhDy3aQ==
X-Received: by 2002:a05:651c:1549:: with SMTP id
 y9mr16325917ljp.105.1634338907287;
        Fri, 15 Oct 2021 16:01:47 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 b25sm654997lfi.151.2021.10.15.16.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 16:01:46 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-eventlet: update to 0.32.0
Date: Sat, 16 Oct 2021 01:01:45 +0200
Message-Id: <20211015230145.4165427-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 23:01:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93376

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-eventlet_0.30.2.bb => python3-eventlet_0.32.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-eventlet_0.30.2.bb => python3-eventlet_0.32.0.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-eventlet_0.30.2.bb b/meta-python/recipes-devtools/python/python3-eventlet_0.32.0.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-eventlet_0.30.2.bb
rename to meta-python/recipes-devtools/python/python3-eventlet_0.32.0.bb
index 80869a259..3848150e4 100644
--- a/meta-python/recipes-devtools/python/python3-eventlet_0.30.2.bb
+++ b/meta-python/recipes-devtools/python/python3-eventlet_0.32.0.bb
@@ -4,8 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=56472ad6de4caf50e05332a34b66e778"
 
-SRC_URI[md5sum] = "ebf5794e3f7a9f1778fb4f2a58eb7614"
-SRC_URI[sha256sum] = "1811b122d9a45eb5bafba092d36911bca825f835cb648a862bbf984030acff9d"
+SRC_URI[sha256sum] = "2f0bb8ed0dc0ab21d683975d5d8ab3c054d588ce61def9faf7a465ee363e839b"
 
 inherit pypi setuptools3
 
-- 
2.25.1


