Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A285C52D6F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 11:47:29 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.31369.1723031242982817282
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Aug 2024 04:47:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JeSqhQo6;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3684eb5be64so1103739f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 04:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723031241; x=1723636041; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cKSjC2YjDVdCsb/tJOxkUPCsk4K3ac8EezgwW55D24Y=;
        b=JeSqhQo698oH8re0H7Gj4y/ZmcZJi1Qg+UF81g+QKq7nwjlR9WxtGNpnbn6HHBU2wa
         iRFqCCvmwOTuAi5FHAAJ0V2/hUXmIxuYue6YaFTHpu2cRq59lemfYZqajvo9kd30oRDC
         Ayb/vli61k1oy5AaI6j7v4cVBp5+iNqR5pItYEUwK1Ls7GfPYr/8iSXvvnAlU5hOZ9b7
         sFjuaa//6dJZLS/G0awaRi0IOe+HS5KEMMd9jazETKPu032r6A9wPmJ/3ZY1tXWz9RQ5
         t1THF/TTN7LX8R5nd42EVEbSup4pdrZd2s/VnFz0auItT174qWnaoa5Wq3cA8+bBpwT2
         IAtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723031241; x=1723636041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cKSjC2YjDVdCsb/tJOxkUPCsk4K3ac8EezgwW55D24Y=;
        b=YSDTlKj60WMs48Ydz0rlvLgJZGMpceeScO83QUUPI4h4FXdNlCzgBPc27sdEOUihQl
         z9vc75j2TABVZt2NXxrPLeBBDpFMAiQfOQpYDjjcT1wWiiZcdzbbk81QYbd4Mljm/gyx
         kK3jTSSPqxp1a9nebQKRkdrnoyawvlA32XX2os2UKKoIb9HXFZ6UXXaBiC+UHvtzwFHe
         R4EYtYJXg+rP72rAKatOfmM5eo/ap4XG0VHIW8ezeFzR6CQpVTIH/sDvzo80sS0gpvju
         Vvzb+5Fr6HJjjPj+iJ6QlUFWrAI/gjdUBZDGSQBiFzuNwZ0QDoSBMQMMUe05VhlN1S7s
         vFxw==
X-Gm-Message-State: AOJu0YwlGogfrqwPpKut3XYSFLW4lRwAdNkHeFBDDyvXaLoQQE/l+7EC
	CxUu3/IgGrbcsAf51PISHcFl0OaJlTAV2LGBw+7a6oaGUl6hUKDGNgie53jp
X-Google-Smtp-Source: AGHT+IGH3y+d4qpS4vYVTGkUQ42il2/6n0cl8A1tQ6UBYqDM88n4wCX8IQE3ELuF9HJ5arYDMak65A==
X-Received: by 2002:a5d:6b09:0:b0:366:e838:f5d4 with SMTP id ffacd0b85a97d-36bbc0e688amr10205357f8f.3.1723031240724;
        Wed, 07 Aug 2024 04:47:20 -0700 (PDT)
Received: from localhost.localdomain ([176.33.65.192])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbd0255ffsm15564655f8f.56.2024.08.07.04.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 04:47:20 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-evdev: switch to PEP-517 build backend
Date: Wed,  7 Aug 2024 14:47:18 +0300
Message-Id: <20240807114718.87881-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 11:47:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111620

The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.

Fix:

WARNING: python3-evdev-1.7.1-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-python/recipes-devtools/python/python3-evdev_1.7.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-evdev_1.7.1.bb b/meta-python/recipes-devtools/python/python3-evdev_1.7.1.bb
index dcf50f339..f098ce4ab 100644
--- a/meta-python/recipes-devtools/python/python3-evdev_1.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-evdev_1.7.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0ff275b442f45fc06287544cf713016f"
 
 SRC_URI[sha256sum] = "0c72c370bda29d857e188d931019c32651a9c1ea977c08c8d939b1ced1637fde"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 do_compile:prepend() {
     rm -rf ${S}/evdev/ecodes.c
-- 
2.25.1


