Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8413FC5479D
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 03:29:18 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web11.55585.1672716554853276382
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Jan 2023 19:29:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Y9PexiYr;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1672716553; i=@fujitsu.com;
	bh=+4VNfp0uE1CJF+KhB1gML0oUI4GOCodI/xvMRXzoVR8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Y9PexiYrN1cnTQpnmADXFkDwh7PKDeySk6REICThrbGodaC0r4slcaq+IRZ2WIV2S
	 cY9sRv20A+WIYXh6/NDJPxUT6lpPW3bR1rMB3fk2Jy1gSDNmcY0VH4ziNa9711rnlB
	 KoQhXC4DH6ZszQz/jvDfAuDpXYsmLBHh53TIPjqqN+Hhe4/g4vfwpQ6lgBGnLgPDIT
	 ZwtPydwGOzy0/4y6ETL88qk3dpSBBOUIMDbFUIuaMQEncj1CzUDEuFgV5BmcHaMHle
	 S/d76QbyKTTIqNOc6kzpe6yGn0jlogpHlwliBZRg6z2FkrH9B0Y9qKaradJS4JuFZ7
	 ObHt7xIq1iC9g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrLIsWRWlGSWpSXmKPExsViZ8ORpMuxcHO
  ywY6JYhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bl+6EFW60q/k1ZyNbA+Nywi5GLQ0jgIaPE
  pdddTBDOZSaJb7fWsUA4uxkl9u/4zdzFyMnBJiAlceP+fzYQW0RAX2Lp7D1gcWYBFYkXv3vYQ
  WxhAXeJhuO7wWpYBFQljvd0MYLYvAJOEpdXzwSrkRBQkJjy8D1YL6eAs8T23g9g9UJANecu/G
  GGqBeUODnzCQvEfAmJgy9eMEP0KkrMvtzMAmFXSMya1cYEYatJXD23iXkCo+AsJO2zkLQvYGR
  axWhanFpUllqka6SXVJSZnlGSm5iZo5dYpZuol1qqW55aXAKUSSwv1kstLtYrrsxNzknRy0st
  2cQIDN2UYoXvOxi7l/7RO8QoycGkJMpbvndTshBfUn5KZUZicUZ8UWlOavEhRhkODiUJXp75m
  5OFBItS01Mr0jJzgHEEk5bg4FES4T00DyjNW1yQmFucmQ6ROsVoyXF34d69zBzfv10EkpsOX9
  nLLMSSl5+XKiXOKzIXqEEApCGjNA9uHCzWLzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5p0
  PchVPZl4J3NZXQAcxAR2UtGYjyEEliQgpqQamaRIH9Q8uUpl8oCX1sOzEkj07RdeZy0wz+F/9
  15Ndb/69kNt2+wxbq9cGb/Gyiq3M8Szaf3dvJZt65v+bEtd23452tai5ZV9udVfYOFO66v777
  dmLov70n/Wcw/LPccI8vh1bw9d3PuiyZrrw5c8cu66i5aZ2TprbPhq/yZ+btWPlPWPtW/svzI
  qv/7RkevYcQW6h/+oyv23lzZYLbNVUCt0r2j/RfV92ur7h6e/cC39xPZ282SNE+UiA4oIKkz2
  qkp93WqzYu+Ne3h4OxQXvzApYDH4zK02ZGxJX8GPPTq4H7jkT4sXfR2jq3ZhWN7vVOzs/krl/
  Ye8FiTj+46+eBTD0vzxqXtT3Y9c2BiURJZbijERDLeai4kQAB2zkV3ADAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-565.messagelabs.com!1672716552!294381!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 774 invoked from network); 3 Jan 2023 03:29:12 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-22.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Jan 2023 03:29:12 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 152731AE
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Jan 2023 03:29:12 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 09D667B
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Jan 2023 03:29:12 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 3 Jan 2023 03:29:10 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] fontforge: upgrade 20220308 -> 20230101
Date: Thu, 29 Dec 2022 12:45:32 +0800
Message-ID: <1672289132-16078-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1672289132-16078-1-git-send-email-wangmy@fujitsu.com>
References: <1672289132-16078-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Jan 2023 03:29:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100349

From: Wang Mingyu <wangmy@fujitsu.com>

0001-cmake-Use-alternate-way-to-detect-libm.patch
refreshed for newversion.

