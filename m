Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0D4CCC6B38
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 21:07:39 +0000 (UTC)
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8049.1792098458591386364
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 14:07:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JUoY87gb;
 spf=pass (domain: gmail.com, ip: 74.125.82.53, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-15354aa70e8so1200219c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 14:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792098458; x=1792703258; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DDIrBuFWdZxyMbhniRENftWBjkwIUwydzkE7ypbsh/Q=;
        b=JUoY87gbOLoollxC76+26gAzIfyxyACTVrANpOew/wBx+vsK4L1vmxzhfaplpeV9Mn
         q7TZSiSAvCd+vQkcZvBhnYJAOsaBNJnhpjv78ZkD5v2/At/J5drnvPzKLyzOPt6tEz21
         3Q7MNfU48+d8QrdHDMxeyN+TCqY5LlmIfzrzrGduWskReXhbTRtnxBtQI9xJOvCFbpmQ
         kLUu8+jJqpW25pKD5oFEy4PcP7/vInvmVHbhCU1oAh7JwORt12WQtm+mHFn4c+Z3eae8
         pMBCxEz3dmsJsrfvWLSGl995RY3zA1cbjOfE+R5ke0DyRaCU2SsWTEyLNMAQ9Nf28E9b
         /teA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792098458; x=1792703258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DDIrBuFWdZxyMbhniRENftWBjkwIUwydzkE7ypbsh/Q=;
        b=jVFfPWFB/j3izOJQq5nEQOQdAPMboxTQew4RgYadU+sKcLobI5Aj9a8XR5UxgGyqUw
         ITNBkcJMuQjszhW0wP0r/p0phLra+NaGt9heeqLXmQgQoYONn6NJA8uaPdVSdKCeFKsE
         ZKDCpORA5ibVnQca49/eUx7NNBj2PDMfJj+YXB2S+ueM1nBC7UoQQyq6Tv2woElmomsx
         u9fXm/iRvJtNIBpKqFJeKWvbI3hAxNpJtiSatAmRcbJwslxoqFnaEFJG8zn+6qMsl8CU
         uk3RA9KtLHsNqSxVQKI8lvYx0l5UU7OxiCIPQSUA4MU2Q8gO0KIN/QgZ8F1oNZs4aXIj
         bQlA==
X-Gm-Message-State: AFq9FYL6rmxMw39C2c7D5V7K29KsA8mwOIxpYoIAXl0KyWPqBqYbtOww
	F1Cr97RQT92t9AS9zZRwWOba8gKPjAJ57tZxl2ziE3Xc3Ks/WBIDrSmjKdO+E9wacDc=
X-Gm-Gg: AYBFou1iSnVwugbtVv5bJO44pzF3TsJ3naA5W5Ik3Y6PDnbt0EnDuXxtGlIj9vxrgl5
	pqA2dOK7gZDr518cg+7AQYqrJIhZxzdSt9DmHQ7TVBt+JTfb3YQ7a8Qyll0F0BobErugH9cbB0A
	a26TjWlR9HvrG1LI3Prj3/GN1/vGWr+3tmvSJkseh7ld8CnCr6urqGOx+aGYY0P19rAarpYy5HW
	aUd9G6GM0Ew+Tg7JnGF6PSUDJ2YWktYqunKTISc+tTnfKcG+SKzbk6FeBPS2geaceI1D5gtac8e
	DXlzMK2Wyp0cbUew9Ixj2abUaqvapl4nJM+ubEfoAZws3PTdFe3R+7a9qkX4L4MuQ5hhn9IcYk+
	4og4j7qZn7QK6SrJBJqnOj5lheYJQ3bL1oyXoI420paQDx6jxhF96Gt/C4bQQVjvhRjGPELs5GF
	mprT05YSFcavf4nfPx2KQiRsYaIlVKdzw+KrFaODp1dIJe5q0/ju9QL3qhxJcviGTGFxm9pbf8Y
	voiG5t6RSR49ceXy2GovG2DarHQF0OXEu15g2sssqX1k2LG3pwshdH2I9Du3av/4UUkvDUA0eOx
	vRhV2FMGRVzFh5B1LGVVfTjdG9x5Xh445L86ztfHJe3vqHowdB2To//Y+A0e7GQYMQlpBN/u6DZ
	Z6yR42aV/fUbLw70ZVRx3sAtjzd437KN7BEbN0/KAarALmHGsYMKAqrf5bUncd9qzDBapvS1r52
	pM1C9YzrbPGrbXl5Tg0lF5EIjc98GaDW5UbNOmzNRzZ3hVQQ==
X-Received: by 2002:a05:701b:230c:b0:14c:be8e:69fe with SMTP id a92af1059eb24-16a57922026mr27651451c88.5.1792098457743;
        Thu, 15 Oct 2026 14:07:37 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831bd28789sm175479c88.19.2026.10.15.14.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 14:07:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH] python3-cucumber-expressions: Fix build with uv >= 0.13
