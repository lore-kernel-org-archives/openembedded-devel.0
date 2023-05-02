Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C8FEC77B7E
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 16:50:14 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web10.1309.1683046211277712019
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 May 2023 09:50:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=vZKeSyoM;
 spf=pass (domain: baylibre.com, ip: 209.85.219.49, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-5ef6135d2a8so19258646d6.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 May 2023 09:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1683046210; x=1685638210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JrZuHx77Tp1GZhiS9w/9F9nwUhdlQQdju884mo+xqzE=;
        b=vZKeSyoMM3hayH4xRUMKgjbuezvGUUstWJkJpj1H8brpLe5rBrEM5Gt80jE879U0Tx
         p+hJBBcXEc0Bv2x1ZkR8sei5tUotekjQYckmhlLaACCKgbYV3VumCCPv3h/ln8Njt+10
         VWemuYku025xv80YAsWH9jwt7pSscf70U0kCXHJbriC3ECVklwIgmQzHstuSrTc2jjKM
         kO3suF6ULhmsiJ/+BauGFFQgoq9RklwLg5YFe7dGpcuq3LKr85o0DHIKOg1aYrEBO/hZ
         0Z6h8fckUeQFrPTehV7QwSj8Qcub1SjQvwqCgLBKcZd2qy2hfT4JQQCp7rg8qvIg6G7a
         0BRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683046210; x=1685638210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JrZuHx77Tp1GZhiS9w/9F9nwUhdlQQdju884mo+xqzE=;
        b=bH2546b7e8Qpq9aSWm+ErwCF+PvvzSuDwyfxVD8ydtUziz6mZkLfS+9TNxRl9Bz33k
         N4yAThvtsSMYRDo71P5is53IukdYS4ck2Lm7p7DEIG9xQyK7oy8lR4cwSxDjo0WGEsQC
         fcgALgJZTebG6ufVQFg7CVILwkoky2L6tCM7gDSQE0jh/XZBVRpX4dl5e2vJ+4kJJXfR
         ljNBt86zU3loB7HkHij3tw02UbgEa2x7rqS5n4r5h7ph8XHlPPdz0zB9/LJN8GFrG4lb
         GwxNT97sN2dcbkKEQuBjKMWpiW2nX1eVzEcuY0g8EfZmwAcXONEReBgsRaNSfhY99tc/
         kXpw==
X-Gm-Message-State: AC+VfDzGJLML2l1Nq4qla0PoVxMT/sFVrqVCSkzPm+ZurgwMiHNBqTbV
	hmE0kolPyq96sxCRDcVebGSMy5SZuXUY6tjrwoM=
X-Google-Smtp-Source: ACHHUZ5FQLgKProE3DY4x7vqtnwT54PE4rbY81sBiQDT28gbBBbjjUXOxjzalmA7M3T0G4GFL++SaA==
X-Received: by 2002:a05:6214:21aa:b0:600:5dbc:c31a with SMTP id t10-20020a05621421aa00b006005dbcc31amr5844798qvc.7.1683046210169;
        Tue, 02 May 2023 09:50:10 -0700 (PDT)
Received: from megalith.ht.home (cpe64777de11593-cm64777de11590.cpe.net.cable.rogers.com. [174.115.224.47])
        by smtp.gmail.com with ESMTPSA id u9-20020a0cf889000000b0061b5afbd8e8sm1531777qvn.52.2023.05.02.09.50.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 09:50:09 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 5/6] python3-pylint: add ptest
Date: Tue,  2 May 2023 12:50:04 -0400
Message-Id: <20230502165005.880470-6-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230502165005.880470-1-tgamblin@baylibre.com>
References: <20230502165005.880470-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 May 2023 16:50:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102270

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ....toml-Remove-hard-coded-dependencies.patch | 10 ++-----
 .../python/python3-pylint/run-ptest           |  3 ++
 .../python/python3-pylint_2.17.3.bb           | 30 +++++++++++++++++--
 3 files changed, 32 insertions(+), 11 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-pylint/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-pylint/0001-pyproject.toml-Remove-hard-coded-dependencies.patch b/meta-python/recipes-devtools/python/python3-pylint/0001-pyproject.toml-Remove-hard-coded-dependencies.patch
