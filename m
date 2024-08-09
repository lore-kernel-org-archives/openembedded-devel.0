Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C793C531DE
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 16:32:27 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.88289.1723221143053141296
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Aug 2024 09:32:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KFOgB40G;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-427fc97a88cso16876765e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 09:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723221141; x=1723825941; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kkSd/AvNWgmnAJtZ4obgqoYPkWqn2btiTPS/drfEta4=;
        b=KFOgB40G7dgTMtzOjz2fPatU95yi5ucqvd9g7umBO109Qg3MbytdoV9ARd/R7YMsW0
         d4tvEKyPC90N64E2Jhf7cYsvlZk/d68+WHTeM+WXMfUoHfa5Fl8DtPSgzfOprzH1DItV
         YUZZjC4LmABJmmDBmxuzGVv+yr48ZWERR9Z5DdKiE0DcufhwZ8gxNq7ureWOIZ3DARS4
         RHbummUlChIRPRRpTEWpIr98UE5I3zLvee8MlVbRYRtzUYkIPeIOgZguluNp7QpTAxIN
         k1of+yuBDkuHTXNKQbuJ+tLwREdOrmOCCgHvEfACeKSWh0vfw3pTdr/yKsXnqc5LDVhk
         E6aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723221141; x=1723825941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kkSd/AvNWgmnAJtZ4obgqoYPkWqn2btiTPS/drfEta4=;
        b=pS992f4nO7r2dibxaoCoO1ZS9No7v7Q9ozpMlrHgLYB5CcMdJmsNiXBxkGmhkGBmit
         3sC1Cfmr/kw+7rNjxpEFxtJzGJZIHEf+G5eQfgBePIOc/TN1orGlcI7kyw8zyri0zKoP
         BZeKLEZzXn5uW+i4oeKMqr1Q7A6TGHr7dpjkthghauOsLeQA+Nhrwho0bMlqpWwwY+NV
         bw56NHFY1j9u70RLvQ5aojV+2MXOaGAzhNJjjpUm5BR2l0OzHtLg2cEE9fFOPJo534ne
         C9Yw+Uk5mJwVHuaP/D7TzReFowrnGP1iIuhmBx+d58inHJlO7/30otpjjq+jZjy8lIJy
         L9aA==
X-Gm-Message-State: AOJu0YyBmzAbcubyu7IyDoY+da3srWGOqYgP13J82nU947CXhWFHC4Bp
	EX/nirjI+tTTPeFkkiE3uLWYd0dcWekWYh/yNastewztSRY6O1+P7M69RMXs
X-Google-Smtp-Source: AGHT+IGrsq4MWTKFPEUW5hlln+n6KvWbOs1xdbARNi8o2l4A0+OL5Ieiy1/1onpyVWpLy+HwR32Hrg==
X-Received: by 2002:a05:600c:3b09:b0:426:58cb:8ca3 with SMTP id 5b1f17b1804b1-429c3a29bd3mr15847635e9.21.1723221141047;
        Fri, 09 Aug 2024 09:32:21 -0700 (PDT)
Received: from localhost.localdomain ([176.33.65.192])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36d2716bf49sm5789123f8f.25.2024.08.09.09.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 09:32:20 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH 08/12] python3-pyasn1-modules: switch to PEP-517 build backend
Date: Fri,  9 Aug 2024 19:30:57 +0300
Message-Id: <20240809163101.8416-8-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240809163101.8416-1-alperyasinak1@gmail.com>
References: <20240809163101.8416-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 16:32:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111719

The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.

Fix:

WARNING: python3-pyasn1-modules-0.4.0-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../recipes-devtools/python/python3-pyasn1-modules_0.4.0.bb     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.4.0.bb b/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.4.0.bb
index 34f3639e5..48372d917 100644
--- a/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.4.0.bb
@@ -10,7 +10,7 @@ SRC_URI[sha256sum] = "831dbcea1b177b28c9baddf4c6d1013c24c3accd14a1873fffaa6a2e90
 
 PYPI_PACKAGE = "pyasn1_modules"
 
-inherit pypi ptest setuptools3
+inherit pypi ptest python_setuptools_build_meta
 
 RDEPENDS:${PN} = "python3-pyasn1"
 
-- 
2.25.1


