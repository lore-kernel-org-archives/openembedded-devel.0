Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F99CEB64DC
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 04:26:16 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.686.1689654373914029342
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jul 2023 21:26:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="126111081"
X-IronPort-AV: E=Sophos;i="6.01,213,1684767600"; 
   d="scan'208";a="126111081"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 13:26:14 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id A6076CD7E0
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:11 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9C796D4F4E
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:10 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2795420077821;
	Tue, 18 Jul 2023 13:26:10 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-click: upgrade 8.1.3 -> 8.1.5
Date: Tue, 18 Jul 2023 12:25:26 +0800
Message-Id: <1689654348-30702-24-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
References: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27758.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27758.004
X-TMASE-Result: 10--13.047700-10.000000
X-TMASE-MatchedRID: cNdigjJ0nVG7qz8f6326on1zro62qhdCMVVFhl7NwvNs1Ir4NZzFmlHs
	YDQ6MXSWRexsVN65tZAeHoET/miP6rHmPCNggyZkvr7oQh2H9euUq+GQ/zyJdDABh2rVVNejulb
	kzdjCyXznF9RqAw4gsE5rdOs40XpfdYlaOEy4HBxtN2GsBybzwgv/9UzFeXITFFqcwE7P4SJth1
	r0fdARdW+3dY3RzFk1ajCrbfKcQVwHRh8rrlVoOxlJRfzNw8afP8UQejhp29oenK78XFg4oedv+
	AJPtGCvQIyJCLMeQiY4jzBD0joqX2gG4T4l6wOKGFMYlDUzwr1MkOX0UoduuZjmdWmKHGLDlSG3
	6bKvRcwILxoCYZ47qepe9co8GDkGZWMJGq5h2T4ReM8i8p3vgFK6+0HOVoSoNS9A3X1uuOBYqgM
	pOy5G5FUHrn/zjIH1dObf+wK0XTVSkZaHmsPyW4vefyp1glN0TSz0JdEAJbSdZKFsIrage/arnG
	aAGos+iKf5Nsd475EtYdXlHPqevE7x8xnBqoiCngIgpj8eDcBZDL1gLmoa/C8z+bJ2nm9UKrauX
	d3MZDXt67F06d1iH9NjK1SGF3dyII95qGEuy+swEO7tC7JQGO/nlhWY7j1P
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 04:26:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103915

From: Wang Mingyu <wangmy@fujitsu.com>

0001-tests-Fix-test_bytes_args.patch
removed since it's included in 8.1.5

Changelog:
==========
-Fix an issue with type hints for @click.command(), @click.option(), and other decorators. Introduce typing tests.
-Replace all typing.Dict occurrences to typing.MutableMapping for parameter hints. #2255
-Improve type hinting for decorators and give all generic types parameters. #2398
-Fix return value and type signature of shell_completion.add_completion_class function. #2421
-Bash version detection doesn’t fail on Windows. #2461
-Completion works if there is a dot (.) in the program name. #2166
-Improve type annotations for pyright type checker. #2268
-Improve responsiveness of click.clear(). #2284
-Improve command name detection when using Shiv or PEX. #2332
-Avoid showing empty lines if command help text is empty. #2368
-ZSH completion script works when loaded from fpath. #2344.
-EOFError and KeyboardInterrupt tracebacks are not suppressed when standalone_mode is disabled. #2380
-@group.command does not fail if the group was created with a custom command_class. #2416
-multiple=True is allowed for flag options again and does not require setting default=(). #2246, #2292, #2295
-Make the decorators returned by @argument() and @option() reusable when the cls parameter is used. #2294
-Don’t fail when writing filenames to streams with strict errors. Replace invalid bytes with the replacement character
-Remove unnecessary attempt to detect MSYS2 environment. #2355
-Remove outdated and unnecessary detection of App Engine environment. #2554
-echo() does not fail when no streams are attached, such as with pythonw on Windows. #2415
-Argument with expose_value=False do not cause completion to fail. #2336

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-tests-Fix-test_bytes_args.patch      | 41 -------------------
 ...-click_8.1.3.bb => python3-click_8.1.5.bb} |  7 +---
 2 files changed, 2 insertions(+), 46 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-click/0001-tests-Fix-test_bytes_args.patch
 rename meta-python/recipes-devtools/python/{python3-click_8.1.3.bb => python3-click_8.1.5.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-click/0001-tests-Fix-test_bytes_args.patch b/meta-python/recipes-devtools/python/python3-click/0001-tests-Fix-test_bytes_args.patch
deleted file mode 100644
index e69a37c405..0000000000
--- a/meta-python/recipes-devtools/python/python3-click/0001-tests-Fix-test_bytes_args.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From da83bd7ca0959027086115f23534957b0917aaa5 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 27 Apr 2023 22:21:24 -0700
-Subject: [PATCH] tests: Fix test_bytes_args
-
-sys.stdin.encoding is readonly therefore use Mocking to wrap it.
-Sourced from - Alpine
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- tests/test_arguments.py | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/tests/test_arguments.py b/tests/test_arguments.py
-index 735df4b..3395c55 100644
---- a/tests/test_arguments.py
-+++ b/tests/test_arguments.py
-@@ -1,4 +1,5 @@
- import sys
-+from unittest import mock
- 
- import pytest
- 
-@@ -86,9 +87,12 @@ def test_bytes_args(runner, monkeypatch):
-         ), "UTF-8 encoded argument should be implicitly converted to Unicode"
- 
-     # Simulate empty locale environment variables
--    monkeypatch.setattr(sys.stdin, "encoding", "utf-8")
-     monkeypatch.setattr(sys, "getfilesystemencoding", lambda: "utf-8")
-     monkeypatch.setattr(sys, "getdefaultencoding", lambda: "utf-8")
-+    # sys.stdin.encoding is readonly, needs some extra effort to patch.
-+    stdin = mock.Mock(wraps=sys.stdin)
-+    stdin.encoding = "utf-8"
-+    monkeypatch.setattr(sys, "stdin", stdin)
- 
-     runner.invoke(
-         from_bytes,
--- 
-2.40.1
-
diff --git a/meta-python/recipes-devtools/python/python3-click_8.1.3.bb b/meta-python/recipes-devtools/python/python3-click_8.1.5.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-click_8.1.3.bb
rename to meta-python/recipes-devtools/python/python3-click_8.1.5.bb
index 9b8ea94c2a..d7d50118e2 100644
--- a/meta-python/recipes-devtools/python/python3-click_8.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-click_8.1.5.bb
@@ -8,14 +8,11 @@ HOMEPAGE = "http://click.pocoo.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=1fa98232fd645608937a0fdc82e999b8"
 
-SRC_URI[sha256sum] = "7682dc8afb30297001674575ea00d1814d808d6a36af415a82bd481d37ba7b8e"
+SRC_URI[sha256sum] = "4be4b1af8d665c6d942909916d31a213a106800c47d0eeba73d34da3cbc11367"
 
 inherit pypi setuptools3 ptest
 
-SRC_URI += " \
-	file://0001-tests-Fix-test_bytes_args.patch \
-	file://run-ptest \
-"
+SRC_URI += "file://run-ptest"
 
 RDEPENDS:${PN}-ptest += " \
 	${PYTHON_PN}-pytest \
-- 
2.34.1


