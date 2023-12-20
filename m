Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 030F3C46CCD
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 22:07:54 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web10.33915.1703110066378797390
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Dec 2023 14:07:46 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.48, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-7b7f9fdc14dso7778839f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 14:07:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703110065; x=1703714865;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aLU2Xp7CsThn64O99i8mLlE+3DEa4HwBHUCCwJZui5Y=;
        b=gAzYZWVKgAdZksUJVVf2OUqrxefihjX7ISw5FzdYirg49RIsOrf7cm7QX1+WqzwmnT
         nmzKdG1kUj0Et0HmRs1PO+D02dBopII3QwPfrdf1eDmMFmILQbEUoZVgG7e76cutcdu5
         aQbspP3ROo6XAUdI33KeWYTCkbg9kPbtVv51in/jVMa8KNVS+9CQxkx4keL5MXvM9bhT
         vjJ0CxXbUWU6zaaKF804Sdbgkm0GQyn/O9w0ikqaOmbBEYtlKtOPSCxIutNZwW32KJcX
         KzTgbhTgibnGlKZixjnycwYJ+JGFUGxArwlM51XSMP1RHnvpS/vnfotFTX8VWi86OT6R
         Xfgg==
X-Gm-Message-State: AOJu0YwaHDbEKuZ9tqmSP7qR4XzSitLY9YF0ThA24NbUbphR53BMdQHy
	maH2yFQiaAjXybCGhbjgluzu80muEVB3HQ==
X-Google-Smtp-Source: AGHT+IHBDe7oINkGAThArCJX/YJtq2aXAroZKUDf8CLN4c4xO/SPKwqLmpQqUFTP8JNY46GXJte1jg==
X-Received: by 2002:a6b:ec0b:0:b0:7b8:ecdc:da24 with SMTP id c11-20020a6bec0b000000b007b8ecdcda24mr2223652ioh.10.1703110064747;
        Wed, 20 Dec 2023 14:07:44 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id ci7-20020a0566383d8700b0046ce69fc447sm84688jab.8.2023.12.20.14.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 14:07:44 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-ninja: update to version 1.11.1.1
Date: Wed, 20 Dec 2023 22:07:33 +0000
Message-Id: <20231220220733.3787024-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 22:07:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107679

Changelog
  fix(wheels): link libstdc++ statically on manylinux1 by @mayeut in #159
  chore(wheels): link libstdc++/libgcc statically on musllinux by @mayeut in #160
  chore: add Windows ARM support by @henryiii in #169
  chore: continue testing with python 2.7 by @mayeut in #199
  chore: move to setuptools_scm by @henryiii in #170
  chore: switch to ruff by @henryiii in #174
  chore: use trusted publisher deployment by @jcfr in #191
  chore: use wheel tags cli by @mayeut in #84
  ci: allow setting a version by @henryiii in #171
  ci: cancel on repeated pushes by @henryiii in #177

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-ninja/no-scikit-build.patch            | 8 ++++----
 ...{python3-ninja_1.11.1.bb => python3-ninja_1.11.1.1.bb} | 4 +++-
 2 files changed, 7 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-ninja_1.11.1.bb => python3-ninja_1.11.1.1.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-ninja/no-scikit-build.patch b/meta-python/recipes-devtools/python/python3-ninja/no-scikit-build.patch
index 276fb5017..b7d191e24 100644
--- a/meta-python/recipes-devtools/python/python3-ninja/no-scikit-build.patch
+++ b/meta-python/recipes-devtools/python/python3-ninja/no-scikit-build.patch
@@ -8,11 +8,11 @@ diff --git a/pyproject.toml b/pyproject.toml
 index b895c20..577b642 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
-@@ -1,7 +1,6 @@
- [build-system]
+@@ -2,7 +2,6 @@
  requires = [
-     "setuptools>=42",
--    "scikit-build>=0.12",
+     "setuptools >=42",
+     "setuptools-scm[toml]",
+-    "scikit-build",
  ]
  build-backend = "setuptools.build_meta"
  
diff --git a/meta-python/recipes-devtools/python/python3-ninja_1.11.1.bb b/meta-python/recipes-devtools/python/python3-ninja_1.11.1.1.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-ninja_1.11.1.bb
rename to meta-python/recipes-devtools/python/python3-ninja_1.11.1.1.bb
index 3b9077f32..a9e0ed208 100644
--- a/meta-python/recipes-devtools/python/python3-ninja_1.11.1.bb
+++ b/meta-python/recipes-devtools/python/python3-ninja_1.11.1.1.bb
@@ -6,11 +6,13 @@ PYPI_PACKAGE = "ninja"
 PYPI_ARCHIVE_NAME_PREFIX = "pypi-"
 
 inherit pypi python_setuptools_build_meta
-SRC_URI[sha256sum] = "c833a47d39b2d1eee3f9ca886fa1581efd5be6068b82734ac229961ee8748f90"
+SRC_URI[sha256sum] = "9d793b08dd857e38d0b6ffe9e6b7145d7c485a42dcfea04905ca0cdb6017cc3c"
 
 SRC_URI += "file://no-scikit-build.patch \
             file://run-ninja-from-path.patch"
 
+DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+
 do_install:append () {
 	rm -rf ${D}${bindir}
 }
-- 
2.34.1


