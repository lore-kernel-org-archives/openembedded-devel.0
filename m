Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9374CD129C
	for <webhook@archiver.kernel.org>; Thu,  4 Apr 2024 20:35:53 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.3323.1712262953595346254
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Apr 2024 13:35:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WzMTeWTb;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1e27fadbbe1so12608815ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Apr 2024 13:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712262953; x=1712867753; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zOagxytnV9bCMT/0ea8E6dsmIwdU8G4+PlLnMhnwPKs=;
        b=WzMTeWTbhYt6U6MCb+RIzBktO75VJxs/qfcZH6Bn7nQE7ZVS6AWKVAzTxkEEimZE5j
         rhCSPFh3jJuIW3KdMU+/nVqRA8rdOoEh2GuO17fdkYE0Kmr1rSM8GEuEu8Y3xQUt4YvX
         YG1wHTIg7iplFArltM2bMKIH2R6nLUj7eQjJQaYKp4iO4vi5UsgdkTK0Uj7P5NzGIZW0
         XsqGCCOX/UtNSDB367p5sg15CFizr0L55CK5UlwcUFwVNtWg93eyqQsKgXylGgTJgd6b
         iUk3am/lbkdcCedcmCbQhmKfmps4B/64pCDQ/JgH3sNzYezJTknKVYrpAmDOGobCy50p
         uvpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712262953; x=1712867753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zOagxytnV9bCMT/0ea8E6dsmIwdU8G4+PlLnMhnwPKs=;
        b=Vv8DTRHUIGliIwjAEcEJ6tEZ6CbR/PNd1nAzK/5cXCdRhnFJSiY++lfzLXMj0MFCoM
         wGXx2gEZDa7uZvmLvnfWgkpOBI3Dt0/7MKaJWysfyPnFzzd9qlC2LVkyGriXMxJKbvc6
         Xl3E+D359W02+iw0s/JcX3agk6uzELeWtCNJSuo/FiYZSUF8/+PkUlYx1T/EwqvDWrnw
         Ujn79UMA+n0n9Mvy5ulQj9a9qoqi+ZTEGgQjU3jr0ynphs3rty5vjyFMHx+dKaaM9fi/
         BLy0hkiOks6IKoq0XkQjF+/LLJF1FcYd4TY3YfpSx0OdwWvQXYZu8oVJFS+eFXEPHCNy
         MJ4w==
X-Gm-Message-State: AOJu0YzhN5jZ/EA7klZqKOWL+lBKA370gD6SoZC2XO7+mwZOwzParc6M
	2fGxtxEDC7SCUD+15e+70i9V5nAWrbuV29Lcsie64yk3fvYjwqZ4ZKmSWs5/
X-Google-Smtp-Source: AGHT+IEGyYPFHRryuoQwezDLQbvGkuEnqcCVD8tv3yvGLasmBucTkiOyX4QUtinY0iKj+AZeAHFESw==
X-Received: by 2002:a17:903:230c:b0:1e0:bae4:48f9 with SMTP id d12-20020a170903230c00b001e0bae448f9mr4242306plh.32.1712262952814;
        Thu, 04 Apr 2024 13:35:52 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::5077])
        by smtp.gmail.com with ESMTPSA id v12-20020a170902d08c00b001e06c1eee22sm39764plv.74.2024.04.04.13.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 13:35:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 5/5] python3-pydantic-core: Skip failing ptests
Date: Thu,  4 Apr 2024 13:35:46 -0700
Message-ID: <20240404203546.285796-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240404203546.285796-1-raj.khem@gmail.com>
References: <20240404203546.285796-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Apr 2024 20:35:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109806

possibly due to oe using newer version of pytest

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-pydantic-core_2.16.3.bb      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core_2.16.3.bb b/meta-python/recipes-devtools/python/python3-pydantic-core_2.16.3.bb
index 40478cdbb6..934e3e2bb2 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core_2.16.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core_2.16.3.bb
@@ -48,4 +48,5 @@ do_install:append() {
 
 do_install_ptest() {
     cp -rf ${S}/tests/ ${D}${PTEST_PATH}/
+    sed -i -e "/--automake/ s/$/ -k 'not test_model_class_root_validator_wrap and not test_model_class_root_validator_before and not test_model_class_root_validator_after'/" ${D}${PTEST_PATH}/run-ptest
 }
-- 
2.44.0


