Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08162C83F1D
	for <webhook@archiver.kernel.org>; Sun, 13 Jul 2025 15:10:24 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.58332.1752419419843003624
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Jul 2025 08:10:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D2QRiJXB;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ae3a604b43bso596624766b.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 13 Jul 2025 08:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752419418; x=1753024218; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P5DQG9eZDAPe7bvs/s74ULwDwEMI8cImGAVFke0i1/U=;
        b=D2QRiJXBC9wawtjCPHeeYM4ubn6FZkWdKrFbgte7K5rvm6o5qWhH90sKM02/uzG+zW
         ltgLrhUP1+COhx1NBtE8CIe0Y61a1LlggqeJbEWShvaenjwokbKpcYoutsMlwoSE6z9F
         jpSm5KL1zz1ifNq9l2f8JiPXhN7rr3I6OT6f04CPaIXqNJYkOWP4ZCpipjZF7ClNluBz
         DK6z+sSwfjLZ2aYeYjks6kLMTDTIDWGqIE9y0cS2H9pxOCp4fdwnPdpTB7z8/Eot+SKL
         FZj2BTf0JNwzJO4zFmU7tRu7wIWyue1OGGRagwSUmZHYr2w9/8UnlmBpbcr3RgsSi0tC
         6Njw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752419418; x=1753024218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P5DQG9eZDAPe7bvs/s74ULwDwEMI8cImGAVFke0i1/U=;
        b=CiX3JrIW2OKvHbz32DLfPadixOPXn+AJ665FxA4cO/7rFibr89K44ms72Y98BqokVj
         ulmnKG/4mH+st3ElxUth7h66/+ocOJ8IlTisTDrP1iWfpC8TJ1yxIxU0rOehDxX7A7pl
         DZKhiTzuEaLdkUlBWltyByT1RHZpqd8V6K8LlwL/pW7dolUeEgcW6m4GaTkvmmFnJKv1
         ebZnQeF6A/RA1LQ0GCxjp6DVt08wzzif/cLF8MMiyIj9f/yWbW4Cm9Y0suXhRHi37LIv
         fYz0LOo92NZlh2YDcawQObVKMGb1Ax0QrJhDVU7ZWHb5OVivJSvUHvfLx3W51h4XltVa
         EHiw==
X-Gm-Message-State: AOJu0YwuTFQXWibbIbaUl+qfT7W+o8GWUSoTICwJ8J59ernJv1+uOfC4
	NX96fEEdS1uqex92ljIkgEAC6YNV4bg1++zLa2bskeLpaNgCLO5Kyw8AdOOrb/+7
X-Gm-Gg: ASbGncuqoIrrzBV3wpqNnhWjhVsTGNz1vLC62QWr6o4Dhul/X8kfaC7ByTRw0vdulEJ
	4yHs2RfnVLxm+QUetezhWD0f5/tLQBpMSTWT273Aqp5h1dyDYVrP6xbII6m5res0nxlL8TAn+Oa
	tWDeRxaqWSnnPPhRTTsZ8TJtMXjlRg5qS2UymSABXUpIsRTRQviWAdz7LgebgE5IQaYOmqielNb
	PnkTofPaXXkl/oQZJvajdBS4Lz00P73khEaH/mfbPv5tlICAoQRLfbPbPYHon8DJxkNu1x4o6Kz
	TRGDSOlKeUY5Ksw3eShfd2zCZNnSXw3dk/h2d3DWPpbiYSpNaTSf0h17RR3iimfC+9kJNm80e1U
	uQ8jml8Uk6GlImhc4HnF6tDIC/V6ByG+ObZrzuzFTCd5QICIfoj4WJIMl4baPghX/rk8PAd6iVu
	q1
X-Google-Smtp-Source: AGHT+IHGuTntl0BMKsnSjrYxUucer/ueRVe2RfxGh2CjDIwGSmbe5d7/vxCDOaf3j66drtuLGQ7Vyw==
X-Received: by 2002:a17:907:9627:b0:ae3:6028:e4d0 with SMTP id a640c23a62f3a-ae6fbc13b26mr1042337266b.7.1752419417372;
        Sun, 13 Jul 2025 08:10:17 -0700 (PDT)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8294c0asm650493066b.127.2025.07.13.08.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 08:10:16 -0700 (PDT)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 2/6] python3-pylint: 3.3.6 -> 3.3.7
Date: Sun, 13 Jul 2025 17:09:36 +0200
Message-ID: <20250713150938.2992477-4-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250713150938.2992477-2-t.f.g.geelen@gmail.com>
References: <20250713150938.2992477-2-t.f.g.geelen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Jul 2025 15:10:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118509

---
 .../0001-Adjust-test-expectations-for-ptest.patch      |  6 ++++--
 ...oject.toml-Keep-tool.setuptools.license-files.patch |  7 ++-----
 ...python3-pylint_3.3.6.bb => python3-pylint_3.3.7.bb} | 10 +++++-----
 3 files changed, 11 insertions(+), 12 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pylint_3.3.6.bb => python3-pylint_3.3.7.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-pylint/0001-Adjust-test-expectations-for-ptest.patch b/meta-python/recipes-devtools/python/python3-pylint/0001-Adjust-test-expectations-for-ptest.patch
