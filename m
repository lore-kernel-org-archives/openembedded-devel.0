Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6380C433EF
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:48 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.2663.1649137009652768974
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Apr 2022 22:36:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=UvfCBC7M;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649137007; i=@fujitsu.com;
	bh=U9ttvj2dkJkR0nkW/FAZ9JrJf792Jlqo3jCSNZB2tO0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=UvfCBC7MljZ7/LdUTftb1IsH7KZPSjnAQk24hcsSt1+Lcw1xtBU3mQeocAuwHOtzp
	 EHwTKIo+rd/oR5t7cpPdgYE6Am3wV+qT1QwJICu5lhktTZlr5wmqjjGZRWyWpXzc2I
	 2ERiZI0f9xJ8DevQrBqPDCGerbGSf/L3ePmUfk/7mJUxL15JJIZAsYM6xQ6TlJ0VNf
	 63IksUXmDrsgyYprLPoIySyslXMuj4r1fvjnTGzLdl5Wabs7QwpPRQzIjr1s+yEroC
	 kaatA/vS+RP3NB86Du2nC/zmsK2riqUrZFeaEpi1OQCjL1zJeIEcMHkxsdu+odZzCy
	 xhRvOK8fzu9GA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJIsWRWlGSWpSXmKPExsViZ8MxSTfvqne
  SwbKrZhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bP/3/sBe/VK3p3bmVsYPyl2MXIxSEk8IRR
  4sff1cwQzgUmie+LnzFBOLsZJbbvvcnWxcjJwSagJjH91g1WEFtEQF9i6ew9zCA2s4CKxIvfP
  exdjBwcwgJ+Eo8eq4KEWYDCTesfsoDYvAJOEqf3fGcHsSUEFCSmPHzPDFLOKeAscXpZHUhYCK
  jk6depjBDlghInZz5hgZguIXHwxQtmiFZFidmXm1kg7AqJWbPamCBsNYmr5zYxT2AUnIWkfRa
  S9gWMTKsY7ZKKMtMzSnITM3N0DQ0MdA0NTXXNTHSNTEz1Eqt0E/VSS3WTU/NKihKB0nqJ5cV6
  qcXFesWVuck5KXp5qSWbGIGhnFLs8HUH4/G+n3qHGCU5mJREec+4eicJ8SXlp1RmJBZnxBeV5
  qQWH2KU4eBQkuA9eRYoJ1iUmp5akZaZA4wrmLQEB4+SCO+Ri0Bp3uKCxNzizHSI1ClGXY6dWy
  7vZRZiycvPS5US5715BahIAKQoozQPbgQsxi8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEub
  lAZnCk5lXArfpFdARTEBHvDvjCXJESSJCSqqBKcxVwVTuypKQaX01vlPZXdWFkm7n+h7ku60b
  q1t4+r5swY0XgdN5W6TnLN9188/m+RZsDTmpRfKdu19/r9/vomH9fdFTgVUsS0prz25adUskN
  0B045n2zy+nftGZ9nNaecqFG0+ZvK+nPJ3i9tUt0pr5+2F/0T6h60c8V+1VjX38496RGSXNzx
  5/fcPrpJs36cVnw9ApbxsenC/Y179tt20P/7qz/Q/Mw+89OvPl1sOQQ97zzRevdy5XfBLh8+B
  sFm/zyne53x48XbNh9uIIad7vC6X/hD0S7J7yyXTS7tDMxf3Bq6MaJAy+Sqy+V/7zi8X+qv4r
  zNGbUmOUDL0d1Pan8N31LWXYuXXVar5D8WVKLMUZiYZazEXFiQDkZOzTbAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-528.messagelabs.com!1649137006!90006!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31585 invoked from network); 5 Apr 2022 05:36:46 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-15.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 5 Apr 2022 05:36:46 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 6B9F410044C
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  5 Apr 2022 06:36:46 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 5E9E2100440
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  5 Apr 2022 06:36:46 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 5 Apr 2022 06:36:24 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pyparted: upgrade 3.11.7 -> 3.12.0
Date: Sat, 2 Apr 2022 20:32:47 +0800
Message-ID: <1648902767-19756-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1648902767-19756-1-git-send-email-wangmy@fujitsu.com>
References: <1648902767-19756-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Apr 2022 17:24:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96401

setuptools.patch removed since it's included in 3.12.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python-pyparted/files/setuptools.patch    | 82 -------------------
 ...d_3.11.7.bb => python3-pyparted_3.12.0.bb} |  5 +-
 2 files changed, 1 insertion(+), 86 deletions(-)
 delete mode 100644 meta-python/recipes-extended/python-pyparted/files/setuptools.patch
 rename meta-python/recipes-extended/python-pyparted/{python3-pyparted_3.11.7.bb => python3-pyparted_3.12.0.bb} (79%)

