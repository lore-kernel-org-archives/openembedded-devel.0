Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.3091.1624421594060467325
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Jun 2021 21:13:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IPfBOBEM;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id s14so9077pfg.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jun 2021 21:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4vwlJu+VQ58g9cpI3Jt0YNLKA08G1nVXcNXyZpcTwDE=;
        b=IPfBOBEMut138id8g8zWrBxObpBcgfiZUpUPOH0AnjbeLMrDJPeT16PrShjWwoC3v3
         in2DYFmVIUr6SfZltHmFE4uQnWNKeEINihrNnbjzs/7KBmWXn98Y7kNilOUxMWgFHIzR
         PbO3edk20r89tSseO/9ndMRs2By95kTYUufLhSwNX93sFjHKDHQJNKt4iOvuCpgV0vkJ
         UPKqXrURXF79jjH5cD/XUok8qWopHbT/zxQ9EZ8ussnPPKuz45mB3XuvzWRq5+SQn943
         qTVLPVf9nZi2PQ+oadYOa3A6qn6l898nsBQp9yeyTbxq+EpFl2MaDrKiNAXQdS++1Ul6
         FZ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4vwlJu+VQ58g9cpI3Jt0YNLKA08G1nVXcNXyZpcTwDE=;
        b=Cllgrd7j2Yy/M8gJMYrFergYu0iG+R4Wi81vNPPJBADPV5glIO8iVOe3RJMtnGpjPY
         yBwmyi+DjGWORZPzq2oAIg+PV7Pp4cMVD+PYvK0LN/MFKhIIpwQzlaE9e9hHZsx38/YU
         +ezN6q//kOrBm04eIAvEPU9JerLcj+pQYXm02rR5jGypmX4CZQ6O72my00eyOmggx9QO
         bngv27Bw19efkjBSN/zkY4w4kzoaAuw3M73WkUFthgWSK9M+v+kDrbbzdZg9w2sPFRXV
         xkVEILxWHPX24JQBfHevqNyL+PRwSJAOLKi/4W+Skm8IGG9e4vZSz0Syha8CkO7lpbM0
         NE1w==
X-Gm-Message-State: AOAM530Jk6YWziiWUwk8veZ8eKcKJbp2gx2mnBzZNTHLlMq//jk+Piuk
	andSlptZnsGo0PDitEZJVIyyr2XDJcdAeA==
X-Google-Smtp-Source: ABdhPJz8Jn8J4GUIavdmQC65r1D+R9h6eF07B785OGQm7G2UXy7ztYr0ye1t+M2KyBztEjWQKMbnnQ==
X-Received: by 2002:a05:6a00:21c6:b029:2ff:e9:94f0 with SMTP id t6-20020a056a0021c6b02902ff00e994f0mr7055365pfj.73.1624421593434;
        Tue, 22 Jun 2021 21:13:13 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bfd0])
        by smtp.gmail.com with ESMTPSA id b5sm17951239pgh.41.2021.06.22.21.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 21:13:13 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/4] python3-aspectlib: Add ptests
Date: Tue, 22 Jun 2021 21:13:08 -0700
Message-Id: <20210623041310.3976956-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210623041310.3976956-1-raj.khem@gmail.com>
References: <20210623041310.3976956-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ve-tornado-6-test-constraint.-Ref-15.patch | 45 +++++++++++++++++++
 .../python/python3-aspectlib/run-ptest        |  3 ++
 .../python/python3-aspectlib_1.5.2.bb         | 16 ++++++-
 3 files changed, 63 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-aspectlib/0001-Remove-tornado-6-test-constraint.-Ref-15.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aspectlib/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-aspectlib/0001-Remove-tornado-6-test-constraint.-Ref-15.patch b/meta-python/recipes-devtools/python/python3-aspectlib/0001-Remove-tornado-6-test-constraint.-Ref-15.patch
new file mode 100644
index 0000000000..174f088e9e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aspectlib/0001-Remove-tornado-6-test-constraint.-Ref-15.patch
@@ -0,0 +1,45 @@
+From d3ae6ac951cc5bbce29b9c987741e0a557c9b777 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ionel=20Cristian=20M=C4=83rie=C8=99?= <contact@ionelmc.ro>
+Date: Sun, 2 May 2021 09:50:43 +0300
+Subject: [PATCH] Remove tornado<6 test constraint. Ref #15.
+
+Upstream-Status: Backport [https://github.com/ionelmc/python-aspectlib/commit/7dccb198dfb426f529b81a28a755f3c02f8b50cb]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests/test_integrations_py3.py | 5 ++++-
+ tox.ini                        | 3 ++-
+ 2 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/tests/test_integrations_py3.py b/tests/test_integrations_py3.py
+index e025eac..596589d 100644
+--- a/tests/test_integrations_py3.py
++++ b/tests/test_integrations_py3.py
+@@ -36,7 +36,10 @@ def test_decorate_tornado_coroutine():
+     @gen.coroutine
+     @debug.log(print_to=buf, module=False, stacktrace=2, result_repr=repr)
+     def coro():
+-        yield gen.Task(loop.add_timeout, timedelta(microseconds=10))
++        if hasattr(gen, 'Task'):
++            yield gen.Task(loop.add_timeout, timedelta(microseconds=10))
++        else:
++            yield gen.sleep(0.01)
+         return "result"
+ 
+     loop = ioloop.IOLoop.current()
+diff --git a/tox.ini b/tox.ini
+index 8c607de..08c31b3 100644
+--- a/tox.ini
++++ b/tox.ini
+@@ -55,7 +55,8 @@ deps =
+     pytest-clarity
+     pytest-cov
+     pytest-travis-fold
+-    tornado<6.0
++    six
++    tornado
+ commands =
+     {posargs:pytest --cov --cov-report=term-missing -vv --ignore=src}
+ 
+-- 
+2.32.0
+
diff --git a/meta-python/recipes-devtools/python/python3-aspectlib/run-ptest b/meta-python/recipes-devtools/python/python3-aspectlib/run-ptest
new file mode 100644
index 0000000000..b63c4de0d9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aspectlib/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-aspectlib_1.5.2.bb b/meta-python/recipes-devtools/python/python3-aspectlib_1.5.2.bb
index 415a430672..2dc57a6bb0 100644
--- a/meta-python/recipes-devtools/python/python3-aspectlib_1.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-aspectlib_1.5.2.bb
@@ -8,7 +8,21 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d58b3f20fd10347a9458b8a03793b62e"
 
 SRC_URI[sha256sum] = "d275ec82c4c2712e564bb760e4accff8f061f648e38774feabeb8b241cf3a4aa"
 
-inherit pypi setuptools3
+inherit ptest pypi setuptools3
+
+SRC_URI += "file://run-ptest \
+            file://0001-Remove-tornado-6-test-constraint.-Ref-15.patch \
+           "
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
+
+RDEPENDS_${PN}-ptest += "\
+    python3-tornado \
+    python3-process-tests \
+"
 
 RDEPENDS_${PN} += "python3-core python3-fields"
 
-- 
2.32.0

