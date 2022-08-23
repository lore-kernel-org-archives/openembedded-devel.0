Return-Path: <workjagadeesh@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2265AC32772
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 17:26:27 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.778.1661275581626399573
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 10:26:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XwSs7NJS;
 spf=pass (domain: gmail.com, ip: 209.85.210.177,
 mailfrom: workjagadeesh@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id 83so8382079pfw.6
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 10:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc;
        bh=+81U8cVi8kxKJY+WLtZIvHl9gMZxNu+siBhcIciKgTk=;
        b=XwSs7NJS4d7WaJNnCIhN7QriK+6bU1SZUO5DFEEBr4vC7qZquNVtpD5L34AfO1zsCL
         DMdsRRLaJWnJ5v7XIr+bXsrXyk5SCCz5PbdwURldyhEm1BCxkC74234XPXqIFkh7w3LP
         4D2bzSmip7xjd+GxxJfWMtr0fHE8B8FI79ik6pbLtCuszTspJFtdVuQ9b3qP4mmvDdMg
         p86bSOCGNiHuWeOrUDkExm3qfZK6o6U4fbGR3/UhPadONFydF5sZ9lPlWQKR8vgZA8sp
         kQTUHlMpjYLmqmAusK6QLRZ1coyrsJOD0p1Bc35lG/qdZGPMflGsJ/hLglq0JLbzatCO
         fyGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=+81U8cVi8kxKJY+WLtZIvHl9gMZxNu+siBhcIciKgTk=;
        b=7yArD6zIzEEmPoK3unthGM+o7qhJCnHeU5m5hkmJxokSL6L/nZkZCzML2As2lUg/B0
         CjRHhCjd02UT5+m6wMSCuGZMDw0Eh+RWIsKjFE93qFpwYcT//3esC73mLPQhtP0G70/W
         /oDIPYraaCrPilL6kSs89SOqmQSh365oCithG73vw7bSB/tTqtJcH0Df+hcIsyn+nrlv
         xzPbXnNf4xSz/ahsEv6jlDF4sL3lAe6oQ4Qg8EQEtAOdKdD9nQGa7myTvEhIT5dkYE2s
         ilA/912O5hp5Ee8/1aBbunvunuruNywjgiNZeKIF7HxsfHHsg3fVrsz5NoLk8fjKMJSp
         6ugQ==
X-Gm-Message-State: ACgBeo0KHT19rhIwsGIYERea208YOF0i3bWAOQMwEbkrQ+jsURGbLQL2
	pIftG+UbTAksy+8nGrDcAJifzEcEpk5W7Q==
X-Google-Smtp-Source: 
 AA6agR6mzAo777DhTJeUrqhUwbd99fkcIGQRePSbf44fR3GZGb5erRIT6ku94be7HCHSU23DTs/xpA==
X-Received: by 2002:a63:3509:0:b0:42b:15a6:8267 with SMTP id
 c9-20020a633509000000b0042b15a68267mr78692pga.570.1661275580629;
        Tue, 23 Aug 2022 10:26:20 -0700 (PDT)
Received: from localhost.localdomain ([157.45.6.126])
        by smtp.gmail.com with ESMTPSA id
 d22-20020a63fd16000000b0042ae03134a0sm2333694pgh.48.2022.08.23.10.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 10:26:20 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>
Subject: [meta-python][PATCH 1/3] python3-asgiref: add recipe
Date: Tue, 23 Aug 2022 17:26:00 +0000
Message-Id: <20220823172602.212-1-workjagadeesh@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Aug 2022 17:26:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98397

The default version of python3-django 2.2.x is no longer supported.
So, python3-django either 3.x or 4.x should be preferred, that
requires python3-asgiref at runtime.

More info at https://bugzilla.yoctoproject.org/show_bug.cgi?id=14888

Signed-off-by: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>
---
 .../python/python3-asgiref/run-ptest          |  3 ++
 .../python/python3-asgiref_3.5.2.bb           | 29 +++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-asgiref/run-ptest
 create mode 100644 meta-python/recipes-devtools/python/python3-asgiref_3.5.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-asgiref/run-ptest b/meta-python/recipes-devtools/python/python3-asgiref/run-ptest
new file mode 100644
index 000000000..3385d6893
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-asgiref/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-asgiref_3.5.2.bb b/meta-python/recipes-devtools/python/python3-asgiref_3.5.2.bb
new file mode 100644
index 000000000..860479199
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-asgiref_3.5.2.bb
@@ -0,0 +1,29 @@
+DESCRIPTION = "ASGI is a standard for Python asynchronous web apps and servers to communicate with each other, and positioned as an asynchronous successor to WSGI."
+HOMEPAGE = "https://pypi.org/project/asgiref/"
+SECTION = "devel/python"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f09eb47206614a4954c51db8a94840fa"
+
+SRC_URI += "file://run-ptest \
+	    "
+
+SRC_URI[sha256sum] = "4a29362a6acebe09bf1d6640db38c1dc3d9217c68e6f9f6204d72667fc19a424"
+
+export BUILD_SYS
+export HOST_SYS
+
+inherit pypi ptest setuptools3
+
+RDEPENDS:${PN}-ptest += " \
+    ${PYTHON_PN}-pytest \
+    ${PYTHON_PN}-asyncio \
+    ${PYTHON_PN}-io \
+    ${PYTHON_PN}-multiprocessing \
+"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