diff --git a/meta-python/recipes-extended/python-pyparted/files/setuptools.patch b/meta-python/recipes-extended/python-pyparted/files/setuptools.patch
deleted file mode 100644
index 51fe8c7c56..0000000000
--- a/meta-python/recipes-extended/python-pyparted/files/setuptools.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-Upstream-Status: Submitted [https://github.com/dcantrell/pyparted/pull/85]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 3f5ca7eb6f57d8bcaa3b333497aba6e53d847450 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Fri, 14 Jan 2022 16:06:31 +0000
-Subject: [PATCH] setup.py: port to setuptools
-
-Python 3.10 has deprecated distutils[1], and it will be removed entirely
-in Python 3.12.
-
-As the setuptools API is identical, moving to setuptools is trivial by
-changing the import.
-
-Remove check_mod_version, a version specifier can be passed directly
-to pkg-config.
-
-Remove unused imports.
-
-[1] https://docs.python.org/3/whatsnew/3.10.html#distutils-deprecated
-
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- setup.py | 29 +++++++++--------------------
- 1 file changed, 9 insertions(+), 20 deletions(-)
-
-diff --git a/setup.py b/setup.py
-index da71d9c..1e9e367 100644
---- a/setup.py
-+++ b/setup.py
-@@ -25,12 +25,7 @@ import glob
- import os
- import platform
- import sys
--from distutils.ccompiler import new_compiler
--from distutils.errors import CompileError
--from distutils.errors import LinkError
--from distutils.core import setup
--from distutils.core import Extension
--from distutils.version import LooseVersion
-+from setuptools import setup, Extension
- 
- pyparted_version = '3.11.7'
- python_version = sys.version_info
-@@ -45,19 +40,13 @@ if python_version < need_python_version:
- # http://code.activestate.com/recipes/502261-python-distutils-pkg-config/
- def pkgconfig(*packages, **kwargs):
-     flag_map = {'-I': 'include_dirs', '-L': 'library_dirs', '-l': 'libraries'}
--    for token in subprocess.check_output(["pkg-config", "--libs", "--cflags"] + list(packages)).decode('utf-8').split():
--
--        kwargs.setdefault(flag_map.get(token[:2]), []).append(token[2:])
--    return kwargs
--
--def check_mod_version(module, version):
--    modversion = subprocess.check_output(["pkg-config", "--modversion", module]).decode('utf-8').split()[0]
--    if not LooseVersion(modversion) >= LooseVersion(version):
--        sys.stderr.write("*** Minimum required %s version: %s, found: %s\n" % (module, version, modversion,))
--        sys.exit(1)
--    return
--
--check_mod_version('libparted', need_libparted_version)
-+    try:
-+        for token in subprocess.check_output(["pkg-config", "--libs", "--cflags"] + list(packages),
-+                                            universal_newlines=True).split():
-+            kwargs.setdefault(flag_map.get(token[:2]), []).append(token[2:])
-+        return kwargs
-+    except subprocess.CalledProcessError as e:
-+        sys.exit("Cannot find pkg-config dependencies:\n" + e.output)
- 
- # This list is in the format necessary for the define_macros parameter
- # for an Extension() module definition.  See:
-@@ -77,6 +66,6 @@ setup(name='pyparted',
-       ext_modules=[Extension('_ped',
-                              sorted(glob.glob(os.path.join('src', '*.c'))),
-                              define_macros=features,
--                             **pkgconfig('libparted',
-+                             **pkgconfig('libparted >= %s' % need_libparted_version,
-                                          include_dirs=['include']))
-                   ])
--- 
-2.25.1
-
diff --git a/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.7.bb b/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.12.0.bb
similarity index 79%
rename from meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.7.bb
rename to meta-python/recipes-extended/python-pyparted/python3-pyparted_3.12.0.bb
index 2cdf82365a..9dd362766d 100644
--- a/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.7.bb
+++ b/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.12.0.bb
@@ -9,10 +9,7 @@ LIC_FILES_CHKSUM = "\
     file://src/_pedmodule.c;beginline=10;endline=22;md5=9e53304db812b80d0939e11bb69dcab2 \
 "
 
-SRC_URI += "file://setuptools.patch"
-
-SRC_URI[md5sum] = "69284f943982f54ded76960c92098a02"
-SRC_URI[sha256sum] = "61cde7b096bccd69ddc75c85b17f8baed45c3687d404706d91403a319453b903"
+SRC_URI[sha256sum] = "da985e116beb733371feb605b174db9eec8bd0eedffc8f739f8e603f51b521e7"
 
 inherit pkgconfig pypi setuptools3
 
-- 
2.25.1


