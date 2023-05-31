Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 251E7C7EE39
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:26:42 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.9088.1685521601043359967
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:26:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=uJ0R4VB4;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.47, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-30ad8f33f1aso3929833f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521599; x=1688113599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E3aUbCE2QIes6KmadCjd8jrOfEY0Hwo5fADGdwp5u3w=;
        b=uJ0R4VB4EFigRTxFvY07rv1aysbwDnRjTA2UEoP075JwRW6RPS7ia8LVVaPhMyiuij
         HQtuBb23RjTgHJtGNYe1SuwmGf/lU1kLDdPd9jPtzojSJk5ufMOB4BVG123HDoQu0rjk
         2YIvNiIDlwjIILrNuu5op7jcLdgHmOdIzmC/lxDNw1yvmCInpZzRzFDH+E5zz+LBKL7z
         IhjhcfDfmNQcvCeXjO+Kn6OX7RadAAHO3ZHIAFWlUiKJnqoDcQAinFGQ+uh3dhij2Pya
         GJ8MmTYeHUu1jUzzneF8wj5ibJU1X6LJg/QMSpYNvfOa9MpVLpDLgoEpfTc5Mt5OORVx
         X4jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521599; x=1688113599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E3aUbCE2QIes6KmadCjd8jrOfEY0Hwo5fADGdwp5u3w=;
        b=d0dKm7WksfhEpvlKQyIa52EFgBGGmD3AmK6y5K75N7RFe19mMhbE12T9lxnA+cXwKh
         aykE01qelb36N4hpx1Ear6uBsEiVH+77Y/7TIpbfz2QAmYZ78hiAEcEjj5+YDfPgqxvK
         e6qWZHw5L/Ts49CG5lCU2SKcWKCz8SyZ6XZVWuVe5QMkA2J/wdOZqSk/YqfESiKVT9TV
         R+Z278mIhlqZdiyAuOImgLzyYWLFw0ThVVIQbqRpOAh4vVELVClcnUh8woGfihhHg51Y
         jInqjJKJ8iwRxbrh9blUnlg6mS8tRSUOjB1irMQLvY5noj9puct8znZwSbcnU8BBBFCV
         w56A==
X-Gm-Message-State: AC+VfDyIyZSoN4rOBEGeRvyc37PbxQAXI2W7STRvGDcwCAkLU42Xd5lR
	jSDgG9jMeZANGqpB5ddIdwAY1MmJwFFEeDg4ojQ=
X-Google-Smtp-Source: ACHHUZ4i/Z+8NGYVqgkPGySGF9WnaJFYuGy/j9cimOCVkAr8qG0VG2jm+JrbF7JTH+prWu1cNf+rdw==
X-Received: by 2002:adf:f404:0:b0:30a:d8df:6800 with SMTP id g4-20020adff404000000b0030ad8df6800mr3365680wro.33.1685521599677;
        Wed, 31 May 2023 01:26:39 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:26:39 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 084/149] python3-jsonrpcclient: add missing run-time dependencies
Date: Wed, 31 May 2023 10:23:32 +0200
Message-Id: <20230531082437.10646-85-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:26:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103011

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-jsonrpcclient_4.0.2.bb    | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-jsonrpcclient_4.0.2.bb b/meta-python/recipes-devtools/python/python3-jsonrpcclient_4.0.2.bb
index 26ee3786b..08ee15a92 100644
--- a/meta-python/recipes-devtools/python/python3-jsonrpcclient_4.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonrpcclient_4.0.2.bb
@@ -8,7 +8,9 @@ SRC_URI[sha256sum] = "c0d475494b3e1b591ecdee7883739accaf5695edb673f16b7383b8c6bb
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += "\
-    python3-core \
+    python3-json \
+    python3-math \
+    python3-netclient \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


