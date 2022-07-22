Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D36CEC433EF
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 01:41:22 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web09.3262.1658454080033322592
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jul 2022 18:41:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=bJqf7+8U;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658454078; i=@fujitsu.com;
	bh=3LKtwnc12PauKTievIShEme6YyXhopsS8mJjWoxm1h4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=bJqf7+8UUp1scCBrmi2Nv9a1M42QzH9tNcYv9UAbOS0J0mXmFtu9U183ctV+qZBIv
	 i+XF0hDudZKryo1/uSfmmRVoHkzbuv2ev6Lqk4ZrZuG0eZUT7m0irX2fvY04l/ys/R
	 +qey30Iz60hR8XoiMxbyPTN54mOVmHHAco8HT40ea0LZDg2GMQCIZ+h+URNnJ34vOb
	 c3fKW/KaBnqKY762V76C/emIV7gi9ZThmAbj2FT4bPBbO8P47YAXTEEPDphoTzkkoB
	 BpO/4YIOVmkJwP8MskOwt+tIJ5qJyi5TxHOkZ7t2VxnzX1UKhir0QJbmOytyxMWYfD
	 I2+KnuXf3IeKA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMIsWRWlGSWpSXmKPExsViZ8ORpGvLcCv
  JYN15OYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaNts1bBOrmK5/fcGhinS3cxcnEICTxklLh8
  aCoLhHOFSWLXl11MEM4BRokrDw8wdjFycrAJ6Eq8+LGYBcQWEdCXWDp7DzOILSzgIbFy/hF2E
  JtFQFVixcRZYHFeoPiSud/YQGwJAQWJKQ/fQ8UFJU7OfAI2h1lAQuLgixdAcQ6gGkWJ2dPlIc
  orJF4fvsQMYatJXD23iXkCI98sJN2zkHQvYGRaxWidVJSZnlGSm5iZo2toYKBraGiqa2ypa2R
  goJdYpZuol1qqW55aXKJrpJdYXqyXWlysV1yZm5yTopeXWrKJERh6KcXqJ3YwPl35U+8QoyQH
  k5Io775JN5OE+JLyUyozEosz4otKc1KLDzHKcHAoSfAW/AXKCRalpqdWpGXmAOMAJi3BwaMkw
  mvxBSjNW1yQmFucmQ6ROsVozzF19r/9zBzLweTMr20HmDk27es6wCzEkpeflyolzrvkK1CbAE
  hbRmke3FBY3F5ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMw75T/QFJ7MvBK43a+AzmICOsv
  c/AbIWSWJCCmpBqZNZWwvrK8qmvl+z6jSm/5t/1bnSJeDrZzvgy99ZKn+/3dys7DTbTm90jSl
  Nhb7CW7x++ZaFd+69u+uz9wpltcPVN2czveZlzvyQEOu7PuLT60+Za48dHbbj6726aWzDh/1W
  PZ9171bL5Zte3pZo+YG19nk/+bHxOL+Vh68832Zpun12YcXJm8Mmv3j1zRFpR18aw6ZGef3/1
  /lVWrzK/6My+X1U/JOsAjbL268abtowv5n0c9W8bLtFr+Tq6BdGvb+V8q/HdJsHBtZfP72/tf
  YoJjEu9f1qKa5TdPV3pkXLvKf31o8adk75hgZmbBvVdO8OtZZMl9n/OKk3Xz3e6JOjlBq7eI9
  S92/FB7td93Gr8RSnJFoqMVcVJwIAKRInkpWAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-20.tower-571.messagelabs.com!1658454077!479646!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22295 invoked from network); 22 Jul 2022 01:41:17 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-20.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Jul 2022 01:41:17 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 37A341B2
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jul 2022 02:41:17 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 2CE231AE
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jul 2022 02:41:17 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 22 Jul 2022 02:41:15 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-blinker: upgrade 1.4 ->  1.5
Date: Fri, 22 Jul 2022 09:41:09 +0800
Message-ID: <1658454069-24240-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Jul 2022 01:41:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97934

