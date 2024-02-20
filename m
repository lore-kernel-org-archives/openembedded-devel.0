Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8873C5475B
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 04:32:21 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.web11.6515.1708403536662324131
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 20:32:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vl3+oJaq;
 spf=pass (domain: gmail.com, ip: 209.85.161.52, mailfrom: ticotimo@gmail.com)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-59a8b9b327aso1799420eaf.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 20:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708403535; x=1709008335; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+hmKl+DQJSx/g7Eaiy4ZBlxia09nARsMYtRRMfmDDus=;
        b=Vl3+oJaqH0WU2T8SJHRBA2nBK6newBYIRUX8kuAy+DijxffuWYMdh9sSTXzEOGYkYd
         qYTFLaxCYc2HxT19gSANUOjbXiePl63RW8gKO0/L0NL3KjU3wPPyo0s2b62QzQIIB5y4
         WrVSXG225VbdLDkmCyto4Q56CRT8hm/f/VjSlorMdn4b0lOp6MlvTjQMATAcizIglLO0
         1FhAHxk0byQQJ9iyHSJMtE0Uyj6TudnewC7M7yvivApWle8zSt3xWRXP1ecHtbWk4Xjd
         q5R3gLAOFPvRS0SNAiOvQ6wa8Y3O8W2vLvYq7gVAepzsqQ5EYAsUv2srmzxctTyvXSKX
         zcYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708403535; x=1709008335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+hmKl+DQJSx/g7Eaiy4ZBlxia09nARsMYtRRMfmDDus=;
        b=oBSHZmk7vaEXilQ0siT8pN/PTilzrjQ0lO1rM0SQvGaxJfTheOLUhsoCqu72wa9Ovr
         JzlAoLaKq8qd4HzR8w9JvENJ9z98b/jbhBU2ulthTsi2W0TD/y5kqGklOXcVn8X0H0AR
         680sSmLhy4E92f0KNO1GKCKmPDsZcw7gbipDcgRCAGiINX4DxEjZdWEhyrAFw419eUuE
         5z2F2DhWLSeS/pejLSTQMI/CtBm1ec3lAgP4ASxo21GRMKE0od36JPWf6kAPnH5iBrNK
         mKDgt4P+ID52flshFJHb4igjASW94Vee460mjbmqwbwJskSOd9qSSEtmcxIrc+ZigMaa
         YBrQ==
X-Gm-Message-State: AOJu0Yzxwty8yLyFypB279q++DKVkOmf21TmcKsNd5MLYp3cAxglxwZT
	hzV/to5OVd8+kRwb2uiTzgfOmZvW+/j3oissuziYWvIY8akIhHnG1TgixjCP
X-Google-Smtp-Source: AGHT+IHipHtS1wCxwmYI0cNpVma+5LYbYablb6KfOj8Q+36gWuAjwfKRFXn/P5oXyPks8HfQjj/I7Q==
X-Received: by 2002:a05:6358:33a9:b0:176:51d2:802 with SMTP id i41-20020a05635833a900b0017651d20802mr18210275rwd.1.1708403535394;
        Mon, 19 Feb 2024 20:32:15 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id g14-20020a63110e000000b005dc88b232a5sm5490269pgl.26.2024.02.19.20.32.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 20:32:15 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH v2 2/3] python3-prettytable: upgrade 3.9.0 => 3.10.0; fix ptests
Date: Mon, 19 Feb 2024 20:31:52 -0800
Message-Id: <f3aefa7a78502f636a8465478fdea2b5c4c9aa10.1708403129.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708403129.git.tim.orling@konsulko.com>
References: <cover.1708403129.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 04:32:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108909

* Add all tests/* to be more complete and also to help
  pytest find the tests (previously, no test cases were
  actually being run)
* Sort RDEPENDS alphabetically
* ptest now RDEPENDS on python3-pytest-lazy-fixtures (with the s)
  instead of python3-pytest-lazy-fixture (without the s) because
  of python3-pytest 8.0.0 compatability.
* Rearrange the recipe a bit

https://github.com/jazzband/prettytable/releases/tag/3.10.0

Added
* Add support for Python 3.13 (#281) @hugovk

Changed
* Speedup: lazy imports and remove import (#276) @hugovk
* Use GitHub Flavored Markdown for table formatting (#268) @mumblingMac
* Use flake8-errmsg for friendlier tracebacks (#254) @hugovk
* Replace Flake8 with Ruff (#278) @hugovk

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
Changes in v2:
Rebased on top of rebased timo/drop-PYTHON_PN on top of master-next

 ...3.9.0.bb => python3-prettytable_3.10.0.bb} | 33 ++++++++++---------
 1 file changed, 17 insertions(+), 16 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-prettytable_3.9.0.bb => python3-prettytable_3.10.0.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-prettytable_3.9.0.bb b/meta-python/recipes-devtools/python/python3-prettytable_3.10.0.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-prettytable_3.9.0.bb
rename to meta-python/recipes-devtools/python/python3-prettytable_3.10.0.bb
index ba75057f59..35e9ab1798 100644
--- a/meta-python/recipes-devtools/python/python3-prettytable_3.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-prettytable_3.10.0.bb
@@ -3,7 +3,12 @@ HOMEPAGE = "http://code.google.com/p/prettytable"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c9a6829fcd174d9535b46211917c7671"
 
-SRC_URI[sha256sum] = "f4ed94803c23073a90620b201965e5dc0bccf1760b7a7eaf3158cab8aaffdf34"
+
+SRC_URI[sha256sum] = "9665594d137fb08a1117518c25551e0ede1687197cf353a4fdc78d27e1073568"
+SRC_URI += " \
+	file://run-ptest \
+"
+inherit pypi ptest python_hatchling
 
 do_install:append() {
     perm_files=`find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "*.txt" -o -name "PKG-INFO"`
@@ -12,33 +17,29 @@ do_install:append() {
     done
 }
 
-BBCLASSEXTEND = "native nativesdk"
-inherit pypi ptest python_hatchling
-
-SRC_URI += " \
-	file://run-ptest \
-"
-
 DEPENDS += "\
     python3-hatch-vcs-native \
 "
 
 RDEPENDS:${PN} += " \
-	python3-math \
-	python3-html \
-	python3-wcwidth \
-	python3-json \
-	python3-compression \
-	python3-importlib-metadata \
+    python3-compression \
+    python3-html \
+    python3-importlib-metadata \
+    python3-json \
+    python3-math \
+    python3-wcwidth \
 "
 
 RDEPENDS:${PN}-ptest += " \
     python3-pytest \
-    python3-pytest-lazy-fixture \
+    python3-pytest-lazy-fixtures \
     python3-sqlite3 \
     python3-unittest-automake-output \
 "
 
 do_install_ptest() {
-	cp -f ${S}/tests/test_prettytable.py ${D}${PTEST_PATH}/
+     install -d ${D}${PTEST_PATH}/tests
+     cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
 }
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


