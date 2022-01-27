Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DC31C433EF
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 09:04:12 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web12.25740.1643274250297643271
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jan 2022 01:04:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=CDlzgZni;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1643274248; i=@fujitsu.com;
	bh=1vn7pjAKKU/7/pS2H/IW77AE2NXjR9/7LW+cydBKS7g=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=CDlzgZnihTtd+2j7J3fnS8DmzdkmOfcQrUIIasa1VGeUo3E2RJDHl+nr6IW2ikRcX
	 9/2PzN7s0L2KZaSHvJW5CI44deKJRwSN8v3Yx/+uyrUDnUPLVpG69zTPy9MEjyIm4l
	 WHxFh6u3KnsRDq7apYHLuFSOI/hf2RGJkAWtOkABySBKTvMP1ZLZYOL/2pbw6ba+a9
	 WnoPJ0PnvPHSYLF1e/CBiFN1gd6GvqeiZDSUjuFV4y5zjxA4tV2x5TAaInS+8L44g+
	 25jOwC5nf8QSlW4wDEkHa7y5ae93JF8kdlIMO9bsQ896/l97gvNoPp88QVYNUiRRqK
	 vCocbZJETDfkA==
Received: from [100.115.65.74] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 2D/47-23802-70062F16; Thu, 27 Jan 2022 09:04:07 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRWlGSWpSXmKPExsViZ8MxSZc14VO
  iwcZXFhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8b+Za+YCrZzVtx6V9rAeJeji5GTQ0jgCaPE
  1HU6EPYFJokL85gh7JOMEocuZILYbALqEo9vvmYEsUUE9CWWzt4DVsMsoCrRfXENO4gtLBAls
  b7zB0sXIwcHC1D87C4rEJNXwE3i1DJLkAoJAQWJKQ/fg3XyCghKnJz5hAViioTEwRcvmCFqlC
  ROrPjIBGFXSLw+fAkqriZx9dwm5gmM/LOQtM9C0r6AkWkVo11SUWZ6RkluYmaOrqGBga6hoam
  umZmukZGFXmKVbqJeaqlucmpeSVEiUFovsbxYL7W4WK+4Mjc5J0UvL7VkEyMwJFOKnZ7sYHzd
  91PvEKMkB5OSKO8S80+JQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR482OBcoJFqempFWmZOcD4g
  ElLcPAoifCuigNK8xYXJOYWZ6ZDpE4xKkqJ84rGAyUEQBIZpXlwbbCYvMQoKyXMy8jAwCDEU5
  BalJtZgir/ilGcg1FJmLcUZApPZl4J3PRXQIuZgBb/Pv8OZHFJIkJKqoGJ53hskIDTUktRUb/
  Ap82Mf5q5WP/sfDUtMnEqS23ia7+w5nRr/uadDUsvWiUcWbxA9Iffz9PeL11Nrs68bhD6n/ff
  VTmrnzERW4XVuGYGpMbq+ZQdfJO+/M+6ppexbz/NbTLr2+0qMadCYEdi9ZYfoX6Cx08n64v6m
  f5dUiY/g2NV5fdZW78U5Pg82KGzRuOW1PPJh2599me5F8J61XDN0+woub+Hw2ZMPsZtobS33+
  /fg96d+Qs+cQT9VlKyOi7IvazQxvWBjgPrtZSitj8WQuzn/Z4tZJXWlsm0/m6/gf9Ni8yJNZo
  TeVyM8yRXH9y9MqV+R9iWoE/aihO/T7daXSF0ryvNwN9j4peD/nuUWIozEg21mIuKEwEcMxNR
  RAMAAA==
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-11.tower-545.messagelabs.com!1643274245!6259!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3481 invoked from network); 27 Jan 2022 09:04:05 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-11.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Jan 2022 09:04:05 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 67620100453
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jan 2022 09:04:05 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 58D9F100445
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jan 2022 09:04:05 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Thu, 27 Jan 2022 09:04:02 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [PATCH 1/3] [oe] [meta-python] [PATCH] python3-pulsectl upgrade
 21.10.5 -> 22.1.3
Date: Thu, 27 Jan 2022 17:04:14 +0800
Message-ID: <1643274256-7015-1-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Jan 2022 09:04:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95117

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-pulsectl_21.10.5.bb => python3-pulsectl_22.1.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pulsectl_21.10.5.bb => python3-pulsectl_22.1.3.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pulsectl_21.10.5.bb b/meta-python/recipes-devtools/python/python3-pulsectl_22.1.3.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pulsectl_21.10.5.bb
rename to meta-python/recipes-devtools/python/python3-pulsectl_22.1.3.bb
index 0b867b83a2..9a5b9f948c 100644
--- a/meta-python/recipes-devtools/python/python3-pulsectl_21.10.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pulsectl_22.1.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/mk-fg/python-pulse-control"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f1d10048469ff90123263eb5e214061d"
 
-SRC_URI[sha256sum] = "b347983fb78baab168f4dc4804ab2c59ca5b813bf62f8146dfb5fcb6ab6c8ba2"
+SRC_URI[sha256sum] = "f28fe4b881dd2cc144d2d94f83ec60d8c59a52642a0ad3635cc4d0f8406f4858"
 
 RDEPENDS:${PN} += " \
 	libpulse \
-- 
2.25.1


