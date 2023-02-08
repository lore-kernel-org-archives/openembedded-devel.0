Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96F8AC636D4
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 08:08:55 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.3728.1675843730188265719
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Feb 2023 00:08:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=R+zP4mzr;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1675843733; i=@fujitsu.com;
	bh=+u5Qm7u5gcbtr5ARorxk/mh+nk9QMni/qXyeaX8vU8M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=R+zP4mzrS63EMneyLkDA8X/AiQaUIwwOU/mktAfdzT0T5s4zIUaekj5adUS9+HbKU
	 FrdZa5DHpUKHjwzhEIRH2GeARp76TabK+pwp+70s0lzqHUbOJXDXnxzxYJ03NbE+Ms
	 m0gnTYdCwbwpnsJaQL/kLITF70bu9RXoPbgWrEyt//iPjf5kKs7/DoDa7N4MCV+2DQ
	 a8hghz0SDWYr26OynzoauVylpSZ+6WJQ9WwFMFOR5waltU24XpqBstc50rRHSEy48A
	 UyUzV10Y7LsRpbsCUa3tZqeCDgkN2SiGiPMqK+XaCnViIptgobN46CN2v83YhLztWH
	 iBcS2shaZenAQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8ORqDsl4nG
  yQeclDYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePyy/uMBT/kK27MsGhgbJPpYuTiEBJ4wijx
  o+ERI4Rzg0ni+7RfLBDOHkaJTyfmMXUxcnKwCUhJ3Lj/nw3EFhHQl1g6ew8ziM0soCLx4ncPO
  4gtLOArsfbjC7B6FqD4rg+HwWxeASeJtUuOgtVICChITHn4HqyXU8BZ4lLfWVYQWwioZuJFiP
  m8AoISJ2c+YYGYLyFx8MULZoheRYnZl5tZIOxKidYPv6BsNYmr5zYxT2AUnIWkfRaS9gWMTKs
  YzYpTi8pSi3QNDfWSijLTM0pyEzNz9BKrdBP1Ukt1y1OLS3SN9BLLi/VSi4v1iitzk3NS9PJS
  SzYxAoM3pVjZYwfj076/eocYJTmYlER5PcUeJwvxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4I0IB
  8oJFqWmp1akZeYAIwkmLcHBoyTCGxkKlOYtLkjMLc5Mh0idYtTl2LSv6wCzEEtefl6qlDjvoz
  CgIgGQoozSPLgRsKi+xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYNwBkCk9mXgncpldARzA
  BHRGi+hDkiJJEhJRUA9NK+Rczynedn7ndedaGknTbJ2dzk3cLLbbcJZ9Vk77RX2pKaL9QS6jn
  xpkcVzruM3j+Wdz7z+XblW+PHsjPdT629E7/k3zxJSrHi1au9dm9+cz6lVdPNOgevmv8hbeGV
  aH/QavYpCQBg8PPTyXl/7F7NWH5mRcJXL5tyXp6yV+ym+qVOE7+0lp0zI3ha8vnc7ZmdczdJe
  r/fuen716o9ebCngxVrrqi1O2XSyuvXZjXtXSGjNgB+WX3V/w6VbhZIFb9QcaWPeeYdR9JLrC
  Y4rFz1+bnC389Pho2W56x+Hglt56B2BG28A21sxR4pe+y3Mh539aXe3BTsMnJtvWb5lW9YTyv
  MHFm0/6qMs/YOWwFSizFGYmGWsxFxYkAE/U7g2UDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-565.messagelabs.com!1675843732!620580!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5835 invoked from network); 8 Feb 2023 08:08:52 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-3.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Feb 2023 08:08:52 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 5D0C1100188
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Feb 2023 08:08:52 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 4F059100043
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Feb 2023 08:08:52 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 8 Feb 2023 08:08:50 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-aspectlib: upgrade 1.5.2 -> 2.0.0
Date: Wed, 8 Feb 2023 16:08:34 +0800
Message-ID: <1675843716-11186-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1675843716-11186-1-git-send-email-wangmy@fujitsu.com>
References: <1675843716-11186-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Feb 2023 08:08:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100970

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright updated to 2022.

0001-Remove-tornado-6-test-constraint.-Ref-15.patch
removed since it's not available in 2.0.0.

