Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02B62C77B60
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 03:23:39 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.42809.1682306614737956199
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Apr 2023 20:23:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=uFWyppXK;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1682306612; i=@fujitsu.com;
	bh=iSeKU8/tPc4DXOWlVQqqHYlh1DfNPZzYaltq7Cm7iTg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=uFWyppXK4bsiRDjAvz7o1ix69qBo+0SDhNsA/nMMS2lDpcBIIfUjDiDubZRAaQPOd
	 m0dFSSFfG/OitMxF6mvHWrmD790qcdAXkFwQp/0NeyqHbD8R4djxMz5g9xRkxOw3Gq
	 lPgY+rYNOEC3ir+mpM3bn+rUfyHmV8yl18P8SMPA2LVZuBLPCDNcU1nffPxUATHl3f
	 1QnFkULI0o1NMunhS7chUyLdGEuPxjtmtXq7gxn/+jIw5jNiLj1ijruuWMASnBCeIu
	 KO/BOwBw3GLT3J90/ow42hRQjT/5kNSg0ZX+jVKug1Z2IVpLGuqjkXI5lihra17qiW
	 YM/PpLtmapSqw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8ORpGvyzTX
  FoO0cq8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnFuxxLWgjWcFQcOnGNsYLzC0cXIxSEk8JBR
  4vrkB4xdjJxAzlUmicMzeSHsvYwS55tCQWw2ASmJG/f/s4HYIgL6Ektn72EGsZkFVCRe/O5hB
  7GFBXwlLv2cygRiswioSpyZegqshlfASeLj4iNgNRICChJTHr4Hi3MKOEv07n7GArHLSeL/oU
  fsEPWCEidnPmGBmC8hcfDFC2aIXkWJ2ZebWSDsSonWD7+gbDWJq+c2MU9gFJyFpH0WkvYFjEy
  rGM2KU4vKUot0LfWSijLTM0pyEzNz9BKrdBP1Ukt18/KLSjJ0DfUSy4v1UouL9Yorc5NzUvTy
  Uks2MQJDN6U4dfYOxsW7/uodYpTkYFIS5V2ywSVFiC8pP6UyI7E4I76oNCe1+BCjDAeHkgRv0
  SfXFCHBotT01Iq0zBxgHMGkJTh4lER4l30BSvMWFyTmFmemQ6ROMepytG/vOsAsxJKXn5cqJc
  4bCFIkAFKUUZoHNwIW05cYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfNKfgCawpOZVwK36RX
  QEUxAR+zidgE5oiQRISXVwCReYqzJovy61+PXL+/HDbeST11X2mSXzyCzQPfM1PmPWq0Y3O26
  nBefyUvMVwzeZMLTtYcj95ZJCdvVLb/kNpkc/GRrYy7xpmTRpRPBXAWMcxae/ux4Y6KBdv/HZ
  3lZf3USQsIeJoqavP+o7Heca6tt5Y/Wr7N1W1/2n6ney3gw59SMu4G2d9P+KSx5Wq2fqp5yvS
  X8i2fhqcx/rd8OZqZWOzwUnhhrMfmABJvVp86el5ObYhu0dz68tNFTLj7nDp/s9OwT26rrOtf
  HanS+TM6fdPxIb+TCm/8/X/v0ZHeMVGPyrnV+nmXP3efGf5XtNvyd9CywsG7N4jmNZ5ZzGs4P
  WxJgIFuhzuHay39/nhJLcUaioRZzUXEiAKnswtJkAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-732.messagelabs.com!1682306611!289449!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6954 invoked from network); 24 Apr 2023 03:23:32 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-5.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Apr 2023 03:23:32 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 881431B5
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 04:23:31 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 7C81C1AC
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 04:23:31 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 24 Apr 2023 04:23:30 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-diskcache: upgrade 5.5.1 -> 5.6.1
Date: Mon, 24 Apr 2023 11:23:08 +0800
Message-ID: <1682306589-11841-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1682306589-11841-1-git-send-email-wangmy@fujitsu.com>
References: <1682306589-11841-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 03:23:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102162

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-diskcache_5.5.1.bb => python3-diskcache_5.6.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-diskcache_5.5.1.bb => python3-diskcache_5.6.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-diskcache_5.5.1.bb b/meta-python/recipes-devtools/python/python3-diskcache_5.6.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-diskcache_5.5.1.bb
rename to meta-python/recipes-devtools/python/python3-diskcache_5.6.1.bb
index 50e3c12d8..447bfc440 100644
--- a/meta-python/recipes-devtools/python/python3-diskcache_5.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-diskcache_5.6.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.grantjenks.com/docs/diskcache/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c60ef82f0f40155453f6d5f2c94b6e8e"
 
-SRC_URI[sha256sum] = "8685515584cc110a463d0728d98beaba56c7e2803b60a19cb8983a4c9e341d91"
+SRC_URI[sha256sum] = "e4c978532feff5814c4cc00fe1e11e40501985946643d73220d41ee7737c72c3"
 
 PYPI_PACKAGE = "diskcache"
 
-- 
2.34.1


