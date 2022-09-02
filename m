Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D89A4C6FA83
	for <webhook@archiver.kernel.org>; Fri,  2 Sep 2022 01:35:46 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web09.1591.1662082539781742871
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Sep 2022 18:35:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=mjhT03TP;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1662082538; i=@fujitsu.com;
	bh=NzvRQyRrrnnH89IbHVxSB11jlFHb2Pt3x6Ry/fnwK+U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=mjhT03TPxDujHR5CpIZzGoOnJEt7kwFfOicBrpWh6viueVU09cvqV66fD7b3LAXrO
	 bjlDrqfC/KNhoNIW0nhfOKSY/HmvlFTRdGDlnJb90/rqhNuHQDiJpbdfvfYio+b7Fs
	 4jq266MHpsDboVONR08As53lcz6t1o1mWEIUWSP9K3prg6Y3N97wrSfJmv7HzOTJwB
	 +3EbibMnVbq07yGLz5N/56/bq5BrYx+R4eFKM+8YGU42OVlZ16xc9o7q09WHBEYnc8
	 SqXbd22BxBfaky0ClMZ0WN7aIQJLCXJjhbJkJkT8JF57/d3sbbX8k78t9sIQFBJzPo
	 MQji0GZJGPX4A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8MxSfdlrGC
  ywa6T/BYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8avOZeZCz5yVvyfuoSlgXEWZxcjF4eQwBNG
  iTcvJjBCONeZJD5NmgzlnGCUmNN0i7mLkZODTUBd4vHN14wgtoiAvsTS2XvA4swCqhLdF9ewg
  9jCAiESE59tB4pzcLAIqEi0vc4EMXkF3CWWXgsAqZAQUJCY8vA9WCengIfEpBX32UBKhIBKtr
  z3BAnzCghKnJz5hAViuITEwRcvmCFalSROrPjIBGFXSDROPwRlq0lcPbeJeQKj4Cwk7bOQtC9
  gZFrFaJNUlJmeUZKbmJmja2hgoGtoaKpraQmkLPUSq3QT9VJLdfPyi0oydA31EsuL9VKLi/WK
  K3OTc1L08lJLNjECgzilOLl8B+P2fb/0DjFKcjApifIy/RFIFuJLyk+pzEgszogvKs1JLT7EK
  MPBoSTBqxUjmCwkWJSanlqRlpkDjCiYtAQHj5II799woDRvcUFibnFmOkTqFKMux8yvbQeYhV
  jy8vNSpcR5Y6OAigRAijJK8+BGwKL7EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVhXv8IoCk
  8mXklcJteAR3BBHTE9Jn8IEeUJCKkpBqYDK8vcOCZsOreLLbzYsfX9L62vZd8+bsko2X9jzMJ
  fy8VeT7jcJR5HeB5w6m7U8/G/eNibUPtKSJzlmZ7lS84E1V+/biOwB2tXE/R60dTJk36u7Hgb
  kMUxwyWrV6fjq2W5rGu3X3n9u/y2C1PeLhiLr98EHjZ+nClbr9Bid6W1OkRR73c6j40NHH3aL
  dorz7iJpETM/9iyK0tDn6PuVedmBjWu1oj7dDqp5+V5nq+uSe2cNbLOpuXIlbKb5U+Hbx8ZNG
  MTfnfGNi/+z6ZpmkvbNrqH9tRNlmBqfwM1yfTeSdvGF03sXh+Ofj5UwbmNoNLnwL+RvHfu70g
  PvP65R6PqzMZr9XvVJveYPWKc9mjciWW4oxEQy3mouJEACuJP2dpAwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-7.tower-732.messagelabs.com!1662082536!485944!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2810 invoked from network); 2 Sep 2022 01:35:37 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-7.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 2 Sep 2022 01:35:37 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id A7AB31000CD
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  2 Sep 2022 02:35:36 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 9A6321000CC
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  2 Sep 2022 02:35:36 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 2 Sep 2022 02:35:34 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-websocket-client: upgrade 1.3.3 ->
 1.4.0
Date: Fri, 2 Sep 2022 09:36:40 +0800
Message-ID: <1662082601-12677-4-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1662082601-12677-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1662082601-12677-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Sep 2022 01:35:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98592

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...socket-client_1.3.3.bb => python3-websocket-client_1.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-websocket-client_1.3.3.bb => python3-websocket-client_1.4.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-websocket-client_1.3.3.bb b/meta-python/recipes-devtools/python/python3-websocket-client_1.4.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-websocket-client_1.3.3.bb
rename to meta-python/recipes-devtools/python/python3-websocket-client_1.4.0.bb
index 9c3ff02e9f..ad43fab24d 100644
--- a/meta-python/recipes-devtools/python/python3-websocket-client_1.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-websocket-client_1.4.0.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/websocket-client/websocket-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b969e9612325987c823fc0737063ebc8"
 
-SRC_URI[sha256sum] = "d58c5f284d6a9bf8379dab423259fe8f85b70d5fa5d2916d5791a84594b122b1"
+SRC_URI[sha256sum] = "79d730c9776f4f112f33b10b78c8d209f23b5806d9a783e296b3813fc5add2f1"
 
 inherit pypi setuptools3
 
-- 
2.25.1


