Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A212AC433F5
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 22:58:15 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.4221.1634338694415733368
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:58:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=f0JUFuxO;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.47, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f47.google.com with SMTP id n8so47489116lfk.6
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4+FZJMa3krgj/KkxLh2Cej1aVsjJX3O6GMVvNOdBrY0=;
        b=f0JUFuxOz7fQ8HdN0D8Jjg7AhZHf4Xf0CMRXdtbyeAkXzqFjyKd0l8SFeuyAoJGpM7
         /J4awI42clPVthwFZ+crpEOgcuxZU7RRCTFP11OYakhRWeQZUp9UASBXB1utgZMssQYb
         E3Nq6ibh5egEuKdtfzTEvnZthm8mD9Eq5dYHvmvgSjduZ5ps/M9VOArppGvtzTEynSVk
         zxuwT0UxTpH7EYIjcY4ltc6QZYk3S/TYN/MIU/D10urOr/Hy2B0aM/Vc7NwUy+Xfg2cY
         arYSEV5rcYPXv16hNjsZcxaNZpEo8of53FCNpTCX1ZTZcVryRlS7P38v77YM4gcXs+bv
         ih9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4+FZJMa3krgj/KkxLh2Cej1aVsjJX3O6GMVvNOdBrY0=;
        b=xfEcwXjbIj9kAQDdofnnS8nCBu6NCqsMzkGXCZE/lf9P3yC7ek+lusGGfZu1Bgu8pB
         1O4sTE0SzLaFgVTdlDgKw638E6Cr0o/+X75Im10r+E4iwuzuIex/ENGxRpSGTHe8cHIL
         0Y91dEfXSWI6g/aSaoOBe+E1f3jg1SPvmzi7ZTX9/UK4VSIQJ0L3U6skV0yc5OOUrbKB
         3UDnCDrL3cENAQQiYqfooHYqAi3RHmNYtLN4hse0/Poar4xZPMjZqd4TRo0k4HnwYBrQ
         4TIR/U2zGsebL4lG+Gets3Ql627CsFcXM0pUV020EKYlxb9LJoh9W4mEof/iQA7CU7hS
         L7MQ==
X-Gm-Message-State: AOAM533m3dGGlSfD/Xxo7QmYJw257A+fleuY+C3g4eKjtrukTROOMiGT
	7l89MX/MSS5FvmybOsDHZZpXUicN7cOaMg==
X-Google-Smtp-Source: 
 ABdhPJxY6JQ0ukrHd3dT7GUFxW3ZRz0+9uFtmep0hbL/Jc3Z8uQZUaZ1o/f3rxbpc5nVWTkMW9SYow==
X-Received: by 2002:a2e:bf26:: with SMTP id
 c38mr15651503ljr.523.1634338692500;
        Fri, 15 Oct 2021 15:58:12 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 e8sm654388lft.308.2021.10.15.15.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 15:58:12 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-google-api-core: update to 2.1.1
Date: Sat, 16 Oct 2021 00:58:10 +0200
Message-Id: <20211015225810.4164316-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 22:58:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93374

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...ogle-api-core_1.31.1.bb => python3-google-api-core_2.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-core_1.31.1.bb => python3-google-api-core_2.1.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-core_1.31.1.bb b/meta-python/recipes-devtools/python/python3-google-api-core_2.1.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-google-api-core_1.31.1.bb
rename to meta-python/recipes-devtools/python/python3-google-api-core_2.1.1.bb
index fe0aebb52..34489af72 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-core_1.31.1.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-core_2.1.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "108cf94336aed7e614eafc53933ef02adf63b9f0fd87e8f8212acaa09eaca456"
+SRC_URI[sha256sum] = "646d9399c3c478fe475cfe523e84572ab31a340814ea977fb2774eca5a6549a2"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-asyncio \
-- 
2.25.1


