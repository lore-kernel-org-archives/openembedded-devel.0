Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B674D767CC
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 13:41:37 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.12752.1730382092280380654
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Oct 2024 06:41:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d98BsqLS;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5cb6704ff6bso1353282a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 31 Oct 2024 06:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730382091; x=1730986891; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=57iJnuMrePSMJXvk/GaOgH/5BgsxZzbgop8wpJQLLfU=;
        b=d98BsqLSgpPhXv7JjgQGELLWvUAu9B7uLI13nlc5xCJ+J4MPXFqpPDBwj6+M2C/dNe
         0+qw9ECrdWjCnmwUwHHdMQfk3/DgPIvZxPMUZU1WGP6jshNdk/zcxNQAG0oMHP5KvsZN
         P10JEmx3Zkd2Ijf1V2Y4CQMl7tFWtQho9ZW2UVjCTEcVVbfVCLAO2aiUjc8zTU0nTpT4
         9Txosf4psFLvq6qmZP9LfQnmyqu7VQ4kNuDfCjWLAlQHI446NlJ+b1CwXxIo9/zcmpBk
         hfjkU52H2FAOYEDeSGDntoUGREa3Z6upvNOvE4Fs++QG4UFPzxsaJNZHR/TGPJjjeK3O
         +3Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730382091; x=1730986891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=57iJnuMrePSMJXvk/GaOgH/5BgsxZzbgop8wpJQLLfU=;
        b=ww570Ka2DQJL3r4n/LQLodeKz/uiDT/paL2YSI4sQHUX1i8sm1s7zYuToghf7PuTZw
         Vm+R6o8rGabdY6/PfEPDwFnjhdtngE7fvrBIiSW//jewObGe6+wX2nXRkze8iaL+Zc7Z
         3YICkwcqE3gZGw53knMcO8baZ1r3DyeW+K+u9vioUhspchmLwn7tJj+XTFR54M81LuUR
         pLuHm7WA3wrYmk8iur3kzyYr+4JLsYatfRppNNqk6QSSOc705vl4iCyIU7Iq7iA4J09Y
         /TxzX/kR/0+dXfWEuF5XcG18y4tte66lv6VF8ufAqRHbC9+9k+qHvfIJ1r2qKwsM0747
         Rv1w==
X-Gm-Message-State: AOJu0YzM63lfME6HzKsxEVwG18+tzykeehKx3+pYXdIpXMqF4l8NUnkU
	/ifnrl6IUm1I2mjBbDr05ukNqsdNbqIWWjKlQwm8dnCjumE4siVkzPvkTQ==
X-Google-Smtp-Source: AGHT+IHo9Gf/BjJfc/0Ha0tXGvvYkz9fuhmQegH2+imQhWuHrtF2fzWc7yFovNV2PVBQFU2HkOtN/w==
X-Received: by 2002:a05:6402:5107:b0:5cb:7877:a633 with SMTP id 4fb4d7f45d1cf-5cbbfa66f4amr13740150a12.33.1730382090409;
        Thu, 31 Oct 2024 06:41:30 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceac770204sm627301a12.35.2024.10.31.06.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 06:41:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [master-next][meta-oe][PATCH 07/11] python3-rfc3986-validator: drop unnecessary FILESEXTRAPATHS
Date: Thu, 31 Oct 2024 14:41:10 +0100
Message-ID: <20241031134114.2791747-7-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241031134114.2791747-1-martin.jansa@gmail.com>
References: <20241031134114.2791747-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 31 Oct 2024 13:41:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113364

* rename python-rfc3986-validator to BPN python3-rfc3986-validator
  which is included in default FILESPATH

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../0001-setup.py-move-pytest-runner-to-test_requirements.patch | 0
 .../recipes-devtools/python/python3-rfc3986-validator_0.1.1.bb  | 2 --
 2 files changed, 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-rfc3986-validator => python3-rfc3986-validator}/0001-setup.py-move-pytest-runner-to-test_requirements.patch (100%)

diff --git a/meta-python/recipes-devtools/python/python-rfc3986-validator/0001-setup.py-move-pytest-runner-to-test_requirements.patch b/meta-python/recipes-devtools/python/python3-rfc3986-validator/0001-setup.py-move-pytest-runner-to-test_requirements.patch
similarity index 100%
rename from meta-python/recipes-devtools/python/python-rfc3986-validator/0001-setup.py-move-pytest-runner-to-test_requirements.patch
rename to meta-python/recipes-devtools/python/python3-rfc3986-validator/0001-setup.py-move-pytest-runner-to-test_requirements.patch
diff --git a/meta-python/recipes-devtools/python/python3-rfc3986-validator_0.1.1.bb b/meta-python/recipes-devtools/python/python3-rfc3986-validator_0.1.1.bb
index b06634e5af..21f588bc11 100644
--- a/meta-python/recipes-devtools/python/python3-rfc3986-validator_0.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-rfc3986-validator_0.1.1.bb
@@ -3,8 +3,6 @@ HOMEPAGE = "https://github.com/naimetti/rfc3986-validator"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a21b13b5a996f08f7e0b088aa38ce9c6"
 
-FILESEXTRAPATHS:prepend := "${THISDIR}/python-rfc3986-validator:"
-
 SRC_URI[sha256sum] = "3d44bde7921b3b9ec3ae4e3adca370438eccebc676456449b145d533b240d055"
 
 PYPI_PACKAGE = "rfc3986_validator"
-- 
2.47.0


