Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B141C433F5
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 22:57:12 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web09.4280.1634338630256386043
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:57:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=Tjcf6pnU;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.42, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f42.google.com with SMTP id t9so46913335lfd.1
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IZMjLUy+O8DUL3zfoHkEpr9Ksj8ftGn+KecVQiydyuE=;
        b=Tjcf6pnU3CNpa1/90j7MqkfUHtkkXYvbl5iG21sa2zYEee8IzIA6SjozTRR686wl2t
         yBg+r6fi67HDoMAoMki05LK+pGXly4VHrNXSDjICPgMxpIFKrd0BldUI7c2Wt/2zDg4x
         d36Vw9xPJH4CfJpOYDxZEvW+A85yQRMCld/0bXJaxoJbH0NkjRNg2PWrFUwb0DumgZ35
         c4ZUcJyK0x19TPnFEl3tGR1aygCnrLJCg5PRGpzmRtY+gzDUI0Q1SXwd1p2pq32q+nfq
         ISumqyS2XkYhLBZuB43sKFTluejvgnrFweA5ztIC33RfXV8otYIHDhYuJlzIb5fF8idA
         rzfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IZMjLUy+O8DUL3zfoHkEpr9Ksj8ftGn+KecVQiydyuE=;
        b=mMKRpmFoskcGaEFGNlSsujbp4vnaHxbV8KtkZDwhZflovtKTD9ySQG5klMWB+MvoEH
         ivGvULKlOKnqfRCKz8ekKzJL2ekuizam/wPuH2J3bJuI0g7s5OversPY2vwEDXYr7s8j
         eLHIoHpF6lwHv8ApPjQ0lankjrUQTHZh+rxHtIlh8AehwpBUih0wCddmur9gdeYSYR1a
         bPawA1GLqQm2Rwhj3Z8eTfP1IYJgqwWx4LKC7qJr4tzCC0IgtfmLOJWR3qy/iYi4ZRb7
         d9iP9WtaivIryoUVeSg4v4RVBAiAkeZqvHZ55+OJ+fy9AuyEQo4MwQSCSRRYN0m0DDP3
         b72Q==
X-Gm-Message-State: AOAM531K9App2H/W4HF1I2yyomLamUTQ6hMqsK1d1I4qg7hgMSNIURG+
	aaplVg18q1APjEvbkcgAzilCOkHnAGkrvkU5
X-Google-Smtp-Source: 
 ABdhPJycF7C6p0ri3QZVFT8oz4+zX1K6crVGjQDZMXSejTl5lfC91pb0zzgsvGC5bx2RXK+8ZOgWCQ==
X-Received: by 2002:a2e:97c7:: with SMTP id m7mr15297798ljj.299.1634338628321;
        Fri, 15 Oct 2021 15:57:08 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 w28sm712562ljm.31.2021.10.15.15.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 15:57:07 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-idna: update to 3.3
Date: Sat, 16 Oct 2021 00:57:06 +0200
Message-Id: <20211015225706.4163560-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 22:57:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93366

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../python/{python3-idna_3.2.bb => python3-idna_3.3.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-idna_3.2.bb => python3-idna_3.3.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-idna_3.2.bb b/meta-python/recipes-devtools/python/python3-idna_3.3.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-idna_3.2.bb
rename to meta-python/recipes-devtools/python/python3-idna_3.3.bb
index 22f6402c3..a0e6b79a5 100644
--- a/meta-python/recipes-devtools/python/python3-idna_3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-idna_3.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/kjd/idna"
 LICENSE = "BSD-3-Clause & Python-2.0 & Unicode"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=239668a7c6066d9e0c5382e9c8c6c0e1"
 
-SRC_URI[sha256sum] = "467fbad99067910785144ce333826c71fb0e63a425657295239737f7ecd125f3"
+SRC_URI[sha256sum] = "9d643ff0a55b762d5cdb124b8eaa99c66322e2157b69160bc32796e824360e6d"
 
 inherit pypi setuptools3
 
-- 
2.25.1


