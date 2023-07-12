Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67A49EB64D9
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 05:30:20 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.938.1689139816510362773
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 22:30:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=U/rMyvLN;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.199, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B9CEEFF802
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1689139815;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=wLp3aLlafyP63cWnN5k+hJw05tyaSEYJSLfHt6AD6ts=;
	b=U/rMyvLNJfrHLzrZGSMXuWCvlKccm1VqZfC++d75vhbl5nITZzh9+2Xmo/0Hn6GY/c4A0j
	OM2Bhl9z0z/TM+O2Mi4rJmN55wewa/CiKLxz0oRZ3maty8fSA9nqsYgQW9XURYz2K602nU
	iRZ/RWNLvs4FDfs5oTEDMrBLvOSL3ZRqpnaObr+IvjeXwrR5uYcsYGHVHZUICo1UVtCcT7
	RJ6vuNUInGL3qjJRsZ7oPdBO6Jsj2hdZ9ClLjE7tevE/9kGjfB7UfAGre01c8FY8dJ34pE
	Aw57ENrckXGmO2eBTEjws1hAg62N+QzXnsHJfnPMmgZXw8UFhp8E5Z/mzj6+mQ==
Content-Type: multipart/mixed; boundary="===============0437991790114237371=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-click: upgrading to 8.1.4 SUCCEEDED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:30:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103755
Message-Id: <20230712053020.67A49EB64D9@smtp.lore.kernel.org>
Date: Wed, 12 Jul 2023 05:30:20 +0000 (UTC)

--===============0437991790114237371==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-click* to *8.1.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-click-upgrade-8.1.3-8.1.4.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 755268190c412d7326cb048f455123572ed6ded1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 17:46:24 -0500
Subject: [PATCH] python3-click: upgrade 8.1.3 -> 8.1.4

---
 .../0001-tests-Fix-test_bytes_args.patch      | 41 -------------------
 ...-click_8.1.3.bb => python3-click_8.1.4.bb} |  7 +---
 2 files changed, 2 insertions(+), 46 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-click/0001-tests-Fix-test_bytes_args.patch
 rename meta-python/recipes-devtools/python/{python3-click_8.1.3.bb => python3-click_8.1.4.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-click/0001-tests-Fix-test_bytes_args.patch b/meta-python/recipes-devtools/python/python3-click/0001-tests-Fix-test_bytes_args.patch
deleted file mode 100644
index e69a37c40..000000000
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
diff --git a/meta-python/recipes-devtools/python/python3-click_8.1.3.bb b/meta-python/recipes-devtools/python/python3-click_8.1.4.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-click_8.1.3.bb
rename to meta-python/recipes-devtools/python/python3-click_8.1.4.bb
index 9b8ea94c2..dc624c43d 100644
--- a/meta-python/recipes-devtools/python/python3-click_8.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-click_8.1.4.bb
@@ -8,14 +8,11 @@ HOMEPAGE = "http://click.pocoo.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=1fa98232fd645608937a0fdc82e999b8"
 
-SRC_URI[sha256sum] = "7682dc8afb30297001674575ea00d1814d808d6a36af415a82bd481d37ba7b8e"
+SRC_URI[sha256sum] = "b97d0c74955da062a7d4ef92fadb583806a585b2ea81958a81bd72726cbb8e37"
 
 inherit pypi setuptools3 ptest
 
-SRC_URI += " \
-	file://0001-tests-Fix-test_bytes_args.patch \
-	file://run-ptest \
-"
+SRC_URI += "file://run-ptest"
 
 RDEPENDS:${PN}-ptest += " \
 	${PYTHON_PN}-pytest \
-- 
2.25.1


--===============0437991790114237371==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-click-upgrade-8.1.3-8.1.4.patch"

From 755268190c412d7326cb048f455123572ed6ded1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 17:46:24 -0500
Subject: [PATCH] python3-click: upgrade 8.1.3 -> 8.1.4

---
 .../0001-tests-Fix-test_bytes_args.patch      | 41 -------------------
 ...-click_8.1.3.bb => python3-click_8.1.4.bb} |  7 +---
 2 files changed, 2 insertions(+), 46 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-click/0001-tests-Fix-test_bytes_args.patch
 rename meta-python/recipes-devtools/python/{python3-click_8.1.3.bb => python3-click_8.1.4.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-click/0001-tests-Fix-test_bytes_args.patch b/meta-python/recipes-devtools/python/python3-click/0001-tests-Fix-test_bytes_args.patch
deleted file mode 100644
index e69a37c40..000000000
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
diff --git a/meta-python/recipes-devtools/python/python3-click_8.1.3.bb b/meta-python/recipes-devtools/python/python3-click_8.1.4.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-click_8.1.3.bb
rename to meta-python/recipes-devtools/python/python3-click_8.1.4.bb
index 9b8ea94c2..dc624c43d 100644
--- a/meta-python/recipes-devtools/python/python3-click_8.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-click_8.1.4.bb
@@ -8,14 +8,11 @@ HOMEPAGE = "http://click.pocoo.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=1fa98232fd645608937a0fdc82e999b8"
 
-SRC_URI[sha256sum] = "7682dc8afb30297001674575ea00d1814d808d6a36af415a82bd481d37ba7b8e"
+SRC_URI[sha256sum] = "b97d0c74955da062a7d4ef92fadb583806a585b2ea81958a81bd72726cbb8e37"
 
 inherit pypi setuptools3 ptest
 
-SRC_URI += " \
-	file://0001-tests-Fix-test_bytes_args.patch \
-	file://run-ptest \
-"
+SRC_URI += "file://run-ptest"
 
 RDEPENDS:${PN}-ptest += " \
 	${PYTHON_PN}-pytest \
-- 
2.25.1


--===============0437991790114237371==--

