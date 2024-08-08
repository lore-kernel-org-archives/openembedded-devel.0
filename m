Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 248DCC52D71
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 10:06:57 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.56620.1723111608337494418
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Aug 2024 03:06:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Mc2YmYlq;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f136e23229so7737331fa.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 03:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723111606; x=1723716406; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rXy6tlmqoVQs01+DHGShzGe+E/jIP9JRay814qlxLrU=;
        b=Mc2YmYlqmE5sJKEL99AkcfOrWc82eDm8Hk6k3namJYBwEvubt4HUDIogz6azLp3gEF
         GxMkaVN3g1MMGoxdn+X6hweDPDQOANFQnW0XsL23tZewBC0TXR/KyHDAv/lvxPYoR4AX
         0IO6GMs92CGxwOmFa/Rm7EVZXpRPqYhroNY9Q26SoOtMm4sY0R0s3OV7hwics4Ik1Ojm
         aNj8V5u2iKTKQDvx/8tPTOMzgdpDqX3m9pQW3QkKQbHS5VF7/PPqNP5oHT0gh0Z2PCK2
         i1f2XEUggssg4Vpa+x350CnFAlkl7hCLPWPxbS9r4pRMHBuq1Wpjb+Wt2f+sY0E9rIX7
         hbuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723111606; x=1723716406;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rXy6tlmqoVQs01+DHGShzGe+E/jIP9JRay814qlxLrU=;
        b=Ov4vaqC3agylB7tId1cpeSsuu2uL+TdADsM2rsdzMv5Hs/iCr2hyZVfeBTsKlIuO4d
         iC0zGlsNiqysiQtbDK5lv+OOV5XBUJEVn88blpw+tE8wY2s5L9lyOtN7MIiR3EzrjJwR
         G87/hOdcsLsuO2iGYIRHWxOxziE8M7c5o36pEb7Yqo8aXaGK+FYxeg/D1zkiegl1ZX9u
         bA4o7bae1ommiODoZ+ft6+5mBlLJ5g98jo0fcxRfqZ9CsP12/hLJWyw5EiQiOy5LEJAG
         Qo5YZ+yd8FwKOpLB8WG48NYqI2B0wm0alw3mbKmUtuyBnPujVkvKHdCHgGnQavz9hos3
         SeUw==
X-Gm-Message-State: AOJu0YyHZgk9faFPoHkQQAfPhPInk2zjDbxHcyiRv316cFsk/UZwMQEK
	vXqYq1O1guOp/ik5DpizyN+0xLlyxs3aHU4M/GXesm08O915lY+IFo3eDW5d
X-Google-Smtp-Source: AGHT+IHxW57gu19W/c+z4UWyamBe5mjdcOGoSHfLLKpaEVRcRCj/BNFvo1F3VElXbe0nhRyOVJFTpg==
X-Received: by 2002:a2e:9817:0:b0:2f1:9120:c920 with SMTP id 38308e7fff4ca-2f19de77c79mr9405081fa.45.1723111605197;
        Thu, 08 Aug 2024 03:06:45 -0700 (PDT)
Received: from localhost.localdomain ([176.33.65.192])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36d27193d40sm1378815f8f.64.2024.08.08.03.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 03:06:44 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-aioserial: switch to PEP-517 build backend
Date: Thu,  8 Aug 2024 13:06:37 +0300
Message-Id: <20240808100637.23410-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 10:06:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111650

- The project has a proper pyproject.toml which declares the poetry.core.masonry.api PEP-517 backend.

- The PyPi package name (defaults to PN without the python3- prefix), so there is no need to set PYPI_PACKAGE as aioserial, it is by default.

- The upstream pyproject.toml says it needs to be built with the Poetry frontend, but that's deprecated behaviour and it should use the Poetry Core API instead.

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 ...poetry-core-for-pyproject-base-build.patch | 29 +++++++++++++++++++
 .../python/python3-aioserial_1.3.1.bb         |  5 ++--
 2 files changed, 31 insertions(+), 3 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-aioserial/0001-use-poetry-core-for-pyproject-base-build.patch

diff --git a/meta-python/recipes-devtools/python/python3-aioserial/0001-use-poetry-core-for-pyproject-base-build.patch b/meta-python/recipes-devtools/python/python3-aioserial/0001-use-poetry-core-for-pyproject-base-build.patch
new file mode 100644
index 000000000..139bdb4f5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aioserial/0001-use-poetry-core-for-pyproject-base-build.patch
@@ -0,0 +1,29 @@
+From 5798a250b465572d84a024389b173dc996690b03 Mon Sep 17 00:00:00 2001
+From: alperak <alperyasinak1@gmail.com>
+Date: Thu, 8 Aug 2024 12:56:31 +0300
+Subject: [PATCH] Use poetry-core for pyproject base build
+
+https://github.com/python-poetry/poetry-core#why-is-this-required
+
+Upstream-Status: Pending
+
+Signed-off-by: alperak <alperyasinak1@gmail.com>
+---
+ pyproject.toml | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index 6243bff..06bc409 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -15,5 +15,5 @@ python = "^3.6"
+ pyserial = "*"
+
+ [build-system]
+-requires = ["poetry>=0.12"]
+-build-backend = "poetry.masonry.api"
++requires = ["poetry-core>=0.12"]
++build-backend = "poetry.core.masonry.api"
+--
+2.25.1
+
diff --git a/meta-python/recipes-devtools/python/python3-aioserial_1.3.1.bb b/meta-python/recipes-devtools/python/python3-aioserial_1.3.1.bb
index 8279f2704..5acbcbf97 100755
--- a/meta-python/recipes-devtools/python/python3-aioserial_1.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-aioserial_1.3.1.bb
@@ -5,11 +5,10 @@ SECTION = "devel/python"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=650b9179efef1ea560df5c08bc32b494"
 
-PYPI_PACKAGE = "aioserial"
-
+SRC_URI += "file://0001-use-poetry-core-for-pyproject-base-build.patch"
 SRC_URI[sha256sum] = "702bf03b0eb84b8ef2d8dac5cb925e1e685dce98f77b125569bc6fd2b3b58228"
 
-inherit pypi setuptools3
+inherit pypi python_poetry_core
 
 RDEPENDS:${PN} += " \
     python3-asyncio \
-- 
2.25.1


