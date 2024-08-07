Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 815A3C52D6F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 13:07:59 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.33028.1723036072280267444
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Aug 2024 06:07:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GaACz4Vd;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a7a8a4f21aeso214639066b.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 06:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723036070; x=1723640870; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yk/WWnt8rh5m7hFURXd2kRCbu4CXQRB90eYQ219Bamw=;
        b=GaACz4VdK7EMUIEDu0UYgZ/FSv0wiynwV39PMYCNZ1xxjONeU7AuzSOhEBhCeLh859
         HM0DATWKeNpMH0qTs5A/ghgT+kIkv1AIzrXPrOHQFUuCDJ2NxFhIBEIQZV5Y7lAZooPH
         cZF8wK6Ki3tV02AvHzQWF6fNKuV6YxUV/Rk879Pg/ePwc6qBkUgsMQ3ckxeRY6qVik44
         WKu5cZiSViUdML1vPY6eBEOLg32Dsdnzrh0PaXzQ+iJ0djc3qkdZ/dcoYIYtSg1XEzsm
         VRYttSUEJAWKFAz4jSmiYgkjoS6/6GMk7SPHM9dSo/aDilecXYEzfbxGXijT/RNYpgvD
         nkeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723036070; x=1723640870;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yk/WWnt8rh5m7hFURXd2kRCbu4CXQRB90eYQ219Bamw=;
        b=n6JTIU/edxtgnLT74qNWDfT4eGib10XtFmdZ/0auf0fOMA0i5/RCH0E0HwSx07W3jj
         iyOLvJGU49k4qCUQg0eAe1XApymWXC8xcsGnbYDzkHJnU8t0aqrqsjdsv7X/hZ7cGoqd
         ro49TsswldAVLY7cP9DAfH52V3ZpvKkJwKuTqsw4iJuDHGdA0XFiNKfRXMaNAEOURGXa
         mjrXLLKP63pV5W3rwRAYu6fBaJHf1vuDjVSKJLns7mA7O9GqajcAQk0d1EMNUec3Xe5I
         /WPeuNCzvnwLTRURNIYXgZ9krsf4t6ns1RuvPkGzzSdaCIS04+SzXrcZ9u7XGpSNvIlI
         jMYg==
X-Gm-Message-State: AOJu0YxcFPo9kF5ZjzeXW3qyDw+tK5K3p8ZHsW451iD9I/weEj26nJ3l
	/Qykap6ugtsMMJVTnSgGtVDTFkIPvOJFIvK2Dh33XKig5s0uRGmTd+OhBLCs
X-Google-Smtp-Source: AGHT+IHTKpaV3VAzW1MIo4yHTlOm+N/wBX/WNDUvA3OUPdi9yvW0p6iWhRFEnjcPMw1S8gMtHDGY7Q==
X-Received: by 2002:a17:907:6e94:b0:a7a:a7b8:adb1 with SMTP id a640c23a62f3a-a7dc4ff0e66mr1433536066b.36.1723036070011;
        Wed, 07 Aug 2024 06:07:50 -0700 (PDT)
Received: from localhost.localdomain ([176.33.65.192])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9bcb19csm636972066b.42.2024.08.07.06.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 06:07:49 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-lazy-object-proxy: switch to PEP-517 build backend
Date: Wed,  7 Aug 2024 16:07:47 +0300
Message-Id: <20240807130747.147890-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 13:07:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111633

The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.

Fix:

WARNING: python3-lazy-object-proxy-1.10.0-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../python/python3-lazy-object-proxy_1.10.0.bb                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.10.0.bb b/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.10.0.bb
index 263c46869..195f94705 100644
--- a/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.10.0.bb
@@ -4,8 +4,8 @@ LICENSE = "BSD-2-Clause"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d606e94f56c21c8e0cdde0b622dcdf57"
 
-DEPENDS += "python3-setuptools-scm-native python3-pip-native"
+DEPENDS += "python3-setuptools-scm-native"
 
 SRC_URI[sha256sum] = "78247b6d45f43a52ef35c25b5581459e85117225408a4128a3daf8bf9648ac69"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
-- 
2.25.1


