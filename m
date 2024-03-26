Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44D11C6FD1F
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 19:26:01 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.19372.1711481157413149647
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Mar 2024 12:25:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EkqALgC8;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a46ba938de0so796812666b.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 Mar 2024 12:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711481155; x=1712085955; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MrUkrSnHZM+5jOJv++LNsc6trbNHGfgGwUdhljFGvCw=;
        b=EkqALgC80H4gMN+YEXE3J1daa3d/1U5j05uIj3iS6ZxbeEsX8V5ea68h7DyYPUvOfb
         8v+SAVRVDlLQkkcHElwZNtdvKZQsWEgOAw5deutyfHk8e42x/TSGn2wa2Pm7IUbkXJXV
         ljDPnf1lcJIIMl3kClCk/TJbYTSZ+gKCfJ7fR4GRrmTibIiGCGuV7YXwVhdLabsbUabA
         785HJsFyhjaTdhFRcED7bdZhuTndGRUxglrSJJ0YDoYlFBltajiZCcIymSeNkhsWZySZ
         kZYcqM5RNSdRQBQgvuToUdbmVG35UfhZCmLcATkc3Gc8Z+mPB4ud3GWMHIV+tBoUBcgo
         MQfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711481155; x=1712085955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MrUkrSnHZM+5jOJv++LNsc6trbNHGfgGwUdhljFGvCw=;
        b=BOg8xYaxKeGm1xWwH2AvVyB8fDFFU5Jxtbks7DBUJEYbSZbA09Fx3kevOyL34XdDNY
         zPJNN4+OpcWvw6flTRyHquPqBfr7ielDIWyvJFE/zSsiSbL6pyhsKOndxiLncYGjv22Q
         R2DPXVR5axoaktdEDP42Ven145LAqIsqMniRlXfPY6LcRfaTZKVRKdv3LRRFXo0Haoiu
         0ZWf6f+16rzCmn0Acxh9oNbBX36+yh4M5hTHCyMJrkPlL57fy/mPyfj5E2E+fomoB5Gf
         69DHkfiQvznCXH7BONyY2t0qiexQwCxvTo9YaG3KI6RlabgJLYvtHLJibon0Kt7cwowF
         IKGw==
X-Gm-Message-State: AOJu0YxI7vRUSdu4T+ePETKUj0VU7zfZ5JI1aLnaCTL+XGtVALEx8T0T
	swFhQRp3oaL/YBz7scbQ1HdxhHGVx93VMmllaN8jt3td5MPcv8nm2qqPdUixs1Q=
X-Google-Smtp-Source: AGHT+IFbH9O/siPJbut/uf/nLQdFmw0Q9u8Tk7L3GFsHFRgdSpGVC1LBEav+x3//XXTiPZ1Tcrbegw==
X-Received: by 2002:a17:906:2457:b0:a46:e51a:466e with SMTP id a23-20020a170906245700b00a46e51a466emr2302873ejb.64.1711481154965;
        Tue, 26 Mar 2024 12:25:54 -0700 (PDT)
Received: from localhost.localdomain ([176.33.68.217])
        by smtp.gmail.com with ESMTPSA id zh20-20020a170906881400b00a47531764fdsm3127167ejb.65.2024.03.26.12.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 12:25:54 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-portalocker: enable ptest
Date: Tue, 26 Mar 2024 22:25:23 +0300
Message-Id: <20240326192523.116673-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Mar 2024 19:26:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109626

* test_combined.py deleted because it is not a functional test. It checks if the 'combine' function work correctly which is parse README.rst and LICENSE.

* Ptest and library example tested on qemux86-64 and qemuarm64

* Add ptest into PTESTS_FAST_META_PYTHON

qemux86-64:

Testsuite summary
TOTAL: 21
PASS: 21
SKIP: 0
XFAIL: 0
FAIL: 0
XPASS: 0
ERROR: 0
DURATION: 11
END: /usr/lib/python3-portalocker/ptest
2024-03-26T18:47
STOP: ptest-runner
TOTAL: 1 FAIL: 0

qemuarm64:

Testsuite summary
TOTAL: 21
PASS: 21
SKIP: 0
XFAIL: 0
FAIL: 0
XPASS: 0
ERROR: 0
DURATION: 11
END: /usr/lib/python3-portalocker/ptest
2024-03-26T18:52
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 +
 .../python3-portalocker/run-ptest             |  3 +++
 .../python3-portalocker_2.8.2.bb              | 26 ++++++++++++++++---
 3 files changed, 26 insertions(+), 4 deletions(-)
 create mode 100644 meta-python/recipes-extended/python3-portalocker/python3-portalocker/run-ptest

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index ec26f768e..ccb443182 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -40,6 +40,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-parse-type \
     python3-platformdirs \
     python3-polyline \
+    python3-portalocker \
     python3-precise-runner \
     python3-prettytable \
     python3-pydantic \
diff --git a/meta-python/recipes-extended/python3-portalocker/python3-portalocker/run-ptest b/meta-python/recipes-extended/python3-portalocker/python3-portalocker/run-ptest
new file mode 100644
index 000000000..8d2017d39
--- /dev/null
+++ b/meta-python/recipes-extended/python3-portalocker/python3-portalocker/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest --automake
diff --git a/meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.8.2.bb b/meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.8.2.bb
index 69578ba84..c45a3fcda 100644
--- a/meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.8.2.bb
+++ b/meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.8.2.bb
@@ -8,11 +8,29 @@ SRC_URI[sha256sum] = "2b035aa7828e46c58e9b31390ee1f169b98e1066ab10b9a6a861fe7e25
 
 DEPENDS += "python3-setuptools-scm-native"
 
-inherit pypi python_setuptools_build_meta
+inherit pypi python_setuptools_build_meta ptest
 
-BBCLASSEXTEND = "native nativesdk"
+SRC_URI += " \
+	file://run-ptest \
+"
+
+RDEPENDS:${PN}-ptest += " \
+	python3-multiprocessing \
+	python3-pytest \
+	python3-redis \
+	python3-unittest-automake-output \
+	redis \
+"
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/tests
+	cp -rf ${S}/portalocker_tests/* ${D}${PTEST_PATH}/tests/
+	rm -rf ${D}${PTEST_PATH}/tests/test_combined.py
+}
 
 RDEPENDS:${PN} += " \
-        python3-fcntl \
-        python3-logging \
+	python3-fcntl \
+	python3-logging \
 "
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


