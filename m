Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B983C636D4
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 08:13:05 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.3791.1675843975451818146
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Feb 2023 00:12:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=PprmAkWu;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1675843976; i=@fujitsu.com;
	bh=ABnIHUzPVNgQ6r8wkLecDrtbyDvpDjQ2FsDqdNQCf4c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=PprmAkWuoRs7HeUUM/Jz8kxAoDzoWljIe46WPzmDdAwSQPHwSOyLleUftyDxtG6qF
	 khLLky+Y66CnagtqLeWp5VR1QnIOmyJ09Pane5H/wP277xYmjEExfJEVgX3q0F1RgA
	 PHs0syV/Zu7mVzFlC5VWK2uDYLuTr4FMENW4qW+NjdxWMqlJdf+215t+qZVIFZSPZ1
	 9l5HlgJtldiDlCERyqfHeEw+8hSqIMBFt+8l7yJD+cC7qJzljc+s6FNWu6t00VT6ks
	 3OWUDfv70tfTOoElQjI23KBBd1qAtsopZDqI99Sn4wJZNylECYoQBVrLo6Bokgoe2/
	 mbZXfafRWVtVg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8ORpNse+Tj
  Z4M9/K4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWP3c86CfvmKf0ebmBoYd0l1MXJxCAk8ZJTY
  /riLDcK5yiRxet4sJghnD6PE3AXfmbsYOTnYBKQkbtz/zwZiiwjoSyydvQcsziygIvHidw87i
  C0s4CHx8Ok8sDgLUPzg0S1gcV4BJ4kjk5oZQWwJAQWJKQ/fg9VwCjhL3H3ayQJiCwHVNLV+ZI
  KoF5Q4OfMJC8R8CYmDL14wQ/QqSsy+3MwCYVdKtH74BWWrSVw9t4l5AqPgLCTts5C0L2BkWsV
  oVpxaVJZapGuul1SUmZ5RkpuYmaOXWKWbqJdaqpuXX1SSoWuol1herJdaXKxXXJmbnJOil5da
  sokRGLwpxamcOxhX9v3VO8QoycGkJMrrKfY4WYgvKT+lMiOxOCO+qDQntfgQowwHh5IEb0Q4U
  E6wKDU9tSItMwcYSTBpCQ4eJRHeyFCgNG9xQWJucWY6ROoUoy7Hh0NX9jILseTl56VKifNeBZ
  khAFKUUZoHNwIW1ZcYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfMGhAFN4cnMK4Hb9AroCCa
  gI0JUH4IcUZKIkJJqYLIW+Kuz44nqSrW7pkcVRSTTarQTl1Sv5LsnH3H87Yz9P1e0tnx79iKv
  zDZc2TPu0ubVG3nMe5s36l/0bCkrn7T2bOekqETv0LO/IrbvL10pb760Zjdro32p+MHNt/5f8
  TDULoupZ1sxMZQ/cFsca/4eM8ZLFkYiMx4si5Jgmtb2zb9ce8PUpPZlkwSV/+6ZITE1wEf9x6
  +nuzpbF/TcFbSqUdOvnLuEZ9GFcmbVqeeaNvC/3ZDaWXm48cGXqD+9p9+7ePtu3yHxTLpE3/t
  06bHn66dPX79Uw+76+7pst305T/tYAk251knz/JjvrBm741XixZabjWH8ZmE+DMFnON5r72uL
  WbG7Kz/7pr18sxJLcUaioRZzUXEiAAkzZfplAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-732.messagelabs.com!1675843975!395185!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18809 invoked from network); 8 Feb 2023 08:12:55 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-8.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Feb 2023 08:12:55 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 5F17A1AD
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Feb 2023 08:12:55 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 537F01AE
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Feb 2023 08:12:55 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 8 Feb 2023 08:12:53 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-icu: upgrade 2.8.1 -> 2.10.2
Date: Wed, 8 Feb 2023 16:12:40 +0800
Message-ID: <1675843963-11324-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1675843963-11324-1-git-send-email-wangmy@fujitsu.com>
References: <1675843963-11324-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Feb 2023 08:13:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100984

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Fix-host-contamination-of-include-files.patch
updated for 2.10.2

