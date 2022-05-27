Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADB75C43217
	for <webhook@archiver.kernel.org>; Fri, 27 May 2022 01:16:15 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.2556.1653614169285348001
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 May 2022 18:16:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=FqXjI12S;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653614167; i=@fujitsu.com;
	bh=Il/30Mwxa7ItC0/iHVCDCwLzYAK0Ys65Nz8d6/hGELk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=FqXjI12SiXWY/tfEjjbXijsBNOWqux3AxH9873e3aqfeMiujR/udIchM/JlvITkmv
	 L/OrzJ9Vvxgh0gTuaWj9E7Und3RWi6ILNH4TS9PloNqsH9EE0DH3TCGrivHznUUJ+Y
	 iA/1eK43LK2LgDYSbke3FHA1WgCHpsCuIuvrQtvvwUqbgNuaP1ZfWMAdHDGvBezjAp
	 1suZ1J9jLEozLrkM8aovHnsEba0fPR8huLyKPX6pQNS+pu/azdV1v5nRTrcIuYbrJN
	 cOTd9EseemmU1ZhX4Osvpdc5ABaCxd9BcT5fOEP8FrwL9cWaTaFTIuuj63l+YHFA8u
	 SJecwobZbEq2Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8ORqBumNiH
  JoO+JpsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmtE61a9gF2fFzPnSDYyPOboYuTiEBJ4wSsy5
  /4YdwrnAJLG3qZsFwjnJKDHrwDXGLkZODjYBdYnHN1+D2SIC+hJLZ+9hBrGZBVQlui+uYQexh
  QUCJI4cOABmswDFbx79BVbDK+Au8evtLxYQW0JAQWLKw/dgcU4BD4kzd66AzRQCqllzZhILRL
  2gxMmZT1gg5ktIHHzxghmiV0nixIqPTBB2hcTrw5eg4moSV89tYp7AKDgLSfssJO0LGJlWMVo
  nFWWmZ5TkJmbm6BoaGOgaGprqGlsAKUO9xCrdRL3UUt3y1OISXSO9xPJivdTiYr3iytzknBS9
  vNSSTYzAIE4pVsvfwfh35U+9Q4ySHExKoryZ9/qThPiS8lMqMxKLM+KLSnNSiw8xynBwKEnwz
  lKakCQkWJSanlqRlpkDjCiYtAQHj5IIr5IMUJq3uCAxtzgzHSJ1ilFRSpz3iQpQQgAkkVGaB9
  cGi+JLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5e5WBpvBk5pXATX8FtJgJaHE+by/I4pJ
  EhJRUA9MSp/cWVw3UTaY5Hy78ziHWpLBxgc4j/7Bzr1RfnH8iWP73l27vZt9Jp0TVfv3+EKEh
  sWiZLpNPmrwUK7t9n25mxNauUgtJg47U6KunJydad7ttZzd7XP8wreHAw4CSg5V/ay8tcv7yq
  0Ssm2fJ248+0+z5z55rjLW5kXjM/NX55KKtPAXTvGeZbp+l+nG1qrVFnPm0lep3qnlyvev6rA
  TYtZyn6vJsl5Q2m9K4bOa7eB55be1X6cujdmQ8ETE+rHpIIkn2o/b7iIX5M8IYe04vWbLmnIC
  /HOebEOW7+Y92pS/UsfpYa6CyaUvJ85t2bVFlGtmBp4UK6us+6V7Zub7VlGlH9eLde4tjN5Qu
  UWIpzkg01GIuKk4EAAQaVz9dAwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-2.tower-565.messagelabs.com!1653614166!163100!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4600 invoked from network); 27 May 2022 01:16:06 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-2.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 May 2022 01:16:06 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 4F94D10004E
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 May 2022 02:16:06 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 2C668100192
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 May 2022 02:16:06 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 27 May 2022 02:15:53 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-asyncinotify: upgrade 2.0.2 ->
 2.0.3
Date: Fri, 27 May 2022 09:15:30 +0800
Message-ID: <1653614132-27735-4-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1653614132-27735-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1653614132-27735-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 May 2022 01:16:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97286

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...hon3-asyncinotify_2.0.2.bb => python3-asyncinotify_2.0.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-asyncinotify_2.0.2.bb => python3-asyncinotify_2.0.3.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-asyncinotify_2.0.2.bb b/meta-python/recipes-devtools/python/python3-asyncinotify_2.0.3.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-asyncinotify_2.0.2.bb
rename to meta-python/recipes-devtools/python/python3-asyncinotify_2.0.3.bb
index 2bf919248..189547bae 100644
--- a/meta-python/recipes-devtools/python/python3-asyncinotify_2.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-asyncinotify_2.0.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://gitlab.com/Taywee/asyncinotify"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6ec941a1cd6616454970d03cb9c9e8f8"
 
-SRC_URI[sha256sum] = "867cc056d88fc07aa8b3d1dc5b9c3c911cdd6130a4df5f67beb1fdecfd37b164"
+SRC_URI[sha256sum] = "a14baf680a3d3e1cf54e082ab56f56c475d59d3644cfc25c00c460e56d9bbdf7"
 
 inherit pypi setuptools3
 
-- 
2.25.1


