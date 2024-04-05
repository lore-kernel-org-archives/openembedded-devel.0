Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7861FC67861
	for <webhook@archiver.kernel.org>; Fri,  5 Apr 2024 21:53:10 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.25427.1712353985972456226
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Apr 2024 14:53:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BFLF5o83;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a46a7208eedso372710766b.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Apr 2024 14:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712353984; x=1712958784; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jDnllSAys9yxb2Z2zL8bjAaFoRk2aQiar/9sgP5K9Hk=;
        b=BFLF5o83B5BVNgKqDIX4MT2+YhxkO/rkkHPtrVU+Icoh+9HT/HZp6XqM2SEdy8nu3I
         8F3TnIrIHN7VDobUPy9ekRa34dPou5vn8VF10Zu0mJ+9FZvof3476M+pSVrWiEVVqzBY
         4fOmQujVu5yE6QCwbpWdusOkF0cbwz+dn9PiU2lKCNsj57wie74TnQs7l4ju3DaeHXuA
         O/QBvoLQLO+8nswX0rf9ZV3I9orovkYIhzFS06T82M1P66iQ6vuT6jbnyjxj/UW7t3Cg
         UQuwVIOHE9HdfDA0PZ67YKgL+UPuRLlwEeJkLYUMQvu30N7OI0J+crW73NEpSXexqySI
         kNcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712353984; x=1712958784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jDnllSAys9yxb2Z2zL8bjAaFoRk2aQiar/9sgP5K9Hk=;
        b=Zo+rXWdbIN4ebJ3wcPKp89TN9khB1AjYR0vu/tdXWzTmZNatL/I0Yp2k+QF3Mx/p4e
         1oHaZjkZowMf9V0VJQIpwmIPKxlVj4YeEa8OdN+lZspuEzKlZXj2ZokWt3g+yYfsXJ+O
         tNkbwOiNvuSIUbYyYgLzcYrndDTEYrC7LFxi0sq0NCoTP22Q4QNL5ibp+l3arOj1RwVi
         BLKg4tIkit4kFG2uCTNIVdvUJyPS79LDDpSNhVsRu4Z01NsIFU8TpwsgxUjZe/5ANnTR
         S4BvEawB/yLUiTFx2quGNgI8JmqCQjnHKA7Qhw8sOxgAIzPeRi9jIOmKJ6Msn9TwtRXd
         ExIA==
X-Gm-Message-State: AOJu0YxSCydyFkMFYRcPNQnO3VWtBScYF9PHhVt5oYl3whSncCg62gSz
	hjjEUfAVU6ktLhTNsntmVMmAzxMAvDVPbM0sdb0J4fbw23+RXwuGm/XLKneh
X-Google-Smtp-Source: AGHT+IFOtoTnaUchtd0R/2qbbZixTXK3rivJBmyFC8QOXcPsBiLF39KIiiT1GarnHgi3P6/+r+B5rA==
X-Received: by 2002:a17:906:710c:b0:a51:a215:86cb with SMTP id x12-20020a170906710c00b00a51a21586cbmr1767459ejj.22.1712353983474;
        Fri, 05 Apr 2024 14:53:03 -0700 (PDT)
Received: from localhost.localdomain ([176.33.68.217])
        by smtp.gmail.com with ESMTPSA id jl7-20020a17090775c700b00a4e70ede2b7sm1276793ejc.174.2024.04.05.14.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 14:53:02 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-bleak: enable ptest and add missing runtime dependency
Date: Sat,  6 Apr 2024 00:52:54 +0300
Message-Id: <20240405215254.1338168-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Apr 2024 21:53:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109828

* Ptest tested on qemux86-64 and qemuarm64

* Add ptest into PTESTS_FAST_META_PYTHON

qemux86-64:

Testsuite summary
TOTAL: 14
PASS: 14
SKIP: 0
XFAIL: 0
FAIL: 0
XPASS: 0
ERROR: 0
DURATION: 9
END: /usr/lib/python3-bleak/ptest
2024-04-05T18:44
STOP: ptest-runner
TOTAL: 1 FAIL: 0

qemuarm64:

Testsuite summary
TOTAL: 14
PASS: 14
SKIP: 0
XFAIL: 0
FAIL: 0
XPASS: 0
ERROR: 0
DURATION: 8
END: /usr/lib/python3-bleak/ptest
2024-04-05T21:15
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 +
 .../python/python3-bleak/run-ptest            |  3 ++
 .../python/python3-bleak_0.21.1.bb            | 29 +++++++++++++++----
 3 files changed, 27 insertions(+), 6 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-bleak/run-ptest

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 2f7babe48..63f312b45 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -12,6 +12,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-ansicolors \
     python3-asgiref \
     python3-aspectlib \
+    python3-bleak \
     python3-blinker \
     python3-cachetools \
     python3-cbor2 \
diff --git a/meta-python/recipes-devtools/python/python3-bleak/run-ptest b/meta-python/recipes-devtools/python/python3-bleak/run-ptest
new file mode 100644
index 000000000..8d2017d39
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-bleak/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-bleak_0.21.1.bb b/meta-python/recipes-devtools/python/python3-bleak_0.21.1.bb
index 4a1fafb5d..96f3fcbcf 100644
--- a/meta-python/recipes-devtools/python/python3-bleak_0.21.1.bb
+++ b/meta-python/recipes-devtools/python/python3-bleak_0.21.1.bb
@@ -3,14 +3,31 @@ HOMEPAGE = "https://github.com/hbldh/bleak"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bcbc2069a86cba1b5e47253679f66ed7"
 
-SRC_URI[sha256sum] = "ec4a1a2772fb315b992cbaa1153070c7e26968a52b0e2727035f443a1af5c18f"
+SRCREV = "054b092e19c7a45d5ea07d8948022f54117fe5e8"
+PYPI_SRC_URI = "git://github.com/hbldh/bleak.git;protocol=https;branch=develop"
 
-PYPI_PACKAGE = "bleak"
+inherit pypi python_poetry_core ptest
 
-inherit pypi python_poetry_core
+S = "${WORKDIR}/git"
+
+SRC_URI += " \
+	file://run-ptest \
+"
+
+RDEPENDS:${PN}-ptest += " \
+	python3-pytest \
+	python3-pytest-asyncio \
+	python3-unittest-automake-output \
+"
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/tests
+	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
 
 RDEPENDS:${PN} += " \
-    python3-core (>3.7) \
-    python3-async-timeout \
-    python3-dbus-fast \
+	python3-core (>3.7) \
+	python3-async-timeout \
+	python3-dbus-fast \
+	python3-xml \
 "
-- 
2.25.1


