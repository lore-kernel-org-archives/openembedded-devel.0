Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E317CC6FD1D
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 04:20:37 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web10.65296.1679545232499229795
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Mar 2023 21:20:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=WXAwX0Rh;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679545230; i=@fujitsu.com;
	bh=BzIOxcVI39lHxqO2vVzqL7ln3kDJtUEKVOpTSHSFMlw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=WXAwX0RhlBPzSRc6cconumc9/1Bkjy/3dMgmOSc7FOE4TyapHDXeMDDiZtGdgkdtN
	 z6s6L6VSiM6umlIqgtyBZQ+dmLtBfLxE3pWA/j/lm+8qjBH1O3johot1UQ1k4XyK1R
	 /dSlK4mM6bVj1DideEvobOW3tNVIs/tASuzlAHOUFoLL/X8rBfpZCH3VmtXCpyDf6A
	 Dth22qAs4Br1Q/R/93gBNsTcab0fuSCCXeKYhZkUfv4uXhmiOKxG63HB7BWezXIR+M
	 3v6EzEhZxFVlGJEIk2cgDMeXxMGT70Bu7eBBvmUbEhEqZarwv/9DSkMR9RtHYj8k+y
	 gyeBhS2VYQPrA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDIsWRWlGSWpSXmKPExsViZ8MxSbf3snS
  KwaTrkhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aFTRtYC95zVFzYe5W1gXEqRxcjF4eQwBNG
  iRNzTrB0MXICOdeZJGbujIFI7GGUuD9tGRtIgk1ASuLG/f9gtoiAvsTS2XuYQWxmARWJF7972
  LsYOTiEBbwlrsyoAgmzCKhKnLnzjRXE5hVwktjReIYdxJYQUJCY8vA9M0RcUOLkzCcsEGMkJA
  6+eMEMUaMoMftyMwuEXSHROP0QE4StJnH13CbmCYz8s5C0z0LSvoCRaRWjaXFqUVlqka6JXlJ
  RZnpGSW5iZo5eYpVuol5qqW55anGJrqFeYnmxXmpxsV5xZW5yTopeXmrJJkZgIKYUs77dwfi/
  96/eIUZJDiYlUV6JUOkUIb6k/JTKjMTijPii0pzU4kOMMhwcShK8OheBcoJFqempFWmZOcCog
  ElLcPAoifDOPQiU5i0uSMwtzkyHSJ1iVJQS5w26BJQQAElklObBtcEi8RKjrJQwLyMDA4MQT0
  FqUW5mCar8K0ZxDkYlYd4Z54Gm8GTmlcBNfwW0mAlocdwMCZDFJYkIKakGphzzvzObn1rKWk9
  L+smztsXgimLE3LU7eeN2NWxw0mxPb8n7sWLa4tikp5e9n0fkrcuwMtPaekH5zCx2tjW8UbMc
  UwM+hzbl1550mXTmxvFZRq9uJd6NLYpoDHb0qGCUX/VL8clFS3b5SDv7SK3NzQu3r5QQevZN+
  Kd6bNq613Upuf+9W7hOX3Gqe167fnKZ8GrnmZL7l+y7lr3u1I5NcyZ+bvnv8+L63gglneBWi1
  PLc9lVTt375RCxOqwsJcKdjWHVz3Mt9UxJoVsO9x25M2kf476dIZJ3jzyqvtTGx1nSdqTr3fZ
  T9beTdTb9X7J5izy/68t5O3XL5m9fIXKlm0F4Xd5NwwMuKicZb0xwuarEUpyRaKjFXFScCACi
  4E38PwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-591.messagelabs.com!1679545229!590750!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18745 invoked from network); 23 Mar 2023 04:20:29 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-22.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 23 Mar 2023 04:20:29 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 09C961000E9
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 04:20:29 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id F174B1000C1
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 04:20:28 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 23 Mar 2023 04:20:27 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-cmake: upgrade 3.25.2 -> 3.26.0
Date: Thu, 23 Mar 2023 12:20:11 +0800
Message-ID: <1679545214-20015-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101647

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-cmake_3.25.2.bb => python3-cmake_3.26.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmake_3.25.2.bb => python3-cmake_3.26.0.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-cmake_3.25.2.bb b/meta-python/recipes-devtools/python/python3-cmake_3.26.0.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-cmake_3.25.2.bb
rename to meta-python/recipes-devtools/python/python3-cmake_3.26.0.bb
index d0e11f9a6..e4644d9aa 100644
--- a/meta-python/recipes-devtools/python/python3-cmake_3.25.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cmake_3.26.0.bb
@@ -11,7 +11,7 @@ PYPI_PACKAGE = "cmake"
 PYPI_ARCHIVE_NAME_PREFIX = "pypi-"
 
 inherit pypi python_setuptools_build_meta
-SRC_URI[sha256sum] = "bcf9f0369743278ec26961542b31ed1610e6f4cfc20c00a3f1c61985abb3b0d2"
+SRC_URI[sha256sum] = "c18185c9cc147d0fa1e9228962aa37901b37866bd5d617e9efa23dfe706f7321"
 
 SRC_URI += " \
 	file://CMakeLists.txt \
-- 
2.34.1


