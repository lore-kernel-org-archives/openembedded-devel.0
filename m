Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84587CCD195
	for <webhook@archiver.kernel.org>; Sun, 19 Oct 2025 15:59:36 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.26846.1760889570994366079
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Oct 2025 08:59:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KekZWDR3;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-63c45c11be7so2831295a12.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Oct 2025 08:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760889569; x=1761494369; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=n0QlYDd9SRjv3ckSOzZbEboVj+w3eGx68eMfvI4gzpw=;
        b=KekZWDR3wg3o7Ux3m9c85JKlKyNOJXchTX8o98v33Ja5nxeQq8isDKS0eT2j3ZK16V
         OEZbwLB4+7CGI57v41dw9iN+CrmlwOJ+7CPjQSgram/Gyg1DhaWatRvnOIXrT4ODp1uZ
         1HjLKscCTywcO0R34s6+OO2PteJXsWAbc8zbY7myk21etpoWTujGRyH2zkwjTJUotWIb
         f3tPrMhXDFSc7gFQCMWORMCzgC7oS+4hJE3Lnm8Hpn5WrDA+O+RJR/4r2wS+jdN+SJnF
         NXsMosyi7KBKBlW4LQBulVrMQSfBkC0ySEn9opDklmhMA2yseUEXlKutrCKefSStLE+8
         V9DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760889569; x=1761494369;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n0QlYDd9SRjv3ckSOzZbEboVj+w3eGx68eMfvI4gzpw=;
        b=FNhrFM+z21DElP8Cal4B5Oplk6AAuqLiGHXukl3hxrHsxAbfNBHlkHiHiNdboDSsk4
         ZS419RO3VsbOk0HE0s0QYoXvkjCl5ETL7gpZlqkhFw9n6mt5pjNA/ksgqe8VsoCCVHZw
         mlZE27WnREknouMrekn2tk/Ku+V6MplyMkr7tYF7j2s7MEWYtngNBZtFoThM67kWuOVi
         XfNTNQ1MSoWYR7bJ/iIcsCPKzNEGY5Llr52bOuQtZHKSlHRyubp31KOhWVl7fkOO7viM
         OR5Q9rgRyDXmBySnk44Z3Fp7n3bCtILY9C3voGTkFW6y9Toye3NDOtPj9U3PmtE3GA7u
         7i+A==
X-Gm-Message-State: AOJu0YyW+ODg4WAyV2QZxdz6VzZSLMV23cqBYmNU29u2lgPCl8OqbD5j
	pCrSbY2r20wrJ3B4q4gupqfDwyfUZzsUuCvVZ1TSnnsHr15Gl3T7WfTzYuCYOg==
X-Gm-Gg: ASbGncu7J4LQj2bFRpfK3G6vaHjydS67434yshtNI237u8uBrFdEY8zEPGVqpAt6EYq
	JfqTw/mx8DLPEcMJBYwrv7wJkwmgyb/skcgDsauPLlDBSW5Om4RX8+BVcTPYiSgomZImvpgwWdx
	feAasIDrvmWiutgXGo7UGlkqJjPIT+ziX+WEsZHY+zwSNw6X59QK5QwSlV9n2DbzuSzswj2tdV9
	XvCUX+FLJ8xU3bBWwokGpQOBCwWGeobUWflqgaxklWCKbggjnG8aec4sIU7Owj5ZT0DmTRZzOW5
	fm1rtsyqwgo+OlPD9xmjJ5UehZKvMzMpvpPBKiH4wJuWLfTt1Zy4W8932KxrfBZbkVFRXvBdsrs
	ZGwqJkEs+NKlTR/oPg3c/yAbvJ3IOTor4o5XkFBkuQZGvQVFaTZBnF/mfOBJLFRwBaD9NoEIBQy
	kgDmDdj6kB
