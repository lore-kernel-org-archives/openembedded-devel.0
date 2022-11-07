Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0371C4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 08:42:20 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web08.1216.1667810532672620227
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Nov 2022 00:42:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=rbqaz/jA;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667810530; i=@fujitsu.com;
	bh=GvH1UHIv/N0odeA4qfLEs3evYYMkraW/8xV4AhDdcu0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=rbqaz/jAz5vJ9q1DUwtex7v7OwxzgZdndohfO2Bh/NotBB9iHDxUQ29iS+5Nd2AbR
	 nxMZykImE0yCqVeLMmYD6t7+aGyyYYX7KRaadACakGF3aNYv1WLGNFKlSqp09IFF6A
	 GK0zRUGpdKeXVESuq76NqgRq7R3tsnQDcne9jensgQRUIsT6MoBlbvMyR+PrFDxm0x
	 NwpaGIdKo0ApNx/jfGYsGGjPM3H64s0Z7aQntqXnckyfcY5dRaPYyPcE3Sb88L9CCH
	 tNEi88JWmcykgzz9z/usKY+vwU8NOKWe5b8xE/MHjf9/ELYld1POdDzANLbdSsP+tz
	 fmMq6jdC+xBiQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRWlGSWpSXmKPExsViZ8OxWffRkYx
  kg9ctvBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bP7gtsBU84K76v+83UwNjG2cXIxSEk8JBR
  4tzL/UwQzmUmibYXZ6Cc3YwS3TeusncxcnKwCUhJ3Lj/nw3EFhHQl1g6ew8ziM0soCLx4ncPU
  A0Hh7BAgETvY0kQkwUoPPM3J0gFr4CTxPcnL8CqJQQUJKY8fM8MEReUODnzCQvEFAmJgy9gah
  QlZl9uZoGwKyRmzWpjgrDVJK6e28Q8gZF/FpL2WUjaFzAyrWI0L04tKkst0jU00EsqykzPKMl
  NzMzRS6zSTdRLLdXNyy8qydA11EssL9ZLLS7WK67MTc5J0ctLLdnECAzGlOKUizsYnyz7o3eI
  UZKDSUmU9/fyjGQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKErw3NgLlBItS01Mr0jJzgJEBk5bg4
  FES4TUBRocQb3FBYm5xZjpE6hSjLsfMr20HmIVY8vLzUqXEea/tBioSACnKKM2DGwGL0kuMsl
  LCvIwMDAxCPAWpRbmZJajyrxjFORiVhHmtQVbxZOaVwG16BXQEE9AR1QVpIEeUJCKkpBqYAmY
  pfy65zHfBVbvJ4+gqWQY7d7cwCf0bMgcyo6O4j82JFfe/8KTVdHXMFF0dPuclM0M5Q27P/qJz
  aMfz87qxc1RX79+wxG2V6Gw/3md3jkopFmyWOtBs/JP3Rc0eb0ftCYpdv//1uM28f1n/5j1fz
  QXuE3vKBP/VtX9a7iK46IpOsIKu5L38WAUFyYTnMzk7WhN17AXETqt1H5w0I3nHZka/sMPBAl
  87a6Y1irVdDDny0i1J8f3ct+3319fxC4nfUbY3PVB28ETdw/DyeS0nvsmfLQ60uHi+7PvkC9M
  ift6Wnp9wbcMtY8srf2YbsqpliibocBeERl5uUL+Qw7jU7I9Y8ZT7pc5t27ZfWaegxFKckWio
  xVxUnAgAY/KfRE0DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-732.messagelabs.com!1667810529!245745!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18561 invoked from network); 7 Nov 2022 08:42:10 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-8.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 7 Nov 2022 08:42:10 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id ACD21142
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 08:42:09 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id A047873
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 08:42:09 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 7 Nov 2022 08:42:08 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-robotframework: upgrade 6.0 -> 6.0.1
Date: Mon, 7 Nov 2022 16:41:51 +0800
Message-ID: <1667810514-31107-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Nov 2022 08:42:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99467

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://github.com/robotframework/robotframework/blob/master/doc/releasenotes/rf-6.0.1.rst

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-robotframework_6.0.bb => python3-robotframework_6.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-robotframework_6.0.bb => python3-robotframework_6.0.1.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-robotframework_6.0.bb b/meta-python/recipes-devtools/python/python3-robotframework_6.0.1.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-robotframework_6.0.bb
rename to meta-python/recipes-devtools/python/python3-robotframework_6.0.1.bb
index c638ef65f..5f58a2ae5 100644
--- a/meta-python/recipes-devtools/python/python3-robotframework_6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-robotframework_6.0.1.bb
@@ -13,7 +13,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE_EXT = "zip"
 
-SRC_URI[sha256sum] = "db9498dad21369a6702384db057994628cd2cf0a172f5685be941c4bf94e242f"
+SRC_URI[sha256sum] = "b2d9a82912dfd27aae7afaad64771c58f5d948ca9d64e3ae72b16721b5e022ea"
 
 RDEPENDS:${PN} += " \
     ${PYTHON_PN}-shell \
-- 
2.25.1


