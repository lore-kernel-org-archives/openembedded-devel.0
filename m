Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01E64C54E41
	for <webhook@archiver.kernel.org>; Fri,  8 Mar 2024 19:22:05 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.2030.1709925719103944824
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Mar 2024 11:21:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gP511XPn;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-33e122c8598so1344304f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 08 Mar 2024 11:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709925717; x=1710530517; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nh9dCWs76zcYpDsekbCJuUHL2IEALUskJTYjyUNY2hI=;
        b=gP511XPnyDmGEYiZU6bRG+XRX+0vnFqCxk2a//USAlLo27hbvQo2Qh1Fr9+hLbb+uo
         D3L1h3cAxxahvHi6+5yRtBe56sIZR6TdgXhYf+crKbPjgslhOE2UYQzNAqcCjYhUBSE/
         YjzhAT458JN7wgMxYFGvTLd1H8ugV5SF6+ZYOZqYUayDw466OIAIxV3EmtGrsfI8UUX5
         1bkZXfappmObPb0Y0EXcLGgjn+ETCwmMKjoENY/M/2nEnB4+hKxp3k2WXUS9wKvGPcMb
         jXApJ5tM8MDNIkB7UIGt4kGFlQRZOvpydWEZaB7hUo0VlG74EQ6BlOJ6vQNPEaKbIaYw
         p2mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709925717; x=1710530517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nh9dCWs76zcYpDsekbCJuUHL2IEALUskJTYjyUNY2hI=;
        b=X4PaOJnBv1/PkJAmYx2N/y//G52usFxOl8nIgigLHzsSneF2g7ttD6UFtMd9xo400m
         6L2folScqmlWr7VphuYaB4jmX+x4hP5JvWFpm5Y1o46Lq6b66X/L+HsWUMO9VfrDqhzT
         YPdhLZsETghH6mUMn3ZlOomqqfa7bg4cS42p5ldu2eK3u1tvXp/EfWwYGjWNT1D2U0Vi
         GI5MQ5V5CfJWirCqZT2wB77X/eDs/nFyEHinBw3kdSxpCBvjeIPaDKM1pUp3FuuAfCni
         79nwQ+V9QV4hWfZE7SgU4Cvj9r3NwHsNOKfNY9XlKqlVe7uoGEk3OS2w232p+5R9Cxyt
         8jrQ==
X-Gm-Message-State: AOJu0YxjUj+bpBvvbCWWmoc+2+8JLSMeH1YsdeqhffRIOqNE0zmG3wZw
	R0wqD32GaxGPDBgm3iGTFgFkAJWRzfKzExYxBU1GHhvfbpQI6dEUThZilLQWiR4=
X-Google-Smtp-Source: AGHT+IGdGaXAtpay0dD0FEL6NwhjSQrIgp7CmxYCavruuCeEG0Rec/E76bYAWkaOJYoauJg4H80uIA==
X-Received: by 2002:adf:e389:0:b0:33e:12a2:297f with SMTP id e9-20020adfe389000000b0033e12a2297fmr90843wrm.41.1709925716727;
        Fri, 08 Mar 2024 11:21:56 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.159])
        by smtp.gmail.com with ESMTPSA id bv10-20020a0560001f0a00b0033e033898c5sm155914wrb.20.2024.03.08.11.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Mar 2024 11:21:56 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-a2wsgi: added recipe which is also include ptest
Date: Fri,  8 Mar 2024 22:21:03 +0300
Message-Id: <20240308192103.3106109-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Mar 2024 19:22:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109239

Pure Python and only depend on the standard library.

Compared with other converters, the advantage is that a2wsgi will not accumulate the requested content or response content in the memory, so you don't have to worry about the memory limit caused by a2wsgi. This problem exists in converters implemented by uvicorn/startlette or hypercorn.

* Ptest and library example tested on qemux86-64 and qemuarm64

* Add ptest into PTESTS_FAST_META_PYTHON

Ptest result:
==============
qemux86-64:

Testsuite summary
TOTAL: 15
PASS: 15
SKIP: 0
XFAIL: 0
FAIL: 0
XPASS: 0
ERROR: 0
DURATION: 22
END: /usr/lib/python3-a2wsgi/ptest
2024-03-08T18:58
STOP: ptest-runner
TOTAL: 1 FAIL: 0

qemuarm64:

Testsuite summary
TOTAL: 15
PASS: 15
SKIP: 0
XFAIL: 0
FAIL: 0
XPASS: 0
ERROR: 0
DURATION: 22
END: /usr/lib/python3-a2wsgi/ptest
2024-03-08T19:05
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 +
 .../python/python3-a2wsgi/run-ptest           |  3 ++
 .../python/python3-a2wsgi_1.10.2.bb           | 33 +++++++++++++++++++
 3 files changed, 37 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-a2wsgi/run-ptest
 create mode 100644 meta-python/recipes-devtools/python/python3-a2wsgi_1.10.2.bb

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 63457189e..acfe28039 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -7,6 +7,7 @@
 #
 # ptests which take less than ~30s each
 PTESTS_FAST_META_PYTHON = "\
+    python3-a2wsgi \
     python3-appdirs \
     python3-ansicolors \
     python3-asgiref \
diff --git a/meta-python/recipes-devtools/python/python3-a2wsgi/run-ptest b/meta-python/recipes-devtools/python/python3-a2wsgi/run-ptest
new file mode 100644
index 000000000..8d2017d39
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-a2wsgi/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-a2wsgi_1.10.2.bb b/meta-python/recipes-devtools/python/python3-a2wsgi_1.10.2.bb
new file mode 100644
index 000000000..4d24c4517
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-a2wsgi_1.10.2.bb
@@ -0,0 +1,33 @@
+SUMMARY = "Convert WSGI app to ASGI app or ASGI app to WSGI app."
+HOMEPAGE = "https://github.com/abersheeran/a2wsgi"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e10d05d29ec6d8be8bfc503683f1bc9a"
+
+inherit pypi python_setuptools_build_meta ptest
+
+SRC_URI[sha256sum] = "46b2ca427cf9ad538c145e32eb36857e1cbf477b72fe1ed0e3d35e98c06061b9"
+
+DEPENDS += " \
+        python3-pdm-native \
+        python3-pdm-backend-native \
+"
+
+SRC_URI += " \
+        file://run-ptest \
+"
+
+RDEPENDS:${PN}-ptest += " \
+        python3-httpx \
+        python3-pytest \
+        python3-pytest-asyncio \
+        python3-unittest-automake-output \
+"
+
+do_install_ptest() {
+        install -d ${D}${PTEST_PATH}/tests
+        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
+
+RDEPENDS:${PN} += " \
+        python3-asyncio \
+"
-- 
2.25.1


