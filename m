Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11BABCD8CA6
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 16:10:41 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.95542.1696954237731317976
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Oct 2023 09:10:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=e+LA1DAs;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40572aeb673so56632575e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Oct 2023 09:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1696954235; x=1697559035; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YtP1CJIi2yib6aKqaIJTpBibxHAYbf1q4kZZXTwgxao=;
        b=e+LA1DAsJBh39HCb1jlurSjokM2QTRV7JUAh2Vc++Ke8gDHo6oeUvzuE8LiAGz/YAl
         cNOJxq7AoHF4g+nzuVTHwfNGpnPNjZG+9bbcNUTlQO+xUOdGN1IPOqK4aL8EHZIWQ7jL
         6bP688zgMBK7L1rC7QG04DA75D2NeL+Y9EzF8L+7srPH+6WMhvDW8lFBRmnRMI7cSGUP
         3SVEOw/JCRe0ld9fKcBmJR33r+4ujOPa2NRVbGfD3TRUyYm6oO6UVklJnXxZYNBC56nu
         kqDm5VvnMkzGemnlhWWu/ZSJ1SsfL4BxW+Z/KeYlGDxQRKMieoWV1sLftdr7llNm8aUV
         N1uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696954235; x=1697559035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YtP1CJIi2yib6aKqaIJTpBibxHAYbf1q4kZZXTwgxao=;
        b=hA5pXD0fb23P8OBlYjmteI6jamCN0rNfKrJWhRzao4c6OUBPmvPNqjHiaNxr6LLkoA
         ILlsxzL8hN77igAyMUIG2Jfr+JI62D/nQH3nMxjK4rbO4CsKqHhSylbiJJ7ZXdktFHrF
         STbEGpjuEUTMdLIgHhfsm+S14swH0MFpVWHsmMYAjLuuVXFW8KmDhSQQb0bow31w7ryJ
         iVcd8GfntM6tXzrPgswFF3kw3hpLW6foKs9Ryy2D1oMyayNScR1e71rGtB6EdOkfrGud
         gcU0j0FE9mgV9cixNtIsCm1WWnEs+Q3E6P8GdAdd1fFxCD2v53TbrP6CrhK5ghPRrOPG
         ChlQ==
X-Gm-Message-State: AOJu0Yy/4CNeO9JLK2GTP/8G01ywLylfgG2riXmQ3maSJnPmEspmPBrq
	y8lWvaK63yuELoLqkiyIrfZla2chtzwUfFrTLX4=
X-Google-Smtp-Source: AGHT+IFYKD2Oneyfw+nYXg58dXTwHwXtfXl6l6Cct+2CoI0+Vah/S1bY0VCwqWDx2DL1k/is4qxivQ==
X-Received: by 2002:adf:fa4c:0:b0:320:77f:a97c with SMTP id y12-20020adffa4c000000b00320077fa97cmr15012099wrr.63.1696954235533;
        Tue, 10 Oct 2023 09:10:35 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.numericable.fr ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id p8-20020adfce08000000b003271be8440csm13032857wrn.101.2023.10.10.09.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 09:10:35 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Mickael RAMILISON <mickael.ramilison@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-python][PATCH] python3-rapidjson: add ptest
Date: Tue, 10 Oct 2023 18:09:33 +0200
Message-Id: <20231010160932.1711687-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Oct 2023 16:10:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105409

From: Mickael RAMILISON <mickael.ramilison@smile.fr>

Signed-off-by: Mickael RAMILISON <mickael.ramilison@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
---
Note:
As of now, the ptest shows:
  Testsuite summary
  # TOTAL: 940
  # PASS: 913
  # SKIP: 17
  # XFAIL: 2
  # FAIL: 8
  # XPASS: 0
  # ERROR: 0

 .../python/python3-rapidjson/run-ptest        |  3 +++
 .../python/python3-rapidjson_1.11.bb          | 20 ++++++++++++++++++-
 2 files changed, 22 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-rapidjson/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-rapidjson/run-ptest b/meta-python/recipes-devtools/python/python3-rapidjson/run-ptest
new file mode 100644
index 000000000..8d2017d39
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-rapidjson/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-rapidjson_1.11.bb b/meta-python/recipes-devtools/python/python3-rapidjson_1.11.bb
index 930ad3434..3ea559488 100644
--- a/meta-python/recipes-devtools/python/python3-rapidjson_1.11.bb
+++ b/meta-python/recipes-devtools/python/python3-rapidjson_1.11.bb
@@ -9,14 +9,32 @@ SRCREV = "e1b41f64df1705770b7b70d7221a4812909c1d0f"
 
 S = "${WORKDIR}/git"
 
-inherit setuptools3
+# Inheriting ptest provides functionality for packaging and installing runtime tests for this recipe
+inherit setuptools3 ptest
 
 SETUPTOOLS_BUILD_ARGS += " --rj-include-dir=${RECIPE_SYSROOT}${includedir}"
 
+# run-ptest is a shell script that starts the test suite
+SRC_URI += " \
+    file://run-ptest \
+"
+
 DEPENDS += " \
     rapidjson \
 "
 
+# Adding required python package for the ptest (pytest and pytest->automake report translation)
+RDEPENDS:${PN}-ptest += " \
+    ${PYTHON_PN}-pytest \
+    ${PYTHON_PN}-unittest-automake-output \
+"
+
 RDEPENDS:${PN} += " \
     ${PYTHON_PN}-core \
 "
+
+# Installing the test suite on the target
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
-- 
2.30.2


