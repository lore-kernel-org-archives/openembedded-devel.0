Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80E56C41513
	for <webhook@archiver.kernel.org>; Tue, 25 Jul 2023 14:16:04 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web11.21442.1690294562524293195
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jul 2023 07:16:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=r5iIrZ+e;
 spf=pass (domain: baylibre.com, ip: 209.85.160.49, mailfrom: tgamblin@baylibre.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1b06a46e1a9so4222306fac.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jul 2023 07:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690294561; x=1690899361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=p3ogk+WiqVw6vGspoce+VfIn/R4Is3jsMFJYdJpXJTU=;
        b=r5iIrZ+ek+NoukzXs2kUV5B0qbWGulPrb8YPDLV4CN7EstqK7ac6+sUDvdjpRazivD
         PFGb2HKh1sxQ6jJwaTzkjUbSH8Zm3SJdddjtLfbQWUDHnHdLm7XQ/dNnydFZlBpb1pkF
         RyK2HBGdIu3onk4Y+/p+74VsEqpyyrQFFn3o5ejkZCpmCDIVJMTugI95MPEVsWqrGj/7
         lU85vQVPGGrNvXVzfOz4axpWIi0+pUC2I7wYvL/e3O8mEVtrLYuKBhQmSgq+12vdLeBF
         NuWg4JcTfU14w8ypjXtNniIpxHOXHEiGgdT7DFdREtaShMe770WZDn7szOVIspZuIw69
         EhEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690294561; x=1690899361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p3ogk+WiqVw6vGspoce+VfIn/R4Is3jsMFJYdJpXJTU=;
        b=es4p4lQ4Y5pN13rcUJ6j7kFKfBsB+znnAKaITnPoTGfi1qECrAlCeD7iYePYiccHsM
         5uP0Rwt4n74Sg3PgNOSLcMajxXpg3nK2HQZ+W6iTGIBdBbsliNKgOxlhkYbPRSQeeNoZ
         xpnTJ6brdHJZJ508HXUOkGHIfgWCjk1KKUBjVRHnUTebz+3/levgw6YKHJp5A+xU+oR/
         DmNWqnkfE+FThifv/GT4Yh0i5K39y/a4Fu7HimmxBlMf/hz5ZA5SIm1nLnDcnv4UasbE
         ETsLmXGjR5XZnBGqmCd6HfJx0UZEzXBQ9/UvkgWIB+E+vAtFXuI8vXXl0Rt89PHDpCn4
         wA5w==
X-Gm-Message-State: ABy/qLbbjvxQt6KBpx2vp9g8NtQ8+i8lt50DRXfhJQqi/POGYfE8OhJP
	F3XMHa9btWbWDhri+NXX+ucU6igs/fScs8CdacA=
X-Google-Smtp-Source: APBJJlHtYVIp+oVaHq1Ii4rfx5oVjuvgJ+OpnUTT+XPouZd4W5x05hPLC3mHH9rNF8E05epvTwRf/w==
X-Received: by 2002:a05:6870:c6a5:b0:1ba:bb13:d007 with SMTP id cv37-20020a056870c6a500b001babb13d007mr14661488oab.5.1690294561460;
        Tue, 25 Jul 2023 07:16:01 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id z27-20020a05620a101b00b0075b168fcde9sm3707399qkj.77.2023.07.25.07.16.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 07:16:01 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 1/5] python3-semver: upgrade 2.13.0 -> 3.0.1
Date: Tue, 25 Jul 2023 10:15:55 -0400
Message-ID: <20230725141600.118138-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jul 2023 14:16:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104012

- Update to point at the proper license file with correct checksum.
  Previously it was pointing at a subset of a PKG-INFO file, which was
  a legacy output from distutils
- Update build backend and include python3-setuptools-scm-native in
  DEPENDS
- Modify ptest installation and run-ptest script since the tests have
  been moved into their own folder

Changelog: https://github.com/python-semver/python-semver/releases

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../python/python3-semver/run-ptest           |  2 +-
 .../python/python3-semver_2.13.0.bb           | 24 -----------------
 .../python/python3-semver_3.0.1.bb            | 26 +++++++++++++++++++
 3 files changed, 27 insertions(+), 25 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-semver_2.13.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-semver_3.0.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-semver/run-ptest b/meta-python/recipes-devtools/python/python3-semver/run-ptest
index 43c03b594b..cd2bc8537c 100644
--- a/meta-python/recipes-devtools/python/python3-semver/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-semver/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest -o log_cli=true -o log_cli_level=INFO test_semver.py --disable-warnings| sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest -o log_cli=true -o log_cli_level=INFO tests/test_semver.py --disable-warnings| sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-semver_2.13.0.bb b/meta-python/recipes-devtools/python/python3-semver_2.13.0.bb
deleted file mode 100644
index b47bcae008..0000000000
--- a/meta-python/recipes-devtools/python/python3-semver_2.13.0.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-DESCRIPTION = "Python module for Semantic Versioning"
-HOMEPAGE = "https://github.com/k-bx/python-semver"
-BUGTRACKER = "https://github.com/k-bx/python-semver/issues"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e910b35b0ef4e1f665b9a75d6afb7709"
-
-SRC_URI[md5sum] = "e98b5fb283ea84daa5195087de83ebf1"
-SRC_URI[sha256sum] = "fa0fe2722ee1c3f57eac478820c3a5ae2f624af8264cbdf9000c980ff7f75e3f"
-
-inherit pypi setuptools3 ptest
-
-BBCLASSEXTEND = "native nativesdk"
-
-SRC_URI += " \
-        file://run-ptest \
-"
-
-RDEPENDS:${PN}-ptest += " \
-        ${PYTHON_PN}-pytest \
-"
-
-do_install_ptest() {
-        cp -f ${S}/test_semver.py ${D}${PTEST_PATH}/
-}
diff --git a/meta-python/recipes-devtools/python/python3-semver_3.0.1.bb b/meta-python/recipes-devtools/python/python3-semver_3.0.1.bb
new file mode 100644
index 0000000000..2d85d789c7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-semver_3.0.1.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "Python module for Semantic Versioning"
+HOMEPAGE = "https://github.com/python-semver/python-semver"
+BUGTRACKER = "https://github.com/python-semver/python-semver"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d9da679db3bdce30a1b4328d5c474f98"
+
+SRC_URI[md5sum] = "b7502c12ce325ffffeab694fed52f6f5"
+SRC_URI[sha256sum] = "9ec78c5447883c67b97f98c3b6212796708191d22e4ad30f4570f840171cbce1"
+
+inherit pypi python_setuptools_build_meta ptest
+
+BBCLASSEXTEND = "native nativesdk"
+
+SRC_URI += " \
+        file://run-ptest \
+"
+
+DEPENDS += " python3-setuptools-scm-native"
+
+RDEPENDS:${PN}-ptest += " \
+        ${PYTHON_PN}-pytest \
+"
+
+do_install_ptest() {
+        cp -rf ${S}/tests ${D}${PTEST_PATH}/
+}
-- 
2.41.0


