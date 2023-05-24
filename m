Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDEF9C7EE31
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 07:53:13 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.3575.1684914785093992289
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 00:53:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Ld/4eY72;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-50c8d87c775so1163646a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 00:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684914783; x=1687506783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28gm8/CKodUHGRlKkH4w5sX8lsKVxUo70kuRkNK12mU=;
        b=Ld/4eY72fOyX/r8DRAhRn9wD7DvFGvnnWNoJ4Myl/atvfEnOWHkf5KuBDl/dnv4V1n
         zUJkJrOnxQ8dAIyBFg1oTPK1wYetROYsQ8wdoh38O1+6ryrUQCeKokv9TPwvj1rBizXi
         /DSfz1CxXl04kCe1UkidgiJsNNhLPFr57XMNE0tlokZRRRKMEOTtMJ3sp9WmZ6FTD0bd
         A38r5bIKatK6kryKq8ndfCqh0W5NagIe/UcQAjhRF1XZ0aC0gPj1PKR8uHtKIdRinMCq
         PTISNNH6PiEAuMEAjLWInNCJFOifzN7UTMHrr+Yd+3QRCgvtY53Y74qrYKT7o4n+b08/
         GDVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684914783; x=1687506783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=28gm8/CKodUHGRlKkH4w5sX8lsKVxUo70kuRkNK12mU=;
        b=EiGHgd7n5uZ4wmd0IhZFTaLCKWLTCSsAzSgG0b7FgKzsEXq3tzbjilbYH/RIXsdcAK
         /EEDT3J/pKD6vIR9uDrzelE2zkvWTl5N7CCMwc+joFwCybhQ2ygR9kxvpYH7X8aeActF
         2n1tLGLOvW6CMU7QCYYsZ6bTwvdYYAxySVinbPSYGt2El9sgiwtEH5cq1ZHlpOkYGaS2
         CaAJNI2Q3fGd++OHoVnavfCoJbuhF+oVhNs6SxUwLrOuUTG+Ww1WwuRYpNigJ77X+4sR
         5n9Z7CEEHR0albVfAROHVObeGc6Mw7TE3XGajcDSJx5xxHS/8UAu40c1e2Q3U1ucZ9GP
         zBxw==
X-Gm-Message-State: AC+VfDzZZlodiBKN/+KgxG8+Rw/3fCNu19ru8Fn+zhshODhmlBYVzv16
	W/3KqNSBNq36e6DlL2JS7FAB8J/8q9g=
X-Google-Smtp-Source: ACHHUZ5bH78dMn/KgToreJi84kFT2nBuqJZhqUyGz2mIL6yn+coPuoh6xcSnE1RUG2077kgTZUoTlg==
X-Received: by 2002:a17:906:7087:b0:965:fa3b:7478 with SMTP id b7-20020a170906708700b00965fa3b7478mr13611905ejk.53.1684914783559;
        Wed, 24 May 2023 00:53:03 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id gt24-20020a170906f21800b0096f6a910ab7sm5396996ejb.190.2023.05.24.00.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 00:53:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 04/20] python3-anyjson: remove unused files
Date: Wed, 24 May 2023 09:52:37 +0200
Message-Id: <20230524075253.1033593-4-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524075253.1033593-1-Martin.Jansa@gmail.com>
References: <20230524075253.1033593-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 07:53:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102758

* the recipe was removed in:
  https://git.openembedded.org/meta-openembedded/commit/?id=09abb3ffad217edbbc0c95bc6dda41f2764f2b67

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../0001-setup.py-Do-not-use-2to3.patch       | 29 -------------------
 .../python/python3-anyjson/run-ptest          |  3 --
 2 files changed, 32 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-anyjson/0001-setup.py-Do-not-use-2to3.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-anyjson/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-anyjson/0001-setup.py-Do-not-use-2to3.patch b/meta-python/recipes-devtools/python/python3-anyjson/0001-setup.py-Do-not-use-2to3.patch
deleted file mode 100644
index 2b9e6e52e8..0000000000
--- a/meta-python/recipes-devtools/python/python3-anyjson/0001-setup.py-Do-not-use-2to3.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 4fb61d7c621599b0db9c2c45f4243f07936c5953 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 13 Oct 2021 08:20:00 -0700
-Subject: [PATCH] setup.py: Do not use 2to3
-
-This helps compiling with setuptools 0.58+
-and it seems to compile fine with python3
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- setup.py | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/setup.py b/setup.py
-index 9fe4902..f2098e1 100644
---- a/setup.py
-+++ b/setup.py
-@@ -2,8 +2,6 @@ import os
- import sys
- 
- extra = {}
--if sys.version_info >= (3, 0):
--    extra.update(use_2to3=True)
- 
- try:
-     from setuptools import setup, find_packages
--- 
-2.33.0
-
diff --git a/meta-python/recipes-devtools/python/python3-anyjson/run-ptest b/meta-python/recipes-devtools/python/python3-anyjson/run-ptest
deleted file mode 100644
index b63c4de0d9..0000000000
--- a/meta-python/recipes-devtools/python/python3-anyjson/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
-- 
2.40.1


