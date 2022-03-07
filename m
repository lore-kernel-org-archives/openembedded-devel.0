Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09D08C433FE
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 11:49:27 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.25247.1646653764772057031
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Mar 2022 03:49:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=DpfaJUOG;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646653763; i=@fujitsu.com;
	bh=pLboK//JQGBx6uVZgYeACPYEkP4BEicq1CnFNjJsdfE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=DpfaJUOGNQcVyPTxt5GBvrCBbXvJKUjQfIeqOxRXKNCYAMpjj4PzDnZJpvF3E2GXw
	 k5oe/p5Hp7ePJpsxHtHn2Yn4qVI7zzYVvNj3yEppd3OJeMH7RhIfYpvpC+BS9HEO5S
	 aZYuvnpBrtJQ0xWvqsksPCoXHgDoNOdxxTeebDUyNeg5XUPW8tdP9ymA0ADUaT81yc
	 rU/LC0pklzabndeMlS11MfKrNfRz5GjYByo/imFM8mat7YebcCa9ks8c5eSAxaGmrs
	 eEV+HzYS8O3nPXaxyMciI2Gs1AX+X64iIZAMlSlCbwuE+ifuUoQQNHnKLf6Wm/vejM
	 V6R1EyzuGF8ug==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHIsWRWlGSWpSXmKPExsViZ8MRouv0UTX
  J4GOrjsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvHl/k6WgoecFQ8PPGNtYPzD0cXIxSEkMINJ
  4uP3HawQznFGiVsnN7F0MXJysAmoSUy/dYMVxBYR0JdYOnsPM4jNLKAi8eJ3DzuILSzgKXHiz
  Quwehag+IT109lAbF4BJ4n1L58zgdgSAgoSUx6+Z4aIC0qcnPmEBWKOhMTBFy+YIWoUJWZfbm
  aBsCskZs1qY5rAyDsLScssJC0LGJlWMdolFWWmZ5TkJmbm6BoaGOgaGprqmlnqGpqa6SVW6Sb
  qpZbqJqfmlRQlAqX1EsuL9VKLi/WKK3OTc1L08lJLNjECgy2l2HXODsYLfT/1DjFKcjApifKm
  LFBNEuJLyk+pzEgszogvKs1JLT7EKMPBoSTB++kNUE6wKDU9tSItMwcY+DBpCQ4eJRHe45eA0
  rzFBYm5xZnpEKlTjIpS4rycH4ASAiCJjNI8uDZYtF1ilJUS5mVkYGAQ4ilILcrNLEGVf8Uozs
  GoJMwrDTKFJzOvBG76K6DFTECLq2yVQBaXJCKkpBqYJr3hvmAWJcawMe7FLNbcI4bqbFolu/Y
  8Sinc//qiarHWfPvIJH2hOi5lMReDez5bnariz66//eZyzvQVeUsS9wiK8KRJHNdIWffhmkG+
  IWeJWMGD58sUzz3ujNMQ0Igyc0us0BLM8dY7rJIs/CP69j1e4do9jxbuFt5ZoS3e+l/LuFLf2
  fPLjKM8nm0fP4ku9lypMPnoJv4dG2rL/V7fmlDb8OqZ9xbB1pSbguuf+n9t/1Ktc+XU4crM6S
  XSHbfmGkc//BN2wD5fQ2nfRskp77b++xCXX+aq9F/2CceZTzFbds38cDKc915Ad4rj/r5cf8v
  1d3aztK6Ot5370V+7TaE0dcqED985fgbOe+yvxFKckWioxVxUnAgA/ei4hDEDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-545.messagelabs.com!1646653762!16308!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11745 invoked from network); 7 Mar 2022 11:49:22 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-9.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Mar 2022 11:49:22 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 227BnF5c004738
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 7 Mar 2022 11:49:22 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 7 Mar 2022 11:49:13 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-redis: upgrade 4.1.1 -> 4.1.4
Date: Mon, 7 Mar 2022 19:49:00 +0800
Message-ID: <1646653744-55920-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Mar 2022 11:49:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95842

Changelog:
=========
New features:
-------------
Adding ExecutionPlan support for graph (#1993)
Vector similiary search support (#1986)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-redis_4.1.1.bb => python3-redis_4.1.4.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-redis_4.1.1.bb => python3-redis_4.1.4.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-redis_4.1.1.bb b/meta-python/recipes-devtools/python/python3-redis_4.1.4.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-redis_4.1.1.bb
rename to meta-python/recipes-devtools/python/python3-redis_4.1.4.bb
index 9af7383de..5b5e144a9 100644
--- a/meta-python/recipes-devtools/python/python3-redis_4.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-redis_4.1.4.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://github.com/andymccurdy/redis-py"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=51d9ad56299ab60ba7be65a621004f27"
 
-SRC_URI[sha256sum] = "07420a3fbedd8e012c31d4fadac943fb81568946da202c5a5bc237774e5280a0"
+SRC_URI[sha256sum] = "1d9a0cdf89fdd93f84261733e24f55a7bbd413a9b219fdaf56e3e728ca9a2306"
 
 inherit pypi setuptools3
 
-- 
2.25.1


