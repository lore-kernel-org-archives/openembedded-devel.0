Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 207B3CD128A
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 10:57:16 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.14960.1712833030987368949
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Apr 2024 03:57:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dRZIaFk6;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-343eb6cc46bso4129688f8f.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Apr 2024 03:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712833029; x=1713437829; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=41KGZy9wgQz+wSkR0FK/R6iv5mXYW5Dy7qp3S0fTPVk=;
        b=dRZIaFk6Jk6HIZUH9OtmiiVfAn2wy3+pvTPsANrk6npL2xEG9P7P1VaBPvb9HF9i1F
         M+vYBeS5C9TMCh8IBQatyRFGNwy+pjG7BZSA7KbQ7DUUylFgv0OiT1z9OUkY/TEOxBuy
         6eCyS/RBjslamO46RYm/e7jc76sc+L0ETKBXW1aYUwU9BWcZbRJnRnEwGlaW5Y41cUxe
         88tDhTNgKQobHX97epwZ+PtBxoj28FCRtHRDwVkWgJRSsrNuDg7azEqco7Ii0up+6YUN
         4/XKYaxxChPXN8GYZnGOmn58Ocx5o/sWp0ozWgZnxdkXDu49n7ufKVw5e+T7jhFnMxUK
         5FSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712833029; x=1713437829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=41KGZy9wgQz+wSkR0FK/R6iv5mXYW5Dy7qp3S0fTPVk=;
        b=KTU0lBzoxnG6YxtyzP7mub8/6LdvEBseWj2Np8E5rDzoBrTUG9Q0SKNFZ7g+CAaAaq
         0SkBhlA08+IzMC+OSHeC4VqAE8sDH+SlgfH/PgN8pOKaNnNoppuWU6Yi0LIl2CEC6fZA
         KiH6KEDoRhn6zCThT65g4LT7wnh6ZN8XxfBCHHRdFkXHZP17Oabzsa66FgTciNV/ydmN
         b9DUpoBmnAEvNeEFJZy+0f04JBqoMKzi/prstbyLj9VjAKsI2fAi8ex+hTSNfRCfAaO7
         RTw04hpxbFyEYde4RNBmtCcQD1k1z5iUxk5goGW17Wty9qS2U93sr+9SWYCVml06iI90
         eAyA==
X-Gm-Message-State: AOJu0Yyl+Q+quroLKbbBbrlBGPrGJHL5YYzwuWTxxdwt//LNCQ28N+p1
	Jr7INQb7pMnd6DzKASsxmgOcBbvjLQGrP0gpfGoplhd8dLSPDEOLuE2gVA==
X-Google-Smtp-Source: AGHT+IF0aEbPn8egU1eI5fSXRLabzdyKA0o+2do0nCPlGKODiKubsyYC0Y5L2sraxN+LdZI3ajnwqw==
X-Received: by 2002:a5d:51cd:0:b0:346:92d2:a496 with SMTP id n13-20020a5d51cd000000b0034692d2a496mr2005250wrv.29.1712833028756;
        Thu, 11 Apr 2024 03:57:08 -0700 (PDT)
Received: from localhost.localdomain ([176.33.68.217])
        by smtp.gmail.com with ESMTPSA id t7-20020adfe447000000b00343eac2acc4sm1487302wrm.111.2024.04.11.03.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 03:57:08 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-flexcache: enable ptest
Date: Thu, 11 Apr 2024 13:57:01 +0300
Message-Id: <20240411105701.95691-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Apr 2024 10:57:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109918

* Ptest tested on qemux86-64 and qemuarm64

* Add ptest into PTESTS_FAST_META_PYTHON

Ptest result:
=============

qemux86-64:

Testsuite summary
TOTAL: 19
PASS: 19
SKIP: 0
XFAIL: 0
FAIL: 0
XPASS: 0
ERROR: 0
DURATION: 9
END: /usr/lib/python3-flexcache/ptest
2024-04-11T10:48
STOP: ptest-runner
TOTAL: 1 FAIL: 0

qemuarm64:

Testsuite summary
TOTAL: 19
PASS: 19
SKIP: 0
XFAIL: 0
FAIL: 0
XPASS: 0
ERROR: 0
DURATION: 9
END: /usr/lib/python3-flexcache/ptest
2024-04-11T10:51
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../include/ptest-packagelists-meta-python.inc  |  1 +
 .../python/python3-flexcache/run-ptest          |  3 +++
 .../python/python3-flexcache_0.3.bb             | 17 ++++++++++++++++-
 3 files changed, 20 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-flexcache/run-ptest

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 19566e466..acb09aaca 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -19,6 +19,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-click \
     python3-dominate \
     python3-execnet \
+    python3-flexcache \
     python3-freezegun \
     python3-geojson \
     python3-google-auth-oauthlib \
diff --git a/meta-python/recipes-devtools/python/python3-flexcache/run-ptest b/meta-python/recipes-devtools/python/python3-flexcache/run-ptest
new file mode 100644
index 000000000..8d2017d39
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-flexcache/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-flexcache_0.3.bb b/meta-python/recipes-devtools/python/python3-flexcache_0.3.bb
index 509a6a42e..165783c9f 100644
--- a/meta-python/recipes-devtools/python/python3-flexcache_0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-flexcache_0.3.bb
@@ -5,6 +5,21 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=32f547dac365c355d2cdbcd7ebea9144"
 DEPENDS += "python3-setuptools-scm-native"
 SRC_URI[sha256sum] = "18743bd5a0621bfe2cf8d519e4c3bfdf57a269c15d1ced3fb4b64e0ff4600656"
 
-inherit pypi python_setuptools_build_meta
+inherit pypi python_setuptools_build_meta ptest
 PYPI_PACKAGE = "flexcache"
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
+        install -d ${D}${PTEST_PATH}/testsuite
+        cp -rf ${S}/flexcache/testsuite/* ${D}${PTEST_PATH}/testsuite/
+}
+
 RDEPENDS:${PN} = "python3-typing-extensions"
-- 
2.25.1


