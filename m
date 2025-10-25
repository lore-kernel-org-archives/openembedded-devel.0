Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2796ACCF9E9
	for <webhook@archiver.kernel.org>; Sat, 25 Oct 2025 20:37:08 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.13537.1761424623756923951
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Oct 2025 13:37:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dtMeOzJh;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47117f92e32so29332875e9.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Oct 2025 13:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761424622; x=1762029422; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2qXTFA/Ae9g5RfRYStiGqRcjqkQv01M7o6edNEbMxdE=;
        b=dtMeOzJh0wlFNKB2bqQxANA1+HYLAiq80Sn8iQPa1eWCGJ+2nOwksaleYuZ6TvrMGB
         cBvA3Q35udakXjBmAjc7tirxSQZeCwa7+f7NZEnm+cq+xqBz5XFTx0a733aKw0ci8lUn
         9ldbcOen92gr/r74+G/HSr53gAJXW8Gl05AHNc5HAXvcKCVyWNyVE0nbf9de4z2Cj0Rj
         NfDQacLR2gooMw5UkntH3mAUr/Is+0dLrkWO31Oucp55+j1nU+rVnlMfJnykQtc2Udxf
         IUZxpnQ3bnvfCrGGloZXBwUDS1yldYGFvRhtcQMAxboekA1z0X9SsNMhfCsB+zJDYsBp
         NQGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761424622; x=1762029422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2qXTFA/Ae9g5RfRYStiGqRcjqkQv01M7o6edNEbMxdE=;
        b=McqsVsfbjvDqmrDSh1tyfjAdU2Bbc9sjPjeQI3ygqqa/wygOcF6MfQKaRMq7Rk0uSa
         HuhWm5U2Ca3E1/Kat2zndmlAegjBzpAjhPURj77KKHRmjqP/TulueKJfhZ6dvSZ9UIXP
         0xNh+jO62ReBKgxdpEFtsEK+F54fsYNUAQa/PVZc4AiyOO4yR64Nvp5PMqUWy1944UzF
         19EQXvdf3sDm+AiTuzsq3gQ6LXDS2GZlP+zWIKOOXdNNQrj8BkSB/UP9zsOAjGTMAphc
         k4SlSxIyXLAf5iEolcrzhA3yl6EwbTMcLK4YR1KnDuW3eyJ0fLpHelLHCWcFBh/XNCt3
         0ySA==
X-Gm-Message-State: AOJu0Ywj10ecLEeGuR/ammnRZFgW1iBLS/DKOMWK0ctQnrINmC+Nmn1F
	UYwSlOUAEIuT2v4dijRLoqHv+qH8KEyzcT8TEL2p97ebiNmAStNZ3ZmQ+RVobQ==
X-Gm-Gg: ASbGncuLsd3Ey8ZZqhiuqdcAWwmB2KKKsAFaK0v0JkMoCgdK2krmYvvZ/7mUnAMh9oC
	b1N32VLKcQzEUiM+By+hGHbMilA6offiDm5LFRJy8atApmrEUNTitdp44nKJtb/exFRsOlQcxAD
	bhWNxCCB4ukzBrgmICJPLxZrpYyvudCcRChbluKpJh8pFCrP4D7h8XdSap40J3YD0x1ZtQaK1+5
	vlR+AslzgvXRVifSyEmnt/MmTRkfk6xoLC1u/t+iYQOFGngCUulJviP7YzqEHSaTKXAFuuecv52
	67FNXSsHfO2WYSmax2h+HmUsp9IOdJwe1GKwsycnQMs/HYV7UMYYklSDaCrgNIiDU2HDkbWBeLL
	NaDz9OMldxomWOaQC+JWWWRWTXtPd+NOoOK05jR+cx7dEferKBQWGpgLzCQ3FjGKNcHdZYlFrSQ
	==
X-Google-Smtp-Source: AGHT+IHbB1rSC6pUl9kckKBvlT7RUobDXm4LYD+BVcCh+wcyE0Xo+N8hWHOMK7eMuuX9E7EYJ4UAUA==
X-Received: by 2002:a05:600c:444d:b0:45c:4470:271c with SMTP id 5b1f17b1804b1-471178afac3mr226701345e9.18.1761424621974;
        Sat, 25 Oct 2025 13:37:01 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd374e4esm47049055e9.11.2025.10.25.13.37.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 13:37:01 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 2/3] python3-pyasyncore: fix ptests
Date: Sat, 25 Oct 2025 22:36:59 +0200
Message-ID: <20251025203700.1751175-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251025203700.1751175-1-skandigraun@gmail.com>
References: <20251025203700.1751175-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Oct 2025 20:37:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121009

The tests are using only Python's unittest module, not pytest -
so adapt the run-ptest script to invoke unittest instead pytest.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../conf/include/ptest-packagelists-meta-python.inc      | 2 +-
 .../recipes-devtools/python/python3-pyasyncore/run-ptest | 9 +++++++++
 .../recipes-devtools/python/python3-pyasyncore_1.0.4.bb  | 7 ++++++-
 3 files changed, 16 insertions(+), 2 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-pyasyncore/run-ptest

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 0f56c3e300..f0411f269f 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -69,6 +69,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-ptyprocess \
     python3-py-cpuinfo \
     python3-pyasn1-modules \
+    python3-pyasyncore \
     python3-pyroute2 \
     python3-pyserial \
     python3-pytest-mock \
@@ -128,5 +129,4 @@ PTESTS_SLOW_META_PYTHON = "\
 "
 
 PTESTS_PROBLEMS_META_PYTHON = "\
-    python3-pyasyncore \
 "
diff --git a/meta-python/recipes-devtools/python/python3-pyasyncore/run-ptest b/meta-python/recipes-devtools/python/python3-pyasyncore/run-ptest
new file mode 100644
index 0000000000..52f069c3b9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyasyncore/run-ptest
@@ -0,0 +1,9 @@
+#!/bin/sh
+
+cd $(dirname $0)/tests
+
+# Failing cases are not transformed, only passing and skipped ones.
+# Unitttest will output a summary at the end for each failing testcase, 
+# starting each line with "FAIL: " followed by the testcase name.
+
+python3 -m unittest -v 2>&1 | sed -e 's/\(test_[^ ]*\).*ok$/PASS: \1/' -e 's/\(test_[^ ]*\).*skipped.*/SKIP: \1/'
diff --git a/meta-python/recipes-devtools/python/python3-pyasyncore_1.0.4.bb b/meta-python/recipes-devtools/python/python3-pyasyncore_1.0.4.bb
index 47906cea0b..ecd24c95cf 100644
--- a/meta-python/recipes-devtools/python/python3-pyasyncore_1.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pyasyncore_1.0.4.bb
@@ -3,11 +3,16 @@ HOMEPAGE = "https://github.com/simonrob/pyasyncore"
 LICENSE = "Python-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d5605fc335ce1bab614032468d0a1e00"
 
-inherit pypi setuptools3 ptest-python-pytest
+inherit pypi setuptools3 ptest
+SRC_URI += "file://run-ptest"
 
 SRC_URI[sha256sum] = "2c7a8b9b750ba6260f1e5a061456d61320a80579c6a43d42183417da89c7d5d6"
 
 RDEPENDS:${PN} += "python3-core python3-io"
 RDEPENDS:${PN}-ptest += "python3-tests"
 
+do_install_ptest:append(){
+    cp -r ${S}/tests ${D}${PTEST_PATH}
+}
+
 BBCLASSEXTEND = "native nativesdk"

