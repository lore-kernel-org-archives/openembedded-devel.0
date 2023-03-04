Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD8A5C64EC4
	for <webhook@archiver.kernel.org>; Sat,  4 Mar 2023 11:10:54 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.7011.1677928244683125245
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Mar 2023 03:10:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=b5f2mpJ2;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677928243; i=@fujitsu.com;
	bh=E4zBjrKyWVtSIM1Giyb1e01PM0w08PcT6VBvodnuBqE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=b5f2mpJ29vcLuxHA6ooLF3h/hbAfriasDRDx59TwxBt+n+G58DnA8b3EIMZNxfrjE
	 Z0hvHmi5Usj+SlsytRXgCtyhfCV6GDFqkZRtDQmR9H0epsIQ/ijHsP7WzcMkrYfzSJ
	 iaM6NBJMGUl5RI22sYeFmZfIxmpKm1Z/VS1AYndf9OW0AhQD7VyUKp3vRA3+PMn51v
	 ilpYAo8hmMMJBlb48etsgRMvaY23/4RgDnMRlNxXau9hNaXLVwrk2Q1KcZ9gf+hYd8
	 +tJTvAziEhPfenxUJYIyNQdOyXOZV2jcsXyt1ip+IKYnFGjlLS0LXYyB6Do7Q4z+w4
	 03ZxyJtYF+IlA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMIsWRWlGSWpSXmKPExsViZ8OxWddInTn
  FYPkFJYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP+9c9sBTc5KxasOMzSwPiZo4uRi0NI4CGj
  xK7jS5i7GDmBnCtMEi1fTSDsPYwS57bkgNhsAlISN+7/ZwOxRQT0JZbO3gNWzyygIvHidw87i
  C0s4C1xe+ZlJhCbBSg+a8YmoDgHB6+Ak8TEFeIgYQkBBYkpD9+DtXIKOEucPXqCFWKVk8ScZd
  dYQGxeAUGJkzOfsECMl5A4+OIFM0SvosTsy80sEHalROuHX1C2msTVc5uYJzAKzkLSPgtJ+wJ
  GplWMpsWpRWWpRbomeklFmekZJbmJmTl6iVW6iXqppbrlqcUlukZ6ieXFeqnFxXrFlbnJOSl6
  eaklmxiBYZtSrHhsB+O/3r96hxglOZiURHknsTKkCPEl5adUZiQWZ8QXleakFh9ilOHgUJLgl
  VFlThESLEpNT61Iy8wBxhBMWoKDR0mEd4sIUJq3uCAxtzgzHSJ1ilFRSpxXQBkoIQCSyCjNg2
  uDxe0lRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8W1SApvBk5pXATX8FtJgJaLHGaQaQxSW
  JCCmpBqbwb767Updf3qEa/+ex7SOxmypvyia8XsfVP+/0aU11wc2TfoVmiUgs9c9t5crMOhRX
  bWT78B9jwU2dE88eBCStO3t19qzINceONbZNnHLa6x3Px3Vvlk2QP7rXhmf+sdLzPFYtYVFca
  2/v0RGQ2yHN5l6jbp6uGpNu+H9p7+tL06d8mv+h6+OGaxy/ndQ2NhaIzombf89B2ffHVeeGRW
  H/clbtZcvdUD7xzaL8jiOzLrzQ4Nit9WUqW9t/w+vTD85k+ie//KX/zmXf55oftRKatas7Sk1
  i8R6ea3Pem7Qwip3M8rCftG1V25s/yl7CJx4YaxR7Jpo8V1dk/vH/XfrPST0n5Qprj89dY2az
  4R+LrxJLcUaioRZzUXEiAPS1wClWAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-571.messagelabs.com!1677928242!149380!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29686 invoked from network); 4 Mar 2023 11:10:42 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-15.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Mar 2023 11:10:42 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 48B36142
	for <openembedded-devel@lists.openembedded.org>; Sat,  4 Mar 2023 11:10:42 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 3D2C17B
	for <openembedded-devel@lists.openembedded.org>; Sat,  4 Mar 2023 11:10:42 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 4 Mar 2023 11:10:40 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pydicti: upgrade 1.2.0 -> 1.2.1
Date: Sat, 4 Mar 2023 19:10:22 +0800
Message-ID: <1677928222-23049-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1677928222-23049-1-git-send-email-wangmy@fujitsu.com>
References: <1677928222-23049-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Mar 2023 11:10:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101375

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
fix incorrect behaviour of __or__ and __ior__, see #8

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pydicti_1.2.0.bb => python3-pydicti_1.2.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pydicti_1.2.0.bb => python3-pydicti_1.2.1.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-pydicti_1.2.0.bb b/meta-python/recipes-devtools/python/python3-pydicti_1.2.1.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-pydicti_1.2.0.bb
rename to meta-python/recipes-devtools/python/python3-pydicti_1.2.1.bb
index 18d3a0aa6..2363c2905 100644
--- a/meta-python/recipes-devtools/python/python3-pydicti_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pydicti_1.2.1.bb
@@ -3,6 +3,6 @@ HOMEPAGE = "https://github.com/coldfix/pydicti"
 LICENSE = "WTFPL"
 LIC_FILES_CHKSUM = "file://COPYING;md5=389a9e29629d1f05e115f8f05c283df5"
 
-SRC_URI[sha256sum] = "32d59407b3229b22702910bd10f53d46c330481b5aea7cce076630d661be9d1e"
+SRC_URI[sha256sum] = "63e0756ff27a335e92916ff40be589a21a58894b3a93099edf0f3cbf695690dc"
 
 inherit pypi setuptools3
-- 
2.34.1


