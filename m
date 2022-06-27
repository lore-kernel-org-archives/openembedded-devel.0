Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EDAFCCA47E
	for <webhook@archiver.kernel.org>; Mon, 27 Jun 2022 06:59:46 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.38594.1656313180338248491
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Jun 2022 23:59:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=MhyoaOuH;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1656313178; i=@fujitsu.com;
	bh=fEsDm9WkNn9pMz4SGBoyifgTKM33Ti9dBen1PE1t/a8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=MhyoaOuHFud+rkOn8OspsfDSRmfpUUq4TvSePBU7QMIsFCcp70vyoa1BXrspgEzjN
	 qtD4GHijC5vT5UG6Ag+b87SSSid7sSeFCFj4vmvqC00QQwYG3Iq1NBDmzvVg3iuoW9
	 8E1pT6x9D2vwKxGwDx6MnK/cpKoW636pMz2FodvztOA3oir4umYob31E6qnD7Ly8UO
	 w2eOcD9utWk1ipoNKBzUEXWJkFixhnZc6G3MAeWxY6Z6qL9S32ZNVsN8FY8+yvzFsa
	 hDJai0SlXBNZt38uk4qhsVYIt63LNUHnYu9+ggLY7xifXUobXWp9MOO5tgOW0Epx/Z
	 IWVLKl0l7TRZQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHIsWRWlGSWpSXmKPExsViZ8ORqBsZujP
  J4MpcU4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaN/+Ummgks8FRs2z2FtYHzH1cXIxSEk8IRR
  Ysv9VWwQznUmiXvTNjBCOHsYJaYs6WTtYuTkYBNQk5h+6waYLSKgL7F09h5mEJtZQEXixe8ed
  hBbWMBF4tTdj2BxFgFViT3794PV8wo4Saw8uwfMlhBQkJjy8D1YDaeAs8SLiU+BejmAljlJ7H
  poBFEuKHFy5hMWiPESEgdfvGCGaFWUmH25mQXCrpCYMWMbG4StJnH13CbmCYyCs5C0z0LSvoC
  RaRWjTVJRZnpGSW5iZo6uoYGBrqGhqa6lma6RoYFeYpVuol5qqW5eflFJhq6hXmJ5sV5qcbFe
  cWVuck6KXl5qySZGYCCnFCdc2sG4bt8vvUOMkhxMSqK8p9R2JgnxJeWnVGYkFmfEF5XmpBYfY
  pTh4FCS4LUKAcoJFqWmp1akZeYAowomLcHBoyTC2+YNlOYtLkjMLc5Mh0idYjTmuHrlyl5mjp
  lf2w4wC7Hk5eelSonz7g4CKhUAKc0ozYMbBIv2S4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJW
  EedlA7uHJzCuB2/cK6BQmoFP8Ju4AOaUkESEl1cBUWfxsfqebwK6Ia//SLlj4ZoZcO9bNVvc6
  qjPkwytOq5K1whPifepbKnf5dW/8HL9214mvvpov7SYrK8gW2Fy4PueTEsvVwtdfLk3xCNq9Y
  3uh/jHuVe37Ouxm3utUTIx5s+7VZ4vHU/7fFap0Tb6msKbh4qxdU/blfmRwFS1Rdr7xccWpd1
  cvT9ffvGRH/o3S2LPRc/vSZ1jbrXxaEnDLw646ZXFOVZLr7W0rKmKSJk7t/jRb7/iToMoMpbQ
  L+3bpJOtcefPE8n78NPVrD55aOv5R++NmtFr05nyWJ1uWSm0Ku7BuDvf3iAj2fQmu1Zsuzw82
  tE8TrK84U5JzIbDumqzHR+XnpxccVW1zbaz9psRSnJFoqMVcVJwIADHR9jZxAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-732.messagelabs.com!1656313177!150834!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28018 invoked from network); 27 Jun 2022 06:59:37 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-4.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Jun 2022 06:59:37 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 4AB58100194
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jun 2022 07:59:37 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 3EA6D100193
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jun 2022 07:59:37 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 27 Jun 2022 07:59:35 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] googletest: upgrade 1.11.0 -> 1.12.0
Date: Mon, 27 Jun 2022 14:59:17 +0800
Message-ID: <1656313160-23805-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1656313160-23805-1-git-send-email-wangmy@fujitsu.com>
References: <1656313160-23805-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Jun 2022 06:59:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97591

Changelog:
==========
C++ Language Support
----------------------
    This will be the last release to support C++11. Future releases will require at least C++14.

Mocking
---------
    Support for move-only values to Return (5126f71)

Matchers
--------------
    New matchers
        WhenBase64Unescaped (652ec31)
    ResultOf() now has a 3-arg overload that takes a description string for better error messages (0e40217)

Build & Test
----------------
    CMake minimum increased to 3.5
    Bazel users that build GoogleTest using the Abseil library as a dependency now also require a dependency on RE2 (e33c2b2)
    Bazel users that build GoogleTest using the Abseil library now use the Abseil library to parse all command-line flags (25dcdc7)


Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-test/googletest/googletest_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-test/googletest/googletest_git.bb b/meta-oe/recipes-test/googletest/googletest_git.bb
index 869c2c86b..b8088a31a 100644
--- a/meta-oe/recipes-test/googletest/googletest_git.bb
+++ b/meta-oe/recipes-test/googletest/googletest_git.bb
@@ -4,12 +4,12 @@ SECTION = "libs"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=cbbd27594afd089daa160d3a16dd515a"
 
-PV = "1.11.0+git${SRCPV}"
+PV = "1.12.0"
 
 PROVIDES += "gmock gtest"
 
 S = "${WORKDIR}/git"
-SRCREV = "9e712372214d75bb30ec2847a44bf124d48096f3"
+SRCREV = "15460959cbbfa20e66ef0b5ab497367e47fc0a04"
 SRC_URI = "git://github.com/google/googletest.git;branch=main;protocol=https"
 
 inherit cmake
-- 
2.25.1


