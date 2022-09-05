Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C3B9C6FA8C
	for <webhook@archiver.kernel.org>; Mon,  5 Sep 2022 09:02:42 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web08.22552.1662368552852442953
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Sep 2022 02:02:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=PdBE4AQ8;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1662368551; i=@fujitsu.com;
	bh=3qeW7fT52bsO3BiM5KeWlFNUudWBkhsdBxdWn5w3Hu8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=PdBE4AQ8fW6n3+oxzyEO2ybffQ59je4+leTtZME3WN6pJtWFa1mQTzy1YjHek6Ds9
	 yxAErGzGBeQI2da380ncjKO9VTQUq0rBZp3b0O3pajadF6qJoEjTfJf5SJA2i9xVjN
	 +3+z5xqJPmMD4D5Y7iHUSkgDzpJWIjp56eVIve41p5pAmtXUMGz/eUFbFq0V+KtVZY
	 ibGD/s6JZWMBTc5nzISwSIhK1beC1UrcTTu087Mty2JrsQ0pWsxqjCy/cWFvG5aK7C
	 guLA+WuyNHiSchZWNO15KTaBYMoZRNYyAYfhUklJ8M9Pi5Ewp8No6xiFDDgQqNuL4R
	 Y65FUr4CTmiKA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrAIsWRWlGSWpSXmKPExsViZ8ORqKu2WzT
  Z4E6vpcXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrH7vXrBMrmKSXcvsDUwTpXqYuTiEBJ4wihx
  c/cUdgjnOpPE26O3mSCc3YwSd6/dZOli5ORgE1CTmH7rBiuILSKgL7F09h5mEJtZQEXixe8ed
  hBbWMBJYsGzWUBxDg4WoPiuP6EgYV6g8I2N/8BKJAQUJKY8fA9WwingLHGlyQ0kLARU8vjVC0
  aIckGJkzOfsEBMl5A4+OIFM0SrosTsy80sEHaFROP0Q0wQtprE1XObmCcwCs5C0j4LSfsCRqZ
  VjFZJRZnpGSW5iZk5uoYGBrqGhqa6xpa6FkZ6iVW6iXqppbrlqcUlukBuebFeanGxXnFlbnJO
  il5easkmRmAApxSrB+1g/Lbip94hRkkOJiVR3vdzRJOF+JLyUyozEosz4otKc1KLDzHKcHAoS
  fCu3AGUEyxKTU+tSMvMAUYTTFqCg0dJhNd/HVCat7ggMbc4Mx0idYrRkmPq7H/7mTmWg8mZX9
  sOMAux5OXnpUqJ824CmScA0pBRmgc3DhbxlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ83K
  BTOHJzCuB2/oK6CAmoIPs+oRBDipJREhJNTCd7ojzPRf5rM7wXX+zoZXMwiax48zrs/RTuy53
  fhbV9e2tM5jx/MajK+9yinSqtwbask1NZJLZ2d+e/DN9ocnRdqcykXdPP0/nmtBTuMd65eRi5
  vBHXobeW3LjprUuTvx0a9Wn5X1ZYrsnVkV3Rnz7+sWlbcG0dgeuR+zxIuE7XP8VRRZ1Lbp1LP
  TJspdXMrWUTm2vi9kzr+3FIYPY/E+sB8zLj2w+PuF6OW99zZrpoof6VnooMW5y/L1mZm/ePfN
  vUeIbFynWXI+dm/ddyF5bYCZX8jHxSbyt3x2cPB7J/eSTdWV+8frxIrYbPYJzdv7nKFJh5HFZ
  2Lz7XcfRh1tyHvVMWZPqmf2+8kfdiSNKLMUZiYZazEXFiQCEd+eAcwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-548.messagelabs.com!1662368550!168342!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24803 invoked from network); 5 Sep 2022 09:02:30 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-4.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 5 Sep 2022 09:02:30 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 9769910019F
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  5 Sep 2022 10:02:30 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 8AF1710019A
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  5 Sep 2022 10:02:30 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 5 Sep 2022 10:02:29 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] chrony: upgrade 4.2 -> 4.3
Date: Mon, 5 Sep 2022 17:02:06 +0800
Message-ID: <1662368529-32226-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1662368529-32226-1-git-send-email-wangmy@fujitsu.com>
References: <1662368529-32226-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Sep 2022 09:02:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98660

arm_eabi.patch
upgrade for 4.3

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../chrony/chrony/arm_eabi.patch               | 18 ++++++++----------
 .../chrony/{chrony_4.2.bb => chrony_4.3.bb}    |  2 +-
 2 files changed, 9 insertions(+), 11 deletions(-)
 rename meta-networking/recipes-support/chrony/{chrony_4.2.bb => chrony_4.3.bb} (98%)