Changelog:
==========
  - fixed bug in logic computing max_char for PyUnicode_New()
  - fixed build issues with ICU < 72
  - fixed bug with building on MacOS when pkg-config is present
  - added link to note about building everything from sources
  - added wrapper for u_cleanup/u_init sequence as ResourceBundle.resetICU()
  - added wrapper for TimeZone.getRegion()
  - added support for ICU 72.1
  - added wrapper for UnicodeSetIterator::skipToStrings()
  - added wrapper for DisplayOptions, DisplayOptions::Builder and related enums
  - added wrapper for FormattedNumber::getNounClass()
  - added wrapper for NumberFormatter.displayOptions()
  - added support for ICU 71.1
  - added wrappers for UMeasurePrefix, MeasureUnit.withPrefix()|getPrefix()
  - added UNumberRoundingPriority, FractionPrecision.withSignificantDigits()
  - added UNumberTrailingZeroDisplay, Precision.trailingZeroDisplay()

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...01-Fix-host-contamination-of-include-files.patch | 13 ++++++++-----
 .../{python3-icu_2.8.1.bb => python3-icu_2.10.2.bb} |  2 +-
 2 files changed, 9 insertions(+), 6 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-icu_2.8.1.bb => python3-icu_2.10.2.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-icu/0001-Fix-host-contamination-of-include-files.patch b/meta-python/recipes-devtools/python/python3-icu/0001-Fix-host-contamination-of-include-files.patch
index 36485d56c..7bb5ee58c 100644
--- a/meta-python/recipes-devtools/python/python3-icu/0001-Fix-host-contamination-of-include-files.patch
+++ b/meta-python/recipes-devtools/python/python3-icu/0001-Fix-host-contamination-of-include-files.patch
@@ -10,25 +10,25 @@ Also, don't use icu-config
 Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Armin Kuster <akuster808@gmail.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
 ---
  setup.py | 3 +--
  1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/setup.py b/setup.py
-index d308b80..56e9c74 100644
+index 176c9ab..0a10268 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -81,7 +81,7 @@ Building PyICU %s for ICU %s (max ICU major version supported: %s)
+@@ -68,7 +68,7 @@ elif platform.startswith('freebsd'):
  
  CONFIGURE_WITH_ICU_CONFIG = {
-     'darwin': True,
+     'darwin': False,
 -    'linux': True,
 +    'linux': False,
      'freebsd': False, # not tested
      'win32': False,   # no icu-config
      'sunos5': False,  # not tested
-@@ -273,7 +273,6 @@ setup(name="PyICU",
+@@ -277,7 +277,6 @@ setup(name="PyICU",
        ext_modules=[Extension('icu._icu_',
                               [filename for filename in sorted(os.listdir(os.curdir))
                                if filename.endswith('.cpp')],
@@ -36,3 +36,6 @@ index d308b80..56e9c74 100644
                               extra_compile_args=_cflags,
                               extra_link_args=_lflags,
                               libraries=_libraries)],
+-- 
+2.34.1
+
diff --git a/meta-python/recipes-devtools/python/python3-icu_2.8.1.bb b/meta-python/recipes-devtools/python/python3-icu_2.10.2.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-icu_2.8.1.bb
rename to meta-python/recipes-devtools/python/python3-icu_2.10.2.bb
index 027ef129e..cbcc2f87b 100644
--- a/meta-python/recipes-devtools/python/python3-icu_2.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-icu_2.10.2.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0724597863f1581ab01429e0423e779f"
 DEPENDS += "icu"
 
 PYPI_PACKAGE = "PyICU"
-SRC_URI[sha256sum] = "f0b9549a87f87ba7c413f13679d137271e0b37f1f39b0109ace38257d4d148d6"
+SRC_URI[sha256sum] = "0c3309eea7fab6857507ace62403515b60fe096cbfb4f90d14f55ff75c5441c1"
 
 SRC_URI += "file://0001-Fix-host-contamination-of-include-files.patch"
 
-- 
2.34.1


