Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 658CF10706D9
	for <webhook@archiver.kernel.org>; Sat, 14 Mar 2026 13:01:25 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9136.1773493282594833700
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Mar 2026 06:01:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=AwCoS56O;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20260314130120885245d1310002071d-fzo_pt@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20260314130120885245d1310002071d
        for <openembedded-devel@lists.openembedded.org>;
        Sat, 14 Mar 2026 14:01:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=NTLKQW6kxIMbpJJGaD+J+7d2sHrP6YCRLhCFFHRnbyI=;
 b=AwCoS56O8zGJY0vlDMHex357hlTyTAdINAq+/68q0FS5WQSIQpLKvf8eSqK/HQaE2BGVlZ
 pUaL8ECVX2F/Y7aZmEh0kZ4GJt2LlI60eqPC734ld35wKXcoeDY8t/XEIZf1dnU0oy8jqyuX
 1hrkheYKN6uvtE/32xNPEe3Yk37v2NvvXDKUdOKc/tKKbhXuGeXo4h9qvqTwESvkyPeF6jxD
 deBAcDMp5vf5OX0AP6cQxezTHabEsPIQf8X+X7AVW4IKGNs3xiaB3J2rwP1Czqsk5+DFguOp
 OHLwq4ugIqnIsIBbV1h6zaHGQB7d15If/nyhG66NBXdB/r5EC0SZM8YA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-python][PATCH 2/2] python3-html5lib: fix build with setuptools 82
Date: Sat, 14 Mar 2026 14:01:02 +0100
Message-Id: <20260314130102.282943-2-peter.marko@siemens.com>
In-Reply-To: <20260314130102.282943-1-peter.marko@siemens.com>
References: <20260314130102.282943-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 14 Mar 2026 13:01:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125207

From: Peter Marko <peter.marko@siemens.com>

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...g_resources-import-optional-for-Pyth.patch | 44 +++++++++++++++++++
 .../python/python3-html5lib_1.1.bb            |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-html5lib/0001-setup.py-make-pkg_resources-import-optional-for-Pyth.patch

diff --git a/meta-python/recipes-devtools/python/python3-html5lib/0001-setup.py-make-pkg_resources-import-optional-for-Pyth.patch b/meta-python/recipes-devtools/python/python3-html5lib/0001-setup.py-make-pkg_resources-import-optional-for-Pyth.patch
new file mode 100644
index 0000000000..f791b663f2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-html5lib/0001-setup.py-make-pkg_resources-import-optional-for-Pyth.patch
@@ -0,0 +1,44 @@
+From 5bae4e7b62996f1ef1b9ee6719581bde115d762c Mon Sep 17 00:00:00 2001
+From: Peter Marko <peter.marko@siemens.com>
+Date: Fri, 13 Mar 2026 13:37:58 +0100
+Subject: [PATCH] setup.py: make pkg_resources import optional for Python 3.12+
+
+pkg_resources has been removed from newer Python/setuptools versions.
+Wrap the import in a try/except block and guard the usage site,
+allowing html5lib to build without pkg_resources present.
+
+Upstream-Status: Pending
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ setup.py | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index c393c9c..e659e98 100644
+--- a/setup.py
++++ b/setup.py
+@@ -6,9 +6,13 @@ import sys
+ 
+ from os.path import join, dirname
+ from setuptools import setup, find_packages, __version__ as setuptools_version
+-from pkg_resources import parse_version
+ 
+-import pkg_resources
++try:
++    from pkg_resources import parse_version
++    import pkg_resources
++except ImportError:
++    parse_version = None
++    pkg_resources = None
+ 
+ try:
+     import _markerlib.markers
+@@ -49,7 +53,7 @@ if _markerlib and sys.version_info[0] == 3:
+ # Avoid the very buggy pkg_resources.parser, which doesn't consistently
+ # recognise the markers needed by this setup.py
+ # Change this to setuptools 20.10.0 to support all markers.
+-if pkg_resources:
++if pkg_resources and parse_version:
+     if parse_version(setuptools_version) < parse_version('18.5'):
+         MarkerEvaluation = pkg_resources.MarkerEvaluation
+ 
diff --git a/meta-python/recipes-devtools/python/python3-html5lib_1.1.bb b/meta-python/recipes-devtools/python/python3-html5lib_1.1.bb
index 3d7e44b87e..9c92164546 100644
--- a/meta-python/recipes-devtools/python/python3-html5lib_1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-html5lib_1.1.bb
@@ -3,6 +3,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1ba5ada9e6fead1fdc32f43c9f10ba7c"
 
 SRC_URI += "file://0001-setup.py-fix-version-parsing-on-Python-3.14-ast.Str-.patch"
+SRC_URI += "file://0001-setup.py-make-pkg_resources-import-optional-for-Pyth.patch"
 SRC_URI[sha256sum] = "b2e5b40261e20f354d198eae92afc10d750afb487ed5e50f9c4eaf07c184146f"
 
 inherit pypi setuptools3