X-Google-Smtp-Source: AGHT+IGlr9A3SXEINGNFeMhLdyipPt4QXYg8CFJdPrzvcxQkSlNuKRzUPxFCzfq5KE9l1kD2yerAiA==
X-Received: by 2002:a05:6402:35c7:b0:63b:ea47:bcbb with SMTP id 4fb4d7f45d1cf-63c1f64c996mr9439546a12.8.1760889568926;
        Sun, 19 Oct 2025 08:59:28 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63c7267319esm1673705a12.36.2025.10.19.08.59.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 08:59:27 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH] python3-betamax: fix ptests
Date: Sun, 19 Oct 2025 17:59:26 +0200
Message-ID: <20251019155926.1306257-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 19 Oct 2025 15:59:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120795

1. Some tests require internet access. Set a DNS for that, if it is not
available at the start of the test.

2. Added a backported patch that fixes some failing tests, due to a
variable header value contained in a response. (fix-failing-ptest.patch)

3. Added a backported patch that avoids calling pytest fixtures directly.
If not applied, tests calling them are marked as failing by pytest.
(fix-direct-calls-to-test-fixtures.patch)

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../fix-direct-calls-to-test-fixtures.patch   | 41 +++++++++++++++++
 .../python3-betamax/fix-failing-ptest.patch   | 44 +++++++++++++++++++
 .../python/python3-betamax/run-ptest          |  6 +++
 .../python/python3-betamax_0.8.1.bb           |  2 +
 4 files changed, 93 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-betamax/fix-direct-calls-to-test-fixtures.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-betamax/fix-failing-ptest.patch

