Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 670E2C433F5
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 01:46:47 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.828.1642556803217038470
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jan 2022 17:46:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=joxVShRB;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1642556801; i=@fujitsu.com;
	bh=Ko5E9LIyIlksnBITNzEap+TMkZqxk2KAt9/2xkpsdZo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=joxVShRBWZgk4wkQWslLuB+OY6SLUCm0141zpk6+4hqbmzFx70cuGDFn4VI/F++un
	 T37fpix6v+v2/AhQEr1izMJeqF0XTkWcQ+f1rnavpIT0/Or4W1WinV5U1VCmFJX64F
	 7jwYRwm2SB958aIEH8C6OzqOH5W2RBh5cHmAinTKuD0pDU3jMZD2P0PQCt9naIVJAj
	 t5bRuPMqrFwVQpEX7a7A9hubVjUiAslqRMuZXbpS2oken1p8Xeiw7TPZBCtgaQ55vX
	 CDyizItXuPIAacRyco8XwGO8/xpxCva5bmBa1d6whG5ZNuy0f0ObNAKV/cHtmStnAW
	 yO0oMI7qNTbbA==
Received: from [100.115.37.147] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-2.aws.ess.symcld.net id 9F/93-28974-08D67E16;
 Wed, 19 Jan 2022 01:46:40 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRWlGSWpSXmKPExsViZ8MxSbc+93m
  iwYmb7BYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aNmf9ZCs4JVLy/LtrAuIKvi5GLQ0jgCaNE
  75npLBDOBSaJPZ8mMEM4Jxgljpy6zdjFyMnBJqAmMf3WDVYQW0RAX2Lp7D3MIDazgIrEi9897
  F2MHBzCAvYSU47zgIRZBFQlVh3ewgQS5hVwkji4NgUkLCGgIDHl4XuwTk4BZ4l5nzvBbCGgkl
  eHTjGB2LwCghInZz5hgZguIXHwxQtmiF5FidmXm1kg7AqJWbPamCBsNYmr5zYxT2AUnIWkfRa
  S9gWMTKsYrZOKMtMzSnITM3N0DQ0MdA0NTXWNjXUNzS31Eqt0E/VSS3XLU4tLdI30EsuL9VKL
  i/WKK3OTc1L08lJLNjECQzilWHHzDsaJK3/qHWKU5GBSEuUVjX+eKMSXlJ9SmZFYnBFfVJqTW
  nyIUYaDQ0mClzUHKCdYlJqeWpGWmQOMJ5i0BAePkgjv0yygNG9xQWJucWY6ROoUo6KUOG9nNl
  BCACSRUZoH1waL4UuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHlvg0zhycwrgZv+CmgxE9D
  i/mfPQBaXJCKkpBqYJuVtvs0upxWYGu3ku2nJ3uenmJcfP88oszX1Ug7P431FawynO5vuWSFZ
  kLj4nCoHV1f5rUrnP2f83s1ckW51+WLwmv5y04ZDz+7L89z2bK0TPLSB2ddV06J3wb6gpzOCm
  P0O/tJ/sVB0K5e3wt1dq9ZmL2r6ebPhGNPkOI6mJ1dm+c7//s2mV8Q1641l3nWHvIuNsyo8Ge
  8dU973IlLKtz315mPjx82yqqndnAXJC/0+M5hcW8ORHvzo/ce5Fy7+/OrV5FuYc0Hom/yzEss
  nB0+lqZg2JRxYYu3RlpmSwC7i9PPeu925t5kz7ivkB/9+YV574Or95ZNeal7quvnRucfcy/zr
  /nPv79VtklSapcRSnJFoqMVcVJwIAFwaWXNcAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-571.messagelabs.com!1642556798!39404!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25307 invoked from network); 19 Jan 2022 01:46:39 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-7.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 Jan 2022 01:46:39 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id BE491100446
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Jan 2022 01:46:38 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id B0DF11000FB
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Jan 2022 01:46:38 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Wed, 19 Jan 2022 01:46:17 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] monit: upgrade 5.29.0 -> 5.30.0
Date: Wed, 19 Jan 2022 09:46:06 +0800
Message-ID: <1642556766-18315-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1642556766-18315-1-git-send-email-wangmy@fujitsu.com>
References: <1642556766-18315-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Jan 2022 01:46:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94929

Changelog:
=========
-New: Add a read-only option to the set httpd statement. The option can be used
 on the TCP socket, the unix socket, or both.
-Changed: Issue #1011: The include statement was limited to 512 files, increase
 the limit to 1024 files.
-Fixed: The disk read and write bytes didn't show up in M/Monit for Monit 5.27.0
 or later.
-Fixed: Issue #998: Monit 5.29.0 may fail to compile on platforms without the
 monotonic clock support.
-Fixed: Issue #1002: 32-bit Linux machines with more then 4GB of RAM reported
 wrong system memory size and swap size values.
-Fixed: Issue #1005: When the port statement was used with the generic protocol
 test and the target server returned zeros in response, Monit >= 5.20.0 may crash.
-Fixed: Issue #1009: When one executes an action via the Monit HTML GUI (uses a
 POST request), the Monit HTTP server will redirect the browser back to the base
 URL, so the browser won't perform the POST request again on an automatic page
 refresh, which is performed to poll for status changes.
-Fixed: Issue #1015: The set httpd statement supports only one address option.
 Display warning if multiple address options are used.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/monit/{monit_5.29.0.bb => monit_5.30.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/monit/{monit_5.29.0.bb => monit_5.30.0.bb} (94%)

diff --git a/meta-oe/recipes-support/monit/monit_5.29.0.bb b/meta-oe/recipes-support/monit/monit_5.30.0.bb
similarity index 94%
rename from meta-oe/recipes-support/monit/monit_5.29.0.bb
rename to meta-oe/recipes-support/monit/monit_5.30.0.bb
index 9528fe735..1496243c1 100644
--- a/meta-oe/recipes-support/monit/monit_5.29.0.bb
+++ b/meta-oe/recipes-support/monit/monit_5.30.0.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
 	file://monitrc \
 "
 
-SRC_URI[sha256sum] = "f665e6dd1f26a74b5682899a877934167de2b2582e048652ecf036318477885f"
+SRC_URI[sha256sum] = "e85649dfa8586f4fcdd34a0295c55ddd69b0eda6cfbdac47105a2673d10b1008"
 
 DEPENDS = "zlib bison-native libnsl2 flex-native openssl virtual/crypt"
 
-- 
2.25.1


