Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0F07C369AA
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 00:42:16 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.14019.1744332130348677436
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Apr 2025 17:42:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FqKly9h0;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-736aaeed234so1167126b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 17:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744332129; x=1744936929; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Awq7CSsaGaVyPPpT1rR9mNl/M3CrPRW48azLSqfV5X8=;
        b=FqKly9h0LKHMNsTn8NeBg6+K2Mn58ZpaKIClh5EozwOGjA/jpwDEoo1JEU7Mkfp6wP
         BDXPXMuullVy1SUuq28VOP0jMB1zNUPd2eQPIMS3T40ICLih5LUaZk0UdAt3kmIA1TGK
         fqHjBdnZBNEhLc8b+g/cJ9gfpLUlTl5BU50XGaAJLfdlj/YcHfhl6eXl8Blu57/HcwKZ
         TPiWPdSp0cpq39jOnbRd9P8JTtXX1FBVcmlwKR+o4Bp7T5Y5rgi47nK68prO9mLItK2G
         XJRVcV4Wz6U6sLZcS+i2KbLh0JQikcUq/NKKRL/jEMYnWw6famVKmWF0z7cFuMBDStmF
         We+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744332129; x=1744936929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Awq7CSsaGaVyPPpT1rR9mNl/M3CrPRW48azLSqfV5X8=;
        b=I95mF97Ipjevi3Qhi2RZ9gGWshWuN9qzU7vTPWMDASHNSqYD8ngl359syFmBDrkuM1
         Qpz0qr4n+dvO5UbJvQ72awy+Ukj0wByt0L1ir8RUjQw9tMCJwxpGSUlSk+IZ1aGdppyk
         hbdj0lpLQ0ZzsfthjnSHpMl/Tbm7jGFBPZv+VDrZN0gb2w3Gl0t8sbP6B+TWm7r/VQqe
         Ch5gv2D+6XcVdknZc2z2cBIXqSzi7kxAtd/YKEEz8jWyGd2ixiSyqtDsUml1Ez9KvU5e
         3i+L8HkhaBNmahM5LsCMNpGRhkYUgoQyrBiFlzGStMIBT3lAe4qjsOSX3HDWi3Ti3EJX
         qlhw==
X-Gm-Message-State: AOJu0Ywiz1l+rj80RIfB2+BJ5xW2m4h7HHfwoKCZU5j3dSlzc65DT22+
	OeJ5wQ8rWleACdhALsZngLuWZuREaz0kesf7K7mksTAEAw31ryWXgKCNhfub
X-Gm-Gg: ASbGnct+VooKUdum0+Hx9M/IveFYlQzZVI4gdRv/5n/NzSKcBvGOtZSC9y5fNf73R0k
	DF5+5cwusnVo10aFzq8Pb+eohUYkTxfUo50JyaWxNgp+IXOl2gZSGOCpfT8r3um6YDJ4qXuvdtx
	M4NM0XC5ai3BOC72oL2zY+g0A3t23g549G0Le+HN03QrcNIS+WyXxeYAYG6MX9McyA1tr4AYOTo
	NZ489UVVqEw8zlyuKmBu+kmKj2wSzwXRLW2Ahc1mANjyxSQXHt8SvkYpPFJNF5p0UPU8te3BGRf
	hvK/kJGIonB+DabzEQUrBhDsSOZxJevh
X-Google-Smtp-Source: AGHT+IGeEd4CI+Zs1rZaTseHiLYv5iEikWpCflWxYAeGWf7f7BUqJkL0g4uudzI0ieyr4d9oDlSd+A==
X-Received: by 2002:a05:6a00:890:b0:739:4a30:b902 with SMTP id d2e1a72fcca58-73bd1199eb5mr1145753b3a.2.1744332129400;
        Thu, 10 Apr 2025 17:42:09 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::c043])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c6464sm226987b3a.64.2025.04.10.17.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 17:42:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 05/12] python3-gpt-image: Use PEP-517 build backend
Date: Thu, 10 Apr 2025 17:41:54 -0700
Message-ID: <20250411004201.3826913-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250411004201.3826913-1-raj.khem@gmail.com>
References: <20250411004201.3826913-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Apr 2025 00:42:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116779

Switch to using ptest-python-pytest and add it to PTESTS_FAST_META_PYTHON

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../include/ptest-packagelists-meta-python.inc    |  1 +
 .../python3-gpt-image/python3-gpt-image/run-ptest |  3 ---
 .../python3-gpt-image/python3-gpt-image_0.9.0.bb  | 15 +--------------
 3 files changed, 2 insertions(+), 17 deletions(-)
 delete mode 100755 meta-python/recipes-extended/python3-gpt-image/python3-gpt-image/run-ptest

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index bdb4482dc5..03b4d685f1 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -31,6 +31,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-geojson \
     python3-google-auth-oauthlib \
     python3-gpiod \
+    python3-gpt-image \
     python3-gunicorn \
     python3-html2text \
     python3-httptools \
diff --git a/meta-python/recipes-extended/python3-gpt-image/python3-gpt-image/run-ptest b/meta-python/recipes-extended/python3-gpt-image/python3-gpt-image/run-ptest
deleted file mode 100755
index b63c4de0d9..0000000000
--- a/meta-python/recipes-extended/python3-gpt-image/python3-gpt-image/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta-python/recipes-extended/python3-gpt-image/python3-gpt-image_0.9.0.bb b/meta-python/recipes-extended/python3-gpt-image/python3-gpt-image_0.9.0.bb
index 01e8091f6f..941d92f55b 100644
--- a/meta-python/recipes-extended/python3-gpt-image/python3-gpt-image_0.9.0.bb
+++ b/meta-python/recipes-extended/python3-gpt-image/python3-gpt-image_0.9.0.bb
@@ -5,25 +5,12 @@ SUMMARY = "GPT Image (pure python)"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=db5f8de88d13d0917db21293d0e82e1d"
 
-SRC_URI += "\
-           file://run-ptest \
-"
-
 DEPENDS += "python3-pip"
 
 PYPI_PACKAGE = "gpt_image"
 SRC_URI[sha256sum] = "c06d8efc7cf8d6f3954c1c3d8544f494aa95da37fe04e38a9699ad3f57455f7e"
 
-inherit pypi setuptools3 python3native ptest
-
-do_install_ptest() {
-    install -d ${D}${PTEST_PATH}/tests
-    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-
-RDEPENDS:${PN}-ptest += " \
-    python3-pytest \
-"
+inherit pypi python3native python_setuptools_build_meta ptest-python-pytest
 
 do_install:append() {
 	rm -fr ${D}${libdir}/python*/site-packages/gpt-image/__pycache__

