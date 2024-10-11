Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53997D0D794
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 13:05:30 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.10971.1728651923662917911
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Oct 2024 06:05:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PZX4arw3;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5399041167cso3227763e87.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 06:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728651921; x=1729256721; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=424ZDrOK2DZ0wQOeBol7NVqMSW00/1KsBryZumaKhxc=;
        b=PZX4arw3Uh1LTWKMfIhvHSIdl4tV9MCHxFaxnFiEGcwrZp6o10qpZQsrBNJKVYm30J
         vaoYvf29D7AkrMEPzeuad2TgeBaFdT3TqUZ5oaMZHM5cYGC++atPzEBsWvJP7KHdM/q2
         q+kscOc+CtX0CUPpiHLq03hhsU+25gONZEsXpzFwX58dgSPnbjGat5w6qZ+UGt5+c2FO
         fXoenRjN3Z4ZqzUqGr1zZm3lS7ZEf9vBrVsncgS+I9ndNnSwWW+50O5AczPK60x5jb+y
         k7K1Wt8+T1JZ0EfsEa2HBipF94XknZI+jB+4YTMKLKsE4DOlAmBZeublN8Q+xeswLKBR
         hfGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728651921; x=1729256721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=424ZDrOK2DZ0wQOeBol7NVqMSW00/1KsBryZumaKhxc=;
        b=RKGg3nG6iVSmsyuw8nI6dQ8xtq+eM4ut1q+CJL1czyyH7d/T+xSf2DX0ddttydTRdc
         H/4ylnGS5r5gaRqOGlXZL5Pnnw1uiCBp9pjJE2uC2gNzWKsj+0q4Hf9hDf0TIY3ocZXM
         0BG8jsAn8zTcVEtf38DTVAbN6FkPzU7RtEx0KRYOTxsPnEabVX2GtmUh5w07qNixZpN2
         VmBY66n5wwX1jceTuibUZjCq/N3GDtpLrAw9xAJHcFaa+cH1X9HKNTx1ykx76dD5k3RQ
         wopo7JOHo6r+EHG96NkwxwT2RbAGnUsHLyd8N3/k+L89vNmuSq4Ty9QZK1useT9/VzN9
         Y+Pw==
X-Gm-Message-State: AOJu0YwP+DjIQEhC/NwdgrfNnjql/5aSfXbchBd6VFb6zjJulJh0nudx
	CobxPR+rcBCv8zwP6Ei3f2zxXkFQki6q+ApJpBfLOlV+i6AzMToxtpwCQNBw
X-Google-Smtp-Source: AGHT+IES63lkyqMud7wVquyHSBxvjbBPZWagPgclRaBHLdYw+i2lVGhz3ULofhszNJn8E/YkoFOAkg==
X-Received: by 2002:ac2:4c45:0:b0:536:a7a4:c3d4 with SMTP id 2adb3069b0e04-539da564d26mr2196050e87.39.1728651921058;
        Fri, 11 Oct 2024 06:05:21 -0700 (PDT)
Received: from localhost.localdomain ([176.33.66.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a7ec56eesm210466066b.31.2024.10.11.06.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 06:05:20 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH 5/5] python3-configobj: enable ptest
Date: Fri, 11 Oct 2024 16:04:41 +0300
Message-Id: <20241011130441.2919272-5-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241011130441.2919272-1-alperyasinak1@gmail.com>
References: <20241011130441.2919272-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 13:05:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112801

- Tested on qemux86-64 and qemuarm64

- Added ptest into PTESTS_FAST_META_PYTHON

- The PyPi package name defaults to PN without the python3- prefix, so there is no need to set PYPI_PACKAGE as configobj, it is by default.

Ptest result:
=============

qemux86-64:

Testsuite summary
TOTAL: 75
PASS: 75
SKIP: 0
XFAIL: 0
FAIL: 0
XPASS: 0
ERROR: 0
DURATION: 12
END: /usr/lib/python3-configobj/ptest
2024-10-11T12:59
STOP: ptest-runner
TOTAL: 1 FAIL: 0

qemuarm64:

Testsuite summary
TOTAL: 75
PASS: 75
SKIP: 0
XFAIL: 0
FAIL: 0
XPASS: 0
ERROR: 0
DURATION: 9
END: /usr/lib/python3-configobj/ptest
2024-10-11T12:56
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 +
 .../python/python3-configobj/run-ptest        |  3 +++
 .../python/python3-configobj_5.0.9.bb         | 21 +++++++++++++++----
 3 files changed, 21 insertions(+), 4 deletions(-)
 create mode 100755 meta-python/recipes-devtools/python/python3-configobj/run-ptest

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 196ff6a73..07ae46908 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -16,6 +16,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-blinker \
     python3-cachetools \
     python3-cbor2 \
+    python3-configobj \
     python3-click \
     python3-dasbus \
     python3-dominate \
diff --git a/meta-python/recipes-devtools/python/python3-configobj/run-ptest b/meta-python/recipes-devtools/python/python3-configobj/run-ptest
new file mode 100755
index 000000000..8d2017d39
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-configobj/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-configobj_5.0.9.bb b/meta-python/recipes-devtools/python/python3-configobj_5.0.9.bb
index 2f6572af5..d41d71a4e 100644
--- a/meta-python/recipes-devtools/python/python3-configobj_5.0.9.bb
+++ b/meta-python/recipes-devtools/python/python3-configobj_5.0.9.bb
@@ -3,12 +3,25 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e2df3cb285297a24cd1097dfe6e96f95"
 
-PYPI_PACKAGE = "configobj"
 SRC_URI[sha256sum] = "03c881bbf23aa07bccf1b837005975993c4ab4427ba57f959afdd9d1a2386848"
 
-inherit pypi python_setuptools_build_meta
+inherit pypi python_setuptools_build_meta ptest
+
+SRC_URI += " \
+	file://run-ptest \
+"
 
 RDEPENDS:${PN} += " \
-    python3-pprint \
-    python3-six \
+	python3-pprint \
+	python3-six \
 "
+
+RDEPENDS:${PN}-ptest += " \
+	python3-pytest \
+	python3-unittest-automake-output \
+"
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/tests
+	cp -rf ${S}/src/tests/* ${D}${PTEST_PATH}/tests/
+}
-- 
2.25.1