diff --git a/meta-python/recipes-devtools/python/python3-betamax/fix-direct-calls-to-test-fixtures.patch b/meta-python/recipes-devtools/python/python3-betamax/fix-direct-calls-to-test-fixtures.patch
new file mode 100644
index 0000000000..284506867a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-betamax/fix-direct-calls-to-test-fixtures.patch
@@ -0,0 +1,41 @@
+From 165cc321f2b9839418269e9493b03eb2e43f7ddf Mon Sep 17 00:00:00 2001
+From: Jiri Kuncar <jiri.kuncar@gmail.com>
+Date: Mon, 9 Sep 2019 12:23:18 +0200
+Subject: [PATCH] tests: fix direct calls to PyTest fixtures
+
+https://docs.pytest.org/en/latest/deprecations.html#calling-fixtures-directly
+
+Upstream-Status: Backport [https://github.com/betamaxpy/betamax/commit/165cc321f2b9839418269e9493b03eb2e43f7ddf]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ tests/unit/test_fixtures.py | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/tests/unit/test_fixtures.py b/tests/unit/test_fixtures.py
+index 387d9ce..41f33eb 100644
+--- a/tests/unit/test_fixtures.py
++++ b/tests/unit/test_fixtures.py
+@@ -27,9 +27,9 @@ def test_adds_stop_as_a_finalizer(self):
+         # Mock a pytest request object
+         request = mock.MagicMock()
+         request.cls = request.module = None
+-        request.function.__name__ = 'test'
++        request.node.name = request.function.__name__ = 'test'
+ 
+-        pytest_fixture.betamax_recorder(request)
++        pytest_fixture._betamax_recorder(request)
+         assert request.addfinalizer.called is True
+         request.addfinalizer.assert_called_once_with(self.mocked_betamax.stop)
+ 
+@@ -37,9 +37,9 @@ def test_auto_starts_the_recorder(self):
+         # Mock a pytest request object
+         request = mock.MagicMock()
+         request.cls = request.module = None
+-        request.function.__name__ = 'test'
++        request.node.name = request.function.__name__ = 'test'
+ 
+-        pytest_fixture.betamax_recorder(request)
++        pytest_fixture._betamax_recorder(request)
+         self.mocked_betamax.start.assert_called_once_with()
+ 
+ 
diff --git a/meta-python/recipes-devtools/python/python3-betamax/fix-failing-ptest.patch b/meta-python/recipes-devtools/python/python3-betamax/fix-failing-ptest.patch
new file mode 100644
index 0000000000..5671033526
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-betamax/fix-failing-ptest.patch
@@ -0,0 +1,44 @@
+From 0f5d51b1c7e3b9eb5c083621a00811a872323046 Mon Sep 17 00:00:00 2001
+From: Jaremy Hatler <hatler.jaremy@gmail.com>
+Date: Fri, 22 Dec 2023 22:53:53 -0500
+Subject: [PATCH] fix: clear X-Amzn-Trace-Id in httbin.org responses (#2)
+
+The httbin.org service returns a X-Amzn-Trace-Id header in its
+responses, which is different for each request. This causes the
+tests to fail. This clears the header before comparing responses.
+
+Refs: #184, #190
+Signed-off-by: Jaremy Hatler <hatler.jaremy@gmail.com>
+
+Upstream-Status: Backport [https://github.com/jhatler/betamax/commit/0f5d51b1c7e3b9eb5c083621a00811a872323046]
+---
+ tests/integration/test_record_modes.py | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/tests/integration/test_record_modes.py b/tests/integration/test_record_modes.py
+index 58c8846..988b851 100644
+--- a/tests/integration/test_record_modes.py
++++ b/tests/integration/test_record_modes.py
+@@ -1,3 +1,5 @@
++import re
++
+ from betamax import Betamax, BetamaxError
+ 
+ from tests.integration.helper import IntegrationHelper
+@@ -39,8 +41,15 @@ def test_replays_response_from_cassette(self):
+             # this test to succeed.
+             # NOTE(hroncok): httpbin.org added X-Processed-Time header that
+             # can possibly differ (and often does)
++            r0_content = r0.content.decode(encoding='utf-8', errors='strict')
++            r1_content = r1.content.decode(encoding='utf-8', errors='strict')
++            r0_content = re.sub('"X-Amzn-Trace-Id": "[^"]+"', '"X-Amzn-Trace-Id": ""', r0_content)
++            r1_content = re.sub('"X-Amzn-Trace-Id": "[^"]+"', '"X-Amzn-Trace-Id": ""', r1_content)
++            # NOTE(jhatler): httpbin.org added "X-Amzn-Trace-Id" to their
++            # response, which is a unique ID that will differ between requests.
++            # We remove it from the response body before comparing.
+             assert r0_headers == r1_headers
+-            assert r0.content == r1.content
++            assert r0_content == r1_content
+ 
+ 
+ class TestRecordNone(IntegrationHelper):
diff --git a/meta-python/recipes-devtools/python/python3-betamax/run-ptest b/meta-python/recipes-devtools/python/python3-betamax/run-ptest
index b63c4de0d9..7553a6d4bc 100644
--- a/meta-python/recipes-devtools/python/python3-betamax/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-betamax/run-ptest
@@ -1,3 +1,9 @@
 #!/bin/sh
 
+if ! nslookup httpbin.org >/dev/null 2>&1 ; then
+    trap 'mv /etc/resolv.conf.bak /etc/resolv.conf' INT EXIT
+    mv /etc/resolv.conf /etc/resolv.conf.bak
+    echo "nameserver 8.8.8.8" > /etc/resolv.conf
+fi
+
 pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-betamax_0.8.1.bb b/meta-python/recipes-devtools/python/python3-betamax_0.8.1.bb
index 2caeb5afa2..2d5b00e595 100644
--- a/meta-python/recipes-devtools/python/python3-betamax_0.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-betamax_0.8.1.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=61c15f0c146c5fb1a8ce8ba2f310d73c"
 
 SRC_URI += " \
         file://run-ptest \
+        file://fix-failing-ptest.patch \
+        file://fix-direct-calls-to-test-fixtures.patch \
 "
 
 SRC_URI[md5sum] = "b8182d43a200fc126a3bf7555626f964"

