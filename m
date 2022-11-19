Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25832C433FE
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 07:36:55 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.15895.1668843406853718055
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Nov 2022 23:36:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Cny9bXj7;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1668843405; i=@fujitsu.com;
	bh=v7h7l6CubyrHdfFA/v2OMJjfw+uOy22prfRgHwpAWhw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Cny9bXj7iIvRBxGuOgkQD69tJD99Aqi3c/ZyaKx0WqaIQl3L0rnbISGz3iiiATumZ
	 MZvDGe0RPUH4ACHK+BtzLhPEVGumZ3zwQct4at1R/1pyX2+ThvnUOhOeW4Lw2ebpXR
	 JrOmJ/4SpxirRII/uVGJ+kaNhkV3EIoNjlLzXTZGZejf9FfAQ/o1ufRrUWNRayMDDC
	 zSkyoNARRwc5vrO0DEYsTktYSAIBVfqsnqvGfpB/c4lA5cE2HrH94lMzZOSHFolzXp
	 nVj+JYoAvfw8UVkeT5mVZIWNazzfKJzSMG4vOzrDfWCk2QaPJ5aPde3k0fthDet5hm
	 UU/BZErvNA3JQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8ORpNvTXpF
  sMOUmq8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrF+31+2gucCFcd/fmBuYNzF18XIySEk8JBR
  ovGpTBcjF5B9hUli89EbLBDOHkaJyVMWsYNUsQlISdy4/58NxBYR0JdYOnsPM4jNLKAi8eJ3D
  1iNsIC9xNz9x8BsFgFViVX9x1lAbF4BR4ldKy6D9UoIKEhMefgerJdTwEni4IM3TBBXOEpsbl
  nCDlEvKHFy5hMWiPkSEgdfvGCG6FWUmH25mQXCrpCYNauNCcJWk7h6bhPzBEbBWUjaZyFpX8D
  ItIrRrDi1qCy1SNdYL6koMz2jJDcxM0cvsUo3US+1VDcvv6gkQ9dQL7G8WC+1uFivuDI3OSdF
  Ly+1ZBMjMHhTitPX72B8t/SP3iFGSQ4mJVHeve3lyUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQke
  OPaKpKFBItS01Mr0jJzgJEEk5bg4FES4RXxAUrzFhck5hZnpkOkTjHqcsz82naAWYglLz8vVU
  qcNwlkhgBIUUZpHtwIWFRfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMOx1kCk9mXgncpld
  ARzABHZHjXAZyREkiQkqqganSaveyKxuSfIxs77dcf+IptLu3skuuPdVK7HGOfsydJ9nCHNEy
  J8VcJjtxKWXFx5a8qfjLcHx18751923O9Gy0rincpr26/2aa2olfW85eulXtIfhZYKX9+91/W
  gzEC7IMq5/9Ui+/3CwkHhhWIGKc4+pVlLVpywfx3Wdrz4QLnTSpOHt4m/m+0y6JLb5/H3Cxzb
  8TYHBA4tiPP7dYSuyr3C/esX5YlDJnTecu4Zjl9ew1VdfZZl8Xuib16b7VhlXdbTsqGWf9jSx
  k2nAmcvr1yUourxtlrGZoTRc89Xf5jik3300s3xmYqB2wboeL78tPfna8l7xWcT7QYP8+c59Q
  /req5+lRgRbfL4v+2afEUpyRaKjFXFScCAAB4hCaZQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-732.messagelabs.com!1668843403!177700!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17248 invoked from network); 19 Nov 2022 07:36:44 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-4.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 19 Nov 2022 07:36:44 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 8D465659
	for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:36:43 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 825B5658
	for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:36:43 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Sat, 19 Nov 2022 07:36:41 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] freerdp: upgrade 2.8.1 -> 2.9.0
Date: Sat, 19 Nov 2022 15:36:00 +0800
Message-ID: <1668843361-2892-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1668843361-2892-1-git-send-email-wangmy@fujitsu.com>
References: <1668843361-2892-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:36:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99624

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Notewhorth changes:
-------------------
    Backported #8252: Support sending server redirection PDU
    Backported #8406: Ensure X11 client cursor is never smaller 1x1
    Backported #8403: Fixed multiple client side input validation issues
    (CVE-2022-39316, CVE-2022-39317, CVE-2022-39318, CVE-2022-39319,
    CVE-2022-39320, CVE-2022-41877, CVE-2022-39347)
    Backported #7282: Proxy server now discards input events sent before
    activation was received
    Backported #8324: Internal replacements for md4, md5 and hmac-md5
    For the time being the RDP protocol requires these outdated hash
    algorithms. So any distribution that wants to ship a working
    FreeRDP should check the options WITH_INTERNAL_MD4 (and depending
    on OpenSSL deprecation status WITH_INTERNAL_MD5)

Fixed issues:
--------------
    Backported #8341: Null checks in winpr_Digest_Free
    Backported #8335: Missing NULL return in winpr_Digest_New
    Backported #8192: Support for audin version 2 microphone channel
    Backported #7282: Discard input events before activation (Fixes #8374)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../freerdp/{freerdp_2.8.1.bb => freerdp_2.9.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/freerdp/{freerdp_2.8.1.bb => freerdp_2.9.0.bb} (98%)

diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.8.1.bb b/meta-oe/recipes-support/freerdp/freerdp_2.9.0.bb
similarity index 98%
rename from meta-oe/recipes-support/freerdp/freerdp_2.8.1.bb
rename to meta-oe/recipes-support/freerdp/freerdp_2.9.0.bb
index 5f539671b..cd7b2165b 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.8.1.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.9.0.bb
@@ -13,7 +13,7 @@ inherit pkgconfig cmake gitpkgv
 PE = "1"
 PKGV = "${GITPKGVTAG}"
 
-SRCREV = "0ad3f49f0e7eb78586acc6bf6e4605f96f88954e"
+SRCREV = "fa8e1b1c765a4466030ac52240f052c0b440a4d1"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-2.0;protocol=https \
     file://winpr-makecert-Build-with-install-RPATH.patch \
 "
-- 
2.25.1