Date: Thu, 15 Oct 2026 14:07:33 -0700
Message-ID: <20261015210733.3005411-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 21:07:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131010

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...e-dependency-uv_build-to-0.13.0-0.14.patch | 23 +++++++++++++++++++
 .../python3-cucumber-expressions_20.1.0.bb    |  1 +
 2 files changed, 24 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-cucumber-expressions/0001-chore-deps-update-dependency-uv_build-to-0.13.0-0.14.patch

diff --git a/meta-python/recipes-devtools/python/python3-cucumber-expressions/0001-chore-deps-update-dependency-uv_build-to-0.13.0-0.14.patch b/meta-python/recipes-devtools/python/python3-cucumber-expressions/0001-chore-deps-update-dependency-uv_build-to-0.13.0-0.14.patch
new file mode 100644
index 0000000000..5a9796a8b3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cucumber-expressions/0001-chore-deps-update-dependency-uv_build-to-0.13.0-0.14.patch
@@ -0,0 +1,23 @@
+From f643f89f9150dcea8c97c8eda989baeef8a2b24d Mon Sep 17 00:00:00 2001
+From: "renovate[bot]" <29139614+renovate[bot]@users.noreply.github.com>
+Date: Sat, 10 Oct 2026 12:26:36 +0000
+Subject: [PATCH] chore(deps): update dependency uv_build to >=0.13.0,<0.14.0
+
+Upstream-Status: Backport [https://github.com/cucumber/cucumber-expressions/commit/b6e45a7ee46490996bf4a150832b0a4f0b75bad1]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ pyproject.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index 2fb5f57..e8fc3a5 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -1,6 +1,6 @@
+ [build-system]
+ build-backend = "uv_build"
+-requires = ["uv_build>=0.12.0,<0.13.0"]
++requires = ["uv_build>=0.13.0,<0.14.0"]
+
+ [project]
+ name = "cucumber-expressions"
diff --git a/meta-python/recipes-devtools/python/python3-cucumber-expressions_20.1.0.bb b/meta-python/recipes-devtools/python/python3-cucumber-expressions_20.1.0.bb
index c685d7d0ad..8f397e6c69 100644
--- a/meta-python/recipes-devtools/python/python3-cucumber-expressions_20.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cucumber-expressions_20.1.0.bb
@@ -4,6 +4,7 @@ HOMEPAGE = "https://github.com/cucumber/cucumber-expressions"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2b2bb1048cefa23c375b8ce5f13313ea"

+SRC_URI += "file://0001-chore-deps-update-dependency-uv_build-to-0.13.0-0.14.patch"
 SRC_URI[sha256sum] = "0d216ec26e36c71b3e5643f2e72c41f9b266ef04eaa0c7e47a6e3b2caf523b1a"

 inherit pypi python_uv_build

