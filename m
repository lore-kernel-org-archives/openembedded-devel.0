Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8FCCC48260
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 00:17:03 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web10.601.1708129017903663009
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 16:16:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DeLCpIuO;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: ticotimo@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-21e45ece781so850977fac.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 16:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708129017; x=1708733817; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S49FiW9UN/MO57zgzl2VBc5/x+2HHRoEOH4u2XfUZw4=;
        b=DeLCpIuOdsFXYveojTd+0uPUVq1hicyDAvqOatzJVwMRdYETpEEZEoQ0RIgi/ST+Ur
         s4rDZrLQHa+h6UyxpUBd8tXYA6U+NK17y8Ez3+TJjpSB2Gejrqz0Yu5D0PpyGfCf8/Xz
         q8kzCxwX2Cn2jFSQr2hj06hWULYiHwDlfaww+m0r1qXVE3MJ2sTUsUgn9w8v1HNDXbYp
         hNLSPC94FJYZHUrFQU83S7dG4J4EDSsIiN/xaaPfE3KkO2juamT+Qdl56VkFRHHH8f8p
         jPa1bNjMLR2Wx12iKQw92IQiO0jexuRi8BJ4yhs18GGLtWc4L2/9bTVRi3SQsyKUf5B0
         PRUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708129017; x=1708733817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S49FiW9UN/MO57zgzl2VBc5/x+2HHRoEOH4u2XfUZw4=;
        b=fE9yUkbGjhav1G040oOF4+c5+iz5V/kVSrIOoee0YgwGq2JEzS6Ud9b2EV8j22rz3L
         6kgu0oAPTIHDCU+5QiVKOM/q4Kkc5aqwEU9XSZ4K6oEyP/Qeq9ohDzIwoCC4cKDScW9U
         IjbGE6wKXkR+IuBA2mwBO8PzlSiFrxID/ZexzV1FG+wsL71vBV79SDxWzj2+I5bmphzd
         d/meHKq8uTSzYUr8cMZAGCeyJ3ULfbv1V8XhnekjU1fYas1kEmkNQILYV60CTqUKMKjs
         KIRkbRepV9rbdzMirx2sGjdoe1TVKPVmo+/uKYIo+6j9oE+Yw2PMPMAC+6k9/GgETjoQ
         XX0g==
X-Gm-Message-State: AOJu0YzLbQ17KXpJAkhs5mzgZKpIUhR2AjLhSXo3zNylxZhKuF88fxKb
	kVhT+am0PfpKUDMrKSbMjnZEjXKdfbdQ6VtShEmmjrTnFBJyQUEXY6t7FAEi
X-Google-Smtp-Source: AGHT+IFeD6N+/bXaoHVRTqTG0gPwqTqIC2o5J9JfQ+xIBjFI8uXlDO2Ft0nCp6hmU8EkbLVgUCtvFg==
X-Received: by 2002:a05:6358:485:b0:178:94bc:72f1 with SMTP id x5-20020a056358048500b0017894bc72f1mr7519034rwi.22.1708129016888;
        Fri, 16 Feb 2024 16:16:56 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id kt22-20020a056a004bb600b006e0825acbc3sm514781pfb.77.2024.02.16.16.16.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:16:56 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 37/60] python3-cbor2: switch to pytest --automake
Date: Fri, 16 Feb 2024 16:15:28 -0800
Message-Id: <16ed55c84c4d89bf0a54a28ec1ebd45c763a8db7.1708127759.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708127759.git.tim.orling@konsulko.com>
References: <cover.1708127759.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 00:17:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108807

* Also replace ${PYTHON_PN} with python3
* Be consistent with tabs vs. spaces in do_install_ptest

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../recipes-devtools/python/python3-cbor2/run-ptest |  2 +-
 .../recipes-devtools/python/python3-cbor2_5.6.1.bb  | 13 +++++++------
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-cbor2/run-ptest b/meta-python/recipes-devtools/python/python3-cbor2/run-ptest
index b63c4de0d9..8d2017d39c 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-cbor2/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-cbor2_5.6.1.bb b/meta-python/recipes-devtools/python/python3-cbor2_5.6.1.bb
index 2c1b0e67a1..e2493e4e1f 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2_5.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cbor2_5.6.1.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "An implementation of RFC 7049 - Concise Binary Object Representation (CBOR)."
-DEPENDS +="${PYTHON_PN}-setuptools-scm-native"
+DEPENDS +="python3-setuptools-scm-native"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
@@ -15,18 +15,19 @@ SRC_URI += " \
 "
 
 RDEPENDS:${PN}-ptest += " \
-       ${PYTHON_PN}-hypothesis \
-       ${PYTHON_PN}-pytest \
-       ${PYTHON_PN}-unixadmin \
+    python3-hypothesis \
+    python3-pytest \
+    python3-unittest-automake-output \
+    python3-unixadmin \
 "
 
 do_install_ptest() {
-      install -d ${D}${PTEST_PATH}/tests
+	install -d ${D}${PTEST_PATH}/tests
         cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
 }
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-datetime \
+    python3-datetime \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