0001-use-pytest-instead-of-deprecated-nose.patch
removed since it's included in 1.5

License-Update: License check file changed to LICENSE.rst

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...se-pytest-instead-of-deprecated-nose.patch | 36 -------------------
 .../python/python3-blinker_1.4.bb             | 22 ------------
 .../python/python3-blinker_1.5.bb             | 18 ++++++++++
 3 files changed, 18 insertions(+), 58 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-blinker/0001-use-pytest-instead-of-deprecated-nose.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-blinker_1.4.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-blinker_1.5.bb

diff --git a/meta-python/recipes-devtools/python/python3-blinker/0001-use-pytest-instead-of-deprecated-nose.patch b/meta-python/recipes-devtools/python/python3-blinker/0001-use-pytest-instead-of-deprecated-nose.patch
deleted file mode 100644
index a04c79b1e0..0000000000
--- a/meta-python/recipes-devtools/python/python3-blinker/0001-use-pytest-instead-of-deprecated-nose.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 9750d01118ee59ab174525e30d987065b69c0538 Mon Sep 17 00:00:00 2001
-From: pgajdos <pgajdos@suse.cz>
-Date: Wed, 8 Jul 2020 15:22:19 +0200
-Subject: [PATCH] use pytest instead of deprecated nose
-
-Upstream-Status: Submitted [https://github.com/jek/blinker/pull/60]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- tests/test_signals.py | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/tests/test_signals.py b/tests/test_signals.py
-index 9771e40..ccbc35b 100644
---- a/tests/test_signals.py
-+++ b/tests/test_signals.py
-@@ -4,7 +4,7 @@ import time
- 
- import blinker
- 
--from nose.tools import assert_raises
-+import pytest
- 
- 
- jython = sys.platform.startswith('java')
-@@ -232,7 +232,7 @@ def test_meta_connect_failure():
-         pass
-     sig = blinker.Signal()
- 
--    assert_raises(TypeError, sig.connect, receiver)
-+    pytest.raises(TypeError, sig.connect, receiver)
-     assert not sig.receivers
-     assert not sig._by_receiver
-     assert sig._by_sender == {blinker.base.ANY_ID: set()}
--- 
-2.35.1
-
diff --git a/meta-python/recipes-devtools/python/python3-blinker_1.4.bb b/meta-python/recipes-devtools/python/python3-blinker_1.4.bb
deleted file mode 100644
index 08a961f938..0000000000
--- a/meta-python/recipes-devtools/python/python3-blinker_1.4.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-DESCRIPTION = "Fast, simple object-to-object and broadcast signaling."
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=946d7e89af6f7733aeaebed5635d2682"
-
-SRC_URI[md5sum] = "8b3722381f83c2813c52de3016b68d33"
-SRC_URI[sha256sum] = "471aee25f3992bd325afa3772f1063dbdbbca947a041b8b89466dc00d606f8b6"
-
-inherit pypi setuptools3 ptest
-
-SRC_URI += " \
-	file://0001-use-pytest-instead-of-deprecated-nose.patch \
-	file://run-ptest \
-"
-
-RDEPENDS:${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
-"
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
diff --git a/meta-python/recipes-devtools/python/python3-blinker_1.5.bb b/meta-python/recipes-devtools/python/python3-blinker_1.5.bb
new file mode 100644
index 0000000000..dae1e39437
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-blinker_1.5.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "Fast, simple object-to-object and broadcast signaling."
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=42cd19c88fc13d1307a4efd64ee90e4e"
+
+SRC_URI[sha256sum] = "923e5e2f69c155f2cc42dafbbd70e16e3fde24d2d4aa2ab72fbe386238892462"
+
+inherit pypi setuptools3 ptest
+
+SRC_URI += "file://run-ptest"
+
+RDEPENDS:${PN}-ptest += " \
+	${PYTHON_PN}-pytest \
+"
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/tests
+	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
-- 
2.25.1


