Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31880C54798
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 19:45:42 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.2877.1709840735190749285
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Mar 2024 11:45:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KncI/7wY;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a450bedffdfso184447766b.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 Mar 2024 11:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709840733; x=1710445533; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YDT+bIOBV+7k41lKAcsQ20zUhWGp8e8ErI70BU/zJ+8=;
        b=KncI/7wYl8iA2p0rirw/cY5pBQ6uf9E1Zr/2ZHHKB3ICQ41kiObYeTWKB6nz7c61MK
         1nZnWXSfiXPnMxquQJDXm37CG+Lqt52CNfHP4Zv7aJXbJJXAGPUofHrGdjPqfIxl0ptw
         w2itnQHHYgNlD9zehB99xTmUHXDF20v3VbTu7181sWqGV2vLT9dEZQBAsi7dlxowzLlB
         qXWFHaOoCGC69OK5wvYZPOvzrljKxhZUgAtvCFqHQa/2EgFCx47zU4tmqJZyUYqEX0w7
         TNhZwT2BYzzH5VdnmDV7WaYK61oNdV+hlTCIMRzfAdeMN5pxHkG+oY4inTAVKUvfzqbn
         Yb/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709840733; x=1710445533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YDT+bIOBV+7k41lKAcsQ20zUhWGp8e8ErI70BU/zJ+8=;
        b=wOkECrepxQjb/+gvhTp8OdB1LJRojtKxVpOvK8w5CzzMvCxggoqfpbw7LkUGk+FAPF
         AfFrR+kjnKclIjvZs2H1H4Boa1g8N0x+Yu/j8QC4wWvQcyiOG3wjpMda+OIAp+Mmtu/A
         a2DCBMdiBWrTf/MZjK/ZQ3ukIkJ+4Fv0O365gm45+i21oZIg0aT4epwJGGAaIQPheRD1
         78lMewBucEEUat6fVbj1l0KkPLj3qzb2DSKeL9og/Lc/Aguh6EkfbwAwtyUApti7p+eo
         8ZSW4IFC61G8YIcnq7cR10bL2HtUwRSVcWf9yJ85RVQ6tZUHc9RzLE4AEqtmUYfMB2CQ
         UqSQ==
X-Gm-Message-State: AOJu0YwWCrkB+F/yxAJ4p/s4TvCAd1wlpLI/ZVpcyd6UfTJveLarsEh2
	Na1MRTkpRE2TFHbgotTTAFij8KtBSAIW72Eqe+HqGHoLO2OF+dkfhOXDMRvJFQ8=
X-Google-Smtp-Source: AGHT+IH+uWsoRYmDsBBYx3dOoKjvJ+qU8qWXXa2h6h8/tYhdWjzEOWn63IAtjOrv4kV0hcmpb8meFw==
X-Received: by 2002:a17:906:84e:b0:a43:b269:d27f with SMTP id f14-20020a170906084e00b00a43b269d27fmr11852934ejd.64.1709840732633;
        Thu, 07 Mar 2024 11:45:32 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.159])
        by smtp.gmail.com with ESMTPSA id f12-20020a170906138c00b00a45c61a126esm1467749ejc.59.2024.03.07.11.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 11:45:31 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-tomli-w: added recipe which is also include ptest
Date: Thu,  7 Mar 2024 22:45:27 +0300
Message-Id: <20240307194527.645105-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Mar 2024 19:45:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109208

Tomli-W is the write-only counterpart of Tomli, providing dump and dumps functions.

* When we fetch the package via PyPI there are missing files such as tests directory. So, we set PYPI_SRC_URI and fetch it from the github url.

* Ptest and library example tested on qemux86-64 and qemuarm64

* Add ptest into PTESTS_FAST_META_PYTHON

Ptest result:
==============
qemux86-64:

Testsuite summary
TOTAL: 265
PASS: 263
SKIP: 0
XFAIL: 2
FAIL: 0
XPASS: 0
ERROR: 0
DURATION: 15
END: /usr/lib/python3-tomli-w/ptest
2024-03-07T17:33
STOP: ptest-runner
TOTAL: 1 FAIL: 0

qemuarm64:

Testsuite summary
TOTAL: 265
PASS: 263
SKIP: 0
XFAIL: 2
FAIL: 0
XPASS: 0
ERROR: 0
DURATION: 15
END: /usr/lib/python3-tomli-w/ptest
2024-03-07T17:25
STOP: ptest-runner
TOTAL: 1 FAIL: 0

XFAIL: tests/test_valid.py:test_valid[qa-array-inline-nested-1000] XFAIL reason: This much recursion is not supported

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 +
 .../python/python3-tomli-w/run-ptest          |  3 ++
 .../python/python3-tomli-w_1.0.0.bb           | 34 +++++++++++++++++++
 3 files changed, 38 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-tomli-w/run-ptest
 create mode 100644 meta-python/recipes-devtools/python/python3-tomli-w_1.0.0.bb

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 0cb3046cf..20ca2763c 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -61,6 +61,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-smpplib \
     python3-soupsieve \
     python3-sqlparse \
+    python3-tomli-w \
     python3-tomlkit \
     python3-trustme \
     python3-typeguard \
diff --git a/meta-python/recipes-devtools/python/python3-tomli-w/run-ptest b/meta-python/recipes-devtools/python/python3-tomli-w/run-ptest
new file mode 100644
index 000000000..8d2017d39
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-tomli-w/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-tomli-w_1.0.0.bb b/meta-python/recipes-devtools/python/python3-tomli-w_1.0.0.bb
new file mode 100644
index 000000000..8a8a48467
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-tomli-w_1.0.0.bb
@@ -0,0 +1,34 @@
+DESCRIPTION = "Tomli-W is a Python library for writing TOML. It is a write-only counterpart to Tomli, which is a read-only TOML parser."
+HOMEPAGE = "https://github.com/hukkin/tomli-w"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=aaaaf0879d17df0110d1aa8c8c9f46f5"
+
+SRCREV = "19099125f32e7c491603e393263754262b356956"
+PYPI_SRC_URI = "git://github.com/hukkin/tomli-w.git;protocol=https;branch=master"
+
+inherit pypi python_flit_core ptest
+
+S = "${WORKDIR}/git"
+
+SRC_URI += " \
+        file://run-ptest \
+"
+
+RDEPENDS:${PN}-ptest += " \
+        python3-pytest \
+        python3-tomli \
+        python3-unittest-automake-output \
+"
+
+do_install_ptest() {
+        install -d ${D}${PTEST_PATH}/tests
+        install -d ${D}${PTEST_PATH}/benchmark
+        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+        cp -rf ${S}/benchmark/* ${D}${PTEST_PATH}/benchmark/
+}
+
+RDEPENDS:${PN} += " \
+        python3-datetime \
+        python3-numbers \
+        python3-stringold \
+"
-- 
2.25.1


