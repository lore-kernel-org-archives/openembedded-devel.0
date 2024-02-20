Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB3C3C48BC3
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 04:32:21 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.6483.1708403537816284769
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 20:32:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=acEkr08J;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1dba6b9b060so23842115ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 20:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708403537; x=1709008337; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=szGtJlWnNghT3qusMmbNUEAemYF6jak8rt0d6w+GhsI=;
        b=acEkr08JS5I+7yMEayGS0HJnGTBdNx05YqvS8IZ6EYpoW84H4qD0z4SloD3WRvQ8oo
         uzUc2iqzLynDxIZsznZtmq6VJ30BzNXiXgmyygvOk/QQRynTTfj3EoRkoKojxVxjLaZM
         sVW3kzlJmno0pfi2CS4sXgxVa54lWzdRHBtBHi0Cm6ce5ATJMq9+YAV5rt9x4N8yOWaT
         LXdmAg85qeYcngW1IeQOZFANV/C2AUGJQBqfyidK0ROLK2+qtGCw3ID8471n+A6KfKjg
         2f7+S4o6jURl/IpA+l7oOPKx/kcMiTIuTuAW0LIwbURDzJzFYSNFGUUoDKlzqFPirP8B
         ZnsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708403537; x=1709008337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=szGtJlWnNghT3qusMmbNUEAemYF6jak8rt0d6w+GhsI=;
        b=ewqedv2E6eE8sn7mz4t6DknslQGtvR9ZjVqP2z0LAYjEE/g8M4CH0geSSFj3lwepXL
         Vi8yVlHJ7F37T0RsYCgMw+Nz2P0wX0pEF+tY9BR0nSHxa71+M80gJ9ufn9xmyegFJr1r
         iqicF5W5rIGas7jUZ3y2LB4gYdB34i/YQgg8aZeREZrcj+mw6GdnCxNwlgS2HCmIFxfe
         J4I56BSX5TLto5o5bSnZsXa5VmfthOA2bk9uYS/tloE3U8FamNVri8KGGZ7+fOeHxJUV
         T8jCJUpg44q+lquuDQhwQKyK5S+ieD8MP3JqB0iXvY3T4uqiFWvgHfrAcjT876Q72E1p
         AAGg==
X-Gm-Message-State: AOJu0Ywb0gPEbRNnNwrH+cD83kv4sUJt9+Aanlnwe/CXvFCE2fbox+km
	iPF0Me9eJ6v10UdcuPNPKQhXnOYX4BqdPCpQkRKyBFxL0v6MMWxEsWXqWto2
X-Google-Smtp-Source: AGHT+IEax28NG2uWEqx+Yd8JWaEyctjEdw5gjNmq3/sALUJDuG+fGmCHNhQFhDuplF1uA8GEshW5lQ==
X-Received: by 2002:a17:902:f689:b0:1db:bd10:7859 with SMTP id l9-20020a170902f68900b001dbbd107859mr12646650plg.24.1708403536706;
        Mon, 19 Feb 2024 20:32:16 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id g14-20020a63110e000000b005dc88b232a5sm5490269pgl.26.2024.02.19.20.32.16
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 20:32:16 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH v2 3/3] python3-pytest-lazy-fixture: drop recipe
Date: Mon, 19 Feb 2024 20:31:53 -0800
Message-Id: <6480f77b2b945ac61e146eeda9e47c11b61a0cbd.1708403129.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708403129.git.tim.orling@konsulko.com>
References: <cover.1708403129.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 04:32:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108910

This recipe is no longer maintained (since 2020) and is not compliant with python3-pytest_8.0.0+.

The only dependency in meta-python was the old version of python3-prettytable-ptest, which now
RDEPENDS upon python3-pytest-lazy-fixtures (with the s).

* Drop the recipe
* Drop it from packagegroup-meta-python
* Drop it from PTEST_PROBLEMS in ptest-packagelists-meta-python.inc

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
Changes in v2:
Rebased on top of rebased timo/drop-PYTHON_PN on top of master-next

 .../ptest-packagelists-meta-python.inc        |  1 -
 .../packagegroups/packagegroup-meta-python.bb |  3 +--
 .../python3-pytest-lazy-fixture/run-ptest     |  3 ---
 .../python3-pytest-lazy-fixture_0.6.3.bb      | 26 -------------------
 4 files changed, 1 insertion(+), 32 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pytest-lazy-fixture/run-ptest
 delete mode 100644 meta-python/recipes-devtools/python/python3-pytest-lazy-fixture_0.6.3.bb

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index fe8f07c851..a9349345bb 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -80,7 +80,6 @@ PTESTS_PROBLEMS_META_PYTHON ="\
     python3-ordered-set \
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


