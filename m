Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B2B3C7EE22
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 16:50:14 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web11.1307.1683046209580312193
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 May 2023 09:50:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=gx/JL8Fw;
 spf=pass (domain: baylibre.com, ip: 209.85.222.176, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-74e462a540aso188255985a.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 May 2023 09:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1683046208; x=1685638208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ny1Eb7h6BYAdiTh3a+SMiPlQx5wRweupU97HjBnlYqE=;
        b=gx/JL8Fw+UiGEqnISGV9/wAX5vT3bkCM3mQvJfFNSHTvcSSZMGlrIQw8+PmvD7tJM0
         zClRKwIBllIMK7txSi7eDg1rT5yFg09Xqz17E92q/8a3cui8cS1ufqJW4343JPJBD920
         gDkU9GexPNn4B1ZCCRms0Q09582piS8kv676TrSxyRBkdwCXejdGbOUXQIyNA6+uQjnK
         tUaB34NhNOiGJoxWwrcCJM29UHxfFafwMMXwBVfdkT9A0yfx7ZyivctMExPbxPFhi6Xf
         EsVKmRTDdvCqoOvjWGc0+hJED6beL4HXNF7Ub4jA6W9Yavb4z1WI7EKLVrGr2p107WGy
         B40Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683046208; x=1685638208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ny1Eb7h6BYAdiTh3a+SMiPlQx5wRweupU97HjBnlYqE=;
        b=PSlUawCM362L6mvT54zr9X7wZvMu2XnaJMIOo8TteaiEggGwNc300NCKC/BZqqzf1u
         GPfaLhx41th3UMlKz5705gUc7Q817wDRNDwhkmtSM8GMQCCd6+Wh9HwDvVMvXwL3MUnf
         4/fMBbdwfGfJs65Fm4ZXA5LO4vjh3o6/+8GTKx5WraahlOnSrydniQLSquRQheXF9ZEl
         4XSGx/zkHUIR4VEHv+SBfBeWuxa/UHyDZpZtTzmrApd/K3GGaemdLqP5u5IRiq1cFyWl
         G1GjxafWJzHASsd7NmPODHjOff6VPWu8ftVyf4xWn/OZ3YQEGozBDI2/c4lU8nQrxJGM
         WWkQ==
X-Gm-Message-State: AC+VfDzysof6AzXg6pkA5mrSpVJuo4G+K4Exj/hs2aTHIjGaC3dSIADH
	/W1c+C5+FCMLAKG3X4TcqWuNgAPB1hsMNqv2DzQ=
X-Google-Smtp-Source: ACHHUZ43eceUfvpAwealXiWNyOnPTKts8WKxufm/z5TNWPuPKv8cJlofF4eeLzTMuUQd17umNCeu6w==
X-Received: by 2002:ad4:5de5:0:b0:5ef:642e:7cd2 with SMTP id jn5-20020ad45de5000000b005ef642e7cd2mr6222750qvb.7.1683046208583;
        Tue, 02 May 2023 09:50:08 -0700 (PDT)
Received: from megalith.ht.home (cpe64777de11593-cm64777de11590.cpe.net.cable.rogers.com. [174.115.224.47])
        by smtp.gmail.com with ESMTPSA id u9-20020a0cf889000000b0061b5afbd8e8sm1531777qvn.52.2023.05.02.09.50.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 09:50:08 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 3/6] python3-tomlkit: Add recipe
Date: Tue,  2 May 2023 12:50:02 -0400
Message-Id: <20230502165005.880470-4-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230502165005.880470-1-tgamblin@baylibre.com>
References: <20230502165005.880470-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 May 2023 16:50:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102268

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../python/python3-tomlkit/run-ptest          |  3 +++
 .../python/python3-tomlkit_0.11.8.bb          | 23 +++++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-tomlkit/run-ptest
 create mode 100644 meta-python/recipes-devtools/python/python3-tomlkit_0.11.8.bb

diff --git a/meta-python/recipes-devtools/python/python3-tomlkit/run-ptest b/meta-python/recipes-devtools/python/python3-tomlkit/run-ptest
new file mode 100644
index 000000000..b63c4de0d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-tomlkit/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-tomlkit_0.11.8.bb b/meta-python/recipes-devtools/python/python3-tomlkit_0.11.8.bb
new file mode 100644
index 000000000..71a43c455
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-tomlkit_0.11.8.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Style preserving TOML library"
+HOMEPAGE = "https://pypi.org/project/tomlkit/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=31aac0dbc1babd278d5386dadb7f8e82"
+
+SRC_URI[sha256sum] = "9330fc7faa1db67b541b28e62018c17d20be733177d290a13b24c62d1614e0c3"
+
+inherit pypi python_poetry_core ptest
+
+SRC_URI += " \
+        file://run-ptest \
+"
+
+RDEPENDS:${PN}-ptest += " \
+        ${PYTHON_PN}-poetry-core \
+        ${PYTHON_PN}-pytest \
+        ${PYTHON_PN}-pyyaml \
+"
+
+do_install_ptest() {
+        install -d ${D}${PTEST_PATH}/tests
+        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
-- 
2.40.0


