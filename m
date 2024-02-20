Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80F3DC5475B
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 00:48:10 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.2712.1708390088054622814
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 16:48:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mmfOopw7;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6e471f5f1a5so623643b3a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 16:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708390087; x=1708994887; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UHqloxnFWeqQ8U/yBEC4lW5oHIzDNJ54u0ayjKjNmBs=;
        b=mmfOopw7+2ZfR3PCTOT7lh+K68Y6f/zU7qBBwvPPkZrcYlFGAxclGZglfUXapXAPxF
         XCnhO6WFSjf6XWn3WBJ3DniVV67imeEqZE3Bl4ChhuaTLcrgX2TmVnc8YOJI3CQ0LiQu
         fGrZ5vPNtfnujB/RFupbTcnNBW67C5NZLCNmK/50CvnnBEhxMGP7QLqjSoMYjv10b9aM
         FFqnziQGSWZteiKdf+9/rnnCTEY4FRE75G3j0l6bV4u5+3gaY3PBVLYSMm1YUH4j07jt
         sjThTCdKwgDK8d0sNNQE2Pbac9SaqYLHlTfZf7ddMVeiW+F+kq5s4U/3a6hXZw0GBIN6
         ERdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708390087; x=1708994887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UHqloxnFWeqQ8U/yBEC4lW5oHIzDNJ54u0ayjKjNmBs=;
        b=HopXDFhwMxou9+BndwUCXG58f1TFYxVzyC4hvPQnJlsLCuWB+PsARwJjsqr9wyTfXM
         q1Lj5tq+4SiBf93Ap8omoRiRLKdHUfeJkjtjXTaKWH9cgf2KFXkffk1AWJAxfjebJYvT
         bJrqt9d577awR1JOHSNjMSeiwb73UZCWVznylPyZBvilfuKsMKbkwQIsVKaBxBNp008O
         UM1JfjLpN5fokbuW6t98VRxFObeRv2rLFItCX78qJhlA/4jTuvP1ecIX7oj/JKA9QHia
         7a+yB8NP4elZbMimu1oOJylt0FPeiTyUP7xLOO47gAsw9q/DrMfAQQCc8KwA5WTXhcmc
         sb/w==
X-Gm-Message-State: AOJu0YweBOlXpHIuxVrHDOcVWnZUUYlM/m9udfMcTYkIcdc3Z+o2KSzc
	sxOLAZKaSchDITOIMRsUubMfP6/0aPiXVpvj4z7RwqE4MegZMqP250GFqqqN
X-Google-Smtp-Source: AGHT+IFThTXqMMojQy/a/4zAhhH5goIFSYdOmkkra6jJ1cTJYECFB13sR68f95zo0u4Ab5sZP6jVTw==
X-Received: by 2002:a05:6a00:9395:b0:6e4:7146:f139 with SMTP id ka21-20020a056a00939500b006e47146f139mr2927070pfb.19.1708390087151;
        Mon, 19 Feb 2024 16:48:07 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id e15-20020a056a0000cf00b006e3be1a64f7sm4101548pfj.160.2024.02.19.16.48.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 16:48:06 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 3/3] python3-pytest-lazy-fixture: drop recipe
Date: Mon, 19 Feb 2024 16:47:46 -0800
Message-Id: <9be5a7a0f31b41dfb03a0f94e80a01eeccb3231d.1708389659.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708389659.git.tim.orling@konsulko.com>
References: <cover.1708389659.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 00:48:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108897

This recipe is no longer maintained (since 2020) and is not compliant with python3-pytest_8.0.0+.

The only dependency in meta-python was the old version of python3-prettytable-ptest, which now
RDEPENDS upon python3-pytest-lazy-fixtures (with the s).

Drop the recipe
Drop it from packagegroup-meta-python
Drop it from PTEST_PROBLEMS in ptest-packagelists-meta-python.inc

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 -
 .../packagegroups/packagegroup-meta-python.bb |  3 +--
 .../python3-pytest-lazy-fixture/run-ptest     |  3 ---
 .../python3-pytest-lazy-fixture_0.6.3.bb      | 26 -------------------
 4 files changed, 1 insertion(+), 32 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pytest-lazy-fixture/run-ptest
 delete mode 100644 meta-python/recipes-devtools/python/python3-pytest-lazy-fixture_0.6.3.bb

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 5985482628..097d5e184c 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -79,7 +79,6 @@ PTESTS_PROBLEMS_META_PYTHON ="\
     python3-parse \
     python3-pillow \
     python3-pint \
-    python3-pytest-lazy-fixture \
     python3-pyzmq \
     python3-scrypt \
     python3-service-identity \
diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 41fce53274..eb5a264631 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -348,7 +348,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-pytest-forked \
     python3-pytest-helpers-namespace \
     python3-pytest-html \
-    python3-pytest-lazy-fixture \
+    python3-pytest-lazy-fixtures \
     python3-pytest-metadata \
     python3-pytest-tempdir \
     python3-pytest-timeout \
@@ -507,7 +507,6 @@ RDEPENDS:packagegroup-meta-python3-ptest = "\
     python3-pyasn1-modules-ptest \
     python3-pyroute2-ptest \
     python3-pyserial-ptest \
-    python3-pytest-lazy-fixture-ptest \
     python3-pytoml-ptest \
     python3-pyzmq-ptest \
     python3-requests-file-ptest \
diff --git a/meta-python/recipes-devtools/python/python3-pytest-lazy-fixture/run-ptest b/meta-python/recipes-devtools/python/python3-pytest-lazy-fixture/run-ptest
deleted file mode 100644
index 8d2017d39c..0000000000
--- a/meta-python/recipes-devtools/python/python3-pytest-lazy-fixture/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-pytest-lazy-fixture_0.6.3.bb b/meta-python/recipes-devtools/python/python3-pytest-lazy-fixture_0.6.3.bb
deleted file mode 100644
index 9c50528fb0..0000000000
--- a/meta-python/recipes-devtools/python/python3-pytest-lazy-fixture_0.6.3.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-# Copyright (C) 2022 Wind River Systems
-
-SUMMARY = "Use your fixtures in @pytest.mark.parametrize."
-HOMEPAGE = "https://github.com/tvorog/pytest-lazy-fixture"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=aae6f2b7c9b3ced83e0b5bb42346d4dd"
-
-SRC_URI[sha256sum] = "0e7d0c7f74ba33e6e80905e9bfd81f9d15ef9a790de97993e34213deb5ad10ac"
-
-SRC_URI += "file://run-ptest \
-           "
-
-
-inherit ptest pypi setuptools3
-
-do_install_ptest() {
-    install -d ${D}${PTEST_PATH}/tests
-    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-
-
-RDEPENDS:${PN} += "python3-core python3-pytest"
-RDEPENDS:${PN}-ptest = " \
-    python3-unixadmin \
-    python3-unittest-automake-output \
-    "
-- 
2.34.1