index 769cd145e1..46dbe39aef 100644
--- a/meta-python/recipes-devtools/python/python3-pylint/0001-Adjust-test-expectations-for-ptest.patch
+++ b/meta-python/recipes-devtools/python/python3-pylint/0001-Adjust-test-expectations-for-ptest.patch
@@ -1,4 +1,4 @@
-From f3a213cf4922c122e554277ea2031c0c54cd3fe5 Mon Sep 17 00:00:00 2001
+From b23f3031db65e6e98826639755e26f4b169f9e52 Mon Sep 17 00:00:00 2001
 From: Dan McGregor <dan.mcgregor@vecima.com>
 Date: Wed, 13 Mar 2024 14:08:25 -0600
 Subject: [PATCH] Adjust test expectations for ptest
@@ -12,9 +12,11 @@ Signed-off-by: Dan McGregor <dan.mcgregor@vecima.com>
  tests/functional/w/wrong_import_order.txt | 22 +++++++++++-----------
  1 file changed, 11 insertions(+), 11 deletions(-)
 
+diff --git a/tests/functional/w/wrong_import_order.txt b/tests/functional/w/wrong_import_order.txt
+index 9f143c292..a283467af 100644
 --- a/tests/functional/w/wrong_import_order.txt
 +++ b/tests/functional/w/wrong_import_order.txt
-@@ -3,14 +3,14 @@ wrong-import-order:14:0:14:10::"standard
+@@ -3,14 +3,14 @@ wrong-import-order:14:0:14:10::"standard import ""sys"" should be placed before
  wrong-import-order:15:0:15:15::"standard import ""datetime"" should be placed before third party imports ""six"", ""astroid.are_exclusive""":UNDEFINED
  wrong-import-order:18:0:18:22::"third party import ""totally_missing"" should be placed before local import ""package.Class""":UNDEFINED
  wrong-import-order:20:0:20:14::"third party import ""astroid"" should be placed before local imports ""package.Class"", "".package""":UNDEFINED
diff --git a/meta-python/recipes-devtools/python/python3-pylint/0002-pyproject.toml-Keep-tool.setuptools.license-files.patch b/meta-python/recipes-devtools/python/python3-pylint/0002-pyproject.toml-Keep-tool.setuptools.license-files.patch
index 28ed0c8951..a0496232cd 100644
--- a/meta-python/recipes-devtools/python/python3-pylint/0002-pyproject.toml-Keep-tool.setuptools.license-files.patch
+++ b/meta-python/recipes-devtools/python/python3-pylint/0002-pyproject.toml-Keep-tool.setuptools.license-files.patch
@@ -1,4 +1,4 @@
-From 2a08adb0e90219626dac0b6d05a21265e460eae2 Mon Sep 17 00:00:00 2001
+From a1ec7fa97cb73754cb250a9cf0ea95b9d0511e0c Mon Sep 17 00:00:00 2001
 From: Leon Anavi <leon.anavi@konsulko.com>
 Date: Thu, 20 Mar 2025 12:09:42 +0000
 Subject: [PATCH] pyproject.toml: Keep tool.setuptools.license-files
@@ -20,7 +20,7 @@ Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
  1 file changed, 4 insertions(+), 2 deletions(-)
 
 diff --git a/pyproject.toml b/pyproject.toml
-index 0cf1ade57..7a4665ce0 100644
+index a3cc3f43b..5eaf5ee5e 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
 @@ -8,8 +8,7 @@ name = "pylint"
@@ -43,6 +43,3 @@ index 0cf1ade57..7a4665ce0 100644
  [tool.setuptools.packages.find]
  include = [ "pylint*" ]
  
--- 
-2.39.5
-
diff --git a/meta-python/recipes-devtools/python/python3-pylint_3.3.6.bb b/meta-python/recipes-devtools/python/python3-pylint_3.3.7.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-pylint_3.3.6.bb
rename to meta-python/recipes-devtools/python/python3-pylint_3.3.7.bb
index 04761471d3..c4885ff7b4 100644
--- a/meta-python/recipes-devtools/python/python3-pylint_3.3.6.bb
+++ b/meta-python/recipes-devtools/python/python3-pylint_3.3.7.bb
@@ -3,11 +3,11 @@ HOMEPAGE = "https://www.pylint.org/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c107cf754550e65755c42985a5d4e9c9"
 
-SRCREV = "7ac5a4d4f77576df3a00e63f86ca86e0e1780b47"
-SRC_URI += "git://github.com/pylint-dev/pylint;branch=maintenance/3.3.x;protocol=https \
-            file://0001-Adjust-test-expectations-for-ptest.patch \
-            file://0002-pyproject.toml-Keep-tool.setuptools.license-files.patch \
-            file://run-ptest \
+SRCREV = "f798a4a3508bcbb8ad0773ae14bf32d28dcfdcbe"
+SRC_URI += "git://github.com/pylint-dev/pylint;branch=main;protocol=https \
+           file://0001-Adjust-test-expectations-for-ptest.patch \
+           file://0002-pyproject.toml-Keep-tool.setuptools.license-files.patch \
+           file://run-ptest \
            "
 
 inherit python_setuptools_build_meta ptest
-- 
2.43.0


