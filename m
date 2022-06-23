Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0773BC433EF
	for <webhook@archiver.kernel.org>; Thu, 23 Jun 2022 07:15:07 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web11.4608.1655968502369191246
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jun 2022 00:15:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ILFlc1ES;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655968500; i=@fujitsu.com;
	bh=O6TWhbFEx/+9x/G7IA1AtZSN5g/qeQKpkr8LeevsgZc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ILFlc1ESS0mHuCWespUxOAbTsPvNRyxi5a2NBhMvInpOYkQ+7yW0nqwtLbILcduD9
	 RTNNsK8zdloicFugt8fxPTIAsfddQmv4iXkFf9sjP0HxFgB7za48BFwMQgZVN0++x9
	 yvV+/VdCHf/5sFE+aTOazc8y4YyHlo2bZUaQaimxndWBWBF/U+bqPM9ZdROQcmrdii
	 /eh0yi2PuEqu9pxOkyTAXeBSTgIR2vAKug8iLTIdca60fKdDwy2l4Mx0IIV7R1ivcG
	 +PMto32wDXLW1FJ3yTrTE7zUYGmz0jMd5MEjzFSDF3NSkOLigytJ1Fe/BxTigUJwzT
	 Wy8cH+hspH60Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEIsWRWlGSWpSXmKPExsViZ8ORpPtFaEu
  SwYrDXBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8a89xoFV+Qqnn1/wtbAeEW6i5GLQ0jgIaPE
  2Ulz2SCcW0wSR5teMkE4exgl3i5aCZTh5GATUJOYfusGK4gtIqAvsXT2HmYQm1lAReLF7x52E
  FtYIEFi99u5TCA2i4CqRNuEV2D1vAKOEot2nGUBsSUEFCSmPHwP1ssp4CTR8vEoUD0H0DJHid
  fv1CHKBSVOznzCAjFeQuLgixfMEK2KErMvN0ONqZCYMWMbG4StJnH13CbmCYyCs5C0z0LSvoC
  RaRWjdVJRZnpGSW5iZo6uoYGBrqGhqa6xqa6hiaVeYpVuol5qqW55anGJrpFeYnmxXmpxsV5x
  ZW5yTopeXmrJJkZgEKcUK0/dwXh61U+9Q4ySHExKorxbBbYkCfEl5adUZiQWZ8QXleakFh9il
  OHgUJLgvcQPlBMsSk1PrUjLzAFGFExagoNHSYR3Dkiat7ggMbc4Mx0idYrRkmPq7H/7mTmWg8
  mZX9sOMAux5OXnpUqJ8zawATUIgDRklObBjYNF/SVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIx
  KwrwfQS7mycwrgdv6CuggJqCDnizfAHJQSSJCSqqBKUS1yuGwa5LNqbVisStPsHlnMJ9KKW/6
  tbppXVVfe8EVnZNLQ+Ifs4YyKWRMfHiid9WDfAfmx36XSu+xW/0+4LuX/7rikpnsuh8fWvq0G
  jZPWTrr3PtMxbPvJ2vPWCOXfYxfcs2hd1lzrESaZVX0pB99bFUMD8rml9mxycLxzKp5i8Rkv2
  68Ou1ThUbYqp3TjrzQcargkp1sc04uwEzTqr161yTL6apGKueOf4+RWzHFoS1rRudaBYdfTR3
  SC/9OVbRLvXhG4dIShykmFVHpLYpqhu8fpS+fvLtgHqtB8b09IR++Vr5ftJ/p/Cltid7UJc2H
  3r+z/q+5eeqcFce2eoWoljgHdoe+L3vNz/Q6WYmlOCPRUIu5qDgRAE/lbzB1AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-571.messagelabs.com!1655968499!42568!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19102 invoked from network); 23 Jun 2022 07:15:00 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-21.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Jun 2022 07:15:00 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id C02FA1AF
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jun 2022 08:14:59 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown10-183-43-178
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id B3FA91AB
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jun 2022 08:14:59 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 23 Jun 2022 08:14:58 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-robotframework-seriallibrary:
 upgrade 0.3.1 -> 0.4.3
Date: Thu, 23 Jun 2022 15:14:44 +0800
Message-ID: <1655968487-3652-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655968487-3652-1-git-send-email-wangmy@fujitsu.com>
References: <1655968487-3652-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Jun 2022 07:15:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97585

e31d5fdf2ea00ac6349e64580a20816783064dd4.patch
removed since it's not available in 0.4.3

