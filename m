Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web08.2999.1624421595062328937
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Jun 2021 21:13:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XcRMCMXE;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id p4-20020a17090a9304b029016f3020d867so574498pjo.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jun 2021 21:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ovbWMpcMhaN/g2FERsuw3I44adkyLq25ZhxD+F4pp7o=;
        b=XcRMCMXECpOs/QAN/wOzzvY3ZN7r1m6YWDqdDjXiHiViHcPrQnoXMX48wYTYKMFiJ0
         ubB9mtlu0oJCIAXGtJXMsRUaKFp3z01W0jyKOeyBTWJoe+vF/0gBpxZV6UydasYt2dM+
         uSZdaJ+KWZZIox5mU4CE9H4/PeQHPjLAw+KwZsdesodl0JJ/1+nv+ck9E8S1lw67IWdB
         WSr+vsFkAk1/2uyHHI+2717qAngZd3l8R4xNB68/Ox8NbKJp+Pldh5CAd3fIfZoGubtl
         +f+Xsk2y+om8nwT7Af9oQdofhfgLoKTc8u2K8DpVzbXPEduobW5Ne1Ch06r+GHK64j/3
         BgQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ovbWMpcMhaN/g2FERsuw3I44adkyLq25ZhxD+F4pp7o=;
        b=hTkPFAxryLvqaXquKXOMb4PGXpA2aMDjSrVEu1P9pRdONm1FgRsrP1Plky5c0Rd6Bz
         QrY3GEjj+lyYGqV3xal39H9P5a+linTbZEMKCTYaMMQM/0PDx4thVExKgWvIkdRf0Fy6
         1EN18s8Utv/NL30Xo5O72+Ih77Qrou51wlCJPg48fNewUjmb3oKRUIGv1Dyxkk1ReN25
         oguZmPvlMcFeSnEoE5LHImE3M9n7GZbD66KrKoXHk0EmEN8qEcLMfe4an/qjS2wew2lS
         nlKoyIfDQsbIv40KsBUoMNP6yHHZYgVjX7UVOT07vm1o3ie4chiVkJOSOMupv3lZb1W/
         4Fhg==
X-Gm-Message-State: AOAM530ShkqcyO297ksVOR9uBRJ4lxqDMj/mcuLTjb6ZHUvq2gvQfcKH
	DHGh+j4DPbVkaVkBM31toNBhKhs80pob+Q==
X-Google-Smtp-Source: ABdhPJyHc2v+4Sb3fElVvkM2SozAASKkG9eo/sujjYYGOP+cw9YvhuMJpoaaCx2fTLXfHex0YIFJFg==
X-Received: by 2002:a17:90a:6d82:: with SMTP id a2mr7327416pjk.150.1624421594429;
        Tue, 22 Jun 2021 21:13:14 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bfd0])
        by smtp.gmail.com with ESMTPSA id b5sm17951239pgh.41.2021.06.22.21.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 21:13:13 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 3/4] python3-execnet: Add ptests
Date: Tue, 22 Jun 2021 21:13:09 -0700
Message-Id: <20210623041310.3976956-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210623041310.3976956-1-raj.khem@gmail.com>
References: <20210623041310.3976956-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-execnet/run-ptest              |  3 +++
 .../python/python3-execnet_1.9.0.bb               | 15 ++++++++++++---
 2 files changed, 15 insertions(+), 3 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-execnet/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-execnet/run-ptest b/meta-python/recipes-devtools/python/python3-execnet/run-ptest
new file mode 100644
index 0000000000..b63c4de0d9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-execnet/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-execnet_1.9.0.bb b/meta-python/recipes-devtools/python/python3-execnet_1.9.0.bb
index ec16e8884e..a7b156535d 100644
--- a/meta-python/recipes-devtools/python/python3-execnet_1.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-execnet_1.9.0.bb
@@ -6,13 +6,22 @@ HOMEPAGE = "https://execnet.readthedocs.io/en/latest/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=772fcdaca14b378878d05c7d857e6c3e"
 
+DEPENDS += "python3-pip-native"
+
+SRC_URI += "file://run-ptest \
+           "
 SRC_URI[sha256sum] = "8f694f3ba9cc92cab508b152dcfe322153975c29bda272e2fd7f3f00f36e47c5"
 
-DEPENDS += "python3-pip-native"
+inherit ptest pypi setuptools3
 
-inherit pypi setuptools3
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/testing/* ${D}${PTEST_PATH}/tests/
+}
 
-PACKAGECONFIG[testing] = ",,,python3-pre-commit"
+RDEPENDS_${PN}-ptest += "\
+    python3-pytest \
+"
 
 RDEPENDS_${PN} += "python3-core python3-crypt python3-ctypes python3-fcntl python3-io python3-shell python3-threading"
 
-- 
2.32.0

