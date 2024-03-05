Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B5C9C54798
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 15:52:25 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.26526.1709653940012448168
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Mar 2024 07:52:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b9fe7Onw;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a458b6d9cfeso203898866b.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Mar 2024 07:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709653938; x=1710258738; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VNT7STM6NFQR8EvXhvyev3TSBJLft8NNN9FE6nLvm0I=;
        b=b9fe7OnwClGlBfYmYiEJxgL9vjPc93lLYboRWY/PYS6b+w4Z3Ke//8YiHQHleELK2K
         mPtbOSHYScJNjLZLvW1mP20/54ZEdywUyTtEq3dTf/mSc85S09SOPsPPhNexkKs2I7hY
         Um9otZkEPvRzYgqJid8AEUDdrDakFE5z7vWstdOwuWS55Q0/e/dpcrnxQ45qRJiaX4Qg
         5AF/ZNO+Ib8XcSHlunasOzp5HsVh7EPTMJJoZdZIKR36vLaDS+EebyCXmC69wIypcsdj
         IP74haqbGqeb2YVISmiEpATHdItwg5KLXEbab0ld3Ko7PDFxrf/JQ7Kv8xx0+sPLzMPV
         TtbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709653938; x=1710258738;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VNT7STM6NFQR8EvXhvyev3TSBJLft8NNN9FE6nLvm0I=;
        b=c4GuK1RXtRzjoYjzKsK8ebSA37cULbovoA2GNLBWpatpJcs+MZ9aUmKzBi/OeAW6Eu
         +GaTGR6lMRBXAaCZqZbkvAFJgWcEhRJRpZOipYcZlk5xuUdRS/lwK+8SkWKJJalXEF3x
         NzmTkOmm2nWUpBcT/eDKQ+BkvSkrrCAFxC0X91jqq9ZhX8/5ebB6hpsJZhuXSzFkuka3
         5RJEZSEt3KYtvggSJEaxCqxNknLoJjZZvQQeKQ2lksWqUfvc06UFMECAWpX+bfcnijkG
         rOcn70o5EvbQ8ebZb6DhBCmBs5nflTrq5Es7LvT0Oif0e9mIX7Oi9N1nZIol3f494F8s
         npow==
X-Gm-Message-State: AOJu0Yzl4GEdAWSWtwfydQIm7P4W0mtV6iGKMCgNcLFlmjwUj9x0rNz4
	U8VFsZffmEWP59W6l3UE2vgh/KeNVXN8vz404r6K5UVt6sfbt+r7mvGPkQgINQo=
X-Google-Smtp-Source: AGHT+IGDPK0HgMuw0m/WWyrfDlNJqa8Bc6DrvJS1Rjnyb9QJb8ePjqw7HZu98riWQAIFIpJC5hGLqQ==
X-Received: by 2002:a17:906:f148:b0:a43:ef41:e9e2 with SMTP id gw8-20020a170906f14800b00a43ef41e9e2mr8563367ejb.52.1709653937591;
        Tue, 05 Mar 2024 07:52:17 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.159])
        by smtp.gmail.com with ESMTPSA id s2-20020a1709060d6200b00a45a73e0be9sm860819ejh.180.2024.03.05.07.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 07:52:17 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH 2/2] python3-arrow: add ptest, update backend and runtime dependencies
Date: Tue,  5 Mar 2024 18:52:11 +0300
Message-Id: <20240305155211.593816-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Mar 2024 15:52:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109123

* Upstream provides a pyproject.toml which declares a flit_core.buildapi build backend instead of setuptools.

* Updated runtime dependencies.

* Ptest and library example tested on qemux86-64 and qemuarm64

* Add ptest into PTESTS_SLOW_META_PYTHON

Ptest result:
=============
qemux86-64:

Testsuite summary
TOTAL: 1839
PASS: 1836
SKIP: 1
XFAIL: 1
FAIL: 0
XPASS: 1
ERROR: 0
DURATION: 146
END: /usr/lib/python3-arrow/ptest
2024-03-05T12:57
STOP: ptest-runner
TOTAL: 1 FAIL: 0

qemuarm64:

Testsuite summary
TOTAL: 1839
PASS: 1836
SKIP: 1
XFAIL: 1
FAIL: 0
XPASS: 1
ERROR: 0
DURATION: 130
END: /usr/lib/python3-arrow/ptest
2024-03-05T12:51
STOP: ptest-runner
TOTAL: 1 FAIL: 0

XFAIL AND XPASS known issue with humanize month limits

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 +
 .../python/python3-arrow/run-ptest            |  3 ++
 .../python/python3-arrow_1.3.0.bb             | 30 ++++++++++++++++---
 3 files changed, 30 insertions(+), 4 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-arrow/run-ptest

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 65a45c4b6..99cae21b2 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -75,6 +75,7 @@ PTESTS_FAST_META_PYTHON = "\
 "
 
 PTESTS_SLOW_META_PYTHON = "\
+    python3-arrow \
     python3-lz4 \
     python3-yappi \
 "
diff --git a/meta-python/recipes-devtools/python/python3-arrow/run-ptest b/meta-python/recipes-devtools/python/python3-arrow/run-ptest
new file mode 100644
index 000000000..8d2017d39
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-arrow/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-arrow_1.3.0.bb b/meta-python/recipes-devtools/python/python3-arrow_1.3.0.bb
index 90ba5de96..c1b7c1a43 100644
--- a/meta-python/recipes-devtools/python/python3-arrow_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-arrow_1.3.0.bb
@@ -1,13 +1,35 @@
 SUMMARY = "Better dates and times for Python"
-HOMEPAGE = "https://github.com/crsmithdev/arrow"
+HOMEPAGE = "https://github.com/arrow-py/arrow"
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=14a2e29a9d542fb9052d75344d67619d"
 
 SRC_URI[sha256sum] = "d4540617648cb5f895730f1ad8c82a65f2dad0166f57b75f3ca54759c4d67a85"
 
-inherit setuptools3 pypi
+inherit pypi python_flit_core ptest
+
+SRC_URI += " \
+    file://run-ptest \
+"
+
+RDEPENDS:${PN}-ptest += " \
+    python3-dateutil-zoneinfo \
+    python3-pytest \
+    python3-pytest-mock \
+    python3-pytz \
+    python3-simplejson \
+    python3-unittest-automake-output \
+"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
 
 RDEPENDS:${PN} += " \
-        python3-dateutil \
-        "
+    python3-compression \
+    python3-dateutil \
+    python3-dateutil-zoneinfo \
+    python3-json \
+    python3-types-python-dateutil \
+"
-- 
2.25.1


