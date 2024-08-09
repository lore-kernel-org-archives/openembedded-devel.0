Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF459C52D7C
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 16:32:26 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.88293.1723221145105873373
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Aug 2024 09:32:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HvnvoUPY;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42817bee9e8so16405615e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 09:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723221143; x=1723825943; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O6vCjeVs7Fqea8LJ44Gl1fHatOGCEOgUaiwipOuQ2Xs=;
        b=HvnvoUPY4MxfAgFokA1lP0IMGe/gDmmtgUHNv2VbTJnpyS4WhkrQbEABHpTPxWfw/G
         9RpCvaZ5tLB0zbhj/3paDQ9V1/v5+cKW6tlQlnAwHvlEtDYlqLR6sdxJntxeqoAWTPpP
         Y9XD5qn5REcf8wBZ99UixXMambZ69xGkOIUN5HqUVgvYV0TFIKf6tB9nu4/wO/QAtYDm
         +36qTFZCTMEAnYRr8c39qj/JZ+P/irjFe4X949NITH+eGUbSuNvGEfaF5sXoNkObrEFP
         p8qy6Xz0ch/ft0CHEMPGmBqW9xYX8klPDTDoJTZR6CflH9N8MnAb0NmcdbX7nUBrgzsD
         oveA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723221143; x=1723825943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O6vCjeVs7Fqea8LJ44Gl1fHatOGCEOgUaiwipOuQ2Xs=;
        b=UU/JKkofU+1f/x8XDVFut1LLALZRr7N2vIe0PydrBPk/7BTje3vX94eSCWQUIFppyh
         y0qMNeQTCLzfnjFzs6d2MY613/iAE5QDSZNAXHVWGlGXH8cCtHmNZGYhcGiFMixSw4VK
         N31zwj5nubuZzDUSlANjTnjFvBgWbwZTqx/st+EGuVHX6fQJJyZTBAkM+UwISC68Mz13
         IZGl0b/Zn8hsJdGR4yPLNGjQumIaQ/vqIvp5sYUkkCHPXvgPvjMYm8LdXz+ucwyLaCaE
         Mazn9P3tCV4hSVK4mUjFK5D4q6+4XxfhfEcRspLJACbkFVw+rrXySNmIEHHes4QG3eMf
         /2gg==
X-Gm-Message-State: AOJu0Yy4rLzXTVjNLQoWXN//FhITkXhcL/HpCzFVFwmzH1Usd15/lo7c
	KVv2r3vE2AMbvFDUXRffo7DoDkIEjXhzxCXhsTbHeVkklpnBz5TLMN0UWtN+
X-Google-Smtp-Source: AGHT+IGmGvAsxxHo2rAJpv5mS74AYRRDGH3yQpIVB2eEFdW/9AfHWo0YqRcTevs67ZgTLUbyjNJmtw==
X-Received: by 2002:a05:600c:3590:b0:428:1b0d:8657 with SMTP id 5b1f17b1804b1-429c3a2b31dmr15145175e9.22.1723221143167;
        Fri, 09 Aug 2024 09:32:23 -0700 (PDT)
Received: from localhost.localdomain ([176.33.65.192])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36d2716bf49sm5789123f8f.25.2024.08.09.09.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 09:32:22 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH 10/12] python3-django: switch to PEP-517 build backend
Date: Fri,  9 Aug 2024 19:30:59 +0300
Message-Id: <20240809163101.8416-10-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240809163101.8416-1-alperyasinak1@gmail.com>
References: <20240809163101.8416-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 16:32:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111721

The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.

Fix:

WARNING: python3-django-5.0.6-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-python/recipes-devtools/python/python3-django_5.0.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-django_5.0.6.bb b/meta-python/recipes-devtools/python/python3-django_5.0.6.bb
index 69b25742d..513032876 100644
--- a/meta-python/recipes-devtools/python/python3-django_5.0.6.bb
+++ b/meta-python/recipes-devtools/python/python3-django_5.0.6.bb
@@ -1,5 +1,5 @@
 require python-django.inc
-inherit setuptools3
+inherit python_setuptools_build_meta
 
 SRC_URI[sha256sum] = "ff1b61005004e476e0aeea47c7f79b85864c70124030e95146315396f1e7951f"
 
-- 
2.25.1


