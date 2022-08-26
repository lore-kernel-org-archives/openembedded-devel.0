Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 086E1ECAAA2
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 03:02:03 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web09.32986.1661482921679058883
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 20:02:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=CyQhygNp;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661482919; i=@fujitsu.com;
	bh=QLOLJIFqLDtN5iXMgRF1Unaq7IMzJZvCkKRGCVceULE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=CyQhygNpZ46BmKlvZPE+E3PlUezZc4lQONL2H50Ak/1TmzrlKS9zQs0QKlurOvPjb
	 PKt647VaXIycP3rboMTt9JFIb1d/6o8Op1uIPjl+ssjNc7nDV7bABWsA1vRb9ARO8A
	 SEYthM4jOIqOYXbHANh+qHkazQ8LyuzVEmAofSMYW+5QlrdgORD6u1IEHsycJr6mGS
	 99WRKPYllyk+DQJS5WAEuXiZxA5G6VHB5J1FECXN4zTV26QhEhJh81jDvBgQlL7dMs
	 FRiVp+Uwyf6JYPkYcroZYHL41dAwZSWo2HfkGppUcDIgUGlcicxAqV2S/WSGA75zgo
	 XkAyS0Alx0Oxg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRWlGSWpSXmKPExsViZ8ORqLvcnCP
  Z4J+ZxcXDS5kdGD3ObVzBGMAYxZqZl5RfkcCa0bfnE3PBVY6KhV+OMTcwNnF0MXJxCAk8YZS4
  eOU6K4Rzg0liwq11LBDOXkaJFW2bgTKcHGwCahLTb90As0UE9CWWzt7DDGIzC6hIvPjdww5iC
  wv4SCy7cgosziKgKvFzym8gm4ODV8BJ4sWeAJCwhICCxJSH78FKeAUEJU7OfMICMUZC4uCLF8
  wQNYoSsy83s0DYlRJ7ZvUzQdhqElfPbWKewMg/C0n7LCTtCxiZVjFaJxVlpmeU5CZm5ugaGhj
  oGhqa6lqa6Rqa6SVW6SbqpZbq5uUXlWToGuollhfrpRYX6xVX5ibnpOjlpZZsYgQGZUpxgsAO
  xr37fukdYpTkYFIS5dV/xp4sxJeUn1KZkVicEV9UmpNafIhRhoNDSYJXzYQjWUiwKDU9tSItM
  wcYITBpCQ4eJRFeaVGgNG9xQWJucWY6ROoUo6KUOK+nGVBCACSRUZoH1waLykuMslLCvIwMDA
  xCPAWpRbmZJajyrxjFORiVhHmlQKbwZOaVwE1/BbSYCWix1AZ2kMUliQgpqQYmy4Bt0u8l5ua
  9njPlO0/PG9nCToGiPFdFFf6Fj8ynvOB5xbve+L7lls5cy9snCv2mLPlaEFby/5jDt3qhL/Hn
  Ly4xeRm2S21xgSjTpKkfe5fLaG3inrRJVbvtxeH1flfFM5Xn1Nf4WYf3v3JJzj+fe9aQ53RMp
  YaWl09M9cam9xuaWHP/sCWF/5FgyNQ8/CVTYdrZGeu+CO/V8L0kf+udS4FU0bEf7+VS5Nb67F
  eTU/q866rMdUZm7gSzZVNat95ZxjJjxhOz3gYft0Uck3f3vuQ53Sh4U4HtkPUG6YJKMcmfG19
  MO9tnHeuWV3UzPPbi0Zijka9m6s89bRetxqWcvaxEYk0LW59Ois7VD2uVWIozEg21mIuKEwGt
  KHdcRQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-732.messagelabs.com!1661482918!25004!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20107 invoked from network); 26 Aug 2022 03:01:58 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-13.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 26 Aug 2022 03:01:58 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 6D9AE100197
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Aug 2022 04:01:58 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 61293100192
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Aug 2022 04:01:58 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 26 Aug 2022 04:01:56 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-hexbytes: upgrade 0.2.3 -> 0.3.0
Date: Fri, 26 Aug 2022 11:01:46 +0800
Message-ID: <1661482908-10720-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Aug 2022 03:02:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98460

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-hexbytes_0.2.3.bb => python3-hexbytes_0.3.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-hexbytes_0.2.3.bb => python3-hexbytes_0.3.0.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-hexbytes_0.2.3.bb b/meta-python/recipes-devtools/python/python3-hexbytes_0.3.0.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-hexbytes_0.2.3.bb
rename to meta-python/recipes-devtools/python/python3-hexbytes_0.3.0.bb
index 534cc88e1d..8402ddecd9 100644
--- a/meta-python/recipes-devtools/python/python3-hexbytes_0.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-hexbytes_0.3.0.bb
@@ -4,6 +4,6 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=287820ad3553117aa2f92bf84c219324"
 
-SRC_URI[sha256sum] = "199daa356aeb14879ee9c43de637acaaa1409febf15151a0e3dbcf1f8df128c0"
+SRC_URI[sha256sum] = "afeebfb800f5f15a3ca5bab52e49eabcb4b6dac06ec8ff01a94fdb890c6c0712"
 
 inherit pypi setuptools3
-- 
2.25.1