diff --git a/meta-networking/recipes-support/chrony/chrony/arm_eabi.patch b/meta-networking/recipes-support/chrony/chrony/arm_eabi.patch
index 4a2769b843..5ba2081262 100644
--- a/meta-networking/recipes-support/chrony/chrony/arm_eabi.patch
+++ b/meta-networking/recipes-support/chrony/chrony/arm_eabi.patch
@@ -1,4 +1,4 @@
-From f35e07aceb4a16121d83b47ee77990018bec98ea Mon Sep 17 00:00:00 2001
+From 28b9f115e36e2133301b02fa02ad71a8efbed9b9 Mon Sep 17 00:00:00 2001
 From: Joe Slater <jslater@windriver.com>
 Date: Thu, 9 Mar 2017 10:58:06 -0800
 Subject: [PATCH] chrony: fix build failure for arma9
@@ -22,12 +22,13 @@ Subject: [PATCH] chrony: fix build failure for arma9
     Refreshed for 4.0
 
     Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  sys_linux.c | 15 +++++++++------
  1 file changed, 9 insertions(+), 6 deletions(-)
 
 diff --git a/sys_linux.c b/sys_linux.c
-index 9cab2ef..8104b8f 100644
+index f2baab1..14a9241 100644
 --- a/sys_linux.c
 +++ b/sys_linux.c
 @@ -484,7 +484,6 @@ SYS_Linux_EnableSystemCallFilter(int level, SYS_ProcessContext context)
@@ -45,8 +46,8 @@ index 9cab2ef..8104b8f 100644
 -    SCMP_SYS(getrlimit),
      SCMP_SYS(getuid),
      SCMP_SYS(getuid32),
-     SCMP_SYS(rt_sigaction),
-@@ -508,7 +506,6 @@ SYS_Linux_EnableSystemCallFilter(int level, SYS_ProcessContext context)
+ #ifdef __NR_rseq
+@@ -511,7 +509,6 @@ SYS_Linux_EnableSystemCallFilter(int level, SYS_ProcessContext context)
      /* Memory */
      SCMP_SYS(brk),
      SCMP_SYS(madvise),
@@ -54,7 +55,7 @@ index 9cab2ef..8104b8f 100644
      SCMP_SYS(mmap2),
      SCMP_SYS(mprotect),
      SCMP_SYS(mremap),
-@@ -568,8 +565,6 @@ SYS_Linux_EnableSystemCallFilter(int level, SYS_ProcessContext context)
+@@ -571,8 +568,6 @@ SYS_Linux_EnableSystemCallFilter(int level, SYS_ProcessContext context)
      SCMP_SYS(sendmsg),
      SCMP_SYS(sendto),
      SCMP_SYS(shutdown),
@@ -63,7 +64,7 @@ index 9cab2ef..8104b8f 100644
  
      /* General I/O */
      SCMP_SYS(_newselect),
-@@ -593,7 +588,6 @@ SYS_Linux_EnableSystemCallFilter(int level, SYS_ProcessContext context)
+@@ -596,7 +591,6 @@ SYS_Linux_EnableSystemCallFilter(int level, SYS_ProcessContext context)
  #ifdef __NR_futex_time64
      SCMP_SYS(futex_time64),
  #endif
@@ -71,7 +72,7 @@ index 9cab2ef..8104b8f 100644
      SCMP_SYS(set_robust_list),
      SCMP_SYS(write),
  
-@@ -601,6 +595,15 @@ SYS_Linux_EnableSystemCallFilter(int level, SYS_ProcessContext context)
+@@ -604,6 +598,15 @@ SYS_Linux_EnableSystemCallFilter(int level, SYS_ProcessContext context)
      SCMP_SYS(getrandom),
      SCMP_SYS(sysinfo),
      SCMP_SYS(uname),
@@ -87,6 +88,3 @@ index 9cab2ef..8104b8f 100644
    };
  
    const int denied_any[] = {
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-support/chrony/chrony_4.2.bb b/meta-networking/recipes-support/chrony/chrony_4.3.bb
similarity index 98%
rename from meta-networking/recipes-support/chrony/chrony_4.2.bb
rename to meta-networking/recipes-support/chrony/chrony_4.3.bb
index 8ce9e1db55..083d2cbc00 100644
--- a/meta-networking/recipes-support/chrony/chrony_4.2.bb
+++ b/meta-networking/recipes-support/chrony/chrony_4.3.bb
@@ -39,7 +39,7 @@ SRC_URI = "https://download.tuxfamily.org/chrony/chrony-${PV}.tar.gz \
 SRC_URI:append:libc-musl = " \
     file://0001-Fix-compilation-with-musl.patch \
 "
-SRC_URI[sha256sum] = "273f9fd15c328ed6f3a5f6ba6baec35a421a34a73bb725605329b1712048db9a"
+SRC_URI[sha256sum] = "9d0da889a865f089a5a21610ffb6713e3c9438ce303a63b49c2fb6eaff5b8804"
 
 DEPENDS = "pps-tools"
 
-- 
2.25.1


