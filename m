Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D685CC54798
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 10:12:43 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.18722.1709633558695957581
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Mar 2024 02:12:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W5fmR0yw;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a441d7c6125so51410366b.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Mar 2024 02:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709633557; x=1710238357; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z+3mJUro733XfG8ZQImQg4L2/DAN4nvAEtKxdwKwW3U=;
        b=W5fmR0ywsioJhHuAPcxcbAKqj/MZ9CdzWZFNU0uThxWwNvnoKKChvN72WjCY6xj3hi
         Y6OKQHccFWrJiwaq1prL8zck9+rVWJl0FByQNYcqDgrZW6kpO++iPSYfIkPycDADtgGn
         XCahz+zA1LslgaNnH/2xMRZWHj4+V995jF+j+0DTgTv0cnyI5ejV7CdJS9dghmv/1sIS
         4IUcACEZvxuEj82OAF4zONcAWd2OzY/0w636J07cfNEXT3Zni5WRXeYqE5r88A0Uc653
         C2gEyrxFwmqOUTlTqXL7T442yp8APgd7wxcoIaCg/BaGV3iZZiStVZD8tfmuq+rDAEEB
         S9DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709633557; x=1710238357;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z+3mJUro733XfG8ZQImQg4L2/DAN4nvAEtKxdwKwW3U=;
        b=PUh0253hSfEnnb7XLBNSKBwgHEu0k2/ogTU+nnYvB2gV4sJ0e/GijLcbRRYe95A5/1
         cvcyiiPI9zFM3Za04H0VAKiwOd3XNwTkfvRoSHZ5b3c1A3U6P8HIn/9RFlrANSPH1ddO
         mWA1MM0KwyNDTZ+gzpCkZY4pM/9GyNmHW3BzL9i6+XxlR4K63/mfDW/lLWl7rEHFVKgG
         Ar6BCnwiATGtf74x5fPaYG6mYY4htX9ee/63h6xQFb8M1XgCPbVyWkeCOxeJWzzfkcE1
         U6bkFxAI1IGLUGd+1vqP478sS9cWMWDQS8+XZtTvKLcMUiM4lbnzX5cZJ3VgoUQmR3Lj
         UUpQ==
X-Gm-Message-State: AOJu0YwbCLSvZE0gOktyJVSyKLXBP27UujlquKay/aWpLOcwLOBV7nKp
	jcMuBgZ0xRYpajkDN+Mnz21aAzRlkbxazcGisI0hVa0NuYhUFqFu+Phcmeg+D/s=
X-Google-Smtp-Source: AGHT+IH5orLhp9oMkb51ArSUzzAW7v9+VrST7LD0XbT9ucTDlRYJaHwAMWXhOZXl6mSDvEEVWp753Q==
X-Received: by 2002:a17:906:2e92:b0:a45:6b65:f6cb with SMTP id o18-20020a1709062e9200b00a456b65f6cbmr2952966eji.26.1709633556598;
        Tue, 05 Mar 2024 02:12:36 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.159])
        by smtp.gmail.com with ESMTPSA id jw3-20020a170906e94300b00a44d3847811sm3791402ejb.102.2024.03.05.02.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 02:12:36 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-freezegun: add recipe and add ptest
Date: Tue,  5 Mar 2024 13:12:29 +0300
Message-Id: <20240305101229.304761-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Mar 2024 10:12:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109117

FreezeGun is a library that allows your Python tests to travel through time by mocking the datetime module.

* Tested on qemux86-64 and qemuarm64
* Add ptest into PTESTS_FAST_META_PYTHON

Ptest result:
=============
qemuarm64:

Testsuite summary
TOTAL: 127
PASS: 121
SKIP: 6
XFAIL: 0
FAIL: 0
XPASS: 0
ERROR: 0
DURATION: 20
END: /usr/lib/python3-freezegun/ptest
2024-03-05T06:53
STOP: ptest-runner
TOTAL: 1 FAIL: 0

qemux86-64:

Testsuite summary
TOTAL: 127
PASS: 121
SKIP: 6
XFAIL: 0
FAIL: 0
XPASS: 0
ERROR: 0
DURATION: 21
END: /usr/lib/python3-freezegun/ptest
2024-03-05T06:57
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 +
 .../python/python3-freezegun/run-ptest        |  3 ++
 .../python/python3-freezegun_1.4.0.bb         | 29 +++++++++++++++++++
 3 files changed, 33 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-freezegun/run-ptest
 create mode 100644 meta-python/recipes-devtools/python/python3-freezegun_1.4.0.bb

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 3b19152f4..65a45c4b6 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -17,6 +17,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-click \
     python3-dominate \
     python3-execnet \
+    python3-freezegun \
     python3-geojson \
     python3-gpiod \
     python3-gunicorn \
diff --git a/meta-python/recipes-devtools/python/python3-freezegun/run-ptest b/meta-python/recipes-devtools/python/python3-freezegun/run-ptest
new file mode 100644
index 000000000..8d2017d39
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-freezegun/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-freezegun_1.4.0.bb b/meta-python/recipes-devtools/python/python3-freezegun_1.4.0.bb
new file mode 100644
index 000000000..15c0bf06b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-freezegun_1.4.0.bb
@@ -0,0 +1,29 @@
+SUMMARY = "FreezeGun is a library that allows your Python tests to travel through time by mocking the datetime module."
+HOMEPAGE = "https://github.com/spulec/freezegun"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=acf1d209bb6eddae4cbe6ffd6a0144fe"
+
+SRC_URI[sha256sum] = "10939b0ba0ff5adaecf3b06a5c2f73071d9678e507c5eaedb23c761d56ac774b"
+
+inherit pypi python_setuptools_build_meta ptest
+
+SRC_URI += " \
+        file://run-ptest \
+"
+
+RDEPENDS:${PN}-ptest += " \
+        python3-pytest \
+        python3-sqlite3 \
+        python3-unittest-automake-output \
+"
+
+do_install_ptest() {
+        install -d ${D}${PTEST_PATH}/tests
+        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
+
+RDEPENDS:${PN} = "\
+        python3-asyncio \
+        python3-dateutil \
+        python3-unittest \
+"
-- 
2.25.1


