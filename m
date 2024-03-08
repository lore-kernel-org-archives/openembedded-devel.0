Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 500D2C54E41
	for <webhook@archiver.kernel.org>; Fri,  8 Mar 2024 05:51:55 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.14763.1709877105256740361
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Mar 2024 21:51:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FCQYhwDk;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-33e686d60eeso536193f8f.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 Mar 2024 21:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709877103; x=1710481903; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9TqvYij3EsRhYPwlkGoE0GTCwt0gGNfI6SbRa6ci2l8=;
        b=FCQYhwDk/Z3uMLKMEkwWodCtjQ9C99qOKp1jNGWdZL8U2tLlX8vnwKnH+Xw+2gnFda
         8zEZCvGWb2rO3FZ7dpBhihTluXLKuf39AU2hRtZutWAqeuzrrptn/HBzsv/pmQRmbdYa
         qTXd9fBwG3Ll/byqKkE05bCJvrqvocVw9Kp6BWEz3+sVcivBpjoxwlc0CRYR/iX+kfYA
         DcHu+2dxSkqZ7EW6rOIgP4HwyZ1OEeprNSibcDhQYdnYYWtoggjvA2tLXqG1zfCZusLP
         eFjb63UDPCbZRuOfcAiWsITjB5ch+dpgimxoJ0ftT9EI8T6lmDtbEdJts8S4Pr9nsvaM
         UEzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709877103; x=1710481903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9TqvYij3EsRhYPwlkGoE0GTCwt0gGNfI6SbRa6ci2l8=;
        b=lmZTA846z2/Si8R6dlynVcZQUbKrbGxuix+vVrvh5/XWDiixI8KLp15yG0jaxIT6ZF
         pkUKH3kVaMxFs8w5Uj86mmk/0+k7eUSaihzYcN6R9bbV4SeHg0pPFrVGCY4knUDf+KjL
         nne7Skiz+AiTc8M/Nem4Bgy8c0BUdN/jlKDu/xiQyXWr8DyXR+x6rDgCI+kiVp+Xembh
         H56b7lCwolOHeknbJlohfKLaxfU54hvZgfczXL+bMJsZLHEt6g7vzNwYObGZDbKLn60t
         059NDp65pJw+1QGxfa3SYMm9F5g8PKA4Fmt76Y7bwz97aXCnfbH4wJNWIz0hNPNLipBC
         UJVg==
X-Gm-Message-State: AOJu0YyXYe9iguGCb5IkgvNVwGHVQ3ytGC2NQJitNbB1HKabxw+1Pdm4
	mnbuJ+//4NqX9GNC5Nzk/XuVscO7+a+KNjjwBtCUW2ocXlMxreVaaBUpptzPKqE=
X-Google-Smtp-Source: AGHT+IEjSvt4GBMMUHcdBkpbdCZPrp7abuJsXeWK6mniquWjwGHTFfqOMlGoQuNnZ5wdxHfsx1f/aQ==
X-Received: by 2002:adf:c846:0:b0:33d:77e:43ab with SMTP id e6-20020adfc846000000b0033d077e43abmr12797116wrh.34.1709877102656;
        Thu, 07 Mar 2024 21:51:42 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.159])
        by smtp.gmail.com with ESMTPSA id bt12-20020a056000080c00b0033e3a110d7fsm13829593wrb.71.2024.03.07.21.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 21:51:42 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH 1/3] python3-pytest-localserver: added recipe which is also include ptest
Date: Fri,  8 Mar 2024 08:51:34 +0300
Message-Id: <20240308055136.81476-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Mar 2024 05:51:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109219

pytest-localserver is a plugin for the pytest testing framework which enables you to test server connections locally.

* Tested on qemux86-64 and qemuarm64

* Add ptest into PTESTS_SLOW_META_PYTHON

Ptest result:
==============
qemux86-64:

Testsuite summary
TOTAL: 55
PASS: 54
SKIP: 1
XFAIL: 0
FAIL: 0
XPASS: 0
ERROR: 0
DURATION: 44
END: /usr/lib/python3-pytest-localserver/ptest
2024-03-07T20:33
STOP: ptest-runner
TOTAL: 1 FAIL: 0

qemuarm64:

Testsuite summary
TOTAL: 55
PASS: 54
SKIP: 1
XFAIL: 0
FAIL: 0
XPASS: 0
ERROR: 0
DURATION: 38
END: /usr/lib/python3-pytest-localserver/ptest
2024-03-07T20:41
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 +
 .../python3-pytest-localserver/run-ptest      |  3 ++
 .../python3-pytest-localserver_0.8.1.bb       | 29 +++++++++++++++++++
 3 files changed, 33 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-localserver/run-ptest
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-localserver_0.8.1.bb

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 20ca2763c..ce5ccf22d 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -80,6 +80,7 @@ PTESTS_SLOW_META_PYTHON = "\
     python3-arrow \
     python3-lz4 \
     python3-marshmallow \
+    python3-pytest-localserver \
     python3-traitlets \
     python3-yappi \
 "
diff --git a/meta-python/recipes-devtools/python/python3-pytest-localserver/run-ptest b/meta-python/recipes-devtools/python/python3-pytest-localserver/run-ptest
new file mode 100644
index 000000000..8d2017d39
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytest-localserver/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-pytest-localserver_0.8.1.bb b/meta-python/recipes-devtools/python/python3-pytest-localserver_0.8.1.bb
new file mode 100644
index 000000000..669817829
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytest-localserver_0.8.1.bb
@@ -0,0 +1,29 @@
+SUMMARY = "pytest plugin to test server connections locally."
+HOMEPAGE = "https://github.com/pytest-dev/pytest-localserver"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b8da7a541d738b054dcbf70c31530432"
+
+DEPENDS += "python3-setuptools-scm-native"
+
+inherit pypi python_setuptools_build_meta ptest
+
+SRC_URI[sha256sum] = "66569c34fef31a5750b16effd1cd1288a7a90b59155d005e7f916accd3dee4f1"
+
+SRC_URI += " \
+        file://run-ptest \
+"
+
+RDEPENDS:${PN}-ptest += " \
+	python3-pytest \
+	python3-requests \
+	python3-unittest-automake-output \
+"
+
+do_install_ptest() {
+        install -d ${D}${PTEST_PATH}/tests
+        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
+
+RDEPENDS:${PN} += " \
+	python3-werkzeug \
+"
-- 
2.25.1


