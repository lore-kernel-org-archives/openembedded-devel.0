Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4996C6FD1C
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 04:20:37 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web10.65299.1679545235139470313
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Mar 2023 21:20:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=QiBxaryQ;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679545233; i=@fujitsu.com;
	bh=Lw5on3xCGUSbgfRW5Mcq7Czx3IrzU5CxtI3ELsRnT04=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=QiBxaryQ1jA4ldARQiQ51/HWF4x6lSvFIO4GxfJY2o6j1UAt6mOuTV+PXPQbvpiN8
	 tBeqUl/PcFv//6AbmrNq9iH2CsXNsRbubuVIaYDOO9Kn83UpmBIM7+kOkbvhilrrZA
	 DqnhUBshYnNXB9xQAN7kVrMXHiBV+53LQFyYk/RlSirKzMIaAOYYbx3+nvUNCySxOd
	 6NWVUGjf8KTwj91IrGAq8HvNHqfPcOP78FxdJzyU701kSMQU0gwzIrRrgMpubc0hHa
	 hJjBIHFUjsiKtTg35NfFgCixxSdEtNGs8QyFsD01AebwzUO3dlxu8jjazGnamk/iGP
	 cBxybAtcXXEBg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORqDvhsnS
  KwdSlYhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8alW/9ZC/bwVvzZ/YC1gbGBp4uRi0NI4Amj
  xJfH7awQznUmiUd7Z7NDOHsYJTZsWwSU4eRgE5CSuHH/PxuILSKgL7F09h5mEJtZQEXixe8ed
  hBbWMBHouHNMbA4i4CqxJZrF1hAbF4BJ4kD59aAxSUEFCSmPHwPZnMKOEss+7odbL4QSM2NPU
  wQ9YISJ2c+YYGYLyFx8MULqF5FidmXm1kg7AqJxumHmCBsNYmr5zYxT2AUnIWkfRaS9gWMTKs
  YTYtTi8pSi3SN9ZKKMtMzSnITM3P0Eqt0E/VSS3XLU4tLdA31EsuL9VKLi/WKK3OTc1L08lJL
  NjECgzelmLlvB+PX3r96hxglOZiURHklQqVThPiS8lMqMxKLM+KLSnNSiw8xynBwKEnw6lwEy
  gkWpaanVqRl5gAjCSYtwcGjJMI79yBQmre4IDG3ODMdInWKUVFKnDfoElBCACSRUZoH1waL3k
  uMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHlnnAeawpOZVwI3/RXQYiagxXEzJEAWlyQipKQ
  amKbt+pu/bNaEqTwTeGsDg7xzG6N963S8Lt2czBsdtkJLruvr0zjHPwqhD7Unf0iI9HNW9Z6k
  7Purc/Gd2RKBz1e1GYTqLT7mfP7K96ffAs7s+CqlOFn06BovZl7Jzz+Nnq5ULuTbKXCA2zrn3
  BSJAL/Htx2UthsvNFTQO5F0s2Jb/WfHQJuzr+6ceFb8akb0vvwLe47nuG1wadx/8O/ZKpPohO
  q1kg0H/ll53VbLSC5+wbPUNubsuZdbpc9xP+4K2yG7cFG7b2B4y80TZ238I598a+vW/Pcu69o
  pPZ9TXfp5Ngknysq6b7M0OvEZ2f9fJhxx9u1z+/wHscs++T6acTEq3vIQS0te77P/5qaWN5RY
  ijMSDbWYi4oTAdBxZ9tZAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-587.messagelabs.com!1679545232!168444!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20478 invoked from network); 23 Mar 2023 04:20:32 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-8.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 23 Mar 2023 04:20:32 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id F17B510019E
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 04:20:31 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id E502210019A
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 04:20:31 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 23 Mar 2023 04:20:29 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-coverage: upgrade 7.2.1 -> 7.2.2
Date: Thu, 23 Mar 2023 12:20:12 +0800
Message-ID: <1679545214-20015-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1679545214-20015-1-git-send-email-wangmy@fujitsu.com>
References: <1679545214-20015-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 04:20:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101648

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix: if a virtualenv was created inside a source directory, and a sourced
  package was installed inside the virtualenv, then all of the third-party
  packages inside the virtualenv would be measured. This was incorrect,
  but has now been fixed: only the specified packages will be measured.
- Fix: the coverage lcov command could create a .lcov file with incorrect
  LF (lines found) and LH (lines hit) totals.
- Fix: the coverage xml command on Windows could create a .xml file with
  duplicate <package> elements.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-coverage_7.2.1.bb => python3-coverage_7.2.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_7.2.1.bb => python3-coverage_7.2.2.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.2.1.bb b/meta-python/recipes-devtools/python/python3-coverage_7.2.2.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-coverage_7.2.1.bb
rename to meta-python/recipes-devtools/python/python3-coverage_7.2.2.bb
index 5c57967bc..58d0b46f6 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.2.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "c77f2a9093ccf329dd523a9b2b3c854c20d2a3d968b6def3b820272ca6732242"
+SRC_URI[sha256sum] = "36dd42da34fe94ed98c39887b86db9d06777b1c8f860520e21126a75507024f2"
 
 inherit pypi setuptools3
 
-- 
2.34.1


