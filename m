Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 531E7C54E55
	for <webhook@archiver.kernel.org>; Thu, 29 Feb 2024 20:46:40 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.6266.1709239597633550389
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Feb 2024 12:46:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M6aphR3d;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-5bdbe2de25fso1073621a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Feb 2024 12:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709239597; x=1709844397; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uksAq88uVp5okgx/Exa2hxJN/E03YPHCXn8sV24HEBM=;
        b=M6aphR3dEUac1epSJTP/EH+e/fEPOT6EzDnK7rVo9LvKlg+m/czGP3lICMjjV/uFCS
         uzBKefSpx3Lx/2TSXhTlGPEoFR9lmOkhEuf5bE7xVY1ScfcHYDYUy2NMUNrIzMZdzBAV
         DHkwLlhYbPjOnaWA+Np8jlv7gfhk7T3pMj/evOCklYDDPHsYEYybFkSY9YgessUwGC0v
         dvE7NYVP6CcRgXvJg89YVa2dFiZa89FDJvooDoKQ8CAWE+uvZzdKH7AeDaqcR7+1qI9U
         bXy5jjJgeIKT1Rw+YV89Kz2qBhB23plVh7n3FJPP+cS9+/5xOLIxkad2U1MUez37fiTU
         nWfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709239597; x=1709844397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uksAq88uVp5okgx/Exa2hxJN/E03YPHCXn8sV24HEBM=;
        b=sLzOvjft4NPeue7MA4dXUGJ9SijF3uPAUuP59lnBIUePTwakJ7ebO2x30xPgC6SYc9
         m/RicF4yNvUQkFsG4OXskHeMqmiNg+AxxlfB/Cw/3enyqhGA4wmnyEm56J6DhWzj7HmJ
         1CG1zNE8RAI8lY6FJjVjKJrVRsUOndmGPqsZpS/eSrejVXkQS/TEObRouGQV7lNPRvz4
         P9FqxP/2VOcck/tbnnIjDhxZ4KGavG1A7Qow4Foz+3l3CAB2t4DKbteM35AaW2J5++ee
         AfnBiYiORuFzxyVttcU6hhpIaSlRYUNGNAzxymMo5YoViHxaprJVP2YiHpsIBpBxQ2Or
         MDJQ==
X-Gm-Message-State: AOJu0YwRTAFJ4qRC7SQqpNjQ1yC8Zb7UCBbPEmkkdXnjV8usofK2QNrl
	SiwkeKo7l8lWIQoHSWep44nOZDa8loKACesck/Vzdx2M7OwsLy8QxjyJ/n83
X-Google-Smtp-Source: AGHT+IFoc6A2MMw1JO8E0ZX+RYjqdgOU4oNihEmzLjozZ2dIOPXKsiRCmTjP5dJQ6euiYLAH9LI/ww==
X-Received: by 2002:a17:90a:9314:b0:29a:ccb2:13dd with SMTP id p20-20020a17090a931400b0029accb213ddmr189894pjo.33.1709239596593;
        Thu, 29 Feb 2024 12:46:36 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::7ade])
        by smtp.gmail.com with ESMTPSA id nd16-20020a17090b4cd000b0029b035682d7sm2451480pjb.9.2024.02.29.12.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 12:46:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 3/3] python3-betamax: Upgrade to 0.9.0
Date: Thu, 29 Feb 2024 12:46:33 -0800
Message-ID: <20240229204633.1320488-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240229204633.1320488-1-raj.khem@gmail.com>
References: <20240229204633.1320488-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 29 Feb 2024 20:46:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109062

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...op-ptests-fixtures-and-recorde_modes.patch | 42 ++++++++++++-------
 ...amax_0.8.1.bb => python3-betamax_0.9.0.bb} |  4 +-
 2 files changed, 27 insertions(+), 19 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-betamax_0.8.1.bb => python3-betamax_0.9.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-betamax/0001-Drop-ptests-fixtures-and-recorde_modes.patch b/meta-python/recipes-devtools/python/python3-betamax/0001-Drop-ptests-fixtures-and-recorde_modes.patch
index 7adcb68324..52745a9373 100644
--- a/meta-python/recipes-devtools/python/python3-betamax/0001-Drop-ptests-fixtures-and-recorde_modes.patch
+++ b/meta-python/recipes-devtools/python/python3-betamax/0001-Drop-ptests-fixtures-and-recorde_modes.patch
@@ -1,7 +1,7 @@
-From 0e0b63ae80df5d7849b2e1c5ab9a668e8378b5e8 Mon Sep 17 00:00:00 2001
+From e5aa66b1af2d49f159c4daefc598f96744ee988d Mon Sep 17 00:00:00 2001
 From: Zhixiong Chi <zhixiong.chi@windriver.com>
-Date: Tue, 28 Mar 2023 06:05:45 +0000
-Subject: [PATCH] Drop ptests fixtures and recorde_modes
+Date: Thu, 29 Feb 2024 12:31:58 -0800
+Subject: [PATCH] [PATCH] Drop ptests fixtures and recorde_modes
 
 The usage of fixture in test_fixtures has been deprecated.
 See https://docs.pytest.org/en/stable/explanation/fixtures.html and
