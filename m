Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2077DC54EBE
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 05:24:38 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.16657.1673414668920284303
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Jan 2023 21:24:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=nfnL2dQt;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673414667; i=@fujitsu.com;
	bh=ooBTOuhapJ1Txn0IZ/RwBblP7Sx/1Pmu5vJT47/tQZo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=nfnL2dQtuUaCJQjifShAfv9+vrLuKGbe+WmxEW8c7NypWPyUixkrlbpO8LHsinh5L
	 D3/7WmHyoiq7pBs4R7jTA69l+zx6iuVlOTqJnWxGu+veLozv7KMMU2GVsmTDyWgvy4
	 iZ9JNs4KGjAfrUPiRi2CDdvDYISdpoi2GUMh5lWM2IkUxfnMaTq6Cuxg1to0O9wCam
	 UjVEkU7p2e5sXoqOse4akRa6HoQIOhedRikvB5092HvTjnU+Z3wI91F2pbl5hO7Hs3
	 0FZ5INu5avNkbYgE7c92eNP2C3uVKF8Z4pcSjZp4k7MeLaotvHPqh/0t0kwLnQxgFQ
	 ak4uLtcmJ5aOA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRWlGSWpSXmKPExsViZ8MxSZfLY1+
  ywcW5YhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8ayzT3sBVu5K5b0zWBqYDzE1cXIxSEk8IRR
  YtP7I4wQzg0mia/TF7JAOHsZJRasmALkcHKwCUhJ3Lj/nw3EFhHQl1g6ew8ziM0soCLx4ncPO
  4gtLOAlMePDbUYQm0VAVWL97BawXl4BJ4l7ExaB1UsIKEhMefgezOYUcJZY07UezBYCqjmw6y
  IbRL2gxMmZT1gg5ktIHHzxAqpXUWL25WYWCLtSovXDLyhbTeLquU3MExgFZyFpn4WkfQEj0yp
  G8+LUorLUIl0jA72kosz0jJLcxMwcvcQq3US91FLdvPyikgxdQ73E8mK91OJiveLK3OScFL28
  1JJNjMAATilOStzB2Lfsj94hRkkOJiVR3jyJfclCfEn5KZUZicUZ8UWlOanFhxhlODiUJHhVX
  IFygkWp6akVaZk5wGiCSUtw8CiJ8NY6AqV5iwsSc4sz0yFSpxgVpcR5e9yAEgIgiYzSPLg2WA
  RfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMy+wMNIUnM68EbvoroMVMQIsPd+0FWVySiJC
  SamCyjO59e+2MsNPsYzqpWYfneflX/7p/af62NfLsC6PL589adYonIJt1mrzS1wsivUt2njiu
  1PWkTiLN0cP20r6dSfY2DNnfHlfyft9hwO8wo22Crdepmg/3A+9vaRWoXsEx8/7idpXLh/7MV
  Lqk8ESDbd1p0w1LFetPvyz4NnWZJYOWbopoYY6C/p/dVYEpr7o9vjbuDUrqUxeSz7mXn1Hwdl
  Lgqzmr6mP0jLXjev4IPvx8dI/BqgVH1rxWLDKr9bS9aPNYcbHLRIPATb3RO4SToir2nHDI/nW
  jo1c7SPHxjh0PhbfNeXH41+bL70+9unVnywqVicIHrF/ZXb+yxyQ3Kfx4rBzb6dPNu/YG6i9e
  rcRSnJFoqMVcVJwIAFymJNpbAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-728.messagelabs.com!1673414666!573025!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10843 invoked from network); 11 Jan 2023 05:24:26 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-4.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 11 Jan 2023 05:24:26 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id C3A251000DC
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 05:24:25 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id AA4DC1000C1
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 05:24:25 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 11 Jan 2023 05:24:24 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-networkx: upgrade 2.8.8 -> 3.0
Date: Wed, 11 Jan 2023 13:24:04 +0800
Message-ID: <1673414646-13721-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673414646-13721-1-git-send-email-wangmy@fujitsu.com>
References: <1673414646-13721-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 05:24:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100525

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://networkx.org/documentation/latest/release/release_3.0.html

License-Update: Copyright year updated to 2023

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-networkx_2.8.8.bb => python3-networkx_3.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-networkx_2.8.8.bb => python3-networkx_3.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-networkx_2.8.8.bb b/meta-python/recipes-devtools/python/python3-networkx_3.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-networkx_2.8.8.bb
rename to meta-python/recipes-devtools/python/python3-networkx_3.0.bb
index 92883f3198..c83771b1e6 100644
--- a/meta-python/recipes-devtools/python/python3-networkx_2.8.8.bb
+++ b/meta-python/recipes-devtools/python/python3-networkx_3.0.bb
@@ -1,9 +1,9 @@
 DESCRIPTION = "Python package for creating and manipulating graphs and networks"
 HOMEPAGE = "http://networkx.github.io/"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=44614b6df7cf3c19be69d0a945e29904"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4266362445d56549f7b8973d02e5f22a"
 
-SRC_URI[sha256sum] = "230d388117af870fce5647a3c52401fcf753e94720e6ea6b4197a5355648885e"
+SRC_URI[sha256sum] = "9a9992345353618ae98339c2b63d8201c381c2944f38a2ab49cb45a4c667e412"
 
 inherit pypi setuptools3
 
-- 
2.25.1