index 55d42b101..267e4c30d 100644
--- a/meta-python/recipes-devtools/python/python3-pylint/0001-pyproject.toml-Remove-hard-coded-dependencies.patch
+++ b/meta-python/recipes-devtools/python/python3-pylint/0001-pyproject.toml-Remove-hard-coded-dependencies.patch
@@ -1,21 +1,15 @@
-From 843d050f1bf889b81fa8fc3e7a1350385c8348ec Mon Sep 17 00:00:00 2001
+From c5c415a240189ac6730ba95de0bb5883dfb53609 Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
 Date: Mon, 1 May 2023 11:32:24 -0400
 Subject: [PATCH] pyproject.toml: Remove hard-coded dependencies
 
-The upstream pyproject.toml has hard-coded dependencies on specific
-versions of wheel and setuptools. This breaks builds of pylint 
-2.17.3, so patch it to remove the pinned versions.
-
-Upstream-Status: Pending
-
 Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
 ---
  pyproject.toml | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/pyproject.toml b/pyproject.toml
-index e4b63c660..0ee21e0eb 100644
+index bd542646b..2c0ed9485 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
 @@ -1,5 +1,5 @@
diff --git a/meta-python/recipes-devtools/python/python3-pylint/run-ptest b/meta-python/recipes-devtools/python/python3-pylint/run-ptest
new file mode 100644
index 000000000..b63c4de0d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pylint/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-pylint_2.17.3.bb b/meta-python/recipes-devtools/python/python3-pylint_2.17.3.bb
index b85f77503..58f0616fc 100644
--- a/meta-python/recipes-devtools/python/python3-pylint_2.17.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pylint_2.17.3.bb
@@ -3,10 +3,14 @@ HOMEPAGE= "http://www.pylint.org/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c107cf754550e65755c42985a5d4e9c9"
 
-SRC_URI += "file://0001-pyproject.toml-Remove-hard-coded-dependencies.patch"
-SRC_URI[sha256sum] = "761907349e699f8afdcd56c4fe02f3021ab5b3a0fc26d19a9bfdc66c7d0d5cd5"
+SRC_URI += " \
+        git://github.com/pylint-dev/pylint;branch=main;protocol=https \
+        file://run-ptest \
+        file://0001-pyproject.toml-Remove-hard-coded-dependencies.patch \
+        "
+SRCREV ?= "389e14c36819cb87190fd412d3f366a3283f0078"
 
-inherit pypi python_setuptools_build_meta
+inherit python_setuptools_build_meta ptest
 
 RDEPENDS:${PN} += "${PYTHON_PN}-astroid \
                    ${PYTHON_PN}-isort \
@@ -17,3 +21,23 @@ RDEPENDS:${PN} += "${PYTHON_PN}-astroid \
                    ${PYTHON_PN}-difflib \
                    ${PYTHON_PN}-netserver \
                   "
+
+RDEPENDS:${PN}-ptest += " \
+        ${PYTHON_PN}-core \
+        ${PYTHON_PN}-dill \
+        ${PYTHON_PN}-git \
+        ${PYTHON_PN}-platformdirs \
+        ${PYTHON_PN}-pytest \
+        ${PYTHON_PN}-pytest-benchmark \
+        ${PYTHON_PN}-statistics \
+        ${PYTHON_PN}-tomlkit \
+        ${PYTHON_PN}-tomllib \
+        "
+
+S = "${WORKDIR}/git"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+    sed -i 's#/usr/bin/python$#/usr/bin/python3#g' ${D}${PTEST_PATH}/tests/data/ascript
+}
-- 
2.40.0


