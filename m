Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2197DC7EE2F
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:26:52 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.9132.1685521575001045183
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:26:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=ioNMxvD6;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.52, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-30af86a966eso1183569f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521606; x=1688113606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9i0oIxSZuKp/Nvmpe2KjU6hMM0xHA5ijjPblPH3Ej8A=;
        b=ioNMxvD69s4cmHnm0+JPIuGx2m45GPfxL4wAcIW1q39SM++cUXqj1cACh2tnl+NXpL
         9bugjNwf9hlZj+2n6YecEzgFqzXnZ/korSLHPslqOZxqdHMEXPmMsvKca9sRnSJaEInV
         oa9K6zFHF3FAUZk7MyET/AfG51k5MXJwc9HHnemQkfKT1TjMIBzuDlx/qYSXT/mrAeX0
         YvkMcNSLaPY8V2fDksfhO+MlgO/hf6aJpgpjI81mA1j63BNEQzz0xZLaVYMusU2kCoEm
         I+iAfXWHrNjcPl4wOV8V5lwGPQ44j2qz0APPNsF84LC0Ly9Ad3XY/Kw84n2g43gHg50j
         7BDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521606; x=1688113606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9i0oIxSZuKp/Nvmpe2KjU6hMM0xHA5ijjPblPH3Ej8A=;
        b=gZpUUUfd9oDqpaihqYSyklNyC2kboQKCZ+4nx35JKoy6EB4Q9Kc5W12QjwIPxEugkr
         uFsL7XzFY2CzhfV4+uIKLmKlvMRzyJHCi1nHf8ZxjIln+JILOEBHXIB3WX2E3FX7EIjE
         1+d/v3/6oKwU3abw99P0M/FM9hqJ4HnLf3P9+nkZjPTa2jeiFRGyrTDZkeBZEL74dOu8
         B1nyKnrjD3FMH9Lfe6XeHmSundr2E4XEJALGFxikC4SOUoUvOJd0IpOcR7IHr+SWzkGo
         o3ufGST+2CSmf0Duy7gGDFbalx9JhKJLWsShfdODsUJbgikYnIXIyEfMR8qR5+HvTa39
         uJjQ==
X-Gm-Message-State: AC+VfDzdwerY4Zx0KW+yUM096VOuNezWZaeEE/sKThxcJX2qZbYX1THh
	rhBos4BrtXPLR29QFRp+OIGLOw==
X-Google-Smtp-Source: ACHHUZ4UzjHKPkh1o3JzrT5yM2jVkE75/UwtU1F4VNsJY1lR9nC6JemRyeOsMIfNHQFUQZdVwC/CAA==
X-Received: by 2002:a05:6000:ce:b0:309:4e06:ff0b with SMTP id q14-20020a05600000ce00b003094e06ff0bmr3389017wrx.27.1685521606354;
        Wed, 31 May 2023 01:26:46 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:26:45 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 090/149] python3-msm: fix coding style
Date: Wed, 31 May 2023 10:23:38 +0200
Message-Id: <20230531082437.10646-91-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:26:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103017

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Order run-time dependencies alphabetically and add some whitespaces for
consistency.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-msm_0.8.8.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-msm_0.8.8.bb b/meta-python/recipes-devtools/python/python3-msm_0.8.8.bb
index 848b25dae..ed30fd76c 100644
--- a/meta-python/recipes-devtools/python/python3-msm_0.8.8.bb
+++ b/meta-python/recipes-devtools/python/python3-msm_0.8.8.bb
@@ -8,10 +8,10 @@ SRC_URI[sha256sum] = "a502aee54917cd394217b31c977a1ba3d9541a0120e0a045c49fd77b32
 
 inherit pypi setuptools3
 
-RDEPENDS:${PN} += "\
-    python3-pako \
-    python3-monotonic \
+RDEPENDS:${PN} += " \
     python3-appdirs \
+    python3-monotonic \
+    python3-pako \
 "
 
 do_install:append() {
-- 
2.39.2


