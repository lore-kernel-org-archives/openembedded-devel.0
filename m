Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FE9BC54EBE
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 05:26:48 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web10.16691.1673414804793798695
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Jan 2023 21:26:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=usOcaJi0;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673414803; i=@fujitsu.com;
	bh=5aq33WZ65dxcD3DhSFiYCP6vcJ4/aPlya0HOCnXiaDE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=usOcaJi0oVmw9rzxGFxy3mWZQ/ciTtofn6NdhtQM3yQg+7T9U+ZVzlNhwPdZfXE6C
	 JCD7mXCvDwt9xpkeQNKQXftgZgr9YOrIPhU0EH647tM4RVqZDNbeFTmJrHhBH1vrRf
	 jqrcP5FovESoc1X5iUZgMFAYI4TZLzlalxeVjQiI2BPsYIslWtkSGIZdYB/v1GmLXo
	 o+XRehOF9eH34Uk859A8XxS6TmKdayya9ZeiD6eHnJ1IdGxdgu9wVE70TVjdmhBsUs
	 92DzqYc9rNKCTmygXZxFqkpkhoPJ2YRFy1UJ8k0RpNSlNPPF0rOJ2ONsQgRLO4e09x
	 sw51Dcw7ggZ9w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORqDvJY1+
  yweL3fBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8an2++ZCxo5KxZueMrUwLiGo4uRi0NI4Amj
  xIMTbxghnBtMEkd3TGODcPYySjy9dpili5GTg01ASuLG/f9sILaIgL7E0tl7mEFsZgEViRe/e
  9hBbGEBP4l9n16A2SwCqhIbFywEs3kFnCQe/NrBBGJLCChITHn4HqyXU8BZounkD7AaIaCaC0
  u2M0LUC0qcnPmEBWK+hMTBFy+YIXoVJWZfbmaBsCslWj/8grLVJK6e28Q8gVFwFpL2WUjaFzA
  yrWI0LU4tKkst0jXRSyrKTM8oyU3MzNFLrNJN1Est1S1PLS7RNdRLLC/WSy0u1iuuzE3OSdHL
  Sy3ZxAgM3pRiNp8djP+W/tE7xCjJwaQkypsnsS9ZiC8pP6UyI7E4I76oNCe1+BCjDAeHkgSvi
  itQTrAoNT21Ii0zBxhJMGkJDh4lEd5aR6A0b3FBYm5xZjpE6hSjopQ4r7M7UEIAJJFRmgfXBo
  veS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeZmdgabwZOaVwE1/BbSYCWjx4a69IItLEhF
  SUg1MhsXb/KrSc54ffm8ZvZitoeoh1+2ZG6ZW/mk1SXR/sX1baZC6hNSkGTu0un4LBFv9lvjn
  920JB9+Jqym3D2tv4hF2E/zCnTRFKJ/3YPvEZ1fFo1fe/HRj21sbD9Wbs+ZcWJ3o4r3AafqPf
  ftmXI3idlPzVlq1W2KGzJ6EqRrbXx9hZQxOk+/v2xs991aEptTjNdX3P6nMVhb8cG2vgYfBr0
  ezIq/nrFH/tUdZTuJA+RkJJaPz+So6XNP9D226xT9xsscz1gOGF/omOqZ7ec1+vaj91NGNPof
  sD+/eUv6WT45Dhdtmzuzj8iaunz4Gs2+vPpHK8q43TnamXr7eO5sbxkwKpcc3t5tsvNwkIlMw
  TYmlOCPRUIu5qDgRAOA80xJZAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-585.messagelabs.com!1673414801!503546!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1320 invoked from network); 11 Jan 2023 05:26:42 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-11.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 11 Jan 2023 05:26:42 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id C69F8100191
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 05:26:41 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id B9EE2100182
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 05:26:41 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 11 Jan 2023 05:26:40 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-uefi-firmware: upgrade 1.9 -> 1.10
Date: Wed, 11 Jan 2023 13:26:20 +0800
Message-ID: <1673414780-13856-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673414780-13856-1-git-send-email-wangmy@fujitsu.com>
References: <1673414780-13856-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 05:26:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100537

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...thon3-uefi-firmware_1.9.bb => python3-uefi-firmware_1.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-uefi-firmware_1.9.bb => python3-uefi-firmware_1.10.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-uefi-firmware_1.9.bb b/meta-python/recipes-devtools/python/python3-uefi-firmware_1.10.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-uefi-firmware_1.9.bb
rename to meta-python/recipes-devtools/python/python3-uefi-firmware_1.10.bb
index 3837a1743..49955c97e 100644
--- a/meta-python/recipes-devtools/python/python3-uefi-firmware_1.9.bb
+++ b/meta-python/recipes-devtools/python/python3-uefi-firmware_1.10.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://setup.py;md5=90fa5bae1547550f1c1993f651eda955"
 
 SRC_URI = "git://github.com/theopolis/uefi-firmware-parser;protocol=https;branch=master"
 
-SRCREV = "502f1bada1ed11fdd1792646fda0bfafb8fa57fb"
+SRCREV = "dfb15b068960b771e2e1536d34790dac9b5bfe32"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