@@ -12,14 +12,15 @@ re-sold several times, and it adds X-Amzn-Trace-Id header that can possibly
 diff for each request.
 It leads to ptest failure, so drop it now until we find the solution.
 
-Upstream-Status: Inappropriate [oe specific]
+Upstream-Status: Inappropriate [OE-Specific]
 
 Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  tests/integration/test_fixtures.py     |  60 -----------
- tests/integration/test_record_modes.py | 132 -------------------------
- tests/unit/test_fixtures.py            |  94 ------------------
- 3 files changed, 286 deletions(-)
+ tests/integration/test_record_modes.py | 141 -------------------------
+ tests/unit/test_fixtures.py            |  94 -----------------
+ 3 files changed, 295 deletions(-)
  delete mode 100644 tests/integration/test_fixtures.py
  delete mode 100644 tests/integration/test_record_modes.py
  delete mode 100644 tests/unit/test_fixtures.py
@@ -92,10 +93,12 @@ index fc3d1e7..0000000
 -    assert True
 diff --git a/tests/integration/test_record_modes.py b/tests/integration/test_record_modes.py
 deleted file mode 100644
-index 58c8846..0000000
+index 988b851..0000000
 --- a/tests/integration/test_record_modes.py
 +++ /dev/null
-@@ -1,132 +0,0 @@
+@@ -1,141 +0,0 @@
+-import re
+-
 -from betamax import Betamax, BetamaxError
 -
 -from tests.integration.helper import IntegrationHelper
@@ -137,8 +140,15 @@ index 58c8846..0000000
 -            # this test to succeed.
 -            # NOTE(hroncok): httpbin.org added X-Processed-Time header that
 -            # can possibly differ (and often does)
+-            r0_content = r0.content.decode(encoding='utf-8', errors='strict')
+-            r1_content = r1.content.decode(encoding='utf-8', errors='strict')
+-            r0_content = re.sub('"X-Amzn-Trace-Id": "[^"]+"', '"X-Amzn-Trace-Id": ""', r0_content)
+-            r1_content = re.sub('"X-Amzn-Trace-Id": "[^"]+"', '"X-Amzn-Trace-Id": ""', r1_content)
+-            # NOTE(jhatler): httpbin.org added "X-Amzn-Trace-Id" to their
+-            # response, which is a unique ID that will differ between requests.
+-            # We remove it from the response body before comparing.
 -            assert r0_headers == r1_headers
--            assert r0.content == r1.content
+-            assert r0_content == r1_content
 -
 -
 -class TestRecordNone(IntegrationHelper):
@@ -230,7 +240,7 @@ index 58c8846..0000000
 -            assert len(cassette.interactions) == 5
 diff --git a/tests/unit/test_fixtures.py b/tests/unit/test_fixtures.py
 deleted file mode 100644
-index 387d9ce..0000000
+index 41f33eb..0000000
 --- a/tests/unit/test_fixtures.py
 +++ /dev/null
 @@ -1,94 +0,0 @@
@@ -263,9 +273,9 @@ index 387d9ce..0000000
 -        # Mock a pytest request object
 -        request = mock.MagicMock()
 -        request.cls = request.module = None
--        request.function.__name__ = 'test'
+-        request.node.name = request.function.__name__ = 'test'
 -
--        pytest_fixture.betamax_recorder(request)
+-        pytest_fixture._betamax_recorder(request)
 -        assert request.addfinalizer.called is True
 -        request.addfinalizer.assert_called_once_with(self.mocked_betamax.stop)
 -
@@ -273,9 +283,9 @@ index 387d9ce..0000000
 -        # Mock a pytest request object
 -        request = mock.MagicMock()
 -        request.cls = request.module = None
--        request.function.__name__ = 'test'
+-        request.node.name = request.function.__name__ = 'test'
 -
--        pytest_fixture.betamax_recorder(request)
+-        pytest_fixture._betamax_recorder(request)
 -        self.mocked_betamax.start.assert_called_once_with()
 -
 -
@@ -329,5 +339,5 @@ index 387d9ce..0000000
 -
 -        recorder.stop.assert_called_once_with()
 -- 
-2.35.5
+2.44.0
 
diff --git a/meta-python/recipes-devtools/python/python3-betamax_0.8.1.bb b/meta-python/recipes-devtools/python/python3-betamax_0.9.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-betamax_0.8.1.bb
rename to meta-python/recipes-devtools/python/python3-betamax_0.9.0.bb
index 468a1075b1..a0454686ee 100644
--- a/meta-python/recipes-devtools/python/python3-betamax_0.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-betamax_0.9.0.bb
@@ -7,9 +7,7 @@ SRC_URI += " \
         file://run-ptest \
         file://0001-Drop-ptests-fixtures-and-recorde_modes.patch \
 "
-
-SRC_URI[md5sum] = "b8182d43a200fc126a3bf7555626f964"
-SRC_URI[sha256sum] = "5bf004ceffccae881213fb722f34517166b84a34919b92ffc14d1dbd050b71c2"
+SRC_URI[sha256sum] = "82316e1679bc6879e3c83318d016b54b7c9225ff08c4462de4813e22038d5f94"
 
 inherit pypi setuptools3 ptest
 
-- 
2.44.0


