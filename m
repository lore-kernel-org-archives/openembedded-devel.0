Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A228AC433F5
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 22:55:58 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web08.4284.1634338557062929847
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:55:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=2hmeH4oz;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.52, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f52.google.com with SMTP id i24so46538826lfj.13
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=moruFQPgSOVxEM1EYmT5iexH8L4aB0w81Pg3Cdxcf0Y=;
        b=2hmeH4ozsk1G3ZH/O0lwlgbxJ394b7I/wBDzjc7j9EBQfNxFV0VPo+ZxObPPFj5Aca
         9/ajm0+vShHlixzUOjjJZZ2ARdp9oU9GyaS3THhKGsHG7wPiaHciY98ZqCV9/iCYnjBQ
         gP0z/lA02OB/0rRY3xXyGmMqGKTYw8JMsANYKW9cWiawGsEK3IXUbfsUvzbszxahUDib
         MgBvbNJpdAizwjXsi1/+Mujr0IZx0HvcG8SERSbneDbGan6985hAuvwv07DiaUSwxI6w
         BCqfavvALFIwMdZieLOE4fNnboXY7QZzh2PrkuEWdYRgitrLjjtHKKG6AJ3vSZ3/xVr/
         PwDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=moruFQPgSOVxEM1EYmT5iexH8L4aB0w81Pg3Cdxcf0Y=;
        b=QLMHhS9w05cw5Hn3mj9IMNVXDK41I9QgAkiTW0Kf/jzX/OJRDhcycG+vAbmS5aC+L9
         0PaSoKYlV3k3FYPgbai8abVJUOpaweMjiSYhmO1P2ZBY41AlPN4ccD3+30T8gGI0SBkW
         tfKFkL9czTmmc2PDrMjqx6eOZjY0dV1JLkEMiVe6n8Bxt5dtxh8NDXCJodrAmxIomHVD
         Zs08y0A2KostS/+c4tilaWavgaZ5jb+z1W+LnYAR+OJoP/WmKtfoWbBPOzUdxknfCLcZ
         efDGPbwyiYt/28H+DaFQFGx1YSqESvW3lU8B06z8ugXagLyst4nkcbLyGq/vWG0lSk1b
         miRA==
X-Gm-Message-State: AOAM530dLz3DoSPO8N3dv+CphDr1ue+tQDSf73GVSjYz0bjMEuDiRfpH
	JH/ZluCzX3PkCRN5+3MNX2J7m3TZK98Hx7I7
X-Google-Smtp-Source: 
 ABdhPJzlQvI4uU5ItTj0PAxrcFYLLmhPS7mqHyzZiftLyHdN13IHhtphAZe2xyqi9VeEhyuzhVZBGg==
X-Received: by 2002:a05:6512:214b:: with SMTP id
 s11mr11596736lfr.296.1634338555042;
        Fri, 15 Oct 2021 15:55:55 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id v3sm698985ljv.7.2021.10.15.15.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 15:55:54 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-ujson: update to 4.2.0
Date: Sat, 16 Oct 2021 00:55:53 +0200
Message-Id: <20211015225553.4161966-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 22:55:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93342

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../python/{python3-ujson_4.1.0.bb => python3-ujson_4.2.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ujson_4.1.0.bb => python3-ujson_4.2.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-ujson_4.1.0.bb b/meta-python/recipes-devtools/python/python3-ujson_4.2.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-ujson_4.1.0.bb
rename to meta-python/recipes-devtools/python/python3-ujson_4.2.0.bb
index d8e83c58a..3dbfe44fa 100644
--- a/meta-python/recipes-devtools/python/python3-ujson_4.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ujson_4.2.0.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "UltraJSON is an ultra fast JSON encoder and decoder written in pu
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=10fa10456417c0252bcb8a498e498ffe"
 
-SRC_URI[sha256sum] = "22b63ec4409f0d2f2c4c9d5aa331997e02470b7a15a3233f3cc32f2f9b92d58c"
+SRC_URI[sha256sum] = "fffe509f556861c7343c6cba57ed05fe7bcf4b48a934a5b946ccb45428cf8883"
 
 inherit pypi ptest setuptools3
 
-- 
2.25.1


