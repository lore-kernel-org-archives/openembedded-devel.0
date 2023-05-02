Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 721FDC7EE25
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 16:50:14 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web11.1306.1683046208970369830
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 May 2023 09:50:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=v3C418Hy;
 spf=pass (domain: baylibre.com, ip: 209.85.222.173, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-74de7635180so376912085a.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 May 2023 09:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1683046208; x=1685638208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eRht0OD6q/zsHx1lw0ejDwqDH/ay1ddbl55nCW/qYbo=;
        b=v3C418HyvhgwFO+J3UzXUFDs0urV0LX+7T48QsqKzJv6+oXI9nm/kwl6MVsEEyCB5d
         o6l7iF5j4uLhDwYzHD5AbQqHhE3T7kHNXmu0y9uRrQJ7M8ncsEcsPExpE9XpyB6dMVcF
         aYC7bUZZoVzi8I4rOPnYQXr9bWlvBxOjWxVC1mMDO/jU+Z1tsmBLfPTSkIcvIO6NewDr
         PogEIMv9XzF89p9PKZNBIewE7KEgJL63Vahlcc99+aH4nzgAADOTG1hxLkfynzc5zyp0
         CYs85RMUiR+Fs0NfwNjdpLGssQaZ1Gasyd3H+Y9HAxPNUu9DTSxU0Td8CymSP6RHM1Cg
         bMbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683046208; x=1685638208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eRht0OD6q/zsHx1lw0ejDwqDH/ay1ddbl55nCW/qYbo=;
        b=b9nV4OhJpA4rEmGVchtrUD1JBtYo1Pl90fPLFgvynbN5CaSh4oYW+g81QE8iMElbzL
         wCzzMpNW//yd2/hhMsfLJS5zlReVDq5UzPO25OwOey3HsIG5NuodgKwSnuYooN3udW1/
         dG1pVDbdCv738HQonZyk/2IUKVGGavAW4BoquzOqLsxLigFnASX4uHoGCwSqiwn73IrR
         jZ1BPbj4g8yADYT9pLU3NcgAhpgsHiNcY86u2iOl3GuYQnT5p95Ma+v/lszsc+6TZVew
         UaK2rKx4yE29MmcaLx4Z5JRi2bcKrU2zzkt35e61W7co6jEWk/O0TFJr7zpzLp3oQQkP
         mdDQ==
X-Gm-Message-State: AC+VfDyk8gp78gNEJTSh1Ow5zQrKn4TkyitgAenaIjAmJOzvN8akoT36
	/su8+EdqgEdBC3IZuGSntSGZmQsDsWvecGZNoys=
X-Google-Smtp-Source: ACHHUZ56GVzNKWC+EgW7hJP8BVV+abjNjzBo2FDdoZH2yA78QLaEwoFiVOATDN80s4qW7W981s0DGg==
X-Received: by 2002:a05:6214:2265:b0:61b:6872:1459 with SMTP id gs5-20020a056214226500b0061b68721459mr3433276qvb.49.1683046207937;
        Tue, 02 May 2023 09:50:07 -0700 (PDT)
Received: from megalith.ht.home (cpe64777de11593-cm64777de11590.cpe.net.cable.rogers.com. [174.115.224.47])
        by smtp.gmail.com with ESMTPSA id u9-20020a0cf889000000b0061b5afbd8e8sm1531777qvn.52.2023.05.02.09.50.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 09:50:07 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 2/6] python3-pytest-mock: Add recipe
Date: Tue,  2 May 2023 12:50:01 -0400
Message-Id: <20230502165005.880470-3-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230502165005.880470-1-tgamblin@baylibre.com>
References: <20230502165005.880470-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 May 2023 16:50:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102267

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../python/python3-pytest-mock/run-ptest      |  3 +++
 .../python/python3-pytest-mock_3.10.0.bb      | 26 +++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-mock/run-ptest
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-mock_3.10.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-pytest-mock/run-ptest b/meta-python/recipes-devtools/python/python3-pytest-mock/run-ptest
new file mode 100644
index 000000000..b63c4de0d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytest-mock/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-pytest-mock_3.10.0.bb b/meta-python/recipes-devtools/python/python3-pytest-mock_3.10.0.bb
new file mode 100644
index 000000000..c4e672f33
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytest-mock_3.10.0.bb
@@ -0,0 +1,26 @@
+SUMMARY = "Thin-wrapper around the mock package for easier use with pytest"
+HOMEPAGE = "https://github.com/pytest-dev/pytest-mock/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE;md5=b2ddb1e69238461b7e4ef2a84d874109 \
+"
+
+SRC_URI = " \
+    git://github.com/pytest-dev/pytest-mock;branch=main;protocol=https \
+    file://run-ptest \
+"
+
+SRCREV ?= "6c03dfd4240de4a178bab67c0a32fba28d8bcf91"
+
+SRC_URI[sha256sum] = "fbbdb085ef7c252a326fd8cdcac0aa3b1333d8811f131bdcc701002e1be7ed4f"
+
+inherit setuptools3 ptest
+
+DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+
+S = "${WORKDIR}/git"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests ${D}${PTEST_PATH}/
+}
-- 
2.40.0