License-Update:
 version updated to 0.4.3
 The content location of the description of the license has changed

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...5fdf2ea00ac6349e64580a20816783064dd4.patch | 45 -------------------
 ...on3-robotframework-seriallibrary_0.4.3.bb} |  7 +--
 2 files changed, 2 insertions(+), 50 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-robotframework-seriallibrary/e31d5fdf2ea00ac6349e64580a20816783064dd4.patch
 rename meta-python/recipes-devtools/python/{python3-robotframework-seriallibrary_0.3.1.bb => python3-robotframework-seriallibrary_0.4.3.bb} (53%)

diff --git a/meta-python/recipes-devtools/python/python3-robotframework-seriallibrary/e31d5fdf2ea00ac6349e64580a20816783064dd4.patch b/meta-python/recipes-devtools/python/python3-robotframework-seriallibrary/e31d5fdf2ea00ac6349e64580a20816783064dd4.patch
deleted file mode 100644
index 21e97fd93..000000000
--- a/meta-python/recipes-devtools/python/python3-robotframework-seriallibrary/e31d5fdf2ea00ac6349e64580a20816783064dd4.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From e31d5fdf2ea00ac6349e64580a20816783064dd4 Mon Sep 17 00:00:00 2001
-From: Hideki Takeoka <hideki.takeoka@smartfrog.com>
-Date: Sun, 25 Aug 2019 19:25:00 +0200
-Subject: [PATCH] Update setup.py for python3.7+ support
-
----
- setup.py                     | 9 +++++----
- src/SerialLibrary/version.py | 3 +++
- 2 files changed, 8 insertions(+), 4 deletions(-)
-
-diff --git a/setup.py b/setup.py
-index 4c34705..70bb1af 100644
---- a/setup.py
-+++ b/setup.py
-@@ -1,6 +1,5 @@
- #!/usr/bin/env python
- 
--from imp import load_source
- from os.path import abspath, dirname, join
- from sys import platform
- 
-@@ -18,9 +17,11 @@
- 
- 
- CURDIR = dirname(abspath(__file__))
--VERSION = load_source(
--    'version', 'version',
--    open(join(CURDIR, 'src', 'SerialLibrary', 'version.py'))).VERSION
-+
-+with open(join(CURDIR, 'src', 'SerialLibrary', 'version.py')) as f:
-+    exec(f.read())
-+    VERSION = get_version()
-+
- README = open(join(CURDIR, 'README.rst')).read()
- CLASSIFIERS = '\n'.join(
-     map(' :: '.join, [
-diff --git a/src/SerialLibrary/version.py b/src/SerialLibrary/version.py
-index 6ce65c4..19831bc 100644
---- a/src/SerialLibrary/version.py
-+++ b/src/SerialLibrary/version.py
-@@ -1 +1,4 @@
- VERSION = (0, 3, 1)
-+
-+def get_version():
-+    return VERSION;
diff --git a/meta-python/recipes-devtools/python/python3-robotframework-seriallibrary_0.3.1.bb b/meta-python/recipes-devtools/python/python3-robotframework-seriallibrary_0.4.3.bb
similarity index 53%
rename from meta-python/recipes-devtools/python/python3-robotframework-seriallibrary_0.3.1.bb
rename to meta-python/recipes-devtools/python/python3-robotframework-seriallibrary_0.4.3.bb
index d9465af08..4ad5c3601 100644
--- a/meta-python/recipes-devtools/python/python3-robotframework-seriallibrary_0.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-robotframework-seriallibrary_0.4.3.bb
@@ -1,17 +1,14 @@
 SUMMARY = "Robot Framework test library for serial connection"
 HOMEPAGE = "https://github.com/whosaysni/robotframework-seriallibrary"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=7145f7cdd263359b62d342a02f005515"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=1af2e051b493d9552af443cf2f99d480"
 
-SRC_URI[md5sum] = "b7c9565d54c30df7cd3f3c0e29adffa3"
-SRC_URI[sha256sum] = "256ad60fc0b7df4be44d82c302f5ed8fad4935cda99e4b45942e3c88179d1e19"
+SRC_URI[sha256sum] = "f20befe5c1106dd8ddca9f60a2f18bf5ec7d5f06f6f09a03fa66bae54777e6bb"
 
 PYPI_PACKAGE = "robotframework-seriallibrary"
 
 inherit pypi setuptools3
 
-SRC_URI += "file://e31d5fdf2ea00ac6349e64580a20816783064dd4.patch"
-
 RDEPENDS:${PN} += " \
     ${PYTHON_PN}-pyserial \
     ${PYTHON_PN}-robotframework \
-- 
2.25.1


