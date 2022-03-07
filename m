Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF5A3C4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 11:47:07 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web12.25290.1646653626555267311
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Mar 2022 03:47:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=EP5gJCln;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646653624; i=@fujitsu.com;
	bh=NMc0yLn2EzyH++glBGlL/0hrYLSwUcdpv2fWJ7NUZ/o=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=EP5gJClnCeeizK3f7Ilp9Tv9JJ+1kkA3RoQ0iYOajXWtyXodh0hKpDs5JTn8XccnA
	 wOAWPHa3HKnWxMD3fu6xOZYe2/9jGRdQ/fxXxAbIhTtaN0axwecJnlG4swlVaDvNem
	 tx9pPzK17AM8MNEkNd7lcqSzV9JzhgL5mM/w+zWp12X/1OYvnmKyMD2LWRYmdETsDA
	 2cqJdrb5DodCfnQfjWAGziOmBRXMtkzAHIj4ZfcSFxZtxAtgAiBC4PdxfMxMzCBgmR
	 KN1zuk3fbSids+LQiChC/5RMc4O+Fcad3/vM1jaWyLtLOmIQ80Mec3p7lXNJXTrj10
	 KOwAHeyaQybIg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRWlGSWpSXmKPExsViZ8ORqLvjg2q
  SwfPpjBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8ab5a9YCs7LVDz6cp+xgXGBRBcjF4eQwBNG
  iY+r25kgnAtMEr83nmSDcI4zSky5s4a1i5GTg01ATWL6rRtgtoiAvsTS2XuYQWxmARWJF7972
  EFsYQFXiSMvzoPZLEDxuRvfMoHYvAJOEpdP7QPrlRBQkJjy8D0zRFxQ4uTMJywQcyQkDr54wQ
  xRoygx+3IzC4RdITFrVhsThK0mcfXcJuYJjPyzkLTPQtK+gJFpFaNVUlFmekZJbmJmjq6hgYG
  uoaGprqmukZGpXmKVbqJeaqlueWpxia6hXmJ5sV5qcbFecWVuck6KXl5qySZGYFimFLM+3MG4
  uO+n3iFGSQ4mJVHelAWqSUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeD+9AcoJFqWmp1akZeYAY
  wQmLcHBoyTCe/wSUJq3uCAxtzgzHSJ1ilFRSpyXExhZQgIgiYzSPLg2WFxeYpSVEuZlZGBgEO
  IpSC3KzSxBlX/FKM7BqCTMq/MeaApPZl4J3PRXQIuZgBZX2SqBLC5JREhJNTC5vM+/HGXczhk
  bdcEjesKesAnxHDHZ55flxDSe6t8z6cqCzB37D3N/k+1b839eVFFIvymj46Wkzg7OW2mrdgj9
  Vmllv5J3JsT1mMJ2o59PeDZlKLfPP/ZO6/MEOQVn94WPOJOu8b84d9xzUf5xr/iJPJmu/80Fo
  tLtArxMzrFYVPnHGyuHOC0+IFNwru3kn0W/9su3Hr2WO3Pe05ygx/8MPO8vvjMpXtiq/EXaIr
  k0X+aw9SrxTxQL8udutdp1L9HpfOqX06HR3Edkc1pPFm38vcr6o8u2q8yPvZmnunj5Lj4ey/x
  OJuV/XDfvyxAVj+YfTq++NQc8u9U062nfkbMfJ/jvmlDnLz3njrTPSiklluKMREMt5qLiRAD6
  Uch7RgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-591.messagelabs.com!1646653623!10251!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14309 invoked from network); 7 Mar 2022 11:47:03 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-14.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Mar 2022 11:47:03 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 8154C1001A3
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  7 Mar 2022 11:47:03 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 71F54100184
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  7 Mar 2022 11:47:03 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 7 Mar 2022 11:46:52 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-icu: upgrade 2.8 -> 2.8.1
Date: Mon, 7 Mar 2022 19:46:39 +0800
Message-ID: <1646653602-55882-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Mar 2022 11:47:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95839

