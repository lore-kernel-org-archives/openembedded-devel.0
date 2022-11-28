Return-Path: <geoffhp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01EE7C43217
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 22:33:12 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.133140.1669674782898141486
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Nov 2022 14:33:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EtuutYby;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: geoffhp@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id t11-20020a17090a024b00b0021932afece4so4586657pje.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 14:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Kmj+yMOSmvQx3BVz4mH5fe81HrBouhqX9OnaS4+ApNY=;
        b=EtuutYbyssF1fSVodNwxmBYoQjBWGjp1VFvkJq5Bg9FErju5oKnfM/ZH+mL174xnjp
         PSTJH2B2O00sGeuXa0nCMhSp3QT4AkSX+NMzBHDHWZPxgurc4U2zh3wANuZIP9xCOWnP
         ek4bgJD4b2ViFbikE8HdsoSi3ZRFbUS/2GveB8XJPN4Zb2jtYmQPo5dYu1Rtuta7D7SO
         LTcBVhuUKMkernAApUwrGZlrsy7zjIg3MtGAPQ4z5xfXTqkYgln8xWmEVQGsSPLwKpCx
         uKE9Cpe6miuvHxPct/iKBxHfZMrQkJbFqIbkTL5Pf+xsc3q9OdSLNY3xaW6DFwoPl5Xp
         QDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kmj+yMOSmvQx3BVz4mH5fe81HrBouhqX9OnaS4+ApNY=;
        b=YG2pdQW6tAXx6OK8ZpZrLTkE3/BcMlCtUZwUmi2Zq2/72QfE1thWjrIa5k0l6pu68v
         8QJmW9QUMUuxA0euEbIp76Qk2++V2EfzYCiWHeL+BHQkSTM3Y0C7XAsemDvSMfDPPTNc
         ASd0/ceik6jrPZ+dYUdIqvw/Wk7eW7XXH8my4dBGEj7nUJr/9+XJbSKaT2GxaapbNSem
         rKACO8ofDTzyTKbFWBpMT1fxc/SJxcQLpxklY6YcGWhRK9HO5UYTCmgnfTNzy9g1woEb
         YhVjM+e7aq0A4NxEnLC1Ryl0PSzTsHDubqesPqfz+jdhIYLWIisQVYhwTfxfsn1KkorK
         5ojw==
X-Gm-Message-State: ANoB5plA33qgG7Dii73XgMxdKF3HwcE9OqEv3Qgl79yPyZIzFa9xRxvA
	i2UJuO0GJcjeKeaky9o0gj3RFU03QO0=
X-Google-Smtp-Source: AA0mqf6abYzUnqY2fLgbCvG6Jzpgkn+1OZergr+nIw1yNt2CwO+7k+Eb+onlRsqacCS1Z04glU3ZiA==
X-Received: by 2002:a17:90a:6582:b0:219:2638:42d0 with SMTP id k2-20020a17090a658200b00219263842d0mr11741727pjj.186.1669674781953;
        Mon, 28 Nov 2022 14:33:01 -0800 (PST)
Received: from localhost.localdomain (cpe-107-185-48-203.socal.res.rr.com. [107.185.48.203])
        by smtp.gmail.com with ESMTPSA id v11-20020a17090a520b00b0020ab246ac79sm2663840pjh.47.2022.11.28.14.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 14:33:01 -0800 (PST)
From: geoffhp@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Geoff Parker <geoffrey.parker@arthrex.com>
Subject: [PATCH] python3-yappi: upgrade 1.3.6 -> 1.4.0, python 3.11 compatible
Date: Mon, 28 Nov 2022 14:32:33 -0800
Message-Id: <20221128223233.951207-1-geoffhp@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 22:33:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99833

From: Geoff Parker <geoffrey.parker@arthrex.com>

Update to 1.4.0 for python 3.11 compatibilty

Add patch to add upstream commit added after the release of 1.4.0
tarball. Adds python 3.11 to setup.py

Update 0001-Fix-imports-for-ptest.patch for patch fuzz and
removed hunk already in 1.4.0.

