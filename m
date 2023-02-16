Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8FF9C64EC4
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 12:28:09 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web10.8630.1676550483598892393
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Feb 2023 04:28:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fVqlIY8U;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: akuster808@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id h24so1802082qta.12
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Feb 2023 04:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QeaLbBPvL6W5BOoTMJHbAukYuTDe1JmgPnQXuz0Rc0Y=;
        b=fVqlIY8U55AZua3oOsANnBNw3SgI83daODDVfseBc2nVTn9ForRdqrmXtJk2+9E7D9
         n10o17BVuse31KPMbCCi31PZrOTIDGfIDf6VW/PzXvpl9Qug8rCgszBdVJVaCqxUOU+S
         N9Ch7QwR1TN5KZ7NGcoOaNKrdT26fbSq7DYToqHP52CrzRvgrKpfYS6oqB/2GrfPY0Kt
         1DdeUunsief/UrydE9+fJwdhM4zQYIG8qbrkByhICQV/GypkAR31t4Uz5SWM5G7yYVWC
         /ljQQNmvo5DsHbhnkWHdqXGyU1d9fGoY2dutk5S8vciuIKrJOnuYkjT9FjRRCHvKPNct
         Y3NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QeaLbBPvL6W5BOoTMJHbAukYuTDe1JmgPnQXuz0Rc0Y=;
        b=KDfzn1f48Z8lgYRl7eI1EaYruN+f91O2iswZqUGmysFuH+MsVFnmSmLt9i5hT4W3FH
         UxocEwZrQ+4ChSt0Kbjan6uAMyLpSwtsst6QHxekk9Ir2f41M8U54xbvUR9GJ0Ge1V1i
         +LwhBQK29WJAAR/J7XjhNza3e+k3bvUFut8oU0Ns6gKxr701TOHJ6J7nqcs+Db42WO9n
         gdNyr1gf1xV+4BWaiFbriVarteSk9WWcv81qyR/8It273wiz4tnBEpIBtEc+ry6fu7Cf
         FlxSWOsQxfu3N7GHspNN/f3hYBzndXKHgCJUOnTg0QG1ed30JXf+RB/MpmWIxH2Efb8a
         UBnA==
X-Gm-Message-State: AO0yUKWM91ZLNvkSJKdyYHsJhN5wnGPVPfNCNFnEL6R5EvoSnmJ7IwH4
	V50ud6EODfanDKWrAQouSKcTVw9qWIg=
X-Google-Smtp-Source: AK7set8ltuTr/FeBF7/AGTyusecJ2RT15txZn8iSrV7FfQnkeWlG9IozTYwkKxVUOce2Yhv+bzUhVw==
X-Received: by 2002:ac8:5f14:0:b0:3b8:6bef:61c5 with SMTP id x20-20020ac85f14000000b003b86bef61c5mr8740976qta.63.1676550482529;
        Thu, 16 Feb 2023 04:28:02 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:2ead:d6b6:b6e2:9e85])
        by smtp.gmail.com with ESMTPSA id t127-20020a379185000000b0073b4d9e2e8dsm1102362qkd.43.2023.02.16.04.28.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 04:28:02 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 04/15] python3-pillow: add ptest support
Date: Thu, 16 Feb 2023 07:27:14 -0500
Message-Id: <062de70ce90b19222dc11be15f3274b9f31c087f.1676550369.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1676550369.git.akuster808@gmail.com>
References: <cover.1676550369.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Feb 2023 12:28:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101106

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


