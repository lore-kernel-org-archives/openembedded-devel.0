Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ECB8C54E41
	for <webhook@archiver.kernel.org>; Fri,  8 Mar 2024 20:18:15 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.3390.1709929091730212281
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Mar 2024 12:18:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dQjAp/3Z;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40fd72f7125so19725185e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 08 Mar 2024 12:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709929089; x=1710533889; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DybhEkKzhk4+/TY7TnHN/dQ9tg4qjIPWhIT5cHglbiw=;
        b=dQjAp/3ZJ17mCU1pwQ75gMls1YLUpvtDCi0CrgZ+yqUtq8tGb33dSHrZkBzhp2Ihnr
         /VW5Wr/j0DYrxOY31N9CEfljTeVeHpTPbz6X8z6XlFahR6GNe9b4Tdc8SEkYx5U2XtR9
         xUd/ey0ecHDs/zNed8Ov90wifFXIPLC4IGC5t2QeWukiX8oRxgOBFBZcdupfhiIcZhkx
         BOopIuIL+X6muTm/qkyesCcZpf2oopKh4OdcVt8bRJOvYvb06SChhNrJjMxUyNfq5x2p
         OS0XDJLuqL99kPPV9kRenQaBBv+LRjGK+Wfj2F8KVaSzZQlp1qv9OOAMKB7vnfNr0XyU
         7F/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709929089; x=1710533889;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DybhEkKzhk4+/TY7TnHN/dQ9tg4qjIPWhIT5cHglbiw=;
        b=PQzXgmkNJeolVEnSXNBWEg+gHs8+BkHM9RbqfWRTGdRRI9RFvBHT07roSPmNn0oPJL
         Xx5bQEzzmsQm5Wy/6EJvIc5aCESTbEZnHOk4xNYY7CBhcfGAqMutwXf/3kjYa0ZZblgJ
         Tb85g7GdljcAo4WApoBHD7ioEVETb/MVr/S+F6YnV4fpRVGWkmjAu0ipccAtEAGLT2Ec
         bEzWDrvD/TuPaT7fBuzvHHrHIA2QNaq+Usdkdh0JzZSaZtPkg3ooJRmPlGU26n07KJhV
         L+D5iz4f1p85yhfOE6gkBCMC2F3M1dwF3zNJBCNmapyidL9Nx4DghxzlxPtQzEBE6NBW
         Tgwg==
X-Gm-Message-State: AOJu0Yxct71dWW8Ex5a5BUVQyivuDJIqXNHdqdI84Swn9X40tLFeFd9G
	rCsOAUaiVUsp/bR0nLcesgto81PtMPikR9g5FvOqDBh1YS4SH+CKKhK9+pfrPf4=
X-Google-Smtp-Source: AGHT+IFEGd6NUAMB7jNrkWzn9r3OJeUUGi5VkTqgSDI5JhvcL2+X1sBU0BhlF1uS+HAK2YC9ZA68pg==
X-Received: by 2002:a05:600c:1990:b0:413:1769:7f4c with SMTP id t16-20020a05600c199000b0041317697f4cmr237771wmq.18.1709929089361;
        Fri, 08 Mar 2024 12:18:09 -0800 (PST)
Received: from localhost.localdomain ([176.33.71.255])
        by smtp.gmail.com with ESMTPSA id m28-20020a05600c3b1c00b004129ed6f9cbsm401937wms.4.2024.03.08.12.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Mar 2024 12:18:08 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-httptools: added recipe which is also include ptest
Date: Fri,  8 Mar 2024 23:18:04 +0300
Message-Id: <20240308201804.3252753-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Mar 2024 20:18:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109241

httptools is a Python binding for the nodejs HTTP parser.

* Tested on qemux86-64 and qemuarm64

* Add ptest into PTESTS_FAST_META_PYTHON

Ptest result:
=============
qemux86-64:

Testsuite summary
TOTAL: 38
PASS: 38
SKIP: 0
XFAIL: 0
FAIL: 0
XPASS: 0
ERROR: 0
DURATION: 10
END: /usr/lib/python3-httptools/ptest
2024-03-08T20:05
STOP: ptest-runner
TOTAL: 1 FAIL: 0

qemuarm64:

Testsuite summary
TOTAL: 38
PASS: 38
SKIP: 0
XFAIL: 0
FAIL: 0
XPASS: 0
ERROR: 0
DURATION: 7
END: /usr/lib/python3-httptools/ptest
2024-03-08T20:08
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 +
 .../python/python3-httptools/run-ptest        |  3 +++
 .../python/python3-httptools_0.6.1.bb         | 22 +++++++++++++++++++
 3 files changed, 26 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-httptools/run-ptest
 create mode 100644 meta-python/recipes-devtools/python/python3-httptools_0.6.1.bb

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 5ace8a9a2..447e0b938 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -24,6 +24,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-gpiod \
     python3-gunicorn \
     python3-html2text \
+    python3-httptools \
     python3-inflection \
     python3-inotify \
     python3-intervals \
diff --git a/meta-python/recipes-devtools/python/python3-httptools/run-ptest b/meta-python/recipes-devtools/python/python3-httptools/run-ptest
new file mode 100644
index 000000000..8d2017d39
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-httptools/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-httptools_0.6.1.bb b/meta-python/recipes-devtools/python/python3-httptools_0.6.1.bb
new file mode 100644
index 000000000..4192697df
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-httptools_0.6.1.bb
@@ -0,0 +1,22 @@
+SUMMARY = "A collection of framework independent HTTP protocol utils."
+HOMEPAGE = "https://github.com/MagicStack/httptools"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0a2d82955bf3facdf04cb882655e840e"
+
+inherit pypi setuptools3 ptest
+
+SRC_URI[sha256sum] = "c6e26c30455600b95d94b1b836085138e82f177351454ee841c148f93a9bad5a"
+
+SRC_URI += " \
+        file://run-ptest \
+"
+
+RDEPENDS:${PN}-ptest += " \
+        python3-pytest \
+        python3-unittest-automake-output \
+"
+
+do_install_ptest() {
+        install -d ${D}${PTEST_PATH}/tests
+        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
-- 
2.25.1


