Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53232ECAAD8
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 10:02:27 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web09.9830.1663668137530809714
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:02:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=FeC1qSPi;
 spf=permerror,
 err=parse error for token &{10 18 spf.securedserverspace.com}: parse error
 for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded
 (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=9oy4z4ZPVUra5pbregC8ebwCzFNp1AGSWFkC8snHIDk=; b=FeC1qSPihXD3jd/a0VdCox1wPL
	x3bbGc30WeiejzKaXFgnaWEKnpGKawZW+TtjGOE7ykDuRgrIS5HsIxPr7CYzmHCj1AE/XcWdEg8tg
	uocYuPIuRQ/uW7yb+o/09MSVdX2Mpqz3D8BQhDqrhRrInYExLhRsBrvwyYTBHhoZo1go0HB6SB+mn
	K34UVKwvY43dQLGEJiKe9DrwEidRzQjpEjMW0MMqD6fIg08ooPD9Z0UZdQ+GuqoKpH71kxTBwYKoC
	SEV+fgOm1kZwfWGyqqBgHqw8XqijE/NAs8ZBvvMZ8lv0acRsouBwKzc7MBl3oUKuaeshYymn3iM6B
	Cdu8d+iw==;
Received: from lan.nucleusys.com ([92.247.61.126]:45604 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1oaa5Q-00052a-OT;
	Tue, 20 Sep 2022 13:02:15 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH] python3-termcolor: Upgrade 1.1.0 -> 2.0.1
Date: Tue, 20 Sep 2022 13:02:08 +0300
Message-Id: <20220920100208.408905-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.superhosting.bg
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.superhosting.bg: authenticated_id:
 leon@anavi.org
X-Authenticated-Sender: voyager.superhosting.bg: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Sep 2022 10:02:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98901

Upgrade to release 2.0.1:

- Add support for Python 3.11 and PyPy
- Add support for Python 3.10
- Add type annotations to the project and run mypy on CI
- Add tests
- Refer to GitHub Releases for release notes for 2.0.0+
- Autodeploy to TestPyPI and to PyPI for GH releases
- Migrate from setuptools + setuptools_scm to hatchling + hatch-vcs
- Replace deprecated license_file with license_files in setup.cfg
- Use declarative metadata in setup.cfg
- Replace 3.9-dev with 3.9 in CI to use Python 3.9 final
- Drop support for EOL Python <= 3.6
- Remove hardcoded VERSION constant
- Update source URL

License-Update: Removed new line from the end of license file.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...-Use-setuptools-instead-of-distutils.patch | 27 -------------------
 .../python/python3-termcolor_1.1.0.bb         | 13 ---------
 .../python/python3-termcolor_2.0.1.bb         | 16 +++++++++++
 3 files changed, 16 insertions(+), 40 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-termcolor/0001-setup.py-Use-setuptools-instead-of-distutils.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-termcolor_1.1.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-termcolor_2.0.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-termcolor/0001-setup.py-Use-setuptools-instead-of-distutils.patch b/meta-python/recipes-devtools/python/python3-termcolor/0001-setup.py-Use-setuptools-instead-of-distutils.patch
deleted file mode 100644
index a55a6a914..000000000
--- a/meta-python/recipes-devtools/python/python3-termcolor/0001-setup.py-Use-setuptools-instead-of-distutils.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From e30308284c721210e2ba50d8b3d159cedf5eada8 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 28 Feb 2022 14:44:42 -0800
-Subject: [PATCH] setup.py: Use setuptools instead of distutils
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- setup.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/setup.py b/setup.py
-index c4fe4ed..dad1d29 100755
---- a/setup.py
-+++ b/setup.py
-@@ -23,7 +23,7 @@
- # Author: Konstantin Lepa <konstantin.lepa@gmail.com>
- 
- import os
--from distutils.core import setup
-+from setuptools import setup
- 
- prjdir = os.path.dirname(__file__)
- 
--- 
-2.35.1
-
diff --git a/meta-python/recipes-devtools/python/python3-termcolor_1.1.0.bb b/meta-python/recipes-devtools/python/python3-termcolor_1.1.0.bb
deleted file mode 100644
index 15bab622a..000000000
--- a/meta-python/recipes-devtools/python/python3-termcolor_1.1.0.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-SUMMARY = "ANSII Color formatting for output in terminal"
-HOMEPAGE = "https://pypi.python.org/pypi/termcolor"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=809e8749b63567978acfbd81d9f6a27d"
-
-inherit pypi setuptools3
-
-SRC_URI += "file://0001-setup.py-Use-setuptools-instead-of-distutils.patch"
-
-SRC_URI[sha256sum] = "1d6d69ce66211143803fbc56652b41d73b4a400a2891d7bf7a1cdf4c02de613b"
-
-BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python3-termcolor_2.0.1.bb b/meta-python/recipes-devtools/python/python3-termcolor_2.0.1.bb
new file mode 100644
index 000000000..47f7938f1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-termcolor_2.0.1.bb
@@ -0,0 +1,16 @@
+SUMMARY = "ANSII Color formatting for output in terminal"
+HOMEPAGE = "https://pypi.python.org/pypi/termcolor"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=e5f5f7c9b280511f124dba5dda3d180e"
+
+inherit pypi python_setuptools_build_meta
+
+SRC_URI[sha256sum] = "6b2cf769e93364a2676e1de56a7c0cff2cf5bd07f37e9cc80b0dd6320ebfe388"
+
+DEPENDS += " \
+	${PYTHON_PN}-toml-native \
+	${PYTHON_PN}-hatch-vcs-native \
+"
+
+BBCLASSEXTEND = "native"
-- 
2.30.2


