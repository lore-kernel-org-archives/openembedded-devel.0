Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA767C636D4
	for <webhook@archiver.kernel.org>; Sat, 11 Feb 2023 15:51:15 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web11.11641.1676130674524624498
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Feb 2023 07:51:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RjFk731a;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: akuster808@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id g8so9099388qtq.13
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Feb 2023 07:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QeaLbBPvL6W5BOoTMJHbAukYuTDe1JmgPnQXuz0Rc0Y=;
        b=RjFk731aQ3y4NQFdY82EVQom9JjzQx4CRDLrQwTEeCyN1XClUuUaaRcMEIyQuwxJyH
         QrO6mvdQXucOv3dGglN90qK3whTEbz7GZBsuJQ51XdSkgoM2zRadquKrpr+naTBuZP0i
         cdixH/eMep06v5N9JnbmSJfz8U7yHTDjSukpBPx0mfsxXpIXiOqJcdUy/X/Ph3Dsqg4m
         /KuZhgxd40TYT+xpsYklMeST1QynKniedS9kSgx63TZq+Ss16b4mOa/75Fknn1mz4z1c
         oj9fMvXQowePPIhCYf1ZuFPXT2GTI5pp+GpBJwV7AUsQCT7a4hJIIwThpOvlJ7N8Rt6G
         uM7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QeaLbBPvL6W5BOoTMJHbAukYuTDe1JmgPnQXuz0Rc0Y=;
        b=EouX6VOnMvpHblEQsQa1Hz2cinjD1k3YfADHRBtLNfxu6Z1y81aGldUSPlId98MsHm
         f8LYYiA6bNDcqE0Dt8JOQFugEEE70Y/jp1+K/vAWk3qI8CddSsgW/23ddTq2gLJohFPC
         ZlO5TEHCBTPxBKFcSqyaWc9E0gBlvItmzgwBe7deaGQFzAzCsER6qdS+Q5FaSTihVbaQ
         OgjzonQdJTizAK6X30qewEkcMU20VpA64ckOg9aA1tf8hVw/ZPm6Rs6JpyOE0yjAvtCO
         S/MoHnMm6dDtElPVZWAkfxLL45R2MAT+DQtogWczhkeizV1bW2K8bapDYFrkiABXKNdJ
         A94g==
X-Gm-Message-State: AO0yUKUzKo2Qn2XiWFvWT9E1zvwh3gChY4GKpCDsFJcigID9MF9npVCq
	XWl6flrI9pd9UVdVhi2XkOVx9TxdYAM=
X-Google-Smtp-Source: AK7set9J1Asz3IEpEYMF+0J7zmPXNjN9R8xsmovsgWuzBQN83mJFiiTHSINpMsU5Ala00wNoh/AtYA==
X-Received: by 2002:a05:622a:188d:b0:3b9:a441:37f3 with SMTP id v13-20020a05622a188d00b003b9a44137f3mr26105491qtc.64.1676130674433;
        Sat, 11 Feb 2023 07:51:14 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:6c32:d739:9179:1de7])
        by smtp.gmail.com with ESMTPSA id l67-20020a37bb46000000b0071d0f1d01easm5855481qkf.57.2023.02.11.07.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 07:51:14 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Randy MacLeod <Randy.MacLeod@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][langdale][PATCH 3/4] python3-pillow: add ptest support
Date: Sat, 11 Feb 2023 10:51:10 -0500
Message-Id: <20230211155111.3984602-3-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230211155111.3984602-1-akuster808@gmail.com>
References: <20230211155111.3984602-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Feb 2023 15:51:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101031

From: Randy MacLeod <Randy.MacLeod@windriver.com>

Add initial pillow ptest support.

The ptest result is:
   ====== 3600 passed  324 skipped, 2 xfailed, 1 xpassed in 62.41s (0:01:02) ======
for qemux86-64 with 2 GB RAM.

The skipped tests as summarized with:
   # ptest-runner python3-pillow | tee log
   # grep SKIPP log  | cut -d"(" -f2- | cut -d")" -f1 | cut -d" " -f1 | sort | uniq -c| sort -n | tail -4
     12 webp
     13 Tk
     14 Qt
     84 raqm
Webp was explicityly disabled in 2018 in:
   6cb4e90fc python3-pillow: add 5.4.1
I didn't test Tk or Qt and there isn't yet a recipe for libraqm:
   https://github.com/HOST-Oman/libraqm
a library that encapsulates the logic for complex text layout.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 7b0e71e00ce1b003c96ef38ead72a9e02555afbe)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../python/python3-pillow/run-ptest           |  3 +++
 .../python/python3-pillow_9.4.0.bb            | 22 ++++++++++++++++++-
 2 files changed, 24 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-pillow/run-ptest b/meta-python/recipes-devtools/python/python3-pillow/run-ptest
new file mode 100644
index 0000000000..3385d68939
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pillow/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb b/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb
index 403a987d1e..68c81029c0 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb
@@ -8,10 +8,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bc416d18f294943285560364be7cbec1"
 SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=main;protocol=https \
            file://0001-support-cross-compiling.patch \
            file://0001-explicitly-set-compile-options.patch \
+           file://run-ptest \
            "
 SRCREV ?= "82541b6dec8452cb612067fcebba1c5a1a2bfdc8"
 
-inherit setuptools3
+inherit setuptools3 ptest
 
 PIP_INSTALL_PACKAGE = "Pillow"
 PIP_INSTALL_DIST_PATH = "${S}/dist"
@@ -31,12 +32,31 @@ RDEPENDS:${PN} += " \
     ${PYTHON_PN}-numbers \
 "
 
+RDEPENDS:${PN}-ptest += " \
+    bash \
+    ghostscript \
+    jpeg-tools \
+    libwebp \
+    ${PYTHON_PN}-core \
+    ${PYTHON_PN}-image \
+    ${PYTHON_PN}-mmap \
+    ${PYTHON_PN}-pytest \
+    ${PYTHON_PN}-pytest-timeout \
+    ${PYTHON_PN}-resource \
+    tk \
+"
+
 CVE_PRODUCT = "pillow"
 
 S = "${WORKDIR}/git"
 
 RPROVIDES:${PN} += "python3-imaging"
 
+do_install_ptest() {
+        install -d ${D}${PTEST_PATH}/Tests
+        cp -rf ${S}/Tests ${D}${PTEST_PATH}/
+}
+
 BBCLASSEXTEND = "native"
 
 SRCREV = "a5bbab1c1e63b439de191ef2040173713b26d2da"
-- 
2.25.1


