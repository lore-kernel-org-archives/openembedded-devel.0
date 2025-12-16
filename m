Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CFE3D637A1
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 17:58:49 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.241.1765907928843610797
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Dec 2025 09:58:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MBcGf6SQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47789cd2083so26400875e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 09:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765907927; x=1766512727; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=evreI6C5UO+OkfY3TRrEofCeT+22lk9DCp5x7yUCuSY=;
        b=MBcGf6SQXeqACi5hM9qHq1CfmiB2IJMU7WQ5t9d/bNQtoeLa8H8PpwrPqp7aQ8OyHL
         EwUu74u4NgI/culAiGzt91QcslKpPSA15OYY2Ev6zUiSuocReZXlePOuRw1LDmi799Xy
         fOGniXy3LVGM6v2FKiPCz+Ve6IbuzEGh42K68d2d8toUIkso8/gu+lbetRym3+3BPxbZ
         p5zJlC7ZBVxE3OZDBTgJcyRYHMI/1UD3RxeVAjUmsE3L83I88sG25TP/D+13+Qfmt0ox
         RIOqsafnTVVJaAwJrnwBbTOEdxYeZErsTIF/Pg3SzIkYkxdZ4sX3JiW55c2EO1bDMevm
         eeGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765907927; x=1766512727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=evreI6C5UO+OkfY3TRrEofCeT+22lk9DCp5x7yUCuSY=;
        b=DoPbA4oQZ31A5eYJyDmMAUYmuxSh9WD8ES1czOsARfZMGWI0xGixYqdk0/9UVWjCh2
         pNrOesNuuHwk3Zq0nTyXXccVhWPqGNb1WskcF3mOoHVJLYfeoH8kx9rEgdaawgzh0Pj+
         6O7Sr/2c+NrByEfA3NWUXNPVCXTWbWqBjngHAwr47VnWayicZE982vPc5KDf0oV4586T
         q+kV7reZfYI5MnBqOF9xZMpBsYGDrzHUYewcxILf7S1K7pZqjy6yHHt+u0aHBNSaWdHX
         anXTcZY9d1UHox8D362K3Nfv4YiuqGSDbRP00fV2YhKsqiZVEVAkZoxV/pKQIgUUR6to
         3oCg==
X-Gm-Message-State: AOJu0YxvVEkdGY7OSZAJ8hdJKjOp5ZYL9p1z2MIcE6hqi+yjBsFoSIHx
	aXb2a/Igr+1gmwIL+PRRPfuktvWqnArpQ7bxjc3Gxv+YgyfFFDNIhMiMvEYCrQ==
X-Gm-Gg: AY/fxX6wOWLkGsSajtTDXwpAI+go6TYRl8tfWSPMwLiDc4OVzZ+HmcMmYznntFkePsz
	7tuSIrabiY6GVdKxqwNkMzCnkoMhqgZEgFOSoAxMXzHGVLviV43Dtum8jFDcV1bflL1XA2SwUbE
	IMqQUvDuNuSlQogY8/xVEPwuz0plp4nRnrpDjH9q5sRc6HOamoXLUkvED01fG/9o9Aoq1ka3pL1
	bLqKz30zIPj38EmNZwbUGc/BcqAHx4vYfM0ZfoXPJYWWiFih3uRvuIqgfwUMUwAPXZx6Z7tCDtx
	KjTPBSnCexp0vBQHnyZxdA0pf4E/cDL/2bv+uRFeXGDnzTXA/JtbJ/2RSa6iYLWg83XMbpGlUda
	nY+SU9uDwI3C1KvfrqY5k6o2BlUzO9OsUG16NYX1+05hqXCfhHExUoxJwXYM1dxabpmTgyRQO2G
	zhhYTgsanY
