Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D2A5C433F5
	for <webhook@archiver.kernel.org>; Thu,  2 Dec 2021 05:04:12 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web12.4602.1638421450587700525
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Dec 2021 21:04:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=VUVtzpG6;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1638421448; i=@fujitsu.com;
	bh=QtEa5m69yDBJLgzMroJrrWg0/O8Bzidt4sGDwKKbZCU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=VUVtzpG6PD/TCcvVK/KP8bsLBXcnzheKOqy+xUBRpkPJFIWKzq9dVQL6xPIlFFxIB
	 FfGAD/MgL71rrsyCR6B4ZagD1OyUCTqavub0iKfEyNoq9TqrYp46bk4w+8ysT2stpm
	 wQFwcRQyRWJG6OyQBYokdpwfcQJwHVrfqPbnfd+FlQ+oCa4TMokpSAv71wE106Q5Am
	 wz6HljT7KTv5RvzU3+avBnDKngsgAIHQT9zkK4JmvK0waMc/bzWwuvO2ygceTOOCHH
	 Pz+BSgRTeIxNp0CZMSsqwpBkWuPdKHB5E9OhlIgmjuJAPt9g/w5KC7tCjYwBZwPt5l
	 n8M5CXHY2S9mg==
Received: from [100.115.2.64] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.ess.symcld.net id 3B/4E-12056-8C358A16;
 Thu, 02 Dec 2021 05:04:08 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplkeJIrShJLcpLzFFi42Kxs+GYons8eEW
  iQfN/a4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP0znVMBVc4K86sfc7SwPido4uRi0NIYAaT
  xMuDr5ghnN2MEu2rzzF2MXJysAnoSpx7vJYdxBYR0JdYOnsPM4gtLOAt0f9xJhOIzSKgIvFzz
  gewOK+Au8Ss989ZQGwJAQWJKQ/fQ8UFJU7OfAIWZxaQkDj44gVQnAOoRlFi9nR5iPIKideHLz
  FPYOSZhaRjFpKOBYxMqxitkooy0zNKchMzc3QNDQx0DQ1NdU11jYyN9RKrdBP1Ukt1y1OLS3Q
  N9RLLi/VSi4v1iitzk3NS9PJSSzYxAkMppZj15Q7G6X0/9Q4xSnIwKYnyOgWsSBTiS8pPqcxI
  LM6ILyrNSS0+xCjDwaEkwfswECgnWJSanlqRlpkDDGuYtAQHj5II7+MgoDRvcUFibnFmOkTqF
  KOilDjvVpCEAEgiozQPrg0WS5cYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfOWg0zhycwrgZ
  v+CmgxE9Diw7OWgywuSURISTUwJed2eHJpeVcfKn2mL7+1wVAoWrJQ/up7z0aGz0L51jXei4X
  EHnW+S3HZumZPi6Tis5X/9aZ0pn0KPc9u13tCO9VDbpbvTlkNeTHl+1O5JqukdVkz//BKONh9
  +azMxn+R/H6zv0RuzFi2c/HaLpsy8W9FCcXc9sw6T43v/uL5eVznZvDGGcZ8U7ROcTmLFqX8a
  Ml4M/tL+tSn35nXnHp2u9xlreutdytinuocaju1JPqkudTv1tITGiLhU2WWWTn4XjQp8NYttY
  vYWRX24kmYG4uqiaJPqs45T7e4WVnK+n3aFRs891qe0WD6bu2ut8K2tFe9eGH4saMPLc86rJ4
  k91+HZ0ZofFPRe02+/0osxRmJhlrMRcWJADUnb8wgAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-3.tower-587.messagelabs.com!1638421447!79740!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7555 invoked from network); 2 Dec 2021 05:04:07 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-3.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 2 Dec 2021 05:04:07 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1B2542aa030826
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 2 Dec 2021 05:04:07 GMT
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Thu, 2 Dec 2021 05:04:00 +0000
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] python3-typeguard: upgrade 2.13.0 -> 2.13.2
Date: Thu, 2 Dec 2021 13:03:48 +0800
Message-ID: <1638421428-2478-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Dec 2021 05:04:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94171

Fixed typing_extensions being imported unconditionally on Python < 3.9

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...{python3-typeguard_2.13.0.bb => python3-typeguard_2.13.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typeguard_2.13.0.bb => python3-typeguard_2.13.2.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-typeguard_2.13.0.bb b/meta-python/recipes-devtools/python/python3-typeguard_2.13.2.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-typeguard_2.13.0.bb
rename to meta-python/recipes-devtools/python/python3-typeguard_2.13.2.bb
index 564f98e3f2..b7ae4a32c4 100644
--- a/meta-python/recipes-devtools/python/python3-typeguard_2.13.0.bb
+++ b/meta-python/recipes-devtools/python/python3-typeguard_2.13.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/typeguard/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f0e423eea5c91e7aa21bdb70184b3e53"
 
-SRC_URI[sha256sum] = "04e38f92eb59410c9375d3be23df65e0a7643f2e8bcbd421423d808d2f9e99df"
+SRC_URI[sha256sum] = "7e50071590ab997509aa0977609eb5cf9d73d84c1f416cb4fab78b77a9d15326"
 
 inherit pypi setuptools3 ptest
 
-- 
2.25.1


