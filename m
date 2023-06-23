Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA2F9C001E0
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 14:39:46 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.183.1687531181971493444
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jun 2023 07:39:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=EHVGAbZ2;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.49, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3fa7eb35a13so4356425e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 07:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687531180; x=1690123180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DnMK9d/HGvPq9qreyc3lS8PxBtpM/0QmbcJcMLvEf7k=;
        b=EHVGAbZ29fTjxHbjoHhe5ZYxZFQOG59fIuLUkeuKeQ//ZPlOQnw6V8eWGGtJy7L66/
         ljxGx9CgZ+rA/7SW0qiXwBBrIHqWlLsmkqhzRLp5v/MIjX5nPt7xRgBjtDrj/syOQPCA
         gnvRl8za3bj16ziAWB4QJMl7+JpW4FK7TWoKJ00UGj7D07O5RWsoPCKO4xKD1C6G+7fd
         7Ysj384obIPHIBta7MIZYXFz8HnU0cSYCJdkAUimQ3aMotPqP/jL8Fozsr89eOrvJUlF
         g3TkKMfn4T2LGLDpez7y9iKgfllJGxdRGpoFNnymC73Tr51rwPoXskIvD6jArKouI/Gm
         3J4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531180; x=1690123180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DnMK9d/HGvPq9qreyc3lS8PxBtpM/0QmbcJcMLvEf7k=;
        b=bOrBmHxDy9My+Mq+sCs0/LWxsihTMLuZkb7LyZ+VTaS9lCrrrp0l/OKQHY31UyMF3r
         c0lctwAdS+DCcSO6VACd4FJKOxeBzV64GJ2xvy9S2WOO2+GJJo7L/V2LoIObLWQc7bed
         T4cJLdQRBfeCNmezScPnkZUZ8ydSWYhxGh6BXPq0QrNHutTm1Q5jKr4NN5c1Q7hwRRNL
         KLDhwgQCQiyrFhdhbCofG6Dg/+boTLkrvGPoOvmzco9xLdpIL5TclZuOAmuTBbjwt8l4
         PWo82slaJCHTxRMbwnhsFqSQg0W1+/MaQlvFYMc0aE6Ugt+oyuq5zPH5BhHCO9B+ita/
         Aqow==
X-Gm-Message-State: AC+VfDxbKYjnblXc8usE0bQRbqanQgY8dUFgIEOhAlU3HSSE+B94b56G
	3QlNThy2XJLizOhnYjm1Xn8V8g==
X-Google-Smtp-Source: ACHHUZ6jj8oEqK3irXDYf3uE69kexzUmuswNeWAH8G/7BZ2jCsR/A7KwgHxYn8q6tvqL0DIDDxj9ag==
X-Received: by 2002:a1c:f70a:0:b0:3f7:34dc:ed0d with SMTP id v10-20020a1cf70a000000b003f734dced0dmr15360099wmh.25.1687531180372;
        Fri, 23 Jun 2023 07:39:40 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003f6132f95e6sm2526164wmj.35.2023.06.23.07.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:39:40 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 09/55] python3-paramiko: add missing run-time dependencies
Date: Fri, 23 Jun 2023 16:38:35 +0200
Message-Id: <20230623143921.146338-10-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623143921.146338-1-brgl@bgdev.pl>
References: <20230623143921.146338-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 14:39:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103505

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-paramiko_3.2.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-paramiko_3.2.0.bb b/meta-python/recipes-devtools/python/python3-paramiko_3.2.0.bb
index 2f3cf6eb7..5420a9edc 100644
--- a/meta-python/recipes-devtools/python/python3-paramiko_3.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-paramiko_3.2.0.bb
@@ -14,6 +14,7 @@ CLEANBROKEN = "1"
 RDEPENDS:${PN} += " \
     python3-bcrypt \
     python3-cryptography \
+    python3-logging \
     python3-pynacl \
     python3-unixadmin \
 "
-- 
2.39.2


