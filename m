Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED900C7EE22
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 12:54:29 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web10.18415.1683118467085135191
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 May 2023 05:54:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=MYhzwf79;
 spf=pass (domain: baylibre.com, ip: 209.85.160.171, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-3ef3ce7085bso22453771cf.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 May 2023 05:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1683118466; x=1685710466;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=H/4d3TUdcsmwQ62Q/P8HhRSLG7kxZAu0hwRM/G8fxMU=;
        b=MYhzwf79CDWMdS5gFTlW/M4csxCVDr6m8obRyJwANCYieCDzt28zukdEQnBLs0RaRR
         GY90yw8K/7kAnFA2soP85fu2NKNd+L4UqAC7TnUTiqg+B56MLBuNR+nALYHn+qg1T0ql
         l3jgJdQOvfrC5Xh2F/QGNnkjjxp/dKDFKJctbwT8SYRC5ayWRTdP5ZnS/YRjvXraajCi
         VdNpoTf/YJ38X0ETj1hUQyHKQqA8v0v7oAvJAz6+64sHgtpb7PHy+tCBjzsorgcdKOmq
         R6pyIYgzsNKajwUTT/2s+Ztpqw3Mv3lJoAcKKqAeoRdQR95VTdqg0TdiT36Ti2gJZQ2R
         wnMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683118466; x=1685710466;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H/4d3TUdcsmwQ62Q/P8HhRSLG7kxZAu0hwRM/G8fxMU=;
        b=ZtAh/kIGb20QbHJDuScNxmW/fcUO3awAHHcryJkXufTTOjdlsyYefJP/tRk+G9Kwt5
         Rh5RvBg2aWRnQjrgFPasvi/UL+hLARKY3KU7yeI3Oxlp7Jx8KZuS8pGEplS27Hi63i0a
         D/BKJn1ft6q/kccNRWT2aE6z4m3mArvH4NQwDl91Opt3H6GQ+8N2adJT26DxsnNwrS8S
         +65XcDXMI4p8J9hsy+FXkXdntlYUm0gYWMaaDUte1ukFfSodbeQ2mqMy0/1A/FlCc2a9
         BRK7dNs76xRt1zK95pfhqyk/1Ac9magzsOlic34OPa7R6iGQqjtf728aqd/qF3zp3VHd
         0BvQ==
X-Gm-Message-State: AC+VfDxxKU4LtPMWViwokuLFtwOue4V7tAlQgaoKxradjeXPJTAg66qJ
	/NuM6HqatEdGXHXKpGP2ICBObvK24yfPzG47Sug=
X-Google-Smtp-Source: ACHHUZ7RvXyCFBuJRoppYZK5hNwYfttZ5wf4tmmtUKNYHWidFoWhHzV2a2jDOQrtT4H6AjARlzXmyw==
X-Received: by 2002:ac8:59cc:0:b0:3e4:e4c7:586a with SMTP id f12-20020ac859cc000000b003e4e4c7586amr31035qtf.4.1683118466043;
        Wed, 03 May 2023 05:54:26 -0700 (PDT)
Received: from megalith.ht.home (cpe64777de11593-cm64777de11590.cpe.net.cable.rogers.com. [174.115.224.47])
        by smtp.gmail.com with ESMTPSA id a10-20020ac84d8a000000b003ef3129a1a6sm11355227qtw.46.2023.05.03.05.54.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 05:54:25 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH v2] python3-platformdirs: Add recipe
Date: Wed,  3 May 2023 08:54:24 -0400
Message-Id: <20230503125424.2832509-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 May 2023 12:54:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102286

v2 replaces the inherit of "python_setuptools_build_meta" with
"python_hatchling" to make the dependency on hatchling more explicit.

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
index 000000000..826d06207
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
+inherit python_hatchling ptest
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