Changelog:
==========
    Display the block name for reserved code points by4934
    Don't respond to wheel scrolls for buttons/tabsets by4940
    gfilechooser.c: fix behaviour when changing file type by4939
    Better control-drag handling for line-adjacent points by4945
    Fix resolution of program root by4956
    Fix missed nonextcp edit by4958
    Support ToUnicode extraction from PDFs for Type3 fonts by4961
    Add resource file and Windows application manifest by4950
    Fix name extraction for Type3 fonts from pdfs by4960
    cmake: Install fonttools and pycontrib by4941
    Fix InfoPlist.strings file name. by4962
    Fix normalisation of absolute paths by4963
    Handle non-array cm transforms while reading graphics stream from PDFs by4965
    Fix rect extraction from graphics stream for type3 fonts by4967
    Change which lookup types are suggested for jamo features by4994
    Better line handling in simplify by4981
    Use 'cmap' for Adobe-Identity-0 CID fonts by4993
    Fix ChangeGlyph calcluations relative to new nonext/prevcp conventions by4979
    Docs composite glyph by4971
    FVSplineFontPieceMeal: Check that the clut is present before applying conversion by4999
    Expand the lists of languages and scripts by4982
    Add flags to Python font.transform() by4980
    Support setting SplineChar width from importOutlines. by5005
    Undefine "extended" macro temporarily on GNU Hurd by5047
    Define PATH_MAX and MAXPATHLEN for GNU/Hurd compatibility by5046
    Fix Ascent & Descent Importing from SVG Font by5035
    Prevent floating point shenanigans in loop termination (fixes #5012) by5013
    GroupFindLPos() in fontforgeexe/groupsdlg.c null pointer fix by5025
    Fix drawing outside of expose calls by4949
    Fixed one more typo by5055
    Upgrade GitHub Actions by5014
    Prevents memory underflow in GFileMimeType() in gutils/fsys.c by5018
    Add a preference for saving editor state by5044
    splineutil.c: prevent hang on nan input by5058
    Shell-quote command sent to compressor in BDF by5060
    Fix pfadecrypt bugs by5074
    Include SFDUTF7 functions in libfontforge.so by5078
    splinefit.c: Improvements to merge/simplify by5095
    RFE: [FEAT] When reference to non-existent glyphs are present in an OpenTy by4097
    docs: Python scripting - update font.mergeFeature with details of boo by5107
    Fix logic for CharString double-movetos after PR 4685 by5120
    Upgrade to Unicode 15.0.0 and fix and expand the script lists by5110
    Fix broken link on scripting page by5135
    Fix typo in man page by5106
    Fix painting behaviour of the ruler linger window and layer change dialog by5163
    fontinfo.c: fix crash from uninitialised other_pos by5165
    tottfgpos: Fix needless warning about 16-bit field by5136
    ufo.c: emit guidelines key by5166
    fvmetrics.c: partial revert of 1033bc6 by5167
    Update tranlsations from Crowdin by5168
    Fix woff2 decoding by5160
    Record unicode cmap encodings when one glyph is in multiple slots by4586

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ake-Use-alternate-way-to-detect-libm.patch | 24 +++++++++++++------
 ...orge_20220308.bb => fontforge_20230101.bb} |  2 +-
 2 files changed, 18 insertions(+), 8 deletions(-)
 rename meta-oe/recipes-graphics/fontforge/{fontforge_20220308.bb => fontforge_20230101.bb} (96%)

diff --git a/meta-oe/recipes-graphics/fontforge/fontforge/0001-cmake-Use-alternate-way-to-detect-libm.patch b/meta-oe/recipes-graphics/fontforge/fontforge/0001-cmake-Use-alternate-way-to-detect-libm.patch
index dd799e748..573866eb1 100644
--- a/meta-oe/recipes-graphics/fontforge/fontforge/0001-cmake-Use-alternate-way-to-detect-libm.patch
+++ b/meta-oe/recipes-graphics/fontforge/fontforge/0001-cmake-Use-alternate-way-to-detect-libm.patch
@@ -1,4 +1,4 @@
-From 6d3c48d1b01943a467928235c3affbab463c25ab Mon Sep 17 00:00:00 2001
+From 644c3380f75b20a11755e7052aa632887f3eee2b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 7 Jul 2022 12:32:47 -0700
 Subject: [PATCH] cmake: Use alternate way to detect libm