Changelog:
=========
 Drop support for legacy Pythons (2.7, 3.6 or older).
 Remove Travis/Appveyor CI and switch to GitHub Actions.
 Added support for Tornado 6 (in the test suite).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ve-tornado-6-test-constraint.-Ref-15.patch | 45 -------------------
 ...ib_1.5.2.bb => python3-aspectlib_2.0.0.bb} |  5 +--
 2 files changed, 2 insertions(+), 48 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-aspectlib/0001-Remove-tornado-6-test-constraint.-Ref-15.patch
 rename meta-python/recipes-devtools/python/{python3-aspectlib_1.5.2.bb => python3-aspectlib_2.0.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-aspectlib/0001-Remove-tornado-6-test-constraint.-Ref-15.patch b/meta-python/recipes-devtools/python/python3-aspectlib/0001-Remove-tornado-6-test-constraint.-Ref-15.patch
deleted file mode 100644
index 174f088e9..000000000
--- a/meta-python/recipes-devtools/python/python3-aspectlib/0001-Remove-tornado-6-test-constraint.-Ref-15.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From d3ae6ac951cc5bbce29b9c987741e0a557c9b777 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Ionel=20Cristian=20M=C4=83rie=C8=99?= <contact@ionelmc.ro>
-Date: Sun, 2 May 2021 09:50:43 +0300
-Subject: [PATCH] Remove tornado<6 test constraint. Ref #15.
-
-Upstream-Status: Backport [https://github.com/ionelmc/python-aspectlib/commit/7dccb198dfb426f529b81a28a755f3c02f8b50cb]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- tests/test_integrations_py3.py | 5 ++++-
- tox.ini                        | 3 ++-
- 2 files changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/tests/test_integrations_py3.py b/tests/test_integrations_py3.py
-index e025eac..596589d 100644
---- a/tests/test_integrations_py3.py
-+++ b/tests/test_integrations_py3.py
-@@ -36,7 +36,10 @@ def test_decorate_tornado_coroutine():
-     @gen.coroutine
-     @debug.log(print_to=buf, module=False, stacktrace=2, result_repr=repr)
-     def coro():
--        yield gen.Task(loop.add_timeout, timedelta(microseconds=10))
-+        if hasattr(gen, 'Task'):
-+            yield gen.Task(loop.add_timeout, timedelta(microseconds=10))
-+        else:
-+            yield gen.sleep(0.01)
-         return "result"
- 
-     loop = ioloop.IOLoop.current()
-diff --git a/tox.ini b/tox.ini
-index 8c607de..08c31b3 100644
---- a/tox.ini
-+++ b/tox.ini
-@@ -55,7 +55,8 @@ deps =
-     pytest-clarity
-     pytest-cov
-     pytest-travis-fold
--    tornado<6.0
-+    six
-+    tornado
- commands =
-     {posargs:pytest --cov --cov-report=term-missing -vv --ignore=src}
- 
--- 
-2.32.0
-
diff --git a/meta-python/recipes-devtools/python/python3-aspectlib_1.5.2.bb b/meta-python/recipes-devtools/python/python3-aspectlib_2.0.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-aspectlib_1.5.2.bb
rename to meta-python/recipes-devtools/python/python3-aspectlib_2.0.0.bb
index 71f3d3594..416b031c5 100644
--- a/meta-python/recipes-devtools/python/python3-aspectlib_1.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-aspectlib_2.0.0.bb
@@ -6,14 +6,13 @@ DESCRIPTION = " It is useful when changing behavior in existing code is desired.
 It includes tools for debugging and testing: simple mock/record and a complete capture/replay framework."
 HOMEPAGE = "https://github.com/ionelmc/python-aspectlib"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d58b3f20fd10347a9458b8a03793b62e"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=80721ace117fd1f814049ecb81c6be76"
 
-SRC_URI[sha256sum] = "d275ec82c4c2712e564bb760e4accff8f061f648e38774feabeb8b241cf3a4aa"
+SRC_URI[sha256sum] = "a4b461b9da0b531aebcb93efcde3de808a72c60226dd8d902c467d13faf7ce92"
 
 inherit ptest pypi setuptools3
 
 SRC_URI += "file://run-ptest \
-            file://0001-Remove-tornado-6-test-constraint.-Ref-15.patch \
            "
 
 do_install_ptest() {
-- 
2.34.1


