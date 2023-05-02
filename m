Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83540C7EE2A
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 16:50:14 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web11.1305.1683046208141566425
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 May 2023 09:50:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=Awii6Tsy;
 spf=pass (domain: baylibre.com, ip: 209.85.219.50, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-5eefa0a5561so41651576d6.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 May 2023 09:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1683046207; x=1685638207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QyKGYy2is6/M7GZe5WwGpJy2t6WYA+meQces4bMGIhc=;
        b=Awii6TsyuvCtb11Fo0KJOI0V3TGX8by27jNOo56+GL4CvPep7VMg4ZVvi7wDdA9Kvw
         DQyS6vNaWUWlyznqisFgYwzjunVYZwQ/95kziSvcXw2CAR3SpLH2gmV7NrXGxfrQhYCf
         d+JJy0V+9pqTSx5QgfyqjRSgJkakwhTw1WztIi94MGpza58YuMQHj3Xsv5iJ1j5wCBXh
         Y+l5oq7Qo8UPNRbUXu5GbdeHN7H+EnjXeNstV0KuGBXc2E+P5qSwhJ0kqRjowT2VEoC5
         2EHNihXcTdf4vHpY1KGQDJNaNDdXDv7vfnFq5d00txDgxY4EMXkJi04EA/0F1z1TX07N
         BKHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683046207; x=1685638207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QyKGYy2is6/M7GZe5WwGpJy2t6WYA+meQces4bMGIhc=;
        b=k9s3r9KHrqjrH5MKqHrXPftNW0kzGLZMEWnvWybfP1ViktRR96oPHQ1zUQwkAy7zd2
         p8+7fXs3EiFhoC3Z4KRiPE9hVwdx0CPk7T3smd77ujjvucmPqfec3kInbVL7TuT7BeNl
         fDZWgkBJJrKlKB7GmvGCR9haDeSssYfC7wBEx0mL2ZUZ/JUbP6F19/dOO8vxmZYoqyXy
         aIn8LuGkPmk3WvA1Y00IcpVaWVd+WYi+XqT9UO6aSyW/Att54biillc82r3qtBGGPfZy
         d0A7479hLqKDxakD1TwzUfE1ZBPtkKk7w5zMb8XuP49HnCIOlmQQ4IWBp5df4F9/cIaf
         bKtQ==
X-Gm-Message-State: AC+VfDxtOC/Pq+xvSTmDxhPFi558KopwZ53PdKoqfFj2BGnMmrqI6kd6
	2KELqouDQjTShX3w/7/w0zVvi+ChGFiZ8TheKck=
X-Google-Smtp-Source: ACHHUZ6g+d3s7Ff1TLgtuVoUBrhHXD0GIGDX+gW+bq3Lvd9F938MhvUWpWdDUcidp2Kql+rjLFS0mg==
X-Received: by 2002:a05:6214:62b:b0:5ef:4763:2f61 with SMTP id a11-20020a056214062b00b005ef47632f61mr6229286qvx.20.1683046207072;
        Tue, 02 May 2023 09:50:07 -0700 (PDT)
Received: from megalith.ht.home (cpe64777de11593-cm64777de11590.cpe.net.cable.rogers.com. [174.115.224.47])
        by smtp.gmail.com with ESMTPSA id u9-20020a0cf889000000b0061b5afbd8e8sm1531777qvn.52.2023.05.02.09.50.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 09:50:06 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 1/6] python3-platformdirs: Add recipe
Date: Tue,  2 May 2023 12:50:00 -0400
Message-Id: <20230502165005.880470-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230502165005.880470-1-tgamblin@baylibre.com>
References: <20230502165005.880470-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 May 2023 16:50:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102266

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../python/python3-platformdirs/run-ptest     |  3 ++
 .../python/python3-platformdirs_3.5.0.bb      | 35 +++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-platformdirs/run-ptest
 create mode 100644 meta-python/recipes-devtools/python/python3-platformdirs_3.5.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-platformdirs/run-ptest b/meta-python/recipes-devtools/python/python3-platformdirs/run-ptest
new file mode 100644
index 000000000..b63c4de0d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-platformdirs/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-platformdirs_3.5.0.bb b/meta-python/recipes-devtools/python/python3-platformdirs_3.5.0.bb
new file mode 100644
index 000000000..b5ff369d0
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-platformdirs_3.5.0.bb
@@ -0,0 +1,35 @@
+SUMMARY = "A small Python module for determining appropriate platform-specific dirs"
+HOMEPAGE = "https://github.com/platformdirs/platformdirs"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ea4f5a41454746a9ed111e3d8723d17a"
+
+SRC_URI = " \
+    git://github.com/platformdirs/platformdirs.git;branch=main;protocol=https \
+    file://run-ptest \
+"
+
+SRCREV ?= "dcb56802714f5570236c86d03773ff881be6e39f"
+SRC_URI[sha256sum] = "7954a68d0ba23558d753f73437c55f89027cf8f5108c19844d4b82e5af396335"
+
+inherit python_setuptools_build_meta ptest
+
+DEPENDS += " \
+    python3-hatch-vcs-native \
+    python3-setuptools-scm-native \
+    python3-toml-native \
+"
+
+S = "${WORKDIR}/git"
+
+RDEPENDS:${PN}-ptest += " \
+    ${PYTHON_PN}-appdirs \
+    ${PYTHON_PN}-pytest \
+    ${PYTHON_PN}-pytest-mock \
+"
+
+do_install_ptest() {
+        install -d ${D}${PTEST_PATH}/Tests
+        cp -rf ${S}/tests ${D}${PTEST_PATH}/
+}
+
+BBCLASSEXTEND = "native"
-- 
2.40.0


