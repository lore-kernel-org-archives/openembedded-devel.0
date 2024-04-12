Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED47AC4345F
	for <webhook@archiver.kernel.org>; Fri, 12 Apr 2024 09:34:02 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.42510.1712914441353269583
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Apr 2024 02:34:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gWWGT7uY;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-56fe8093c9eso624271a12.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Apr 2024 02:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712914439; x=1713519239; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QX7bDBV6MJAgU1pVP7CEUzm7fT+d94hPdqh6IyYVS3M=;
        b=gWWGT7uYcbnlub8/7cM09Q1AMg3ufoqaJf6G0zRkYEV6quhVKn1EwpBbPoLzMWJned
         KwE8ROU6yLXNt/tsz+8UVUX8xru0Uk9Q7u70Kn+tUk/1BgDcUZGJc3OyZ0nTEUCI+TZ4
         OrqyDD4aw+J9JSCKWBwfQ4dWHMtPYgYMRvXxYefh1krUNdPXsvGiswfDuMennV+yvOLm
         q0J/I4akWfGFyK2gboJ8h+hk92f/BzkYGRwDpDr9GU0nZYmCNZ2i5JwKQcVdeE63j8u7
         0Lf/r2uCkkb8655GK/WJ4Ief4ZwULN0PnYCNDfQGxkCAHSrg8OrjHPjnGpylr/5IKkII
         k+Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712914439; x=1713519239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QX7bDBV6MJAgU1pVP7CEUzm7fT+d94hPdqh6IyYVS3M=;
        b=wrcfRCEDunwvgHI30udW2/ogavnskTmrBSCEjSinWv86SM8KdwqSDwP3S8kQ0A2ub+
         OvOQXDkHuXe+Aw+Q4diHHKekZeVcy0bSy42gd9Jc3TWZPKkMs+s8nssYE9bUZ2MmU9II
         aYwVqw6L6lLKMrA3cTk1PlQIC8Qzh4eJb4OHzrcP1+aihpvasJxFqVXn9TQhs/g+KXPi
         f0wqw6CSKC4mJ5OXFqyz8R48kSibcI4YBVi5tIXv0x8jCsTavuJpgp2NRQKQzcdXxUX7
         TBzI+gMfrt69VUp25pcPG0tvf1s5gFtPH+vIsdGe0Hvzf8tCPx64c9LfHISPR2HytFzt
         O8TA==
X-Gm-Message-State: AOJu0YySA/jQg1U6o1onOdHUXfqhBV6F376UCD0IAiaPDZ+rdSxp0ZkF
	UCTzPctGNI2gIcpTgujglDKAemsJoTnnjvp/c5RjM67qofqGJc8ofMPFsQ==
X-Google-Smtp-Source: AGHT+IFS8Kjbp2wU7I9rOm+Rkw7Iwa6Pxozj2lLNvdt2iDuD8JG3AzNJoMLragSC+o9c8XVzQpVvxQ==
X-Received: by 2002:a50:d79c:0:b0:56c:3b74:ea4 with SMTP id w28-20020a50d79c000000b0056c3b740ea4mr1495090edi.21.1712914438925;
        Fri, 12 Apr 2024 02:33:58 -0700 (PDT)
Received: from localhost.localdomain ([176.33.68.217])
        by smtp.gmail.com with ESMTPSA id z21-20020a05640235d500b0056e718795f8sm1475679edc.36.2024.04.12.02.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 02:33:58 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-ecdsa: enable ptest and add missing runtime dependency
Date: Fri, 12 Apr 2024 12:33:43 +0300
Message-Id: <20240412093343.110800-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Apr 2024 09:34:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109937

* Ptest and library example tested on qemux86-64 and qemuarm64

* Add ptest into PTESTS_SLOW_META_PYTHON

Ptest result:
=============

qemux86-64:

Testsuite summary
TOTAL: 1976
PASS: 1972
SKIP: 4
XFAIL: 0
FAIL: 0
XPASS: 0
ERROR: 0
DURATION: 292
END: /usr/lib/python3-ecdsa/ptest
2024-04-12T09:18
STOP: ptest-runner
TOTAL: 1 FAIL: 0

qemuarm64:

Testsuite summary
TOTAL: 1976
PASS: 1972
SKIP: 4
XFAIL: 0
FAIL: 0
XPASS: 0
ERROR: 0
DURATION: 236
END: /usr/lib/python3-ecdsa/ptest
2024-04-12T09:05
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 +
 .../python/python3-ecdsa/run-ptest            |  3 +++
 .../python/python3-ecdsa_0.19.0.bb            | 27 ++++++++++++++++---
 3 files changed, 27 insertions(+), 4 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-ecdsa/run-ptest

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 6bd48156d..c54df5090 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -87,6 +87,7 @@ PTESTS_FAST_META_PYTHON = "\
 
 PTESTS_SLOW_META_PYTHON = "\
     python3-arrow \
+    python3-ecdsa \
     python3-google-auth \
     python3-lz4 \
     python3-marshmallow \
diff --git a/meta-python/recipes-devtools/python/python3-ecdsa/run-ptest b/meta-python/recipes-devtools/python/python3-ecdsa/run-ptest
new file mode 100644
index 000000000..8d2017d39
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-ecdsa/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-ecdsa_0.19.0.bb b/meta-python/recipes-devtools/python/python3-ecdsa_0.19.0.bb
index 5b4f7eb93..8e967f925 100644
--- a/meta-python/recipes-devtools/python/python3-ecdsa_0.19.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ecdsa_0.19.0.bb
@@ -6,12 +6,31 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=66ffc5e30f76cbb5358fe54b645e5a1d"
 PYPI_PACKAGE = "ecdsa"
 SRC_URI[sha256sum] = "60eaad1199659900dd0af521ed462b793bbdf867432b3948e87416ae4caf6bf8"
 
-inherit pypi setuptools3 python3native
+inherit pypi setuptools3 python3native ptest
 
-RDEPENDS:${PN} += "python3-six python3-gmpy2"
+SRC_URI += " \
+	file://run-ptest \
+"
 
-BBCLASSEXTEND = "native nativesdk"
+RDEPENDS:${PN}-ptest += " \
+	python3-hypothesis \
+	python3-pytest \
+	python3-unittest-automake-output \
+"
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/tests
+	cp -rf ${S}/src/ecdsa/* ${D}${PTEST_PATH}/tests/
+}
+
+RDEPENDS:${PN} += " \
+	python3-gmpy2 \
+	python3-json \
+	python3-six \
+"
 
 do_install:append() {
-    rm ${D}${PYTHON_SITEPACKAGES_DIR}/ecdsa/test_*.py
+	rm ${D}${PYTHON_SITEPACKAGES_DIR}/ecdsa/test_*.py
 }
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


