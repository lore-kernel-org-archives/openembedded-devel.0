Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74D33C433FE
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 08:30:20 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.1219.1667809813381494455
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Nov 2022 00:30:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Jx5owVcI;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667809811; i=@fujitsu.com;
	bh=2W7tTO+wHCxX9B5f6tMvuqSnqUBb20H7B2GPkpvtxR4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Jx5owVcITMcHk8Bg2QYVTdTsNCdQAhRF36zv88C3pi3mDBT5UTM8F9k2bYCQF9nUE
	 fQkGlhfSXT4Dk/C0jmPILzeMGKoWJdfmgRlUcODrk23w0r8+fylB1fjuuyevzic1bL
	 zWZXFeF6DHfN/SKsYzgJOCge2D69sBRHi0apiWu8geB4as84bFACKL+ou5qVAteD+R
	 +2Qci5348Lx5wxYSPpTVxvK0QaBo5Y5Inel+UwPMyXFgLVhXDI12R8FIXII8gmUdkE
	 fix0ia4/gnArsK30zssAj9zQ2MvIb1z19OCzGKr3qf5LqGUyj8mPOuhu0DdsErLFy0
	 1iiZyPGL7pVEg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAIsWRWlGSWpSXmKPExsViZ8MxSVf4UEa
  ywa+PIhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bb8wIFD3gqHu14ztbAuJe7i5GLQ0jgCaPE
  v3P32CCc60wS266+ZYRwdjNKHN78nLWLkZODTUBK4sb9/2wgtoiAvsTS2XuYQWxmARWJF7972
  LsYOTiEBWwkjndFgoRZgMLN33rBSngFnCQWdV1nBLElBBQkpjx8DxbnFHCWWP/yJdh4IaCal6
  +nQNULSpyc+YQFYryExMEXL5ghehUlZl9uZoGwKyRmzWpjgrDVJK6e28Q8gVFwFpL2WUjaFzA
  yrWI0LU4tKkst0jXXSyrKTM8oyU3MzNFLrNJN1Est1S1PLS7RNdRLLC/WSy0u1iuuzE3OSdHL
  Sy3ZxAgM3JRixtwdjDuX/dE7xCjJwaQkyvt7eUayEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQneG
  xuBcoJFqempFWmZOcAogklLcPAoifCG7QNK8xYXJOYWZ6ZDpE4x6nLM/Np2gFmIJS8/L1VKnP
  fabqAiAZCijNI8uBGwiL7EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZiXeQ/QFJ7MvBK4Ta+
  AjmACOqK6IA3kiJJEhJRUA9OkEKZ366ff3/UuhLk/9vqNd38y5wdbMTCFia7Y/ZDtzDOL0FXa
  Ky528fAGsqsX3rbmXa/SybRn+o0fWWb7myYvYyzlyglqlOZ0e2TKYRFyruTY3mmZAU1p56Rzc
  iX4F+9wd70tf2uLo33zj+L9/qdOOQUnnmCTmLv9F/97N+H1Vfa/VUNEfdZpiZsaLzdZosRz4n
  5yvE81v7bMz3/rNH03nL1X4bF7SZPUsbh5Bp558jkT3oi27Mj1Zd9n+/sO56vPjcaTQjzeM+c
  sufh24iueF/JKa4ykHr+br33qwrvsuF/ipmmMn+1WOU7/Zsed6mfYbNV88ucqC1e/KK8HT77G
  queKe11Pr7T0nT4tW4mlOCPRUIu5qDgRAMc/BqljAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-587.messagelabs.com!1667809811!321325!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11865 invoked from network); 7 Nov 2022 08:30:11 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-14.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 7 Nov 2022 08:30:11 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id ED3FA1000D7
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 08:30:10 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id E0F5C1000D2
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 08:30:10 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 7 Nov 2022 08:30:09 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] valijson: upgrade 0.7 -> 1.0
Date: Mon, 7 Nov 2022 16:29:47 +0800
Message-ID: <1667809788-30849-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1667809788-30849-1-git-send-email-wangmy@fujitsu.com>
References: <1667809788-30849-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Nov 2022 08:30:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99450

From: Wang Mingyu <wangmy@fujitsu.com>

License-update: "Akamai Technolgies" changed to "Akamai Technologies"

Changelog:
===========
Transition to using submodules for vendored-in parser libraries
Fixes for the implementation of YamlCppObject::find()
Use the correct version of std::string::replace in the extractReferenceToken helper function
Avoid throwing exceptions when using operator new in the CustomAllocator class

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../valijson/{valijson_0.7.bb => valijson_1.0.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/valijson/{valijson_0.7.bb => valijson_1.0.bb} (85%)

diff --git a/meta-oe/recipes-devtools/valijson/valijson_0.7.bb b/meta-oe/recipes-devtools/valijson/valijson_1.0.bb
similarity index 85%
rename from meta-oe/recipes-devtools/valijson/valijson_0.7.bb
rename to meta-oe/recipes-devtools/valijson/valijson_1.0.bb
index 3bb89ee8f..52475522a 100644
--- a/meta-oe/recipes-devtools/valijson/valijson_0.7.bb
+++ b/meta-oe/recipes-devtools/valijson/valijson_1.0.bb
@@ -1,10 +1,10 @@
 SUMMARY = "Header-only C++ library for JSON Schema validation"
 HOMEPAGE = "https://github.com/tristanpenman/valijson"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=015106c62262b2383f6c72063f0998f2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5c4583a434195e4f3b418e17c8ca2daf"
 
 SRC_URI = "git://github.com/tristanpenman/valijson.git;branch=master;protocol=https"
-SRCREV = "94d3bfd39ad4dca1be0f700b5eea8e4234d0e7e8"
+SRCREV = "78ac8a737df56b5334354efe104ea8f99e2a2f00"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


