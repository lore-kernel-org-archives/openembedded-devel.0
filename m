Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E26DC4332F
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 17:03:51 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web08.9065.1667322221353363387
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Nov 2022 10:03:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=XGK1DZ8I;
 spf=softfail (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=m3KBcDvkt2R3hjLVsXGlOENM5HsODSFLIXLhPCqbTwk=; b=XGK1DZ8IXpw8F/Avv84JBFOP/a
	V0AgcAnT8YnJQvyMT/oEzSlV9XLHuoQAxEbEcHqRigVrBThEiMe1GxkKQKhZlz+jpUBzYlE6JXI4z
	cakN81yRsoOeWDlyeLL1LaGJ7Vipdv8tK+qrnMSqs1cPabEZdqX6rcHzK0Q6BA+0u1vbXO0KNIa5X
	0y5RxogWwsMVdA5al7pA1VUC+3rdZozcociI/Psg5HrNvHYRAifj5q3zgI/A1KLHULo2los4Z6+CF
	BETFkkbphuyewBFW0AOxRrPLeKkuf7KRG6Kn6n+rnnoVa8N7uffqCrJo/BTs54UBjPVBtoTpGYV0A
	xUIzd83w==;
Received: from lan.nucleusys.com ([92.247.61.126]:40108 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1opuhI-0005Qa-8o;
	Tue, 01 Nov 2022 19:03:39 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-automat: Upgrade 20.2.0 -> 22.10.0
Date: Tue,  1 Nov 2022 19:03:26 +0200
Message-Id: <20221101170327.1911161-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221101170327.1911161-1-leon.anavi@konsulko.com>
References: <20221101170327.1911161-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.superhosting.bg
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.superhosting.bg: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.superhosting.bg: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Nov 2022 17:03:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99397

Upgrade to release 22.10.0:

- Added double-spaces after embedded youtube links
- Add explanation for how to use assert to pacify mypy
- Allow enter to have a default
- CI improvements

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...etup.py-remove-the-dependency-on-m2r.patch | 53 -------------------
 ...t_20.2.0.bb => python3-automat_22.10.0.bb} |  7 +--
 2 files changed, 1 insertion(+), 59 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-automat/0001-setup.py-remove-the-dependency-on-m2r.patch
 rename meta-python/recipes-devtools/python/{python3-automat_20.2.0.bb => python3-automat_22.10.0.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python3-automat/0001-setup.py-remove-the-dependency-on-m2r.patch b/meta-python/recipes-devtools/python/python3-automat/0001-setup.py-remove-the-dependency-on-m2r.patch
deleted file mode 100644
index b83b7f380..000000000
--- a/meta-python/recipes-devtools/python/python3-automat/0001-setup.py-remove-the-dependency-on-m2r.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 4fb6bbfbc53428fe5d38ec3e04bb4fd187b2fd45 Mon Sep 17 00:00:00 2001
-From: Derek Straka <derek@asterius.io>
-Date: Fri, 22 Dec 2017 09:07:00 -0500
-Subject: [PATCH] setup.py: remove the dependency on m2r
-
-The dependency on m2r is removed here as it only provides the
-long_description value that is optional.  This item is just the
-text that would be present on PyPi, so it doesn't provide much
-value in this case
-
-Upstream-Status: Inappropriate (OE specific)
-
-Signed-off-by: Derek Straka <derek@asterius.io>
-Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
----
- setup.py | 10 ----------
- 1 file changed, 10 deletions(-)
-
-diff --git a/setup.py b/setup.py
-index 3fb7fdb..245d69a 100644
---- a/setup.py
-+++ b/setup.py
-@@ -4,14 +4,6 @@ Setup file for automat
- 
- from setuptools import setup, find_packages
- 
--try:
--    from m2r import parse_from_file
--    long_description = parse_from_file('README.md')
--except(IOError, ImportError):
--    print("\n\n!!! m2r not found, long_description is bad, don't upload this to PyPI !!!\n\n")
--    import io
--    long_description = io.open('README.md', encoding="utf-8").read()
--
- setup(
-     name='Automat',
-     use_scm_version=True,
-@@ -19,12 +11,10 @@ setup(
-     description="""
-     Self-service finite-state machines for the programmer on the go.
-     """.strip(),
--    long_description=long_description,
-     packages=find_packages(exclude=[]),
-     package_dir={'automat': 'automat'},
-     setup_requires=[
-         'setuptools-scm',
--        'm2r',
-     ],
-     install_requires=[
-         "attrs>=19.2.0",
--- 
-2.17.1
-
diff --git a/meta-python/recipes-devtools/python/python3-automat_20.2.0.bb b/meta-python/recipes-devtools/python/python3-automat_22.10.0.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python3-automat_20.2.0.bb
rename to meta-python/recipes-devtools/python/python3-automat_22.10.0.bb
index dbba97e76..bb29fbd4a 100644
--- a/meta-python/recipes-devtools/python/python3-automat_20.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-automat_22.10.0.bb
@@ -3,15 +3,10 @@ HOMEPAGE = "https://github.com/glyph/Automat"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4ad213bcca81688e94593e5f60c87477"
 
-SRC_URI[md5sum] = "d6cef9886b037b8857bfbc686f3ae30a"
-SRC_URI[sha256sum] = "7979803c74610e11ef0c0d68a2942b152df52da55336e0c9d58daf1831cbdf33"
+SRC_URI[sha256sum] = "e56beb84edad19dcc11d30e8d9b895f75deeb5ef5e96b84a467066b3b84bb04e"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-SRC_URI:append = " \
-    file://0001-setup.py-remove-the-dependency-on-m2r.patch \
-"
-
 PYPI_PACKAGE = "Automat"
 inherit pypi setuptools3
 
-- 
2.30.2


