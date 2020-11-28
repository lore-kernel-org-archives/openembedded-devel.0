Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web12.36771.1606592851606219985
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Nov 2020 11:47:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rA+h4uc0;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id s21so7359140pfu.13
        for <openembedded-devel@lists.openembedded.org>; Sat, 28 Nov 2020 11:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ddgfwgn/A+Gs/ZSjnfO8CFWxPJ+lbQj0jag0Ycr9hDs=;
        b=rA+h4uc01xs9NGJPg1S7CkSVCy/TbRLg9pWaqW37fP/o7EhM+Q+OKwAy/7F7N99j3P
         LGgaTn2CKeyMgTD7sIjyIDnPlKgP28dqUTLabc054AdaIYNrDt6JjNyaTwkZScND5wbP
         SzdpBkJsoiKHYCbZ3ddE0ym171bJo8B0REcD6y4bs3Alj1zQR8mhaeticCkP8IKteMeg
         9SW7fX5XrKcAvRBoIg61trWDnjv730zFpOPPRY1NFOAWLFbetJoswcdBSFHXMZDXaWjK
         7tSONkufqnuZ5qp8a/3oxxz3ydu3/CJwpuoQ/tR7nh7VZiTUBl1oOXLkcCC5A2sPpEyz
         Z1xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ddgfwgn/A+Gs/ZSjnfO8CFWxPJ+lbQj0jag0Ycr9hDs=;
        b=XaNm0out6U3vDvtKYlfSHf5awT9T6zaN2HgDhErcUdxwGXpQdEM9iPywk613daaf7K
         +46Or+Cq6vWWB9FPdtDQWs/BO1V8TFRgHRThwhVLUXFVZRYzOAPZFmLeccAJnGMZrXt2
         abYq4+ujoShQe3XSqnWJW6MWBY10m9VfrzIHgcOpYdZ9UMIGAAcoME8AO/mGXR5aI0gN
         rJdNYKffN7wcTm1lh3mDe2FW4qAA1WXh4ew3mkmHh8zrnrlh0pBs86YxEPBi9EiCkKwu
         dlXgtmVU0lI1VJrAsx44tKqz2Z+ae52057ZzdmddbH2xmZL0NiPu+/oSqpTLa5X/GH5e
         JrQw==
X-Gm-Message-State: AOAM530zw0k+Y1cdWL1DKoDnxA1QG5cFIUBj1NNofRA/xTbaVbTKpDXi
	mXX4S9tCUoXKupJ4TQciXTwG7vuvELsbmg==
X-Google-Smtp-Source: ABdhPJx+kW+dziMasv1XScierXSOpLdgZw8lqRkZ0jKICxnqTv26P+xIW27S87JQ+pPF05uelC784w==
X-Received: by 2002:a63:f457:: with SMTP id p23mr11431965pgk.241.1606592850928;
        Sat, 28 Nov 2020 11:47:30 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.local ([2601:1c0:6000:9640:58b6:35be:25dc:8a78])
        by smtp.gmail.com with ESMTPSA id d2sm16084702pji.7.2020.11.28.11.47.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2020 11:47:30 -0800 (PST)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 13/16] python3-pluggy: drop (moved to oe-core)
Date: Sat, 28 Nov 2020 11:46:53 -0800
Message-Id: <a54682b5e4bbb4d9ffe39c25431804f4c526d605.1606592636.git.ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1606592636.git.ticotimo@gmail.com>
References: <cover.1606592636.git.ticotimo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <ticotimo@gmail.com>

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../python/python3-pluggy/run-ptest           |  3 ---
 .../python/python3-pluggy_0.13.1.bb           | 27 -------------------
 2 files changed, 30 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pluggy/run-ptest
 delete mode 100644 meta-python/recipes-devtools/python/python3-pluggy_0.13.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-pluggy/run-ptest b/meta-python/recipes-devtools/python/python3-pluggy/run-ptest
deleted file mode 100644
index b63c4de0d9..0000000000
--- a/meta-python/recipes-devtools/python/python3-pluggy/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-pluggy_0.13.1.bb b/meta-python/recipes-devtools/python/python3-pluggy_0.13.1.bb
deleted file mode 100644
index d3e0365ca1..0000000000
--- a/meta-python/recipes-devtools/python/python3-pluggy_0.13.1.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-SUMMARY = "Plugin and hook calling mechanisms for python"
-HOMEPAGE = "https://github.com/pytest-dev/pluggy"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1c8206d16fd5cc02fa9b0bb98955e5c2"
-
-SRC_URI[md5sum] = "7f610e28b8b34487336b585a3dfb803d"
-SRC_URI[sha256sum] = "15b2acde666561e1298d71b523007ed7364de07029219b604cf808bfa1c765b0"
-
-DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
-RDEPENDS_${PN} += "${PYTHON_PN}-importlib-metadata \
-                   ${PYTHON_PN}-more-itertools \
-"
-
-inherit pypi ptest setuptools3
-
-SRC_URI += " \
-	file://run-ptest \
-"
-
-RDEPENDS_${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
-"
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/testing
-	cp -rf ${S}/testing/* ${D}${PTEST_PATH}/testing/
-}
-- 
2.25.0