@@ -8,17 +8,20 @@ when libm is folded into libc starting glibc 2.35+
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  CMakeLists.txt                   | 7 ++++++-
  contrib/fonttools/CMakeLists.txt | 2 +-
  fontforge/CMakeLists.txt         | 2 +-
- fontforgeexe/CMakeLists.txt      | 4 ++--
- 4 files changed, 10 insertions(+), 5 deletions(-)
+ fontforgeexe/CMakeLists.txt      | 2 +-
+ 4 files changed, 9 insertions(+), 4 deletions(-)
 
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index e234cb6e9..284ba2d20 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -111,9 +111,14 @@ find_package_with_target(Intl REQUIRED)
- find_package(GLIB 2.6 REQUIRED COMPONENTS gio gobject)
+@@ -115,9 +115,14 @@ else()
+ endif()
  find_package(Iconv REQUIRED)
  find_package(LibXml2 REQUIRED)
 -find_package(MathLib REQUIRED)
@@ -33,9 +36,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  check_include_file(pthread.h HAVE_PTHREAD_H)
  if(HAVE_PTHREAD_H)
    find_package(Threads)
+diff --git a/contrib/fonttools/CMakeLists.txt b/contrib/fonttools/CMakeLists.txt
+index d6c698877..1608af152 100644
 --- a/contrib/fonttools/CMakeLists.txt
 +++ b/contrib/fonttools/CMakeLists.txt
-@@ -15,6 +15,6 @@ add_executable(woff woff.c)
+@@ -15,7 +15,7 @@ add_executable(woff woff.c)
  
  target_link_libraries(acorn2sfd PRIVATE fontforge)
  target_link_libraries(dewoff PRIVATE ZLIB::ZLIB)
@@ -43,6 +48,9 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +target_link_libraries(pcl2ttf PRIVATE ${EXTRA_LIBS})
  target_link_libraries(ttf2eps PRIVATE fontforge)
  target_link_libraries(woff PRIVATE ZLIB::ZLIB)
+ 
+diff --git a/fontforge/CMakeLists.txt b/fontforge/CMakeLists.txt
+index 9a052f360..067ef40df 100644
 --- a/fontforge/CMakeLists.txt
 +++ b/fontforge/CMakeLists.txt
 @@ -237,7 +237,7 @@ target_link_libraries(fontforge
@@ -54,9 +62,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
      Iconv::Iconv
      ZLIB::ZLIB
  )
+diff --git a/fontforgeexe/CMakeLists.txt b/fontforgeexe/CMakeLists.txt
+index e2982c39d..8829993ea 100644
 --- a/fontforgeexe/CMakeLists.txt
 +++ b/fontforgeexe/CMakeLists.txt
-@@ -110,7 +110,7 @@ if(ENABLE_PYTHON_SCRIPTING_RESULT)
+@@ -121,7 +121,7 @@ if(ENABLE_PYTHON_SCRIPTING_RESULT)
    target_link_libraries(fontforgeexe PRIVATE Python3::Python)
  endif()
  
diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20220308.bb b/meta-oe/recipes-graphics/fontforge/fontforge_20230101.bb
similarity index 96%
rename from meta-oe/recipes-graphics/fontforge/fontforge_20220308.bb
rename to meta-oe/recipes-graphics/fontforge/fontforge_20230101.bb
index ddb4443ba..2b425c583 100644
--- a/meta-oe/recipes-graphics/fontforge/fontforge_20220308.bb
+++ b/meta-oe/recipes-graphics/fontforge/fontforge_20230101.bb
@@ -14,7 +14,7 @@ inherit cmake pkgconfig python3native python3targetconfig features_check gettext
 REQUIRED_DISTRO_FEATURES:append:class-target = " x11"
 
 # tag 20220308
-SRCREV = "582bd41a9bf04326300fc02a677fe3610d6d3ccd"
+SRCREV = "a1dad3e81da03d5d5f3c4c1c1b9b5ca5ebcfcecf"
 SRC_URI = "git://github.com/${BPN}/${BPN}.git;branch=master;protocol=https \
            file://0001-include-sys-select-on-non-glibc-platforms.patch \
            file://0001-fontforgeexe-Use-env-to-find-fontforge.patch \
-- 
2.25.1


