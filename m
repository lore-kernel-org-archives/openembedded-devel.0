Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3204C64EC4
	for <webhook@archiver.kernel.org>; Sat,  4 Mar 2023 11:07:04 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web11.6886.1677928022321525242
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Mar 2023 03:07:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=RnAun7Cd;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677928020; i=@fujitsu.com;
	bh=AK7l5+ygdnvfAiS/O1eRA8GnchIXL86uk4jIJyj7/jg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=RnAun7CdED21kdgPnU/cF9nrdijTd/Ds63D5u+0Wj00a/c9KE2jGnBh9S1dRPyCY0
	 RbSjdWNjUAeOqUhFr0GIwi3AmImaKjZS6YHKFdj5l0/CpFYEFwOSGFbo+DQGGiYi3R
	 u+od7YbY6VQYJprMZtZWzRty66n2IMKV8XZMBIXYE/lvg2Cf4mVftKRu1r3lsmyDsU
	 5zd2jXkDaARceNJoJ6uzAdJxzsOLdKcSjIaGmPTHmaEtQbIM+Oitj4r/W3YscjJpeJ
	 d60vyqmWaDH8j6bwchBGetLT+RPEk6GCbK7tdGGoS8cLwDKLhivZg/E25iAzTNYvXy
	 mANR6AepGjgTw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8MxSTdEjTn
  FYF8rh8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrG7XaBgOVfFi/9n2BoYd3N2MXJxCAk8YZSY
  d30bE4Rzg0li5+NZjF2MnEDOHkaJC1fiQGw2ASmJG/f/s4HYIgL6Ektn72EGsZkFVCRe/O5hB
  7GFBXwl3nzbCxZnAYrPWv+QCcTmFXCS6Jq3hAXElhBQkJjy8D1YDaeAs0TTv0/MELucJG68b2
  eBqBeUODnzCQvEfAmJgy9eMEP0KkrMvtwMNadSovXDLyhbTeLquU3MExgFZyFpn4WkfQEj0yp
  G0+LUorLUIl1TvaSizPSMktzEzBy9xCrdRL3UUt3y1OISXUO9xPJivdTiYr3iytzknBS9vNSS
  TYzAwE0pZjHbwdje91fvEKMkB5OSKO8kVoYUIb6k/JTKjMTijPii0pzU4kOMMhwcShK8MqrMK
  UKCRanpqRVpmTnAKIJJS3DwKInwbhEBSvMWFyTmFmemQ6ROMSpKifMKKAMlBEASGaV5cG2wyL
  3EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZh3iwrQFJ7MvBK46a+AFjMBLdY4zQCyuCQRISX
  VwFSasebBm/eskc0S96Y+lPVy4uyXlbdj3rriGs+f2SXpBU1zUrakbv/vtXXa7nDrWdMWtVev
  ctW+6z6vTKv1YNB1KWbjGrugjqTEZ9vOTWyeeC1fLvfi+6cW3uu31qVEeDE9NbATWvl+wrRgW
  b0LC+o75dZ9tz5rkuIV+bz077TuKR4q1Wm3GtfMeComLsMQ8Jhzx3wd//ovy/rkVKYtWte5Mb
  t9UkKKtGdZRmqR6F4jw70KgeLXvKXV5vvWSbaWbokzb53OoRCex5sRvM3nVujmlr+Ti2POnV9
  5p+TPSaXMyshssb+r5mXOzH1+6K1dgJNW4K47e0X1D0T49Mfkdis9V/q6WKgxh/Pf3yM6SizF
  GYmGWsxFxYkA+N2p5lcDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-585.messagelabs.com!1677928019!150301!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5372 invoked from network); 4 Mar 2023 11:07:00 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-15.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Mar 2023 11:07:00 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id BB1FE1000FB
	for <openembedded-devel@lists.openembedded.org>; Sat,  4 Mar 2023 11:06:59 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id AEFCB1000F5
	for <openembedded-devel@lists.openembedded.org>; Sat,  4 Mar 2023 11:06:59 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 4 Mar 2023 11:06:58 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-haversine: upgrade 2.7.0 -> 2.8.0
Date: Sat, 4 Mar 2023 19:06:43 +0800
Message-ID: <1677928005-22986-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1677928005-22986-1-git-send-email-wangmy@fujitsu.com>
References: <1677928005-22986-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Mar 2023 11:07:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101368

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Performance improvements, especially with the haversine_vector function #65 by jobh

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-haversine_2.7.0.bb => python3-haversine_2.8.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-haversine_2.7.0.bb => python3-haversine_2.8.0.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-haversine_2.7.0.bb b/meta-python/recipes-devtools/python/python3-haversine_2.8.0.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-haversine_2.7.0.bb
rename to meta-python/recipes-devtools/python/python3-haversine_2.8.0.bb
index bfe36b0b8..0c7b414d9 100644
--- a/meta-python/recipes-devtools/python/python3-haversine_2.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-haversine_2.8.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Calculate the distance between 2 points on Earth"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
-SRC_URI[sha256sum] = "9dd62c95bff9c43eb898604625e80db68b8b9e91a5111338f55ebcf470dd5a3d"
+SRC_URI[sha256sum] = "cca39afd2ae5f1e6ed9231b332395bb8afb2e0a64edf70c238c176492e60c150"
 
 inherit pypi setuptools3
 
-- 
2.34.1


