Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEA5CC6FD1D
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 04:22:57 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web10.65334.1679545368245347278
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Mar 2023 21:22:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ht1aQwBc;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679545366; i=@fujitsu.com;
	bh=a9VVoa1OgOmFaeyX5MwYK/BcIm+zqVDeKQDCvFKzgD4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ht1aQwBcFO/HZCqOnCanwYB/Ib1rrHPEWzYbjrzsm2QF6v7tN98B5cDbj9bSuJOdf
	 oPzEcEP84VyNaxJ5JcbYpe1xS7mNdPdz0b+Hnn65ZK1yTg7kEszkb/ITealwdrlIg1
	 CvtvPtdveW+YdhDChIPizFZwW8yzpW4ooEvRBJXYrTh7pIPjbzsixGUPSTWvT38owy
	 jGiERZ15fbywrI8+MjUBHfne9BbRNWbpUHDjmObYVPDT9y2jxLDG20YlkDshCrDBdF
	 L5ftzbWqw/aJqgDQmUp6nzUDpBPuHlJtB+5+a139fFHt7EzpK6f4K4LcW2nHPYZSdy
	 rVokHq2symCAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8ORqCt6RTr
  FYMspWYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPF69MsBU+5K6Zc3MDYwLiTq4uRk0NI4Amj
  xI6TFl2MXED2dSaJxnNzWSGcPYwSizbOYQWpYhOQkrhx/z8biC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1jAR+LCFIg4i4CqxJJVXxlBbF4BJ4kHMxaA1UgIKEhMefieGSIuKHFy5hMWiDkSEgdfvG
  CGqFGUmH25mQXCrpBonH6ICcJWk7h6bhPzBEb+WUjaZyFpX8DItIrRtDi1qCy1SNdML6koMz2
  jJDcxM0cvsUo3US+1VLc8tbhE11AvsbxYL7W4WK+4Mjc5J0UvL7VkEyMwFFOKGW7sYJzT91fv
  EKMkB5OSKK9EqHSKEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQlenYtAOcGi1PTUirTMHGBcwKQlO
  HiURHjnHgRK8xYXJOYWZ6ZDpE4xKkqJ856+BJQQAElklObBtcFi8RKjrJQwLyMDA4MQT0FqUW
  5mCar8K0ZxDkYlYd4Z54Gm8GTmlcBNfwW0mAlocdwMCZDFJYkIKakGpu2vjM57mcruLWr+vuG
  32IuQlJrCbc/2m8tWxM5q+hU1z8i24cz/hZs2OzLLJc4tZ/Z9+Myq0CNTMNyw+OS/mbWHZDQF
  Fdhe3t3R5eNZZhn0el6XqrHZa27Bvzwzo1Qt33zT6NBwvimn9NTsZuuZVV7lptt9j/jNfCgfV
  sV3P+9gtVGmB/vlQw3Z4vOs/lWrHHSv+d4aHn81IOAAj9aeuWb917smRrF8ytvyovlz6vuncc
  paNg/m8ydFd51rWKv3f8KOPq2DbgsTGP491gm5ZZV2V2mRpZv+up2leiGCFxKqBeIn16wQDtu
  cG/Mp8+2E4z/XbthQk9LC+sBZJlH9kJJ86yFuzWTrV6fm7byuxFKckWioxVxUnAgALk2MN0AD
  AAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-585.messagelabs.com!1679545365!169635!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5879 invoked from network); 23 Mar 2023 04:22:45 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-7.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 23 Mar 2023 04:22:45 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 044F610019E
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 04:22:45 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id EC9E210019C
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 04:22:44 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 23 Mar 2023 04:22:43 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-engineio: upgrade 4.3.4 -> 4.4.0
Date: Thu, 23 Mar 2023 12:22:31 +0800
Message-ID: <1679545351-20075-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 04:22:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101651

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
    Allow configuring underlying websocket connection with custom options
    Cancel all running tasks in async SIGINT handler
    Handle unexpected WebSocket close frames sent by server
    Close aiohttp session after a failed connection
    Catch IOErrors from uWSGI and explicitly close the driver
    Recommend ASGI integration for Sanic in Documentation
    Fix documentation for max_http_buffer_size
    Add Python 3.11 to builds

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-engineio_4.3.4.bb => python3-engineio_4.4.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-engineio_4.3.4.bb => python3-engineio_4.4.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-engineio_4.3.4.bb b/meta-python/recipes-devtools/python/python3-engineio_4.4.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-engineio_4.3.4.bb
rename to meta-python/recipes-devtools/python/python3-engineio_4.4.0.bb
index d89a54dc3..03a7d480d 100644
--- a/meta-python/recipes-devtools/python/python3-engineio_4.3.4.bb
+++ b/meta-python/recipes-devtools/python/python3-engineio_4.4.0.bb
@@ -17,4 +17,4 @@ RDEPENDS:${PN} += " \
 	python3-asyncio \
 "
 
-SRC_URI[sha256sum] = "d8d8b072799c36cadcdcc2b40d2a560ce09797ab3d2d596b2ad519a5e4df19ae"
+SRC_URI[sha256sum] = "bcc035c70ecc30acc3cfd49ef19aca6c51fa6caaadd0fa58c2d7480f50d04cf2"
-- 
2.34.1


