Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59BC8C3F6B0
	for <webhook@archiver.kernel.org>; Thu, 28 Jul 2022 02:15:04 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web08.28176.1658974493230558875
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jul 2022 19:14:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ueqbt6Nn;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658974491; i=@fujitsu.com;
	bh=aVyEO0ubWGksq/Z7r6+wblm4hHcwtNUyH67oghGxsdE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ueqbt6NnqaizEDUouCOi9gvAA6AWQyes+/+EXj7H35hznWf2kkCn1pQJ1zXN0mIjt
	 jdRdlSScdCyixEAmCU0jVZcn0G8iW75L347vwu1gCsJ2RkjzLuBoVk3F1cLO/SMkmT
	 Z5/A6gbjP5YxrCF1T/2u2AWqANi81kTMfQbaemSkEUMRqiwEoBeqkvS6UHPISuGA0b
	 ziqwVd83ee/qYDojpnEczWSKCFb+mM3f7Jy+jExDgVRcf6wCztUJzsSoj+ILrdJPvN
	 p3sw1mfd6vr9H+jqH4fBiYeHZz4yMIVUHtJrElXjc0KQE4Qhccva9IC4VyFBmTIqUg
	 ocBCBvIYOrVPw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8MxSVfq48M
  kgyc9MhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aXb5MZCx5yVGy/8pi5gbGHo4uRi0NI4Amj
  RMuyrUwQznUmia13b7BBOHsYJTa8ecjcxcjJwSagJjH91g1WEFtEQF9i6ew9YHFmARWJF7972
  EFsYYEAiSnvTgA1c3CwCKhKvNsdDxLmFXCSeLVwJVirhICCxJSH78FaOQWcJdZsn8gIYgsB1T
  yaeJkdol5Q4uTMJywQ4yUkDr54wQzRqygx+3IzC4RdITFjxjY2CFtN4uq5TcwTGAVnIWmfhaR
  9ASPTKkarpKLM9IyS3MTMHF1DAwNdQ0NTXUNdIwNjvcQq3US91FLd8tTiEl1DvcTyYr3U4mK9
  4src5JwUvbzUkk2MwCBOKWY8vYNxU99PvUOMkhxMSqK8Mxc+TBLiS8pPqcxILM6ILyrNSS0+x
  CjDwaEkwbvpFVBOsCg1PbUiLTMHGFEwaQkOHiUR3gdvgdK8xQWJucWZ6RCpU4y6HDO/th1gFm
  LJy89LlRLn/f4eqEgApCijNA9uBCy6LzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5n38Dmg
  KT2ZeCdymV0BHMAEdsUXhAcgRJYkIKakGprA06+x9gQUcuS8uBW7a4zvpi7RR/xvptdpKJ38y
  7ygslX4lvPVpGIfg6oev/c6c0o2e/+Z8Vuu0NRI+92Mj1Vy73LvKKpJdvk21mFCdrLh+TcQb3
  aYIvZ02KwqcYty/H4rRTp4T55HhInc2V0mh5mDsx3Xh4VfiLrsJS5/KV1td9DTw24bIv/P1Ot
  6nuIaIH+z9OOHSe27fx3tjxTft+y/0QvoQp9GZFS+51e/pf1f+6DfH47dYOMPMvGsmvw4a/k3
  zu3i026Pn89szd6sluU6VMN68cb/wON+cXg9Xb9diqaIwa7sHNudWr+O/bGgiflcu7W0x6zH7
  NRuvd7L/LQ32Wvmi5GzH494ezvhzSizFGYmGWsxFxYkAU3Fog2kDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-587.messagelabs.com!1658974490!53303!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21584 invoked from network); 28 Jul 2022 02:14:50 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-16.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Jul 2022 02:14:50 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 1C7FB100078
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Jul 2022 03:14:50 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 0FCCF100077
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Jul 2022 03:14:50 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 28 Jul 2022 03:14:48 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-regex: upgrade 2022.7.9 ->
 2022.7.24
Date: Thu, 28 Jul 2022 10:14:27 +0800
Message-ID: <1658974468-10622-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1658974468-10622-1-git-send-email-wangmy@fujitsu.com>
References: <1658974468-10622-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Jul 2022 02:15:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98024

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-regex_2022.7.9.bb => python3-regex_2022.7.24.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2022.7.9.bb => python3-regex_2022.7.24.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2022.7.9.bb b/meta-python/recipes-devtools/python/python3-regex_2022.7.24.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-regex_2022.7.9.bb
rename to meta-python/recipes-devtools/python/python3-regex_2022.7.24.bb
index 3fbe8b0b27..897aa76c35 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2022.7.9.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2022.7.24.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7b5751ddd6b643203c31ff873051d069"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "601c99ac775b6c89699a48976f3dbb000b47d3ca59362c8abc9582e6d0780d91"
+SRC_URI[sha256sum] = "fa8a4bc81b15f49c57ede3fd636786c6619179661acf2430fcc387d75bf28d33"
 
 RDEPENDS:${PN} += " \
 	python3-stringold \
-- 
2.25.1


