Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F522C7EE3A
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:26:42 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.9083.1685521594231373898
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:26:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=jPgHxV3Y;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.42, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3f623adec61so57224845e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521593; x=1688113593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ums58+20LIRid4M4ZbLqs2Ad/1XjW7P6SPQITTfyB8A=;
        b=jPgHxV3YFVbD+PwqTDC4T1RZG+l/biGXkozpcbnqoCb9CEGOf8Fex+D7NSbjEtgfSn
         A8AevZLXpGpZPixD2LoZ3GErz3TG2pVyL5tfrA6dPDmEemeL1sFP06pHbsOaOftB6ilK
         lVNidmyXy+pJ2+x8cP8mG+tj74sXBRxgxlE4UfAD3IdNE37VzZGJ2k4s3dGOEoHZGlPK
         fEgRwSJ1XAI4YdjLYekGQDuGAnFjilX7elRYkHdAnQNgWDoN5IUZAlXiTHz0o+bwfGUn
         yVy9hiuSeYws7zpBxbbjx/Nk0T7YG1kGyKllobFz3rqsqQbPqDpsNgjK4bRp3pkYOoXq
         KB7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521593; x=1688113593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ums58+20LIRid4M4ZbLqs2Ad/1XjW7P6SPQITTfyB8A=;
        b=UT3cBvs24smeF/VEr+Jv3whlQvccWMPoWUalWzA/u2dmnMHWVTdq2YKclb291kwsV0
         J2fkMIIlbzRpt1z7QiNI7I2KRATkzqChOypnyVj/UuX4/IZ2Y033zcV80ThivXlIs3C3
         qHGeXr28GegX3aAA+gmXB59jXNvT2OVImtEgR+DPJtHIlesSZJILQxuOfhT0O++1w0+f
         +8Qx4P+swIjKAMaNlX4Gbg+M/NKy6GDS56Fkz0mVkRGB8O5fVl+fE2LlVqHvEOo1N4XR
         /FPnWAzxEbbJU1vexljFmS5HkklFrd54YWbPDNi3EOqw4ekuqp2OT3cFWGETmSnmkuJE
         k0uw==
X-Gm-Message-State: AC+VfDxQjHA6YIdpLU/9/v/aKvK3ZlohxNZYBxC8j78PzrN7JKzupsfx
	hJxcqJfFiwLWrqy5qSDLVnw9Dw==
X-Google-Smtp-Source: ACHHUZ5wUIdz1qxNKTrNoZP2FNPp7SvY1EVfWAAo2qzC8osBGgaLHStz74p+8TZ320PIdGDPUveGMA==
X-Received: by 2002:a05:6000:10c8:b0:309:3449:2886 with SMTP id b8-20020a05600010c800b0030934492886mr3267283wrx.39.1685521592848;
        Wed, 31 May 2023 01:26:32 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:26:32 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 077/149] python3-pyexpect: add missing run-time dependencies
Date: Wed, 31 May 2023 10:23:25 +0200
Message-Id: <20230531082437.10646-78-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:26:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103004

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-pyexpect_1.0.22.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pyexpect_1.0.22.bb b/meta-python/recipes-devtools/python/python3-pyexpect_1.0.22.bb
index 7d22266f8..1cbd2384a 100644
--- a/meta-python/recipes-devtools/python/python3-pyexpect_1.0.22.bb
+++ b/meta-python/recipes-devtools/python/python3-pyexpect_1.0.22.bb
@@ -8,3 +8,5 @@ LIC_FILES_CHKSUM = "file://README.md;md5=a6aa1e7097aca5955f9a2e1c8b0ce158"
 inherit pypi setuptools3
 
 SRC_URI[sha256sum] = "659351e7ee8923b42de8a774fabfc806acf07377d7fd19f2ea4412ef8f619c6a"
+
+RDEPENDS:${PN} += "python3-numbers"
-- 
2.39.2


