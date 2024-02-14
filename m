Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20947C48BEB
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 23:05:33 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web10.1710.1707951925341701240
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Feb 2024 15:05:25 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-7c47f06863bso8912439f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Feb 2024 15:05:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707951924; x=1708556724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+sCyJq6noexWQDW5hpCTuBiD7GPXJlFsTLbaafmekbQ=;
        b=AX+gkP0db52CPEdzO7pKPXFrM/y2zPH7rhRqNKiwfa+jBPiVFgRlx/pG8yobxs4nB5
         DXuIZnPo7dEBLkcVAMMbyUzLLbzPpTE0yqB+0BDyceB2MIu9j6OGpFq6YkaVKZfojoVz
         DvMGtAHR/yUc0eQ+jJkIy/keRzcnfT0Ygh50JEfJ02f4dDGZ5nj0Fw+GjLdWhupZ3rLl
         KfPSBoA3VQou9/bFmJtMeHJYmdbfR27SKQzorBtkEPaXPT6ylW1fdrF0Uwx8Wh3e+6dC
         X5nu+7y/3YfzpzhDowDs2sgZ61xf8jvj3oVTkIKkdOedD1WcIhQWoVYSAKWR+Ypah8nY
         X/iA==
X-Gm-Message-State: AOJu0Yyz54pN5g/XGWJ3TjqgcD8ECgI0LYhEemdN7qfNNYg2lXqvdMH8
	hpmXPDP40ikn5wEV4ut1whue82SIn/kMp5rcnaKiY2Q3xy20nOz8IzFVbg+B1q8=
X-Google-Smtp-Source: AGHT+IFWhjc//egogMAf4h/KRPbzlaqR7ngpwTjXDlsiD+d3ueXdFWJbgHcF9uIbQO8B2R/tnfHM8g==
X-Received: by 2002:a05:6602:599:b0:7c4:74ae:c319 with SMTP id v25-20020a056602059900b007c474aec319mr188029iox.6.1707951923499;
        Wed, 14 Feb 2024 15:05:23 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id g34-20020a028525000000b00473ce47e182sm41973jai.63.2024.02.14.15.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 15:05:22 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-pyyaml-include: add initial recipe for version 1.3.2
Date: Wed, 14 Feb 2024 23:04:52 +0000
Message-Id: <20240214230452.2252927-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Feb 2024 23:05:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108747

Add a recipe for the pyyaml-include package that extends PyYAML to include
YAML files within YAML files.  Add a ptest to run the unit tests and include
the tests as part of the package lists in meta-python

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../ptest-packagelists-meta-python.inc        |  1 +
 .../python/python3-pyyaml-include/run-ptest   |  3 ++
 .../python/python3-pyyaml-include_1.3.2.bb    | 28 +++++++++++++++++++
 3 files changed, 32 insertions(+)
 create mode 100755 meta-python/recipes-devtools/python/python3-pyyaml-include/run-ptest
 create mode 100644 meta-python/recipes-devtools/python/python3-pyyaml-include_1.3.2.bb

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 44507b394..44704208e 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -38,6 +38,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-pyserial \
     python3-pytest-mock \
     python3-pytoml \
+    python3-pyyaml-include \
     python3-rapidjson \
     python3-requests-file \
     python3-requests-toolbelt \
diff --git a/meta-python/recipes-devtools/python/python3-pyyaml-include/run-ptest b/meta-python/recipes-devtools/python/python3-pyyaml-include/run-ptest
new file mode 100755
index 000000000..3385d6893
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyyaml-include/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-pyyaml-include_1.3.2.bb b/meta-python/recipes-devtools/python/python3-pyyaml-include_1.3.2.bb
new file mode 100644
index 000000000..9bfaa2194
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyyaml-include_1.3.2.bb
@@ -0,0 +1,28 @@
+SUMMARY = "Extending PyYAML with a custom constructor for including YAML files within YAML files"
+HOMEPAGE = "https://github.com/tanbro/pyyaml-include"
+LICENSE = "GPL-3.0-only"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d32239bcb673463ab874e80d47fae504"
+DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+SRCREV = "36b6975aa8fc7a6cbf37de40aa2ed6d996b2f7be"
+
+SRC_URI = " \
+            git://github.com/tanbro/pyyaml-include;protocol=https;branch=main \
+            file://run-ptest \
+          "
+
+S = "${WORKDIR}/git"
+
+inherit python_setuptools_build_meta ptest
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
+
+RDEPENDS:${PN} += " \
+    ${PYTHON_PN}-pyyaml \
+"
+RDEPENDS:${PN}-ptest += " \
+    ${PYTHON_PN}-pytest \
+"
+
-- 
2.34.1