refresh 0001-Fix-host-contamination-of-include-files.patch
for new version.

License-Update: year updated to 2022.

Changelog:
=========
  - renamed _icu extension module to _icu_ and moved it into icu module
  - moved icu python module sources into py directory
  - deleted long deprecated PyICU.py file

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...001-Fix-host-contamination-of-include-files.patch | 12 +++++-------
 .../{python3-icu_2.8.bb => python3-icu_2.8.1.bb}     |  4 ++--
 2 files changed, 7 insertions(+), 9 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-icu_2.8.bb => python3-icu_2.8.1.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-icu/0001-Fix-host-contamination-of-include-files.patch b/meta-python/recipes-devtools/python/python3-icu/0001-Fix-host-contamination-of-include-files.patch
index c45217a88..36485d56c 100644
--- a/meta-python/recipes-devtools/python/python3-icu/0001-Fix-host-contamination-of-include-files.patch
+++ b/meta-python/recipes-devtools/python/python3-icu/0001-Fix-host-contamination-of-include-files.patch
@@ -1,4 +1,4 @@
-From 8abf79f77d9151d6786da3c8e868117822bce6d4 Mon Sep 17 00:00:00 2001
+From a82fea9663f0c70cf57cd06650f400e878afc5e4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 16 Apr 2021 10:48:36 -0700
 Subject: [PATCH] Fix host contamination of include files
@@ -10,12 +10,13 @@ Also, don't use icu-config
 Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Armin Kuster <akuster808@gmail.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  setup.py | 3 +--
  1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/setup.py b/setup.py
-index e647db4..abed399 100644
+index d308b80..56e9c74 100644
 --- a/setup.py
 +++ b/setup.py
 @@ -81,7 +81,7 @@ Building PyICU %s for ICU %s (max ICU major version supported: %s)
@@ -27,14 +28,11 @@ index e647db4..abed399 100644
      'freebsd': False, # not tested
      'win32': False,   # no icu-config
      'sunos5': False,  # not tested
-@@ -267,7 +267,6 @@ setup(name="PyICU",
-       ext_modules=[Extension('_icu',
+@@ -273,7 +273,6 @@ setup(name="PyICU",
+       ext_modules=[Extension('icu._icu_',
                               [filename for filename in sorted(os.listdir(os.curdir))
                                if filename.endswith('.cpp')],
 -                             include_dirs=_includes,
                               extra_compile_args=_cflags,
                               extra_link_args=_lflags,
                               libraries=_libraries)],
--- 
-2.31.1
-
diff --git a/meta-python/recipes-devtools/python/python3-icu_2.8.bb b/meta-python/recipes-devtools/python/python3-icu_2.8.1.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-icu_2.8.bb
rename to meta-python/recipes-devtools/python/python3-icu_2.8.1.bb
index f3dd7a4f5..09543d753 100644
--- a/meta-python/recipes-devtools/python/python3-icu_2.8.bb
+++ b/meta-python/recipes-devtools/python/python3-icu_2.8.1.bb
@@ -3,12 +3,12 @@ HOMEPAGE = "https://gitlab.pyicu.org/main/pyicu"
 BUGTRACKER = "https://gitlab.pyicu.org/main/pyicu/-/issues"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c7c4bfd81a21e3b6368bdcced992bf59"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0724597863f1581ab01429e0423e779f"
 
 DEPENDS += "icu"
 
 PYPI_PACKAGE = "PyICU"
-SRC_URI[sha256sum] = "3d80de47045a8163db5aebc947c42b4d429eeea4f0c32af4f40b33981fa872b9"
+SRC_URI[sha256sum] = "f0b9549a87f87ba7c413f13679d137271e0b37f1f39b0109ace38257d4d148d6"
 
 SRC_URI += "file://0001-Fix-host-contamination-of-include-files.patch"
 
-- 
2.25.1


