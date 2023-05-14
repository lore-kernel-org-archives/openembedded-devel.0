Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8E12C7EE24
	for <webhook@archiver.kernel.org>; Sun, 14 May 2023 13:07:15 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web10.66585.1684069635260432876
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 May 2023 06:07:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=eR30jcv8;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1684069633; i=@fujitsu.com;
	bh=9Vnr2NyUD2eyOhUIONuV39yj6zsSbHgNHlzmTjFn5Kw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=eR30jcv8FbBc5iE7m6i854imj0dng/sQCRLZI+/fukF83cK07sgM71m0aCbYT69Lt
	 yVuQ4rFDLdm+uvJkLIUfQFqHBCsKW+81isxe91gpXFEoqkgRKZHsMeSRfSNYKPLdLT
	 m7Ey1Pd6eeCPAC7yRZI96XrU2dzJkcGVxixyXTI3aeKkgxR0kvw6o853R9fzKZ/RMp
	 fdusvgZnsXzWV4VLqpmJ9InxERDP+WDbtNJOEmjoJkxUebwknGRTqTidz5L2dIw9bZ
	 YlDUaMPpyXY6qX1tegTSQhmFiLOAa4buFL0DzNFgdTZYNqYK07Pe4nwoWYDgNFzM12
	 wuE3gkzKV5Qlw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrILMWRWlGSWpSXmKPExsViZ8ORpMtwNyH
  FYMUOPYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWP25y72gm2cFUcf3WJqYLzL0cXIxSEksJFR
  YufMS8wQzjQmiUtTt7J1MXJysAlISEzfe5IdxBYR0JX4+GEuI4jNLKAiMWPyESYQW1jAV+LO5
  xPMIDaLgKrEqiWtYPW8Ak4SzVvXg9kSAgoSUx6+B6vhFHCWuHOrE8wWAqq5vfwbM0SNmsTVc5
  uYJzDyLGBkWMVoWpxaVJZapGuql1SUmZ5RkpuYmaOXWKWbqJdaqlueWlyia6iXWF6sl1pcrFd
  cmZuck6KXl1qyiREYEinFTAw7GB/t/Kt3iFGSg0lJlPdaSVyKEF9SfkplRmJxRnxRaU5q8SFG
  GQ4OJQlenZsJKUKCRanpqRVpmTnA8IRJS3DwKInwxl0FSvMWFyTmFmemQ6ROMSpKifMeAOkTA
  ElklObBtcFi4hKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYV6eG0BTeDLzSuCmvwJazAS0+N
  aeeJDFJYkIKakGpqaFDS8Tzle+k56588PcRU7J8t4PX4dMZpk/+Z7Jhtv7XeOCn6ear8jPmJO
  8Ucq68MoOuWa9K453vq8IVX3x5KLHc8EHHF/EWVdd9lFIOv7H9M6Clws2rv2lcnbC7+DJa44I
  brT8PWO91VbGDDfL7o77P9vSZn6pD761rPT2de91xxdm1bTVqnE9vXXh9R2PgA27w82sVNau8
  LZlPRPyMODashUckv+4Va98/r79kOM14fKtdpx232pan/04Zt0s51ofGfPw+ZE/gtM9rC33P8
  qUen/9TO7sQl+hE7wn7nW8/M/jH3dhC9N3D+8a7t9tV482nm5ZX8R29+8tSYkZPmc3zZ/ENaN
  //d5HFyavWCx2UYmlOCPRUIu5qDgRAFJ9tooEAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-591.messagelabs.com!1684069632!236719!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3139 invoked from network); 14 May 2023 13:07:12 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-5.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 May 2023 13:07:12 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 652E21AE;
	Sun, 14 May 2023 14:07:12 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 8B7781AC;
	Sun, 14 May 2023 14:07:11 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-typeguard: upgrade 3.0.2 -> 4.0.0
Date: Sun, 14 May 2023 21:06:55 +0800
Message-Id: <1684069617-12375-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1684069617-12375-1-git-send-email-wangmy@fujitsu.com>
References: <1684069617-12375-1-git-send-email-wangmy@fujitsu.com>
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 May 2023 13:07:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102583

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-typeguard_3.0.2.bb => python3-typeguard_4.0.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typeguard_3.0.2.bb => python3-typeguard_4.0.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-typeguard_3.0.2.bb b/meta-python/recipes-devtools/python/python3-typeguard_4.0.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-typeguard_3.0.2.bb
rename to meta-python/recipes-devtools/python/python3-typeguard_4.0.0.bb
index 1661e71239..54ba6120a8 100644
--- a/meta-python/recipes-devtools/python/python3-typeguard_3.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-typeguard_4.0.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/typeguard/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f0e423eea5c91e7aa21bdb70184b3e53"
 
-SRC_URI[sha256sum] = "fee5297fdb28f8e9efcb8142b5ee219e02375509cd77ea9d270b5af826358d5a"
+SRC_URI[sha256sum] = "194fb3dbcb06ea9caf7088f3befee014de57961689f9c859ac5239b1ef61d987"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.34.1


