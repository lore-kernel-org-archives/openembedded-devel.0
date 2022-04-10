Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C2A8C4708E
	for <webhook@archiver.kernel.org>; Wed, 13 Apr 2022 15:48:07 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web08.4066.1649840184538246526
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Apr 2022 01:56:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=gbEq36eB;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649840182; i=@fujitsu.com;
	bh=Ozm+FJr/ln/HPN0+IZapfhQE8Bsbt67e8I9MLUDcDYA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=gbEq36eBNpP2kvBNMvmmNtx65H9aA8ecNsCHc8Dw+ZjZk40PpzU/Dan3R5LaXrgHn
	 uyfDXplKLh9i7B1IuikW/M0fLw3zRaGxSmkZ3uyZlefoG0gXyPeLXsovYSrqxOchx+
	 d27CaoarXn9Bbi1meqNB4BfxL7pgzYZhrvNX/S1Xuov8Gy3xJS+6V9GKxU1uKKW9kL
	 ktdAwGA1/S357MFAxKH8jPHT7W6rm2ESNEesFxpmCJYJ2apc7qLh0eWGyY7zubLNpv
	 KUMpcniQM0X/O6QhIFhB2cRz6VprPVzp5aezPi0u9N9tWOVIee4etvkigL8zTCxIM0
	 6R891wKFwq8lg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHIsWRWlGSWpSXmKPExsViZ8MRoms2ISz
  JYFkLr8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnG2oY2xYK54xay3z5kbGD+IdDFycQgJzGaS
  ODrtIhuEs4dR4kzHL6YuRk4ONgE1iem3brCC2CIC+hJLZ+9hBrGZBVQkXvzuYQexhQW8JRbse
  QRmswioSqxavIgFxOYVcJKYfGs/mC0hoCAx5eF7sF5OAWeJj++bwWYKAdU072tmhqgXlDg58w
  kLxHwJiYMvXjBD9CpKzL7cDDWnQmLWrDamCYz8s5C0zELSsoCRaRWjVVJRZnpGSW5iZo6uoYG
  BrqGhqa6BrpGJsV5ilW6iXmqpbnlqcYmuoV5iebFeanGxXnFlbnJOil5easkmRmBQphQzfN7B
  uKDvp94hRkkOJiVRXo+usCQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKErwHeoBygkWp6akVaZk5w
  AiBSUtw8CiJ8L7oBUrzFhck5hZnpkOkTjHqcvzcuX8vsxBLXn5eqpQ4b3M/UJEASFFGaR7cCF
  i0XmKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzDsHZApPZl4J3KZXQEcwAR3xbVUoyBEliQg
  pqQamlW0RrZrPnrj8rX1edthNXP0Zk458/O1aF9XWmasbvzLMf6Hpa7Kr/9sZ6Q8XOq5+fjSL
  ISl/70WBG8wFm3MWp20VU9jkofZD85WV5gTty0t9Hq/3YO+/WS7dmKbm4eu85PnvSj+fWG7Lr
  JRs6SMHtJq+sWkuMl6wQGgfd+sytqhmt20tn+5pvdvP+tn4x4f6p95KS7oWRute3vtr8YojNy
  Ov37r/tOVVGTvjXwdbFnbX31cOtOj8izK793RlNofP7zvvn9/bZnPz5XHf3Reeqb6wZdV2Zgo
  WEYydpPMt3MhlxkJLrulVX9yOlCTufDLnUsFWj1/3Jm38lcN10N7dc2lq47qkrsOfF5e/UF38
  V4mlOCPRUIu5qDgRAGc0iTFRAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-587.messagelabs.com!1649840181!18468!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17299 invoked from network); 13 Apr 2022 08:56:22 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-9.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Apr 2022 08:56:22 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 23D8uJG0015656
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Apr 2022 09:56:21 +0100
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 13 Apr 2022 09:56:19 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH v2] python3-cppy: upgrade 1.2.0 -> 1.2.1
Date: Sun, 10 Apr 2022 23:52:54 +0800
Message-ID: <1649605974-12443-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1649605974-12443-1-git-send-email-wangmy@fujitsu.com>
References: <1649605974-12443-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Apr 2022 15:48:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96614

Add patch 0001-Fix-build-bug.patch to fix build bug caused by
setup.py.

Changelog:
==========
make the pyproject.toml fully PEP 621 compliant PR #19

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python3-cppy/0001-Fix-build-bug.patch     | 37 +++++++++++++++++++
 ...n3-cppy_1.2.0.bb => python3-cppy_1.2.1.bb} |  6 ++-
 2 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-cppy/0001-Fix-build-bug.patch
 rename meta-python/recipes-devtools/python/{python3-cppy_1.2.0.bb => python3-cppy_1.2.1.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-cppy/0001-Fix-build-bug.patch b/meta-python/recipes-devtools/python/python3-cppy/0001-Fix-build-bug.patch
new file mode 100644
index 0000000000..ada03b9a27
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cppy/0001-Fix-build-bug.patch
@@ -0,0 +1,37 @@
+From 57733d2cece47095b3faf14090219fcb5fa8ca2c Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@fujitsu.com>
+Date: Wed, 13 Apr 2022 13:01:32 +0900
+Subject: [PATCH] Fix build bug.
+
+Because the upstream cleared the setup.py, do_compile can't be excuted
+correctly. So, recover setup.py from the last version.
+
+Upstream-Status: Pending
+Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
+---
+ setup.py | 12 +++++++++++-
+ 1 file changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index f6f8487..8dfc33f 100644
+--- a/setup.py
++++ b/setup.py
+@@ -7,4 +7,14 @@
+ # ------------------------------------------------------------------------------
+ from setuptools import setup
+ 
+-setup()
++setup(
++    name="cppy",
++    author="The Nucleic Development Team",
++    author_email="sccolbert@gmail.com",
++    maintainer_email="m.dartiailh@gmail.com",
++    url="https://github.com/nucleic/cppy",
++    description="C++ headers for C extension development",
++    long_description=open("README.rst").read(),
++    packages=["cppy"],
++    package_data={"cppy": ["include/cppy/*.h"]},
++)
+-- 
+2.25.1
+
diff --git a/meta-python/recipes-devtools/python/python3-cppy_1.2.0.bb b/meta-python/recipes-devtools/python/python3-cppy_1.2.1.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-cppy_1.2.0.bb
rename to meta-python/recipes-devtools/python/python3-cppy_1.2.1.bb
index f86f571938..b9f7f08227 100644
--- a/meta-python/recipes-devtools/python/python3-cppy_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cppy_1.2.1.bb
@@ -3,7 +3,11 @@ HOMEPAGE = "https://cppy.readthedocs.io/en/latest/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0bfb3e39b13587f0028f17baf0e42371"
 
-SRC_URI[sha256sum] = "95e8862e4f826c3f2a6b7b658333b162f80cbe9f943aa0d0a7a6b2ef850aeffc"
+SRC_URI += " \
+    file://0001-Fix-build-bug.patch \
+"
+
+SRC_URI[sha256sum] = "83b43bf17b1085ac15c5debdb42154f138b928234b21447358981f69d0d6fe1b"
 
 RDEPENDS:${PN} += "python3-setuptools python3-distutils"
 
-- 
2.25.1


