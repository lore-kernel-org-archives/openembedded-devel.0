Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 452EAC83F38
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 14:36:49 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.337.1752763007775411305
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Jul 2025 07:36:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=LTeEIVi3;
 spf=pass (domain: konsulko.com, ip: 209.85.208.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6077dea37easo1704746a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 17 Jul 2025 07:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1752763006; x=1753367806; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=121RsvGtX2w9hZ4y6/paBol3xcaA9tZCG+VMmFz1DGs=;
        b=LTeEIVi3oSJ6fR7Q1u/FumQr5umFeZeuoDkDdEXUF9MawrsnotNoSl7TCZi0OmhEVK
         hz4GLoZxTrFs1Fc9hyfjQp7OLQ64fH8ujxdUABvof8uKQKkCuw+1S0+YmxBVe/jQR9RF
         h1M4zE950DK5yKknezWKD0w9Sj7STHmfWASQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752763006; x=1753367806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=121RsvGtX2w9hZ4y6/paBol3xcaA9tZCG+VMmFz1DGs=;
        b=tJ0oqyeVm5lFJ4Y36knIB+H0ZfGDvc6I96W8LAMnnl9yR0Wa3NX8XGyJteo1xWL7IF
         GrBrbbKEekpqP6q0MPecTwK0d/nMU/gn1cKANqXiF+9Pe//0x+LIKolHvlu76IytF4rV
         nrgir7ij+09n0BmOO1hWAM36adQKwjTDjgmFXY17Y58qk7lWIlea6aXtDEUH2Gbd81U1
         PVNZclDC85thCes5x70oq7q6uUYm9W1dLSKDNzwOlXNV9EwToz7Q6Zb+2QTB/gnvsktd
         nE62zM7xMxa9ch3P5y0+I+OGrZGP4vWxPw06xCYRf/xZmQX02J3n4P7GD31cFMi70a9P
         kBTg==
X-Gm-Message-State: AOJu0YzNV/hamfT6ZNO9MtMycoS5Brn9SvRZLFoNGpfwQ30n/S4Issg1
	gTRUutJDYVjmPaNorI1N7IquXUjZXz0JUTd83SK6+higTgzw8uiS7isdWkw0su21LCnGpDJOtdB
	ABhDT
X-Gm-Gg: ASbGncu+YWaP1d/jHLOXR1lXBZWiimitBUrVg1AF1YRWgoGAlg2D8lc2/ECZWfsmQeq
	weVnYOs4wrBbANG8Kggq6MqZNa7AJnpggJrMZ2nE8W58HdtPlfzisQ6PlOKqqSHPL3mBg898NTj
	JpTEq1AcucnM5Omz0obt9AHYHqVe149iarCvW2vL23u+NXESEi18OTTKLW/9HRBnbaCXNths8p0
	TPXSip8BdDr2kEQKB6RJyMISKqFh3XJjsqcUP0mtrHybuCknELUimESB3ozrJgo2hrXZQsklIS8
	D6dwcfOtUTAaZJ+T8V4LJDcD89AdTEk+lgJ8+1euEKyc8uAmIZVGI6NIlc+1xFo6ZSR7NkebGg7
	eGaXRZK30HpmhVvf1BTvMJ6scquYsH3b5Ywcp
X-Google-Smtp-Source: AGHT+IGLWuXEYJ0g9ErPUzIFvKs1E3xH2ORRROmk3mQkDdkBzXfR7EY+xR4gvp6VZ5LYfWuuHcDspQ==
X-Received: by 2002:a17:907:d2cd:b0:ae3:60fb:1b3b with SMTP id a640c23a62f3a-ae9ce1b162dmr640188166b.58.1752763005702;
        Thu, 17 Jul 2025 07:36:45 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df562sm1357696266b.164.2025.07.17.07.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 07:36:44 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCHv2 2/2] python3-charset-normalizer: Update mypy
Date: Thu, 17 Jul 2025 17:36:39 +0300
Message-Id: <20250717143639.1004847-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250717143639.1004847-1-leon.anavi@konsulko.com>
References: <20250717143639.1004847-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Jul 2025 14:36:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118613

Apply a patch to update the requirements on mypy to permit the
latest version.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...project.toml-Update-mypy-requirement.patch | 28 +++++++++++++++++++
 .../python3-charset-normalizer_3.4.2.bb       |  2 ++
 2 files changed, 30 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-charset-normalizer/0001-pyproject.toml-Update-mypy-requirement.patch

diff --git a/meta-python/recipes-devtools/python/python3-charset-normalizer/0001-pyproject.toml-Update-mypy-requirement.patch b/meta-python/recipes-devtools/python/python3-charset-normalizer/0001-pyproject.toml-Update-mypy-requirement.patch
new file mode 100644
index 0000000000..44b5283359
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-charset-normalizer/0001-pyproject.toml-Update-mypy-requirement.patch
@@ -0,0 +1,28 @@
+From ee56a688a46a2abc2ca46c061898b27b44fb9602 Mon Sep 17 00:00:00 2001
+From: Leon Anavi <leon.anavi@konsulko.com>
+Date: Thu, 17 Jul 2025 16:23:58 +0300
+Subject: [PATCH] pyproject.toml: Update mypy requirement
+
+Updates the requirements on mypy to permit the latest version.
+
+Upstream-Status: Submitted [https://github.com/jawah/charset_normalizer/pull/632]
+
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
+---
+ pyproject.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index e7f052a..3a75dc1 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -1,5 +1,5 @@
+ [build-system]
+-requires = ["setuptools", "setuptools-scm", "mypy>=1.4.1,<=1.15.0"]
++requires = ["setuptools", "setuptools-scm", "mypy>=1.4.1,<=1.17.0"]
+ build-backend = "setuptools.build_meta"
+ 
+ [project]
+-- 
+2.39.5
+
diff --git a/meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.2.bb b/meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.2.bb
index e62306fff3..e98f823247 100644
--- a/meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.2.bb
@@ -3,6 +3,8 @@ HOMEPAGE = "https://github.com/ousret/charset_normalizer"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=48178f3fc1374ad7e830412f812bde05"
 
+SRC_URI += "file://0001-pyproject.toml-Update-mypy-requirement.patch"
+
 SRC_URI[sha256sum] = "5baececa9ecba31eff645232d59845c07aa030f0c81ee70184a90d35099a0e63"
 
 DEPENDS += "python3-setuptools-scm-native python3-mypy-native"
-- 
2.39.5