Signed-off-by: Geoff Parker <geoffrey.parker@arthrex.com>
---
 .../0001-Fix-imports-for-ptests.patch         | 16 ++-----------
 .../0002-add-3.11-to-the-setup.patch          | 24 +++++++++++++++++++
 ...-yappi_1.3.6.bb => python3-yappi_1.4.0.bb} |  4 ++--
 3 files changed, 28 insertions(+), 16 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-yappi/0002-add-3.11-to-the-setup.patch
 rename meta-python/recipes-devtools/python/{python3-yappi_1.3.6.bb => python3-yappi_1.4.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-yappi/0001-Fix-imports-for-ptests.patch b/meta-python/recipes-devtools/python/python3-yappi/0001-Fix-imports-for-ptests.patch
index fa58897e6..274f6f527 100644
--- a/meta-python/recipes-devtools/python/python3-yappi/0001-Fix-imports-for-ptests.patch
+++ b/meta-python/recipes-devtools/python/python3-yappi/0001-Fix-imports-for-ptests.patch
@@ -8,10 +8,9 @@ Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
  tests/test_asyncio.py              | 2 +-
  tests/test_asyncio_context_vars.py | 2 +-
  tests/test_functionality.py        | 2 +-
- tests/test_gevent.py               | 2 +-
  tests/test_hooks.py                | 2 +-
  tests/test_tags.py                 | 2 +-
- 6 files changed, 6 insertions(+), 6 deletions(-)
+ 5 files changed, 6 insertions(+), 6 deletions(-)
 
 --- a/tests/test_asyncio.py
 +++ b/tests/test_asyncio.py
@@ -23,7 +22,7 @@ Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
 +from .utils import YappiUnitTestCase, find_stat_by_name, burn_cpu, burn_io
  
  
- @asyncio.coroutine
+ async def async_sleep(sec):
 --- a/tests/test_asyncio_context_vars.py
 +++ b/tests/test_asyncio_context_vars.py
 @@ -5,7 +5,7 @@ import contextvars
@@ -3870,17 +3869,6 @@ Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
 +    #     import sys;sys.argv = ['', 'BasicUsage.test_run_as_script']
 +    #     import sys;sys.argv = ['', 'MultithreadedScenarios.test_subsequent_profile']
 +    unittest.main()
---- a/tests/test_gevent.py
-+++ b/tests/test_gevent.py
-@@ -4,7 +4,7 @@ import yappi
- import gevent
- from gevent.event import Event
- import threading
--from utils import (
-+from .utils import (
-     YappiUnitTestCase, find_stat_by_name, burn_cpu, burn_io,
-     burn_io_gevent
- )
 --- a/tests/test_hooks.py
 +++ b/tests/test_hooks.py
 @@ -5,7 +5,7 @@ import unittest
diff --git a/meta-python/recipes-devtools/python/python3-yappi/0002-add-3.11-to-the-setup.patch b/meta-python/recipes-devtools/python/python3-yappi/0002-add-3.11-to-the-setup.patch
new file mode 100644
index 000000000..a9bf612db
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-yappi/0002-add-3.11-to-the-setup.patch
@@ -0,0 +1,24 @@
+From 38afdacf526410f970afc58e147c7377c6c7112c Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?S=C3=BCmer=20Cip?= <sumer.cip@platform.sh>
+Date: Fri, 25 Nov 2022 15:58:03 +0300
+Subject: [PATCH 2/2] add 3.11 to the setup
+
+---
+ setup.py | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/setup.py b/setup.py
+index d006787..96e2a66 100644
+--- a/setup.py
++++ b/setup.py
+@@ -56,6 +56,7 @@ CLASSIFIERS = [
+     'Programming Language :: Python :: 3.8',
+     'Programming Language :: Python :: 3.9',
+     'Programming Language :: Python :: 3.10',
++    'Programming Language :: Python :: 3.11',
+     'Programming Language :: Python :: Implementation :: CPython',
+     'Operating System :: OS Independent',
+     'Topic :: Software Development :: Libraries',
+-- 
+2.30.2
+
diff --git a/meta-python/recipes-devtools/python/python3-yappi_1.3.6.bb b/meta-python/recipes-devtools/python/python3-yappi_1.4.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-yappi_1.3.6.bb
rename to meta-python/recipes-devtools/python/python3-yappi_1.4.0.bb
index 526af346b..71e74e86f 100644
--- a/meta-python/recipes-devtools/python/python3-yappi_1.3.6.bb
+++ b/meta-python/recipes-devtools/python/python3-yappi_1.4.0.bb
@@ -4,11 +4,12 @@ HOMEPAGE = "https://github.com/sumerc/yappi"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=71c208c9a4fd864385eb69ad4caa3bee"
 
-SRC_URI[sha256sum] = "0a73c608a2603570a020a32d4369ba744012bc5267f37e5bd8026fb491abba56"
+SRC_URI[sha256sum] = "504b5d8fc7433736cb5e257991d2e7f2946019174f1faec7b2fe947881a17fc0"
 
 SRC_URI += " \
     file://run-ptest \
     file://0001-Fix-imports-for-ptests.patch \
+    file://0002-add-3.11-to-the-setup.patch \
 "
 
 inherit pypi setuptools3 ptest
@@ -33,4 +34,3 @@ do_install_ptest() {
     cp -f ${S}/yappi/yappi.py ${D}/${PTEST_PATH}/
 }
 
-SKIP_RECIPE[python3-yappi] ?= "Not compatible with py3.11; needs a new release"
-- 
2.30.2