X-Google-Smtp-Source: AGHT+IH3p/UVwGdUZI4FGl1aU9mv7ofDkP1DTvDx/Q4TkSwd3nUqnw+HaVsn+Y5+m5d4bpW4eOGCzQ==
X-Received: by 2002:a05:600c:620d:b0:477:582e:7a81 with SMTP id 5b1f17b1804b1-47a8f8a6c78mr163733945e9.4.1765907927128;
        Tue, 16 Dec 2025 09:58:47 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47bd992ad0csm13714525e9.9.2025.12.16.09.58.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 09:58:46 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 7/7] python3-pyro5: add recipe
Date: Tue, 16 Dec 2025 18:58:40 +0100
Message-ID: <20251216175840.2939403-7-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251216175840.2939403-1-skandigraun@gmail.com>
References: <20251216175840.2939403-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 17:58:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122706

Pyro enables you to build applications in which objects can talk to each
other over the network, with minimal programming effort.

Successor to the python3-pyro4 package - but this supports modern Python,
and still maintained (under the same umbrella that developed pyro4 also).

Ptest takes around a minute to execute. Sample output:

root@qemux86-64:~# ptest-runner
START: ptest-runner
2025-12-16T17:48
BEGIN: /usr/lib/python3-pyro5/ptest
PASS: tests/test_api.py:test_api
PASS: tests/test_client.py:TestProxy.testBasics
PASS: tests/test_client.py:TestProxy.testProxyCopy
[...many lines...]
PASS: tests/test_threadpool.py:TestThreadPool.testClose
PASS: tests/test_threadpool.py:TestThreadPool.testScaling
PASS: tests/test_threadpool.py:TestThreadPoolServer.testServerPoolFull
============================================================================
Testsuite summary
# TOTAL: 415
# PASS: 410
# SKIP: 5
# XFAIL: 0
# FAIL: 0
# XPASS: 0
# ERROR: 0
DURATION: 60
END: /usr/lib/python3-pyro5/ptest
2025-12-16T17:49
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 +
 .../python-pyro5/python3-pyro5_5.15.bb        | 27 +++++++++++++++++++
 .../packagegroups/packagegroup-meta-python.bb |  1 +
 3 files changed, 29 insertions(+)
 create mode 100644 meta-python/recipes-connectivity/python-pyro5/python3-pyro5_5.15.bb

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index e575b372b5..cef905a528 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -134,6 +134,7 @@ PTESTS_SLOW_META_PYTHON = "\
     python3-pillow \
     python3-pint \
     python3-pykickstart \
+    python3-pyro5 \
     python3-pytest-localserver \
     python3-scrypt \
     python3-traitlets \
diff --git a/meta-python/recipes-connectivity/python-pyro5/python3-pyro5_5.15.bb b/meta-python/recipes-connectivity/python-pyro5/python3-pyro5_5.15.bb
new file mode 100644
index 0000000000..eb6fab27cb
--- /dev/null
+++ b/meta-python/recipes-connectivity/python-pyro5/python3-pyro5_5.15.bb
@@ -0,0 +1,27 @@
+SUMMARY = "Python Remote Objects"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c1c9ccd5f4ca5d0f5057c0e690a0153d"
+
+SRC_URI[sha256sum] = "82c3dfc9860b49f897b28ff24fe6716c841672c600af8fe40d0e3a7fac9a3f5e"
+
+PYPI_PACKAGE = "Pyro5"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
+
+inherit pypi setuptools3 ptest-python-pytest
+
+RDEPENDS:${PN} += " \
+    python3-json \
+    python3-logging \
+    python3-serpent \
+    python3-threading \
+    "
+
+RDEPENDS:${PN}-ptest += " \
+    python3-html \
+    python3-misc \
+    python3-sqlite3 \
+    "
+
+do_install_ptest:append(){
+    cp -r ${S}/certs ${D}${PTEST_PATH}/
+}
diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 37c8e868d3..2ff88e6264 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -335,6 +335,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-pyperclip \
     python3-pyperf \
     python3-pyrad \
+    python3-pyro5 \
     python3-pyroute2 \
     python3-pyrsistent \
     python3-pyscaffold \

