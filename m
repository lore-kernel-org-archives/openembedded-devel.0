Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB291C4332F
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 06:12:42 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web11.6997.1670479956576988835
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Dec 2022 22:12:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=sR+V3B6o;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670479954; i=@fujitsu.com;
	bh=rmMf1OASHNPE1MxG14etS9lBjvCDzra13h4uP3JZ1kE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=sR+V3B6otGzzTKm9vfEA4olVfFVZrBo3FOmNqLqp2No7k5F9PimXv4WyLSUy2oc/7
	 6EPM66grlEzU+4ZWP8ROeAjWqA9pwxwKXS/ywstjvwhpYkDEWyZ+qwaQsblpHOiF5E
	 PxckKU/7B0A5Jj3IBipBt7OJBbCtAdRPGy/XkAzoHAr4IioRiY27qVaEMj6v5aA7bA
	 v7KizG6zHRcLBuH6XlkWfHd5JB2aiqF+HMaFIpH1c7noQQjhYYosp7uY7QzDPRoiDd
	 7MA0hVrdMniEYaXvrGKu2Vrtap9VgGd1xKTGt+p8cJ8+y+KIMsca5AgUC5DNyTSWeW
	 IOcEr94Oq5P6g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRWlGSWpSXmKPExsViZ8OxWTeoYWK
  ywYJdohYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8a7V59YCp5wVjy5e5ytgbGbs4uRk0NI4CGj
  xORpSl2MXED2ZSaJ3rsX2SGc3YwSm++/ZQKpYhOQkrhx/z8biC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1jAX6L5/29GEJsFKH66rQPM5hVwlPjbvR5sjoSAgsSUh++ZIeKCEidnPmGBmCMhcfDFC2
  aIGkWJ2ZebWSDsColZs9qgetUkrp7bxDyBkX8WkvZZSNoXMDKtYjQrTi0qSy3SNbTUSyrKTM8
  oyU3MzNFLrNJN1Est1S1PLS7RNdRLLC/WSy0u1iuuzE3OSdHLSy3ZxAgMxpRitus7GGcs+6N3
  iFGSg0lJlPdFdX+yEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQneC5UTk4UEi1LTUyvSMnOAkQGTl
  uDgURLh9a0FSvMWFyTmFmemQ6ROMepyzPzadoBZiCUvPy9VSpx3XR1QkQBIUUZpHtwIWJReYp
  SVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMWwcyhSczrwRu0yugI5iAjrj3vxfkiJJEhJRUAxO
  r3k+jWf7NC9c1af9rk5U17PkupbZBTHTxRIPy819ubpjAN215+9H5j22rkwWPXlJ+OGfNDLsH
  Gy0PNbuoSvE6m62e++J0UuWc8kivw0Zaxqm2W18Eb3Bd6uTjG6S5Oi43l8FrTwfbtbdzBB4aH
  qpxe1Nt7+Hlqs6tv8PJ7M/b3fyXMveZnU6drLjF1a5atpTR5sQzg6C/AoWJUT3flQvMuhMtNZ
  pttknkm7OqGT+cX9eofGz1ll2m1yOv9aT63kr4xbJIfufid1IhDfkvMrUXXPkRw2ng4rHamCd
  ZWHPHG0lh2RO/jzg5zkk9xb8ot+3/N8P8vVV71kx89v+llBqfqUiGCAenaG38lbDFSizFGYmG
  WsxFxYkAdYFAd00DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-585.messagelabs.com!1670479954!30713!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15154 invoked from network); 8 Dec 2022 06:12:34 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-16.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Dec 2022 06:12:34 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 031B3154
	for <openembedded-devel@lists.openembedded.org>; Thu,  8 Dec 2022 06:12:34 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id EB4017B
	for <openembedded-devel@lists.openembedded.org>; Thu,  8 Dec 2022 06:12:33 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 8 Dec 2022 06:12:32 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-protobuf: upgrade 4.21.9 -> 4.21.10
Date: Thu, 8 Dec 2022 14:12:03 +0800
Message-ID: <1670479927-1286-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Dec 2022 06:12:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99986

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-protobuf_4.21.9.bb => python3-protobuf_4.21.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_4.21.9.bb => python3-protobuf_4.21.10.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_4.21.9.bb b/meta-python/recipes-devtools/python/python3-protobuf_4.21.10.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-protobuf_4.21.9.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_4.21.10.bb
index 7970d0b90..0ddd49cfe 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_4.21.9.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_4.21.10.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=53dbfa56f61b90215a
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "61f21493d96d2a77f9ca84fefa105872550ab5ef71d21c458eb80edcf4885a99"
+SRC_URI[sha256sum] = "4d97c16c0d11155b3714a29245461f0eb60cace294455077f3a3b8a629afa383"
 
 # http://errors.yoctoproject.org/Errors/Details/184715/
 # Can't find required file: ../src/google/protobuf/descriptor.proto
-- 
2.25.1


