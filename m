Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E145C48BC3
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 00:48:10 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.2711.1708390085439205309
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 16:48:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AD1DDk+h;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6e3ffafa708so1786922b3a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 16:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708390084; x=1708994884; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jk5ZOj4BstmiKjfQmMvLONmFOJG9Tmd9bRtkhje1sJU=;
        b=AD1DDk+h7N23j7GcthzCshf/W5b1Xz0sbiRG+fcvezGLmYoGl3J3K0L9nDLH4QqGLI
         XTPuvENDTmwVWpqU5Ij5h+7XAx/6eMT4syRTN3KzyeJFUaa32PokfWM3v00/GDEnNw0C
         XUPUSm/Q2ZAOBkZXf0IyKlRTeAB+apyaLzvebJ01+0tji85qqQaZ/9SVtZWmzT5H4xEs
         M27P9mJ5Wu0F6ov7ol/9WtCD7aY+y17Scax8IWiyj4z5da4M5mHwPaV+isMaCflIoUEj
         o4NWLXbwUXSWtCoSzO+QBN5kIAJQglrel/lak0Uh4UlRAHxAWuHlBX1eepv4c/p2Ekpl
         MS/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708390084; x=1708994884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jk5ZOj4BstmiKjfQmMvLONmFOJG9Tmd9bRtkhje1sJU=;
        b=aY6HTfupaGO6Jh+deAJKIdzg7aql2mnJze1jO9MJx0+JaqaBFGg+yfG3CYzctZ0ktT
         aNcNngFHULMPCj4RqaiqrY3UIUoN9rCz/4KKeuRqouXyYvowEKBJzu/4AvYZ3aVQIeu4
         iZKI3NSHCnkCq9LAiVtu0uBebh5GVtPfeeO/1K4T6kD2DBtGFx+1JXtNijHLoxLOWb15
         hWAtsm+VwywaQQCYkSerTFTnfFJ0sEHwqIHzwUhtTkgQ7hxOtjaeoxcMnD+KMZrba9Je
         lCtJVSpGOLwWC5K6yi6Gk1aoOFCx5322S18DKPOf4OfmbagnFeLT1VR0YsJuNmlO+K2o
         FbVw==
X-Gm-Message-State: AOJu0YwhQpeDa6Y5wktE+Dw5384w02hXq0CyQKOIcFZWU6Jq9Xm9pJ9P
	2j2SZcv/mIv/nSNIqs7ZEzDbxiocYceD4+SbyW0DFpRlcBRLkrVaVXbIbh9A
X-Google-Smtp-Source: AGHT+IGfPZbUj0+ZvyIbtx48k3DzyY0m9jhrvuq7JRiTu6EMDU4PDJTfUDr1YdP/r9FgHF3DvmELOA==
X-Received: by 2002:a05:6a00:8006:b0:6e4:61cf:337f with SMTP id eg6-20020a056a00800600b006e461cf337fmr6195271pfb.26.1708390084475;
        Mon, 19 Feb 2024 16:48:04 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id e15-20020a056a0000cf00b006e3be1a64f7sm4101548pfj.160.2024.02.19.16.48.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 16:48:03 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 2/3] python3-prettytable: upgrade 3.9.0 => 3.10.0; fix ptests
Date: Mon, 19 Feb 2024 16:47:45 -0800
Message-Id: <98ee880854f7edc2ce2a893cd489eb1a54bb7484.1708389659.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708389659.git.tim.orling@konsulko.com>
References: <cover.1708389659.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 00:48:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108896

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


