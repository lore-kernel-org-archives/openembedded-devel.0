Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1EF4C7EE33
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:26:21 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.9065.1685521549486641077
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:26:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=MYOQyahF;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.46, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-30ad99fa586so5271929f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521574; x=1688113574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lsMRtho4P46vcwZvUtcgLvdpFEYRLiTjRIvuTapawc4=;
        b=MYOQyahFGqgeO5SwVbc08NiByRHaTxqxyPPjO6RXyDPj7OrTUcGi01fqFanau4ARvW
         N05i6arM1+uEEPt5i0ONmxlAKdPyCf1GczsX22Uhb0DKYOEs02ZmgXtGNpFLRpn3Xz16
         Ob3sH3udExTajbGb1Z7BoQXHDjBoCODiYVZx+Vlo3YVttcqSVV/HL7Yyb/oQa63ceojt
         glaJSrN4jFfei1QIMv/iPbGWjUsZkVCSCQqDrnST89pKiSbnBi23QfOMPI/VTmzkxTNz
         30fLAWwfM+awfgyUHYMOfUtEXlc+yVbMX39La+m8NsXHMhObYAqEQgvQldn6EQaKFkg8
         fYng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521574; x=1688113574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lsMRtho4P46vcwZvUtcgLvdpFEYRLiTjRIvuTapawc4=;
        b=iYhOvJk7olnyD/9sJZng6bC/zA01YKBOv90b0fME5qQXAU1BMkH02yzagsti5Qvn39
         rfk4kTGucN/b5YKAYIl2Ux6g+rjWugaI1rsPtbGzq1qJ91A0awNrE1jbSz2uHKQVuho5
         q3Z3pEHH85EcGDx18B2tx+XFcm7W/l+pAe0ombXY4oQqf1WH5G8QzMKraZhLKJwyE37g
         JbVYrdZJZePk6Ee17rWMlOHkjFvngCpP9KdmLMYYE31Di4QBv/CqZqmlGHd9rGMeKF7X
         JvMmONDeXPTak9iYlJAxbFnr4kjjHq7YpHwSmi2fKE5hXv6ANCcg7ofQJpkcyFBTFhRZ
         WB2Q==
X-Gm-Message-State: AC+VfDxYqxET/iL8nixrq2sQLceE6Pe0ElXAZS1Lz81cqz19YboY3E9A
	EQwKC5T2oxJrfzEbq4IkHsROBg==
X-Google-Smtp-Source: ACHHUZ4fcnuuW5ZKFRLI/qged9CzrnvdE1rpLUOuSz86pDingv2bRS9HhxYFGvTAAze+Dg42VS9pzg==
X-Received: by 2002:a5d:6289:0:b0:30a:e332:a3ba with SMTP id k9-20020a5d6289000000b0030ae332a3bamr3407775wru.27.1685521574710;
        Wed, 31 May 2023 01:26:14 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:26:14 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 061/149] python3-qrcode: add missing run-time dependencies
Date: Wed, 31 May 2023 10:23:09 +0200
Message-Id: <20230531082437.10646-62-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:26:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102988

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-qrcode_7.4.2.bb        | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-qrcode_7.4.2.bb b/meta-python/recipes-devtools/python/python3-qrcode_7.4.2.bb
index 8c0429bbb..204f4ecee 100644
--- a/meta-python/recipes-devtools/python/python3-qrcode_7.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-qrcode_7.4.2.bb
@@ -8,4 +8,9 @@ SRC_URI[sha256sum] = "9dd969454827e127dbd93696b20747239e6d540e082937c90f14ac95b3
 
 inherit pypi setuptools3
 
-RDEPENDS:${PN} = "python3-six python3-pillow"
+RDEPENDS:${PN} = " \
+    python3-six \
+    python3-pillow \
+    python3-pypng \
+    python3-typing-extensions \
+"
-- 
2.39.2


