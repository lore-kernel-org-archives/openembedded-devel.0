Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABD6CC531DC
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 15:49:06 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.87192.1723218540118599419
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Aug 2024 08:49:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nCeWfSQL;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ef32fea28dso23437551fa.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 08:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723218538; x=1723823338; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rZLAjOGKu/zQA4TfGfgW/tFOejKnPyY03JtP5jaRicc=;
        b=nCeWfSQLGqAIObo5ZG1emQGu0ZQ/uH879lYb4VYFR2Vt6zxewiR5TJJdAQnH5Qy8WN
         SnJmdRYGDb2m4fstd5U4FNNlUP2m1XrDhMO+FXLQOs8OwuICj7b4ma/YY6fiTQCvxGHo
         DhxmelnzjgOHIaZCm+03Lf0KESCa2lLVVRA80FAkzsdbRtTYI+Bt0D1F5jfVrgccuYpc
         +/iaJcWOxXr4WztzNoOnGmT1b73C8G0ZfKjKHt4thmnF1cnQPZwH3zWHBKt6Ndc0RRsZ
         pElfQJDiVDiIGOk8u0mbvk5pz65r5C0XuEa34klUPRY+qCLlDGWjj8myAQYi5dtOVh1a
         jXpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723218538; x=1723823338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rZLAjOGKu/zQA4TfGfgW/tFOejKnPyY03JtP5jaRicc=;
        b=vBdtBX6u9bJ34meUFkEv64s24FBHNVAoc6bQ6LvSuCEGUpmHSubL3OYFsnLD3qdywp
         9JIrXs9fTzgz3LCudlKfH5kz6hFdmA6futopObjsFp1B8dWv/dLuBe5i18ubrqP5LNJh
         IaQOJRv0diAfg6PiWiEXt/SjOXCwk10RhrJNq3EYnMspBc3sR97VVr8ujslubItu2wG4
         xOzsNTgyqy4ycppItfGgAqXwhCOwthZMK7/PdYl3mGjHl7sgNR5nZ+g/IxOWQAc0+OX9
         4h0kDRYpqlIYg4YIjuymwOdijxyU3LFTryZI4Wnf5Sas5nxaVI91y2t5o/TuSoIoK+1S
         O/dg==
X-Gm-Message-State: AOJu0YwaSNoI9mF8JjnkvbyFSn0Vj9sEaLz6KPbtYOf7UHs3FcvPGb3l
	S1tFqwkK+CyWAq/LwecDswlk1LADgl1LHnRSoVMsrW9alNRwhmJ0rcErTJju
X-Google-Smtp-Source: AGHT+IHM4VUrY3Z7MRixO/sozMaQwNjCwu0Tr5P9LRo5droopsul4t4DuKIMIzIKVNdMn1+uIflisw==
X-Received: by 2002:a05:651c:391:b0:2f0:1c7d:1ee2 with SMTP id 38308e7fff4ca-2f1a6d65d4dmr14316691fa.41.1723218537662;
        Fri, 09 Aug 2024 08:48:57 -0700 (PDT)
Received: from localhost.localdomain ([176.33.65.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290c738eb4sm81195555e9.14.2024.08.09.08.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 08:48:57 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH 05/13] python3-pytest-timeout: switch to PEP-517 build backend
Date: Fri,  9 Aug 2024 18:48:22 +0300
Message-Id: <20240809154830.14927-5-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240809154830.14927-1-alperyasinak1@gmail.com>
References: <20240809154830.14927-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 15:49:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111701

- The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.

- The PyPi package name (defaults to PN without the python3- prefix), so there is no need to set PYPI_PACKAGE as pytest-timeout, it is by default.

Fix:

WARNING: python3-pytest-timeout-2.3.1-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../recipes-devtools/python/python3-pytest-timeout_2.3.1.bb   | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-timeout_2.3.1.bb b/meta-python/recipes-devtools/python/python3-pytest-timeout_2.3.1.bb
index b56c26aad..fe9d814c0 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-timeout_2.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-timeout_2.3.1.bb
@@ -3,10 +3,8 @@ HOMEPAGE = "https://github.com/pytest-dev/pytest-timeout/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d8048cd156eda3df2e7f111b0ae9ceff"
 
-PYPI_PACKAGE = "pytest-timeout"
-
 SRC_URI[sha256sum] = "12397729125c6ecbdaca01035b9e5239d4db97352320af155b3f5de1ba5165d9"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} = "python3-pytest"
-- 
2.25.1


