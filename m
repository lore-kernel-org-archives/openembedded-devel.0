Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD228C433F5
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 07:24:21 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web10.8735.1642663461030584180
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Jan 2022 23:24:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=mK5UqzKw;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1642663459; i=@fujitsu.com;
	bh=a8gKwO/n50hdk9m5JZr+YrmVEdIpBg/GzGz7RNgdTHs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=mK5UqzKwCBXw/7bzELd1S6n2HO+zeGphcnGx4zgdnY1OVOM5YrLRk2A7wp1jUPfg7
	 eqdRHsucltqw8shCZZSIV+bC7HpAAE0yJgDkl211dNPOV1BoIH1GGwR3c4s94l/sHP
	 AMjDv0wlAoNG9u0JxaqWTsNZjRl+Yp+uy8liOGTfgDaT+KVRG/HlgNxI+O50NXM2N2
	 ga9P3Df3KTo8WW4crJFmP47xwDiHyHSY0vqGyp0ZOrdDq011oZMgK2QQV2xlDAaYEj
	 WzwUuxTt2q3FpdRqIM7v19vKkn5SdXS3rfM3zcnZd60tWeDYFHcd78sDHEc34rMTf3
	 E2ACnRW15CQPg==
Received: from [100.115.1.107] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-1.aws.ess.symcld.net id 01/BF-10124-32E09E16;
 Thu, 20 Jan 2022 07:24:19 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRWlGSWpSXmKPExsViZ8MxRVeJ72W
  iwcytRhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8b/fWeZCtq4KhbM/8HcwPiPo4uRi0NIYCaT
  xPYLsxghnJOMEp8a7rN3MXJysAmoSzy++ZoRxBYR0JdYOnsPM4jNLKAq0X1xDViNsECsxJyuj
  2wgNgtQfMqOf2A2r4C7xI+/m5hAbAkBBYkpD9+D9XIKeEi8OroEzBYCqTm1hRGiXlDi5MwnLB
  DzJSQOvnjBDNGrJHFixUeoORUSrw9fYp7AyD8LScssJC0LGJlWMVolFWWmZ5TkJmbm6BoaGOg
  aGprqGugaGZrqJVbpJuqlluqWpxaX6BrqJZYX66UWF+sVV+Ym56To5aWWbGIEBmVKMcP1HYwT
  +37qHWKU5GBSEuW9yPYyUYgvKT+lMiOxOCO+qDQntfgQowwHh5IEbwkPUE6wKDU9tSItMwcYI
  TBpCQ4eJRHeFyBp3uKCxNzizHSI1ClGRSlxXn5eoIQASCKjNA+uDRaVlxhlpYR5GRkYGIR4Cl
  KLcjNLUOVfMYpzMCoJ87qATOHJzCuBm/4KaDET0OL+Z89AFpckIqSkGpg6tFV7TZ0OLyh89s6
  Qw+xMyL1zn6sajZJWK/gl+KhPX+qteII5+MqSqSsUp5td2WN5qUw53nXWMd8jZrF/YpXn79fl
  DZCYXMFv0mt22emw6PUkjyRV64I1n3dN4jPLE3IVa3n8TmlKZc4NU2nNTRebmYzvzzG+tOPHh
  rJmtnp7hQsnbLOXztwi4fF09euFG0+r2iZayTvteWW5aAO70f0c7VdTVJxzTt8QW1y8YOpNw/
  VPLF9nn1B++XeG/5Ttos5Zb6fFHOO4c2iP5FQnPVZmm5J3djva0nLWVTVEn4li2S12+2hHy88
  pVRKpfG6z/WeL79g/+/jCvZwFHY2fxG7fqpVkmTTl4Yt7F608Uv2UWIozEg21mIuKEwE5Tdcp
  RQMAAA==
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-4.tower-591.messagelabs.com!1642663458!60054!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20388 invoked from network); 20 Jan 2022 07:24:18 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-4.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Jan 2022 07:24:18 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 20K7ODbE014069
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Jan 2022 07:24:18 GMT
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Thu, 20 Jan 2022 07:24:10 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [PATCH 3/5] [oe] [meta-python] [PATCH] python3-async-timeout: upgrade
 4.0.0 -> 4.0.2
Date: Thu, 20 Jan 2022 15:22:22 +0800
Message-ID: <1642663344-16829-3-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1642663344-16829-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1642663344-16829-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Jan 2022 07:24:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94952

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../python/python3-async-timeout_4.0.2.bb      | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-async-timeout_4.0.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-async-timeout_4.0.2.bb b/meta-python/recipes-devtools/python/python3-async-timeout_4.0.2.bb
new file mode 100644
index 0000000000..7355f00131
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-async-timeout_4.0.2.bb
@@ -0,0 +1,18 @@
+SUMMARY = "asyncio-compatible timeout context manager"
+DESCRIPTION = "\
+The context manager is useful in cases when you want to apply \
+timeout logic around block of code or in cases when asyncio.wait_for() \
+is not suitable. Also it's much faster than asyncio.wait_for() because \
+timeout doesn't create a new task."
+HOMEPAGE = "https://github.com/aio-libs/async-timeout"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4fa41f15bb5f23b6d3560c5845eb8d57"
+
+SRC_URI[sha256sum] = "2163e1640ddb52b7a8c80d0a67a08587e5d245cc9c553a74a847056bc2976b15"
+
+PYPI_PACKAGE = "async-timeout"
+inherit pypi setuptools3
+
+RDEPENDS:${PN} = "\
+    ${PYTHON_PN}-asyncio \
+"
-- 
2.25.1


